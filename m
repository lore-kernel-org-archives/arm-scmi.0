Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A9B7125228D;
	Sat, 27 Dec 2025 16:51:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766854293; cv=none; b=dT9F0R9G4/LSZrhonWrT7LfyDPxujpvH9miGAE35GF3rZEoFTbMKIIrlfwuwHpjhemmsM++QDmRZO67oCIEYF2taFkL4wPuZegplfpmWCv2oHAik+oT+nUFJASktU1sVd2n6TMJL/OWjY0TCV6+TdKTugC30qb08tjcCiqD0qN0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766854293; c=relaxed/simple;
	bh=RKejtm7JxTvEQ1sU0AAFQFSvJjRGKFBBWFjb3Dgmuxs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ZIqeIXNEys4zZF96mG96rsCRmDzDDS1o7rfhLnTTG4nrsEGPBWP4Bm/WZcj8FHN8U2+AH0ozGTrGMYiLZqSHzWEpVAWW6/dEKSLxQpdVpYgWf2Kb75WO+cfxXjOhH0R0iH68S+oQTrwMXqOxblu5VW9oMQegpFkPK/kPzd+r5xc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 9FECF497;
	Sat, 27 Dec 2025 08:41:59 -0800 (PST)
Received: from pluto (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 788BE3F694;
	Sat, 27 Dec 2025 08:42:04 -0800 (PST)
From: Cristian Marussi <cristian.marussi@arm.com>
To: linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	arm-scmi@vger.kernel.org
Cc: sudeep.holla@arm.com,
	philip.radford@arm.com,
	peng.fan@oss.nxp.com,
	Cristian Marussi <cristian.marussi@arm.com>
Subject: [PATCH 1/2] firmware: arm_scmi: Rework protocol version negotiation logic
Date: Sat, 27 Dec 2025 16:41:31 +0000
Message-ID: <20251227164132.1311988-2-cristian.marussi@arm.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251227164132.1311988-1-cristian.marussi@arm.com>
References: <20251227164132.1311988-1-cristian.marussi@arm.com>
Precedence: bulk
X-Mailing-List: arm-scmi@vger.kernel.org
List-Id: <arm-scmi.vger.kernel.org>
List-Subscribe: <mailto:arm-scmi+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:arm-scmi+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Protocol version negotiation can be used by an agent to request the server
to downgrade the version effectively utilized by a specific protocol
during the current session, if the latest version used by the server is
newer than the latest version known to the client.

In order for the negotiation process to be fully effective at preventing
any possible version incompatibility, it must happen early on, well before
the specific protocol initialization phase takes place.

Delegate protocol version querying to the core SCMI stack and rework the
protocol negotiation logic in order to execute the needed negotiation
exchanges upfront, right before the initialization phase takes place.

Signed-off-by: Cristian Marussi <cristian.marussi@arm.com>
---
 drivers/firmware/arm_scmi/driver.c    | 93 ++++++++++++++++++++++-----
 drivers/firmware/arm_scmi/protocols.h |  4 ++
 2 files changed, 81 insertions(+), 16 deletions(-)

diff --git a/drivers/firmware/arm_scmi/driver.c b/drivers/firmware/arm_scmi/driver.c
index 5caa9191a8d1..094cfcf51d28 100644
--- a/drivers/firmware/arm_scmi/driver.c
+++ b/drivers/firmware/arm_scmi/driver.c
@@ -2112,6 +2112,76 @@ static int scmi_protocol_version_negotiate(struct scmi_protocol_handle *ph)
 	return ret;
 }
 
+/**
+ * scmi_protocol_version_initialize  - Initialize protocol version
+ * @dev: A device reference.
+ * @pi: A reference to the protocol instance being initialized
+ *
+ * At first retrieve the newest protocol version supported by the platform for
+ * this specific protoocol.
+ *
+ * Negotiation is attempted only when the platform advertised a protocol
+ * version newer than the most recent version known to this agent, since
+ * backward compatibility is NOT assured in general between versions.
+ *
+ * Failing to negotiate a fallback version or to query supported version at
+ * all will result in an attempt to use the newest version known to this agent
+ * even though compatibility is NOT assured.
+ *
+ * Versions are defined as:
+ *
+ * pi->version: the version supported by the platform as returned by the query.
+ * pi->proto->supported_version: the newest version supported by this agent
+ *				 for this protocol.
+ * pi->negotiated_version: The version successfully negotiated with the platform.
+ * ph->version: The final version effectively chosen for this session.
+ */
+static void scmi_protocol_version_initialize(struct device *dev,
+					     struct scmi_protocol_instance *pi)
+{
+	struct scmi_protocol_handle *ph = &pi->ph;
+	int ret;
+
+	/*
+	 * Query and store platform supported protocol version: this is usually
+	 * the newest version the platfom can support.
+	 */
+	ret = version_get(ph, &pi->version);
+	if (ret) {
+		dev_warn(dev,
+			 "Failed to query supported version for protocol 0x%X.\n",
+			 pi->proto->id);
+		goto best_effort;
+	}
+
+	/* Need to negotiate at all ? */
+	if (pi->version <= pi->proto->supported_version) {
+		ph->version = pi->version;
+		return;
+	}
+
+	/* Attempt negotiation */
+	ret = scmi_protocol_version_negotiate(ph);
+	if (!ret) {
+		ph->version = pi->negotiated_version;
+		dev_info(dev,
+			 "Protocol 0x%X successfully negotiated version 0x%X\n",
+			 pi->proto->id, ph->version);
+		return;
+	}
+
+	dev_warn(dev,
+		 "Detected UNSUPPORTED higher version 0x%X for protocol 0x%X.\n",
+		 pi->version, pi->proto->id);
+
+best_effort:
+	/* Fallback to use newest version known to this agent */
+	ph->version = pi->proto->supported_version;
+	dev_warn(dev,
+		 "Trying version 0x%X. Backward compatibility is NOT assured.\n",
+		 ph->version);
+}
+
 /**
  * scmi_alloc_init_protocol_instance  - Allocate and initialize a protocol
  * instance descriptor.
@@ -2157,6 +2227,13 @@ scmi_alloc_init_protocol_instance(struct scmi_info *info,
 	pi->ph.set_priv = scmi_set_protocol_priv;
 	pi->ph.get_priv = scmi_get_protocol_priv;
 	refcount_set(&pi->users, 1);
+
+	/*
+	 * Initialize effectively used protocol version performing any
+	 * possibly needed negotiations.
+	 */
+	scmi_protocol_version_initialize(handle->dev, pi);
+
 	/* proto->init is assured NON NULL by scmi_protocol_register */
 	ret = pi->proto->instance_init(&pi->ph);
 	if (ret)
@@ -2184,22 +2261,6 @@ scmi_alloc_init_protocol_instance(struct scmi_info *info,
 	devres_close_group(handle->dev, pi->gid);
 	dev_dbg(handle->dev, "Initialized protocol: 0x%X\n", pi->proto->id);
 
-	if (pi->version > proto->supported_version) {
-		ret = scmi_protocol_version_negotiate(&pi->ph);
-		if (!ret) {
-			dev_info(handle->dev,
-				 "Protocol 0x%X successfully negotiated version 0x%X\n",
-				 proto->id, pi->negotiated_version);
-		} else {
-			dev_warn(handle->dev,
-				 "Detected UNSUPPORTED higher version 0x%X for protocol 0x%X.\n",
-				 pi->version, pi->proto->id);
-			dev_warn(handle->dev,
-				 "Trying version 0x%X. Backward compatibility is NOT assured.\n",
-				 pi->proto->supported_version);
-		}
-	}
-
 	return pi;
 
 clean:
diff --git a/drivers/firmware/arm_scmi/protocols.h b/drivers/firmware/arm_scmi/protocols.h
index d62c4469d1fd..2766c2b822b5 100644
--- a/drivers/firmware/arm_scmi/protocols.h
+++ b/drivers/firmware/arm_scmi/protocols.h
@@ -159,6 +159,9 @@ struct scmi_proto_helpers_ops;
  * struct scmi_protocol_handle  - Reference to an initialized protocol instance
  *
  * @dev: A reference to the associated SCMI instance device (handle->dev).
+ * @version: The protocol version currently effectively in use by this
+ *	     initialized instance of the protocol as determined at the end of
+ *	     any possibly needed negotiations performed by the core.
  * @xops: A reference to a struct holding refs to the core xfer operations that
  *	  can be used by the protocol implementation to generate SCMI messages.
  * @set_priv: A method to set protocol private data for this instance.
@@ -177,6 +180,7 @@ struct scmi_proto_helpers_ops;
  */
 struct scmi_protocol_handle {
 	struct device *dev;
+	unsigned int version;
 	const struct scmi_xfer_ops *xops;
 	const struct scmi_proto_helpers_ops *hops;
 	int (*set_priv)(const struct scmi_protocol_handle *ph, void *priv,
-- 
2.52.0


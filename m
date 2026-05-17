Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0FC42F532C
	for <arm-scmi@vger.kernel.org>; Sun, 17 May 2026 19:04:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779044662; cv=none; b=eKpijOCoFjEh+T6HEkOuyGKGZcve7wlnmyy6niUHEeyR5Z3HYcYhzOy1Z2AbHtl5LsUZJ/jZu8ZMfpOKE1uwPHgLDzVKL08Sl4URi5IP/ilAA67l94amfr6boewvzMH+FiOeuYnuNlWWsU21Eu3PtTIIEJHJqS3QmdtIvmwuuRk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779044662; c=relaxed/simple;
	bh=gtNkyVAon17B6gxTPIRNAOKMV3QFrdAKPrTMiYF+a7k=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To; b=Aw5qdtojkf91Hrwms4B4qgYzkkrcJ2DUox2Bt9bMbeAzsiGOSBoEfeoKPtPG8wbvP/ngkhTwNeaVAFMhsimv/UGvXt9ZZdCfi00boEyAjzCYssy9538L+FMnx1Yu6xEzltPxKpM7IcJYm7EhXw1A70AcpN8+xhQQ7PCij+/Zfs8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=tm7Yz7a/; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="tm7Yz7a/"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EA906C2BCB8;
	Sun, 17 May 2026 19:04:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1779044662;
	bh=gtNkyVAon17B6gxTPIRNAOKMV3QFrdAKPrTMiYF+a7k=;
	h=From:Date:Subject:References:In-Reply-To:To:From;
	b=tm7Yz7a/EneKn2wWKF+FaPb8gpjUK6985BUD27pqIHRiqd+fMY7ryP17oMJkJk74v
	 qgmYj/rCXWH/rEy0KnZWWbT3bifGrPgCnIwcP+/WyMSh+XER/AX1OdzT2E6ShVA3w2
	 8IAUmNKnfW8JjtMANma/fb9BMH3Yp/OLHagOq2upAWaDfaKXd/NhK/ui7pwNAHRboJ
	 /1RgWHJlmIcDFW7lZUh+9C+K3HDdO86OCbdXbx4iUiLobBW4mFxPpVUA8WipsMlZF1
	 NEwmWmrDrrisO+NvD4ZJfr4lTdpTCbfscoUJ+WzZc5EJvUTi3+LWahxz+jfpl2IUUn
	 NHDVbBGR4XDmw==
From: Sudeep Holla <sudeep.holla@kernel.org>
Date: Sun, 17 May 2026 20:02:43 +0100
Subject: [PATCH 4/4] firmware: arm_scmi: Validate Powercap domains before
 state access
Precedence: bulk
X-Mailing-List: arm-scmi@vger.kernel.org
List-Id: <arm-scmi.vger.kernel.org>
List-Subscribe: <mailto:arm-scmi+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:arm-scmi+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260517-scmi_fixes-v1-4-d86daec4defd@kernel.org>
References: <20260517-scmi_fixes-v1-0-d86daec4defd@kernel.org>
In-Reply-To: <20260517-scmi_fixes-v1-0-d86daec4defd@kernel.org>
To: Cristian Marussi <cristian.marussi@arm.com>, arm-scmi@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, 
 Sudeep Holla <sudeep.holla@kernel.org>
X-Mailer: b4 0.15.2

Powercap protocol v2 keeps local enable and last-cap state per
domain. Some public operations indexed that state before checking that
the supplied domain id was valid, and cap_enable_get() updated it even
when cap_get() failed.

Validate the domain before touching the per-domain state and only
refresh cached enable state after a successful cap_get().

Signed-off-by: Sudeep Holla <sudeep.holla@kernel.org>
---
 drivers/firmware/arm_scmi/powercap.c | 25 ++++++++++++++++++-------
 1 file changed, 18 insertions(+), 7 deletions(-)

diff --git a/drivers/firmware/arm_scmi/powercap.c b/drivers/firmware/arm_scmi/powercap.c
index ab9733f4458b..eb5c35cad026 100644
--- a/drivers/firmware/arm_scmi/powercap.c
+++ b/drivers/firmware/arm_scmi/powercap.c
@@ -453,10 +453,14 @@ static int scmi_powercap_cap_set(const struct scmi_protocol_handle *ph,
 		return -EINVAL;
 
 	/* Just log the last set request if acting on a disabled domain */
-	if (PROTOCOL_REV_MAJOR(ph->version) >= 0x2 &&
-	    !pi->states[domain_id].enabled) {
-		pi->states[domain_id].last_pcap = power_cap;
-		return 0;
+	if (PROTOCOL_REV_MAJOR(ph->version) >= 0x2) {
+		if (!scmi_powercap_dom_info_get(ph, domain_id))
+			return -EINVAL;
+
+		if (!pi->states[domain_id].enabled) {
+			pi->states[domain_id].last_pcap = power_cap;
+			return 0;
+		}
 	}
 
 	return __scmi_powercap_cap_set(ph, pi, domain_id,
@@ -637,6 +641,9 @@ static int scmi_powercap_cap_enable_set(const struct scmi_protocol_handle *ph,
 	if (PROTOCOL_REV_MAJOR(ph->version) < 0x2)
 		return -EINVAL;
 
+	if (!scmi_powercap_dom_info_get(ph, domain_id))
+		return -EINVAL;
+
 	if (enable == pi->states[domain_id].enabled)
 		return 0;
 
@@ -678,16 +685,20 @@ static int scmi_powercap_cap_enable_get(const struct scmi_protocol_handle *ph,
 	if (PROTOCOL_REV_MAJOR(ph->version) < 0x2)
 		return 0;
 
+	if (!scmi_powercap_dom_info_get(ph, domain_id))
+		return -EINVAL;
+
 	/*
 	 * Report always real platform state; platform could have ignored
 	 * a previous disable request. Default true on any error.
 	 */
 	ret = scmi_powercap_cap_get(ph, domain_id, &power_cap);
-	if (!ret)
+	if (!ret) {
 		*enable = !!power_cap;
 
-	/* Update internal state with current real platform state */
-	pi->states[domain_id].enabled = *enable;
+		/* Update internal state with current real platform state */
+		pi->states[domain_id].enabled = *enable;
+	}
 
 	return 0;
 }

-- 
2.43.0


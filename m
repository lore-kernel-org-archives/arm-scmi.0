Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795549891;
	b=wgT9na3k5v8aQGdSErc0b5uM8zDdmHvNWp4vW9C3X9ojG0QFCd7erGwGVfEcWFAYgKLd
	 gGN2wteq4pwf8S8Oau6vGo3kmGi1i2XyGJfbn65gkNtgV2mYEq2/DHo3VQrcUUztFXTo0
	 dRk6IzKZxQcO+9u2aGp62WrqwZRJ658qTrmWZp1aKCjyiSIimWqFtQbLzW+IZYVMF/U1f
	 FMGD2o+ljuLCeO+1NrkW9vm5n+dK2npchGQAocwiDvI0kZL0U5RC7MMCJXCD5gXB0EhQS
	 7+u97H07bELqBn9Dr26AVBorhVKn8B5AY2B67Nn2KJQsuhWaxhBxvg/IXRpuu5Px1Yw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795549891;
	h=DMARC-Filter:Received:Received:DKIM-Signature:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=qv7BxFg9sJmxV34KjiW/8ih8V/dt/aWZUBW21SLTsFE=;
	b=NVgWY5OdK/JNCE02qIJT0mLYZVGZ4//7oX9CjdFrnAYz5iNXNXaiQseAVR7XcwsbQ35N
	 JWAGnszZzuouPBH5c3FbhsxRNeAf47Avi3N6yJr87wrKw1Iqt6Ro2Xh/rot+J8q9anBFc
	 zJlrf+tWKgwiET2GM+6lK1cE3Hb/T8BPTO8XCG39yGzzhYLwZBrlHAkwX7NAG4yx2GJIH
	 feKYMdrQJSlud86MjWNK/ca/2rULBpWVbAw6c+9my+IWyU3u2/ans1YiaGRmzneu1Sa+Y
	 faYmnLPgYD1l1cAT/2xSvyaL4ZO2BFWosIkjZUutdoRVRhGu8k/rYWD4TYowZRnf9Sw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=arm.com;
	spf=pass smtp.mailfrom=arm.com;
	dkim=pass header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b="A8QZP/XF";
	arc=none smtp.remote-ip=217.140.110.172
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 42CB1606A323;
	Tue, 24 Nov 2026 19:51:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 42CB1606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=A8QZP/XF
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B4627497;
	Tue, 24 Nov 2026 11:51:27 -0800 (PST)
Received: from pluto.guest.local (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 8FE573F763;
	Tue, 24 Nov 2026 11:51:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1795549890; bh=2jEg9O97PNUqbVJbj1N0o3Mql/Mz8uT3lWycx5BKbh4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=A8QZP/XFYb4+JTTZutHT8NnhtJfL5iHN+S4qrhMfrwaUxkrIBDWn6xdh0jdfCi5P0
	 dF9/zljw0IKYL170rwt65M92SULGw0ObE5mMnX7rdqOIKwkAj52ZgyhkM0GJ8U/rOQ
	 NjuAHYVlbt2oyvUHYXPGbN1ku0uQ+5qjH3nbwf7Y=
From: Cristian Marussi <cristian.marussi@arm.com>
To: linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	arm-scmi@vger.kernel.org,
	linux-doc@vger.kernel.org
Cc: sudeep.holla@kernel.org,
	james.quinlan@broadcom.com,
	f.fainelli@gmail.com,
	vincent.guittot@linaro.org,
	etienne.carriere@st.com,
	peng.fan@oss.nxp.com,
	michal.simek@amd.com,
	d-gole@ti.com,
	jonathan.cameron@oss.qualcomm.com,
	elif.topuz@arm.com,
	lukasz.luba@arm.com,
	philip.radford@arm.com,
	david@kernel.org,
	souvik.chakravarty@arm.com,
	leitao@kernel.org,
	kas@kernel.org,
	puranjay@kernel.org,
	usama.arif@linux.dev,
	kernel-team@meta.com,
	Cristian Marussi <cristian.marussi@arm.com>,
	Sashiko <sashiko-bot@kernel.org>
Subject: [PATCH v17 22/34] firmware: arm_scmi: Invoke proper protocol cleanup on failure
Date: Tue, 24 Nov 2026 19:48:28 +0000
Message-ID: <20261124194841.1147072-23-cristian.marussi@arm.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261124194841.1147072-1-cristian.marussi@arm.com>
References: <20261124194841.1147072-1-cristian.marussi@arm.com>
X-Mailing-List: arm-scmi@vger.kernel.org
List-Id: <arm-scmi.vger.kernel.org>
List-Post: <mailto:arm-scmi@vger.kernel.org>
List-Help: <mailto:arm-scmi+help@vger.kernel.org>
List-Subscribe: <mailto:arm-scmi+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:arm-scmi+unsubscribe@vger.kernel.org>
List-Owner: <mailto:arm-scmi+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

After a failure in the protocol initialization phase, invoke if provided
the protocol deinitialization routines.

Fixes: 48dc16e2e52c ("firmware: arm_scmi: Extend protocol registration interfaces")
Reported-by: Sashiko <sashiko-bot@kernel.org>
Closes: https://sashiko.dev/#/bug/linux-12cc0795-af8e-4d0c-8f6a-780a6728de7a
Signed-off-by: Cristian Marussi <cristian.marussi@arm.com>
---
 drivers/firmware/arm_scmi/driver.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/firmware/arm_scmi/driver.c b/drivers/firmware/arm_scmi/driver.c
index 00a3484006d9..123050335969 100644
--- a/drivers/firmware/arm_scmi/driver.c
+++ b/drivers/firmware/arm_scmi/driver.c
@@ -2353,7 +2353,7 @@ scmi_alloc_init_protocol_instance(struct scmi_info *info,
 	ret = idr_alloc(&info->protocols, pi, proto->id, proto->id + 1,
 			GFP_KERNEL);
 	if (ret != proto->id)
-		goto clean;
+		goto deinit;
 
 	/*
 	 * Warn but ignore events registration errors since we do not want
@@ -2374,6 +2374,9 @@ scmi_alloc_init_protocol_instance(struct scmi_info *info,
 
 	return pi;
 
+deinit:
+	if (pi->proto->instance_deinit)
+		pi->proto->instance_deinit(&pi->ph);
 clean:
 	/* Take care to put the protocol module's owner before releasing all */
 	scmi_protocol_put(proto);
-- 
2.54.0


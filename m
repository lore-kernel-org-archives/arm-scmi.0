Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795546295;
	b=HTTItvwu0bSwYqkD0/gYmTtrflklX94plBwsp4AzLdB6FO7ZZ6Q5qNzTq6jzBuQvmBLF
	 cLxmwwAInc9qzUysSrvBxSh6+57gMor+a6j5OI8g+b6ziZBgn94f90Z5VOOHussiMoiqJ
	 mYR+Tz8J07grEHtp02uDzwZeyqmzLDseZrWYI8CPpYsJ/ucATHkijBk9BPg9EDBtQsEmw
	 Tw5I2WCCgxAFEYFeo8qYGEGEZJMQjDy94o8BpgXA1M/8KQFiKLdGlfc0uoGp+2wTxnf2l
	 49izlkhzSaS0wdELlXK3i+Vnf9PP19ZiwPQI+0L9ORccw8Q5RCyVknMo+s1IPEkyDCg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795546295;
	h=DMARC-Filter:Received:Received:DKIM-Signature:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=b4jKVYN2hzyfgJZNkATktsqmC4YHk9xLPNdviAoAgoA=;
	b=Kcm7Jc/wpKbk1xtbfF+T7DCt23xrzspl4g+UQkZ90Gth/MnyLlMDTmnqvJgi1jEizSOc
	 oduILqRnM5u2dMREup4bQIHcRYUHCQidgHb4lIOUCoFXzNhVHMFsZTUBy4ckrUy6NNxXH
	 ZTxiUepaR27FpG8O0dpuw5C8Q4+zMDsnIdNGVhkoCqjlhh6pgtojISZw3rTZekfmFbbiP
	 UvLZIiN+lLjtX2wCBleHbyQAZubZN0F9Skn9lx/uqKprIq8SxRVnoJCfDadlcc+yiGR5O
	 j5JiXEMl7p9urOidHcsC4DZqv+VTlqV88KB1wIYSYUCH41cELQD2b2mGCLw30NyTWGA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=arm.com;
	spf=pass smtp.mailfrom=arm.com;
	dkim=pass header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=A8MJaKt8;
	arc=none smtp.remote-ip=217.140.110.172
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 62A63606A32E;
	Tue, 24 Nov 2026 18:51:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 62A63606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=A8MJaKt8
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 0EC89339;
	Tue, 24 Nov 2026 10:51:32 -0800 (PST)
Received: from pluto.guest.local (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 7548C3F86C;
	Tue, 24 Nov 2026 10:51:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1795546294; bh=zfXirsAzSVHtR7qSKx/gX9L1BiGhOpfUA0psmaox7pM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=A8MJaKt8bNmwQ+n3gaz4/hjLNjrFg3Up9GTBdt7IqmFzSrg6hhHAIRCq6URypFleS
	 Mk645DnvI0oNz3YTYiMJEZwPfVqNkYDptx3QOrhV7OOxvJAOZt4VFbY580SsWoGYGb
	 gQ2tQ0AGGQYCuNQh0GDiKM9HOancJ+h0lmvFViGY=
From: Cristian Marussi <cristian.marussi@arm.com>
To: linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	arm-scmi@vger.kernel.org
Cc: sudeep.holla@kernel.org,
	philip.radford@arm.com,
	Cristian Marussi <cristian.marussi@arm.com>,
	Sashiko <sashiko-bot@kernel.org>
Subject: [PATCH 1/2] firmware: arm_scmi: Invoke proper protocol cleanup on failure
Date: Tue, 24 Nov 2026 18:51:10 +0000
Message-ID: <20261124185111.1022322-2-cristian.marussi@arm.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261124185111.1022322-1-cristian.marussi@arm.com>
References: <20261124185111.1022322-1-cristian.marussi@arm.com>
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
index 05092301db29..2c4424aa0d37 100644
--- a/drivers/firmware/arm_scmi/driver.c
+++ b/drivers/firmware/arm_scmi/driver.c
@@ -2303,7 +2303,7 @@ scmi_alloc_init_protocol_instance(struct scmi_info *info,
 	ret = idr_alloc(&info->protocols, pi, proto->id, proto->id + 1,
 			GFP_KERNEL);
 	if (ret != proto->id)
-		goto clean;
+		goto deinit;
 
 	/*
 	 * Warn but ignore events registration errors since we do not want
@@ -2324,6 +2324,9 @@ scmi_alloc_init_protocol_instance(struct scmi_info *info,
 
 	return pi;
 
+deinit:
+	if (pi->proto->instance_deinit)
+		pi->proto->instance_deinit(&pi->ph);
 clean:
 	/* Take care to put the protocol module's owner before releasing all */
 	scmi_protocol_put(proto);
-- 
2.54.0


Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com [209.85.208.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD9B1346E73
	for <arm-scmi@vger.kernel.org>; Tue, 21 Oct 2025 16:52:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761065548; cv=none; b=LAG37s1tD3ZEwzPPkq/ePI1XtmPThhn8YSr/GMtY3b5GI27WGEtFIJpobHAfOobgmWKsVu8k84xPsMUz47xQrkOjJEyc2ZG7a8/NAfjzuI6D5dFIzKXCa17sZL1ptP1hUot+9Sblg2OdpCcxVxxQfOUmqVy7CBKHYAisnY5ZrLA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761065548; c=relaxed/simple;
	bh=ZwAF2AyKjAq7XArrOl8zo/1+2cviZIez9vQLVLqfOZo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=WMe99vKzwe3ySdj4LYPuFxoLDE8cTPqL8VUKimzxRgliH2IfRxaDejIS/YW3e3zchJBfIYls3M8dbJXSG/WEjWZAE6FxajKfa0hbEG6+vpHJhFzSuXg2P3c6D2k5haOyiYntr2kxqaEyqqm7E3aYD+ib5yYka2Y7GelmKPNDth8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DQNOyL5v; arc=none smtp.client-ip=209.85.208.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DQNOyL5v"
Received: by mail-lj1-f173.google.com with SMTP id 38308e7fff4ca-37775ed97daso812411fa.0
        for <arm-scmi@vger.kernel.org>; Tue, 21 Oct 2025 09:52:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761065545; x=1761670345; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=paRKTns1WT8quydNofkJCuHKZQbF54gWy9Rd/nrzvfk=;
        b=DQNOyL5vCyXu5GPB74zADZoQYkK7xeW5XzbsbV1LE3rMH5NyrxyHC0AvEbX/bVcewM
         kVySeJ06CC2v6DaXhof5sVmKPmyQbTJulJ6c/bkm7paAt8leNnuMDfepnj7+uBmECFmW
         IZfYdApjQlRH7FbklYiPjGjbZAbeOi+72FVHb54T0ugZXVLOSGZKC6yLJkiyV8GT1wza
         GDvzdZA/GHN3UE0juJzA1u+4g4ItfKcie4B+BhYMdA8CL8eNTvIs9mq8Sf5DdmE9l2Br
         /DUcNFxFtTZ3txDRZw+UW+uaZUnakecZvtFEiHAfBnN6Iao1YYl6aQNWQ105+Bb69Ust
         0xbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761065545; x=1761670345;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=paRKTns1WT8quydNofkJCuHKZQbF54gWy9Rd/nrzvfk=;
        b=OxsWbe1yi7odGjd8r0Pk15PTerYgaLwo6d1Sy3q2lva0Lh/h91WEE2pg7d/zv3+I2d
         o0cpdd6jBKEfaniefBCJj0qkVO0UjaaISSLWOEtxDu9QSDRxUFhu7qG5pAZo6QCiv+U1
         ffdta3qfBeO7eAkrwMblixrQ6ovWZL1QTBAu2tWRkaB93WAxUa4xe/qsCLzm+eqy+TGc
         w6vdzhQCYtZNYRplvUYo+ihfwUV737kLvQvTj2UmLBzrwQkGomg6fHjY55ok6Ahs2QLy
         p8c39ESvS3JU313Ie5WxC081RSvpVAPCEYXeTyoBBgo4bpBm5sanK7FrWSuE366LETdp
         pXyQ==
X-Forwarded-Encrypted: i=1; AJvYcCX7gLCeR4tu0Uzm5UqnsqTzNiWImY5xvZiRXVXQxzbg4+Q5zJFmta2yDNNzRC7+KdZfBpPKMl2Htg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz42+7sbd/51MlkOILifbcDswpJnU4J1u3qerscyjYi2EordRrw
	nSgm53RvoSJAXZnU0gOuTBxesugD7uAFxSFIbKcqsFPhE42uwS66fmp/
X-Gm-Gg: ASbGncvRCpDIiop0t7UkRRoknkgp9kvw/bdW3szJAW32cvOMRXJKwnEsIzQ4JSPx+3C
	3FQPgJi8S4OnLgaimnW2UvPNidMDB/GjtNHZS/lZw0E74hgEJVzB3FKP875Nsi4t4JmNg9mO3MP
	4lNmhJB0l0g72iiro5W5NyJ+APg9vF0ZTNgSBilOdqyydO2E+rf1YqX/104ZYLI7snWHxQrmsLO
	R/8mxsL30vsMd/sZSjqx7b8sbzzzUITfWHKw0kGOMinCpWOsM5lyCwU5yRZNjNbGlbGI+pUlivu
	lc3fRUnrUdlTglKDrDBHNAQxMfsc6whyn7VIahtsMJ+6sjjmEJu7OXjHwAyzNh1/dxWGr7XQbJi
	wUTNXiDQww+eQi8fdJ/YZkGFBo9yecgab8GkdgDrv5qay4DVQw33p8k8IHxJTQIRs/0SPxpKnG+
	VX/kNF3OwpZMvnv1PrqA==
X-Google-Smtp-Source: AGHT+IGjAkRj9soa7GWukQ8Cihq7HSi/Un2xv4fuxCxdBhttxHc7UDbrzdxzRB84sxHyktFpcpbArg==
X-Received: by 2002:a05:651c:25d3:10b0:377:991f:c1bc with SMTP id 38308e7fff4ca-378bb007751mr918501fa.5.1761065544634;
        Tue, 21 Oct 2025 09:52:24 -0700 (PDT)
Received: from NB-6746.corp.yadro.com ([188.243.183.84])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-377a9506367sm30738001fa.34.2025.10.21.09.52.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Oct 2025 09:52:24 -0700 (PDT)
From: Artem Shimko <a.shimko.dev@gmail.com>
To: Sudeep Holla <sudeep.holla@arm.com>,
	Cristian Marussi <cristian.marussi@arm.com>
Cc: a.shimko.dev@gmail.com,
	arm-scmi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] firmware: arm_scmi: Add new sensor unit types
Date: Tue, 21 Oct 2025 19:52:11 +0300
Message-ID: <20251021165212.749372-1-a.shimko.dev@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: arm-scmi@vger.kernel.org
List-Id: <arm-scmi.vger.kernel.org>
List-Subscribe: <mailto:arm-scmi+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:arm-scmi+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add support for two new sensor unit types introduced in Arm SCMI
- STATE_BINARY (0x5E): Binary state (1: enabled/on, 0: disabled/off)
- BYTES_SEC (0x5F): Bytes per second

These unit types are used for sensors that report binary state information
and data transfer rate measurements respectively.

Signed-off-by: Artem Shimko <a.shimko.dev@gmail.com>
---
Hello,

This patch adds definitions for two new sensor unit types that were
introduced in the Arm System Control and Management Interface (SCMI)
Specification version 4.0:

STATE_BINARY (0x5E) - Used for sensors that represent binary states
where:
1 indicates enabled/on state
0 indicates disabled/off state

BYTES_SEC (0x5F) - Used for sensors that measure data transfer rates
in bytes per second

These additions ensure compatibility with SCMIv4.0 and allow proper
handling of binary state sensors and bandwidth measurement sensors
in the Linux SCMI driver.

The patch follows the existing pattern for sensor unit type definitions
and maintains backward compatibility with previous SCMI versions.

Thank you for your consideration.

Best regards,
Artem Shimko

 include/linux/scmi_protocol.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/include/linux/scmi_protocol.h b/include/linux/scmi_protocol.h
index aafaac1496b0..629acb7831eb 100644
--- a/include/linux/scmi_protocol.h
+++ b/include/linux/scmi_protocol.h
@@ -488,6 +488,8 @@ enum scmi_sensor_class {
 	CUBIC_METERS_SEC = 0x5B,
 	MM_MERCURY = 0x5C,
 	RADIANS_SEC_SQUARED = 0x5D,
+	STATE_BINARY = 0x5E,
+	BYTES_SEC = 0x5F,
 	OEM_UNIT = 0xFF
 };
 
-- 
2.43.0


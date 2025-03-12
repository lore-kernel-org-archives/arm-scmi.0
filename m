Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B62A81E8327
	for <arm-scmi@vger.kernel.org>; Wed, 12 Mar 2025 11:40:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741779646; cv=none; b=Dv86wPzcakefpGDGhxZX/88xkYEuo1iB1spfifgyQ9/ffK2gNUp/9AC6Ypa//n7J4MlezF8NOCqDoFijVSALkd0xy7lE4i3nlZNDD5d3yShq3uoYacennaaKAxTG8aQiErcCBsmVXV5yvVJ68Zdor7v5MPviKKUERIpBXIIXauM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741779646; c=relaxed/simple;
	bh=WbYcwPFa1V2cCGxOBvupgDD2HrO3B51Gf6RHdYRG7bU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=XXo0CMqCS3/SuEZ90FVotv1qFJHvPurb7urABaVOelS8q2xA7y8n9F3brFNgO8HTAkh8LEHKI8MbnmLI1E5BoQZWzr0uuDqxyMVGCT1glSAku+6RLqlIOR+fs/BMPoDd2m0ZgoxG81QPd4hY11AfG55FeM8OXgfr7Ay6/kFQdO0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D78D51595;
	Wed, 12 Mar 2025 04:40:54 -0700 (PDT)
Received: from e133711.arm.com (e133711.arm.com [10.1.196.55])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 6377E3F694;
	Wed, 12 Mar 2025 04:40:43 -0700 (PDT)
From: Sudeep Holla <sudeep.holla@arm.com>
Date: Wed, 12 Mar 2025 11:40:24 +0000
Subject: [PATCH 1/3] firmware: arm_scmi: Ensure scmi_devices are always
 matched by name as well
Precedence: bulk
X-Mailing-List: arm-scmi@vger.kernel.org
List-Id: <arm-scmi.vger.kernel.org>
List-Subscribe: <mailto:arm-scmi+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:arm-scmi+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250312-b4-scmi_minor_cleanup-v1-1-c62c6cb4111a@arm.com>
References: <20250312-b4-scmi_minor_cleanup-v1-0-c62c6cb4111a@arm.com>
In-Reply-To: <20250312-b4-scmi_minor_cleanup-v1-0-c62c6cb4111a@arm.com>
To: arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc: Sudeep Holla <sudeep.holla@arm.com>, 
 Cristian Marussi <cristian.marussi@arm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1346; i=sudeep.holla@arm.com;
 h=from:subject:message-id; bh=WbYcwPFa1V2cCGxOBvupgDD2HrO3B51Gf6RHdYRG7bU=;
 b=owEBbQKS/ZANAwAIAQBBurwxfuKYAcsmYgBn0XK5a49E9ckMH5JeP7jTH0gvShMQEq4jn82J4
 ec11jSt4ACJAjMEAAEIAB0WIQS6ceUSBvMeskPdk+EAQbq8MX7imAUCZ9FyuQAKCRAAQbq8MX7i
 mMMsEAC+cqTkFyWVy5IMGOTm2WMfFGHZvA7sGj8pbABqiG5Lvjg/4UFrDlzYtavxi2QUdtrRxPM
 AqadNtOWIncN8IFopCUza4A6Bi/W3uL0kht7JRL0DEFPpmFSsGUVkz1Zflz+A6cIuLbgtjXekXv
 qmAKqgMh/O091e+pJGdg9zC0T+TBG7jWklDCrag4n6LO9BnXZAUBmK59QsoUoGD/usLpzcf082u
 ve9a0oof56G0k4IYfNDQ9zgVTKdV4uEEkHr37GMJPxPgJQr0Bk2E24E5qKM/C6YTrl3Xi2kYu3Q
 XUmR/2y13zlONP1F7vl66rsd5aNLe3S5QsEZn90+2zZC5hrecxnl0rb/q9/REo7zvsMsXNWjP3a
 LYHT7sdy4VfTLHwR1L6zuussCGxCF+AGxidsTAtKrERgjwX9YH/24cCHZAS1T/jV9xSWUvNc0tP
 9yc1m7qJYOBwUMkZElYcIfzHUUXifG+s96SddJGXv3G2c421aCydaVf+nFDpcY9kR0tqXpvqfbb
 WzIUAAow1R6ubZcE1x6RM6qh+QIOEpNteExuKcpmb7k+XweYSUDmMVc4x55uTSee+X3E9hJm0na
 5wEq/FdnkaYQ8+JZxUpZqnPe0aQOzFV1RVGR4Q6/CSHM220A9xGG5PxVMgbHc8Kf/gCDyDGbEZL
 McUDlSDtp2nK2yA==
X-Developer-Key: i=sudeep.holla@arm.com; a=openpgp;
 fpr=7360A21742ADF5A11767C1C139CFD4755FE2D5B4

Currently, devices without a name in the id_table cannot register drivers,
and no scmi_device is created without a name via scmi_device_create().
However, the function __scmi_device_create() allows devices with no name,
which are then labeled as "unknown."

Removes support for matching scmi_device instances without a name,
ensuring consistency across the driver registration and probing process.

Signed-off-by: Sudeep Holla <sudeep.holla@arm.com>
---
 drivers/firmware/arm_scmi/bus.c | 11 ++++-------
 1 file changed, 4 insertions(+), 7 deletions(-)

diff --git a/drivers/firmware/arm_scmi/bus.c b/drivers/firmware/arm_scmi/bus.c
index a3386bf36de508d312e2c4fa2e27ba62ba3776a0..050a5ff5dc96a7df58edff5faeb8c1ec6228b97d 100644
--- a/drivers/firmware/arm_scmi/bus.c
+++ b/drivers/firmware/arm_scmi/bus.c
@@ -214,13 +214,10 @@ scmi_dev_match_id(struct scmi_device *scmi_dev, const struct scmi_driver *scmi_d
 	if (!id)
 		return NULL;
 
-	for (; id->protocol_id; id++)
-		if (id->protocol_id == scmi_dev->protocol_id) {
-			if (!id->name)
-				return id;
-			else if (!strcmp(id->name, scmi_dev->name))
-				return id;
-		}
+	for (; id->protocol_id && id->name; id++)
+		if (id->protocol_id == scmi_dev->protocol_id &&
+		    !strcmp(id->name, scmi_dev->name))
+			return id;
 
 	return NULL;
 }

-- 
2.34.1


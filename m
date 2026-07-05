Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A96D31C84DC
	for <arm-scmi@vger.kernel.org>; Sun,  5 Jul 2026 10:35:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783247718; cv=none; b=CjmAD3Iu/0E2LuZa6xAeCrdwZb74VDlEhkeIWBiXcyWObkSTw/aee1u8jMct/pWNPzdq9fjQWLYNP+qBg0joh2jOOdj5OQ+hfTbbr0zXiAdRta2COrwDgncU0qyt0nhCEf1mH99OyIA0jRiS72ZfVpF/v6S8Y67mLjryzdiOfoQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783247718; c=relaxed/simple;
	bh=QUpOtjJA1fKKKIGK+q5DkLiLn6j++MwmNQcpg6m7bu0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ckq/dbr4Ue93rVRaTWgK/Wd3s30gHNMpA+jWGpfyb/BH/42kzVcghMZxM8GsuGhJKKfH2K9xIa+Qi+Ow+WGcz9WpuMp+vMmDAslC5DCqkyEgndaAptwvzdYGaTDmvj9zRI9HEqjQ1nVQnc0PSs2X4aTCUFL+mtng6elH2A+iqPs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Da6KcYJo; arc=none smtp.client-ip=209.85.210.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Da6KcYJo"
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-847a52edeb2so1466465b3a.0
        for <arm-scmi@vger.kernel.org>; Sun, 05 Jul 2026 03:35:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783247716; x=1783852516; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=uc2/OX4P4+qZ8YfdxG54xkPztMxglA34ZXzI4is0OPI=;
        b=Da6KcYJoOe9B2he+apGmcS1skqHYP/0tc9h1Miuf4lJEjvPzqH8cxRDVNCptD3uVgR
         +WzTRNVtaFuDiywnO73x9dvwv6czKYpRaWEV1VHVo4kDVf+mPKWrNBnUoW33iffZ3AyM
         WCLPkqv1gVc+SuFXoJF3f+GuR6gnhVV1kvnG8GwaApmt03qbgv29kc96LesHkBfQVtT9
         0FrP+zhmynJCNgKltn6GQ+8yTCG3KqslqP6GyrqoKp2rKn43Y1QG/jYH6cqaILnl7zLq
         5R0os4bQDbZaCbRuixGX+pRqzwdZhyVP6TmtWOZLsosy/tudWQ5LDFChF8FQUuEXDOAG
         9/tA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783247716; x=1783852516;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uc2/OX4P4+qZ8YfdxG54xkPztMxglA34ZXzI4is0OPI=;
        b=iqYhowkIq4x1Q4U+OOEuDb0E7JA62nHvJGVvjQmwJHN5HB/ttYcM4qTeSPT8aWsCJo
         BQCo82+gAKscgHqn6hNRPtxWBMgtesnjc1Vy9iaPsweMwAlK/tfVhEsU4RZiL7wva5na
         HOg2CmbuR/HEwNDV5FJDL3QHb0HS8IPj+j1fyK8qBJQmUbSitwxUWGxTQxrvckZzY4NX
         T32hqFpJMb2yWl85OgOrxbBMPw7KYisZfh1pvPYLEiRP53ikQYdya7boerSvQ6S4AqjR
         kva81iHwINYUPEgWcpyDhrWlKvXEk7zuMMQHNXg9pJ8WDGa/WsUvZ4OKok/W6yn93i4l
         IqeQ==
X-Forwarded-Encrypted: i=1; AHgh+RrIsZXeGboyx9Y0ADRqLZA0vzYgvuml0TK7erxiNqHz35LzoNP9YGk3XtFBsIWzYa87lf8lXxoFtA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwxEIdmpL1Tnw7bDi3dBrzDUxzaPUGpsw/9DRmBA3z8kTHDm/fG
	AVfpkjrzM6y7q2lGWpdmg0V3elOSxjTmiyS9qQ1J8mdpkx0rWcgKDxF/
X-Gm-Gg: AfdE7cnU/boeraz69+OtX7dIp2OmIzsThb+geS51xL0PRIxhpltiVZ/GS+xSJC73kKY
	0+AQ+HqCAlRFtf5w8hO4zaHHpJ9pI+g8MeDVoxvpNa9mZC/9L/TSj0o9+B9ULOh89hkvs+SuNTF
	Si5VVyBkVUfnfOwuGMatP1FVbvCGcyWWXZzlvq8+FJmTrzfDgOKpbCZgONsS/jMhL2uH1qFcLBp
	eLZ8kOpNvYgpKQ4v46Y1nxgiFmMsSN51HzABeRQ3FdIa4ftK/YmvWcshfS3d26mUlbrvae57mlp
	4L2uxIhBdi3KYRIDbsdkZ2E7ZfbLY5z1z4vTL4Jt4zpbQlBpdPz53zOoY0iKbtVXNqGxKqKio6Y
	ooqDkheDs88G/DE0NPY3Twe9xGQGukUWPII0hPFa+FxOy4Im+4idbbcnlEOrSmu87DktFWu0=
X-Received: by 2002:a05:6a00:2e1d:b0:845:d286:1fb6 with SMTP id d2e1a72fcca58-847f6fa9cfdmr5543003b3a.52.1783247715985;
        Sun, 05 Jul 2026 03:35:15 -0700 (PDT)
Received: from lgs.. ([2001:250:5800:1000::f280])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-847f6d82382sm2129385b3a.49.2026.07.05.03.35.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Jul 2026 03:35:15 -0700 (PDT)
From: Guangshuo Li <lgs201920130244@gmail.com>
To: Sudeep Holla <sudeep.holla@kernel.org>,
	Cristian Marussi <cristian.marussi@arm.com>,
	Ulf Hansson <ulfh@kernel.org>,
	Peng Fan <peng.fan@nxp.com>,
	arm-scmi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-pm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Guangshuo Li <lgs201920130244@gmail.com>
Subject: [PATCH] pmdomain: arm: scmi: Check pm_genpd_init() in probe
Date: Sun,  5 Jul 2026 18:32:56 +0800
Message-ID: <20260705103256.284467-1-lgs201920130244@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: arm-scmi@vger.kernel.org
List-Id: <arm-scmi.vger.kernel.org>
List-Subscribe: <mailto:arm-scmi+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:arm-scmi+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

scmi_pm_domain_probe() stores each domain in the onecell domains array
after calling pm_genpd_init(), but it ignores the return value from
pm_genpd_init().

If pm_genpd_init() fails, the genpd has not been added to the global
genpd list. The probe code nevertheless stores the genpd pointer in the
domains array. A later provider registration failure then unwinds the
array with pm_genpd_remove(), which can try to remove a genpd that was
never registered.

Check the return value from pm_genpd_init() and only store successfully
initialized domains in the onecell array. On failure, unwind the domains
that were already initialized.

Fixes: 7458f72cc28f ("pmdomain: arm: scmi: Fix genpd leak on provider registration failure")
Signed-off-by: Guangshuo Li <lgs201920130244@gmail.com>
---
 drivers/pmdomain/arm/scmi_pm_domain.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/pmdomain/arm/scmi_pm_domain.c b/drivers/pmdomain/arm/scmi_pm_domain.c
index 3d73aef21d2f..a60189ea32a8 100644
--- a/drivers/pmdomain/arm/scmi_pm_domain.c
+++ b/drivers/pmdomain/arm/scmi_pm_domain.c
@@ -99,8 +99,12 @@ static int scmi_pm_domain_probe(struct scmi_device *sdev)
 		scmi_pd->genpd.power_on = scmi_pd_power_on;
 		scmi_pd->genpd.flags = GENPD_FLAG_ACTIVE_WAKEUP;
 
-		pm_genpd_init(&scmi_pd->genpd, NULL,
-			      state == SCMI_POWER_STATE_GENERIC_OFF);
+		ret = pm_genpd_init(&scmi_pd->genpd, NULL,
+				    state == SCMI_POWER_STATE_GENERIC_OFF);
+		if (ret) {
+			dev_err_probe(dev, ret, "failed to init domain %d\n", i);
+			goto err_rm_genpds;
+		}
 
 		domains[i] = &scmi_pd->genpd;
 	}
-- 
2.43.0


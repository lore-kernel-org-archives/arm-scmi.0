Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6321E26A0DB
	for <arm-scmi@vger.kernel.org>; Fri,  6 Jun 2025 09:08:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749200893; cv=none; b=LMdcUTUgc3ddaXrdDMp3VY7T5GEKkS0GFWxqb+FFrxEC3OU6e0BOJ1c7IX6fUDdMOh0pvOIHgUaoOYul/IBNFvS3JVELwcaLEPeqjgt541MWQHCs+srBfSByesd7X+TiCwSrde34zhOzQy3Hz6EGzsFu5ZEmdAIHb1qt+fgt2Xk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749200893; c=relaxed/simple;
	bh=ZFnM3PDhFbSJjWsyk0zkU5H5rASBj60HHgmc53ZHy8Y=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:content-type; b=pfAWv1IKZlEYu2ikOtnB6Z5VRktNnmMXiEWacnQbl0koDQMQ4L9CWGXk/heWWIYJqxh308BbdYT1gIsHw75j/n8g09/4xKj4q7QYLx6TgApcSoyBMUKHXY0Wo+z7xvy4IGI0HLv7+Jrme0YkcrmsnrIajwoX1ndD+6SunO4xXH8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-182-Y6JHxpSPPE2nHFsP9pVR-w-1; Fri, 06 Jun 2025 05:08:09 -0400
X-MC-Unique: Y6JHxpSPPE2nHFsP9pVR-w-1
X-Mimecast-MFC-AGG-ID: Y6JHxpSPPE2nHFsP9pVR-w_1749200888
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-450cb8ff0c6so8787185e9.3
        for <arm-scmi@vger.kernel.org>; Fri, 06 Jun 2025 02:08:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749200888; x=1749805688;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zY1UJXwwdXuV/sjsPfipNC1p4dsxIugLMJFfrvt+Ih0=;
        b=qb5hZQOuhsr9YG92PJMr/6ePaLnhIXD9WLtaPn3QK8KLFXtp+ksB36xitNt/Eunndr
         UAoKNHV8TPQX/aoDQEFSw5LhfGb5WlkI1/2xDWndRQlIR5yoQNQUc8TIVx+BeWp9GuSH
         nlgKGwV4vvF+9gpfpxqqsXczND8br34PBxJtP/05OzrI8ErjQLc3N+cqX5ltsL1DYbsS
         Jh1s5VINtlJ5dg6WTh7AbJzFALMn1RcGxfrIw2ixXcyEYYwoK6iVKI1T0DwoC4iYk9Z3
         GCwxODQiuWEh26DGT4zZ0J5EF8Ui/SR8zzW+B5GAC7oXXQI+5YH2O8Gv67ejSb8hPJxL
         +7eA==
X-Forwarded-Encrypted: i=1; AJvYcCW5R15q8vuvKUbap7TQgKpa02uT5AmhHttln5mm6zf1gjkHm2CUeawHKFQDLDRejJZ2h7N5dZ5IKQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz0HcW+vZz/557au/pGK/xdLz1EULvYX64B8kAXXv1x7SfjOdRU
	ISL0evUUKj24LkkB4NVvFAlvPSYmpiy2Y3fgXAT9RA48VjpObMemMYUXEVumsFuQ0R8SmsQOIoZ
	m4msagN9SIE5CbQlVBHTYvByGZswiereBrLc/PK4qybyzdCLdB7fnMjWhwQQe
X-Gm-Gg: ASbGncuyXjHG6OwAzFkeqTSVE+TFFKfF1SaWL4ESKvReJsmzoru7yL3bnnEqW9emkp1
	neYZNtT7g4STwwFaBiMSd1BmB3JfCGNxEH+h39BlJAI+KvHF3qWKsCYOLACqHe+fv36uMdKA091
	xCf08JoTwvWy/3A+R8bCTzLOdT+SnCiCJNBlPjVHXrJ7xGhRS1uoEndZfQFk9EPpSKoGcyEXIVy
	N8vudGMKO8dzMmZQnndVlWOJ0Sn0k0wVF05cSiwlyz+P6tnbNgAcyu8K4XzeSXeKTUGc2ctX4HD
	tY0LI1OjUJeNLXmYlX4fP28ALJJ9OTrFfuzTUpgpQ0RMNpspWPArx/QloIwRanfj6UsV
X-Received: by 2002:a05:600c:b86:b0:450:cd25:e68f with SMTP id 5b1f17b1804b1-452014e9325mr24877455e9.27.1749200887745;
        Fri, 06 Jun 2025 02:08:07 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGFgCfJhv5D4WKiJLVPtf7WFxx5mFScPGVIDDWdSB4TB7uCI+iacBtSoT4d2UV7tlwIeLe0gg==
X-Received: by 2002:a05:600c:b86:b0:450:cd25:e68f with SMTP id 5b1f17b1804b1-452014e9325mr24877175e9.27.1749200887316;
        Fri, 06 Jun 2025 02:08:07 -0700 (PDT)
Received: from lbulwahn-thinkpadx1carbongen9.rmtde.csb ([2a02:810d:7e01:ef00:b52:2ad9:f357:f709])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-452137290b9sm17000835e9.34.2025.06.06.02.08.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Jun 2025 02:08:06 -0700 (PDT)
From: Lukas Bulwahn <lbulwahn@redhat.com>
X-Google-Original-From: Lukas Bulwahn <lukas.bulwahn@redhat.com>
To: Sudeep Holla <sudeep.holla@arm.com>,
	Cristian Marussi <cristian.marussi@arm.com>,
	Ulf Hansson <ulf.hansson@linaro.org>,
	arm-scmi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-pm@vger.kernel.org
Cc: Javier Martinez Canillas <javierm@redhat.com>,
	kernel-janitors@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Lukas Bulwahn <lukas.bulwahn@redhat.com>
Subject: [PATCH] pmdomain: arm: scmi_pm_domain: remove code clutter
Date: Fri,  6 Jun 2025 11:08:02 +0200
Message-ID: <20250606090802.597504-1-lukas.bulwahn@redhat.com>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: arm-scmi@vger.kernel.org
List-Id: <arm-scmi.vger.kernel.org>
List-Subscribe: <mailto:arm-scmi+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:arm-scmi+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: cHEgn2S0PRIS2j17UDoLLTHeU7so8qeb00DGdLam63g_1749200888
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true

From: Lukas Bulwahn <lukas.bulwahn@redhat.com>

There is no need to introduce the boolean power_on to select the constant
value for state. Simply pass the value for state as argument. Just remove
this code clutter.

No functional change.

Signed-off-by: Lukas Bulwahn <lukas.bulwahn@redhat.com>
---
 drivers/pmdomain/arm/scmi_pm_domain.c | 12 +++---------
 1 file changed, 3 insertions(+), 9 deletions(-)

diff --git a/drivers/pmdomain/arm/scmi_pm_domain.c b/drivers/pmdomain/arm/scmi_pm_domain.c
index 2a213c218126..8fe1c0a501c9 100644
--- a/drivers/pmdomain/arm/scmi_pm_domain.c
+++ b/drivers/pmdomain/arm/scmi_pm_domain.c
@@ -22,27 +22,21 @@ struct scmi_pm_domain {
 
 #define to_scmi_pd(gpd) container_of(gpd, struct scmi_pm_domain, genpd)
 
-static int scmi_pd_power(struct generic_pm_domain *domain, bool power_on)
+static int scmi_pd_power(struct generic_pm_domain *domain, u32 state)
 {
-	u32 state;
 	struct scmi_pm_domain *pd = to_scmi_pd(domain);
 
-	if (power_on)
-		state = SCMI_POWER_STATE_GENERIC_ON;
-	else
-		state = SCMI_POWER_STATE_GENERIC_OFF;
-
 	return power_ops->state_set(pd->ph, pd->domain, state);
 }
 
 static int scmi_pd_power_on(struct generic_pm_domain *domain)
 {
-	return scmi_pd_power(domain, true);
+	return scmi_pd_power(domain, SCMI_POWER_STATE_GENERIC_ON);
 }
 
 static int scmi_pd_power_off(struct generic_pm_domain *domain)
 {
-	return scmi_pd_power(domain, false);
+	return scmi_pd_power(domain, SCMI_POWER_STATE_GENERIC_OFF);
 }
 
 static int scmi_pm_domain_probe(struct scmi_device *sdev)
-- 
2.49.0


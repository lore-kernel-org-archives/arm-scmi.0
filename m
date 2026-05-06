Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B703253F13
	for <arm-scmi@vger.kernel.org>; Wed,  6 May 2026 00:50:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778028660; cv=none; b=XxSp3l5Rg56Hv/N4KxPfPFzzr5Uno4PAFM81zwAf9ZMcPtzWdpOY6uxHU/uf49I6yEf0xDxaPUXYVjuL2BXvmdlsvYJr1W1E9a9PeHWeG+G/JW8AYT2HspcFD5N8SziV2Mnt9rWm9TgUeBCZfOG9QHfVeAZHUIwc+JgNgbTNQj0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778028660; c=relaxed/simple;
	bh=uUN1TpCq5A1biDW7SQgzXIgDhMit0DTFvaH+q74KNes=;
	h=From:Date:Subject:MIME-Version:Message-Id:References:In-Reply-To:
	 To:Cc:Content-Type; b=cpzK1fi5+LzNIjpnK99Uvl+9uQGGkqjZsoATQ2B7ZUR2vfQf9yBBH8gu7yC2ejCGCBwk1Lo0KblSECDcP7wI+blexvFVLBPAglAYo9/ADeqeFr9rfs5sK19UhFnIQ4fZ8caFhiSAy4mXW27RyY8CW9feuADS3foGI5wN5YP5GI4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=EYXz6jBW; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="EYXz6jBW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1778028654;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=c1NS3MB4nA8GhCODr9+c9hyS+UbNOcqm6SUmib9q3KY=;
	b=EYXz6jBW4Lq1Jk7z5SK3t82J/RT8wtag9yjozWKW8nOKWZR8kH3Zwmol72DAICQL53VQiw
	4SC25shZvYhoHGaIykTOvKruTQc/U3fKakpyxTXjbWribVCF6Ij/+BVcCfIPr/ApcwfXQY
	udgADd4FgKyeC9ALR6SmdEssRbgqF0s=
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-28-N37XBEHOPYGW__N6_f9boQ-1; Tue, 05 May 2026 20:50:53 -0400
X-MC-Unique: N37XBEHOPYGW__N6_f9boQ-1
X-Mimecast-MFC-AGG-ID: N37XBEHOPYGW__N6_f9boQ_1778028653
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-8bc5ab12bb5so4394066d6.3
        for <arm-scmi@vger.kernel.org>; Tue, 05 May 2026 17:50:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778028653; x=1778633453;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=c1NS3MB4nA8GhCODr9+c9hyS+UbNOcqm6SUmib9q3KY=;
        b=pYz3bzOknwdyfFkEMVp8EwrSyDuikCrRO2rGdKh2y00hk0z1JjRTn7AcycvUTGlIWo
         YyefEoq1rMXVocxygK31Orok2HyPRInSY3cMguR4HNJ88ejhBnVta+nFQpOn7BfT5qPV
         PulHJZoCfim7jHL2IONhtf6uteVkAmGyAeetpLqkNvo8yV6ql/cIExMkSNUzGbZ5wCQ2
         MThLeDY75cXu7ILlknfir908mgkQBqVgkphhzvqUSi+6J5HOrWTIE1R6/YFoUvXrxQTl
         xmkYMGQ9qPivxxddNooNeuYH4Vk6a7JLooocMVCbtuqwekTgqb9i4WBNQGbWlidjC02l
         EXkA==
X-Forwarded-Encrypted: i=1; AFNElJ/J/CKJ2QFt75jJsg1SjuxWq/zbGS18cIrK8OHL5vSFHOiDkW0eNWNs/UMaTSqbAzBPAghMLP5V3w==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw6dBLa2LKIXRVHlAtxRfziQwv5/jYc6Q8xUTaG7c8ILkIE3M5f
	97TWDASG5ezlAKxJFXOhF3mxcaI0QPqekAvCf9CBcO9pQY+dtxzr8ujwYdA9/XqtnjJ9emY0h0T
	cNHu4j+yqBheDyy1MMPpJIeyJb6IY3UhjRrgGKq77fX4jUkRetCMIcAiCrfjo
X-Gm-Gg: AeBDieuKd61zKrqmBDhuQIGnvPbDixQg5w9BIoQTP7/FPsA0Fa+6goY6Rd/8s0it/X4
	NozAt3urI15W9wgTLADzWTyJ+IBOObcFA9kkBCi+yKhFl9JqzCjKaPR6Oy9qIg9zVwidSyo9sYb
	us7T2iQ/J2k45VJq65rnoM5SnvyLepOBDdhNjAJi9A+SGxPxIPu80fsM4FmhkMbipnFwIkxwS/4
	HlDZfnLegppE1KCZxgSuEhxj3YffU95FjmgZXw20B8N+jHzyhdzTapezF8+rm92mfU0rf5Ux+Ur
	MCysqtvbdOreS0sbvqKq5WUUHeyBlxCx8gFL4X2jn/8DeTfhdm/RSVpBFkx+MeBdWAWartK8PAW
	rNjgh8ZYMeQMV7ZV/2H3HikdcxNzVONMsUOHcDFzVWCTO2mxHQPU/2fAEuSqqpeEi+Yx2QWYG
X-Received: by 2002:a05:620a:1a19:b0:8e4:ebbb:b162 with SMTP id af79cd13be357-904d3eac012mr213947585a.9.1778028653003;
        Tue, 05 May 2026 17:50:53 -0700 (PDT)
X-Received: by 2002:a05:620a:1a19:b0:8e4:ebbb:b162 with SMTP id af79cd13be357-904d3eac012mr213944785a.9.1778028652575;
        Tue, 05 May 2026 17:50:52 -0700 (PDT)
Received: from [192.168.1.15] (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8fc2c91fb3bsm1464933385a.41.2026.05.05.17.50.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 May 2026 17:50:51 -0700 (PDT)
From: Brian Masney <bmasney@redhat.com>
Date: Tue, 05 May 2026 20:49:07 -0400
Subject: [PATCH v3 11/15] clk: scpi: use clk_determine_rate_noop()
Precedence: bulk
X-Mailing-List: arm-scmi@vger.kernel.org
List-Id: <arm-scmi.vger.kernel.org>
List-Subscribe: <mailto:arm-scmi+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:arm-scmi+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Message-Id: <20260505-clk-determine-rate-noop-v3-11-f3f829fbacdf@redhat.com>
References: <20260505-clk-determine-rate-noop-v3-0-f3f829fbacdf@redhat.com>
In-Reply-To: <20260505-clk-determine-rate-noop-v3-0-f3f829fbacdf@redhat.com>
To: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>
Cc: linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Sudeep Holla <sudeep.holla@kernel.org>, 
 Cristian Marussi <cristian.marussi@arm.com>, arm-scmi@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1722; i=bmasney@redhat.com;
 s=20250903; h=from:subject:message-id;
 bh=uUN1TpCq5A1biDW7SQgzXIgDhMit0DTFvaH+q74KNes=;
 b=owGbwMvMwCW2/dJd9di6A+2Mp9WSGDJ/TfC5ocugJFak4SEcpDV3dvLfRGGpIu3MTFEVqeJSh
 akmFy50lLIwiHExyIopsizJNSqISF1le++OJgvMHFYmkCEMXJwCMJH+uYwMHwyW3E489X77H/ne
 hbXsFi63otiCTsoUrXPOEE7VCp5TwfBPT26bDlto571A73XFyXvmZoiofOlws9J2ncPJ/N+x4DM
 PAA==
X-Developer-Key: i=bmasney@redhat.com; a=openpgp;
 fpr=A46D32705865AA3DDEDC2904B7D2DD275D7EC087
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: n-H7pkhU-pRK2L9Dc-0IGjULlIrHw9twe4IGvQ88sIk_1778028653
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit

Drop the driver-specific empty determine_rate() function and use the new
shared clk_determine_rate_noop() helper.

Signed-off-by: Brian Masney <bmasney@redhat.com>
---
To: Sudeep Holla <sudeep.holla@kernel.org>
To: Michael Turquette <mturquette@baylibre.com>
To: Stephen Boyd <sboyd@kernel.org>
Cc: Cristian Marussi <cristian.marussi@arm.com>
Cc: Brian Masney <bmasney@redhat.com>
Cc: arm-scmi@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-clk@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
---
 drivers/clk/clk-scpi.c | 14 +-------------
 1 file changed, 1 insertion(+), 13 deletions(-)

diff --git a/drivers/clk/clk-scpi.c b/drivers/clk/clk-scpi.c
index 7806569cd0d5..650c85aa0328 100644
--- a/drivers/clk/clk-scpi.c
+++ b/drivers/clk/clk-scpi.c
@@ -32,18 +32,6 @@ static unsigned long scpi_clk_recalc_rate(struct clk_hw *hw,
 	return clk->scpi_ops->clk_get_val(clk->id);
 }
 
-static int scpi_clk_determine_rate(struct clk_hw *hw,
-				   struct clk_rate_request *req)
-{
-	/*
-	 * We can't figure out what rate it will be, so just return the
-	 * rate back to the caller. scpi_clk_recalc_rate() will be called
-	 * after the rate is set and we'll know what rate the clock is
-	 * running at then.
-	 */
-	return 0;
-}
-
 static int scpi_clk_set_rate(struct clk_hw *hw, unsigned long rate,
 			     unsigned long parent_rate)
 {
@@ -54,7 +42,7 @@ static int scpi_clk_set_rate(struct clk_hw *hw, unsigned long rate,
 
 static const struct clk_ops scpi_clk_ops = {
 	.recalc_rate = scpi_clk_recalc_rate,
-	.determine_rate = scpi_clk_determine_rate,
+	.determine_rate = clk_determine_rate_noop,
 	.set_rate = scpi_clk_set_rate,
 };
 

-- 
2.54.0


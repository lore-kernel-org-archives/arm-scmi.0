Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 557F53ACA7D
	for <arm-scmi@vger.kernel.org>; Thu, 26 Feb 2026 18:17:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772129872; cv=none; b=K53jXIS05Jowul4Xi273TWB+oHmhthAlKz+PZvao7itixuAhiV5DfT0vlZgkqsPTEHvv9mVSi/vNS8NTlss5/MG8YYBo90UJjb/xhbDWU1xdMy+6NEqcTmcQPT1YU++QeR06bCPlO1oLjqGlyGnK0Nfh2E7e4Np134vO3dzfGzc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772129872; c=relaxed/simple;
	bh=CpmJIm1mi9VsZ5KOMr74w38LszgghieeQIGldzTUnSM=;
	h=From:Date:Subject:MIME-Version:Message-Id:References:In-Reply-To:
	 To:Cc:Content-Type; b=dqDqfNj9lFELw9iFb6Q/2mqd3rv4i+sckEA4/MqVJ2YAjQTf47FUp8ZrusjpPWKE1XnjYOPKpy/oiZ4Wu8kWyQRFsmp8R6VpBk1eeDNPrmUt+sNSciZ4A7Pt85R6kHPCNGa5WXSd0oUGf778bzfzR1eXvs6xEFPQGO+WpqAMyW4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=XOydv2Br; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="XOydv2Br"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1772129870;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=GOmhS+CGJJS73EIAbtnehSXz+HvsF0X0dYkIrrZ/tRc=;
	b=XOydv2Br5U8X45X9Lc8aFaMv9/Zv3gNr8KyYub8p8PandJobXP1sidmbuAW66J8uWcaKNR
	F1uhVY3ggYmCgLrw2SWMX4avYzqbvu8tnnlyoT3GFqDJw1hW5aV7cehglSr93ghbrnpuMj
	49nGxEUbyCGyOevO8FCdqjU6mCUg2R8=
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-397-WR5hyxCHMcGk_0PbaymlOg-1; Thu, 26 Feb 2026 13:17:49 -0500
X-MC-Unique: WR5hyxCHMcGk_0PbaymlOg-1
X-Mimecast-MFC-AGG-ID: WR5hyxCHMcGk_0PbaymlOg_1772129869
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-506ab115571so55411991cf.0
        for <arm-scmi@vger.kernel.org>; Thu, 26 Feb 2026 10:17:49 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772129869; x=1772734669;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=GOmhS+CGJJS73EIAbtnehSXz+HvsF0X0dYkIrrZ/tRc=;
        b=QrxHj4awdyfiCw6QdnAEA03V9Lk6itG36OS5RxAq0zpklhECt50A5a/UjMw3G9P3y7
         4hpb8JEQ7c8Byy8cfskLdpYMXiYrujfB2nWiQ84SsrhnFMhQVq8eRxO/3x75ANXvS4qo
         YN9Zspcj6/6JS84Qezb9mSFBFlyKnO+6sk7yL8JkXBbcJxGtITa5GwA1iJMbgIbybnjj
         Ng/EkU8Vcv4qLTpcOP/dtdiiKK3DK8FooA6/stq8WIf+ZBQrRTRqASO/SYWRuZmQV8gu
         zD/BbhECs30ZHeNrxFuQ3mQN3AAfftz1ArwBibNiggq1yWm7OLpErk+yUJIUWwKqW8ux
         4anw==
X-Forwarded-Encrypted: i=1; AJvYcCWefe9RzOzLUKXTMsDFyH05HpDO3iCUJYkU9+qNLiCmy4JiMz7vxiTj3/JGdpIHJS0P+iRNwKuwWg==@vger.kernel.org
X-Gm-Message-State: AOJu0YwXvQ6Skxc2991ERUg8XIwtW4KzePFI9XhdDZ8UB/N1O6biX3T2
	xu5IYvxsjr7O4XRSVsKESiV7n26IOD/9zM/BjR+jCNyyNyBm9OBuptbT4nP6tfltHOl5nbre2mM
	GknLwv5hA0jb4Psf/ZUTUvijC+2vmp6vcQkoFMUEJhnmDJT3bxgM/jOeBZt4A
X-Gm-Gg: ATEYQzxYiayT+17wzC/VaFlCr9nDhlbK7Zz+2Y+kTpERc7HHVuu18XFt/utMuq03FbF
	qnEvHkQfp6aZCoc0BvaKdp1YX9lCEKCoHjEhMBFxFhu5ld4kYNzYQU4qvlMPaI6b0on0MkjE5US
	EYGSatX6DGQKd0lv8FFzrohyC0+iCXCR65eb92HWaSeAl7IrD9wvvLv4RNO8Ap/EkQWZK54Dwi+
	ycIt3mcHQLX7rGmXooRLhUo2+PpUX+fSSPIkJ/aKQOA7vhvfSoqxqROl4WKZYtJ5et6Pt3Syaw9
	F0vnWD4BDhwRdtQHwnowBiBc9QRDQz4UoDjY5ivSNoKATP/wBRtT+QLbxpHNGd7GgNioDl4tR75
	K/lvXVZK8WPZ+tq9WgFiB5/+4yPJFtq+OGbWGj+t77f1A55SpAkwoq6yH2QUW
X-Received: by 2002:a05:620a:164e:b0:8cb:b062:c2ec with SMTP id af79cd13be357-8cbb062c85fmr990471485a.29.1772129868733;
        Thu, 26 Feb 2026 10:17:48 -0800 (PST)
X-Received: by 2002:a05:620a:164e:b0:8cb:b062:c2ec with SMTP id af79cd13be357-8cbb062c85fmr990466885a.29.1772129868100;
        Thu, 26 Feb 2026 10:17:48 -0800 (PST)
Received: from [192.168.1.3] (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8cbbf717f2bsm247046685a.35.2026.02.26.10.17.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Feb 2026 10:17:47 -0800 (PST)
From: Brian Masney <bmasney@redhat.com>
Date: Thu, 26 Feb 2026 13:16:48 -0500
Subject: [PATCH 04/13] clk: scpi: drop determine_rate op and use
 CLK_ROUNDING_FW_MANAGED flag
Precedence: bulk
X-Mailing-List: arm-scmi@vger.kernel.org
List-Id: <arm-scmi.vger.kernel.org>
List-Subscribe: <mailto:arm-scmi+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:arm-scmi+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Message-Id: <20260226-clk-det-rate-fw-managed-v1-4-4421dd2f6dc6@redhat.com>
References: <20260226-clk-det-rate-fw-managed-v1-0-4421dd2f6dc6@redhat.com>
In-Reply-To: <20260226-clk-det-rate-fw-managed-v1-0-4421dd2f6dc6@redhat.com>
To: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>
Cc: linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Brian Masney <bmasney@redhat.com>, Sudeep Holla <sudeep.holla@kernel.org>, 
 Cristian Marussi <cristian.marussi@arm.com>, arm-scmi@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2044; i=bmasney@redhat.com;
 s=20250903; h=from:subject:message-id;
 bh=CpmJIm1mi9VsZ5KOMr74w38LszgghieeQIGldzTUnSM=;
 b=owGbwMvMwCW2/dJd9di6A+2Mp9WSGDIX9OmaTY/j2/LluciBDxLHnnZV2+cV6rya8nT+wUhNm
 8mck7f+7ShlYRDjYpAVU2RZkmtUEJG6yvbeHU0WmDmsTCBDGLg4BWAiCkGMDHsyV548kKK/+d/G
 rPzbZkYRu8+qJHdNvc+Uo71x+qS2pUsY/tmXrv/TMn2SjkDwfJ+i5FrlCqZ0yYb2RuOVMzL3q19
 6wQQA
X-Developer-Key: i=bmasney@redhat.com; a=openpgp;
 fpr=A46D32705865AA3DDEDC2904B7D2DD275D7EC087
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: X3O8oextTtBLRNt2r8o4qJT3fSJ_VJHe-EsI8FJDc18_1772129869
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit

This clk driver has a noop determine_rate clk op. Drop this empty
function, and enable the CLK_ROUNDING_FW_MANAGED flag.

Signed-off-by: Brian Masney <bmasney@redhat.com>

---
To: Sudeep Holla <sudeep.holla@kernel.org>
To: Michael Turquette <mturquette@baylibre.com>
To: Stephen Boyd <sboyd@kernel.org>
Cc: Cristian Marussi <cristian.marussi@arm.com>
Cc: arm-scmi@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-clk@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
---
 drivers/clk/clk-scpi.c | 14 +-------------
 1 file changed, 1 insertion(+), 13 deletions(-)

diff --git a/drivers/clk/clk-scpi.c b/drivers/clk/clk-scpi.c
index 7806569cd0d5c4e32700edb10e4edf2185610a81..e13f09cfadc70551c3c7955538e5a212fb0601a3 100644
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
@@ -54,7 +42,6 @@ static int scpi_clk_set_rate(struct clk_hw *hw, unsigned long rate,
 
 static const struct clk_ops scpi_clk_ops = {
 	.recalc_rate = scpi_clk_recalc_rate,
-	.determine_rate = scpi_clk_determine_rate,
 	.set_rate = scpi_clk_set_rate,
 };
 
@@ -156,6 +143,7 @@ scpi_clk_ops_init(struct device *dev, const struct of_device_id *match,
 		if (IS_ERR(sclk->info))
 			return PTR_ERR(sclk->info);
 	} else if (init.ops == &scpi_clk_ops) {
+		init.flags |= CLK_ROUNDING_FW_MANAGED;
 		if (sclk->scpi_ops->clk_get_range(sclk->id, &min, &max) || !max)
 			return -EINVAL;
 	} else {

-- 
2.53.0


Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1831D304968
	for <arm-scmi@vger.kernel.org>; Wed, 27 Aug 2025 17:12:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756314756; cv=none; b=NUMSnpkdJH8bTdrtWPAASoJS3htRu05qhk+ZJPppmcYg3tLecdhTOLxsacr1sHa4V0BJ+Rj1hiFhAvDeBHpr3DbyPRDzTK8CyTiFuOkohEduBTk7pw7eRAP2WgIsaMSzAxZFAkcNE8yQSAOEnc2GepbxT51QKw2k40PmmFq3uko=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756314756; c=relaxed/simple;
	bh=ocvtdTl2hOZOQ/4oos7E0kZJWuxHuy23o8Wb53TCSIg=;
	h=From:Date:Subject:MIME-Version:Message-Id:To:Cc:Content-Type; b=XRCww4k4GXDNDNpRIpJtkdSELYoNliuy8ywDor+iBj/E9QimR1l0oaqrGuX89aM7+hkZDPwHUPspvEcjeJfenXTHgtsb0R7BCqPApjAvRXJOZMv7V5/2r7Fe0SxO3/33KDQMM/ui6W/J2nhZpB0U6DjIxgeAlS/pCpY1rrSH8CE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=h+ECRG5J; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="h+ECRG5J"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1756314754;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=UBRt2ellMgrU2jWQCq6P6WpGbiIdthsHZnAXPTIGBXY=;
	b=h+ECRG5JEiSf7ewpoq0Q6VmCg8HJdxM5TcJF9Fq1mGgcJ/HqKJpFEXmS86bAMvNiMfM+E5
	DvSACH05VUTkiAK3OJ7MrvdLgrzfU3g0bMpyI0aKWBTbuBtP36sJxP7fhSCdJrB7R3ALBv
	RcR25giub7SeuqwlyMsBHCrSLT7Z5yA=
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-356-nWyjC4f7Pay_zKIp_1C9Lw-1; Wed, 27 Aug 2025 13:12:32 -0400
X-MC-Unique: nWyjC4f7Pay_zKIp_1C9Lw-1
X-Mimecast-MFC-AGG-ID: nWyjC4f7Pay_zKIp_1C9Lw_1756314751
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-7f7b2d52958so39712985a.2
        for <arm-scmi@vger.kernel.org>; Wed, 27 Aug 2025 10:12:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756314746; x=1756919546;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UBRt2ellMgrU2jWQCq6P6WpGbiIdthsHZnAXPTIGBXY=;
        b=pGmIdruetTMc4J/dQmpI7Jx7Ox/tvYmeVlv2DHy0cTGeolOL7mNmsqrfKcVbyXLNDp
         rwfQzn5pfcdx0KL8dRYIoeXvexCRt04610jwWWkThu6Qq07TS6s09KypEbZZQutaDGwF
         ciQ5gM3Z71c+PSUWmGnSRyRWDtHp/JxqUC9xWbMWsyUV3435zBPTDNW/ytX5eYzDpYsR
         vr7gbvrgDhgy3s52kr9TMXRel44YwmTzMYwjdRkZeUHal5PIvZcKttTQGy0X3DuFbQ66
         kubz2msMis1D1+eDKHD21v2KR7U4Z6wmuTGCpH0NVDGmGYEGCy6fftqMrfk35ft0m3mo
         TCyA==
X-Gm-Message-State: AOJu0YwrTiv2niHBTbpXygwuj9ALt7zaJbXghr58WwBC/t6zmiWKPrkd
	5rqWEB0qE0gTclySkqoJPh2H0BoneBGubsWj6PjhHgRXoTa/XFViVGIKOzKEQN7t4ZTRPPfpVLE
	WkA9ZLEC7ABVRmc99jiosQz03OeLPs/PItrZuM9FKT/tWeaBW5ND/6mLltGPg
X-Gm-Gg: ASbGncs2seysW3MnOhXB3ONFY6uHgz855cswUykBNpi8BtWevhHoTslcwZdKU+1hClZ
	qdGLjJipnQ2C4Np7pSxn6GlQapCCFELzwC47l/ZwkhG6ce22xPXaTqrA+ROwJPeTigvoyuG3ey4
	c426466mrVBA6W9LjCOmbp4pTFQyv/8BLoYEJQFHxfv95Qf+Cj8MtTRfU9jWJvRzSnLl4YKC/aw
	ni51t9t0AyJ6r8KW/wqafurMPJjkMslpSjJtJvIEEF8+geCajcrjAhBMsIADvWdokDoSWSuxiQ4
	/CzDVmL89XrjjERuBQ3f/PO7rymYZGdsnxwKIpO66NM1tASqQEpbKHu4fVdd3pcBiWOozEBLGTX
	AordU7NFLklsT+FOpGm/yPfzn/jLtWCuR2w==
X-Received: by 2002:a05:620a:1920:b0:7f1:8b22:35b1 with SMTP id af79cd13be357-7f18b2235ecmr1243374885a.83.1756314746330;
        Wed, 27 Aug 2025 10:12:26 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHDHgQzklZ25afIN2UyeYjisBxqH9PGDR2eAcGa4awGEaZEQH/Lm6l47YrGmmWNZAyud13+rQ==
X-Received: by 2002:a05:620a:1920:b0:7f1:8b22:35b1 with SMTP id af79cd13be357-7f18b2235ecmr1243369985a.83.1756314745803;
        Wed, 27 Aug 2025 10:12:25 -0700 (PDT)
Received: from [192.168.1.3] (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7ebf4a1cfe3sm887374785a.75.2025.08.27.10.12.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Aug 2025 10:12:25 -0700 (PDT)
From: Brian Masney <bmasney@redhat.com>
Date: Wed, 27 Aug 2025 13:12:07 -0400
Subject: [PATCH v2] clk: scmi: migrate round_rate() to determine_rate()
Precedence: bulk
X-Mailing-List: arm-scmi@vger.kernel.org
List-Id: <arm-scmi.vger.kernel.org>
List-Subscribe: <mailto:arm-scmi+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:arm-scmi+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Message-Id: <20250827-clk-scmi-round-rate-v2-1-3782a50835ed@redhat.com>
X-B4-Tracking: v=1; b=H4sIAGY8r2gC/x3MTQ5AMBBA4avIrE1SRfxcRSyadjBByRSRiLtrL
 L/Few8EEqYAbfKA0MWBNx+h0wTsZPxIyC4atNKlqnWFdpkx2JVRttM7FHMQVpS7QjVNlhcGYrk
 LDXz/165/3w8ePB4OZQAAAA==
X-Change-ID: 20250827-clk-scmi-round-rate-7e3d4099134a
To: Sudeep Holla <sudeep.holla@arm.com>, 
 Cristian Marussi <cristian.marussi@arm.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>
Cc: arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Brian Masney <bmasney@redhat.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1756314744; l=3344;
 i=bmasney@redhat.com; s=20250528; h=from:subject:message-id;
 bh=ocvtdTl2hOZOQ/4oos7E0kZJWuxHuy23o8Wb53TCSIg=;
 b=EUWRUgkqHWynVd1A4xl577sXaTq1HwLS666cge+27XtKzJ1tgwSvxjvJBVFfBZCaPJJV+FVrZ
 6+ZZlQE6K7YAopYkUFzodxnL2XGOChCHk9zD5shzQ0A1tzFxrW4Fqte
X-Developer-Key: i=bmasney@redhat.com; a=ed25519;
 pk=x20f2BQYftANnik+wvlm4HqLqAlNs/npfVcbhHPOK2U=
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: lWapjDBeuYcQ_nba4DRoK1acmIcPITdLN-pF6rUQX-M_1756314751
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit

This driver implements both the determine_rate() and round_rate() clk
ops, and the round_rate() clk ops is deprecated. When both are defined,
clk_core_determine_round_nolock() from the clk core will only use the
determine_rate() clk ops.

The existing scmi_clk_determine_rate() is a noop implementation that
lets the firmware round the rate as appropriate. Drop the existing
determine_rate implementation and convert the existing round_rate()
implementation over to determine_rate().

scmi_clk_determine_rate() was added recently when the clock parent
support was added, so it's not expected that this change will regress
anything.

Signed-off-by: Brian Masney <bmasney@redhat.com>
---
Changes since v1:
- Split out individual patch from larger v1 114 patch series
- Drop noop determine_rate implementation; convert round_rate
---
 drivers/clk/clk-scmi.c | 35 ++++++++++++++++-------------------
 1 file changed, 16 insertions(+), 19 deletions(-)

diff --git a/drivers/clk/clk-scmi.c b/drivers/clk/clk-scmi.c
index d2408403283fc72f0cf902e65f4c08bcbc7b4b0b..78dd2d9c7cabd18f2a05cffd0408cfefaf34fce0 100644
--- a/drivers/clk/clk-scmi.c
+++ b/drivers/clk/clk-scmi.c
@@ -54,8 +54,8 @@ static unsigned long scmi_clk_recalc_rate(struct clk_hw *hw,
 	return rate;
 }
 
-static long scmi_clk_round_rate(struct clk_hw *hw, unsigned long rate,
-				unsigned long *parent_rate)
+static int scmi_clk_determine_rate(struct clk_hw *hw,
+				   struct clk_rate_request *req)
 {
 	u64 fmin, fmax, ftmp;
 	struct scmi_clk *clk = to_scmi_clk(hw);
@@ -67,20 +67,27 @@ static long scmi_clk_round_rate(struct clk_hw *hw, unsigned long rate,
 	 * running at then.
 	 */
 	if (clk->info->rate_discrete)
-		return rate;
+		return 0;
 
 	fmin = clk->info->range.min_rate;
 	fmax = clk->info->range.max_rate;
-	if (rate <= fmin)
-		return fmin;
-	else if (rate >= fmax)
-		return fmax;
+	if (req->rate <= fmin) {
+		req->rate = fmin;
+
+		return 0;
+	} else if (req->rate >= fmax) {
+		req->rate = fmax;
 
-	ftmp = rate - fmin;
+		return 0;
+	}
+
+	ftmp = req->rate - fmin;
 	ftmp += clk->info->range.step_size - 1; /* to round up */
 	do_div(ftmp, clk->info->range.step_size);
 
-	return ftmp * clk->info->range.step_size + fmin;
+	req->rate = ftmp * clk->info->range.step_size + fmin;
+
+	return 0;
 }
 
 static int scmi_clk_set_rate(struct clk_hw *hw, unsigned long rate,
@@ -119,15 +126,6 @@ static u8 scmi_clk_get_parent(struct clk_hw *hw)
 	return p_idx;
 }
 
-static int scmi_clk_determine_rate(struct clk_hw *hw, struct clk_rate_request *req)
-{
-	/*
-	 * Suppose all the requested rates are supported, and let firmware
-	 * to handle the left work.
-	 */
-	return 0;
-}
-
 static int scmi_clk_enable(struct clk_hw *hw)
 {
 	struct scmi_clk *clk = to_scmi_clk(hw);
@@ -300,7 +298,6 @@ scmi_clk_ops_alloc(struct device *dev, unsigned long feats_key)
 
 	/* Rate ops */
 	ops->recalc_rate = scmi_clk_recalc_rate;
-	ops->round_rate = scmi_clk_round_rate;
 	ops->determine_rate = scmi_clk_determine_rate;
 	if (feats_key & BIT(SCMI_CLK_RATE_CTRL_SUPPORTED))
 		ops->set_rate = scmi_clk_set_rate;

---
base-commit: 3c642997252eef4449cb6b6e02af3dc22515d817
change-id: 20250827-clk-scmi-round-rate-7e3d4099134a

Best regards,
-- 
Brian Masney <bmasney@redhat.com>


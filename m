Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B5173D3CFC
	for <arm-scmi@vger.kernel.org>; Mon,  9 Mar 2026 14:39:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773067175; cv=none; b=PjIZFhYibKSC6mgZbKuCuUGkGh0xRxkJ5p/BEBwpC6t+31ncDsi8n5jTdy1t3wqhOmEf3aCP0Wj7gbg0DRQEDdHy5yr4vhhXijUk4aa4tE6swmGQTlxuweSkZSNR5jJI9PGefRdHPdO0V+UyeyjLnQlXIHj7wNMzCM/B0CtFG54=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773067175; c=relaxed/simple;
	bh=tymwA6aOVgvpUXCdRW570073ObBEekDbhvu93ohwWbM=;
	h=From:Date:Subject:MIME-Version:Message-Id:References:In-Reply-To:
	 To:Cc:Content-Type; b=oA7hdLVrwzRHx/AnHRcebU/56nyD4bcqMA81jcvT4ZMtJV9CQI6D/VV5U6vDVEWTto/WjtrvJf3JE2MMuai8tYtRvWIhCME4tXctcl08PmOEZ0c8iCwarwjykvUWsxVwbElVcfw4yczonW8nZxdTMD/PUo8Z8TZhj8TRuUodT8I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=ZE7UZBGP; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="ZE7UZBGP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1773067170;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=TKRdIQSuF0YF0hFHlaN5osUy3+6J9BqzDRRtNXtYusM=;
	b=ZE7UZBGPKD+sCWlT4D1+hJWPF3rk0Ka13UI+m4G4DuRP3DHMv08DLs2uOtgrTXezLPV5ad
	ht2Zr2Uwvm9Z98IUZuzzvZmvRvW44OOWEQaxfVbfF6L2SIIT2+4Ly6iUOvgglCWYJHjbKt
	3qP12pEH8scOw7kKzn0Xad7hAc3bSzY=
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-631-etsC1nv3P-2_VrkhmBCWBw-1; Mon, 09 Mar 2026 10:39:29 -0400
X-MC-Unique: etsC1nv3P-2_VrkhmBCWBw-1
X-Mimecast-MFC-AGG-ID: etsC1nv3P-2_VrkhmBCWBw_1773067169
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8cd7c4ab845so768272485a.1
        for <arm-scmi@vger.kernel.org>; Mon, 09 Mar 2026 07:39:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773067169; x=1773671969;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=TKRdIQSuF0YF0hFHlaN5osUy3+6J9BqzDRRtNXtYusM=;
        b=gQaQFgKoql3qopz1KweXKpQOzv44ASFC47Vs6HQUnJFGEGSDl/uUPP4CfhJ87ym8dU
         qElwlmLNqIXqlKZubX4qtzXJHFQGHqiPvIOkwWGwmpfqCQne+5AvCh7BKO3LuCKxP8VS
         AHQxxDTMeCNDu108bon3aiGqtJL2auJWPGdcaYMHyuv0YB2LgAF3rSA8sZVRx1L7g39t
         BL+K+mCHRxGJJ2jTzNLoFzbqjsXnurl++BKzdi5Lo6nhY8gAMMXSJ2WMHpVB07ohcs1F
         QWVj4EmSVHs62qND0PbfRPQZ8kHbqKHw7nEtAU0tI/naGUJTsnpXYhejp9z64zGhHqY4
         qhxg==
X-Forwarded-Encrypted: i=1; AJvYcCVwrc54HbnO+q/T2zdrgATLanjbWG1ootxw4ncUNiZ013EYAs4qFsxxGRDLu65hh28UjgX61YHbWg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yxen2xc+rdJgjI2WC1vj5Hr1rqQVbAkPLmqyvvgk5tMwB/QL/k7
	mtPXbzPbVcOxhjf/UKTrO5FMpX5aTU6k9JFNNX3bYJQSn9vih0ivpYGau8LHZ5qO4mDcDh+nOqM
	N28TK69/6olgxOJdksCjf7prBDIuzS/XVvE40NbVxiY5MXyNn6c70rB+EDUEx
X-Gm-Gg: ATEYQzw1nQ15iaDjEy6ohsw8gFIaDiCsU/Yg1oY5rpySLN2VMJlBJ7UWYv+FzIvK8qA
	Q+2H6UQfBAHhREw5YJrTHo6dq+LKLI4xfjoDz33JGcXFRVLLZ+l4okLG7UJvcXUspWJDNoWqShV
	EqAGxqTTk5S3dde9YFHx+i1MWhLKXCaAf543mLBEITZIRPZYnx8UeF90WQvb3aqFCTjcox+ZaqO
	bJLGCVvwZ2QAWEWybKfsr6NXScfSCZdqZOGc2wEkKgZYob+8v7Pt8SxAqKMsRaKnfU0bIyohjcO
	6M1FFJes+yVRhTNxoXhNP4qGF3Ljfh5/O3qRjXJePLNCSZ3Ip4OgKMAJPkNii8hpBuqdUCl5TAf
	/1htQEjznFkn47gKvYFstkcT+REp6XGWjFvJ2mej/kFABS8cOT66o5G+Wf5NMtg==
X-Received: by 2002:a05:620a:3726:b0:8cd:91f5:7a10 with SMTP id af79cd13be357-8cd91f57b74mr118055685a.82.1773067168708;
        Mon, 09 Mar 2026 07:39:28 -0700 (PDT)
X-Received: by 2002:a05:620a:3726:b0:8cd:91f5:7a10 with SMTP id af79cd13be357-8cd91f57b74mr118051085a.82.1773067168174;
        Mon, 09 Mar 2026 07:39:28 -0700 (PDT)
Received: from [192.168.1.15] (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8cd6f49fcafsm756064985a.16.2026.03.09.07.39.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Mar 2026 07:39:27 -0700 (PDT)
From: Brian Masney <bmasney@redhat.com>
Date: Mon, 09 Mar 2026 10:38:43 -0400
Subject: [PATCH v2 04/12] clk: scpi: drop determine_rate op and use
 CLK_ROUNDING_NOOP flag
Precedence: bulk
X-Mailing-List: arm-scmi@vger.kernel.org
List-Id: <arm-scmi.vger.kernel.org>
List-Subscribe: <mailto:arm-scmi+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:arm-scmi+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Message-Id: <20260309-clk-det-rate-fw-managed-v2-4-c48ef5a3100a@redhat.com>
References: <20260309-clk-det-rate-fw-managed-v2-0-c48ef5a3100a@redhat.com>
In-Reply-To: <20260309-clk-det-rate-fw-managed-v2-0-c48ef5a3100a@redhat.com>
To: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>
Cc: linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Brian Masney <bmasney@redhat.com>, Sudeep Holla <sudeep.holla@kernel.org>, 
 Cristian Marussi <cristian.marussi@arm.com>, arm-scmi@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2083; i=bmasney@redhat.com;
 s=20250903; h=from:subject:message-id;
 bh=tymwA6aOVgvpUXCdRW570073ObBEekDbhvu93ohwWbM=;
 b=owGbwMvMwCW2/dJd9di6A+2Mp9WSGDLX3e7f+/+TCVedu1DA7rYTEY2FXtOcK9p1t8meYGKJ2
 n9KUbGro5SFQYyLQVZMkWVJrlFBROoq23t3NFlg5rAygQxh4OIUgIkUBzP8zwtgvM55yW21VvxW
 OyX2HX1rfHZu1pnevWm2S/f73nruSEaGSbcXxbmu3RHcpZyvUcPbfzpy2UenzFkTc27vK9mxVvU
 mIwA=
X-Developer-Key: i=bmasney@redhat.com; a=openpgp;
 fpr=A46D32705865AA3DDEDC2904B7D2DD275D7EC087
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: jAWmNBRLIkB5OHHolth5SigAc-6cCeHc30K9EAmb34s_1773067169
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit

This clk driver has a noop determine_rate clk op. Drop this empty
function, and enable the CLK_ROUNDING_NOOP flag.

Reviewed-by: Sudeep Holla <sudeep.holla@kernel.org>
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
index 7806569cd0d5c4e32700edb10e4edf2185610a81..f5d0234ad4ad77e4333613139a8ee034b949d01f 100644
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
+		init.flags |= CLK_ROUNDING_NOOP;
 		if (sclk->scpi_ops->clk_get_range(sclk->id, &min, &max) || !max)
 			return -EINVAL;
 	} else {

-- 
2.53.0


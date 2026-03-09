Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FFD93D34A1
	for <arm-scmi@vger.kernel.org>; Mon,  9 Mar 2026 14:39:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773067172; cv=none; b=R4J523UdChWMBMSF3G8btVldXcj9700Lkohbcp08P8Nu3le+uW3cWH3UzX8FJsXTiuASmgjA/1dDUKnGHgPGNc+FysaMWsGz5xmN1rtrPOI+VR08LF8QGXK76MYKh6iOoLKDUKin20dU55pB2RzXRmu4xecz1ylqGVDXbkga/5Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773067172; c=relaxed/simple;
	bh=cs+bYMwjQyeXRJYn9Ukf0L0Sx16lkh8uvsSX1xdWPjk=;
	h=From:Date:Subject:MIME-Version:Message-Id:References:In-Reply-To:
	 To:Cc:Content-Type; b=gSPKORW4zCDaafNdXwkB4MvLZss5tAvZb3MYMBC92uxB5F0Fx74HIYgknza2a6uK8K00P9vrvkb/K8Q258JcAo0Dwz5+GHdBfaWmmU+lME4Q4Gl69zncAi6jCpVpJoiH+a6tpFFQ0SeJEN2rjpeaGe7Mbr1KwTZjKUP4xsC4gZI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=d0ZvANtV; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="d0ZvANtV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1773067168;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=5awK10415MrJyZgxJIpgfvMNalFSl2XKXr9RBN9IsuA=;
	b=d0ZvANtVEDHDqAVaLNkV7Ia09kXiu6CUwFCj60feEGw2WrGFMDH2VExZSfN4vAYzctfif4
	U6b3dCnreec4bEUNNF1ylOenNardkIkc2VF5grF/ZHOyDlOEMZSWDdnL6vkRtuM/jgeBOv
	iowhsnYAzYQXNwldi6VU16Ks4sn+47I=
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-690-UR0H9I9WMMO2DcFFB2ynFQ-1; Mon, 09 Mar 2026 10:39:25 -0400
X-MC-Unique: UR0H9I9WMMO2DcFFB2ynFQ-1
X-Mimecast-MFC-AGG-ID: UR0H9I9WMMO2DcFFB2ynFQ_1773067164
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8cd858e8709so1071569685a.3
        for <arm-scmi@vger.kernel.org>; Mon, 09 Mar 2026 07:39:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773067164; x=1773671964;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=5awK10415MrJyZgxJIpgfvMNalFSl2XKXr9RBN9IsuA=;
        b=DWPVfPgmzmknNcb3ZJrEqrpF+r43OIYEKSJphmAue8plYq9eo728BWRR4uQJKj6Jt5
         /UKM5/1A0yE6ibmcjd+XHUhd15HVRK35A6LSpYJJH8q0HbF6Leawba1mqAVOTK7sdccE
         UDhe0+UDLx6VNv7jdNBH5NbWaFXhDcoY5213Xgv2GdXhh+dWoyY0kpG4DpX7pNBwBuY/
         viMawK0faI+2fiiRUPcidYr0cKR1FWDbGMnf+H1T2CvONmLxiVqR3WYHQgn3zhvxN3Em
         wctdJm2+qydgusISrBxO3Mt8XPIe4F+LyD72AqRSQQjefyiDXYii1D/+h1YFHtNz0ZPW
         V/lw==
X-Forwarded-Encrypted: i=1; AJvYcCWuAU9rVRfp5r4Uzt2mwPSX1YWMK9ypoIREtzcNntwSZh1SC0TJyub4oTBYuSQyJ3CiDaVoWcXMVg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz4tJneIABKie/dFfQ2VizlKyBZAV9GoMo2PZRdnv/y/0VblIsp
	VV7d+m6K0w/OdEqLJCgbskC86psvVrPbe8xbLWq8xEeQbmAPjb+Gr3Slt0kY/pC/2OhBa/DaklE
	DHFyJ0z+RfA/aMfEbKhrsfPf9zxq/WU6yutw7mjYodT+DxpdYikFthuctof9t
X-Gm-Gg: ATEYQzy4DwUNRhiiEn0OvjVmOawYxG5SogSdh1j6aHcT1PNRsFMJJ44xUTHdoBn37GO
	znlqAAw4c1vFPyvRy3Vj8cF0e0YWBmO2Bq/5zTQdbtfbQoiN0irndPXP88i6Ho9Bvq8BC0Ca7K1
	fv+y0RmR3TxSg1wUQwXqQUc8FfHrMQuLOBLu0yZofGmoE8+viV3tV4AjcGbG7RJDvkqKn4QuwGA
	IUb8JvY/XVFWe0vInP5LoDt1eGoJFOuB3rfxT49NxaKsqvOJbPy5/nx8pFvjPPlzo64hXVx2mFU
	gJBTWMgmJTOBwQ/+T0127WnhtAVjdAYv+6dR59EO7polU8DhXVtOg0pyIlp9Po6XIiTFOXCWMDt
	Dici67vWVfzLmDU3kZ3bkIJ716fQJC7Q/n5kmDQuUkDhRl3IjR1X5NRcYTKuyjg==
X-Received: by 2002:a05:620a:4004:b0:8cd:9365:f27f with SMTP id af79cd13be357-8cd9365fb75mr10087785a.51.1773067164508;
        Mon, 09 Mar 2026 07:39:24 -0700 (PDT)
X-Received: by 2002:a05:620a:4004:b0:8cd:9365:f27f with SMTP id af79cd13be357-8cd9365fb75mr10082185a.51.1773067163991;
        Mon, 09 Mar 2026 07:39:23 -0700 (PDT)
Received: from [192.168.1.15] (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8cd6f49fcafsm756064985a.16.2026.03.09.07.39.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Mar 2026 07:39:23 -0700 (PDT)
From: Brian Masney <bmasney@redhat.com>
Date: Mon, 09 Mar 2026 10:38:40 -0400
Subject: [PATCH v2 01/12] clk: add new flag CLK_ROUNDING_NOOP
Precedence: bulk
X-Mailing-List: arm-scmi@vger.kernel.org
List-Id: <arm-scmi.vger.kernel.org>
List-Subscribe: <mailto:arm-scmi+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:arm-scmi+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Message-Id: <20260309-clk-det-rate-fw-managed-v2-1-c48ef5a3100a@redhat.com>
References: <20260309-clk-det-rate-fw-managed-v2-0-c48ef5a3100a@redhat.com>
In-Reply-To: <20260309-clk-det-rate-fw-managed-v2-0-c48ef5a3100a@redhat.com>
To: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>
Cc: linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Brian Masney <bmasney@redhat.com>, Sudeep Holla <sudeep.holla@kernel.org>, 
 Abel Vesa <abelvesa@kernel.org>, Andrea della Porta <andrea.porta@suse.com>, 
 Baolin Wang <baolin.wang@linux.alibaba.com>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Chanwoo Choi <cw00.choi@samsung.com>, Frank Li <Frank.Li@nxp.com>, 
 Geert Uytterhoeven <geert+renesas@glider.be>, 
 Krzysztof Kozlowski <krzk@kernel.org>, Orson Zhai <orsonzhai@gmail.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>, arm-scmi@vger.kernel.org, 
 Chunyan Zhang <zhang.lyra@gmail.com>, 
 Cristian Marussi <cristian.marussi@arm.com>, 
 Fabio Estevam <festevam@gmail.com>, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org, 
 linux-renesas-soc@vger.kernel.org, linux-samsung-soc@vger.kernel.org, 
 Peng Fan <peng.fan@nxp.com>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=5325; i=bmasney@redhat.com;
 s=20250903; h=from:subject:message-id;
 bh=cs+bYMwjQyeXRJYn9Ukf0L0Sx16lkh8uvsSX1xdWPjk=;
 b=owGbwMvMwCW2/dJd9di6A+2Mp9WSGDLX3e4p6p/9/bRNG8unhOh9XV2dEmpOUoW/50S2Rqxte
 F+j//poRykLgxgXg6yYIsuSXKOCiNRVtvfuaLLAzGFlAhnCwMUpABO508HwVzpZa6tR03/JGIXf
 aTejyos0jIqOe7jkvvJc6Tgv/eKWGYwMH+fp9f9nyOc88HjKPo8NE7jtpauuCUyWu7v4pMrJrks
 hjAA=
X-Developer-Key: i=bmasney@redhat.com; a=openpgp;
 fpr=A46D32705865AA3DDEDC2904B7D2DD275D7EC087
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: Byg89C4lvW2ta3gAYiJoncyUNBGLkK5s0gRWWpZ73_A_1773067164
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit

There are some clocks where the determine_rate clk op is just an empty
function that returns 0. This can be either because the rounding is
managed by the firmware, or the clock is capable of any rate. Add a
new flag for these type of clocks, and update the clk core so that the
determine_rate() clk op is not required when this flag is set.

Acked-by: Sudeep Holla <sudeep.holla@kernel.org>
Signed-off-by: Brian Masney <bmasney@redhat.com>
---
To: Michael Turquette <mturquette@baylibre.com>
To: Stephen Boyd <sboyd@kernel.org>
To: Abel Vesa <abelvesa@kernel.org>
To: Andrea della Porta <andrea.porta@suse.com>
To: Baolin Wang <baolin.wang@linux.alibaba.com>
To: Bjorn Andersson <andersson@kernel.org>
To: Chanwoo Choi <cw00.choi@samsung.com>
To: Frank Li <Frank.Li@nxp.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>
To: Krzysztof Kozlowski <krzk@kernel.org>
To: Orson Zhai <orsonzhai@gmail.com>
To: Sascha Hauer <s.hauer@pengutronix.de>
To: Sudeep Holla <sudeep.holla@kernel.org>
To: Sylwester Nawrocki <s.nawrocki@samsung.com>
To: Tudor Ambarus <tudor.ambarus@linaro.org>
Cc: linux-clk@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Cc: Alim Akhtar <alim.akhtar@samsung.com>
Cc: arm-scmi@vger.kernel.org
Cc: Chunyan Zhang <zhang.lyra@gmail.com>
Cc: Cristian Marussi <cristian.marussi@arm.com>
Cc: Fabio Estevam <festevam@gmail.com>
Cc: imx@lists.linux.dev
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-arm-msm@vger.kernel.org
Cc: linux-renesas-soc@vger.kernel.org
Cc: linux-samsung-soc@vger.kernel.org
Cc: Peng Fan <peng.fan@nxp.com>
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>
---
 drivers/clk/clk.c            | 31 ++++++++++++++++++++++++++++---
 include/linux/clk-provider.h |  2 ++
 2 files changed, 30 insertions(+), 3 deletions(-)

diff --git a/drivers/clk/clk.c b/drivers/clk/clk.c
index fd418dc988b1c60c49e3ac9c0c44aa132dd5da28..1187e5b1dbc123d2d2c1f43690d7dcf75a7c4ac3 100644
--- a/drivers/clk/clk.c
+++ b/drivers/clk/clk.c
@@ -1557,6 +1557,21 @@ static int __init clk_disable_unused(void)
 }
 late_initcall_sync(clk_disable_unused);
 
+/**
+ * clk_is_rounding_noop - Check to see if noop clk rounding is used.
+ *
+ * @core: the clk to check
+ *
+ * Clks that have this flag enabled do not need to have a determine_rate() op
+ * set, and will always return success for any rounding operation. This can be
+ * either because the rounding is managed by the firmware, or the clock is
+ * capable of any rate.
+ */
+static inline bool clk_is_rounding_noop(struct clk_core *core)
+{
+	return core->flags & CLK_ROUNDING_NOOP;
+}
+
 static int clk_core_determine_round_nolock(struct clk_core *core,
 					   struct clk_rate_request *req)
 {
@@ -1589,6 +1604,8 @@ static int clk_core_determine_round_nolock(struct clk_core *core,
 		req->rate = core->rate;
 	} else if (core->ops->determine_rate) {
 		return core->ops->determine_rate(core->hw, req);
+	} else if (clk_is_rounding_noop(core)) {
+		return 0;
 	} else {
 		return -EINVAL;
 	}
@@ -1673,7 +1690,7 @@ EXPORT_SYMBOL_GPL(clk_hw_forward_rate_request);
 
 static bool clk_core_can_round(struct clk_core * const core)
 {
-	return core->ops->determine_rate;
+	return core->ops->determine_rate || clk_is_rounding_noop(core);
 }
 
 static int clk_core_round_rate_nolock(struct clk_core *core,
@@ -3528,6 +3545,7 @@ static const struct {
 	ENTRY(CLK_IS_CRITICAL),
 	ENTRY(CLK_OPS_PARENT_ENABLE),
 	ENTRY(CLK_DUTY_CYCLE_PARENT),
+	ENTRY(CLK_ROUNDING_NOOP),
 #undef ENTRY
 };
 
@@ -3906,13 +3924,19 @@ static int __clk_core_init(struct clk_core *core)
 
 	/* check that clk_ops are sane.  See Documentation/driver-api/clk.rst */
 	if (core->ops->set_rate && !core->ops->determine_rate &&
-	      core->ops->recalc_rate) {
+	      core->ops->recalc_rate && !clk_is_rounding_noop(core)) {
 		pr_err("%s: %s must implement .determine_rate in addition to .recalc_rate\n",
 		       __func__, core->name);
 		ret = -EINVAL;
 		goto out;
 	}
 
+	if (clk_is_rounding_noop(core) && core->ops->determine_rate) {
+		pr_err("%s: %s cannot implement both .determine_rate and CLK_ROUNDING_NOOP\n",
+		       __func__, core->name);
+		goto out;
+	}
+
 	if (core->ops->set_parent && !core->ops->get_parent) {
 		pr_err("%s: %s must implement .get_parent & .set_parent\n",
 		       __func__, core->name);
@@ -3920,7 +3944,8 @@ static int __clk_core_init(struct clk_core *core)
 		goto out;
 	}
 
-	if (core->ops->set_parent && !core->ops->determine_rate) {
+	if (core->ops->set_parent && !core->ops->determine_rate &&
+	    !clk_is_rounding_noop(core)) {
 		pr_err("%s: %s must implement .set_parent & .determine_rate\n",
 			__func__, core->name);
 		ret = -EINVAL;
diff --git a/include/linux/clk-provider.h b/include/linux/clk-provider.h
index 1cda2c78dffaff037f0f16b0f11106b63b3a746f..33afef9403b526976af80881461bbfe1e4b76c77 100644
--- a/include/linux/clk-provider.h
+++ b/include/linux/clk-provider.h
@@ -32,6 +32,8 @@
 #define CLK_OPS_PARENT_ENABLE	BIT(12)
 /* duty cycle call may be forwarded to the parent clock */
 #define CLK_DUTY_CYCLE_PARENT	BIT(13)
+/* clock rate rounding is managed by firmware, don't require determine_rate */
+#define CLK_ROUNDING_NOOP	BIT(14)
 
 struct clk;
 struct clk_hw;

-- 
2.53.0


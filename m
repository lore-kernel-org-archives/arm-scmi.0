Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793788590;
	b=lLero5ebq48rczQ5s4ew2ve7IKU2xh1Caxzp8FzgLFS4SYFKz/wmGStBJ1gbFfj7jWTV
	 RjUp8BntIMLqxzWoJE49n/Vlnh9AO9G+Y1pY/WkY3g9Qo4GdT1tqcYoO5uZRuocBs2s6e
	 VNBVRqm4RaiYq49kQG/WLtgJ+0ElYFV1fVN4VwC6eGYURH5zbdGoNroZP077QqlbtVOZ7
	 oHex3O1Afpr+Z5/x7s6MN0RD1B4aQa+jTNJjN2omQi58tsxaFSa0GsrQGnzFE6e000Ext
	 Rz5ENo6BEekTQCsZEJ1gRN2BDZsKe/GKys+4z7afRFbWRujvPj120MEZpHWzJSzH6Fw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793788590;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=QmhceGpLe8h0omEeb2M399Xlx6YguZcLcPtiMm/jwQM=;
	b=Q47QwEQ3EDbrhRhv7VuF4vqjCCvdiU5VIiJmMLgCCahVuZCKhgJ2C+f3bRN0fzNqM7Iq
	 d9GdsiNOe+39D3nTQyv8oOv+Iwpbey+W6E6TUzkw2fXPJ8eE/glsc6b0B4ZkFWkyEMkly
	 yXOlDf8u+cM1nAK6/A64WgeAj+2ruTP76PJifiUTge9SYl0Qpsfn3/C/PmJo9kPw81iBu
	 j3jOns+rK6HwWw6Wg8mtFk9YV0A7w5d05VXu1YA/Ryxaek3SYaEo59miFXfMdwYaH5Jpi
	 pYEWfXrGhg3wTr4deNpKrUl9ROijYORBctqsDNr03MGonbOHNGxjorXz/d9dmFguzXg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amarulasolutions.com;
	spf=pass smtp.mailfrom=amarulasolutions.com;
	dkim=pass header.d=amarulasolutions.com header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google header.b=Fb1FHWIE;
	arc=none smtp.remote-ip=209.85.128.54
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 466FF606A33C
	for <arm-scmi@vger.kernel.org>; Wed,  4 Nov 2026 10:36:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 466FF606A33C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google header.b=Fb1FHWIE
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4a20bdaf39cso5011315e9.1
        for <arm-scmi@vger.kernel.org>; Wed, 04 Nov 2026 02:36:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1793788589; x=1794393389; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=QmhceGpLe8h0omEeb2M399Xlx6YguZcLcPtiMm/jwQM=;
        b=Fb1FHWIEPGmdRfstsM41MRX85tJgzb272tTsRN56+pqPfcdSuAWC4SF9jh60IVy54J
         7AMapJNI68GJcNva1bmBNw0rnhlqNqG40BhqTGitFwbEnUDxZh9LIfPveJpSySgpu9ek
         McKeDg7kkJAuN2g25gtOrxHwMsiZSNzu2ah2I=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793788589; x=1794393389;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=QmhceGpLe8h0omEeb2M399Xlx6YguZcLcPtiMm/jwQM=;
        b=Vz/wEJcvJOjHdSjnaMeEWyCyrKD3G9bJKG/aCmjUhcpbBDxFU06tVfZ3SFcmN0dO0N
         d7jqdnDRXGPw3lN5aHRFknnUaz44Zt4fp54OeC1vXMOKUURvGBBtepDGWkHHXYqKgetB
         lPDjcZybuB4y5OdadDvITB4/yyttC1qV1gyIVymcK7LJXQBZ90xfmRsKMugad317GgRV
         AVOjCFJGYqhLyMvqj8GfIXsRI3QwUU01hnD2NJXt+WsNsIcKW/5E4HKERCyStIivLH71
         mpz1vqU024JsKZX96qYzUnGif4gbXIMFa24IfmxdMMHHiTVCZgr7KUF0lBYlLmd8kEcR
         +u4g==
X-Forwarded-Encrypted: i=1; AKwUvBz4FIjUNrw7AXJJn7sFvyCaIzo4HFuVnZKQDBRm+W5tI4XTgothtivzCnb2UTTiXPGZcBYSlWRfOg==@vger.kernel.org
X-Gm-Message-State: APuU4Z+1UK07rGusdv08+BQfkEkj88pBEUkJTEP+X+xRigbw2GfYM8PM
	cBobWJE3K2o7BarqN2P41GIqg+GtkShaIm1mbiE9nzpOaXCrk+erVm32Fay09P0c26g=
X-Gm-Gg: AYBFou2jDQVSs18KNCBlzRS+fk0BtsRjRsgqkPU905e4/MkWFDK8UbyEz6lyCApXxni
	6RKOW5ujpaOCx1duQJj/fo9Om05lgcirIS8d4bT8Fj0z1KtaMl159mz3KXhHZcKmo/5//VYE13W
	sIS97McCxMKsr8/MEcVB3OIxWrCt9vKQdLUoG/f4Lq457TyZMmTow+M+VaQyWpWDvxFua8/TvuA
	Vy+EG06OrIDjTKAeSEPen+WA9QUEw6OGggnF+hiNSZmbn4td+DTwRya6RanvPgUuu3MMAWrRDfE
	79n2uCX2ayN0Dt/jmgis4qSewe7DKnvxSaUXiF+TUWFBy94GWEi6SU91jYTblOp4rom9OjYpq3O
	P3jUonYztBAB/hEYaOQrgb+yZfAiD+qJbRKgg5LkICq2h8eD/JvnVkVrWWbeXanct2bGUZzRios
	8Om4Bo6lwQwQEHF7c84CKRJC6UL6yvxdriqZz7ksdwIW7LdflmUFiOH5OMmGvMyF7vMg7siWUk4
	Dci76w9/JzYzTJotmIh8yEn7mogoZJkha4hz8qgwtIE2rSwQoWmbeJpVwiE3Vr+uZCyDb3ndqdy
	Lfnp0mZLANjy4vrIqcX/JA7xvbgNEFoHjuSYVr63d76apbNuRmz6IPySxcrG8V5FiMHmhPteVrO
	Y41MxehUtb31V6GrzBrX6psgZ+GFebl6M1khKYE76E0higjqv320=
X-Received: by 2002:a05:600c:1387:b0:4a2:729:f7ce with SMTP id 5b1f17b1804b1-4ac17d16afbmr361119835e9.8.1793788588668;
        Wed, 04 Nov 2026 02:36:28 -0800 (PST)
Received: from dario-ThinkPad-P14s-Gen-5.amarulasolutions.com ([217.201.213.4])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b2afee292bsm141685155e9.4.2026.11.04.02.36.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 02:36:28 -0800 (PST)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: Sudeep Holla <sudeep.holla@kernel.org>,
	Cristian Marussi <cristian.marussi@arm.com>
Cc: imx@lists.linux.dev,
	Peng Fan <peng.fan@nxp.com>,
	linux-amarula@amarulasolutions.com,
	arm-scmi@vger.kernel.org,
	michael@amarulasolutions.com,
	Dario Binacchi <dario.binacchi@amarulasolutions.com>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v15 2/2] clk: scmi: reject SSC configuration out of the OEM field range
Date: Wed,  4 Nov 2026 11:36:03 +0100
Message-ID: <20261104103620.4054694-3-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261104103620.4054694-1-dario.binacchi@amarulasolutions.com>
References: <20261104103620.4054694-1-dario.binacchi@amarulasolutions.com>
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

The i.MX SCMI OEM extension stores the spread in an 8-bit field, in
tenths of a percent, and the modulation frequency in a 16-bit field.

FIELD_PREP() silently truncates values that do not fit in the target
field. Moreover, the conversion from permyriad to tenths of a percent
turns values below 10 permyriad into zero, which is then passed to the
firmware as no spread at all.

Reject these cases with a warning instead of silently programming a
configuration different from the requested one.

A request with no spread method disables SSC, so send a zeroed
configuration to the firmware in that case, without checking the
spread and the modulation frequency, which are meaningless then.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>

---

(no changes since v14)

Changes in v14:
 - Send a zeroed configuration when no spread method is requested,
   instead of rejecting it, so that SSC can still be disabled.

Changes in v13:
 - New patch

 drivers/clk/clk-scmi-oem.c | 25 ++++++++++++++++++++++---
 1 file changed, 22 insertions(+), 3 deletions(-)

diff --git a/drivers/clk/clk-scmi-oem.c b/drivers/clk/clk-scmi-oem.c
index c1ebbdc6bbc5..29acd2923fd6 100644
--- a/drivers/clk/clk-scmi-oem.c
+++ b/drivers/clk/clk-scmi-oem.c
@@ -35,19 +35,38 @@ scmi_clk_imx_set_spread_spectrum(struct clk_hw *hw,
 				 const struct clk_spread_spectrum *ss_conf)
 {
 	struct scmi_clk *clk = to_scmi_clk(hw);
+	u32 spread_pm = ss_conf->spread_bp / 10;
 	int ret;
 	u32 val;
 
+	if (ss_conf->method == CLK_SPREAD_NO) {
+		val = 0;
+		goto oem_set;
+	}
+
 	/*
 	 * extConfigValue[7:0]   - spread percentage in tenths of a percent
 	 * extConfigValue[23:8]  - Modulation Frequency
 	 * extConfigValue[24]    - Enable/Disable
 	 * extConfigValue[31:25] - Reserved
 	 */
-	val = FIELD_PREP(SCMI_CLOCK_IMX_SS_PERCENTAGE_MASK, ss_conf->spread_bp / 10);
+	if (!spread_pm || spread_pm > FIELD_MAX(SCMI_CLOCK_IMX_SS_PERCENTAGE_MASK)) {
+		dev_warn(clk->dev, "%s: spread (%u permyriad) out of range\n",
+			 clk_hw_get_name(hw), ss_conf->spread_bp);
+		return -EINVAL;
+	}
+
+	if (ss_conf->modfreq_hz > FIELD_MAX(SCMI_CLOCK_IMX_SS_MOD_FREQ_MASK)) {
+		dev_warn(clk->dev, "%s: modulation frequency (%u Hz) out of range\n",
+			 clk_hw_get_name(hw), ss_conf->modfreq_hz);
+		return -EINVAL;
+	}
+
+	val = FIELD_PREP(SCMI_CLOCK_IMX_SS_PERCENTAGE_MASK, spread_pm);
 	val |= FIELD_PREP(SCMI_CLOCK_IMX_SS_MOD_FREQ_MASK, ss_conf->modfreq_hz);
-	if (ss_conf->method != CLK_SPREAD_NO)
-		val |= SCMI_CLOCK_IMX_SS_ENABLE_MASK;
+	val |= SCMI_CLOCK_IMX_SS_ENABLE_MASK;
+
+oem_set:
 	ret = scmi_proto_clk_ops->config_oem_set(clk->ph, clk->id,
 						 SCMI_CLOCK_CFG_IMX_SSC,
 						 val, false);
-- 
2.43.0


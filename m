Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793788589;
	b=H8OCBTbyhfgETI3DK1R1o7IFbjID6mAvVwhiSwK07LwEX84Q/GyI/hA2ByEELgLi/K94
	 ubb1wM5iXYKLZWeOxgOwH4cn4G92B3KKYdZreS9BbYT0RYpbIcejJe9MmrNdpsAx+n+ZR
	 oQE3j8Ywi93u2DNerBb2a2twmHe4xQDS8odl7/3ERPlnP3rIi7YhGMpMUxgDa1a3lRqRE
	 Wfhe3mTg+uiBjo9Xg1yE85D/PWG+FxvQftOtuefqd7UcWs0403LYPrTfat2rlMpm9keDh
	 g8L4eDgHN1cqUosbrK0KRPcaIDDG2sxy7jDHwpAzUaA6odOTMF+GSRXN8wrjM3kkzTQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793788589;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=g8GDWpuJEEwiEELyHxABV+752CFxaNvpiplpVAXeeOs=;
	b=T0AN2PkridFIa7YGjHKb6wveVoL0Ijq//al81wcU6Use3bA/7P+UgeExQY/GCUqqskGq
	 BgUQwkKNp4oqzi6SClRBSVp1PrxmdExupukCyocb6pkeZNPSidFNz1GXoXteFqnlAkgLc
	 n5iIO+HaNhOuiwC8+imH7QtYwbTORHmGYvrRxJcIkSEqRQx77r9GGWN16MgubzJetpUar
	 OUY+/c+pPQeiD5TKZ04Y33sVgE3Cz3MnRNjLNqKzHExj0hti3UwtqEN4Fckzk4ziteqid
	 259GCk+u0yPwYji8lniTirFVox+WFzULk0eNPPTdd97ZotheUE7KVZkFSZr3YHfjvvQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amarulasolutions.com;
	spf=pass smtp.mailfrom=amarulasolutions.com;
	dkim=pass header.d=amarulasolutions.com header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google header.b=ZoewCmxe;
	arc=none smtp.remote-ip=209.85.128.51
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 544D5606A32D
	for <arm-scmi@vger.kernel.org>; Wed,  4 Nov 2026 10:36:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 544D5606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google header.b=ZoewCmxe
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4a20a37703bso3660655e9.1
        for <arm-scmi@vger.kernel.org>; Wed, 04 Nov 2026 02:36:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1793788587; x=1794393387; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=g8GDWpuJEEwiEELyHxABV+752CFxaNvpiplpVAXeeOs=;
        b=ZoewCmxewUIzN6aiIcngtU40jl+60XtSwir+Tt5YZrbVwlPRzVt9zqOQyL/2XkaI/W
         6eAD+yC8vtvtBhAzkm7VnlG/6CYdjB2db6CMh2Yqpz0Ej3/nkaIWTvaSb7KtqKH8ndqA
         r322RBM1X+mbl/85NKWpX5q/wDRW9pTJ2HHx4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793788587; x=1794393387;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=g8GDWpuJEEwiEELyHxABV+752CFxaNvpiplpVAXeeOs=;
        b=gfFEui7akeRrhiYo9uUR/EZm9iigjASh96cK0ZmJqSfAimlykNowEBQ5HQRT960ICX
         G0hisA6/VabRKDs5urD2a/3NBY+d/CIoYVqEtf2wUSeKkzoW3PoZg9ZpiQuNcyJB+gbd
         RFEPQtvN7P0E7JzjLM0OGTCcYWYcLwWEF3pq+LXoeC2ADxPjOFAiRfzYUsTAV10AEQ7f
         SiUufxcgbNQjjule9SGcEZNIV0Rz7Leq4nNFwk+akiDerVqENM+BHyb7Hl7IVvTQrceT
         xciWXSwqSuDeeCT/eO+nVLKNYTJsItU1ThQasUaiwYpTz9U0tjTV5k/HJn/0RZbZE3fp
         XmWA==
X-Forwarded-Encrypted: i=1; AKwUvByM9yLHuw8we5HHAVvXLUrhb4V7ZOA8RyXvvdpx8+DDx01h4dycxsEi9KGbgbcHE47LD0vzmzM82w==@vger.kernel.org
X-Gm-Message-State: APuU4Z/hnFZ29LtaAZakKchOjWlQ0/wLfgHaE7le2RmKuoj+ne+sf4NK
	jDzwexj0WXVArDj2qi1jq+FuD7uOVoqyae0PcudXV68Fe7B9m/a/ymhlwhsdh15+nP4=
X-Gm-Gg: AYBFou0kyqSA7SLp0qgQQGxkqdD8iqrzX0ZSrpnW2shvxNkLwQ3fPQPfyol0O6PLvG8
	XSw05GQFNZyLcaRNMied6iRDkbe0fq8OVPLGcZeVDJhG5cqTqwumqEQYi8RzRWoFtcrc325PKbg
	J4tFW2rolrSdsMPQHJBJb1PFrnTvJ89nZPa+ZHbpSBZ7Ey2h7szTEp3o5UG9A4l1mvJH2v1KuNE
	8qkChliVDZq60vCLm53VKA0bUZPtkjrM6JmHHl2yo0C6R+Seq+doY1omfdlKu0WtzQflzSDuY/u
	F6qi6ohP9Xt0rp2N2uI7zJKyxwVlDXJGxUKz/j2JV05GCcgNWLy/EeyIShaYYi0mns6wlGkRVNT
	l1eW06kq9Niez1uXOM3B0NzwJKUjQfmGpgAqbEhyl7fq5EVVoD1RZYpQhAlEaYV8n4EIX690w9E
	o5GcZBur3NJaj+CTogkrLQSo8GHr4/FhcRbR39OnaKd2qCN09Kw95BesyHst/ineea+6Ipvnf8v
	KNqTieymnwDBQAJKf4iiAB/NKB6pfX9c50AYzuUk+o3tOH5DoGa/lmzXHaNmTy3NT8KOkCBt9/Q
	mPXrbwo5HA+mkIlB4afYt7/DUmHymh6sP9mChFAqxqpnVmPQQM5ZDtTIH/sAMYMY4f6rcfFtq0d
	1ahfwFDuz7fc1zX5nd50DuGFAyaKJAy1RKFh3iS7b0d5pLVqHH5g=
X-Received: by 2002:a05:600c:6087:b0:49f:f099:6fb1 with SMTP id 5b1f17b1804b1-4ac17753befmr352610105e9.15.1793788586637;
        Wed, 04 Nov 2026 02:36:26 -0800 (PST)
Received: from dario-ThinkPad-P14s-Gen-5.amarulasolutions.com ([217.201.213.4])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b2afee292bsm141685155e9.4.2026.11.04.02.36.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 02:36:26 -0800 (PST)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: Sudeep Holla <sudeep.holla@kernel.org>,
	Cristian Marussi <cristian.marussi@arm.com>
Cc: imx@lists.linux.dev,
	Peng Fan <peng.fan@nxp.com>,
	linux-amarula@amarulasolutions.com,
	arm-scmi@vger.kernel.org,
	michael@amarulasolutions.com,
	Dario Binacchi <dario.binacchi@amarulasolutions.com>,
	stable@vger.kernel.org,
	Sashiko <sashiko-bot@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Sebin Francis <sebin.francis@ti.com>,
	Stephen Boyd <sboyd@kernel.org>,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v15 1/2] clk: scmi: fix SSC spread conversion
Date: Wed,  4 Nov 2026 11:36:02 +0100
Message-ID: <20261104103620.4054694-2-dario.binacchi@amarulasolutions.com>
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

The spread_bp field of struct clk_spread_spectrum holds the modulation
depth in permyriad (1/100 of a percent), as documented in
clk-provider.h and in the assigned-clock-sscs binding, while the i.MX
SCMI OEM extension expects a value in tenths of a percent, as pointed
out by Peng Fan.

The conversion divides spread_bp by 10000 instead of 10, as reported by
Sashiko, so any valid configuration is truncated to 0 and the hardware
is silently programmed with no spread at all.

Divide by 10 and fix the comment accordingly.

Fixes: 77369b1e6a37 ("clk: scmi: Add i.MX95 OEM extension support for SCMI clock driver")
Cc: stable@vger.kernel.org
Reported-by: Sashiko <sashiko-bot@kernel.org>
Closes: https://lore.kernel.org/r/20260901155657.6A5981F00A3A@smtp.kernel.org
Reported-by: Peng Fan <peng.fan@nxp.com>
Closes: https://lore.kernel.org/r/ZR6PR04MB375776A27E98F140534E8F7FE488B62@ZR6PR04MB375776.eurprd04.prod.outlook.com
Reviewed-by: Peng Fan <peng.fan@nxp.com>
Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>

---

Changes in v15:
 - Add Cc to stable.

Changes in v14:
 - Add Reviewed-by of Peng Fan

Changes in v13:
 - Divide spread_bp by 10 instead of 100 as requested by Peng Fan.
 - Rename the patch title and reword the description accordingly.
 - Add the Reported-by/Closes tags for Sashiko and Peng Fan.

 drivers/clk/clk-scmi-oem.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/clk-scmi-oem.c b/drivers/clk/clk-scmi-oem.c
index be11d359b4ec..c1ebbdc6bbc5 100644
--- a/drivers/clk/clk-scmi-oem.c
+++ b/drivers/clk/clk-scmi-oem.c
@@ -39,12 +39,12 @@ scmi_clk_imx_set_spread_spectrum(struct clk_hw *hw,
 	u32 val;
 
 	/*
-	 * extConfigValue[7:0]   - spread percentage (%)
+	 * extConfigValue[7:0]   - spread percentage in tenths of a percent
 	 * extConfigValue[23:8]  - Modulation Frequency
 	 * extConfigValue[24]    - Enable/Disable
 	 * extConfigValue[31:25] - Reserved
 	 */
-	val = FIELD_PREP(SCMI_CLOCK_IMX_SS_PERCENTAGE_MASK, ss_conf->spread_bp / 10000);
+	val = FIELD_PREP(SCMI_CLOCK_IMX_SS_PERCENTAGE_MASK, ss_conf->spread_bp / 10);
 	val |= FIELD_PREP(SCMI_CLOCK_IMX_SS_MOD_FREQ_MASK, ss_conf->modfreq_hz);
 	if (ss_conf->method != CLK_SPREAD_NO)
 		val |= SCMI_CLOCK_IMX_SS_ENABLE_MASK;
-- 
2.43.0


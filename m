Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8ADDE296BD7
	for <arm-scmi@vger.kernel.org>; Sat, 22 Nov 2025 18:38:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763836693; cv=none; b=Esq/QJAjNoP0YivnDn3DIiUujbUzH1hITuTKWpC1ShIvi0zbW4qXCrUikZuP86MZoU3OIRr0wp25AEAgBaLpVcd5rEpWFRlWLo2lBIqsCQlKyaMmDrRNrwek75rCmBZ/EuBjq5hajKYU/2uHiZi8lixQgSxy28OQ5n6duMxDh/k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763836693; c=relaxed/simple;
	bh=KS3IwSBNigz6zKxF8W+opohOU65DKfaROJ/jPbhdYNY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Pv2/6LIzbUZt019bT8XF9WvOt/+5YevGpIk9MpDojXlBCEmkg6XyaVTVVXLVOct3GrFnuFo7J+BwW8R9Du5zSvzh6YHC1j3VCVysIVYVDeCWsp2zMe6M+mFCday18jWUlEtfYyTBYTphtTYJIIkX+nfhnVhK4x1fkYGayfF5zUU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lZsrhemy; arc=none smtp.client-ip=209.85.208.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lZsrhemy"
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-645a13e2b17so632777a12.2
        for <arm-scmi@vger.kernel.org>; Sat, 22 Nov 2025 10:38:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763836690; x=1764441490; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=In2rN0a8YFrgVikHIk4MV4jCYicuwgjK5OqjGzIHHqA=;
        b=lZsrhemygLFgfbL9K6FGto7fcqskC0+4ihLS9A5gIKsv/s2ZZv3/C3Npl2kIrXV5Cq
         fj3FXjWp1W9qiVH71Oan0fO24W0lqdrXDj4CB/TSYJBko0cq9YdgfpuWph02oJqR7Iwz
         6albdLkgnUZwHlt4cpAbyYnolyBYmJZ5hf1kToNc0SLv7Zfg2csXam4Wye4aKyg1aVB5
         4ZYxn9LIamgXQKFFdtFvro8zbxmQXO+4yJ+/Gb2ul0IP7iyC++tGes84v6K81IEMVQfk
         KDS4t4aOTcIIW3oWB5LJ2PfA6QsSuiNetMlxGbJiBrxVuPIF68YpT7j1UhBE+oTr6KWV
         j0gA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763836690; x=1764441490;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=In2rN0a8YFrgVikHIk4MV4jCYicuwgjK5OqjGzIHHqA=;
        b=wu/+mEb/JAM9QtHrrDWfIESGxiQF3xn6sVf/F4eRO0ggcnE2aKhZ2F9exjrbPL+gAn
         dAdfMWzmjcXOZ5h5CRa409yepsj9v6YsGOuLC0W6eWAnQ2+DycVgEdMZv5Mm98doYwyh
         Clx3/m8dwpyeOXAG/SfqrnKjk+WUj8UGFxLjtEvcCAI0E/YN0sEExF+k6lP/ee33odtI
         aMJzgiHSxJzSlppQjJkDjOp1n9T1cgMaU4ykAXPa0fHpDLX0MLxVBoKtoJIXRAibURZw
         EayTCbNDOZq9OndS4vMLErFTj9ywyX/YIb03RwiZAVXAflqvYvMZbTSl/+CbD7ADezZw
         OB/A==
X-Forwarded-Encrypted: i=1; AJvYcCVLvF11w1Ulxh0r2js3No9vFbJ4gZVjAu4BNUxezGxw5g1UA7V8XB8UamDhO1/8jfvomSE3xkPnQQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxtVbPKxEaGteWkt2mjNzOcY7OTMJav6Nfoe9HPAel9RwUjhkuI
	N1GcOf+N34R6B9/ftd+93HJbElwD3eMQ+tngaOgBPMpPDaSY/tKP6ubg
X-Gm-Gg: ASbGncvkdutetvNpx85d1Kop+BYpPivkKtW21kBCC+BISXO0KJzjC5Ob68vFoDzitfI
	JfMAfEBaAxnto3gvML0PmgGhxF32Bsq7mYngLFvA7TISUWdP2PoDivSTwttiN1griF3TJnHUvDu
	E1j0D0kao/oK1UauPfzO53RK9mnjhvxw8xza675Zd5/5ebNhDJZnVTy3wKhWr5C3m/Zj+trWIci
	PPfYnarjDYrGqS78fGguJ+AVbI668djz1To+0vhzUihWxiWfgE2O483XdFQmn3ynir2AaofKaSp
	YJgcDAJTrAUEbVNHXAw3ByauCmt5kXYl+kSva2RYOZZgc9awI2jaclqF5G+iKozg2yDtvgCT2Xj
	/tYdA69NNd/YyXVWFX1gPOROrNKrd+z0T2GFwNPqhSab4tK0GzMc1Vnuvft1p9oQbrR8yDfzdLC
	IH9AmYFHfcn22l5vJUYAj8Pw==
X-Google-Smtp-Source: AGHT+IEQFD67KPfrjwDKK5+fo757s6Wyf9Xo8Spp+ozFH3wJdVxj5lN9tWb8xqk/o8aSAp5TSS/8dA==
X-Received: by 2002:a05:6402:1ed1:b0:641:3651:7107 with SMTP id 4fb4d7f45d1cf-6455444a01emr6543124a12.12.1763836689590;
        Sat, 22 Nov 2025 10:38:09 -0800 (PST)
Received: from NB-6746.. ([188.243.183.84])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-64536459d92sm7415205a12.31.2025.11.22.10.38.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 22 Nov 2025 10:38:09 -0800 (PST)
From: Artem Shimko <a.shimko.dev@gmail.com>
To: cristian.marussi@arm.com,
	etienne.carriere@linaro.org,
	rikard.falkeborn@gmail.com,
	ulf.hansson@linaro.org,
	dan.carpenter@oracle.com
Cc: a.shimko.dev@gmail.com,
	arm-scmi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	sudeep.holla@arm.com
Subject: [PATCH v3] firmware: arm_scmi: refactor reset domain handling
Date: Sat, 22 Nov 2025 21:38:04 +0300
Message-ID: <20251122183804.198463-1-a.shimko.dev@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <aRW4PpPjVw1-melm@pluto>
References: <aRW4PpPjVw1-melm@pluto>
Precedence: bulk
X-Mailing-List: arm-scmi@vger.kernel.org
List-Id: <arm-scmi.vger.kernel.org>
List-Subscribe: <mailto:arm-scmi+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:arm-scmi+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Improve the SCMI reset protocol implementation by centralizing domain
validation and enhancing error handling.

Add scmi_reset_domain_lookup() helper function to validate
domain ids and return appropriate error codes. Refactor all
domain-specific functions to use this helper, ensuring consistent
error handling throughout the reset protocol.

Signed-off-by: Artem Shimko <a.shimko.dev@gmail.com>
--

Hi Cristian,

Thank you for suggesting! If it works for you I'll try to improve the others protocols.

It was tested on my board in QEMU and on real hardware.
The functionality didn't break, and peripherals that are reseted via SCMI work correctly.

As an example, I can provide DMA test results (as one of the processor units dependent on SCMI reset).

[    2.559040] dw_axi_dmac_platform 1000nda0.nda_dma_0: DesignWare AXI DMA Controller, nda channels
[    2.569265] dw_axi_dmac_platform 1000nda0.nda_dma_1: DesignWare AXI DMA Controller, nda channels
[    2.580601] dw_axi_dmac_platform 1000nda0.nda_dma_2: DesignWare AXI DMA Controller, nda channels

# echo 2000 > /sys/module/dmatest/parameters/timeout
# echo 1000 > /sys/module/dmatest/parameters/iterations
# echo dma0chan0 > /sys/module/dmatest/parameters/channel
[   95.917504] dmatest: Added 1 threads using dma0chan0
# echo 1 > /sys/module/dmatest/parameters/run
[  101.931372] dmatest: Started 1 threads using dma0chan0
[  102.731009] dmatest: dma0chan0-copy0: summary 1000 tests, 0 failures 2508.42 iops 19706 KB/s (0)

And vice versa:

1. Confirmed that the DMA module is non-functional without a proper reset via SCMI.
Disabling the reset logic causes a system crash on first access to its registers.

2. Requesting a non-existent reset domain:

[    2.463400] dw_axi_dmac_platform 1000nda0.nda_dma_0: error -EINVAL: Failed to deassert resets
[    2.472091] dw_axi_dmac_platform 1000nda0.nda_dma_0: probe with driver dw_axi_dmac_platform failed with error -22
[    2.482911] dw_axi_dmac_platform 1000nda0.nda_dma_1: error -EINVAL: Failed to deassert resets
[    2.491553] dw_axi_dmac_platform 1000nda0.nda_dma_1: probe with driver dw_axi_dmac_platform failed with error -22
[    2.502256] dw_axi_dmac_platform 1000nda0.nda_dma_2: error -EINVAL: Failed to deassert resets
[    2.510735] dw_axi_dmac_platform 1000nda0.nda_dma_2: probe with driver dw_axi_dmac_platform failed with error -22

--
Regards,
Artem

 drivers/firmware/arm_scmi/reset.c | 59 ++++++++++++++++++++-----------
 1 file changed, 39 insertions(+), 20 deletions(-)

diff --git a/drivers/firmware/arm_scmi/reset.c b/drivers/firmware/arm_scmi/reset.c
index 0aa82b96f41b..9854a3016d13 100644
--- a/drivers/firmware/arm_scmi/reset.c
+++ b/drivers/firmware/arm_scmi/reset.c
@@ -100,6 +100,7 @@ static int scmi_reset_attributes_get(const struct scmi_protocol_handle *ph,
 
 static int
 scmi_reset_domain_attributes_get(const struct scmi_protocol_handle *ph,
+				 struct reset_dom_info *dom_info,
 				 struct scmi_reset_info *pinfo,
 				 u32 domain, u32 version)
 {
@@ -107,7 +108,6 @@ scmi_reset_domain_attributes_get(const struct scmi_protocol_handle *ph,
 	u32 attributes;
 	struct scmi_xfer *t;
 	struct scmi_msg_resp_reset_domain_attributes *attr;
-	struct reset_dom_info *dom_info = pinfo->dom_info + domain;
 
 	ret = ph->xops->xfer_get_init(ph, RESET_DOMAIN_ATTRIBUTES,
 				      sizeof(domain), sizeof(*attr), &t);
@@ -153,23 +153,39 @@ static int scmi_reset_num_domains_get(const struct scmi_protocol_handle *ph)
 	return pi->num_domains;
 }
 
+static inline struct reset_dom_info *
+scmi_reset_domain_lookup(const struct scmi_protocol_handle *ph, u32 domain)
+{
+	struct scmi_reset_info *pi = ph->get_priv(ph);
+
+	if (domain >= pi->num_domains)
+		return ERR_PTR(-EINVAL);
+
+	return pi->dom_info + domain;
+}
+
 static const char *
 scmi_reset_name_get(const struct scmi_protocol_handle *ph, u32 domain)
 {
-	struct scmi_reset_info *pi = ph->get_priv(ph);
+	struct reset_dom_info *dom_info;
 
-	struct reset_dom_info *dom = pi->dom_info + domain;
+	dom_info = scmi_reset_domain_lookup(ph, domain);
+	if (IS_ERR(dom_info))
+		return "unknown";
 
-	return dom->name;
+	return dom_info->name;
 }
 
 static int scmi_reset_latency_get(const struct scmi_protocol_handle *ph,
 				  u32 domain)
 {
-	struct scmi_reset_info *pi = ph->get_priv(ph);
-	struct reset_dom_info *dom = pi->dom_info + domain;
+	struct reset_dom_info *dom_info;
 
-	return dom->latency_us;
+	dom_info = scmi_reset_domain_lookup(ph, domain);
+	if (IS_ERR(dom_info))
+		return PTR_ERR(dom_info);
+
+	return dom_info->latency_us;
 }
 
 static int scmi_domain_reset(const struct scmi_protocol_handle *ph, u32 domain,
@@ -178,14 +194,13 @@ static int scmi_domain_reset(const struct scmi_protocol_handle *ph, u32 domain,
 	int ret;
 	struct scmi_xfer *t;
 	struct scmi_msg_reset_domain_reset *dom;
-	struct scmi_reset_info *pi = ph->get_priv(ph);
-	struct reset_dom_info *rdom;
+	struct reset_dom_info *dom_info;
 
-	if (domain >= pi->num_domains)
-		return -EINVAL;
+	dom_info = scmi_reset_domain_lookup(ph, domain);
+	if (IS_ERR(dom_info))
+		return PTR_ERR(dom_info);
 
-	rdom = pi->dom_info + domain;
-	if (rdom->async_reset && flags & AUTONOMOUS_RESET)
+	if (dom_info->async_reset && flags & AUTONOMOUS_RESET)
 		flags |= ASYNCHRONOUS_RESET;
 
 	ret = ph->xops->xfer_get_init(ph, RESET, sizeof(*dom), 0, &t);
@@ -238,15 +253,16 @@ static const struct scmi_reset_proto_ops reset_proto_ops = {
 static bool scmi_reset_notify_supported(const struct scmi_protocol_handle *ph,
 					u8 evt_id, u32 src_id)
 {
-	struct reset_dom_info *dom;
-	struct scmi_reset_info *pi = ph->get_priv(ph);
+	struct reset_dom_info *dom_info;
 
-	if (evt_id != SCMI_EVENT_RESET_ISSUED || src_id >= pi->num_domains)
+	if (evt_id != SCMI_EVENT_RESET_ISSUED)
 		return false;
 
-	dom = pi->dom_info + src_id;
+	dom_info = scmi_reset_domain_lookup(ph, src_id);
+	if (IS_ERR(dom_info))
+		return false;
 
-	return dom->reset_notify;
+	return dom_info->reset_notify;
 }
 
 static int scmi_reset_notify(const struct scmi_protocol_handle *ph,
@@ -363,8 +379,11 @@ static int scmi_reset_protocol_init(const struct scmi_protocol_handle *ph)
 	if (!pinfo->dom_info)
 		return -ENOMEM;
 
-	for (domain = 0; domain < pinfo->num_domains; domain++)
-		scmi_reset_domain_attributes_get(ph, pinfo, domain, version);
+	for (domain = 0; domain < pinfo->num_domains; domain++) {
+		struct reset_dom_info *dom_info = pinfo->dom_info + domain;
+
+		scmi_reset_domain_attributes_get(ph, dom_info, pinfo, domain, version);
+	}
 
 	pinfo->version = version;
 	return ph->set_priv(ph, pinfo, version);
-- 
2.43.0


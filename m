Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8428E2D8763
	for <arm-scmi@vger.kernel.org>; Sun, 23 Nov 2025 16:36:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763915766; cv=none; b=E2CS46zWgUQlzbIdNiagINJibzw79GqJycUiqA9cnULP/EE9/MOuntMv6J6iRIYUP+wP4geOERfbljPsLqT5gO8QRy/jUqi7GhlhdnYmGBjTGTiPvp0oCt1Zo/Ly+v1XiEEx/YdexQ/obiEsetKAwHEhqcQX+GHlZ4PbM4t6XK8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763915766; c=relaxed/simple;
	bh=cXv2m7XnkVDEHzsr3NKDvEiEtMeP7ajCLenA8DrGQts=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=gNJM4L5gQCjKUQhLhq8FeVZ8jkKMC1bQS9qR++z8q0V18YIcUj6dHdNUpyA5C18UfG61dPufSn8fIJdRRmKD33Kspvi9qwx+QON8GJsveW/VOYNRmmEAtdd3yHtUNfzvONhB0mxEjzbJLRYFpQ6xQlGiviLslGrRuez4gcnoIYQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=X25sg9Rb; arc=none smtp.client-ip=209.85.208.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="X25sg9Rb"
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-64320b9bb4bso6243493a12.0
        for <arm-scmi@vger.kernel.org>; Sun, 23 Nov 2025 08:36:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763915763; x=1764520563; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cyZu4GLnuAW/BYkaAKPEJEEvoRNPxLTsGnOF4gGj5Ds=;
        b=X25sg9RbRcToqKB6wr+YRdln5kyIr39xjBn83eAXaijPf+nrppESk2lQP0FyvAva/T
         c3lUrGKdRRZ2Q57CVxhcaD56lZ6eFrPvNT+SKykSKEkHg2lityXRR8uqimPgL9s463B2
         +bZyD53BWQ0z41PEnBEWEQQekkwH/v+HV+nDoIjHzZxO667RRYrR4DFmZfapzPBs8gAi
         HkD3HeqqQJft0xDOJGHNFSnI5a1FohwnuHQmVeCtBUJ8mjCPJu+659ohd+/RQqnB+K8B
         GiVuvy/IxCczutXNWqD3bNH3Zw40VApkqIIiC3HOcybkbMdyJe9f0jpxql+iUagO5vPV
         WLUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763915763; x=1764520563;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=cyZu4GLnuAW/BYkaAKPEJEEvoRNPxLTsGnOF4gGj5Ds=;
        b=AANb2tg6qyW9Q8TNfsQrocPeKu6UO73J1h5zcT0IfMxmKiOmlZiTnQuVqS4gTKikua
         ew+63Iq5u1Egfbzv+jHAHHEAMFj2nIt/vqqt/6WaBBCVYJRWmhsZ/voBhlbf0XGWBi8g
         sWtibsUsttcq8U93SmbGl/W3gjAaxPLZCqgqqGGT4WNr6fR1ZnkUlTKpzEsRNwzxStw5
         WogTwYvjDr/pc7Bv/ej/3l4Q6I5GNRNL0wodmLxS+q4wrXWnU+9bDApPmAJtf/p3WbB+
         XTZoXBAjADpINKlHRdL51PgyhlBX/DnLurr/FBxql5rc0/kmxpFHYgwYoCDrKfM0Rvu/
         gZyg==
X-Forwarded-Encrypted: i=1; AJvYcCUpM8lzt9GSPnpTi6fmlNOZTDP9K0QlEsHbG3NbNOYbm/hCiCYkv3JNJj96LlNYSFGcAKVROY9ZPg==@vger.kernel.org
X-Gm-Message-State: AOJu0YwksLblQCtATK2mBCQlqdIJ2L+Grz+uCLMOF9MDFQN1IEXhYvIW
	D7J4fVjoGsNpS8RyjsAoiS7h/uUJAAz0VkVAqR6qnM2bL0USvMbk1gbf
X-Gm-Gg: ASbGncuyR70tqT+WwCNMEb8FVrS57wmn99DNRK4UuzARX+7P6bokTUsSKESUDBaJrWC
	93VBSNVj7k4XVNGy4Gk27IRrd+ceel1oN5kZzsTkXjcUbqR3FkdFbrOA7JlrIt/n0tarwAjbUme
	k/bV9aqfXA6VIA8pmtuAbIx3iuTO3D4Fx7Ky5vdoDk104EiSJYX5Dj5YHkTPylyDHA6EFxxOOxx
	Da6RJnlnEZHcJgXzsODazopqaegPggCJpsvGBFq0Q7A9ATA9VkHeLop+CSnsuYznYyx/tz1kL5L
	5vLbLGVkBdKieHL+eluISIFhc/J/0bapYEkCzEeALxc2sgbIkt88E1nQXpz7Y7YLBlLXzETS6yZ
	M/2ewccTHebYsJUoNQpPi6SpTb/SBs0RMPZnVK4AOhGPa7nWtJbqysXDSnK/lc5xFd7KDCWOETv
	nFGvt0XsZIR50=
X-Google-Smtp-Source: AGHT+IEvGL1kfUl8AZGuuobVlg3kaaNANbcHEX+yQYO7yQf4OXFaLOFiQETRT4SBlOFgpgXa0prAGg==
X-Received: by 2002:aa7:df0c:0:b0:62f:9091:ff30 with SMTP id 4fb4d7f45d1cf-64539624040mr8366526a12.3.1763915762492;
        Sun, 23 Nov 2025 08:36:02 -0800 (PST)
Received: from NB-6746.. ([188.243.183.84])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-64536443a9csm9704216a12.29.2025.11.23.08.36.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 23 Nov 2025 08:36:02 -0800 (PST)
From: Artem Shimko <a.shimko.dev@gmail.com>
To: cristian.marussi@arm.com,
	sudeep.holla@arm.com
Cc: a.shimko.dev@gmail.com,
	arm-scmi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v4] firmware: arm_scmi: refactor reset domain handling
Date: Sun, 23 Nov 2025 19:35:57 +0300
Message-ID: <20251123163557.230530-1-a.shimko.dev@gmail.com>
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

Suggested-by: Cristian Marussi <cristian.marussi@arm.com>
Signed-off-by: Artem Shimko <a.shimko.dev@gmail.com>
---

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

---
ChangeLog:
  v4: Add Suggested-by tag

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


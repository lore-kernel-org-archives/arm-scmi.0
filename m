Received: from mail-wm1-f66.google.com (mail-wm1-f66.google.com [209.85.128.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80F8E29AB07
	for <arm-scmi@vger.kernel.org>; Mon, 23 Feb 2026 14:33:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.66
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771857216; cv=none; b=lNxYSaeVyi3Mwd0oukTX8uCn4M78I7T2xptUFkPWHpws5e+Y5SECAUwL5s9Q17QecR6sZMriKW2iTCXnyYtszalTjyHEcraprGu7fm7b8dtUdPWHaBCQ+7iCt7cOyYwN91X0IqG/KjIM+Qrb7PXK2q2tD3qEF7DU04d7qUhj1kA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771857216; c=relaxed/simple;
	bh=h2p+4bAU8m1fqa16gaAj9gY7VHAZLzpP4BzjrdX4RmU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=po09AjMFw0Ybg7YGqh47G2NoZnRrOzZvKR7p+TBO+GC17y8YGbTZJzndJQZm5abiwL+Wu2KRT9cpUubi6lRZtKZhpnr7S0j+EUqLnMBO0eyurd/8Xm1DzpvxzY2b9uBSCOxHkh1kdCm0xf2D4sfjyzvqNeAojtPVQdXXLUO2agc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=i6qLxNRC; arc=none smtp.client-ip=209.85.128.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="i6qLxNRC"
Received: by mail-wm1-f66.google.com with SMTP id 5b1f17b1804b1-4833115090dso42083535e9.3
        for <arm-scmi@vger.kernel.org>; Mon, 23 Feb 2026 06:33:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1771857214; x=1772462014; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=NXPFCZpUN7Hk5ifjxpLBETIrapd6gJH02w/cLhLizJQ=;
        b=i6qLxNRCL0bGBrJOupexZ8HlfhBj750HEDk9dHqB6NkcHak4wJXXOs24LU16WPy1le
         jyltqh0s41EvqJboLAFe+4bf6CSZApZXsfrpclPaUywhL0/oes1hh1D1zJaRxmV8Ht42
         sBC738KRxEW1ZZEdyqj0mWbcGeu7apvJx+p09CmYfDpOx1QjGOauxxabBsz+HtlMhXAS
         E/XgbYVIQ30GBqs9KgAdVl2JeBQmFo3cMdw09x1fud69aQ3hVaLjUZbNjFWAcC5msdRm
         77dtKXGTegq/Kn+Q7G9A20IrFxChPj1omwzd+EawP0LHrl2+wJPT8kB8FgAZq8Lxsrkp
         L/yQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771857214; x=1772462014;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NXPFCZpUN7Hk5ifjxpLBETIrapd6gJH02w/cLhLizJQ=;
        b=E9aH4gvSv6M/MtOvzLDHcXAhftcjqdjel7QIyuPqdl59RcIc3MX+boMk+tQbLqumGl
         cWzejtjvtvMhHlIGtFqUCiotestgex4oK2sOabFdy1m9PgGdtT2zNsrJji2ZcVaucUPU
         Varp88wbIuCgKK1qUZnmyK+C4vVqQ+XNyOJMSUGmWy+5KzIKuCADOjPWkNT7BBYLQa2w
         PZXxT8r68IgQe5ZtBT/W4YiIljhOJDJuncqh66sNDJuMroZAd9UpXUMB7FRRR4q/lasN
         /Vz8BOmsSAg7eYYeexVNXn0zkVxTucpzGEOdKfzyCrswlP9ks6EyESK2z+6ZSDPsrKjn
         9cyA==
X-Forwarded-Encrypted: i=1; AJvYcCUNpjqzdKJ5mk4T47wgCgQ2zqVkIwzU2FeEMV6h3Y/hjXX2bpkIaf+n7z0CGjfeVrP5p3qPJhR/Hg==@vger.kernel.org
X-Gm-Message-State: AOJu0YwImBQSz0rte/UwtzF+PEY1D4Hf+Vw1HFHOquYiZSMc+YhrwjLH
	lsQouYT8Y3I9G5cqgBgzN2Q86MZqnQgoRaAuBPtMPJkn2k6IV0plRF+hujSez26vgy4=
X-Gm-Gg: AZuq6aKE8/1DjYjB/bDjkGICMrXPfh2MKfEslkhvUk1oqdFR7rZ67Ha1PuH8484A263
	LZBowk899NsivTsYCe/hN4v31ckIfLJN1ZNkI132eSErwcavRiWbuFN1vgmVZ+a4D1E2WcM4U0C
	FVaIcgNvpvFpPiT2MyBYiRSsEjKxWvkTDMxytTM/6DmKukyh+8I+ewrZ8BzIhhU0ElgBzCaYmYH
	fEVsB6Qzpra4vSCuzXM8IaYFJ52LK7XM78BwM8RxaiVENb71lq+9zTYRTyD5S+tnlCEMN0zlWWB
	qm8elF0W/aWdcBIaJ55Xp03bcb79HNV+l3LLGqxdiUEm5xYW59EP19pS3OA1BDu1RY6qkZnO+73
	kfCFuIE9E11266C/vQK2X+dxAJM7VcPZw5LpwtpgMUrVuwbpdV5+mGABpZ9R0FcaBrnM765JqzD
	7XClch2y9YDsrYkU2m89c0Le/p2XWN
X-Received: by 2002:a05:600c:1d0a:b0:483:9139:4c29 with SMTP id 5b1f17b1804b1-483a95b58e6mr154940395e9.2.1771857213825;
        Mon, 23 Feb 2026 06:33:33 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-483a31c048bsm282415105e9.7.2026.02.23.06.33.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Feb 2026 06:33:33 -0800 (PST)
Date: Mon, 23 Feb 2026 17:33:30 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Peng Fan <peng.fan@nxp.com>
Cc: Tom Rini <trini@konsulko.com>, Alice Guo <alice.guo@nxp.com>,
	Ye Li <ye.li@nxp.com>,
	Marek Vasut <marek.vasut+renesas@mailbox.org>,
	Vinh Nguyen <vinh.nguyen.xz@renesas.com>, u-boot@lists.denx.de,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Khaled Ali Ahmed <Khaled.AliAhmed@arm.com>,
	Michal Simek <michal.simek@amd.com>, arm-scmi@vger.kernel.org,
	Linus Walleij <linusw@kernel.org>
Subject: [PATCH 2/4] scmi: update comments for scmi_pinctrl_config_set_in()
Message-ID: <4ef79218f3f6d6530350f4ed228fc4ebd7d2801f.1771856828.git.dan.carpenter@linaro.org>
References: <cover.1771856828.git.dan.carpenter@linaro.org>
Precedence: bulk
X-Mailing-List: arm-scmi@vger.kernel.org
List-Id: <arm-scmi.vger.kernel.org>
List-Subscribe: <mailto:arm-scmi+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:arm-scmi+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1771856828.git.dan.carpenter@linaro.org>

Delete some extra space characters to make checkpatch.pl happy:

WARNING: please, no space before tabs

Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 include/scmi_protocols.h | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/include/scmi_protocols.h b/include/scmi_protocols.h
index 90b1bf76d5d6..a4efadafa73c 100644
--- a/include/scmi_protocols.h
+++ b/include/scmi_protocols.h
@@ -1107,14 +1107,14 @@ struct scmi_pin_config {
  * struct scmi_pinctrl_config_set_in - Message payload for PAD_CONFIG_SET command
  * @identifier:		Identifier for the pin or group.
  * @function_id:	Identifier for the function selected to be enabled
- * 			for the selected pin or group. This field is set to
- * 			0xFFFFFFFF if no function should be enabled by the
- * 			pin or group.
+ *			for the selected pin or group. This field is set to
+ *			0xFFFFFFFF if no function should be enabled by the
+ *			pin or group.
  * @attributes:		Bits[31:11] Reserved, must be zero.
- * 			Bit[10] Function valid.
- * 			Bits[9:2] Number of configurations to set.
- * 			Bits[1:0] Selector: Whether the identifier field
- * 				  refers to a pin or a group.
+ *			Bit[10] Function valid.
+ *			Bits[9:2] Number of configurations to set.
+ *			Bits[1:0] Selector: Whether the identifier field
+ *				  refers to a pin or a group.
  * @configs:	Array of configurations.
  */
 struct scmi_pinctrl_config_set_in {
-- 
2.51.0


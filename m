Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC12329ACDD
	for <arm-scmi@vger.kernel.org>; Mon, 23 Feb 2026 14:33:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771857212; cv=none; b=sZbPx1lKKVMo+fe7BFqvcUZV1dgLOtTxRyidMRe9n/SE1yVEu4hZlbotCIMhReASUNk2+9k1irIZ93WColpiIzb9gOsyL4l2vZ0ausuI6uqZpCfgTn3eEGRlbNrm34N3gFoJEc3aByX6MSSpLUULldROs/pJU9QBCLZAo01FfL8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771857212; c=relaxed/simple;
	bh=8DktkyfUc+xDX1npjPkn8pxUpuxm3GFCU9S3Ne6LFdI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gky2TcLHDuUQaPQHWuGg0Qf29vA9k/kayj9TL8AAiLNtMZUTgr55wHFchcrADZssixOr6fTqgNYY2wQRfphHYdQrsDsFT2XrINbvQEoABqhyQmc3LLkm3/A/pOTIuG6N9XEE//OGdO41I9ZaXuET2qiViXaU7i6Ajoir0TR3Y1k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Gal8BhCb; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Gal8BhCb"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-48372efa020so34875155e9.2
        for <arm-scmi@vger.kernel.org>; Mon, 23 Feb 2026 06:33:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1771857209; x=1772462009; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=pq26o5Rue29JVqQhANhlT1MtJwUHBdQKBfocG6u2YXM=;
        b=Gal8BhCbpv+3Gg0lSSWD+L7h4XHP2z8Q3pOE1PMGfxJhuqunIVfO/Bmvzgp0S6w9D7
         4hzX2EWa6eWl4J/7h1KXa6BPQTScUkGZE2nJDNzl0QQ9Z7kDcmBvnD36DQYjtDwYGzl1
         e0f+//QgUij/OUdYZxoi0h7e7rZh3qYTP8eQjiRbVC1XQO46spAhYZ5LgqVxCMx5pCgC
         afEhStWNfDLd8IuQWnLFeSKoodcOaeX7LgnKnHnT9xJrsImKUVYfLAytxS2xyJ8Y4dJb
         6UK29Cu+i5+y5ZOrO2Ja+yqWEOmC7tnjKtHncAegiWOl3Sd0ccwX4MkVk2EIEnfgsmH5
         LXOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771857209; x=1772462009;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pq26o5Rue29JVqQhANhlT1MtJwUHBdQKBfocG6u2YXM=;
        b=BegXi48YBvBoCFCNihz7i4NlltAlzlj52biWIwD3zUF0mdKIOUB+INum9LO9sD1wiu
         9xfgsGcuRY38oS4hsV6Z0onYlOR0DaHhqbbVgrMuX0eDIW4W0xqw5tYwLgQbWKGyVIkz
         ja6dDycyWpPQJnYRJGIAyLukuXVN9CTwK9u+Lr90LGxilu8Rvfn38FxNYmo0mQ5neRyo
         9pNgoT5e899Ke0kwrhPyEzbMnQ/FX6gMTQKcuh3Sk5wK7ZCGOWca2RVRj5tw+5ZfUw6K
         xa3rkCeBnuL6YMqDS4PYysQzjYcX2km3tv64YyQgIyJR2eDiNdahY8Q+Y9LBEeHb9EXi
         Hx6w==
X-Forwarded-Encrypted: i=1; AJvYcCU6fmwOUamFA0AvshWaG1iMQvgGZsPU7Ll8zDu9itP1ePqGpZ8lVYZOsu2iCD36Xrrw1OLmC6+SjQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwUlH17HLfsgU4FGWL/y/dvPWrM8nSJAvT9uUawmZYmoiab0wi9
	iv6zAdUdgGn8deNulk/nOZVKaMqLGKtKRPOtYJQ51wnpD7twE1L7cWkWoPTwt6o7uOY=
X-Gm-Gg: AZuq6aJEGUJJlr1Ctb54DlfTCGKnTigWTYuZVrTDLkKmH+93zl/vEISU1ctjuD+8LnM
	iui/7ConZWpNBAoe34DJBjhLx1Lm7Zb/+DccJHKsHBeBw7hQNAf+r/4Wbytl1dUl8RtWkkIOzGg
	/5wQxL0SKcP77k3CZPEgbt64F6dipB6RThwm99twpZrdzU4hppBSEaK/OMa5wl+nJYgl8OJvdG/
	G503u0laK7Xbm5iu3Jr3GrsA9exmfDYug3Flhk+Zi28ZlyhZzYgaLh/jt40IHuZc4ocyZPqUjG2
	cluV5YVDr8ASN/ta51uHwBfQTP0aiOvp0P+Xr5AQsYRw+imZRFWtLaaox5dUABO9vwkC3KXEnRT
	hYkXJrCOkHeBdpmPMz+k6TkTEGZq1Jk9HNOVGL2WI78NC29X2OZUy+TJcXFzOKfVHEnwEk7MVI2
	8/nQpctONIUv7ewmXRMkO8o6ln5gNg
X-Received: by 2002:a05:600c:5020:b0:47a:814c:ee95 with SMTP id 5b1f17b1804b1-483a95fc1d3mr154778335e9.12.1771857209148;
        Mon, 23 Feb 2026 06:33:29 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-483a4303447sm86493695e9.27.2026.02.23.06.33.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Feb 2026 06:33:28 -0800 (PST)
Date: Mon, 23 Feb 2026 17:33:25 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Peng Fan <peng.fan@nxp.com>
Cc: Tom Rini <trini@konsulko.com>, Alice Guo <alice.guo@nxp.com>,
	Ye Li <ye.li@nxp.com>, Jacky Bai <ping.bai@nxp.com>,
	Marek Vasut <marek.vasut+renesas@mailbox.org>,
	Vinh Nguyen <vinh.nguyen.xz@renesas.com>,
	Valentin Caron <valentin.caron@foss.st.com>, u-boot@lists.denx.de,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Khaled Ali Ahmed <Khaled.AliAhmed@arm.com>,
	Michal Simek <michal.simek@amd.com>, arm-scmi@vger.kernel.org,
	Linus Walleij <linusw@kernel.org>
Subject: [PATCH 1/4] scmi: pinctrl: add pinctrl message IDs
Message-ID: <62727b8bc822e07ad546d9e9fe4373a372a3f1b9.1771856828.git.dan.carpenter@linaro.org>
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

Add all the pinctrl message IDs.  I renamed SCMI_MSG_PINCTRL_CONFIG_SET
to SCMI_PINCTRL_SETTINGS_CONFIGURE so the naming matches the spec better.

Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 drivers/pinctrl/nxp/pinctrl-imx-scmi.c | 2 +-
 include/scmi_protocols.h               | 9 ++++++++-
 2 files changed, 9 insertions(+), 2 deletions(-)

diff --git a/drivers/pinctrl/nxp/pinctrl-imx-scmi.c b/drivers/pinctrl/nxp/pinctrl-imx-scmi.c
index 781835c68527..cf76b14d3731 100644
--- a/drivers/pinctrl/nxp/pinctrl-imx-scmi.c
+++ b/drivers/pinctrl/nxp/pinctrl-imx-scmi.c
@@ -69,7 +69,7 @@ static int imx_pinconf_scmi_set(struct udevice *dev, u32 mux_ofs, u32 mux, u32 c
 	in.attributes = num_cfgs << PINCTRL_NUM_CFGS_SHIFT;
 
 	msg = SCMI_MSG_IN(SCMI_PROTOCOL_ID_PINCTRL,
-			  SCMI_MSG_PINCTRL_CONFIG_SET, in, out);
+			  SCMI_PINCTRL_SETTINGS_CONFIGURE, in, out);
 
 	ret = devm_scmi_process_msg(dev, &msg);
 	if (ret || out.status) {
diff --git a/include/scmi_protocols.h b/include/scmi_protocols.h
index ecab021b4728..90b1bf76d5d6 100644
--- a/include/scmi_protocols.h
+++ b/include/scmi_protocols.h
@@ -1088,7 +1088,14 @@ struct scmi_voltd_level_get_out {
 
 /* SCMI Pinctrl Protocol */
 enum scmi_pinctrl_message_id {
-	SCMI_MSG_PINCTRL_CONFIG_SET = 0x6
+	SCMI_PINCTRL_ATTRIBUTES = 0x3,
+	SCMI_PINCTRL_LIST_ASSOCIATIONS = 0x4,
+	SCMI_PINCTRL_SETTINGS_GET = 0x5,
+	SCMI_PINCTRL_SETTINGS_CONFIGURE = 0x6,
+	SCMI_PINCTRL_REQUEST = 0x7,
+	SCMI_PINCTRL_RELEASE = 0x8,
+	SCMI_PINCTRL_NAME_GET = 0x9,
+	SCMI_PINCTRL_SET_PERMISSIONS = 0xA,
 };
 
 struct scmi_pin_config {
-- 
2.51.0


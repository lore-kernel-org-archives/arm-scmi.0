Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794567965;
	b=BaDxQJzcuU3utWUpEsLvCiOom9uGKKDw6XBp2zJeKB21q1QiGeGeilOM4CAj9uJsOujC
	 UYqNb2GiunIJfN3viWYuaKfS00l6uEN2FtOca5GgZaTRWdgpdctwWUUed+1FiRGaRsBNt
	 d/QUGa0SppBeYMcgmw9fVpfMK0Wmyp258TC6QLN8S93wqzIyC3XiEtGbbtxXg+IJ0G1q/
	 dv48WTGHoch9Dmg83YbHr274ZTG6a8jDAuWnLeDSm+8aTL+kjA9ooOjAJxZoydtVyAu/g
	 Qcv6/gJcQIEFH9+TWlLNLJ/0fzw4P2RhNYuXkkQdqnJU4ee2cC/AZzuu54gWJdVEP9w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794567965;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer;
	bh=fVQXjjeDCYX44KU4ZOnbZ8m/y/+g7OYE9z9JJ6YDKgE=;
	b=Ge3HeC/PUNN2dMTAKl9gP9ya+weBG3HukFYRNQcUKgIdfI3KB9VnA48Bbs3VFi5aG6EK
	 O0EQcos7NX1bjZFd3XQVwIHCFUARRNn+BA7QgUbNUtiUAZEMuP156RbgoS98gaulxQBEZ
	 3K1aZ1gzgBnIMCtIAdSNPfIut5D9fqBN++nzHmcAwwc1Ark0CsBepJivxhjLbCRH5g+Jg
	 6RVgq9b+sdvgvEpmN99nQ9+7rsoOBu401sCL3uzUrbcpkd1RD/MfjY0H35aq4Q0v06j7P
	 EJ32g5P5SpAXLd5tKW8r6HoFQqjH0rdinWx/K+eVsPjz2zaKYrxkogHWoO8hH58KCow==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b="T5p/H/ae";
	arc=none smtp.remote-ip=209.85.128.41
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23EC2606A321
	for <arm-scmi@vger.kernel.org>; Fri, 13 Nov 2026 11:06:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 23EC2606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=T5p/H/ae
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4a214af2076so4934055e9.0
        for <arm-scmi@vger.kernel.org>; Fri, 13 Nov 2026 03:06:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1794567963; x=1795172763; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fVQXjjeDCYX44KU4ZOnbZ8m/y/+g7OYE9z9JJ6YDKgE=;
        b=T5p/H/aeUArPYFpqIPh0dCK/gfzgmw43sZx2L7r0jE/0pP2Txd9BxTYLUxvD4L/AcN
         XBNbzGLbVcEu25gpUEs8JdaztfVFr5FTURNEuJ/qNJuurRLGeGyxF5SetcskixcUEOid
         BTp55qKmYGwYPs+aU7C5/CMnvN53DIybnIJrsgW3itd98ivxFTRQqOEYR1jBhENMtGcN
         LqRM17mcTBLeNvZVC7/YYtXjAAJ71bJvS8f3EYlk1KHJMGKm5fi+BKNCMu15E7LsIAQT
         QyIYaO/BIu+UR84tXyDTJS3yJSB3T7Yh9B+UGzqZ5TmNi69p4MN7CBgxdVZxwlHeDF/K
         PCcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794567963; x=1795172763;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fVQXjjeDCYX44KU4ZOnbZ8m/y/+g7OYE9z9JJ6YDKgE=;
        b=O9YIJHBufQuPEidalmfhpwcgqywnkQ9cQvPmPnj4DZKoHDN50ZhLZhzq/cT50lQGvB
         1c0WnKLciQKARXL0jDVj/oJOsFbQDOG8lQdEQCHtxGmfQIj1Cg4KVDDO0u63ByUBdxvT
         W/qumbB2VcxMIktGcY5IP5iXAMFnthAa88shufQPEylJv/X+POjb3HLH6VDBRXTqxUTh
         IiVs02J1G9L9WPyiiXEsQ4JjBk8i/YaEnbx4Gq9/t2jiX1vyzY1iu2YkYLTgG6FN64mC
         ZZ7FD6LYcRF6QOTgoALEIzHKLkUcMjHegNvNRo8clcJfBmGV07KY87Pv4EbUsK5n8dm9
         hz6Q==
X-Gm-Message-State: APuU4Z8UA/ZEJL2hq/LAJmz4Wgi6TflCMgN726GAcbc+7eW64oC1SKok
	6h9CYPx4utSLvbtX38M860fXXhUgeZNFrHW+S04ZUStO+rIvnUuS6091rMpShiwzAMK7wr4dVqQ
	7Boqq
X-Gm-Gg: AYBFou3GJO4d9XYgJKe2V8qtKpRoRMcAvf5BuHx4NFIeH6mL8ljdGwq2MjklVoBuTSL
	eALOQdEN+36vZROcPOLAb6pgOhzZqKMPIn6D77jfa6soAMOWjeivN+iFC2Vyo3COEy+nmaGZw99
	eykPx93U4uAWui+CRC5Hk57K/iRGAVnpJh7z6g8qxR/8UmPJGIpJPndQZf/EYJJZcl+EeE9Lf3S
	aHKz1Nb647k5R7OWOowaE+uhnQ6THXX2t53pJjkTQcyoR3NyDwHZTmbLWgA4bntXZa3YoA5Aj8k
	QTTvpzxqjMCvWftlhTeGKnUclma0PJgWFkjLA2TNMK2cSPlli/SEMRhW90oK+gT+wIFKxdzGzyY
	j7DinLLQxH/6cqvooBhUFjU0Psz/dJIAjWlXRSeyiqRZ3KETG+tboVAv+uqOpn9saYPuvDzd/FG
	PeRSG2mQu/iYjMsHTQeS9XXJ+GiOhlYqi9oxVveXoEZ8ktjkCEzjyCQZ4Fl4AKEHuPHsFSwbWC8
	mg2HNbSFwfTKg2R2RSKuXoVvq6oBXtk8BhlNz3t81BfMX845wi9EFLXws8ipiXpdHj3zd3fkvGa
	wOhoPOgF85OjoQaBzTBSUq3fDPCt7OtBkNdMXZB52iWRWtAadys=
X-Received: by 2002:a7b:c00d:0:b0:4a1:efba:511 with SMTP id 5b1f17b1804b1-4bb55a8a57dmr30894835e9.35.1794567963242;
        Fri, 13 Nov 2026 03:06:03 -0800 (PST)
Received: from localhost (128.33.83.79.rev.sfr.net. [79.83.33.128])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb5d2872edsm7329785e9.12.2026.11.13.03.06.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 03:06:02 -0800 (PST)
From: =?utf-8?q?Cl=C3=A9ment_Le_Goffic?= <clegoffic@baylibre.com>
Date: Fri, 13 Nov 2026 12:05:29 +0100
Subject: [PATCH v2 03/11] pinctrl: scmi: send the settings without argument
 as enabled
X-Mailing-List: arm-scmi@vger.kernel.org
List-Id: <arm-scmi.vger.kernel.org>
List-Post: <mailto:arm-scmi@vger.kernel.org>
List-Help: <mailto:arm-scmi+help@vger.kernel.org>
List-Subscribe: <mailto:arm-scmi+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:arm-scmi+unsubscribe@vger.kernel.org>
List-Owner: <mailto:arm-scmi+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20261113-clegoffic-pinctrl-scmi-gpio-v2-3-faccb4685d88@baylibre.com>
References: <20261113-clegoffic-pinctrl-scmi-gpio-v2-0-faccb4685d88@baylibre.com>
In-Reply-To: <20261113-clegoffic-pinctrl-scmi-gpio-v2-0-faccb4685d88@baylibre.com>
To: Sudeep Holla <sudeep.holla@kernel.org>, 
 Cristian Marussi <cristian.marussi@arm.com>, 
 Linus Walleij <linusw@kernel.org>, Peng Fan <peng.fan@nxp.com>, 
 Oleksii Moisieiev <oleksii_moisieiev@epam.com>, 
 Andy Shevchenko <andy@kernel.org>, Dhruva Gole <d-gole@ti.com>, 
 Bartosz Golaszewski <brgl@kernel.org>
Cc: arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 =?utf-8?q?Cl=C3=A9ment_Le_Goffic?= <clegoffic@baylibre.com>
X-Mailer: b4 0.17-dev

bias-bus-hold, bias-disable, bias-high-impedance, drive-open-drain,
drive-open-source and drive-push-pull take no argument in Linux, so
they were sent with the value 0, which the protocol reads as disabled.
Send 1.

Fixes: eb524cb651b7 ("pinctrl: Implementation of the generic scmi-pinctrl driver")
Reviewed-by: Cristian Marussi <cristian.marussi@arm.com>
Signed-off-by: Clément Le Goffic <clegoffic@baylibre.com>
---
 drivers/pinctrl/pinctrl-scmi.c | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/drivers/pinctrl/pinctrl-scmi.c b/drivers/pinctrl/pinctrl-scmi.c
index cbe4f3b6368f..221dd8d30009 100644
--- a/drivers/pinctrl/pinctrl-scmi.c
+++ b/drivers/pinctrl/pinctrl-scmi.c
@@ -172,6 +172,21 @@ static int pinctrl_scmi_map_pinconf_type_get(enum pin_config_param param,
 	return pinctrl_scmi_map_pinconf_type(param, type);
 }
 
+static bool pinctrl_scmi_pinconf_arg_ignored(enum pin_config_param param)
+{
+	switch (param) {
+	case PIN_CONFIG_BIAS_BUS_HOLD:
+	case PIN_CONFIG_BIAS_DISABLE:
+	case PIN_CONFIG_BIAS_HIGH_IMPEDANCE:
+	case PIN_CONFIG_DRIVE_OPEN_DRAIN:
+	case PIN_CONFIG_DRIVE_OPEN_SOURCE:
+	case PIN_CONFIG_DRIVE_PUSH_PULL:
+		return true;
+	default:
+		return false;
+	}
+}
+
 static int pinctrl_scmi_map_pinconf_type_set(enum pin_config_param param,
 					     enum scmi_pinctrl_conf_type *type,
 					     u32 *arg)
@@ -181,6 +196,9 @@ static int pinctrl_scmi_map_pinconf_type_set(enum pin_config_param param,
 		return 0;
 	}
 
+	if (pinctrl_scmi_pinconf_arg_ignored(param))
+		*arg = 1;
+
 	if (param == PIN_CONFIG_DRIVE_STRENGTH)
 		*arg *= MILLI;
 

-- 
2.56.1


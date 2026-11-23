Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795447294;
	b=0whavTCTn+tVoIdQAg+o5W77J+BuQIKJKU2dPa3DZLVUjHIQNNheleLON7/B4TeTxvoZ
	 +lmKO9y2mg/bdp5nLCFnPS3TkYtFffD4aRd45awZrMsLLDw/RNhODk+d5S7ON9HSb7/p+
	 +hpveow0KVMptsCkb5Jc0Bh4pG9TqM8ySERcfalrxexEOkU99LbE17RME0mZf9JaqrbLM
	 FOo4438rDqIa7qTHiO7Gd+fzhxDMAIkwBECutcY2QkogYnGzL30cedtci7Ldv4MSePdjG
	 7Jg4WNOH7S5BIn3LSYebtPM+kADp/mQfHgV9CVkVZCJTdlOoc318lrt0ujcxObruMjw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795447294;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer;
	bh=v0mLXkSc8oXvNntVTksK1Jt854YRTKZVnh554yKeFIk=;
	b=ytfkc4Pq0l7Me6B8cnNeGQgbWXXzbwKyS5G28hLMA+oOGEvG1oPnxlqHEWtn7DNx6Kak
	 UWG2kd/gDgot84kP9fwjy8yHlYWli+ydC6T7dry2GxKYlADnYhj+f4RnDX7ax5regSgd5
	 KqG0N5xsbNKvG+3GIozp/+IEbYJpSy+bzAvjZuTy+LG4vqHEeN/1L0tzPxHESbX+E5sSW
	 xVRGXfoXODzWd8nrD9zPfEtA8TGD+ghMhvmY0En89Pm8aL89y+PLtuRwzbCc6+EBXssDc
	 kFOGw5wUZ1uUlEyS6fEBTJ0m3WVEPlTgEQICcYWqZ7NhjANyNjkVupi+ASIArv9lmtw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=K8Hh2hKI;
	arc=none smtp.remote-ip=209.85.218.45
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54142606A683
	for <arm-scmi@vger.kernel.org>; Mon, 23 Nov 2026 15:21:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 54142606A683
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=K8Hh2hKI
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-c40e30c26a4so914403566b.0
        for <arm-scmi@vger.kernel.org>; Mon, 23 Nov 2026 07:21:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1795447292; x=1796052092; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=v0mLXkSc8oXvNntVTksK1Jt854YRTKZVnh554yKeFIk=;
        b=K8Hh2hKI+q9qtoFkFiwwkPbDWbfiIH+6O0ziMm/VuQLybG4goxo6XGBsq9EjVm/Mvl
         3bwj4U3lqM27HDzy9c4dZj5HHIk/YeJvBxCu39C77lukSPxVzc25JoGnCuWCmNQFkiHO
         0ufA5U0Br66Ac16cthppU9aZ7QDKal13zgvBPa5pFe9qCocMXUi0WVFzxDq8IT3UaX24
         H3HHiTCKC3ELUMDOtda58vBqsTGdGFsHqQ8pw2TD0EttSkh1Y9DnptwJ/WOZ2kiCAqva
         mYPd7xMdurMblBQ3Ie4C48lAGmRDotf4e6+BKXuI1XPWhpgDYoKsnAsUtyiyFQdNj0pw
         CyBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795447292; x=1796052092;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=v0mLXkSc8oXvNntVTksK1Jt854YRTKZVnh554yKeFIk=;
        b=ho1OIRrC17UHtqsALROWCuAoDwwHaGd2iHHteTygy6k8iifSbWlse5iKgHN5f5xHa+
         JPAwO2Xc6NeK2qM3Sc6G73mOZOMhGFOp812EAboJaQn/fqpZcTakjtUWVNtjiLb+wRKa
         jzBufKGvxTNFNY6vhL0nV/pOBgAzYxDWtd2wHolPiu7Ww9qfkz5UIn1l7CjsdpY7b/jC
         JLN5Kcu/14c4i8fzsR711PPZ8VzbRE0+OUh1WCyA8M2/MwqWYlFkTuV2LNUpD5bZqDW8
         YKpWqWg9qhjj7FLXSOOKYpqTlu8xo8JB2kpfH0GV5J2g/a2kOA0j8MJRgsrOR/SnZS+N
         xyag==
X-Gm-Message-State: APuU4Z9F0t87/6xetWy4PK6DZoB0YkU4ZzAl+CoM99EVcnzRXAcd4ikq
	aDDc0+4q3n35gPaEFteBPyggGPBjgcj9gS7FipUFrGJURWHyHfc7nTAJY3pYbmx2RSI=
X-Gm-Gg: AZFdTZeucVWyQrTDOJXW+QeDMI/+vZb7QkR/+QC6srQxGC7IUMpeT/gqZaKO3Ysdmi1
	ZjWc47M3GnvgJfFYy0uV6Brjm4MMYo4mzmBtqwUazjH2JiTQffDrCye7FD5rh/PgriFOXi+CxYc
	nknHxJzpfEHp0QokzWCnMLuRqmRQTZMiplymZ8Y1T3J2dWo/WwGSoljM7ykz0Bx2gGURWUcXcTv
	YcNRCjFBVLulRxfjTAQfG7kaTJgha2mK4nLdxskzs5BRD0iOMBjo1MvUpRdq8N/9bFh8QHc8+uL
	1wzgJMi0VWqiBj95j9FUR+hNlr+jgyIC24GtLTnfw+SJ64PyZ/C1bwkeb3n7wfMIkvOkAO09Xy2
	vu7njjm04tV6IMUk4UeEMELj2Wz8BnwbmkIupxO+DBaJPyDjDEi6m7/9rbjirZ1q2cxD00ognxg
	zDmaXSCwOJWVBvjxRHHkqYW+Xry5FyDTzfkfRgo5eFYqetI91dReKPi5gXiSMERrv8FcdoltI7P
	hD6H+KwWv/oZ1Sj5CinWil7XnQyuEflbV/U4tLC0mq3kjNmfC19GwFommy/J1yoGZqiQf7ftV5W
	oT4DU3f8oT+thJ6u+NWYzHqZqEcOrb69BqEcrGaDvCBlngs+SyI=
X-Received: by 2002:a17:907:3d4e:b0:c4c:e91f:e1db with SMTP id a640c23a62f3a-c51319a7850mr1124091666b.25.1795447291740;
        Mon, 23 Nov 2026 07:21:31 -0800 (PST)
Received: from localhost (140.30.66.37.rev.sfr.net. [37.66.30.140])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6b8b7888sm22628600f8f.42.2026.11.23.07.21.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 07:21:31 -0800 (PST)
From: =?utf-8?q?Cl=C3=A9ment_Le_Goffic?= <clegoffic@baylibre.com>
Date: Mon, 23 Nov 2026 16:21:24 +0100
Subject: [PATCH v3 02/10] pinctrl: scmi: refuse an inexact drive strength
 in milliamperes
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
Message-Id: <20261123-clegoffic-pinctrl-scmi-gpio-v3-2-d61f039be008@baylibre.com>
References: <20261123-clegoffic-pinctrl-scmi-gpio-v3-0-d61f039be008@baylibre.com>
In-Reply-To: <20261123-clegoffic-pinctrl-scmi-gpio-v3-0-d61f039be008@baylibre.com>
To: Sudeep Holla <sudeep.holla@kernel.org>, 
 Cristian Marussi <cristian.marussi@arm.com>, 
 Linus Walleij <linusw@kernel.org>, Peng Fan <peng.fan@nxp.com>, 
 Oleksii Moisieiev <oleksii_moisieiev@epam.com>, 
 Andy Shevchenko <andy@kernel.org>, Dhruva Gole <d-gole@ti.com>, 
 Bartosz Golaszewski <brgl@kernel.org>, 
 =?utf-8?q?Cl=C3=A9ment_Le_Goffic?= <clegoffic@baylibre.com>
Cc: arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Geert Uytterhoeven <geert@linux-m68k.org>
X-Mailer: b4 0.17-dev

A get of PIN_CONFIG_DRIVE_STRENGTH truncated a value that is not a whole
milliampere, and a set did not check the conversion to microamperes for
an overflow.
Return -EINVAL in both cases instead of truncating or wrapping.
PIN_CONFIG_DRIVE_STRENGTH_UA still reads the exact value.

Fixes: cc2f90768e97 ("pinctrl: scmi: send the drive strength in microamperes")
Reported-by: Geert Uytterhoeven <geert@linux-m68k.org>
Closes: https://lore.kernel.org/all/CAMuHMdWwp4RtKnBpFNJPHdigzrQ-wf3yt-pBZGG9QKs9tcd_Ow@mail.gmail.com/
Signed-off-by: Clément Le Goffic <clegoffic@baylibre.com>
---
 drivers/pinctrl/pinctrl-scmi.c | 12 +++++++++---
 1 file changed, 9 insertions(+), 3 deletions(-)

diff --git a/drivers/pinctrl/pinctrl-scmi.c b/drivers/pinctrl/pinctrl-scmi.c
index b088a24e4ec0..23287c3add35 100644
--- a/drivers/pinctrl/pinctrl-scmi.c
+++ b/drivers/pinctrl/pinctrl-scmi.c
@@ -11,6 +11,7 @@
 #include <linux/errno.h>
 #include <linux/module.h>
 #include <linux/of.h>
+#include <linux/overflow.h>
 #include <linux/scmi_protocol.h>
 #include <linux/slab.h>
 #include <linux/types.h>
@@ -179,8 +180,11 @@ static int pinctrl_scmi_map_pinconf_arg_get(enum pin_config_param param, u32 *va
 	if (pinctrl_scmi_pinconf_inactive_flag(param, *value))
 		return -EINVAL;
 
-	if (param == PIN_CONFIG_DRIVE_STRENGTH)
+	if (param == PIN_CONFIG_DRIVE_STRENGTH) {
+		if (*value % MILLI)
+			return -EINVAL;
 		*value /= MILLI;
+	}
 
 	return 0;
 }
@@ -223,8 +227,10 @@ static int pinctrl_scmi_map_pinconf_type_set(enum pin_config_param param,
 	if (pinctrl_scmi_pinconf_arg_ignored(param))
 		*arg = 1;
 
-	if (param == PIN_CONFIG_DRIVE_STRENGTH)
-		*arg *= MILLI;
+	if (param == PIN_CONFIG_DRIVE_STRENGTH) {
+		if (check_mul_overflow(*arg, MILLI, arg))
+			return -EINVAL;
+	}
 
 	return pinctrl_scmi_map_pinconf_type(param, type);
 }

-- 
2.56.1


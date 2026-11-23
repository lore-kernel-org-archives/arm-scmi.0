Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795447294;
	b=3PNI8kbJ45jjb1JfMMDr9se2R2WSWtHtHECE0NFOIgfEGaW7S4qeVldpF26hKjPRknJs
	 DnkFZPzmPnxvi9+rSqO+lp2yYrmwr9DNUA2H8HIU5SaodZHVDTS2NiXfVToihj3Sog/9b
	 wTBuDqSFq4PH9JZU+O5WEt2SJx2ppYydane+qLsR+ufUwxOz2qtzRkxU0SXDsTDwWrHF0
	 RW43hjqUAWbWq1PJq0aCe5FeHz2SQaQMFxQEf0DB7Wa/UY5GH/Px+74GzCpY6ox23IQig
	 MtBHy5LZuYqoom/MCoQeEbUhDOdSJfa5w4md7qiAVh1xng58GwWdHFnocnreKJMyFBQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795447294;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:Subject:Date:
	 Message-Id:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer;
	bh=uzen249UIQm/8PK5gYDtm7rMzMeyssG43QW925C4YsA=;
	b=FYXKq3lp02jSUYPiJ+yABUeYogPgzp5UEIFDRYX8oZaBzYnezaq6vcjx5Cf52lr6n1Rx
	 TvT4hLmVh/KgvTrDmjUemdYsDtjjvw6ToWuq39m3Uf49aB3i025f1enn4Af4d3qap6zvW
	 DOZnb8BL4F6aJHG73EdJopaNDp/Cbfy26WxX8gFgtLhwtjAyKn59Ct56LZtndSDOnxZax
	 arqINSh5T6mziLYhtx4aPxSlNtH5SVEIL8g4amWjly3rysAlGzsbgAcIh05PTEH4JrTTV
	 3UtR2/YDNM51/xOeELzLfoUWtMgqfi8nK8ZRb8TknLGrL0JZ+iHnl6YPYPs18P0ddyw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=Yh0Kqd2W;
	arc=none smtp.remote-ip=209.85.128.45
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 332D2606A335
	for <arm-scmi@vger.kernel.org>; Mon, 23 Nov 2026 15:21:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 332D2606A335
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=Yh0Kqd2W
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4a214c5c4c0so32002115e9.3
        for <arm-scmi@vger.kernel.org>; Mon, 23 Nov 2026 07:21:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1795447290; x=1796052090; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=uzen249UIQm/8PK5gYDtm7rMzMeyssG43QW925C4YsA=;
        b=Yh0Kqd2WwJ3abPyPsFK8w+wXkhbaJ6LyUe7kU73OJE/Uz0ve19EeOSsW/hU0LUz7qF
         wlH+ceqn8InaQfM5URRnUrNL06XbfybNo3ATAwn44ArohVqQcHBhkoz169G6ofSpDdKN
         WG+WyvyQay5ag4VZbchHjKquyq1b1LoTBJLtcTv6BnyIJQj1VqYhpSQNNmVNOmZOZu2F
         MmUm1+ZHvBuFOHQP2SnM1kSK1W2Az0bSSMZXHDmW9wQw6AiHNPjdiMrWgyH0NWj/V0/2
         MV8fxm6r1PJgpKi625zwWqpCqe6cw/ZMrPMRNhIP3KJM8B45BhPEvPctgq8XLvO7d1vo
         wh6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795447290; x=1796052090;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=uzen249UIQm/8PK5gYDtm7rMzMeyssG43QW925C4YsA=;
        b=MDtRDrCMlDiTbJHyrSS6BIAwYuQSXYc8ToEJc3Yzbq4bcUQaBL8oInOQdZzK5oVyjB
         pKXnqv7N8aDsyMwTCIsKelLyiLi4tBqftHkwCJKK/X8E6U7Y6z9tm7ZEGA2O3V0yprVk
         kewRLGjdxXb8k77oLGBksUU2+NWo+FOH9FPMQqLw+ctJTVLN28Oo8Ql/sn+wAZYqPefu
         i+GLU6Y4oyDOqdN8/wlb2mGY80IwelFonrCRcqBhbi+23kAZSO5/9b1At58/Djmy4BCo
         K0ljvbdfMxGRUZDIK4RwwheimitUdntzSumuma5Pma1FJF5CzJlL/6QNEGpnJcwfiOt1
         vkaw==
X-Gm-Message-State: APuU4Z/Vthpld9K6VXxFTriPl8kCJbArKdcK7xda57AOlTnc/Gm3oE1T
	ej/rogXmCkijkrhJA+IU8toG0fdXMttEfVbAz6IxszlfAVhOPlbwZQCM7g0fl9+8pg8=
X-Gm-Gg: AZFdTZdf4MxNnOdaqjpGVIW6zJQJ377Nva3yCEc4hJVlopKH28mz7JvAGDecXRuNb+d
	/xx2QjING8QWyg2RB5GalJlKl/onZXoF7tJAipbE+dkD81EFRFttWDnu/Fmbb0luPEnSfccyYC1
	B8M7OdcXEa8ikPHiqFseD0cuGWso7BEBRQhyKXSNGVbTXjR1Bpij3/OhWKQ4XwL0oh7PhxUhrPn
	wFfPSwQdFDSZYG6XYqN42SmRnHhlIlXG5CHn3y5JnEiAKdoVp6fULMPMjuhi5Bf6olinAnapLvM
	i41+wEc5khQeEIFspcaD0cl+Lg9ZgPA+8647TIKfbZIpGfpVyH7YAyUHVOgiM0jYH3WyxG7ZJPK
	8qZjNiMBu2bvCN+zpzsr0xjSXymbPDqWdkkYmIYKz4PAe7AC13bZXV87fvzvUBC3hEiTsVhL0L+
	kkMHSC3Pw2Ghp82nWmw+2K0LHlZW9zs1SUl4AZ7ByIMlwcdHX6f4EBgwjtaSVvr80yFGv3LDOGQ
	5y4kcVNa7+ogHoQrerLB5E+Z4Lh47cPRn/BaXLJpYvEko7nZ7En0O48Kg62Bl3b4FdZVC0Kqdxd
	XSo70VI1qMVxTuHiRhXXZ/4uyhs59g+lZ35KHdnA8LQ6XOx+mIA=
X-Received: by 2002:a05:600c:4f42:b0:4bb:5c5c:8130 with SMTP id 5b1f17b1804b1-4bb8881c726mr304536705e9.5.1795447290177;
        Mon, 23 Nov 2026 07:21:30 -0800 (PST)
Received: from localhost (140.30.66.37.rev.sfr.net. [37.66.30.140])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6a67f204sm26542178f8f.21.2026.11.23.07.21.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 07:21:29 -0800 (PST)
From: =?utf-8?q?Cl=C3=A9ment_Le_Goffic?= <clegoffic@baylibre.com>
Subject: [PATCH v3 00/10] pinctrl: scmi: fixes and GPIO function support
Date: Mon, 23 Nov 2026 16:21:22 +0100
Message-Id: <20261123-clegoffic-pinctrl-scmi-gpio-v3-0-d61f039be008@baylibre.com>
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
X-B4-Tracking: v=1; b=H4sIAPJZBGsC/43NSw6CMBSF4a2Qjq1py8PiyH0YB/RyC9cAJS0SC
 WHvAg5MHBiHf3LynZkF9ISBnaOZeRwpkOvWiA8Rg7roKuRUrs2UUJkUseDQYOWsJeA9dTD4hgd
 oiVc9OZ5osChkYoyUbBV6j5aeu369vTs8zB1h2MhtUVMYnJ/2+1Fuu/+eRskFT1WZK53ERZmfL
 qaYGjIej+Batp2N6sNJGf/m1MrZAsAkmU5Lrb+4ZVleA+JU0ioBAAA=
X-Change-ID: 20261030-clegoffic-pinctrl-scmi-gpio-48cfe014bb11
To: Sudeep Holla <sudeep.holla@kernel.org>, 
 Cristian Marussi <cristian.marussi@arm.com>, 
 Linus Walleij <linusw@kernel.org>, Peng Fan <peng.fan@nxp.com>, 
 Oleksii Moisieiev <oleksii_moisieiev@epam.com>, 
 Andy Shevchenko <andy@kernel.org>, Dhruva Gole <d-gole@ti.com>, 
 Bartosz Golaszewski <brgl@kernel.org>, 
 =?utf-8?q?Cl=C3=A9ment_Le_Goffic?= <clegoffic@baylibre.com>
Cc: arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Geert Uytterhoeven <geert@linux-m68k.org>, 
 Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.17-dev

Fixes first: a setting the platform reports off read as set, a drive
strength in milliamperes that is not exact was truncated on get and
could overflow on set, the protocol layer read past a
PINCTRL_LIST_ASSOCIATIONS reply larger than its receive buffer, and the
pins of pin-only functions were registered as groups. Then the drive
strength conversion uses MICRO / MILLI.

Then GPIO function support: mark the GPIO functions, and select the GPIO
function of a pin on a GPIO request.

Patches 1 to 5 are fixes for v7.4, patches 6 to 10 can wait for v7.5.

Tested on R-Car X5H with a v6.18 backport that needed adapting, all but
the schmitt and enable settings, which the platform does not implement.
An LLM was used to review the patches and to set up the tests.

---
Changes in v3:
- drop patches 1 to 3, applied for v7.4
- patch 2: new, refuse an inexact or overflowing drive strength in mA (Geert)
- patch 4: Fixes tag, patch 5 (v1 patch 7) needs it
- patch 6: new, MICRO / MILLI (Geert)
- rebase on v7.4-rc4 (Linus)
- Link to v2: https://patch.msgid.link/20261113-clegoffic-pinctrl-scmi-gpio-v2-0-faccb4685d88@baylibre.com

Changes in v2:
- patch 4: keep the enables value on get (Sashiko)
- patch 5: error out on a truncated reply (Cristian)
- patch 11: unsigned counts, loop variables in the for (Andy, Cristian)
- patch 11: dev_dbg when no GPIO function is found (Cristian)
- join the lines that fit in 100 columns (Andy)
- collect Reviewed-by tags
- rebase on next-20261112
- Link to v1: https://patch.msgid.link/20261030-clegoffic-pinctrl-scmi-gpio-v1-0-52d92843ad97@baylibre.com

---
Clément Le Goffic (10):
      pinctrl: scmi: report an off setting as not set
      pinctrl: scmi: refuse an inexact drive strength in milliamperes
      firmware: arm_scmi: stop reading past PINCTRL_LIST_ASSOCIATIONS replies
      firmware: arm_scmi: report the pin-only and GPIO flags of functions
      pinctrl: scmi: give no groups to pin-only functions
      pinctrl: scmi: convert the drive strength with MICRO / MILLI
      pinctrl: scmi: mark the GPIO functions
      pinctrl: scmi: report whether a function is GPIO
      firmware: arm_scmi: add an operation to set the function of a single pin
      pinctrl: scmi: select the GPIO function on GPIO requests

 drivers/firmware/arm_scmi/pinctrl.c |  51 ++++++++++++--
 drivers/pinctrl/pinctrl-scmi.c      | 133 ++++++++++++++++++++++++++++++++----
 include/linux/scmi_protocol.h       |   8 ++-
 3 files changed, 174 insertions(+), 18 deletions(-)
---
base-commit: b6a9fa34ce4187cb69d3c588a4bbffc31ce5db8f
base-tree: git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
change-id: 20261030-clegoffic-pinctrl-scmi-gpio-48cfe014bb11

Best regards,
--  
Clément Le Goffic <clegoffic@baylibre.com>


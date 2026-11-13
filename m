Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794567962;
	b=RpTux3Hwop7QIPARtP30ZgdaohmHjli/mrjt9QSuqySGTBnWA09GXt22gD4JSflMI/+2
	 FGQqYDWwn9idh7z+3lzaUTP2l+64z3yKKY3XcAuvX09ZdRFDzKx7veqFgkgPFmSn/W7WQ
	 B3E+HPYzbulJO0pxxJTZH19S1f3cmgUri3hmdYb5eQpiRlMmV0trb2DqQQDvDVgSY2BaZ
	 EaUMVqM0kvb5hIQymUW8Z9XFp4hWci5vOhOq5GWbCSO2qmj2GKJVgBxdFJLgm2uvSPfSE
	 0xODO6eVpgmTYUyfhddE0RsiggbClRZgOy5i5kA2Kv9riEL7wtsDALJTcPMHZBissPw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794567962;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:Subject:Date:
	 Message-Id:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer;
	bh=5gzZov9JPSIe7T13qi6SZ7Yt/1lSfrV+lnshc+GEkjQ=;
	b=M4wb6Vuz9tUaD5jMSLrUOy0dMKpRfeveZdMfKVfU9wx+NP0lvReuJxnvOlBM4qUsGfHM
	 W/ukb110L2KCU6OtOH3zHQtEY/S/djLrRvjsrjwsNXT6WF1UvTKLvpxdjiKvgoCO5sTzz
	 N5kPqc0m+VN/g8mr2h7FG2BBbtO2j0ISFsus2BCiynkxybkNOYTcnPo8XJ378Znpuvr0/
	 06cP3i2Efgdb/jehfkJrT0AP3V22EV1kBjGDDz+q7N3r0vqGPwYxOo+F5t+Vy0HZPXA7w
	 2cnFUGcEMVYFR0hgQ/vfzonmh4wBDzGoRHPVNZv46jxDS1b85FlqTVL3cisJFWJXOIA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=K1eQu34B;
	arc=none smtp.remote-ip=209.85.128.47
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E09B60A381D
	for <arm-scmi@vger.kernel.org>; Fri, 13 Nov 2026 11:06:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5E09B60A381D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=K1eQu34B
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4a5177d78c7so11756255e9.2
        for <arm-scmi@vger.kernel.org>; Fri, 13 Nov 2026 03:06:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1794567959; x=1795172759; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=5gzZov9JPSIe7T13qi6SZ7Yt/1lSfrV+lnshc+GEkjQ=;
        b=K1eQu34BjPPw9A8TdeH/jg7v4pY3cCb0VlJx1dSmFEN8R7m5ua9UHlzQYH2Y0Ace//
         DRJdz8Ln5ye+ygoMB9e2gryU6ygyEVpQvP1lJQmG1FW2VQ6/+768XZvz10zapHQKCeFF
         zKFwoevhbncajAOOGr7leegnosAuHMDN4fW8DoBTPfMu1TU9ujhHCYHBD5sFqqXzo0rM
         JT9gCQB//fuBJqoZlz/GXcn2uWNry8tJ8++9edjh3qqml0unvyYdOeeEATNWm06IrSI/
         2obyX1qTOnZiJ+gmBeXQ/qvjfrIi5+gMwQGjztnWjMMdQ8GWqCZTNYB3cC0ZZ3O13xQU
         eY5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794567959; x=1795172759;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=5gzZov9JPSIe7T13qi6SZ7Yt/1lSfrV+lnshc+GEkjQ=;
        b=p2Gy4xLMqmthnHDdlQxp9RproCPKC3m//USeZlBLwrGUl1Re5W6rY9X5O3ZX6KEHkE
         w6N2cudG9GYardhN8J4eyO85/HkIRIgnu00GFrHlJ7EDh/eCpP2+OoaEcByYr83zexOF
         LISjb0V2YTjJ+e0aaC18Q4RBCvXFKzVkeCY2uw5rZWoZ7HrNepY7dJdGlNSKXJOC1AGl
         iQiwT/zkao0RbGbO0T9MsPf7PxQgBWUoc+/N+kCXVvLNlU+G6ruzeP4ArU1KMdcIw/Lu
         LnbbzLHe68oE5N6mnK3rf11ptJlifCo5spta0xY/pRgYQr9500QWwNJhLhJwcrqKL2fR
         ufjw==
X-Gm-Message-State: APuU4Z9eM410n1k+5Ll1QQ/75w6QCmZ0aVd1Vv2Oyb7L5IBDW3yJG1m2
	8By8LjTG5wNKDgctn/nn47ouXpO91JYhtAonQGypH67jo6eP3mew2Fdnp1EDRQKXscU=
X-Gm-Gg: AYBFou3qk0JfRPs4v/T+JQqNDTLVJQeXvqdLWO2ZlHfqiiKsnCFY9NQzoGLEErfCFGB
	MFrgKBPxIrUNitAYJVNCTnC8x8sZa71NpQKKSgSIIn4bHPn3gt8E/dUBcyQKJmGaB84YjZOYEgn
	O5OppvWBS+6qpmHp8FGxP7J3ObxVB/JrNDDbCG7Ay8RS07ciRNFBusCoPOt6Uwrvv7jy45aqK8v
	TWgKL8rM4JGomBobd8dWzt36NRlw6EM/O6RPAT5t6q1Fqo+RTeSg87XIB/zW22f+kPpSh+oXzG1
	HAHmAckRImDNxTtHFLl6mqeVh8VVYJOjw1zJtrcqSmacrcT2KeKKSvaNpsTZl20ikC4Nv5AEd1f
	ehp91VfV2/p4oOXk+dkmS6Y2dOpCLM92k+vErqJE+teXTcysIzB/mEFwL+tUOlaxhGRuMPPOLr5
	LUKrZ0diJ+zTRqbk3u3An2TF2ujbLXoD5oywrzhyCaFZxN2uga6AEFIhc2obFo5cJCMvxblD7OD
	Mn4yIPTcXQfNWcr850NucwPPUirtLlDlrPXlWX/gq/PcGlkTUDKm8HklReKfon6cEw1pJP3moZ2
	j4++F2MDYC9Ri3W//ul+tqrkm3QIQ0lWJXx4ovf8f/CkrJcBTZ8=
X-Received: by 2002:a05:600c:6219:b0:4b7:6aac:7406 with SMTP id 5b1f17b1804b1-4bb55a23b41mr38480235e9.3.1794567959161;
        Fri, 13 Nov 2026 03:05:59 -0800 (PST)
Received: from localhost (128.33.83.79.rev.sfr.net. [79.83.33.128])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb5671059bsm28648085e9.1.2026.11.13.03.05.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 03:05:58 -0800 (PST)
From: =?utf-8?q?Cl=C3=A9ment_Le_Goffic?= <clegoffic@baylibre.com>
Subject: [PATCH v2 00/11] pinctrl: scmi: fixes and GPIO function support
Date: Fri, 13 Nov 2026 12:05:26 +0100
Message-Id: <20261113-clegoffic-pinctrl-scmi-gpio-v2-0-faccb4685d88@baylibre.com>
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
X-B4-Tracking: v=1; b=H4sIAPfu9moC/42NQQ6CMBAAv0J6dk1bUMGT/zAc6LKFNdCSFomE8
 HcBP+BxksnMIiIFpijuySICTRzZuw30KRHYVq4h4HpjoaW+KplKwI4aby0jDOxwDB1E7BmagT1
 kOVqSKjNGKbEVhkCWP0f9Wf44vs2LcNyTu9FyHH2Yj/2kdu+/06RAwkXXhc6ztKqL28NUc8cm0
 Bl9L8p1Xb+9sX7x2wAAAA==
X-Change-ID: 20261030-clegoffic-pinctrl-scmi-gpio-48cfe014bb11
To: Sudeep Holla <sudeep.holla@kernel.org>, 
 Cristian Marussi <cristian.marussi@arm.com>, 
 Linus Walleij <linusw@kernel.org>, Peng Fan <peng.fan@nxp.com>, 
 Oleksii Moisieiev <oleksii_moisieiev@epam.com>, 
 Andy Shevchenko <andy@kernel.org>, Dhruva Gole <d-gole@ti.com>, 
 Bartosz Golaszewski <brgl@kernel.org>
Cc: arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 =?utf-8?q?Cl=C3=A9ment_Le_Goffic?= <clegoffic@baylibre.com>, 
 Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.17-dev

Five fixes: the drive strength went out in milliamperes, the schmitt
trigger enable was mapped to the input buffer, the settings Linux
carries without argument went out as disabled, a setting the platform
reports off read as set, and the protocol layer read past a
PINCTRL_LIST_ASSOCIATIONS reply larger than its receive buffer.

Then GPIO function support: report the pin-only and GPIO attributes of
a function, give pin-only functions no groups, mark the GPIO functions,
and select the GPIO function of a pin on a GPIO request.

Tested on R-Car X5H with a v6.18 backport that needed adapting, all but
the schmitt and enable settings, which the platform does not implement.
An LLM was used to review the patches and to set up the tests.

---
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
Clément Le Goffic (11):
      pinctrl: scmi: send the drive strength in microamperes
      pinctrl: scmi: map the schmitt trigger enable to its SCMI type
      pinctrl: scmi: send the settings without argument as enabled
      pinctrl: scmi: report an off setting as not set
      firmware: arm_scmi: stop reading past PINCTRL_LIST_ASSOCIATIONS replies
      firmware: arm_scmi: report the pin-only and GPIO flags of functions
      pinctrl: scmi: give no groups to pin-only functions
      pinctrl: scmi: mark the GPIO functions
      pinctrl: scmi: report whether a function is GPIO
      firmware: arm_scmi: add an operation to set the function of a single pin
      pinctrl: scmi: select the GPIO function on GPIO requests

 drivers/firmware/arm/scmi/pinctrl.c |  51 ++++++++++--
 drivers/pinctrl/pinctrl-scmi.c      | 161 +++++++++++++++++++++++++++++++++---
 include/linux/scmi_protocol.h       |   8 +-
 3 files changed, 201 insertions(+), 19 deletions(-)
---
base-commit: 6d582d78fad9d828e575ca0cdcff8ea47a77220b
base-tree: git://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
change-id: 20261030-clegoffic-pinctrl-scmi-gpio-48cfe014bb11

Best regards,
--  
Clément Le Goffic <clegoffic@baylibre.com>


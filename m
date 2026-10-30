Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793375919;
	b=Ai3hkUh3m67ZdLH3l4H5Jb2okfkAAcfrFyooS0gp+v6Dlpj3cpEpUm8tM8L99DQKfUQO
	 8nR6C1cLVRwpt8cwIfU9jHgjrIQuERoJmortYVucox5JnapCT9fs71tSgLAqfOQ0/gjf1
	 1FS7JgSR+SVhHObg4vUE4UYX0kS6Kq4FVmhbbbWl2ZUtwoJiCe7c4mz68Z4HBJhy1+war
	 TF929/e2+OQx3fGb6mmALOrXHE8Jyur6XwP7bdW2j7Rm2oinJrVOOJSvlhIOzZsKy3zdo
	 JBadnkKRXIzGHJXXyjC42AD9yvqYzXNjNkQdjUAOS0EMZoMpJ3CONpelCjaaqBJbFVw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793375919;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:Subject:Date:
	 Message-Id:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer;
	bh=pY5J61TIFJyOgKIaQTw1d+jDJ02fxs2l8GZ+SUQWAGo=;
	b=tR4uHEXBqbl9LfD5EYK4miuk5SamNbDbTNYkXAi3EpJxIFZqBVp74Qw/9NCyAgBBVAao
	 /3H7FoDUfuBsCO7JRtSe4T/ZP91a3C9Y/IFYDjLM1Ja9iBT2zCIYGLt35JUnGavxlDWcN
	 txCFZnGrjKRAUSHD+BMIxGEMRrXkIRL6sXros9LvUduSDIXuzSoNvJeZCvsO9owztO9K3
	 /IEDtHLmdIMAfvvRK2bRs7Zp59205aEg0MrsISayHoBt7up9kl69J+O1Ea4q7uG4C+2oa
	 GVWnOfhf7LTGYvodTPG0q7mKADUTMNtKmcYrs1HDd5EWLsa0JxRR5Oyo2AS29uS5YVA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=oU3dR5ae;
	arc=none smtp.remote-ip=209.85.221.52
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9346A606A31C
	for <arm-scmi@vger.kernel.org>; Fri, 30 Oct 2026 15:58:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9346A606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=oU3dR5ae
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-48e20ed3b9dso829016f8f.2
        for <arm-scmi@vger.kernel.org>; Fri, 30 Oct 2026 08:58:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1793375916; x=1793980716; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=pY5J61TIFJyOgKIaQTw1d+jDJ02fxs2l8GZ+SUQWAGo=;
        b=oU3dR5aelx0X9640Axl1wdU5N826Lj2FpiVN7eFTYeHxQKvffig6RMfeuhajBvKn2A
         FdotIcuWDuqVlcGG9FfCu/6MOfjl1iSdOMx/1UV51DLC3Dv6S4QmYoqfWjasf6y74vHV
         psz5P7t8D9evnlDKBVa+fHwsjKGZZ4l7BoOH+PZvufmmPucGIBzQaas8OTMI7UuTINFD
         xiHD+xXapOffintzlul5Ma+QrDa19w89GFgU2MQFkIFklc1RqhHCwJTALtSUolwlZ+o3
         M2P7Q6Y+4C6PIevrACIcSkDust6eWN4yQMQFIt5ZZj14jFWcJKgjNSWoVdgxhYQjEGxo
         8H0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793375916; x=1793980716;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=pY5J61TIFJyOgKIaQTw1d+jDJ02fxs2l8GZ+SUQWAGo=;
        b=lbK8XBpPkoitgtBc81hDklIwQ5e8iJgayt+cbfojLB1aVic8CR8J/bkNwH25ZSIb6P
         8VyUA22MCWEcOirycw3dNP4AL9CVKUMSdm2eh/QVN386xvkIR3FF4196kQ7nulaaKOIc
         O+TAcyPWkrOK3CTIF30E6xNCLq2aGI+MQKEG9xn2e4BACRg4QX+C5qY7TEZtCmJqaMpd
         XFA4BfUoRVdEBHrWU7ZGL6bBOjiRdQTS8EH+2USC1UicwZlFga394wipohnvNYwYp/ll
         YL54FGbfvHcr5DjmdX5AjM6sPAejZYfN5o+9wU+FH2nmVCfbf9mc3MhxGL4X6FLEnBE+
         FHwg==
X-Gm-Message-State: AFq9FYI2JSW/RqFb6dlKS6SLUx8tvZDn5xwtvcLib3PPsbL1iUznAhI3
	Xzv3vMP7wlps9SWZvVW3W+jz1aYJ8fmboJY1aBCHcXjDhy/nuJRf1BwzsyMotH4IMXg=
X-Gm-Gg: AYBFou1zvN6S9kuOsXGiogOa8UCdSamKIn/5T7MNlap4bAmWDnrce/DKvt/mxygQC0K
	M/o2Y4+pmhi6yboD7/3kGulMjpLSp0BjxEswUjz0ung91kHM7wQdJrv5J7T3oDLCIbiqBsDVRBR
	g5K93jcRuJTqhRftozzqpsNYZWQCXLGIcAZNEot6WoGTuo9YeeWqLiXFSwjZiOwOkLdnirNbxHn
	Ev3XBpNDCdKu2fUx6UFApZSHxx1UR4rFnROyIfPFzlq61QM/l6DqtxpilgO5ah9zZjxr8BYBKS5
	XQFmVRzvebQCsseaah29vFyVHc65mGRaQkHS+Fmfh97KIviBcfljNtax15wLFlWFCASwzQFtRB/
	ql3UqQbnj+9xD5m6jmORAOPsQS6yzbZWQ/a8UpowRrgpqZtrPfKdDWrt5/EILABFYd31YxPpjUs
	ymso9W3p+4OUCQKUHLcTrXyQSBmyiU7JizH34PYdl5rpaMpvzYe72RbMY95Q5UKTX199aGVSqlv
	+2Dh+nLkufYawjxzoNg3+34drJba+cWA21lKLH99HIsyYSZlkIIjEYwxdGAylb4KZ7GBW1OVXc3
	QBTNGMkOqRTK4kgBDaRU0uYJ7791ct8ck0u0GTObdcc/2WQZrkQ=
X-Received: by 2002:a5d:5f88:0:b0:48e:6419:dc6e with SMTP id ffacd0b85a97d-48e6e4f5431mr6781512f8f.16.1793375915915;
        Fri, 30 Oct 2026 08:58:35 -0700 (PDT)
Received: from localhost (140.30.66.37.rev.sfr.net. [37.66.30.140])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e71b789ecsm3862471f8f.29.2026.10.30.08.58.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 08:58:35 -0700 (PDT)
From: =?utf-8?q?Cl=C3=A9ment_Le_Goffic?= <clegoffic@baylibre.com>
Subject: [PATCH 00/11] pinctrl: scmi: fixes and GPIO function support
Date: Fri, 30 Oct 2026 16:58:31 +0100
Message-Id: <20261030-clegoffic-pinctrl-scmi-gpio-v1-0-52d92843ad97@baylibre.com>
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
X-B4-Tracking: v=1; b=H4sIAKe+5GoC/yXMwQrCMAwA0F8ZORtotiHir4gHm6U1MtvSbCKM/
 btVj+/yNjCpKgbnboMqLzXNqYEOHfD9lqKgTs3Qu/5IbnDIs8QcgjIWTbzUGY2firFoxvHEQRy
 N3hNBG0qVoO/ffrn+bat/CC/fEvb9A/N85Cx/AAAA
X-Change-ID: 20261030-clegoffic-pinctrl-scmi-gpio-48cfe014bb11
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

Five fixes: the drive strength went out in milliamperes, the schmitt
trigger enable was mapped to the input buffer, the settings Linux
carries without argument went out as disabled, a setting the platform
reports off read as set, and the protocol layer read past a
PINCTRL_LIST_ASSOCIATIONS reply larger than its receive buffer.

Then GPIO function support: report the pin-only and GPIO attributes of
a function, give pin-only functions no groups, mark the GPIO functions,
and select the GPIO function of a pin on a GPIO request.

Tested on R-Car X5H with a v6.18 backport that needed adapting, all but
the schmitt mapping, which the platform does not implement. An LLM was
used to review the patches and to set up the tests.

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

 drivers/firmware/arm_scmi/pinctrl.c |  62 +++++++++++--
 drivers/pinctrl/pinctrl-scmi.c      | 170 +++++++++++++++++++++++++++++++++---
 include/linux/scmi_protocol.h       |   9 +-
 3 files changed, 222 insertions(+), 19 deletions(-)
---
base-commit: a39c950806213f6861d00f90729acaaa21f2d95a
base-tree: git://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
change-id: 20261030-clegoffic-pinctrl-scmi-gpio-48cfe014bb11

Best regards,
--  
Clément Le Goffic <clegoffic@baylibre.com>


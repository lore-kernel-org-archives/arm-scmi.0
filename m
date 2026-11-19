Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.171.202.116
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795102200;
	b=CX1AxFNbl2ruq0fqSUEHRa7KG1t82anzwaVjkERyrKNa1J6LanZa4wZOZBuP2+b6Gooi
	 pTYJI9eVacLYSHbYralVX4G8ty+riyW6i9C2Q+Wad3B4nkpvqajVoXc8+2qmG9Kn1icNx
	 ZMvxz7hfTZStIiNZlFaj4fw5o1PtbXAckox1vM8nqYKvYHnMCsZAL3KymqgdT/X0Nr0d/
	 dxTk+HTj7RPirwqD4wdnJricjQJ6tGjxVldIJD1kAIsf1iZ3QXRibocC+XhKKtpqFxAiy
	 Y6H1GoY0mQ5WYdGvpGPN44e4KHyJ6CfpIA0oS2vnWXZ+dUi6Y7DFe6Oj+0gCjEUULMw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795102200;
	h=DMARC-Filter:Received:Received:Received:DKIM-Signature:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding:X-Last-TLS-Session-Version;
	bh=p902X5yNspl97EY5Sspgrrg88N0a/kjWZPhxygshMiM=;
	b=Qg+/rwSCE916M85Qw0o7lLTgN6UwhCBpyK/59BfcdSDh3NAO9NLxzpHHBC17s26zWT+h
	 UICUTJ4s19jZT7jXRerVy0VLOESFbkNGebKd80MUwhQCdYTJQ9z0tsF+uxfAWdRoWaDM2
	 KzRq0uGIG4GD4g5MpEz56ipItSSQdbDzmkHilaD96MJcRt2KWEiJE/NmvS33aRLNO7W4V
	 L/6z2gtTYN0IvlFLx00TFnozUPobfF04JMe0T6siykn6I1JCFdXl40tgJkmeTwvIwF+/m
	 dqgrcP+U7FC8PiGd2oEf86k94D3QFFk+8rdoJfPPhtJhy582f+7MWhPOaXNAzodKRng==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bootlin.com;
	spf=pass smtp.mailfrom=bootlin.com;
	dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b="ODs/7JNY";
	arc=none smtp.remote-ip=185.171.202.116
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F220606A32F;
	Thu, 19 Nov 2026 15:30:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5F220606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=ODs/7JNY
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 7AA09C4CBEF;
	Thu, 19 Nov 2026 15:30:03 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 0F42B60237;
	Thu, 19 Nov 2026 15:29:58 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id E3A6111BC0B70;
	Thu, 19 Nov 2026 16:29:48 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1795102192; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding; bh=p902X5yNspl97EY5Sspgrrg88N0a/kjWZPhxygshMiM=;
	b=ODs/7JNY5OTyVGpPU2fhvXMp5h62UvCBHsIH2Wowd+wJppvzO2usLcPB0vclK2lW4jz9W3
	Px8gv3tee90BtC7QajP/k4uR/afAW+FCdTzu3jyyRVgnJ42XqWVdYKeCaQKDtV9sq8eiK/
	3n5NaStsQsUDvfIFJtR2gs59jmbljUmWessCntDWhSDzU7+4VT6Vob/Zre4qpdq11ofemu
	LVKbMwUpNAAVnHVAcsq3NsgmVURDBABsiM9yxLy2PiStLXxnmab2O3co8cyQEp6zwkXgeT
	mGaXQoRC071q0Hjy23mnWJZgxrLRJ7hwCY02QeeyZLOpiTRi5s7lMh6CpkMm9A==
From: Paul Cercueil <paul.cercueil@bootlin.com>
To: Jassi Brar <jassisinghbrar@gmail.com>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sudeep Holla <sudeep.holla@kernel.org>,
	Cristian Marussi <cristian.marussi@arm.com>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Sunil Kovvuri Goutham <sgoutham@marvell.com>,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	arm-scmi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Paul Cercueil <paul.cercueil@bootlin.com>
Subject: [PATCH 0/3] mailbox: Add Marvell MHU driver
Date: Thu, 19 Nov 2026 16:29:41 +0100
Message-ID: <20261119152944.276763-1-paul.cercueil@bootlin.com>
X-Mailer: git-send-email 2.47.3
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
X-Last-TLS-Session-Version: TLSv1.3

Hi Jassi,

This patchset adds support for the mailbox found in the OcteonTX and
OcteonTX2 based SoCs, which is used for SCMI communication.

This is technically a v5, where the v4 was sent in 2023 [1].
Given that years have passed, and that the original authors left Marvell
AFAIK, I figured out it was just better to restart at v1.

The last patch applies to the SCMI driver, it does not have a direct
dependency on the other two and can go through the ARM tree, if you or
the ARM-SCMI maintainers prefer so.

Cheers,
-Paul

[1]: https://lore.kernel.org/all/4397b39c-084b-954b-956a-5168a3c8958c@linaro.org/T/

George Cherian (3):
  dt-bindings: mailbox: add Marvell MHU
  mailbox: marvell-mhu: add Marvell MHU driver
  scmi: driver: Increase timeout for rx response

 .../bindings/mailbox/marvell,mhu.yaml         |  60 ++++
 MAINTAINERS                                   |   7 +
 .../firmware/arm_scmi/transports/mailbox.c    |   2 +-
 drivers/mailbox/Kconfig                       |  11 +
 drivers/mailbox/Makefile                      |   2 +
 drivers/mailbox/marvell_mhu.c                 | 267 ++++++++++++++++++
 6 files changed, 348 insertions(+), 1 deletion(-)
 create mode 100644 Documentation/devicetree/bindings/mailbox/marvell,mhu.yaml
 create mode 100644 drivers/mailbox/marvell_mhu.c

-- 
2.47.3


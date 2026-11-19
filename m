Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.246.85.4
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795102213;
	b=fBl2rmesFrj5BZQeIOEk9CT14bdoMn4sYEjYCRLY4eR4ZiRIJM2P/6ElO5siA9hq7AGh
	 IVM2dJdAZVbZfO+SYJiPOimVzctYPALKsFm34lwtLH0tKajw5E/bjU4fQ2L6QUDHZ0Pb8
	 Y/oIu0WpHuD9cUq5pGAoRqg8kYE/8HZ41GAI6fTahURFkOdq9v3eCcH/4PpDx/IEXz449
	 iePj6A6UghcH1QIdsCNMoPRxnFkk6JkCQsHyJRJz36Oax0dD3n3WTvCchSW5wbC1GJNnZ
	 ImhTVKDjZ/G9DxQ0+UGiJPtkkcOW+WddapETHSRiBv95OMnQUk19GTStfcmk5qMN0/w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795102213;
	h=DMARC-Filter:Received:Received:Received:DKIM-Signature:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Last-TLS-Session-Version;
	bh=GgEAf6C345RQ3nj5qc/WkXfCBkox/4455vx8pIAqcaU=;
	b=2qkmNiGjtjoN6QDnSzCC9AI17EJHPwzjvNKitl9nvQeRM0OrVaurE2HKo7PxRFpautA1
	 /5TM0zUq3TylLWlQxBQKkPLtCjhGp6vkwdElpwK/nC4OoV2O5uJEWq9oJvwUE4Iz1T27M
	 WgMWXZZE7Y4pNFVKXigu0XSd6iwzh+3MByhBK7MHk6JICEWigmahiLg2tv17dc5iV52WJ
	 caMgvqFA/k/mZUFeS8erTY2z9Y9fdDq/c7skFY63Mm+KnlTbFeJXXV5DpGAeykblYIRrl
	 66GpfwcKnJS0JdYtxXizRPUUu/IAJiVSxi7xnQbZwMxQ+BFNEyjDJ5M+rrAu6izbnBA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bootlin.com;
	spf=pass smtp.mailfrom=bootlin.com;
	dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=Jo1WD+Jm;
	arc=none smtp.remote-ip=185.246.85.4
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35BDA60A2616;
	Thu, 19 Nov 2026 15:30:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 35BDA60A2616
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=Jo1WD+Jm
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id C01BD4E4166D;
	Thu, 19 Nov 2026 15:30:11 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 95C5960237;
	Thu, 19 Nov 2026 15:30:11 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 56DF411BC0B84;
	Thu, 19 Nov 2026 16:30:08 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1795102210; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=GgEAf6C345RQ3nj5qc/WkXfCBkox/4455vx8pIAqcaU=;
	b=Jo1WD+Jmu/Aqe5bAvcqlxSIJQKrJlnKz4rJYk2GX84NWwcf2eFf178YneWAbQH6HkFc5pK
	3g9Ve0BZaQqUI0Iyidi1Lbn5/HJ8Mu+QRB1/eKGMms4Jj2PNcppRhBlLutpqW4VEbXQ6wJ
	FB2EMuKObqcaqRlfPTMhu93T8VOqawawYOFyOFuO0NpT65M2QpBndjSRoC9z3SBdULpZns
	/LfaAhcZnc5ich7GPPAWxx+7nbbvzBZLCcss19UAO0J+B4n2xTjWrrSkqyFIGJjPwjumnc
	pkEKk4gm1GhLByw1eBaiMSf01rKabA5VBFE3iM1/xrRqJFDxpiVlfDeaIlfXwg==
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
	George Cherian <gcherian@marvell.com>,
	Sujeet Baranwal <sbaranwal@marvell.com>,
	Paul Cercueil <paul.cercueil@bootlin.com>
Subject: [PATCH 3/3] scmi: driver: Increase timeout for rx response
Date: Thu, 19 Nov 2026 16:29:44 +0100
Message-ID: <20261119152944.276763-4-paul.cercueil@bootlin.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261119152944.276763-1-paul.cercueil@bootlin.com>
References: <20261119152944.276763-1-paul.cercueil@bootlin.com>
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

From: George Cherian <gcherian@marvell.com>

The timeout is way off on the Marvell CN10K SoC, where the firmware
processor can take more than 200ms to answer.

Signed-off-by: George Cherian <gcherian@marvell.com>
Co-developed-by: Sujeet Baranwal <sbaranwal@marvell.com>
Signed-off-by: Sujeet Baranwal <sbaranwal@marvell.com>
Signed-off-by: Paul Cercueil <paul.cercueil@bootlin.com>
---
 drivers/firmware/arm_scmi/transports/mailbox.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/firmware/arm_scmi/transports/mailbox.c b/drivers/firmware/arm_scmi/transports/mailbox.c
index 308736c3ead9..78c38d2644aa 100644
--- a/drivers/firmware/arm_scmi/transports/mailbox.c
+++ b/drivers/firmware/arm_scmi/transports/mailbox.c
@@ -380,7 +380,7 @@ static const struct scmi_transport_ops scmi_mailbox_ops = {
 
 static struct scmi_desc scmi_mailbox_desc = {
 	.ops = &scmi_mailbox_ops,
-	.max_rx_timeout_ms = 30, /* We may increase this if required */
+	.max_rx_timeout_ms = 500, /* We may increase this if required */
 	.max_msg = 20, /* Limited by MBOX_TX_QUEUE_LEN */
 	.max_msg_size = SCMI_SHMEM_MAX_PAYLOAD_SIZE,
 };
-- 
2.47.3


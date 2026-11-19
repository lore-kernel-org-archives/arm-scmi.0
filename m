Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.171.202.116
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795103698;
	b=gXxtY9BEby0ycyxumaNl4E47+k/E+XAE29p6WZpHPfRIvmwpbLjf8oyX+781w5d0eUCZ
	 GDSmuCAn/zaOTUxwqgduqBu0JAa2rswYUJAIu0G2ef7GzqLnz9ryW3I6Q79ex8RkRCOqj
	 E+unSGaKs7Duvo1XpqUx+t9EZ1qpc541NW5RWc6yXW6B3CHmEuUP2/t8g14YNcaCH97pw
	 v90G8djlmFECvUWudBUFyZfo7b9gzn5oqdoIz+BplPf1uxClaDj5Y46A3ULd42WHYa+TS
	 s2rZoBxVVUtfN/IbnhfABnP0qVD0jAiTJXzjxyLI5PnTnOvgNrUBtc7Zp5m2Fe2hffA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795103698;
	h=DMARC-Filter:Received:Received:Received:DKIM-Signature:Message-ID:
	 Subject:From:To:Cc:Date:In-Reply-To:References:Content-Type:
	 Content-Transfer-Encoding:User-Agent:MIME-Version:
	 X-Last-TLS-Session-Version;
	bh=d4uWrDX7zSkzZqLOJTxS5A0HYGBte0tk9t+WFwpVL4U=;
	b=VJtDENcOUDOYyKST9Gf+AzWQmGnRj8o0DHx9ea3ymUb1rd2lrPiIlaipW0fp6CuF7GeN
	 ZPNPaXfDTrYhSuASFx3Kfis7KqQ1uxJjNuVlB8jdMccFKhRsHgvBYNjmPhw1cHd+K/JDK
	 Fl4WulKvTd8A3MU6yJRhiIds9Fg5s3IkK3aZyQ9+Vwl+gduhwlI/3dYkvwkrZNhTyvDQg
	 haSvbPc8Ce0F3yy3lsW0mOXeGfivP1ktxyJTmY+s8mKCMu8nZDPmXNRg4bc/puMm0ApND
	 6RF2EGk7opdrE+rguYlB1oFLTSwVxEp9bsAboe5GuV1MU2wxB3jnY53sepZj3/uSXag==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bootlin.com;
	spf=pass smtp.mailfrom=bootlin.com;
	dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=dxJnOMHj;
	arc=none smtp.remote-ip=185.171.202.116
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B639606A330;
	Thu, 19 Nov 2026 15:54:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4B639606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=dxJnOMHj
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id EC24AC4CBEF;
	Thu, 19 Nov 2026 15:55:00 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 96EB75FF9A;
	Thu, 19 Nov 2026 15:54:55 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 725E811BC01DC;
	Thu, 19 Nov 2026 16:54:50 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1795103694; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=d4uWrDX7zSkzZqLOJTxS5A0HYGBte0tk9t+WFwpVL4U=;
	b=dxJnOMHj3Qc/cZb1vPNqQ6ynyUgmJE8wACVPr6euR9sxqcACRoKlQ8nrsYvxzprnYmbAAz
	bzHtJBCtCYJffGgDwFSwHl3z9JQEOg+wHGE1HytEkpz54x5TXlJ8CwA/1K8TxVc6vL0Tcw
	HQVoy1LyH8PF5ACstg9XTbH5cChyzUzWNMdKYNn4EeBKw04/VflXJDVtSnQSQPDaPlV35L
	E7mBRp3rtBI8yECXmFLhyQvCDbDSRn2TIx5tL9CANO6k6g1jDBDNse4RXjMe+d7RX8gvX1
	03kxaune9tA/7XrjWCCr17P9Oi8fq3nIkwrPQi2y8W/IPH6Odg4qEKaVhPgnrg==
Message-ID: <9b0133ef58eaac423851e9a8e34676ade7fc2cf4.camel@bootlin.com>
Subject: Re: [PATCH 0/3] mailbox: Add Marvell MHU driver
From: Paul Cercueil <paul.cercueil@bootlin.com>
To: Jassi Brar <jassisinghbrar@gmail.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
  Conor Dooley <conor+dt@kernel.org>, Sudeep Holla
 <sudeep.holla@kernel.org>, Cristian Marussi	 <cristian.marussi@arm.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,  Sunil Kovvuri Goutham	
 <sgoutham@marvell.com>, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, arm-scmi@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org
Date: Thu, 19 Nov 2026 16:54:47 +0100
In-Reply-To: <20261119152944.276763-1-paul.cercueil@bootlin.com>
References: <20261119152944.276763-1-paul.cercueil@bootlin.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-0+deb13u1 
X-Mailing-List: arm-scmi@vger.kernel.org
List-Id: <arm-scmi.vger.kernel.org>
List-Post: <mailto:arm-scmi@vger.kernel.org>
List-Help: <mailto:arm-scmi+help@vger.kernel.org>
List-Subscribe: <mailto:arm-scmi+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:arm-scmi+unsubscribe@vger.kernel.org>
List-Owner: <mailto:arm-scmi+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3

FYI Sashiko found issues in all patches. I'll send a v2 tomorrow or next we=
ek.

Cheers,
-Paul

Le jeudi 19 novembre 2026 =C3=A0 16:29 +0100, Paul Cercueil a =C3=A9crit=C2=
=A0:
> Hi Jassi,
>=20
> This patchset adds support for the mailbox found in the OcteonTX and
> OcteonTX2 based SoCs, which is used for SCMI communication.
>=20
> This is technically a v5, where the v4 was sent in 2023 [1].
> Given that years have passed, and that the original authors left Marvell
> AFAIK, I figured out it was just better to restart at v1.
>=20
> The last patch applies to the SCMI driver, it does not have a direct
> dependency on the other two and can go through the ARM tree, if you or
> the ARM-SCMI maintainers prefer so.
>=20
> Cheers,
> -Paul
>=20
> [1]:
> https://lore.kernel.org/all/4397b39c-084b-954b-956a-5168a3c8958c@linaro.o=
rg/T/
>=20
> George Cherian (3):
> =C2=A0 dt-bindings: mailbox: add Marvell MHU
> =C2=A0 mailbox: marvell-mhu: add Marvell MHU driver
> =C2=A0 scmi: driver: Increase timeout for rx response
>=20
> =C2=A0.../bindings/mailbox/marvell,mhu.yaml=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 |=C2=A0 60 ++++
> =C2=A0MAINTAINERS=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 |=C2=A0=C2=A0 7 +
> =C2=A0.../firmware/arm_scmi/transports/mailbox.c=C2=A0=C2=A0=C2=A0 |=C2=
=A0=C2=A0 2 +-
> =C2=A0drivers/mailbox/Kconfig=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 |=C2=A0 11 +
> =C2=A0drivers/mailbox/Makefile=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 |=C2=A0=C2=A0 2 +
> =C2=A0drivers/mailbox/marvell_mhu.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 267 ++++++++=
++++++++++
> =C2=A06 files changed, 348 insertions(+), 1 deletion(-)
> =C2=A0create mode 100644 Documentation/devicetree/bindings/mailbox/marvel=
l,mhu.yaml
> =C2=A0create mode 100644 drivers/mailbox/marvell_mhu.c

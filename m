Received: from mout.web.de (mout.web.de [212.227.17.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E57461C8626;
	Fri, 16 Jan 2026 13:37:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768570641; cv=none; b=UBEe3Ryh6kqI5cy2iSsD9UlBmsldv0vF4mk7SVPyn8s6H9+dhykha3e4YdABTMf7bZPJJSc8zlLusXtJJMS+gWMlEHvuXAPqGNPOFFswiqkHJqggqWN1yTXW1xFqvTAhnm7cEF05AREadt2US0DIkWkkxIFscVlXMzesOZ7NJyo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768570641; c=relaxed/simple;
	bh=KHpRgz+DVocTzrnU1TIJvn0osNKKjoDVn0wN1dGIybk=;
	h=Message-ID:Date:MIME-Version:To:Cc:References:Subject:From:
	 In-Reply-To:Content-Type; b=Q8F/qPvSwCThaXf8N6uT9tC7Ts5DvPDG+7h5EwTd7TxLp8bbSRfI3kdnkYT0zu4zsU4+hd3J02IlZ4xKwSLT/TE3KzFwiPyThCoqlK5VvYUb+vk81Dm2jRAr+zxMdBsD6/8eD1cEQ9OERiSQLqXclb+VmzKNp2j5rSpvUDFQ7KQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de; spf=pass smtp.mailfrom=web.de; dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b=NCce1NvV; arc=none smtp.client-ip=212.227.17.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=web.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b="NCce1NvV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1768570620; x=1769175420; i=markus.elfring@web.de;
	bh=KHpRgz+DVocTzrnU1TIJvn0osNKKjoDVn0wN1dGIybk=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:To:Cc:References:
	 Subject:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 cc:content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=NCce1NvVUtxQ9/HCfpTMmtXABafFucdPJGV3rUeewMxdfcINQCnnBZwovXD2tXgD
	 Rb6tEnCerV/FDAWKQ1rbiKs0AOFJmYmLm6ITq2TKckzGpsxotyJyMppxLcOcHMnu5
	 0UyNI+60m4W9WmKYk4NEEYYppCxk0Bje9QYlRk9VlqDkbV3epThu5XzFjl1Pnam4G
	 ht/q/juJIxwknYenff9qsmpI2p/SCBYGDBh4TS3ZN8vF3ze9RdclhGbsfYOpZGvuq
	 /VHgZ3inOpHzud/jLwH7Ojjwum0R4QTnSANCIFJ0APr4kaiF/0h+QRjpQCpy7UrNQ
	 d0xKFePx0zeklgsOpg==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.29] ([94.31.69.218]) by smtp.web.de (mrweb106
 [213.165.67.124]) with ESMTPSA (Nemesis) id 1MxpmW-1w1GMM0CJK-00zybU; Fri, 16
 Jan 2026 14:37:00 +0100
Message-ID: <9d44f5c6-9197-44ec-b7fe-50c2a686a751@web.de>
Date: Fri, 16 Jan 2026 14:36:58 +0100
Precedence: bulk
X-Mailing-List: arm-scmi@vger.kernel.org
List-Id: <arm-scmi.vger.kernel.org>
List-Subscribe: <mailto:arm-scmi+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:arm-scmi+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Felix Gu <gu_0233@qq.com>, arm-scmi@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 Cristian Marussi <cristian.marussi@arm.com>,
 Sudeep Holla <sudeep.holla@arm.com>
Cc: LKML <linux-kernel@vger.kernel.org>
References: <tencent_A3E20C513BBE7D268B863A5CE473FBA10B06@qq.com>
Subject: Re: [PATCH] firmware: arm_scpi: Fix a reference leak on device node
Content-Language: en-GB, de-DE
From: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <tencent_A3E20C513BBE7D268B863A5CE473FBA10B06@qq.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:scVktPog1ELB7vrH3fjN7Nu2yYX6OVjys/ZhSUO5tRnfylYag4s
 vldH9vVcGByHbzYAdVkb/q+fGnhfw6vA1iRD5X0F4V6ah4VCbvuPI/dyTGlaBImpUsMJ9QG
 S2kUmpzvXDwP5fYzggrnkDpGZZAoXImS9b7sWNbSxECoU6PNPCNTJ8KfDJSJczGEVqACHe5
 /XrKQy41R+2rK1W0R44cQ==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:F4ADTZJUXN8=;Q/M0qCbOdwEKMitUYRt3um3lbVZ
 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
 FO/tKCjI=

=E2=80=A6
> In scpi_dev_domain_id, it does not release the reference.

See also once more:
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Do=
cumentation/process/submitting-patches.rst?h=3Dv6.19-rc5#n94

Regards,
Markus

Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=185.203.200.13
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793703570;
	b=wRY0LiXTMcYeAyHU0Zvs6/eLZf7XojO17LxT++psZktE7Zbx9ePheVPLucQFFDwb15QV
	 kaYh2+hnDJ9FVfeTe9ZASTA3+wl+quifpF2BPc7nG8Cg3ceNGU7SrLCGzunjrYsYyUHFt
	 NQ42WriF8mA0bZDG2mgDRbL63roCyjk5FMq+lpvr6zd3xFs28RaT30B19KhoH2OZ5KKDB
	 L01v8Te2m9pdsqL6xEYqxbZqrwtSH3ECh6XUHNg87cBier/6AFT22Xu+76+ie1RqRZxZD
	 4AUx7wYAtlTqel3UABlhKBcpgFwS0KaBD8JaT/O+k2jdYYFJSN9Mt096EW18lUakcJg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793703570;
	h=DMARC-Filter:Received:DKIM-Signature:Message-ID:Subject:From:To:Cc:
	 Date:In-Reply-To:References:Content-Type:Content-Transfer-Encoding:
	 User-Agent:MIME-Version;
	bh=HYpokslgUmrlnfncU3L/zsbF0VduaADvTVTWpX9Ts5s=;
	b=0JisQMOJn/WShuMPaVJwrWARrVOix7DCbVINf/p5wIPauoK2Bk9EbUY0RFj22Rc+VcmT
	 DQbRfreFqSb6hRCg8Nb9HajIvSGMnRAeXI1SOz90BBvroewGCfya+BXAXoqYvb3p/Zmt6
	 CJgMxkcfS3j1wd4/tt8o3qLQsncRZAmSvd4HSeDP4De1XHJt4yliYXoUhzZjIKvgIHep8
	 vJlkaJRAfidYnYsDYBZGNZttqceKhXwObxPt4NN7UdMI5y98a63ATYKVIjWNIHO4YML6R
	 STrnC6dZ1ywL2CKDwNeczZaohqBi1YpQuujqU/r9aRVngWBOMXNZyS1qQliR8Kx9CnQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=none header.from=pengutronix.de;
	spf=pass smtp.mailfrom=pengutronix.de;
	dkim=pass header.d=pengutronix.de header.i=@pengutronix.de header.a=rsa-sha256 header.s=20260414 header.b=Aadq76Ib;
	arc=pass header.oldest-pass=0 smtp.remote-ip=185.203.200.13
Received: from mx1.white.stw.pengutronix.de (mx1.white.stw.pengutronix.de [185.203.200.13])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3102D606FAE1;
	Tue,  3 Nov 2026 10:59:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3102D606FAE1
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=pengutronix.de header.i=@pengutronix.de header.a=rsa-sha256 header.s=20260414 header.b=Aadq76Ib
Received: from [IPv6:2a0a:edc0:0:900:1d::4e] (lupine.office.stw.pengutronix.de [IPv6:2a0a:edc0:0:900:1d::4e])
	(Authenticated sender: pza@pengutronix.de)
	by mx1.white.stw.pengutronix.de (Postfix) with ESMTPSA id 20042202806;
	Tue, 03 Nov 2026 11:59:27 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pengutronix.de;
	s=20260414; t=1793703567;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=HYpokslgUmrlnfncU3L/zsbF0VduaADvTVTWpX9Ts5s=;
	b=Aadq76IbqcmCqFO3Xl3Zl7G6rHCjOEMcq3OCZqjWiNwHifsU01lYWQqJi7gtzgH7e7s01/
	X5GX06kUJvmBjz1sA8xrqJEmKfp7bXJmK8YBBSF3C7sO0xUViU9CJdLOUpkVgGT/8SKL/0
	lLKDFt7kswKOQGIrVzvUj5Ilik1RPpIftg30I+1FveeYJ6TkNjQNM1P2+IfuCsKdhsZxsU
	dZ8f7pEiLT1nTCagZIqaMsIaagznoisklxvltLH8FW2sWMHaOUXr5JFPEB3X/BPtxnTPBH
	5nFYbVvqdjNJkjdqwLfj/vOK5s9islXy1RWKhe6HLLIjTE4fy/Jwiwj3n6iNKQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=pengutronix.de;
	s=20260414; t=1793703567;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=HYpokslgUmrlnfncU3L/zsbF0VduaADvTVTWpX9Ts5s=;
	b=CrT3xe6idt+GQHJkdGerOBD7jKAzLMWyQ09TK64Va6/Uks2azMFw29nkPPMh+FhKT2BZo9
	7rG2v4FJZC7p8pgUkf5dprY2QGcLc0470gF/gyjUaq3iS1CR9cu5ftolz38ecZtRH23+zf
	UCqT7xP8a39I4Z0ESqHOhkW7p8sJPhgE2NUXIhZkqaGoa3T7mqfSRKYi3lq+tpS/tDxZCH
	/4PHm0y+zCS7Ur1JKYLWX+GmIOmADr44lgneKlzeEW+KqVXiTL2jImDVAqZkMyJnkF7dU/
	zl6XWDKddDsxpu0LvIHQ4xfWB3/F1QxFCho18qbki+GFAsYdGrKodC4zF+GcRQ==
ARC-Authentication-Results: i=1;
	ORIGINATING;
	auth=pass smtp.auth=pza@pengutronix.de smtp.mailfrom=p.zabel@pengutronix.de
ARC-Seal: i=1; s=20260414; d=pengutronix.de; t=1793703567; a=rsa-sha256;
	cv=none;
	b=Rc4ElyTcHQHzzCa23Y4ZZFf0kHWk9XxEJxDqMzfdnAjMQp7SgdRKfBnO9eleQC6TGlkro8
	SQnOxY8HrlYUDcHu4JgCBM4InflRXupFPE5rF8a6ZCcipmF0qviNPe4eZyDHYwU5xOBnx6
	J4coPZI4vC6vyUBdm+xR8lnvfECW3rcZoesUogbInFxarxn/4mV3tMTyIi8rTnIBUUqwS8
	81thafDukchckSBiQsYTGty77NuX9Q2aD4TD1zZR5AGV6BP9dUxO8X7FkYI3hL92lCROWi
	D2E+pv+qM2E+2oG3kryrnmgGhwTeJd5s1/j2k7ZXNV1pv8S05o3+QBmFf4ZSwg==
Message-ID: <0525fec32cd3c35768585c57bcfbc4a7bb2a569d.camel@pengutronix.de>
Subject: Re: [PATCH] reset: scmi: Set the device for the reset controller
From: Philipp Zabel <p.zabel@pengutronix.de>
To: Kunihiko Hayashi <hayashi.kunihiko@socionext.com>, Sudeep Holla
	 <sudeep.holla@kernel.org>, Cristian Marussi <cristian.marussi@arm.com>
Cc: arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Date: Tue, 03 Nov 2026 11:59:27 +0100
In-Reply-To: <20261002084142.1570378-1-hayashi.kunihiko@socionext.com>
References: <20261002084142.1570378-1-hayashi.kunihiko@socionext.com>
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

On Fr, 2026-10-02 at 17:41 +0900, Kunihiko Hayashi wrote:
> SCMI reset driver does not set rcdev.dev when registering its reset
> controller.
>=20
> If rcdev.of_node is not available, the reset core tries to obtain
> the firmware node from rcdev.dev. However, rcdev.dev is also NULL,
> causing a NULL pointer dereference.
>=20
> [...]

Applied to reset/fixes, thanks!

[1/1] reset: scmi: Set the device for the reset controller
      https://git.kernel.org/pub/scm/linux/kernel/git/pza/linux.git/commit/=
?id=3De3e068a457ce

regards
Philipp

Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=194.117.254.33
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794817364;
	b=TQQAcb2+2kYbde/L7jxWYA7Q7pWMWQj1ceEjlwgfyFy7pWHIy0bGx+DFBoDake5TpfcF
	 bLRjL7qDU/gEdOWvZhUzBclP/GRp7RSbAQEWvIH7Fm+Dyo6wzHq9hV9RIAvsqWwtTadLY
	 hrrhzs5RlKrToSQpRlZo0NqxDaEbCYzjZv+vmiMoWG782l2gpMsjtkA51+PUZiqtS0kUe
	 vdsZGBTXewCeYExNZC1fuY1X5XQGtSzlNn5eAEBtrJmMyDGlKvAtOejs0RnyR4Yt9bKuu
	 KZC9en2vWiaTy99u4+Sz0CMlAT4A1gBxT2Rrses+z6jkgOaSWRRjDJYRfX3nn+Mx9sA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794817364;
	h=DMARC-Filter:DKIM-Signature:Received:Received:X-UD-Smtp-Session:Date:
	 From:To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=6drHvhTiX4LbvHsMxKCSa0vXCxeP0oTnKR9T3+ALxLA=;
	b=SMRWy6znacR1TEWfn/i2XAfZJrj9AxLI+Eei61hcvLsnkEGx+kaybdJZI/2sRb6a/8Bt
	 QbvL+hZmbPLS9+tVUwoEU/QzJeT9u+pLorJSG/88Mnvc02Efc2Q/iywqh/CETHt+YS/bs
	 9DbY2/LtdLLmWclWKJW0UfH5dMxvuUj2mgDp91dor55MDWgZS5hoxhgSsQqIiudJVcgQ4
	 ak2r6bStbMH3gEL67iSEm4bHLJ+2p8LaUTeIEHLlJP7hsLohYu8IJObHV5edbmg6+4lY5
	 cjfDCs+IOVjJited62zxucl6H6iXy+y7WbDqV10GbNWdbpK8KSJ9toPC3m1pTA4MCPA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=sang-engineering.com;
	spf=pass smtp.mailfrom=sang-engineering.com;
	dkim=pass header.d=sang-engineering.com header.i=@sang-engineering.com header.a=rsa-sha256 header.s=k1 header.b=doTUqjFR;
	arc=none smtp.remote-ip=194.117.254.33
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46364606A32A
	for <arm-scmi@vger.kernel.org>; Mon, 16 Nov 2026 08:22:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 46364606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=sang-engineering.com header.i=@sang-engineering.com header.a=rsa-sha256 header.s=k1 header.b=doTUqjFR
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=6drH
	vhTiX4LbvHsMxKCSa0vXCxeP0oTnKR9T3+ALxLA=; b=doTUqjFRZjPPJWMbQ+Tr
	sbyo3Gv86lly0r3r3BPeY2eFFgRhoAHd/2VpZTi5nPl9Zg6NWB2SrHUkRBf3nuOs
	3PT+xTyC+AVmfzPfTObi2+Pm6yBU5BDr6H6mDEWIYSaypZBaoeMoib6zUGEdKbz1
	AZBgZAjobfdzuTX9KN338lkY420pVPebdq0KcloW16o0SOt7o9AHem3r7zg6a1W1
	5lXlCP/zV/2rf+vcM1211mWClkN2OMWAHnlBbFLxUsHJWJ/3Q1ttUJD4WUzc7k7m
	/WrQHjZOzlZKMG7tjlX6cM+KPfVUBk8EdBP5ES1DAobSOunyFXrLLkh6oxtRUaiV
	Wg==
Received: (qmail 1195074 invoked from network); 16 Nov 2026 09:22:40 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 16 Nov 2026 09:22:40 +0100
X-UD-Smtp-Session: l3s3148p1@MwQ2e2BgAIkujnv5
Date: Mon, 16 Nov 2026 09:22:40 +0100
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Ulf Hansson <ulfh@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	Marek Vasut <marek.vasut+renesas@mailbox.org>,
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	Kevin Hilman <khilman@baylibre.com>, Vinod Koul <vkoul@kernel.org>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
	=?utf-8?Q?Cl=C3=A9ment?= Le Goffic <clegoffic@baylibre.com>,
	Sudeep Holla <sudeep.holla@kernel.org>,
	Cristian Marussi <cristian.marussi@arm.com>,
	arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org, linux-clk@vger.kernel.org,
	linux-pm@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v4 6/8] pmdomain: Make genpd_get_from_provider() public
Message-ID: <avq9UNth7O5DhxzH@shikoro>
References: <cover.1792163045.git.geert+renesas@glider.be>
 <e3b9d76d5b4a254d561b6e734423063e94225a28.1792163045.git.geert+renesas@glider.be>
X-Mailing-List: arm-scmi@vger.kernel.org
List-Id: <arm-scmi.vger.kernel.org>
List-Post: <mailto:arm-scmi@vger.kernel.org>
List-Help: <mailto:arm-scmi+help@vger.kernel.org>
List-Subscribe: <mailto:arm-scmi+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:arm-scmi+unsubscribe@vger.kernel.org>
List-Owner: <mailto:arm-scmi+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e3b9d76d5b4a254d561b6e734423063e94225a28.1792163045.git.geert+renesas@glider.be>

On Fri, Oct 16, 2026 at 05:55:45PM +0200, Geert Uytterhoeven wrote:
> Unlike the corresponding function in the clock subsystem[1],
> genpd_get_from_provider() is private, and thus cannot be used by PM
> Domain drivers.
> 
> Make it public, so the R-Car X5H Module Controller driver can call it.
> Add an "of_"-prefix for consistency with public genpd function naming.
> 
> [1] of_clk_get_from_provider().
> 
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Tested-by: Wolfram Sang <wsa+renesas@sang-engineering.com>


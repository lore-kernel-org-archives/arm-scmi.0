Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=194.117.254.33
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794817347;
	b=nu4Xm0Rd/I8vOoA+8A7VJDqcLcwXSnBv4JCQDRv3496liouA53YF057dX0Qp3H2LUsPW
	 EN3BBxwRWffJsnNdVhYONRgXrYtJccw6+HTTO9IIaNiaQWKe7CXECebPWguxmac+gQUi1
	 +sf+azgl0vyaiFq3jSmm66D+rhQJYQetSMrLWd3/nuX1RR4CcXekZm0V53ExiLfM8KyDT
	 KitpLGefo/krIBcnh72JfBa4jRWl+UJxBJkQxstmifRqmnJbOb7QeyCbaTlUvA4E0wA3t
	 6nf5hTdkYjFO0QIz4J94h4dkyw/R5MctFEL9dJN3cC/MLCy2OVhRL9mcPvefjlfrpAw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794817347;
	h=DMARC-Filter:DKIM-Signature:Received:Received:X-UD-Smtp-Session:Date:
	 From:To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=6zLq5fm3OmZRvOt3lyD6r9AW3NWjUqASxeSxrYrs2BI=;
	b=xV4v1npZuGp5vBFJ3Pl9fgTR74w+M0O+oVzCr2FtKq2HLuaUZWL/N/BnUwOhsRwyIJP7
	 HMl1H8Pd/h6qe2/dAw05WsOg8uvmWsF4w7d2pggEfaXFw+UgE0d5LVfOyF99W0xnB1idg
	 mIebBy+1pRUkK+TVFFxH3a8icu9uhhMxQqQlxdWrFPTav6OgrbCy7PCeiW+0NYew+EDsQ
	 4JN57zr6xfMYaJLC2M4kV7N2xaJNGzKUxtB7hnx0oakthpAxlmOLyQrvZx+W5m9PCgkZM
	 8GjGkWcCebxdLvP7nmy47GrMbM62xGOxMVs7J/veOT3zzSiScX0H51aU++bL1d8rqBQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=sang-engineering.com;
	spf=pass smtp.mailfrom=sang-engineering.com;
	dkim=pass header.d=sang-engineering.com header.i=@sang-engineering.com header.a=rsa-sha256 header.s=k1 header.b="kY/1Xfsr";
	arc=none smtp.remote-ip=194.117.254.33
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01207606A31C
	for <arm-scmi@vger.kernel.org>; Mon, 16 Nov 2026 08:22:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 01207606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=sang-engineering.com header.i=@sang-engineering.com header.a=rsa-sha256 header.s=k1 header.b=kY/1Xfsr
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=6zLq
	5fm3OmZRvOt3lyD6r9AW3NWjUqASxeSxrYrs2BI=; b=kY/1XfsrFQOr3WDOyqw+
	BL+DpZczzezRMyxqyf9OH83LcdouDCP1xAlUsADWy3VQQ05SwrYUo1ADp/Go6AFA
	VBgRXaVE+2xBIrpsXOwRn3GGMn86wHIhKSV1f8JpfsgoZX0tDqpUkQSjDaktOYPd
	IfqOVQLe4VSglZ27RfzoTwI/fu8lnfxcRBEPDC3RXAm0ZhD1vG60GDjUdPy5sSxb
	S1uDmBwnEUWdtvDPNUH+JpM5NLAc+3T9T/GDLGmDfcYJe2QntA1c++ddmIV49kbd
	LqYdLHiHnoldnzqrQrLTFjBYRspF54oVVay4gUsDPExcbnXW+qh7uFHZmiIUBobE
	uQ==
Received: (qmail 1194710 invoked from network); 16 Nov 2026 09:22:24 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 16 Nov 2026 09:22:24 +0100
X-UD-Smtp-Session: l3s3148p1@jrU8emBg4qoujnv5
Date: Mon, 16 Nov 2026 09:22:24 +0100
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
Subject: Re: [PATCH v4 3/8] reset: Extract __reset_control_get_from_provider()
Message-ID: <avq9QEAGR-C0EZuR@shikoro>
References: <cover.1792163045.git.geert+renesas@glider.be>
 <7df36f036d72403260a51491cd6c3d387f0dfed7.1792163045.git.geert+renesas@glider.be>
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
In-Reply-To: <7df36f036d72403260a51491cd6c3d387f0dfed7.1792163045.git.geert+renesas@glider.be>

On Fri, Oct 16, 2026 at 05:55:42PM +0200, Geert Uytterhoeven wrote:
> Extract the code to create a reset_control structure from a given
> provider into its own function, so it can be reused later.
> 
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> Reviewed-by: Philipp Zabel <p.zabel@pengutronix.de>

Tested-by: Wolfram Sang <wsa+renesas@sang-engineering.com>


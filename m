Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=194.117.254.33
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794817320;
	b=2N078VGmlveLtG3vd3vZwLtUNnbbFBfCMuHrk10pSYGbBWYwS7b3I4iXs1dnfzTND0r1
	 jVG+rWDCqdEODEdn8S9s3uJiQmPOGazJ91hdPciivDlzI8tSXo9Umu5bVEX/9j5gaZFGe
	 CQ/OE6GzJgVjKbK4CK2gtQjHg5+pL0CIbYoNzlkLpjZOdmIFhcEZZxe8o+kjzqSWXa5N/
	 rZjCRu0ZIDvqqS/aSqGPXZ7cJWB4oXnZ5I2XfEDO5xN4hB1WC0lPIGx7Qj6QZRmTJX8NW
	 bEZ45guex9gfxcpjXJRMLq1/bGi61kJt38Xwafw65AE+etexkOHWym6fHM8vF3Bfs5g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794817320;
	h=DMARC-Filter:DKIM-Signature:Received:Received:X-UD-Smtp-Session:Date:
	 From:To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=hFHwL0dJHfEmg6WJ1ZYqq2RC1KHegZZ+9GEzz7lTf8g=;
	b=g+hZsKsf+E7L3T05PGO7OH17CSItM1li/EtJFW+QrFTq9oIjpjOXSeF/j4HOi175gf36
	 AeTTCGu0oYGcZ+H884qkJMZ3cEiCV9F/cITjPiFaCIz3WGnjcCA2jW1nfjG2ojyDC1yrN
	 RRtuu5sg5+Wexh2ruN75KrWgJv/FjJBNIT82jd0JMzrNhXwY6raV4ZZ/dXte2qPRTQnXp
	 kX4cQxo/Nkdl0fj4fMhjJElD08FuOzyL0gSj2v5FjAJ9sqMNfY89WW7O8rEVjAPf7uFbc
	 pQ8+dldDqaS4+Ido0vC8zZrCGhJu0koSUP7LlvTvGFvnlLaGgNK9DBLF91ZiJSfHr1Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=sang-engineering.com;
	spf=pass smtp.mailfrom=sang-engineering.com;
	dkim=pass header.d=sang-engineering.com header.i=@sang-engineering.com header.a=rsa-sha256 header.s=k1 header.b=a6f7XXeI;
	arc=none smtp.remote-ip=194.117.254.33
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EEA67606A329
	for <arm-scmi@vger.kernel.org>; Mon, 16 Nov 2026 08:21:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EEA67606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=sang-engineering.com header.i=@sang-engineering.com header.a=rsa-sha256 header.s=k1 header.b=a6f7XXeI
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=hFHw
	L0dJHfEmg6WJ1ZYqq2RC1KHegZZ+9GEzz7lTf8g=; b=a6f7XXeI4EbsDhCBF8mg
	EX6BluFyS6AAEdff0oZDzmNir0+tHKQfuoo9Ud2sFZnXmUqkaDEenLfPyMLoVwQt
	q9jxxpbDOp7Fe6Ie4a+IRFfewMG9IHTvnGVAgG0YFvkYVD02XuYl7bbFjToGH6VZ
	MC1T308y/oIwXKHChAX8Hvpo573ARyScH8pNA9GE+OEH433phKGPavS0PSlR2oCR
	lzl0YfbXf3+oV4J0oPwBp3EhjPWHkkfhATrc9Td5LkXy4YuegozzUle2gKLAaK9g
	aUD5estbCHMNCuTAydnLrBZb6ldUjle5Q+dYJ3771VHcZHXVtbO78xnP+5kAewtD
	kQ==
Received: (qmail 1194292 invoked from network); 16 Nov 2026 09:21:56 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 16 Nov 2026 09:21:56 +0100
X-UD-Smtp-Session: l3s3148p1@dYeTeGBgHroujnv5
Date: Mon, 16 Nov 2026 09:21:56 +0100
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
Subject: Re: [PATCH v4 0/8] R-Car X5H Ironhide CPG/MDLC SCMI remapping support
Message-ID: <avq9JH17YzYlO3Hk@shikoro>
References: <cover.1792163045.git.geert+renesas@glider.be>
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
In-Reply-To: <cover.1792163045.git.geert+renesas@glider.be>


>     Describe hardware in DT, and perform mapping to abstractions offered
>     by SCMI in Linux.

I used this series in multiple branches as a base to enable further IP
cores on the X5H SoC. Worked fine, so tags for testing are coming now.


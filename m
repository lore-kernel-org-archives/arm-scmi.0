Received: from mail-vk1-f179.google.com (mail-vk1-f179.google.com [209.85.221.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A8E53346BE
	for <arm-scmi@vger.kernel.org>; Mon,  3 Aug 2026 12:01:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785758495; cv=none; b=jp3i2NsEovejescLFH9jBm+fZ4tDp4uacujrCQ5ey23tYCRR0697nLzVRdB2SZgv9teiyJPapUodhEooWjWqdDqDXNMB6xZjP35er9OHShcdWDl8j6dPT4zVTntwsuW/6ITvVDPL4XwOL2x1OLzRQv7aIMCdW+yPjx1XxS1X/aM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785758495; c=relaxed/simple;
	bh=okWIOwpaAfBMcyH50oSVfKzplqlhnVTdVosRYGHHdGI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=l3Q1dZS05UnNcGPU5nFxY+yUGzIbAUf4HRy1MFWawqR+oRB1rap3384q5s7gBaLV5w0xS8H1BRApv124HjRrer3/FZ1qq4uRVDCeY9GbzWpRPn4o5Z09T1kVpux38mDqbF2uDRM5a2FJXITq0OGpdZRgmOWfWRGjy1x9583gBuQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f179.google.com with SMTP id 71dfb90a1353d-5c2c96286f0so1595982e0c.3
        for <arm-scmi@vger.kernel.org>; Mon, 03 Aug 2026 05:01:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785758492; x=1786363292;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=/3F2htAaSgkkxvZ/5MPPccMC2gln25kjMNeYIdiRBb0=;
        b=YvbcUWVYAwpPHYenSmQhDHvOFsPwlamoyLKIWO/9PsyZh+DaHax8E0oRP6LLd3FhjL
         gG3zZpzADVxi3BJfVvMhP3HhjChXoY8BA/6lv6y9rGCu3TE09fxTKJP0yqFh2OxS8w+E
         KKzGs9B2Mln7ly1mO6wujrZScCQZ/Ez+sygcj37wnNAs3gt9GmsBt/893xgZ7mhNmbuw
         qvTju8TvwGSq+RV2t3x8Nb31e0cJaezzOG1Bs1/3zD/siT40JID0xUfNWS1Ow67ExxtW
         ujdjm3LFckM6nV9cOMan1TV+cAuKrvg628Fnmp5tKGkboOgBpi0/fHgOLaRafuwyHqs5
         YcVw==
X-Forwarded-Encrypted: i=1; AHgh+RojZcxJs0FLyWDV9z4Hd7byIViulzYuM044ukPHeU+hhNzCTbCIZm5/FdSIR5L3RI+RkpQfGwK4XQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxKHaOZkdXpbF0BAx5Lq/qwhHGbaSeQ4ZZVDAvb2U+TS3rxdIzo
	j9EsDutJUGX3CS9vllA8I7bqmbL5IzkF5pUu3Pwhsr6rZx3V4aQrwxYU6yd7iUUY
X-Gm-Gg: AR+sD13TxS51sBXGx2VunPxrf8Hs51alTqGFjiLi+ZIfVM5evV7tspKUqv6cZBzPT9h
	82Fch25XQOk6NDi6cPODDr5Q/tP16+vB5tYG4yBULr2HBSBNpBK1LJ0S8vSJvm7K+G/Pz5IoQrj
	ZICwoCO1SKUKbK483ZdysZUx8pd0WeJn3gLzOrAoMLVuQUBRj4AVP7VQUXGbOmT5xLyZbqIesvY
	rpOzg2NpZbgwfxOK/n8p5SwBNH0sU+1XDnROt4a+6kyvu4Rv1tbWGnKOuJ7BFt1TzWEx1IUKS0w
	fDnjygkRY7s3qu6BcoNok7/5fmXFYCyWWKxiJniAtbxoG22KxhibfUAkPCwbBWCOA2mw2UroSYg
	iVTZsAW5x4JmcCWI3YwG7n4M4dO6ytNyPhBdgflXdclR/KP431QRLturXhtCICW38IPak3kgfHT
	UIYOBM2aZNi1Dsi8e66G34/9DHr8hMXATSpUbQCFucnawZxh1bHIGFLmjw8vZKTldKS5jWROztu
	ZA8YGZL0X6YuxqdFiqeTbWl7u1h6g==
X-Received: by 2002:a05:6122:468c:b0:5a1:fbbd:6bd0 with SMTP id 71dfb90a1353d-5c38769fd1cmr2181971e0c.5.1785758492017;
        Mon, 03 Aug 2026 05:01:32 -0700 (PDT)
Received: from mail-vk1-f182.google.com (mail-vk1-f182.google.com. [209.85.221.182])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5c3b0af156bsm1748018e0c.14.2026.08.03.05.01.30
        for <arm-scmi@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 03 Aug 2026 05:01:30 -0700 (PDT)
Received: by mail-vk1-f182.google.com with SMTP id 71dfb90a1353d-5c2c96286f0so1595922e0c.3
        for <arm-scmi@vger.kernel.org>; Mon, 03 Aug 2026 05:01:30 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RpX/bgB6VFwQfiYbDAhFbVdfTAqDrnInlyvL1Q0rSd28aicmOpc+xs99hFzgXHnAYD9ASz1uFJJNA==@vger.kernel.org
X-Received: by 2002:a05:6122:c94:b0:5a0:370:f12c with SMTP id
 71dfb90a1353d-5c3877ee9a2mr2551587e0c.11.1785758489767; Mon, 03 Aug 2026
 05:01:29 -0700 (PDT)
Precedence: bulk
X-Mailing-List: arm-scmi@vger.kernel.org
List-Id: <arm-scmi.vger.kernel.org>
List-Subscribe: <mailto:arm-scmi+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:arm-scmi+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1783505329.git.geert+renesas@glider.be> <49726acff0fee1c3606e83c4f242ef6aad25b4b8.1783505329.git.geert+renesas@glider.be>
 <20260710-adventurous-burgundy-chimera-b2fff9@quoll> <CAMuHMdV=ckONBbTYELPJU8YWoNzdu3PJ95VR8cz+f_7dUeiPUw@mail.gmail.com>
 <20260716214924.GA1477674-robh@kernel.org>
In-Reply-To: <20260716214924.GA1477674-robh@kernel.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 3 Aug 2026 14:01:18 +0200
X-Gmail-Original-Message-ID: <CAMuHMdU0ss6wUEdjC+OYa3iQS439aJ8b_d9M2ws7Ayn4_kOyMQ@mail.gmail.com>
X-Gm-Features: AUfX_mxcGqdlDliYxmfdCYiKuiCZlBR4i5y6ZczTyLGv0wHHqfKRM8R7C8jMMeU
Message-ID: <CAMuHMdU0ss6wUEdjC+OYa3iQS439aJ8b_d9M2ws7Ayn4_kOyMQ@mail.gmail.com>
Subject: Re: [PATCH v2 05/10] dt-bindings: clock: renesas,r8a78000-cpg: Add
 firmware property
To: Rob Herring <robh@kernel.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, Sudeep Holla <sudeep.holla@kernel.org>, 
	Cristian Marussi <cristian.marussi@arm.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Saravana Kannan <saravanak@kernel.org>, 
	Ulf Hansson <ulfh@kernel.org>, "Rafael J . Wysocki" <rafael@kernel.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>, 
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>, Vinod Koul <vkoul@kernel.org>, 
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, Kevin Hilman <khilman@baylibre.com>, 
	Florian Fainelli <florian.fainelli@broadcom.com>, 
	Wolfram Sang <wsa+renesas@sang-engineering.com>, 
	Marek Vasut <marek.vasut+renesas@mailbox.org>, 
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, arm-scmi@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-pm@vger.kernel.org, linux-clk@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Rob,

On Thu, 16 Jul 2026 at 23:49, Rob Herring <robh@kernel.org> wrote:
> On Fri, Jul 10, 2026 at 01:02:39PM +0200, Geert Uytterhoeven wrote:
> > On Fri, 10 Jul 2026 at 12:21, Krzysztof Kozlowski <krzk@kernel.org> wrote:
> > > On Wed, Jul 08, 2026 at 12:16:23PM +0200, Geert Uytterhoeven wrote:
> > > > Add a firmware property, for systems where SCMI must be used instead of
> > > > direct hardware access.
> > > >
> > > > Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> > > > ---
> > > > v2:
> > > >   - Spin off from "dt-bindings: clock: Document Renesas R-Car X5H Clock
> > > >     Pulse Generator".
> > > > ---
> > > >  .../devicetree/bindings/clock/renesas,r8a78000-cpg.yaml    | 7 +++++++
> > > >  1 file changed, 7 insertions(+)
> > > >
> > > > diff --git a/Documentation/devicetree/bindings/clock/renesas,r8a78000-cpg.yaml b/Documentation/devicetree/bindings/clock/renesas,r8a78000-cpg.yaml
> > > > index 4e23bba334382346..fc499e7cf52e4f0c 100644
> > > > --- a/Documentation/devicetree/bindings/clock/renesas,r8a78000-cpg.yaml
> > > > +++ b/Documentation/devicetree/bindings/clock/renesas,r8a78000-cpg.yaml
> > > > @@ -35,6 +35,12 @@ properties:
> > > >        <dt-bindings/clock/renesas,r8a78000-cpg.h>.
> > > >      const: 1
> > > >
> > > > +  firmware:
> > >
> > > RPi is doing similar, but I have doubts. It looks way too close to
> > > generic "syscon" which is disallowed.
> > >
> > > I think this should be vendor+purpose specific, e.g.:
> > > "renesas,scmi-transport" or "renesas,scmi-firmware"
>
> If you can tell me the resource that a 'firmware' provider provides then
> it is fine, but you can't.

It provides a firmware API, which is not available until the firmware
provider is initialized.

Thanks!

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

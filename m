Received: from mail-vs1-f52.google.com (mail-vs1-f52.google.com [209.85.217.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7C333D666A
	for <arm-scmi@vger.kernel.org>; Fri, 10 Jul 2026 11:02:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783681377; cv=none; b=X0gm2M2+u4uFBnsJxCyxcmTphD9VK0My0kGr9vvDb2h4ONlS045u80hU5FbIgS3ssholvrE3VG/r4IEvAhbs+w+JF9wUxUjop/fEzXwBP1/ELFyLJC9POcbj+ChxJrps+KAxOtz5Jb66t98KSREuNawalQAm5ND9BZesZD1Sjqk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783681377; c=relaxed/simple;
	bh=TAoC8AtqfvyrcOiH125Z48ckCbhqCjSDAUjYBMGFx+c=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ujuL1Q2Q4b0pGIPLktXAKZOikIRA4D33IiZ1p12GbOAYFFkJ5SgS3EWRoqdDoAYzLhPYse78HIu8RzeAjbiU3JK/tRX+Whwl3YoeMEndTXmKHPWcPWp+VRUFwvD/JSMRxp+rINQUpfYrCVezb9LJBH9cjdTcLpvRiLXoaAbkUJU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.217.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f52.google.com with SMTP id ada2fe7eead31-7389cff36bdso291534137.1
        for <arm-scmi@vger.kernel.org>; Fri, 10 Jul 2026 04:02:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783681372; x=1784286172;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=MuUmGqSSA58rP0nRidv37IIoymAVqS6FDOb1XQHbyds=;
        b=WVxWXtfRep2501tdnhCaFhB2HNgccpSe2OMo0zHuACWx64at8+w5jg9k479xFNF+I3
         BRqSWlPjjBKoIJIClxrCxbCKknmp0ysG+9H1Nq9opdltnnY77miRAbi3EOJ4yjcFsP6L
         xb8Ch24g5wxHfQb000Z8F+Zri4giZk7Bk3QvFWUDfs3YexDm6QWL1pFrUQ1zkb/QY0/h
         6RpP2/KIl9JCT6Owi5COzTC6mvDMcFNvMY1gV0nKqfeihXIEwlnQNhkycc4rHthHNdxq
         Kii9WV1VVZMDSVgHvE9FNB74XnVEA9l7a/E4UcQDc5FsMTL1TzEwh/8rrNvobXzRTPPm
         uLNA==
X-Forwarded-Encrypted: i=1; AHgh+Ro+8EavizKLEHQsUM5uHzn+z0+aDxQQSBnIvni9P2edHqm4b4QWRVKJDU5VCsS140fY5vC+hLJYcw==@vger.kernel.org
X-Gm-Message-State: AOJu0YzHu9vkhFbHGxMf1TFnEQ4quL+saVGVWGjDk2M4WzKBXGXYGdUd
	JRjvmhkgCLuWaGTarCRCS94yQAXtR2a4CuzgsiSvae+FIRs2dk57ZfL/BRcS3s0Nrgo=
X-Gm-Gg: AfdE7cmJTWfSGZI7m2cXxSKX8Apw/15YWcjSlArMmYnHuTzZ6zsCDKXNgB5geafrkMk
	HOOEfPd+q7wRq56JMhCcqgCxW4PKk2gKbKZ1E90XUoTBmGSvZmIHF1WYKWRNfZBzOGLAAlmTu5L
	Zo3ckW5FItcfFh9m01NhKkj2IUqK4rbvW529MfKd5XlelHwy8itTwvY70N0gcZoqHM/+IWpIj4R
	f5SzURgps80F9QmcitGZwn4o97iits6HOHTM9RbHgQ/1KKyygc3PhOpW392uY4SdMz770pvwjSv
	w5GpliKEZP52V2izbRmP36HN4+DFqntDiq7PsxLVRIvwkgHzoVMU1XSndQiIYxw6VkZ7Ny1XW/w
	cOUlwdGXf+xYcgI7FDVIHH9pVLx2YuxXocooOnRkJs9FS3fECkc1EixRpoZbSY974Pxn7PXMUOh
	M4+mlGErVrY4jKciD3J0zA9s9fFsPJRdENfhzefLD0lHG7c0aWsw==
X-Received: by 2002:a05:6102:374a:b0:738:9bf0:f80c with SMTP id ada2fe7eead31-744e00463admr6686006137.9.1783681372475;
        Fri, 10 Jul 2026 04:02:52 -0700 (PDT)
Received: from mail-vs1-f50.google.com (mail-vs1-f50.google.com. [209.85.217.50])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-744d6deb1aasm5139917137.7.2026.07.10.04.02.51
        for <arm-scmi@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 10 Jul 2026 04:02:51 -0700 (PDT)
Received: by mail-vs1-f50.google.com with SMTP id ada2fe7eead31-7389cff36bdso291523137.1
        for <arm-scmi@vger.kernel.org>; Fri, 10 Jul 2026 04:02:51 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RptgZ0nv5NqQlGICUoDT2rfwR9eapCkZ66W5ue9joVOEysMAB38CS8Wu6ieQRvEX8lvFJ2DNxYkXw==@vger.kernel.org
X-Received: by 2002:a05:6102:5789:b0:73e:9fae:5844 with SMTP id
 ada2fe7eead31-744e0426fd6mr5821388137.27.1783681371174; Fri, 10 Jul 2026
 04:02:51 -0700 (PDT)
Precedence: bulk
X-Mailing-List: arm-scmi@vger.kernel.org
List-Id: <arm-scmi.vger.kernel.org>
List-Subscribe: <mailto:arm-scmi+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:arm-scmi+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1783505329.git.geert+renesas@glider.be> <49726acff0fee1c3606e83c4f242ef6aad25b4b8.1783505329.git.geert+renesas@glider.be>
 <20260710-adventurous-burgundy-chimera-b2fff9@quoll>
In-Reply-To: <20260710-adventurous-burgundy-chimera-b2fff9@quoll>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 10 Jul 2026 13:02:39 +0200
X-Gmail-Original-Message-ID: <CAMuHMdV=ckONBbTYELPJU8YWoNzdu3PJ95VR8cz+f_7dUeiPUw@mail.gmail.com>
X-Gm-Features: AUfX_mypDnJ4qFpPLK-a5R1Mbwkbc6yQr178xDsRkCp5yARGuoX_7FuK_KFx-r8
Message-ID: <CAMuHMdV=ckONBbTYELPJU8YWoNzdu3PJ95VR8cz+f_7dUeiPUw@mail.gmail.com>
Subject: Re: [PATCH v2 05/10] dt-bindings: clock: renesas,r8a78000-cpg: Add
 firmware property
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Sudeep Holla <sudeep.holla@kernel.org>, Cristian Marussi <cristian.marussi@arm.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Saravana Kannan <saravanak@kernel.org>, Ulf Hansson <ulfh@kernel.org>, 
	"Rafael J . Wysocki" <rafael@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Brian Masney <bmasney@redhat.com>, 
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

Hi Krzysztof,

On Fri, 10 Jul 2026 at 12:21, Krzysztof Kozlowski <krzk@kernel.org> wrote:
> On Wed, Jul 08, 2026 at 12:16:23PM +0200, Geert Uytterhoeven wrote:
> > Add a firmware property, for systems where SCMI must be used instead of
> > direct hardware access.
> >
> > Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> > ---
> > v2:
> >   - Spin off from "dt-bindings: clock: Document Renesas R-Car X5H Clock
> >     Pulse Generator".
> > ---
> >  .../devicetree/bindings/clock/renesas,r8a78000-cpg.yaml    | 7 +++++++
> >  1 file changed, 7 insertions(+)
> >
> > diff --git a/Documentation/devicetree/bindings/clock/renesas,r8a78000-cpg.yaml b/Documentation/devicetree/bindings/clock/renesas,r8a78000-cpg.yaml
> > index 4e23bba334382346..fc499e7cf52e4f0c 100644
> > --- a/Documentation/devicetree/bindings/clock/renesas,r8a78000-cpg.yaml
> > +++ b/Documentation/devicetree/bindings/clock/renesas,r8a78000-cpg.yaml
> > @@ -35,6 +35,12 @@ properties:
> >        <dt-bindings/clock/renesas,r8a78000-cpg.h>.
> >      const: 1
> >
> > +  firmware:
>
> RPi is doing similar, but I have doubts. It looks way too close to
> generic "syscon" which is disallowed.
>
> I think this should be vendor+purpose specific, e.g.:
> "renesas,scmi-transport" or "renesas,scmi-firmware"

The disadvantage of a vendor-specific property is that there are more
cases to handle for fw_devlink, cfr. "[PATCH v2 02/10] of: property:
fw_devlink: Add support for firmware"[1].

> Also we have "firmware" nodes, so this might cause conflicts in dtschema
> validation.  Anyway, the phandle itself is fine for me, just the naming.
>
> I'll ping also Rob to chime in.

Thanks!

[1] https://lore.kernel.org/de34ac0c52695d92c67cf950b3d8e9b30095d305.1783505329.git.geert+renesas@glider.be

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

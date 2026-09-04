Received: from mail-vs1-f53.google.com (mail-vs1-f53.google.com [209.85.217.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41A4E4CCDFE
	for <arm-scmi@vger.kernel.org>; Fri,  4 Sep 2026 14:42:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788532968; cv=none; b=BhXAxJOB9LLbeR0ReM93ygUvty6rsavdUTBdE8vKiX2ZIDTGcxtrkxheYqYaJtOhrHGBuHWbPpkT76BmxhNfRRj7CyVd6zCaSL8g54PDXTTYqhOKJlQqZtp53oJ1v0/q8A+9vgR/TQySD/PdG7mBktBVvM7L4FoDf0JdD1l1iUo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788532968; c=relaxed/simple;
	bh=TcGIo92RiATa8vkGJVdjHgxt9WlzbewL1KtAW6cGFCg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=WQnp3yrUphYhM1W4/QUHvyfZ67QcFY3Qkw9dN/RoD0IduSWMmQLnFN8CV3dPgTnvE7iIS8w/D/mIh5JtyUOYd1m+TlpmEJADtU9/PQIuJJUUFXvv+vsaYHdWmSmkrnr9ifnJav+WlwYiQ7JYV/LfVFO8iw4Uod6a0OemzMXuHzk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.217.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f53.google.com with SMTP id ada2fe7eead31-765c077b5c1so370683137.3
        for <arm-scmi@vger.kernel.org>; Fri, 04 Sep 2026 07:42:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788532965; x=1789137765;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=iy22q1YzKGiQPGN9B1bpmbrGTjC/sYmYXe5uXN4aXJo=;
        b=Ttm2+16LoIkVgVUiM3TV3UuBtnSeB1pLPu+yWjTzT+hJ6W/7gBIvGG1ZkTH4aa/Wc8
         jDZh5U5Fw5icpgZ0WO8HXN7hk78Rf5WkZJSbbFVWIFZ1Fk0vncEQhe19lU3qFuzlbNGe
         skbxIhBBcLwlg43BSGiLkWkJn7lZ1Me/a+E+nCuUXztDDH0f/uYPGx5anpoY/C6VI6xC
         l8KYchiIBkvFOaM5flNB8BYpQhC/7nmCD29bfhLSAndjpSyYa4FCT393+z+ofbtnNzor
         TBVbxXvXNijsaSiijBg/pw48VgNOrBRebzUKz/xDFQ/AO/jnGffgsQ48ymOBySmi0L3D
         JTyA==
X-Forwarded-Encrypted: i=1; AKwUvBzS83WQF+v75xcgJEIwGjqx6DTPwpX42dmSEeRDjbLOPqgvXncrbLUjIXAcysZx4oUh8SGvCkGOtg==@vger.kernel.org
X-Gm-Message-State: AFuF++nrI3cUagcBNUUHtVR+WB2FK0j+BEDamNypWWlU7KwU2WZIEy/N
	Yn7OLxhMMsuBFxXOQGJDA0NaLj51stYTu+w4JYbZfAPG46c9Ka8UNOhaCZ2xCDG6S6c=
X-Gm-Gg: AYBFou3x2rzQhilLm/Ysis56K90i31m/XAGj92pEttHn/ZfdZXKYE/hED/rexLq157y
	kQSIqo+qdOz7gKtU0IHj3wUxv+aW3aEqfZ8+rLYjQQxjq3ovfYlgEYF7lfjPbr/7BUXfuUQSU8I
	2JqD8Xwf39SNF6fwq7dM568OPcXoH+poj4KRPpt6fUlmif91Xt1LVvVAaK7ktEZ3O+YmXmH2TJP
	iWjQWvJhJ4EATvIbGaJVu57myIoFJ3AV3FT2RsCpyUeDdlrvSO7WQpbifAJSBprKv+t48h09Lrk
	6UNJARI+ukS8o5oC2gy1mURlH8/wF9fipjC4Mam08zddtkNH8Q2BIN27IbutkjdUmuHw1p0JNz7
	1mVYhtSkPcRceVCSy+a64n9LbH/9UPcs4raq4POb8nPL1NEUL2wbAICSe/avhW+O9hs1znSrs4G
	r2ql3vjGDFGX/xGvEELGJ/6YUce9zcBwubqWf3thEJ3GBJqaWSjZG3lio81AG+7la1FSLzSXBbr
	2zgMVCR1fDM26YP8+HJXKnAAA==
X-Received: by 2002:a05:6102:2925:b0:785:ac20:bdc4 with SMTP id ada2fe7eead31-78a4aa0796amr1832537137.10.1788532964292;
        Fri, 04 Sep 2026 07:42:44 -0700 (PDT)
Received: from mail-ua1-f53.google.com (mail-ua1-f53.google.com. [209.85.222.53])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-78a478ad217sm1882980137.2.2026.09.04.07.42.41
        for <arm-scmi@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 04 Sep 2026 07:42:42 -0700 (PDT)
Received: by mail-ua1-f53.google.com with SMTP id a1e0cc1a2514c-97e9fb0fc58so360083241.1
        for <arm-scmi@vger.kernel.org>; Fri, 04 Sep 2026 07:42:41 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBwoiwXUGhvo5onAZCYw+yKZjpEur1ILeUjPj5GnIJbcu6FFn3I2NL+WOpB7Bgmj/8EYCRQOto2Wqw==@vger.kernel.org
X-Received: by 2002:a05:6102:2d04:b0:785:eb33:87a8 with SMTP id
 ada2fe7eead31-78a4a883885mr1900429137.4.1788532960799; Fri, 04 Sep 2026
 07:42:40 -0700 (PDT)
Precedence: bulk
X-Mailing-List: arm-scmi@vger.kernel.org
List-Id: <arm-scmi.vger.kernel.org>
List-Subscribe: <mailto:arm-scmi+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:arm-scmi+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1788338320.git.geert+renesas@glider.be> <2cf42d7ef9b452efbab3007ec2c2340cf87adbbf.1788338320.git.geert+renesas@glider.be>
 <20260904-fabulous-lionfish-of-cookies-0d614c@sudeepholla>
In-Reply-To: <20260904-fabulous-lionfish-of-cookies-0d614c@sudeepholla>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 4 Sep 2026 16:42:29 +0200
X-Gmail-Original-Message-ID: <CAMuHMdU_u1ticUomZffY8iU2GoWgyTNDPaL2O6KB7yucr47dDA@mail.gmail.com>
X-Gm-Features: AcwNN1WAkp69Or55f6uh4v6WhdtMEG7Qz9QclhM1mQOZ0FBl4cYNnC9KwnYi2zM
Message-ID: <CAMuHMdU_u1ticUomZffY8iU2GoWgyTNDPaL2O6KB7yucr47dDA@mail.gmail.com>
Subject: Re: [PATCH v3 01/12] dt-bindings: clock: renesas,r8a78000-cpg: Add
 renesas,scmi-firmware property
To: Sudeep Holla <sudeep.holla@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Stephen Boyd <sboyd@kernel.org>, 
	Brian Masney <bmasney+clk@redhat.com>, Jerome Brunet <jbrunet+clk@baylibre.com>, 
	Cristian Marussi <cristian.marussi@arm.com>, Saravana Kannan <saravanak@kernel.org>, 
	Ulf Hansson <ulfh@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
	"Rafael J . Wysocki" <rafael@kernel.org>, Marek Vasut <marek.vasut+renesas@mailbox.org>, 
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>, 
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, Kevin Hilman <khilman@baylibre.com>, 
	Vinod Koul <vkoul@kernel.org>, Wolfram Sang <wsa+renesas@sang-engineering.com>, 
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, 
	=?UTF-8?Q?Cl=C3=A9ment_Le_Goffic?= <clegoffic@baylibre.com>, 
	devicetree@vger.kernel.org, arm-scmi@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org, 
	linux-pm@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Sudeep,

On Fri, 4 Sept 2026 at 16:03, Sudeep Holla <sudeep.holla@kernel.org> wrote:
> On Wed, Sep 02, 2026 at 01:29:17PM +0200, Geert Uytterhoeven wrote:
> > On systems using the ARM System Control and Management Interface (SCMI),
> > the Clock Pulse Generator hardware registers must not be accessed
> > directly.  Instead, the SCMI message protocol must be used for inquiry,
> > configuration, and control of clocks.
>
> Why is this node needed in the devicetree at all or why is it not disabled
> so that any driver in the OSPM is not probed at all.

The node is needed so the corresponding driver can bind against it.
The driver takes care of remapping DT hardware descriptions to the
abstractions offered by the SCMI firmware when SCMI must be used.

> > Add a "renesas,scmi-firmware" property to distinguish between systems
> > with and without SCMI, and to indicate which SCMI firmware interface
> > provider to communicate with.
> >
>
> I still don't see the need for this if you disable the node, so still

The node is not disabled.

> NACK. Sorry if I have missed some discussions, please present the information
> as part of this patch in the commit log if not the actual binding itself.

That's why we have cover letter, with links to previous versions and
discussions.
Thanks!

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

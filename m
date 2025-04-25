Received: from mail-yw1-f169.google.com (mail-yw1-f169.google.com [209.85.128.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2FE623F28B
	for <arm-scmi@vger.kernel.org>; Fri, 25 Apr 2025 11:09:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745579360; cv=none; b=HG0irxaXac3wsDNVWJcSxBy/G1I1OKaJV/x8Hz5A7wbGBusoN0hTtRdodt95al/NxyNOGcx1nphTSW1pAqwhcpx4Y9KO1kT6tcyvahOTa5SQT4YduJ2c4tmORshWFyNqdx6P2PA//cWfV8sFNbzwmNijrX5lTSp0jIT/qsjzk2U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745579360; c=relaxed/simple;
	bh=j/gWmX8GvuT8jxAPqlDE8B1MxIGH9QHCA/Dggl3YU5g=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=D8FBBWpx4RVRUVins5rtBBcT43Ds+y1Ja19FuvivFlIBw64Pb8632CiH9+ihALJF8q9+PfKbN5cYvZNwQGpdST+emQt/STpczRaxyLhoXF6P8TO4pfVab10s16TYAyUBDUL0E+iw+2sZrDFHSxhB/gQmg+mEgS6czZCD9NgeKrc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=aN00blv1; arc=none smtp.client-ip=209.85.128.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="aN00blv1"
Received: by mail-yw1-f169.google.com with SMTP id 00721157ae682-70814384238so20233807b3.0
        for <arm-scmi@vger.kernel.org>; Fri, 25 Apr 2025 04:09:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745579357; x=1746184157; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Vdpaj8DEUgsVRGDA8DLShiVUukBJ/j77owX/yhBRdSs=;
        b=aN00blv1VKL0X8KbiVIfCmt0mSD08YKCOzgHXXrYeypKo2pfA6vLbduyCG1ktulp3X
         zQ4N96cz1pSClODr7iMydNYnH5RSszTZu7LhA3fRrTeMwoViOEm1yKRVqX7mWBrmlXVi
         Yh0QAk4G2xFC+NdZaglg3FrD3gIpUzf8UEUw49q3zx7pbYe7u45VhwOBLNF7Qzlou0tw
         Y2yzLNlDYPetA1p5WTdpnoE2ff1HhypxfUreBqA//mQsbqYSrj3/8WVU6/AoBkQFI6HS
         zGl5TaOdIGq8sq2bS0+CJ2HHKiBOx7ZU0jwc8QJ4K0XdlklUb8S7MyIcXMjtdENW/mFf
         2TVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745579357; x=1746184157;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Vdpaj8DEUgsVRGDA8DLShiVUukBJ/j77owX/yhBRdSs=;
        b=aNcnhFKE+eaUcPAL520or03oT0EfAQjC4gxtTJgwjEfC4RgDZMCOW9O8q4xV/dd8RK
         LOcxt3o/5qWIjy5OO8zK29Y4VXKobM3Cym4JITf30/who84I2Aa+nAeYRaTwnV4P5mZc
         4F2/M1Nsr1RJ8w1rdWJpXahbrjIt+hcrmAmASsSzddjXU6psHm9IE3Jzf0ffsQckIFw7
         Vzwmc+ATg+KxzW/vXzbqFXo7YP3IlAE0lDjGrvT/frB2jCbPXjqIYB35ePT8PXIXfuO9
         QSct93WpbgDAcwzv947eYbipKOnvVvYa51fmsdpeBCHiCgXZPmpUQ/vzmej11vo+1l2F
         CGBA==
X-Forwarded-Encrypted: i=1; AJvYcCWe2ppziJN4lGBvlxdVaKyZr3nvtYtn5y9jqAnDM/oRw50n+iumz0gxa83GhhFiOmYRoXJ5/mvnsw==@vger.kernel.org
X-Gm-Message-State: AOJu0YzFkKcsWY7S5XbeQ3TOChveHQURmIkQRkTgKDUrVzvvJeAHZeFG
	DAkiKDBIpBIYGNUDIihJYZud6DSkaVgzZ7yq7byFJoAAuoho3TgEF/mfIpOPHzGzXUwmuKATow/
	TuPSDbUkGeYBshu4Tiw5B1w8dbuTpTF8E/Ku/Yg==
X-Gm-Gg: ASbGnctlr0OUa98MrspTCievM6qzwND7vTl4QLazMNd83B8bRhFpA5XQyfbA4F2VAUd
	p0QCrrxE490ogLMI62L2Zkw7jTzcK1HsY67k3rZ7CNhAJhAMF4S+U5jwThKtOtPuBijHQVSNOnt
	y1wx5zg42YSfxw3j6g0jqBdwQ=
X-Google-Smtp-Source: AGHT+IFWv5DgI+p9D2BzYStNDu81hZBwNBoWqPp3Aqk8BZKnS6wxtPpAfxF00i+WHkNcDTNq5kFtgg4BRJdABS+uu9Y=
X-Received: by 2002:a05:690c:9993:b0:6f9:7921:480e with SMTP id
 00721157ae682-708540be371mr20321437b3.5.1745579357576; Fri, 25 Apr 2025
 04:09:17 -0700 (PDT)
Precedence: bulk
X-Mailing-List: arm-scmi@vger.kernel.org
List-Id: <arm-scmi.vger.kernel.org>
List-Subscribe: <mailto:arm-scmi+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:arm-scmi+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <7hecy3h7ky.fsf@baylibre.com> <CAPDyKFoLJ4zey6GNzCb9roAAJ5mS7B7exU1NEKtpLyyjD0aADA@mail.gmail.com>
 <7hikn5c5v8.fsf@baylibre.com> <CAPDyKFpuqk3jH91rkDDz_kejyJ5pFg5XH+=vdTA2aP8MJKUWrw@mail.gmail.com>
 <7hzfgf8xsw.fsf@baylibre.com>
In-Reply-To: <7hzfgf8xsw.fsf@baylibre.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Fri, 25 Apr 2025 13:08:41 +0200
X-Gm-Features: ATxdqUGeVCGcP0Vfnu8p_OCTqerObJmf3ATvEWoHjNZG9zzicJKDXi3iflzZ0-Q
Message-ID: <CAPDyKFo_P129sVirHHYjOQT+QUmpymcRJme9obzKJeRgO7B-1A@mail.gmail.com>
Subject: Re: mixing SCMI and PSCI power domain hierarchy
To: Kevin Hilman <khilman@baylibre.com>
Cc: "cristian.marussi@arm.com" <cristian.marussi@arm.com>, 
	"souvik.chakravarty@arm.com" <souvik.chakravarty@arm.com>, Sudeep Holla <sudeep.holla@arm.com>, 
	"arm-scmi@vger.kernel.org" <arm-scmi@vger.kernel.org>, Dhruva Gole <d-gole@ti.com>, 
	Sebin Francis <sebin.francis@ti.com>
Content-Type: text/plain; charset="UTF-8"

On Thu, 17 Apr 2025 at 01:57, Kevin Hilman <khilman@baylibre.com> wrote:
>
> Ulf Hansson <ulf.hansson@linaro.org> writes:
>
> > On Wed, 16 Apr 2025 at 02:22, Kevin Hilman <khilman@baylibre.com> wrote:
> >>
> >> Ulf Hansson <ulf.hansson@linaro.org> writes:
>
> [...]
>
> >> > 2) Enable parents to be described in the "scmi_pds" node. To do that,
> >> > we need to extend the DT bindings a bit, as we need the SCMI index
> >> > that should correspond to the SCMI-child-power-domain. In other words
> >> > "power-domains = <&TOP1_PD>" would not be sufficient.
> >>
> >> This is the direction that I was thinking makes the most sense, and
> >> actually reflects real hardware.
> >>
> >> If you have any thoughts about what that binding change should look
> >> like, maybe I can have a look at implementing it.
> >
> > Usually we describe parent domains by using the original power-domain
> > DT binding, but this is limited to work for when the child-domain node
> > has #power-domain-cells = <0>.
> >
> > We need to investigate if there are any other DT bindings we can get
> > some influence from, perhaps clocks have something similar?
> >
> > Anyway, without further thinking my idea would be to add a new
> > property ("power-domain-child-ids") where we can put a list of indexes
> > for the child-domain that corresponds to each of the parents that we
> > can list in "power-domains".
>
> OK, I have an idea.
>
> First, the normal stuff.  We have the SCMI PDs:
>
> &scmi {
>         scmi_pds: protocol@11 {
>                 reg = <0x11>;
>                 #power-domain-cells = <1>;
>         };
> };
>
> Then we have an example leaf node which uses that:
>
>         main_timer0: timer@2400000 {
>                 [...]
>                 clocks = <&scmi_clk 47>;
>                 clock-names = "fck";
>                 power-domains = <&scmi_pds 15>;
>         };
>
> And then, we have the top-level PD controlled by PSCI:
>
> &psci {
>         compatible = "arm,psci-1.0";
>         method = "smc";
>
>         MAIN_PD: power-controller-main {
>                 #power-domain-cells = <0>;
>         };
> };
>
> Now the new idea: The hierarchy I want to represent is that main_timer0
> is in SCMI PD 15, which is in the top-level domain MAIN_PD.
>
> So, what about simply extending the SCMI binding where we can
> (optionally) define a parent domain for each SCMI ID?  So the SCMI node
> would then look like this:
>
>         scmi_pds: protocol@11 {
>                 reg = <0x11>;
>                 #power-domain-cells = <1>;
>
>                 /* main_timer0: SCMI ID: 15 */
>                 pd15: domain@15 {
>                     reg = <15>;
>                     parent-domain = <&MAIN_PD>;
>                 };
>         };
>
> This requires adding a bit of code to the SCMI PM domain driver to check
> for these subnodes with optional parent-domain properties, and I already
> have a PoC[1] which works on v6.12.
>
> One other reason I like this solution is that it actually kills two
> birds with one stone.  The first one is describing the hieracrhy above,
> but the second one is that it solves another limitation of the SCMI PM
> domain implementation.
>
> Currently you can only have a single group of SCMI PDs.  More
> specifically, you can only have a single "protocol@11" or "reg = <0x11>"
> SCMI node.  Which means, you cannot have more than one group of SCMI
> PDs.  So if you have (like I do) groups of SCMI-controlled PDs that area
> themselves grouped into multiple top-level PDs, there is no way to
> describe that today since you can only have a single SCMI PD node.
>
> To get more specific, on this TI SoC I'm working on now, there's more
> than one top-level PD controlled by PSCI.  The top-level (PSCI) domains
> look like this:
>
> &psci {
>         compatible = "arm,psci-1.0";
>         method = "smc";
>
>         MAIN_PD: power-controller-main {
>                 #power-domain-cells = <0>;
>         };
>
>         WKUP_PD: power-controller-wkup {
>                 #power-domain-cells = <0>;
>         };
> };
>
> And in addition to the main_timer0 leaf device described above, I have
> another timer that is also SCMI controlled like this:
>
>         wkup_timer0: timer@2b100000 {
>                 [...]
>                 clocks = <&scmi_clk 85>;
>                 clock-names = "fck";
>                 power-domains = <&scmi_pds 19>;
>         };
>
> but..., this one is not in MAIN_PD, it is in WKUP_PD.  Which means I
> need some way to declare that SCMI PDs that are part of the one (and
> only) "protocol@11" node could have different parent domains.  With the
> new idea, we just do this: (note that the subnodes have different
> parent-domain properties):
>
>         scmi_pds: protocol@11 {
>                 reg = <0x11>;
>                 #power-domain-cells = <1>;
>
>                 /* main_timer0: SCMI ID: 15 */
>                 pd15: domain@15 {
>                     reg = <15>;
>                     parent-domain = <&MAIN_PD>;
>                 };
>
>                 /* wkup_timer0: SCMI ID: 19 */
>                 pd19: domain@19 {
>                     reg = <19>;
>                     parent-domain = <&WKUP_PD>;
>                 };
>         };
>
> So.... what you think about this?  I guess's the "parent-domain" idea is
> the really new concept here, but I guess it's not that much different
> than a clock divider that points to its parent clock.
>
> Anyways, curious what you think.  I quite like this solution because it
> solves two fairly big limitations in the SCMI PM domain implementaion
> that exist today with one relatively simple solution.

Well, I am not the one to convince in regards to DT bindings. Putting
the DT bindings aside, I think your extensions for the SCMI Power
Domain to support parent-domains makes perfect sense to me!

In regards to the DT bindings (again, I am not the expert here), but
maybe we could try to extend the current way we describe parent
domains instead of inventing something entirely new. Could the below
work?

scmi_pds: protocol@11 {
        reg = <0x11>;
         #power-domain-cells = <1>;
         power-domains = <&MAIN_PD>, <&WKUP_PD>; // a list of phandles
         power-domains-child-ids = <15>, <19> ; // a list of indexes
corresponding to the list of phandles above

[...]

The above said, I have also discussed this with Vincent and we thought
it was a good idea to bring up the topic at the next monthly public
SCMI call.

It would be great if you could join, but let's see if we can find a
reasonable slot as the current is in the middle of the night for you.
Vincent will reach out to you as he is the one hosting the call.

Br
Uffe

Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com [209.85.208.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C467F39A070
	for <arm-scmi@vger.kernel.org>; Tue,  3 Mar 2026 17:09:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.179
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772557787; cv=pass; b=dUCqtv4E4/852o8ovZAfBpbKOwdWsV0hc2oVZTeXqhHQRFgvzEf1Ozdgx9gLHCdlMrmHzopQ2yOykosyk/WhOO5eE1KqxwS+NC0Bym01ykt6IYV3YGXcvxqowHRcKQZY6JEWrR6JHZBIAvi/VHG2VcqPMNgFq3OqjMy2HfMuX/w=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772557787; c=relaxed/simple;
	bh=rdt8oIf1//UQgJmdBNW4JtjdwtTIkUas8nwXJnGiyUE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=aFFeYU6eIS5nFlbRmLm5letU/Xl2eDkj3snpmO0xKUTISvFPWknmC3aOFbj5FpI9qGLHQunbcl2TdCI0xVH0Xd09XKFC/CXK9S9tlrU0vknU2zQjFNrAMBxo9O5CR5G6lVIaaNisqLEo+T14top0ol7NsleRBxm0vEYj8z8EyJQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=xLsog1D8; arc=pass smtp.client-ip=209.85.208.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="xLsog1D8"
Received: by mail-lj1-f179.google.com with SMTP id 38308e7fff4ca-389fa5e55e2so101487901fa.1
        for <arm-scmi@vger.kernel.org>; Tue, 03 Mar 2026 09:09:45 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1772557784; cv=none;
        d=google.com; s=arc-20240605;
        b=ES1AuV47hIyKFZBfeldra7tzXLYff7ddozfVYNAVR9yXy69/7OarGdTcIYHHxKMj5I
         uEB8lRVJfioHGjs4CmcwD7/7IyOJGfYvGq+QtqnJl3WiAT4+RF9MZl68EP9HHfd+Zjb5
         psn/CDl9HAkAqAYYijqY+61EGXUfyZkfKnI83uLi8lpNReV2d4Q7McWUr16nynWUoO2v
         TTkXZPdnZvGYVQ0sJbYQSkRSf8PETiTUbN94mBTbB8xb1kB1N0kaR8WvgOEiPa89SJI6
         VOoUJGJs3na7NSmknYsnFGc2yQfw06fInFOPqpcPPNIJ3x8BlRaFKqOWrSp/kMH1zlps
         3aRQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=rlBdi6EAVEtO25NMwMX/W9R62nC12Yqbu1jwDW8XMHE=;
        fh=64WlmTWe8gmEroQ88r0oEf2ZzGVXHwps9N3GiBiv5tc=;
        b=ZQAakELsGiYOEK0Kd5rt+nS42/wXomrND/jQibJxHSfMEPicXbOX/Qd7ROYxl2Z8Bg
         yGiIhX3bIxi77VnOTFmz6LlKHpoj2K+0TFuLgIy6qbZXuG2NexEz3GSvaucXl/v59Esg
         tCcwZcC/kjha6nSRPD1Cfd4ex5bwV2zw//kAMHvn1iZsm4+rsUY6X4bMzuAfNjNyjoIi
         z84JNs2MjxNUD083VLh2Vkup10kJIQMoDWAHdOq10m11earNFQC7Cu5wVIzV2gLgpWvR
         Z9LgvEotF/6pWNPhKWTjcsgb0U+2kNZqFV4HNLpicFLXa3uQnUxdFtx8ZKH+8wbJdeCT
         RsmA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1772557784; x=1773162584; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=rlBdi6EAVEtO25NMwMX/W9R62nC12Yqbu1jwDW8XMHE=;
        b=xLsog1D8gvRfw38s4cFQ/f52YLirvXHDnACGmN+Pg53TzS31AMctE59zY2bp4ibYeK
         4Hvs5z/Dkw65wTQnovwaxbJ/YKuHjcyT/C629qet5nbOk9AeV47eau05s0+f9xV9U/W7
         QpRIa32cgvJRgOySTFt+E3eWhk2wzztnjS23PMd+U1Jamq5Iln1VIY6P/1DJ8/DygUlM
         VykeQcTrJmmYs7J06C5TKWUzuwBcFvQQlzhm+KcjuHO903COzfyypvPzXNDLH2YJvq0p
         eOjh0XrdCs9DfmNzJ8nFhVooUhyOEgMIfPz8gGr3LiBYn9wAlhgUlt4uTpCrTYf5WTj6
         JIWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772557784; x=1773162584;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rlBdi6EAVEtO25NMwMX/W9R62nC12Yqbu1jwDW8XMHE=;
        b=nhbpqEyPxvPcC0Ms1Qi6K4xe8S3pSCZYQ3DqxGEymnctyD4TD1mbBY7SdDxuJj2zS3
         lP9GV+0/VvgUCiGG0DY0Kv9KL+M9itu1lM8GssSZz14z4ClT2NnBe4QC2sdOt1kyqKUS
         Zk/3DNx2ZkeB8eI0t5PFTKheCRadZ/zQaKX6cGvAzLEYVyL3zI9OYhOi3yJWQM0+qwQC
         hiY+36ylm6tXNzS9q4iPICyIZgO7kmwPEfeGH9u4OcdGN3L8w2/YOrAvTwWIYKbqFcdK
         fDGzMFmp0m/ySuN8f2PcOp4zTlj1m/izx3fPVXzfjraSQ6lgE3+aUJq8sd7qh/j+NAZM
         sR0Q==
X-Forwarded-Encrypted: i=1; AJvYcCUL5UpBhXQ3hcvAmVjh84y0oF7bwdwocJRUiBReFDnd8B1wPRHxXciypb6uYuYwexUEVo9Wo1WfAA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw0xI1P+iFynSFlKD24LBjky7NJQWFWzpovsGvah77iftyA96Hy
	KmpkJfT39TLqd4j2tzMjj9eosWP/h4u7HJ4FzX96/iViNNoB9Mr80++drD3GayvX/VBjH8MKYmu
	2DfWlGNUuD3h/Ze0mh5NR4c55NO8Km61Bk4lmqItvwA==
X-Gm-Gg: ATEYQzz2sDIEDQuNVB+FAcwKoVin6tsRywiNzOHvlrkHRcpcDHmdNIbQPpGwSyuEggT
	YJ8dmLOVbH3Q2xP/ltz9qRzSQQimcvyxjF4FXguaJKXfUYiBQRdObReJusvRBTBNhtz2fvVdSEo
	3/OgOHZApkFimE2ofOROx7BI1XLQJbTRxjDGFFNGnLow3APchBuuZH6irOcD7kBtYf9X2xeqVSh
	gS+HI9jQ3+g3tlTlMQ8sKqC6/W09haYdd7+AYg4G07K2AnSGAdybwuufAu6tUBsao4uVO0fzzj2
	cPce8MoN
X-Received: by 2002:a05:651c:1c7:b0:389:fa42:b266 with SMTP id
 38308e7fff4ca-389ff1305bemr121187391fa.11.1772557783810; Tue, 03 Mar 2026
 09:09:43 -0800 (PST)
Precedence: bulk
X-Mailing-List: arm-scmi@vger.kernel.org
List-Id: <arm-scmi.vger.kernel.org>
List-Subscribe: <mailto:arm-scmi+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:arm-scmi+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260122-pmdomain-hierarchy-onecell-v5-0-76855ec856bd@baylibre.com>
 <20260122-pmdomain-hierarchy-onecell-v5-1-76855ec856bd@baylibre.com>
 <20260127151735.GA1699112-robh@kernel.org> <7hjywtzaiy.fsf@baylibre.com>
 <CAMuHMdURxN=kBQHJKnsTVEQPeuB41r5kZy4sgFNqg=U2ynuZMw@mail.gmail.com> <7hv7flrb36.fsf@baylibre.com>
In-Reply-To: <7hv7flrb36.fsf@baylibre.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Tue, 3 Mar 2026 18:09:07 +0100
X-Gm-Features: AaiRm50WKBsQhrWQrTeBP6GpkV839u459YirvJ0kBggs5SGvcv-i6i3nAHRwfPc
Message-ID: <CAPDyKFq0JAKc693d+RrPEBCAH--r+gobf822dQ5Ao6f2gnjRrw@mail.gmail.com>
Subject: Re: [PATCH RFC v5 1/2] pmdomain: core: support domain hierarchy via power-domain-map
To: Kevin Hilman <khilman@baylibre.com>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>, Rob Herring <robh@kernel.org>, 
	"Rafael J. Wysocki" <rafael@kernel.org>, Sudeep Holla <sudeep.holla@arm.com>, 
	Cristian Marussi <cristian.marussi@arm.com>, devicetree@vger.kernel.org, 
	linux-pm@vger.kernel.org, arm-scmi@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"

On Wed, 25 Feb 2026 at 00:11, Kevin Hilman <khilman@baylibre.com> wrote:
>
> Geert Uytterhoeven <geert@linux-m68k.org> writes:
>
> > Hi Kevin,
> >
> > Thanks for your series! I became aware of it only recently, and read
> > it and its history with great interest...
> >
> > On Wed, 4 Feb 2026 at 00:13, Kevin Hilman <khilman@baylibre.com> wrote:
> >> Rob Herring <robh@kernel.org> writes:
> >> > On Thu, Jan 22, 2026 at 05:14:00PM -0800, Kevin Hilman (TI) wrote:
> >> >> Add of_genpd_[add|remove]_subdomain_map() helper functions to support
> >> >> hierarchical PM domains defined by using power-domains-map
> >> >
> >> > power-domain-map. No 's'.
> >> >
> >> >> property (c.f. nexus node maps in DT spec, section 2.5.1).
> >> >>
> >> >> This enables PM domain providers with #power-domain-cells > 0 to
> >> >> establish subdomain relationships via the power-domain-map property,
> >> >> which was not previously possible.
> >> >>
> >> >> These new helper functions:
> >> >> - uses an OF helper to iterate to over entries in power-domain-map
> >> >> - For each mapped entry: extracts child specifier, resolves parent phandle,
> >> >>   extracts parent specifier args, and establishes subdomain relationship
> >> >> - Calls genpd_[add|remove]_subdomain() with proper gpd_list_lock mutex protection
> >> >>
> >> >> Example from k3-am62l.dtsi:
> >> >>
> >> >>   scmi_pds: protocol@11 {
> >> >>       #power-domain-cells = <1>;
> >> >>       power-domain-map = <15 &MAIN_PD>,  /* TIMER0 */
> >> >>                          <19 &WKUP_PD>;  /* WKUP_TIMER0 */
> >> >>   };
> >> >>
> >> >>   MAIN_PD: power-controller-main {
> >> >>       #power-domain-cells = <0>;
> >> >>   };
> >> >>
> >> >>   WKUP_PD: power-controller-main {
> >> >>       #power-domain-cells = <0>;
> >> >>   };
> >> >>
> >> >> This allows SCMI power domain 15 to become a subdomain of MAIN_PD, and
> >> >> domain 19 to become a subdomain of WKUP_PD.
> >> >
> >> > One concern I have here is generally *-map is transparent meaning when
> >> > you lookup <&scmi_pds 15>, &MAIN_PD is returned as the provider. It's
> >> > also possible to have a map point to another map until you get to the
> >> > final provider. The only way we have to support both behaviors is the
> >> > consumer has to specify (i.e. with of_parse_phandle_with_args_map() vs.
> >> > of_parse_phandle_with_args()), but the consumer shouldn't really know
> >> > this detail.
> >
> > This is also the first thing I was worried about, when I noticed you are
> > not doing transparent mapping, but add an explicit hierarchy instead,
> > based on the map.
>
> Yeah, the map wasn't my original idea, and TBH, I had never really even
> heard of nexus node maps before it was suggested by Rob[1] that I could
> use it to describe hierarchy.
>
> But... I'm gathering from Rob's and your recent feedback that my current
> approach to using a map is an abuse/misuse of the map because it's just
> being used to describe hierarchy, and because it's not transparent.
>
> I'm still waiting to hear from Rob to see if I understood that right,
> but your feedback is making me think that's the case.
>
> If so, I'm honestly not sure where to go next.
>
> >> > Maybe a transparent map of power-domains would never make sense. IDK. If
> >> > so, then there's not really any issue since the pmdomain core handles
> >> > everyone the same way.
> >
> > AFAIUI, SCMI is not limited to the SoC, but may be used for the whole
> > hardware platform, so it could control power to external devices, too.
> > Once we need to map a power domain through a connector, we need
> > support for transparent mapping through a nexus node.
> >
> >> I don't really know enough about potential usage of maps to know if
> >> there's ever a usecase for transparent maps.  However, the problem I'm
> >> trying to solve is less about transparent maps, and more about
> >> describing hierarchy in a situation where "leaf" domains of the same
> >> type (e.g. SCMI) can have different parent domains.
> >
> > Hierarchy is indeed something that cannot be described with the current
> > SCMI power domain management protocol.  This includes external hierarchy
> > (your use case), and internal hierarchy: AFAIK, Linux cannot be made
> > aware of the hierarchical relationship among the different power
> > domains controlled through SCMI either.
>
> Yes, the limitations of SCMI (both the protocol, and the Linux
> implementation) are the root cause here.  In case you didn't see it,
> before I posted the original version of this series, I started a thread
> on the arm-scmi list to discuss implementation options[2]
>
> So since this is primarily and SCMI limitation, maybe I should just go
> back to the original proposal of using power-domains-child-ids[3]?
>
> I'm definitely open to suggestions here as I'm a bit out of my depth
> here.

FWIW, I favor re-trying the "power-domains-child-ids" [3] approach.

The main reason is that we already have the "power-domains" property,
which allows us to describe parents using a list of phandles.

To me, it seems more sensible to extend this with a new
"power-domains-child-ids" property, which can be used when needed,
rather than inventing an entirely new property, that would replace the
existing one.

Kind regards
Uffe

>
> [1] https://lore.kernel.org/r/20250528203532.GA704342-robh@kernel.org
> [2] https://lore.kernel.org/arm-scmi/7hecy3h7ky.fsf@baylibre.com/
> [3] https://lore.kernel.org/all/20250528-pmdomain-hierarchy-onecell-v1-1-851780700c68@baylibre.com/

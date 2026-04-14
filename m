Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 677C02DB79E
	for <arm-scmi@vger.kernel.org>; Tue, 14 Apr 2026 13:43:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776174209; cv=pass; b=qtmCUwfKxLTnGBlSRHGPZVYwb2TJ+Fx8mGxDANGG508XdITzoO54GkDiz2B0EoXWVzNRCd1//bM54U9fmoCQn4jpEL9rYM6JKuCaiMbWc6nzSTV9A2PQlyj974WSMM5noBzJyWnlfdy2TeizZo644l6E8a//rx64WPtj4K0igw4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776174209; c=relaxed/simple;
	bh=+FMcleE/RJk8JXq4ZJIsUVYV4jwK9150VQYwhJJuz3Y=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=PYnSbsC6AyNStFEqY5TEqJAubsG5GVJUycc5vArEQJU7FegBNGvzGUaK7TxW6GX07UQ8476dhfhhWjENIGwftlCO3gknALBDWyx2Y8xGl4/4pFw0TFw/DVNhLeCNbmfW8hP65c9pavCWqphBSKslCErelthGW6UditWtcja0BlI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=MzGXfcs1; arc=pass smtp.client-ip=209.85.167.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="MzGXfcs1"
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-5a4053964e3so1065423e87.2
        for <arm-scmi@vger.kernel.org>; Tue, 14 Apr 2026 06:43:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1776174206; cv=none;
        d=google.com; s=arc-20240605;
        b=PnFbbiAg2aewCOEdJmuGCWJluS0JGrdykDWVpfJc2fPJM9QSlCbsJnWJCV7yrPUnCC
         UAI+gH5r7rm17qqDmnPyBKSvlaWlEDx13vEJgaUGyHx2rHyI5Q1+nJ8t4iUb8PhgIyuh
         ZI/O43u332rt+vJNLvcRlkjp+RCXAsHUT7y9d+MOhCMaqwtED0p7SC0gFdDMpRP9G8uR
         hMGFT/Ct3aI/w2IhxAYlkp+9Yz+wKwC0QHvoPi4NWCxcT/D+VspYfDymdzQVrCQfgmGq
         T6CX9lXwQOh52U7EFWcJtPAhlMNf3OIlzYoU7IMmnZxaXuinPuxzlqJG577np5NieFR+
         NoHg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=Zy/0PzEut0PvWHR237jELAY9rSr5MyVNvmg6pBAc6Og=;
        fh=Vny+X0CeM0adVl3GDIEaiSoSbwNHdeqpKzuPABmHdMg=;
        b=YPMbYXMmzzoj0w41T9guNMTnTZnNUdLKjLPqCAhMPB9cdzqjzSopqPAfuqezwN0z0y
         f04r6A4amz+5y9st01CYF6v/vvFldJ8fQt++mGbsV8z7ol0Amg7VbpIVN7tvFfTSW4ZW
         rML9pt0aS/nRm62+sY3aFLASl2fwBdEu5pfY9pw2jJJne0XSH9jt3wb68lDLR0QaUncv
         64vS8k9xG1ika4NLbLXP3bWf6Yy1QJOW6XtIs3TbWXR911JblzW20V8Uj855Fsnwi2wI
         u01PqN0JiiLtzXqEQ39wNk6fGnkdQk2V5MnnLunxt5ITnwSKr3AQeYVQGVrw9HDo3rYn
         TGXA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1776174206; x=1776779006; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Zy/0PzEut0PvWHR237jELAY9rSr5MyVNvmg6pBAc6Og=;
        b=MzGXfcs1iOQSunlCSB7WO0Z7I5Zt2w0pLfXkAxiFTN86ZKsQkD0Kcq5WR+Ldg0ps5p
         vhYpW4hEFLI1dY9mZ9wLG7mNUuW1iihIdFpd4VMkO9FH6TZkdZsoBV9Ir6HVacdXJeUb
         0dSs5OFUKdbRs1NsrcxJetfOUIGwUKtn9dx2yaW9++G7vcwQXdaa5SaS4j/5BdHRHOsb
         LDipjcwb1SBg8JAvf5kkoFZjNU5Ezc8QLcElWRqfxYawL9o1HW7sUtEOwFiw32JFgyJg
         ZL2qznySay7+ha1NOnCez+73WpuDSzC1+VgFK4esY4Ems05DGSJr0CD3SMVMk1pMqjaS
         jL4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776174206; x=1776779006;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Zy/0PzEut0PvWHR237jELAY9rSr5MyVNvmg6pBAc6Og=;
        b=eF2qJHQxTvdLKVqZ4n5mwuTz8ycV4Ui49fIXdqo/1KCFmL6g+KIGMnsy5od9Vwm6Br
         432YjRPt8VqNGRGpIESdWG7w3z2x8Y2sroJW6mdmFlHjgMDNmF/hn8uv+nZpkDPe1zJz
         3NkV+pyPQC62jcN5uEHuAqaLKv4hHH0dBcKwCdROvFEFbNKTSBhCOY7wJ+pGkjam8/M3
         4bZD0IxYF46IMF1Cc1WQWfmBw2f44EifLzuu/SZK1JtI3pSwpYREqMSpwsn3qcHJNhWK
         Ovmcz8Ym2IY5f+yKqmcgu22g6nsRkG0Nz2l5s62s7MnnMW5KvmKX+dpalXzlCYU3VZzV
         Pi2A==
X-Forwarded-Encrypted: i=1; AFNElJ+909txPiFHV01yqUN3dURWbmOSdyAePq/D8gaJllC1oqlAE+t+dbUAxxtrCjj0Yt1gbDI7Af6aaA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxOYgLjAHE5CNVe5Ki26iqM8JVaKtgQzErWrdNh9v7T7Ch7pyPh
	SnvgU94s6+guQJygNkSrTRxmm1ThKEAm2u6k1FnrPX5BtTIn55UwHokOK8WfcrKOOXv87RutK+D
	m4tqenUKrE376DKQrpzryTdrSMZj8CcTEVy59NdWrEwDXTei1ZE37euQ=
X-Gm-Gg: AeBDiet+mVgxGZRshb/W+LaqoDxqBcG7ggpRKq1aEL97A6UNTtlke2j5WiC64V0/PhT
	C0ZRLMbEiO+EAJabmEDddEXLih2Tj0kvtqziMhfmb1ri1HxtK15A3PkUIQ75d9FKNW7SZJVY1vB
	Oolt8/D4ttkCg5az4G1Vyga9tA6nr3WkELVF9E/TzFme+UJl8J0+M3FsNWD5XtJW+LXreWGQEt1
	2U9J8jtWp/ZxvzZDT6cIOWtxEGOIrzjQfRhUqSzYv2HV8nDXerUuTZ/0F3vfA/klLKL0p9YZBCg
	Bm+F7pw5GIAmy9AQqM8=
X-Received: by 2002:a05:6512:692:b0:5a3:d3ac:505e with SMTP id
 2adb3069b0e04-5a3efb62ae8mr5639501e87.44.1776174205307; Tue, 14 Apr 2026
 06:43:25 -0700 (PDT)
Precedence: bulk
X-Mailing-List: arm-scmi@vger.kernel.org
List-Id: <arm-scmi.vger.kernel.org>
List-Subscribe: <mailto:arm-scmi+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:arm-scmi+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260310-topic-lpm-pmdomain-child-ids-v1-0-5361687a18ff@baylibre.com>
 <20260310-topic-lpm-pmdomain-child-ids-v1-2-5361687a18ff@baylibre.com>
 <CAPDyKFquJ7K4NcWuKMr1sjrnFVVPGAeLCiSF_FhvJf9Frbn1uA@mail.gmail.com>
 <7h4iljskvz.fsf@baylibre.com> <CAPDyKFrR2zyMFXTAkKs1XRgB-u5jSP256g730s=7SLuOZKsKVg@mail.gmail.com>
 <7hqzomqwpv.fsf@baylibre.com>
In-Reply-To: <7hqzomqwpv.fsf@baylibre.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Tue, 14 Apr 2026 15:42:47 +0200
X-Gm-Features: AQROBzD-JbDP-fgOPRrseyRbXAcHRr7LSIAAw6wp14sGFXLCR1gaiFIhrIczbGk
Message-ID: <CAPDyKFpWwwuxdU63Kuq_zoKkrFhkSjN6RrxdOCoL2u7JuH9B2w@mail.gmail.com>
Subject: Re: [PATCH 2/3] pmdomain: core: add support for power-domains-child-ids
To: Kevin Hilman <khilman@baylibre.com>
Cc: Rob Herring <robh@kernel.org>, Geert Uytterhoeven <geert@linux-m68k.org>, linux-pm@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"

On Sat, 11 Apr 2026 at 00:25, Kevin Hilman <khilman@baylibre.com> wrote:
>
> Ulf Hansson <ulf.hansson@linaro.org> writes:
>
> > On Fri, 10 Apr 2026 at 02:45, Kevin Hilman <khilman@baylibre.com> wrote:
> >>
> >> Ulf Hansson <ulf.hansson@linaro.org> writes:
> >>
> >> > On Wed, 11 Mar 2026 at 01:19, Kevin Hilman (TI) <khilman@baylibre.com> wrote:
> >> >>
> >> >> Currently, PM domains can only support hierarchy for simple
> >> >> providers (e.g. ones with #power-domain-cells = 0).
> >> >>
> >> >> Add support for oncell providers as well by adding a new property
> >> >> `power-domains-child-ids` to describe the parent/child relationship.
> >> >>
> >> >> For example, an SCMI PM domain provider has multiple domains, each of
> >> >> which might be a child of diffeent parent domains. In this example,
> >> >> the parent domains are MAIN_PD and WKUP_PD:
> >> >>
> >> >>     scmi_pds: protocol@11 {
> >> >>         reg = <0x11>;
> >> >>         #power-domain-cells = <1>;
> >> >>         power-domains = <&MAIN_PD>, <&WKUP_PD>;
> >> >>         power-domains-child-ids = <15>, <19>;
> >> >>     };
> >> >>
> >> >> With this example using the new property, SCMI PM domain 15 becomes a
> >> >> child domain of MAIN_PD, and SCMI domain 19 becomes a child domain of
> >> >> WKUP_PD.
> >> >>
> >> >> To support this feature, add two new core functions
> >> >>
> >> >> - of_genpd_add_child_ids()
> >> >> - of_genpd_remove_child_ids()
> >> >>
> >> >> which can be called by pmdomain providers to add/remove child domains
> >> >> if they support the new property power-domains-child-ids.
> >> >>
> >> >> Signed-off-by: Kevin Hilman (TI) <khilman@baylibre.com>
> >> >
> >> > Thanks for working on this! It certainly is a missing feature!
> >>
> >> You're welcome, thanks for the detailed review.
> >>
> >> >> ---
> >> >>  drivers/pmdomain/core.c   | 169 +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
> >> >>  include/linux/pm_domain.h |  16 ++++++++++++++++
> >> >>  2 files changed, 185 insertions(+)
> >> >>
> >> >> diff --git a/drivers/pmdomain/core.c b/drivers/pmdomain/core.c
> >> >> index 61c2277c9ce3..acb45dd540b7 100644
> >> >> --- a/drivers/pmdomain/core.c
> >> >> +++ b/drivers/pmdomain/core.c
> >> >> @@ -2909,6 +2909,175 @@ static struct generic_pm_domain *genpd_get_from_provider(
> >> >>         return genpd;
> >> >>  }
> >> >>
> >> >> +/**
> >> >> + * of_genpd_add_child_ids() - Parse power-domains-child-ids property
> >> >> + * @np: Device node pointer associated with the PM domain provider.
> >> >> + * @data: Pointer to the onecell data associated with the PM domain provider.
> >> >> + *
> >> >> + * Parse the power-domains and power-domains-child-ids properties to establish
> >> >> + * parent-child relationships for PM domains. The power-domains property lists
> >> >> + * parent domains, and power-domains-child-ids lists which child domain IDs
> >> >> + * should be associated with each parent.
> >> >> + *
> >> >> + * Returns 0 on success, -ENOENT if properties don't exist, or negative error code.
> >> >
> >> > I think we should avoid returning specific error codes for specific
> >> > errors, simply because it usually becomes messy.
> >> >
> >> > If I understand correctly the intent here is to allow the caller to
> >> > check for -ENOENT and potentially avoid bailing out as it may not
> >> > really be an error, right?
> >>
> >> Right, -ENOENT is not an error of parsing, it's to indicate that there
> >> are no child-ids to be parsed.
> >>
> >> > Perhaps a better option is to return the number of children for whom
> >> > we successfully assigned parents. Hence 0 or a positive value allows
> >> > the caller to understand what happened. More importantly, a negative
> >> > error code then really becomes an error for the caller to consider.
> >>
> >> I explored this a bit, but it gets messy quick.  It means we have to
> >> track cases where only some of the children were added as well as when
> >> all children were added.   Personally, I think this should be an "all or
> >> nothing" thing.  If all the children cannot be parsed/added, then none
> >> of them should be added.
> >>
> >> This also allows the remove to not have to care about how many were
> >> added, and just remove them all, with the additional benefit of not
> >> having to track the state of how many children were successfully added.
> >>
> >
> > I fully agree, it should be all or nothing. Failing with one
> > child/parent should end up with an error code being returned.
> >
> > That said, it still seems to make perfect sense to return the number
> > of children for whom we assigned parents for, no?
>
> No, because what will the caller use that number for?  If we are
> assuming "all or nothing", what would we use it for (other than a debug print?)
>
> It also makes it a bit confusing what a zero return value means.  Does
> that mean success?  Or that zero children were added (which would be
> fail.)
>
> I prefer to keep it as is.

In that case, how should we treat the scenario where the device node
lacks a "power-domains-child-ids" property? In some cases it is
probably fine, while in others it may not be.

I guess the caller of of_genpd_add_child_ids(), would then need to
pre-parse for the "power-domains-child-ids" property before deciding
to call of_genpd_add_child_ids().

At least, we don't of_genpd_add_child_ids() to return an error code if
there is no "power-domains-child-ids" in the device node, as that
would just confuse the caller.

Kind regards
Uffe

Received: from mail-yx1-f54.google.com (mail-yx1-f54.google.com [74.125.224.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27A9D3FC5AB
	for <arm-scmi@vger.kernel.org>; Mon, 13 Jul 2026 12:10:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783944650; cv=pass; b=VcwbWUOLqD85W2DO6ytikilWqgpX0Cpdd2jgclEn4nc+gO3AspBw7KG6JyK5b24YBdP7AwNnsizPZjrAuqDgwIeg/LkD1qwyD6qUxHgBDUVq/HqzKw19n6sNfP87ojuUiwoQr8WLt3injyJXgnmaLrDxDwAiTXzJpVFGvH/Wo2k=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783944650; c=relaxed/simple;
	bh=qguXd1Bmb0JoPYCTB9Cy4VECjzPPKEDsS8mS+lKAv24=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=fzFYb53yd7IdoB5uoQSuYnaSxtb0Rtsx1tLW0By9rQAwHOhSS8eRxPECgmeXRZ+9fgaQ6Nj59G/rBBPu19MepvGcDGmOJPGUaGB6bxkr8WBut2AaZ671cKkIvt2lPM0FxrOaR8U7WLMLntNtLnz0smxO89OgSWntvzds+xiJTkg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=a18yvu8u; arc=pass smtp.client-ip=74.125.224.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="a18yvu8u"
Received: by mail-yx1-f54.google.com with SMTP id 956f58d0204a3-6662551100bso3737572d50.0
        for <arm-scmi@vger.kernel.org>; Mon, 13 Jul 2026 05:10:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783944648; cv=none;
        d=google.com; s=arc-20260327;
        b=G9+k0BC6OjKY1VjIVVh5LYFWrYcYyvZ7rSTsvy0NWJDJZXIc7gx4D+B/ZK0URMF/F5
         HNDbnSv0RvNWgGTKGrPtS2H1zTCSKQz51AcASko5SfOmwBwLzP++4XETmi0Wmw1Hp67C
         tMf9e0JYrMUj6uIjEvd9+e9H5qXnLdjdwmn8HQRSvfeOEQGBhfUP8uG8L+lDGblDSxt8
         HrOC5MUqjWRvaryr469PJgfaCONT58swR4Zw32wG0G+LVLyP/vcrFasf5z2iWkSAvbb7
         uBmBDGM3cfruXrcC/HfhRELfY7lsmrQ1kVzOfKIFxIFZ4o8tfLiukj2vHY8OWZXZnelW
         LNUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=qguXd1Bmb0JoPYCTB9Cy4VECjzPPKEDsS8mS+lKAv24=;
        fh=wekmzLmWTRA6ptsGeupGE4Zopsj/k1bWMd6HLEKoK3w=;
        b=EFbguh8xwvkoYr6uLnzBOt8x9KksEr+Utq95hDfoXxz2EgmVyvBwwfNZ2knSZYiBJq
         QJ8wOLeeToCLxHcmxy5YbJShjDFMEBJxXcbiUhkMJIuX/xjlgHk8u1caENbOcG4A1q7y
         YPEB+lEURgCrIKCjI8cVh2H8yaSJn23CDkn+02oH84XCdEx3Pmpd3pOjQxUM5EfSy5Mf
         qdVdTLFBgeCmCjqUhYuHqiUJ+05TN7fdGa+aiZF/bSebHFo6qIBPNb+2kfr751Ji5zJS
         y29vZKQV2PZu/WOCqRdaFrNAB223T3SO6hpAHRRgUdtMzFxKUalSJ01gHsXoS4YqlwO5
         lT+A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783944648; x=1784549448; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qguXd1Bmb0JoPYCTB9Cy4VECjzPPKEDsS8mS+lKAv24=;
        b=a18yvu8uFOVU3XDo78BveS8PyS5F/eaGFhPmd0e6Pq+4DWffpRwIuCFdA0nKQSS56i
         HBRW1F3eP/ByXV+DtpF7aB837NLFz411+tXiKwAAHymYMHJzItRTP89HSdw3FvuPbPjJ
         SnLgGgN04Hc9zjICL4jfPYJoqEaqIHQ8JHYcvuNSIzdeFDIyLyE4eZpsCtTIehZkrTj2
         b6mWF1yQ+jLzatqz6F+Luk6pnN8OG5c2cpEEVTlYmML+IphMFeNTACAmz+NhhzuuosAs
         xypucSE7s0AIgfwd8O3FKmZ/THlHRpLfkRNBJFTWn9Sj+K0r+OkZEku23oGy/JGSlgCd
         25hA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783944648; x=1784549448;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=qguXd1Bmb0JoPYCTB9Cy4VECjzPPKEDsS8mS+lKAv24=;
        b=XWtdIaBcMDa86pySvq9Z6uEkfHYznDE23GMnwO/dguoOunr2dRVSIk4dbq1anKzIRm
         2rhZjVvpQLxVVfl1pYKSfF7BUKGLoqnLAm5lBjT7Vr3+W5V7bnKSFs8NQgMM3DOoSfOm
         5S2bXFQCyQfMLnyYDUjQ4if9nUnZ0nse+19Zl3UvDExfMeKQRylqLoPsCi/C+Bv1pk/E
         gSY594jXFwi2r8N1Fl7OLwtB6U0pOgo/sNo7PbYiCunMTkQE6V4Odt+X85IP5Pa44Iph
         6bs0UwRYP434iLjUFkELKdUqhvH78QzG5olcAhcbiKraeJ+yY/GbvYpdkqbtrQ+/GSZc
         xMlg==
X-Forwarded-Encrypted: i=1; AHgh+RrWJS585c6U1wz/twewZ0wWwoowWrZEw+c/Mm925Oab189/RMs1+sAgMQfIlB3FVonUWBNzdBF1VQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx9tbF1y2NpS6s/v119mb6YBwCASo4qjXjatpm3+AXnD+hd2Erf
	H5MBFAWmBjl3NWXT5lrrVFFzA8tY944rwklaV1NDK2A4bG1ovYTxnwhHFkvoE5xcFXopcxXvwY8
	2iuQ+zz+bAO425m7zP2Yol+SQt3FCGF4=
X-Gm-Gg: AfdE7cn9MOHmFnevf33IjMbjB83NJD0Y7dl/68xmd77Zok+VGBJ0b7zX2hAjhjjF2fP
	4bGCIFojzBiMGfeoil8BFJrkj1m5iKP0WumGQaDgN/os1pX2/uYMsmK8JwpsziXqXrrTu6dhkaY
	g4atF3r4lNp8PXa++Tou+BNcThpv3nBIuBo51FwZd3M+9WAO93xky8Adg3ce6Y26BYLn4gz3kgU
	6vhlMgi/ehX1EAF1ItvC2Hq4E9Qm/HoJjTCdv1Z+YqH5R/Ow3kQOxDSG3bCTzwqVl6SRBCQQUk=
X-Received: by 2002:a05:690e:1555:20b0:667:8b90:2e55 with SMTP id
 956f58d0204a3-667d7ee139dmr4779810d50.97.1783944648180; Mon, 13 Jul 2026
 05:10:48 -0700 (PDT)
Precedence: bulk
X-Mailing-List: arm-scmi@vger.kernel.org
List-Id: <arm-scmi.vger.kernel.org>
List-Subscribe: <mailto:arm-scmi+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:arm-scmi+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260705103256.284467-1-lgs201920130244@gmail.com> <20260706-dashing-dazzling-sambar-453a4d@sudeepholla>
In-Reply-To: <20260706-dashing-dazzling-sambar-453a4d@sudeepholla>
From: Guangshuo Li <lgs201920130244@gmail.com>
Date: Mon, 13 Jul 2026 20:10:37 +0800
X-Gm-Features: AUfX_mwaflEwq5O1c14YKWIRx5LpcE_68yYNnGKkNrsplECeT8LOM8_s9_IYQRI
Message-ID: <CANUHTR9ed+A5OJLX802LZieSvp-m=pQQww4Y4F=7VcEO5PPN1w@mail.gmail.com>
Subject: Re: [PATCH] pmdomain: arm: scmi: Check pm_genpd_init() in probe
To: Sudeep Holla <sudeep.holla@kernel.org>
Cc: Cristian Marussi <cristian.marussi@arm.com>, Ulf Hansson <ulfh@kernel.org>, 
	Peng Fan <peng.fan@nxp.com>, arm-scmi@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-pm@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Sudeep,

Thanks for the explanation.

On Mon, 6 Jul 2026 at 17:34, Sudeep Holla <sudeep.holla@kernel.org> wrote:
>
> On Sun, Jul 05, 2026 at 06:32:56PM +0800, Guangshuo Li wrote:
> > scmi_pm_domain_probe() stores each domain in the onecell domains array
> > after calling pm_genpd_init(), but it ignores the return value from
> > pm_genpd_init().
> >
> > If pm_genpd_init() fails, the genpd has not been added to the global
> > genpd list. The probe code nevertheless stores the genpd pointer in the
> > domains array. A later provider registration failure then unwinds the
> > array with pm_genpd_remove(), which can try to remove a genpd that was
> > never registered.
> >
> > Check the return value from pm_genpd_init() and only store successfully
> > initialized domains in the onecell array. On failure, unwind the domains
> > that were already initialized.
> >
>
> It was done that way intentionally IIRC. We don't want to remove all the
> power domains if some not so important power domains fail to initialise.
> You can log the error if that helps but removing all the domains that
> have initialised seems bit of extreme.
>
> Are you facing any issues on a real platform or is this just by code
> inspection.
>
> --
> Regards,
> Sudeep

This was found through manual code inspection and has not been reproduced
on real hardware. My concern is that a domain for which pm_genpd_init()
fails is still stored in the domains array and may later be passed to
pm_genpd_remove().

I agree that unwinding all initialized domains may be too aggressive.

Thanks,
Guangshuo

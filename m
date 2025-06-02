Received: from mail-yb1-f181.google.com (mail-yb1-f181.google.com [209.85.219.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63BB61537C8
	for <arm-scmi@vger.kernel.org>; Mon,  2 Jun 2025 10:04:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748858688; cv=none; b=OJvzKgeoYTCvC9nCrfCR+oJGBLSQX/ktD8htMs+x23RQKDdZcePfGUbcVX4mNcSqUTKu65NMbxPeWNEx5f7LkpV4trmHK3ABiMJiJb/i6Xh3vyIrij+6ff0AIco4xyo+yl3xZScD4qWl1PQrDMEyV8z0CLrTd2Ukms68/oNRL18=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748858688; c=relaxed/simple;
	bh=Ll0BUxpYcKIfgjKS2+GZXH0sMLQs5UjfCEt+dohqmg0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=C6MRN0B1Gtox2tNVI9ZntOHnKnG4upcJxtamWHveWGomp1XZYjk0g3/uMiEY1eLjb6rfHpMHbc3+H/+KcH5Mu8wrR5rNLsaQVpp1vPiZNB41CPcHM0xHduulf1Xn/SyAIT7wXep8n9y9a+G/h23389DuF5YXkmezwjZeHFZCmi4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=fqc/DFUd; arc=none smtp.client-ip=209.85.219.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="fqc/DFUd"
Received: by mail-yb1-f181.google.com with SMTP id 3f1490d57ef6-e812fc35985so1113789276.0
        for <arm-scmi@vger.kernel.org>; Mon, 02 Jun 2025 03:04:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1748858685; x=1749463485; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=NBHx10w87zFDm5B8Gle1OOY9kS79KdCEFR6zOdq4weQ=;
        b=fqc/DFUdCPc2T1ZGY/XVeTIasjCYMKY0sbqSIB4DkPTdET0eMD8wHVINYd+TqCmHxx
         2jiQKnHg7PLQCQJyDad+I3fJgEWRPyCAM3pvs3D9ihs/vo2+IA2KwixBYreK+NRh7orI
         GumQkct9M6dteFRJxg3Y9+FXlWLYy06zJ2ir2QM9fCdIMW4L/BOmyB6+hzEScbe45gJD
         k31EXkt5/+oOfkAw53CCEU111t7uR175GCvbFpBb63yxPmcENIIMPUTZNCopMT4+uEyV
         pkbckfqWkqxxwcgpqd7HwqMNZkC+ZXrzpcYzM9AVNyLSEcda1Ke4GZiS/XxcN5wEjxvx
         Iydg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748858685; x=1749463485;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NBHx10w87zFDm5B8Gle1OOY9kS79KdCEFR6zOdq4weQ=;
        b=mXCB0a+rjnnEPIorDZBV/7T5ycEYSiNRDtVzI8tlP5bBos8A3PmmU4x6YIH5kj0Z/w
         Y4SYklqwv7HXsW+bqkSN4S764O+nWCRUdAbrW865dzxQv6UrzoVhkInjhA+Pdg/UguzM
         f1CsmJWYRKCu+INUoeHpOfWLsAhBI1FyJFL19sPuRhmdCmQ7c5Q/ICfEJvi3UT1goMre
         xkkyNVLvy/cOM4Q6YKZ1JvYfRFwAMiFM5n+2eHD7zcAxH0Gf1W/To8TMQg3SCR0zHqY/
         JJjt7d2ZwBS/XAltfUXNgx/EK5d4yDhuHMg2kUfvh6qCXn/qfvhJhQznyunPgHhJCqsP
         C7mw==
X-Forwarded-Encrypted: i=1; AJvYcCXl5xRynEg//WSgVR+/NnmYlLUyCXrlFWoAkWDWUXnv7GRRl1Qim3uckjLD7xmb0UcEVNcINFDpHA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy5iD/xyG4gPyLlqs7vNfxw2dQ0Ni9z23AXUC+Pbn7fVvvDXKHT
	2NHXafoCpq3XuaWcqvcwGIhKDYyG1/I59U5LIcxGAgoRAH+LMm6AIMPeHxPHkkwIZ5tazVqI5H5
	YfWBTxTKEcQOx6k/kfRLD/6cZiqlBXxJyHz/uj+cMlQ==
X-Gm-Gg: ASbGncugj1ttTi2tD4I1JpjRg5rActqhB98IZXz/0SLgu1OVKHicd02GFtwgWyWWPHf
	vd45YhcXQmx8wf8D3PwPEhGiha/IqeTnDlSF/hgeN6YLDYAgRzqZP0Zh5ASPhDit3QCBLCkwtBn
	SHWcpbnMlTyh9zgAAXN4QCKT1OeWph8Ttyg4GFIcxKPwG0u+HWQ/38Yv0=
X-Google-Smtp-Source: AGHT+IH+mFCBf2oQORtNwYJQ7eeJxDFrAFsk2zKb+1VF2a1zDBZ1gr14d3og++bUN7uJBp8ZPPZ+yU2Z0O2jSfipOW0=
X-Received: by 2002:a05:6902:4488:b0:e7d:d152:d1 with SMTP id
 3f1490d57ef6-e7f81db4fdamr14508707276.8.1748858685361; Mon, 02 Jun 2025
 03:04:45 -0700 (PDT)
Precedence: bulk
X-Mailing-List: arm-scmi@vger.kernel.org
List-Id: <arm-scmi.vger.kernel.org>
List-Subscribe: <mailto:arm-scmi+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:arm-scmi+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250528-pmdomain-hierarchy-onecell-v2-0-7885ae45e59c@baylibre.com>
 <20250528-pmdomain-hierarchy-onecell-v2-2-7885ae45e59c@baylibre.com>
In-Reply-To: <20250528-pmdomain-hierarchy-onecell-v2-2-7885ae45e59c@baylibre.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Mon, 2 Jun 2025 12:04:09 +0200
X-Gm-Features: AX0GCFsx7ZHu16ZIrqmUoeaYbedPgl_LP8mG7kcxMz5zDlKTtWe67daoAj4MoKA
Message-ID: <CAPDyKFq2-D2vDSK0Z=qjX9vACrtvcYaAWmT=w2iVqwUfhzWD2w@mail.gmail.com>
Subject: Re: [PATCH RFC v2 2/2] pmdomain: core: use DT map to support hierarchy
To: Kevin Hilman <khilman@baylibre.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, "Rafael J. Wysocki" <rjw@rjwysocki.net>, linux-pm@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	arm-scmi@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Wed, 28 May 2025 at 23:59, Kevin Hilman <khilman@baylibre.com> wrote:
>
> Currently, PM domains can only support hierarchy for simple
> providers (e.g. ones with #power-domain-cells = 0).
>
> Add support for oncell providers as well by adding support for a nexus
> node map, as described in section 2.5.1 of the DT spec.
>
> For example, an SCMI PM domain provider might be a subdomain of
> multiple parent domains. In this example, the parent domains are
> MAIN_PD and WKUP_PD:
>
>     scmi_pds: protocol@11 {
>         reg = <0x11>;
>         #power-domain-cells = <1>;
>         power-domain-map = <15 &MAIN_PD>,
>                            <19 &WKUP_PD>;
>     };
>
> With the new map, child domain 15 (scmi_pds 15) becomes a
> subdomain of MAIN_PD, and child domain 19 (scmi_pds 19) becomes a
> subdomain of WKUP_PD.
>
> Signed-off-by: Kevin Hilman <khilman@baylibre.com>
> ---
>  drivers/pmdomain/core.c | 166 ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 166 insertions(+)
>
> diff --git a/drivers/pmdomain/core.c b/drivers/pmdomain/core.c
> index d6c1ddb807b2..b8e505516f3d 100644
> --- a/drivers/pmdomain/core.c
> +++ b/drivers/pmdomain/core.c
> @@ -2441,6 +2441,9 @@ static LIST_HEAD(of_genpd_providers);
>  /* Mutex to protect the list above. */
>  static DEFINE_MUTEX(of_genpd_mutex);
>
> +static int of_genpd_parse_domains_map(struct device_node *np,
> +                                     struct genpd_onecell_data *data);
> +
>  /**
>   * genpd_xlate_simple() - Xlate function for direct node-domain mapping
>   * @genpdspec: OF phandle args to map into a PM domain
> @@ -2635,6 +2638,14 @@ int of_genpd_add_provider_onecell(struct device_node *np,
>         if (ret < 0)
>                 goto error;
>
> +       /* Parse power-domains-map property for Nexus node mapping */
> +       ret = of_genpd_parse_domains_map(np, data);
> +       if (ret < 0 && ret != -ENOENT) {
> +               pr_err("Failed to parse power-domains-map for %pOF: %d\n", np, ret);
> +               of_genpd_del_provider(np);
> +               goto error;
> +       }

To be consistent with the current way for how we usually add
parent/child-domains in genpd (see of_genpd_add|remove_subdomain), I
suggest we keep this part being specific to each genpd provider
driver, rather than calling this from of_genpd_add_provider_onecell().

That said, I don't mind if we need to export another genpd helper
function along the lines of of_genpd_parse_domains_map() as below.
Also don't forget to consider if there is a corresponding "cleanup"
helper function needed.

[...]

Kind regards
Uffe

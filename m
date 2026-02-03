Received: from mail-pf1-f196.google.com (mail-pf1-f196.google.com [209.85.210.196])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 606B127AC45
	for <arm-scmi@vger.kernel.org>; Tue,  3 Feb 2026 23:12:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.196
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770160377; cv=none; b=brBBNtzFiS5n4f4zSNaRZDURUXCsCVTkQDRzVV5ZCrX/LoU+u4YW2H+wLKhwgPQIgMx7Qc4eOl6Dm7mJyfPj12KuCxwD8Yu/RUtjnG8R9MfOs6jZSJNqTQwNJdRXoHawcJE/UfxWbpZtXyK7L6WPjsx+huQ/lUDGRR5GjPHe6bQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770160377; c=relaxed/simple;
	bh=b+6ezU8PaueXB2DpM+akcgePYGBcPLLporezIjuLT+g=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=p0IBhHluOyCPcnLUggn6/uEbPLdTY+kY0vAnZJhWFNEIuPxkf/0ZUplj6hLUFIKO87ZtonS7NbWbz61lqHLOrjtA0QNS51bME3qBOddlKOhucG8V6fUmwkgybePZQFL0It6GHCvp+vrgruXnZhCxgKQFfl6TBkDumsJHMW7C8rI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=gNFazDB1; arc=none smtp.client-ip=209.85.210.196
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="gNFazDB1"
Received: by mail-pf1-f196.google.com with SMTP id d2e1a72fcca58-8220bd582ddso3683703b3a.2
        for <arm-scmi@vger.kernel.org>; Tue, 03 Feb 2026 15:12:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1770160374; x=1770765174; darn=vger.kernel.org;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=hCOjNNMnUuznv6tosNTA/iIRiTXu2wBeg3Ia+sthXnc=;
        b=gNFazDB1fEFOxYJalqDLQnf2a9KU5UxQM/7PkxkGtDV1nok7eq3eZveSWzBoI8jd7w
         3aAy7gNFXbkum1bc1XR7TP4nvkqBrlIBd1CI8VTkEVJkgPBK0+i/vdf+VIou32iFFDoF
         3FwjHmPqRIRcFbvdKe2QqpAlMUsCTEjyv6esizdi+gglNAoTdyJ/niobMbs67Gm7UkUq
         OgVkjl5lVs00rpiaKmLVRWhGiPFgOm10RJlOTgpv5DnIEHqWi2NkTgfPpAfyTSH3qq3d
         QilVD2rfiBGOZ9K8pSZpLnQOaANb2d/Tw+ykFOpAjPBNuZcJ7rDAGbJjxZCqvqX8NgRj
         8vgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770160374; x=1770765174;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hCOjNNMnUuznv6tosNTA/iIRiTXu2wBeg3Ia+sthXnc=;
        b=uheQFOI8c6pe2W3ZjO2sqUqA8FoI0/q/5xEgiF4o6MusVy38PE02kzOqmatRaSOaHu
         flF/uVZwlZrZzd451n2ngVMj7w4bNf/7glQTB6zjBIhDAeQ46N61Moc/DaQUqV7RTHy1
         jmNO8kYYzu4/33u9wwi1CPnBC3QI0+smKLRI6d2dD15on4rTSiiUaj3E8gg8ZPezICT3
         5esbml4IlxQwwJ+KFpU+n+/rvWdW4yi9rcduZfP+RXt9aaBDKWaxegv6xsf47UFyfu/Q
         F8owVatuWH1LBEVrjY4Wp5di/hZNWyAVmow4l3GKQ8xeFEdHQ/Juai/LtW8yWLpo6piq
         ZL6Q==
X-Forwarded-Encrypted: i=1; AJvYcCUdXaVo7+7vqUF16qT3ImPLH/bPTaYoCdF0BVtYU9A7mHbh1lld2sXlB7GkSYNHSY3Ymj9v9R8hcg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw8aSCswKmT7abjhHmmHFa8hqcHQbhxWBThMAoDTEbVfW619kSE
	J4PBNmwe0CbCFARGBoWmHWJWXeKPOMfcwmzeW+HZyJ7rIPhqvFNqh8FG1TWxkvntDzQ=
X-Gm-Gg: AZuq6aJedEOgOJba3oYw1YI5W1DiV0W6qk/oT38h3sDKtVgzaVUQ1U+NGvDuFiQLQG+
	TogvaQ5VmCaiUJrRMGmtNqHEWti5aOvCPxwkwcuJriAhPhWJiwahF2YQKgsrSpfjG21zqiq7cC5
	Py0fEXrBILCgmFf0zOi2wknpxlM7zw5EKQ2G9jHhV/lrlMmwV7Wxrn1hPY8Yv8dYEhWmmapg3d9
	e3QpHH9rSx0ULDvm3Pq+u28TnhnXtBQ0zpcmeEUD0vm/ZhoZjqdqBAFcy+F8+Kay/XpCkSB7O97
	tdli9vbrie4vCrHYmplZzfF817pK+cA6FsB9yodBb/gfKBo589pffppJwbVnIN9a7zNkUlNwCrT
	GTacoSM9C066+HxKTx4vYjjl7Ks9WHDyNasBwL52uXtVTKypngNY0WxxCPxhmOJmQZaapxkfY0c
	/JykESF5VmLuwsgJCHka0=
X-Received: by 2002:a05:6a20:9185:b0:366:58cc:b74b with SMTP id adf61e73a8af0-393720cfdddmr966865637.21.1770160374489;
        Tue, 03 Feb 2026 15:12:54 -0800 (PST)
Received: from localhost ([71.212.200.220])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c6c84c70e08sm321672a12.20.2026.02.03.15.12.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Feb 2026 15:12:53 -0800 (PST)
From: Kevin Hilman <khilman@baylibre.com>
To: Rob Herring <robh@kernel.org>
Cc: Ulf Hansson <ulf.hansson@linaro.org>, "Rafael J. Wysocki"
 <rafael@kernel.org>, Sudeep Holla <sudeep.holla@arm.com>, Cristian Marussi
 <cristian.marussi@arm.com>, devicetree@vger.kernel.org,
 linux-pm@vger.kernel.org, arm-scmi@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH RFC v5 1/2] pmdomain: core: support domain hierarchy via
 power-domain-map
In-Reply-To: <20260127151735.GA1699112-robh@kernel.org>
References: <20260122-pmdomain-hierarchy-onecell-v5-0-76855ec856bd@baylibre.com>
 <20260122-pmdomain-hierarchy-onecell-v5-1-76855ec856bd@baylibre.com>
 <20260127151735.GA1699112-robh@kernel.org>
Date: Tue, 03 Feb 2026 15:12:53 -0800
Message-ID: <7hjywtzaiy.fsf@baylibre.com>
Precedence: bulk
X-Mailing-List: arm-scmi@vger.kernel.org
List-Id: <arm-scmi.vger.kernel.org>
List-Subscribe: <mailto:arm-scmi+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:arm-scmi+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Rob Herring <robh@kernel.org> writes:

> On Thu, Jan 22, 2026 at 05:14:00PM -0800, Kevin Hilman (TI) wrote:
>> Add of_genpd_[add|remove]_subdomain_map() helper functions to support
>> hierarchical PM domains defined by using power-domains-map
>
> power-domain-map. No 's'.
>
>> property (c.f. nexus node maps in DT spec, section 2.5.1).
>> 
>> This enables PM domain providers with #power-domain-cells > 0 to
>> establish subdomain relationships via the power-domain-map property,
>> which was not previously possible.
>> 
>> These new helper functions:
>> - uses an OF helper to iterate to over entries in power-domain-map
>> - For each mapped entry: extracts child specifier, resolves parent phandle,
>>   extracts parent specifier args, and establishes subdomain relationship
>> - Calls genpd_[add|remove]_subdomain() with proper gpd_list_lock mutex protection
>> 
>> Example from k3-am62l.dtsi:
>> 
>>   scmi_pds: protocol@11 {
>>       #power-domain-cells = <1>;
>>       power-domain-map = <15 &MAIN_PD>,  /* TIMER0 */
>>                          <19 &WKUP_PD>;  /* WKUP_TIMER0 */
>>   };
>> 
>>   MAIN_PD: power-controller-main {
>>       #power-domain-cells = <0>;
>>   };
>> 
>>   WKUP_PD: power-controller-main {
>>       #power-domain-cells = <0>;
>>   };
>> 
>> This allows SCMI power domain 15 to become a subdomain of MAIN_PD, and
>> domain 19 to become a subdomain of WKUP_PD.
>
> One concern I have here is generally *-map is transparent meaning when 
> you lookup <&scmi_pds 15>, &MAIN_PD is returned as the provider. It's 
> also possible to have a map point to another map until you get to the 
> final provider. The only way we have to support both behaviors is the 
> consumer has to specify (i.e. with of_parse_phandle_with_args_map() vs. 
> of_parse_phandle_with_args()), but the consumer shouldn't really know 
> this detail.
>
> Maybe a transparent map of power-domains would never make sense. IDK. If 
> so, then there's not really any issue since the pmdomain core handles 
> everyone the same way.

I don't really know enough about potential usage of maps to know if
there's ever a usecase for transparent maps.  However, the problem I'm
trying to solve is less about transparent maps, and more about
describing hierarchy in a situation where "leaf" domains of the same
type (e.g. SCMI) can have different parent domains.

When I first proposed this[1], I didn't use a map, but you suggested I
try using a map[2].  So I'm not sure if I misunderstood what you
proposed, or if now that you see it implemented, you're second guessing if
the map is the right approach.

Kevin

[1] https://lore.kernel.org/r/20250528-pmdomain-hierarchy-onecell-v1-1-851780700c68@baylibre.com
[2] https://lore.kernel.org/r/20250528203532.GA704342-robh@kernel.org

Received: from mail-yb1-f170.google.com (mail-yb1-f170.google.com [209.85.219.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E27F21E0BB
	for <arm-scmi@vger.kernel.org>; Fri, 30 May 2025 09:31:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748597507; cv=none; b=XK18NwA+xZWZEdziasM+yoPTtB8yO5jh07NPi0lEYS/x+iZ589waiZlcmYdpivee3q26zyCF4ei9O3FWV7nLlpZPQJ0TJ/2b+CjVIx2S8e1LGlBhUjHYFWi+js9Z2yiAZMwOE7jdZiKW6/kPUgAwYIxj7D8tqkmsbSAh2aMEwNI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748597507; c=relaxed/simple;
	bh=zjDdMcJo7Ja3I/WBhXEJPi7Vf8GGUIfVIusJmH+sQRo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=C+yOLU8cTpsaqmUCqLJd593lROYJP9n2kX/lJ/6CUVvOFH9MCXkicHTc0C7oO3cgFaliC4kWXLoGi+o4APvgZBq3HnIt+YQsLzDIafHJfGjMU/KEdLVObOq/2ZCTJdHY2vNoL371tchKojZ1VbCBWDFIbA4UcQf5ev/a+/R9OQo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=a7G9f4sB; arc=none smtp.client-ip=209.85.219.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="a7G9f4sB"
Received: by mail-yb1-f170.google.com with SMTP id 3f1490d57ef6-e75668006b9so1673882276.3
        for <arm-scmi@vger.kernel.org>; Fri, 30 May 2025 02:31:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1748597503; x=1749202303; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=nl25XztXyY+91TCe2znVYLQyRFe3A02EIrzJh6x7GCo=;
        b=a7G9f4sBEY/YGgHiyzGfQtcl5WwSScKP5t262cYRu4yvgwRWO9SoLXiW9BrGywzoYP
         en2jB2ZZrJLDZXKGRBwjZKU2IzeMHq2Q2B/cdLNOS/g5z6WwCzJSBHmEXzF6F7gQcJAD
         qJvCEjWHh++ezR3sYbYR2h9+7UgMUgX0E2UXBJtvH52TziCwzxe/iYQ7PqWg/kJPHtn7
         WklZyDsFHsyOKXYknJx1Oa6RhetNNgCw0ZN4IjkRiw1MJUQsTDKtuLSakphPQ0em8wfi
         XfUfHrbAPLNhkEAldnqqsuDHaXRSV40TjZJops9Kgcb7Y6yfi/H6DTsOYZJYcKvgAMty
         2t1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748597503; x=1749202303;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nl25XztXyY+91TCe2znVYLQyRFe3A02EIrzJh6x7GCo=;
        b=rzVQY/EOv+t150Rr0UNG9TK6clTUNSZe1lTLyH59hJ9swWcnqVzr+6/k20flFfR7HL
         Dfc35HUEA5pgx81C9umlct1BkT9hUI3UHPhr8LJ+XKonh3JPTz+ta9lZb+HmhST2NLX2
         Ijv5OlAETrBZgZZ6iPn8vdvlK5tXAB1R5yKcLXm4y3xVCduZbpJNCBfLQgwxpF5sljtg
         iI5DR4/wJFIEuxYYecQi6H+G8VX8VsgsUuG4+/I5114MM9Ptlx50DkVIID8dGcCKGaeZ
         bZ/Ro+kRQckBRIU+zVJEeeFnkB3toF1GzkbhwLOc50TEbRf2GhgkyAwOJbZ6HwJ89skV
         kYxA==
X-Forwarded-Encrypted: i=1; AJvYcCVv/d3KSRv92QNtJ5dNcAkCgXCcnEnqrHyAeGdSVXDvoW5mYv23CKq/PVYe6QqV8f8xRlXHgzv/Yw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz5VM1Xu268u5shnr6GJgKArI9NJZcGOu4EUQnl3gGFYqzVLdHS
	b5MIgqzkM0EvA2y+5JeWY5PAGAkcjiPuZZvjMUu7vm4FgRDEIeAVPohoXpnzp2XZV3grtuC30By
	qQJ7jvhHQzguXMc33ndr2sx37L+Lti6lbNH6wLMqUAA==
X-Gm-Gg: ASbGncu1/KmBPHufS9hcHAOAYLisyNTgzZPN79jHUlYgcRMI26Ix+QRidE2MpjgZGPt
	baFqbPBvzk2/j0RFLnetwNZJUhELvigo83aFTX+AOKgKp77lPzyHBaZkrMCIcf9XXylgugVyEiW
	rH3AqOTeT8Wxx8qbsnvqRgrWNPF0scWbExm+x/Ju87KIUd4ARUiZZrpx0=
X-Google-Smtp-Source: AGHT+IH95Myawh7TbubfOpFEx22AdElqILjS1RFSDs37pv1ARTzzSoQyHKeRwabQyQ3x8Rz9anZLL/Bb5eyOoF6wyYc=
X-Received: by 2002:a05:6902:20c7:b0:e7d:c9f4:952b with SMTP id
 3f1490d57ef6-e7f81de0626mr3793584276.16.1748597503389; Fri, 30 May 2025
 02:31:43 -0700 (PDT)
Precedence: bulk
X-Mailing-List: arm-scmi@vger.kernel.org
List-Id: <arm-scmi.vger.kernel.org>
List-Subscribe: <mailto:arm-scmi+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:arm-scmi+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250528-pmdomain-hierarchy-onecell-v2-0-7885ae45e59c@baylibre.com>
 <20250528-pmdomain-hierarchy-onecell-v2-1-7885ae45e59c@baylibre.com>
In-Reply-To: <20250528-pmdomain-hierarchy-onecell-v2-1-7885ae45e59c@baylibre.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Fri, 30 May 2025 11:31:07 +0200
X-Gm-Features: AX0GCFsDY9QpXv-TDLaqMDwAZXQiaP-2ORBs2bXkP6yJWXm02HY-f6aS5ywCE0Y
Message-ID: <CAPDyKFqs=EuwzBodoh9-tnuDQP85bv3UnS5eoekCpjUbictfBQ@mail.gmail.com>
Subject: Re: [PATCH RFC v2 1/2] dt-bindings: power: add nexus map for power-domains
To: Kevin Hilman <khilman@baylibre.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, "Rafael J. Wysocki" <rjw@rjwysocki.net>, linux-pm@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	arm-scmi@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Wed, 28 May 2025 at 23:59, Kevin Hilman <khilman@baylibre.com> wrote:
>
> Add support for nexus map to be able to support hierarchical power
> domains for providers with #power-domain-cells > 0.
>
> Suggested-by: Rob Herring <robh@kernel.org>
> Signed-off-by: Kevin Hilman <khilman@baylibre.com>

Reviewed-by: Ulf Hansson <ulf.hansson@linaro.org>

Kind regards
Uffe

> ---
>  Documentation/devicetree/bindings/power/power-domain.yaml | 35 +++++++++++++++++++++++++++++++++++
>  1 file changed, 35 insertions(+)
>
> diff --git a/Documentation/devicetree/bindings/power/power-domain.yaml b/Documentation/devicetree/bindings/power/power-domain.yaml
> index 8fdb529d560b..9f099d326aee 100644
> --- a/Documentation/devicetree/bindings/power/power-domain.yaml
> +++ b/Documentation/devicetree/bindings/power/power-domain.yaml
> @@ -68,6 +68,15 @@ properties:
>        by the given provider should be subdomains of the domain specified
>        by this binding.
>
> +  power-domains-map:
> +    $ref: /schemas/types.yaml#/definitions/uint32-array
> +    description:
> +      Nexus node mapping property that establishes parent-child relationships
> +      for PM domains using the format defined in the Device Tree specification
> +      section 2.5.1. Each map entry consists of child domain specifier,
> +      parent phandle, and optional parent specifier arguments. This property
> +      is only supported for onecell providers (#power-domain-cells = 1).
> +
>  required:
>    - "#power-domain-cells"
>
> @@ -133,3 +142,29 @@ examples:
>              min-residency-us = <7000>;
>          };
>      };
> +
> +  - |
> +    // Example using power-domains-map for Nexus mapping
> +    main_pd: power-controller@12370000 {
> +        compatible = "foo,power-controller";
> +        reg = <0x12370000 0x1000>;
> +        #power-domain-cells = <0>;
> +    };
> +
> +    wkup_pd: power-controller@12380000 {
> +        compatible = "foo,power-controller";
> +        reg = <0x12380000 0x1000>;
> +        #power-domain-cells = <0>;
> +    };
> +
> +    scmi_pds protocol@11 {
> +        compatible = "arm,scmi-power-domain";
> +        reg = <0x11>;
> +        #power-domain-cells = <1>;
> +        power-domains-map = <15 &main_pd>,
> +                            <19 &wkup_pd>;
> +    };
> +
> +    // In this example using Nexus node mapping:
> +    // - Child domain 15 (scmi_pds 15) becomes a subdomain of main_pd
> +    // - Child domain 19 (scmi_pds 19) becomes a subdomain of wkup_pd
>
> --
> 2.49.0
>

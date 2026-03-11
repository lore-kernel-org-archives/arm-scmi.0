Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29F3222126C
	for <arm-scmi@vger.kernel.org>; Wed, 11 Mar 2026 21:34:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773264852; cv=none; b=gWfOR0fRVPs5v1lVTHKaJeY+U6Jx/2eCYWaXHtsI+oc1qLA+JYPUBSBUoPkCDXOtuftUyARkZRjWOVSuL7P57vPKRsgEiJhvhimPzM6iS/ANagif5773WlF72z/Cw3tC2eB8yuxoLdDNEtYo601tgd07BBc4zn81KUjUJAW/w4M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773264852; c=relaxed/simple;
	bh=MzEyGSpOEQTPXhyx29xRDaWjW9jMTuWE29zrMeXP5A0=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=oIC4QSAm7UOqIPl+Ao6R5NnIS7icJdbCbVb0crLrn7eeUMxDrIGl/LAyWQMACgTLh/VyKkj7w50CyuiR8FO6KTwwwTImaEvA4ArJmF2MDIDfoeI49kw3EdY2oCypgLN0qZB6Vc0IcFuleomyF/XewKB2EwvWUvVS19ZZbnYREps=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=vhcInlkV; arc=none smtp.client-ip=209.85.210.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="vhcInlkV"
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-82748257f5fso841997b3a.1
        for <arm-scmi@vger.kernel.org>; Wed, 11 Mar 2026 14:34:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1773264848; x=1773869648; darn=vger.kernel.org;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=7T6BzAyZ6zvZPDDyyrSv8iqVUUqxy8QrR8kmFoTvh3E=;
        b=vhcInlkVa42qc4szL3ZcFG87p3GQjuTTCjvr4AGT58FdxOZ5c2RCow045cr8qkbSUK
         YQYZi2JE7o7P6/FjVSGS02EcEIL+xseR45Nueuf8mJEliF1gaEgQdCU0WhEWFgM3QLY1
         DAUOX9RDbWXcvCZ7esYb7sk1yOoMfR2braWqO1WoeUC7eVJDn1kI17rlw70zc3RgqRA8
         vgBplWT1srEKc7fMbjD8+C8iAo+oh/zN38qqtQ6ezFW9N796Jy5e7H3rhsyR2S7fRx1w
         UeGJYtS+YDybJtJDd/OLoi7vREBBNodSs1OID735udGoQIHMX7hDFBmqpnFWNxmGq1xb
         UKdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773264848; x=1773869648;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7T6BzAyZ6zvZPDDyyrSv8iqVUUqxy8QrR8kmFoTvh3E=;
        b=OxOYSTyiBy8YBaAOhvIbssX6O9cVypkjiZ329t+lwaeaCo3Fm+h9MJF1qaD0mNckph
         VUjUQrUcWn4uXmaVtSO9ZnG18RY+94Yeun3eJ1PpYG01hi/CHbD54IGoeCf5SkIiYdfQ
         JA5ly3kGxSffimEnXUmcxJNFjCbIYTqPNL8tx3mAzCTJ++AOPH3FZ3wiClGBAmM3N5Lm
         uRFeRuSSOyspvlGvPo/ovLYbf/NKjv7dMdJXVammCUxId310ISM2NkpDN3pDx22idngc
         o2mOErQOaTGZuhcm9dx6UfBI0lmV3b6Kz6dtrqkrVFf91Buv6Uv+jtd/Qbxx7N1hj9MU
         y1GA==
X-Forwarded-Encrypted: i=1; AJvYcCUToLJeayZqPBbyhqeWsB28MHn+1tFoi0G8/sugEPUXChkYuHJhrI8+h/1jMEzLNSSL7jex9wREJw==@vger.kernel.org
X-Gm-Message-State: AOJu0YxZtFtJAJ3aQpHHWZYVxbn70Htb+AMOe4mhN2Lrec+PYylIfr78
	FidmvYaRhT3nEbQGqKiS7DjOwBZebmiv6RnN9JOzVzyw69BvR/jejyvULRQTptxGDPA=
X-Gm-Gg: ATEYQzwB4ztTIPGIYdK8wytcter527b+rb/RGS+/NwYRXjJmRg6kNgojlESEl3538ST
	bDd9i1NHRhcAcLmjb/6xXiIMS894yiRBW/zCas30oKgENghWv4raGKCVmbQc2hP0HvDFav0tRiB
	VAvEBfgvGRtxOofzV1O8FZjoeZ+vbhtw550nnRnywhC/p/pD0Cw5BTzn0QCERmcYb/M6BIKR+PT
	SdApLFmPYZrw92mWuqnBZQdq09hQ83CK/H2vavqOs1Zwo2O2jXAW9uJJ8+BT+k7IRXfc+DSWLFa
	XhF5NXLLNDx5UNfhT22pqe/Wz/rlyETD6nRN3Hz0fMZLTSUhSy080UZYnkr7SE71t7E9qVgnJPl
	v/HcpqXPmMMzc4eVwPwu4+h3wmh0mVaTxMf/ipJRnPEb7QAXKUwsqB487fMlNCStUCgD0D22sGb
	NFPQ9i50r+gkUDVLGSlUMg2YVNsqf0Jxk=
X-Received: by 2002:a05:6a00:9501:b0:81f:be27:8d16 with SMTP id d2e1a72fcca58-82a0722304fmr941796b3a.21.1773264848531;
        Wed, 11 Mar 2026 14:34:08 -0700 (PDT)
Received: from localhost ([71.212.200.220])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82a0738422esm595730b3a.55.2026.03.11.14.34.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Mar 2026 14:34:07 -0700 (PDT)
From: Kevin Hilman <khilman@baylibre.com>
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: linux-pm@vger.kernel.org, Ulf Hansson <ulf.hansson@linaro.org>, Geert
 Uytterhoeven <geert@linux-m68k.org>, linux-kernel@vger.kernel.org,
 arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 devicetree@vger.kernel.org
Subject: Re: [PATCH 1/3] dt-bindings: power: Add power-domains-child-ids
 property
In-Reply-To: <177319309976.1426147.15580608651927678828.robh@kernel.org>
References: <20260310-topic-lpm-pmdomain-child-ids-v1-0-5361687a18ff@baylibre.com>
 <20260310-topic-lpm-pmdomain-child-ids-v1-1-5361687a18ff@baylibre.com>
 <177319309976.1426147.15580608651927678828.robh@kernel.org>
Date: Wed, 11 Mar 2026 14:34:07 -0700
Message-ID: <7hms0eyrsg.fsf@baylibre.com>
Precedence: bulk
X-Mailing-List: arm-scmi@vger.kernel.org
List-Id: <arm-scmi.vger.kernel.org>
List-Subscribe: <mailto:arm-scmi+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:arm-scmi+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

"Rob Herring (Arm)" <robh@kernel.org> writes:

> On Tue, 10 Mar 2026 17:19:23 -0700, Kevin Hilman (TI) wrote:
>> Add binding documentation for the new power-domains-child-ids property,
>> which works in conjunction with the existing power-domains property to
>> establish parent-child relationships between a multi-domain power domain
>> provider and external parent domains.
>> 
>> Each element in the uint32 array identifies the child domain
>> ID (index) within the provider that should be made a child domain of
>> the corresponding phandle entry in power-domains. The two arrays must
>> have the same number of elements.
>> 
>> Signed-off-by: Kevin Hilman (TI) <khilman@baylibre.com>
>> ---
>>  Documentation/devicetree/bindings/power/power-domain.yaml | 35 +++++++++++++++++++++++++++++++++++
>>  1 file changed, 35 insertions(+)
>> 
>
> My bot found errors running 'make dt_binding_check' on your patch:
>
> yamllint warnings/errors:
>
> dtschema/dtc warnings/errors:
> Documentation/devicetree/bindings/power/power-domain.example.dts:136.13-26: Warning (reg_format): /example-3/protocol@11:reg: property has invalid length (4 bytes) (#address-cells == 1, #size-cells == 1)
> Documentation/devicetree/bindings/power/power-domain.example.dtb: Warning (pci_device_reg): Failed prerequisite 'reg_format'
> Documentation/devicetree/bindings/power/power-domain.example.dtb: Warning (pci_device_bus_num): Failed prerequisite 'reg_format'
> Documentation/devicetree/bindings/power/power-domain.example.dtb: Warning (simple_bus_reg): Failed prerequisite 'reg_format'
> Documentation/devicetree/bindings/power/power-domain.example.dtb: Warning (i2c_bus_reg): Failed prerequisite 'reg_format'
> Documentation/devicetree/bindings/power/power-domain.example.dtb: Warning (spi_bus_reg): Failed prerequisite 'reg_format'

Noted, and fix will be included in next rev.

Kevin

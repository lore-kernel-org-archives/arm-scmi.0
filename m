Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 877F532D7F1
	for <arm-scmi@vger.kernel.org>; Tue, 25 Nov 2025 19:13:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764097997; cv=none; b=sPJkAjkIZbkQoHGhbWC3PZ3Dg953X+0YA3uIBJNpL8009vCIQVBvqju5ieB824DsRF3eLNb2Wr/yfcEc/SzmjcDsibxLvPEEfEWe3Ecy/ZoFOQt37tj4QRIzd3pi+yZyWGsB0ubzLdu4CfuWJsmLz17mzkoL0ONS2pmKqwIskh8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764097997; c=relaxed/simple;
	bh=O6xQSEOSSLorS3JoyF4oWOfmqM+ZOwXB9/BrGMSCLEM=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=mGE58NqseK7c3yQDso7L84oYRtCdxcEyFhSG8vbQS5E2i0B0iD0ylazfoW3Tvho13BeYaOXC17F4QJW32tu70P9YLQXL9cvpFeUYHzGwZE2Nzv6AoGfmKOuB35oY+qBU78xohNyyZTBqa3j/8b3u8InDU64O+wMEJaCH5loSQgE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=KDZFJSR6; arc=none smtp.client-ip=209.85.216.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="KDZFJSR6"
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-343514c7854so81217a91.1
        for <arm-scmi@vger.kernel.org>; Tue, 25 Nov 2025 11:13:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1764097994; x=1764702794; darn=vger.kernel.org;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=C02M4R8AXlaGJb+76yOGTDrtM9vCoimbBn8lp15HTo0=;
        b=KDZFJSR6Dxdqd0gU7qbGN3K4YS9koSqM58gmsXpRg9wM4RUfy+9IjlqUPU2ojyRl5E
         TRqvbH9lj6wx/NMsvNb1K4W8T0fcHopJmD7V5k1k/gdZZvsScocUubNfDVmF3ADWHiot
         y8BmytvCSD/2USNi+3wYzT9hE34QhjIiBMG0eIuU7Y2aqe4cziNCWigAmjBB1soRQiEq
         zeVBWKh4OZHQxIJk/Mx5bH+9F9DQp2wIJiNJTs1A13XHk0tvStoizNiCymS+8+S4TwKp
         XDWD6RuKsN/wSXyZvWMstEOJo+jYKjoZHccekdOLR2ku+e7QoGvjHP7tzUydjp3Ye7Rg
         e58Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764097994; x=1764702794;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=C02M4R8AXlaGJb+76yOGTDrtM9vCoimbBn8lp15HTo0=;
        b=pg5ItTdJDCDk7lQDtSqg/BoSf7D1wkZPbd5EWyGfzdz5J+0MK5JRwdmwEjc46XjHoK
         4bJDeZ9YGZHHFFIkkyEEwuS+5g8WQ4BYM1Z+AYo7xBKdI6igPIrN6M5//ImnCWGBOgZ+
         osT6vT6HMIYmv+12K/VwMaaiBd7/mAqpeQvfEniHN5V2UYZkLsvEqN3FuXYuOtG0Se/Q
         qZ8uBohbTOE8L+wCW2feAd9i62rOif2YnETrBTMUrQ5zaKruz70rvtIbgVFzR4vH2XfP
         p/zdkJWoq6di57FmYimQJKZX/seCxkSsb/f1VRhcTPQBcBP79slP7am+oExW536Mdn4r
         vODA==
X-Forwarded-Encrypted: i=1; AJvYcCVGYR+BXk3C34RA+0oYOWZHvwkeeWI/KwxelgMaJ3DLRmsDR45eGprm3nxSsDDvPw/1greo9Tp4cg==@vger.kernel.org
X-Gm-Message-State: AOJu0YwGKoWzXmJfSh7wQS30NJziSLpaXaidf8DMvCAzAhoyPkToXkjb
	NEFV8Hkzkd+A85n+NoHr2RsYppkCcD1vN9riGFA22mKhGdPZhIoWwdmrQufUGs8g864=
X-Gm-Gg: ASbGncuMWRLzrGJgwlEh/ow3oSR1azMC3cDwrKvN1VB52hB38TZ2f7eJRbWyhID1wDH
	hTFhdASsDs2GG35CwiV3yV448+Uo5bxQffkkG4KGr153qIX9bTXmCmRj512W2kvFDAPqxlz+vi2
	AXrhV8Cqn9xWRemsIrWlhrsmc4eYl+3ngx2Wgy1n/eUSLW3n1iQLquAT3Zf6blyfpELySxZITVd
	wsLcOFMk+IhV4+1fWBwtGwwVpSbsEGUcbJW06F9QdfLRnQSuS1iTdS1HEZyS1k9MaUsQcc//0J7
	0ckqszzBhFmNVF1QzLfv5KO5FwqDkOyMZvGiXIcODI3bsZCjOl9mKbIafO39YiRG1ro9wevTRCm
	+DqYCUUZj4bnqN4hzwcgvmGrMxFmcMmxoJUW3IF2jB8i17MZ43D6E5TxrSxagFPvJPl0SXLJqqK
	+wgEm58XRD
X-Google-Smtp-Source: AGHT+IHP+k2R3EGO8iDfp3QWHD4eBn1iOwj1nBs9x0FoztVw6VI+8cqb7hGb/P+tf7nDKCbWTeZr+g==
X-Received: by 2002:a17:90b:1dcb:b0:341:1a50:2ea9 with SMTP id 98e67ed59e1d1-347298c120fmr19107932a91.16.1764097993444;
        Tue, 25 Nov 2025 11:13:13 -0800 (PST)
Received: from localhost ([71.212.208.158])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3476a56b53asm178611a91.7.2025.11.25.11.13.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Nov 2025 11:13:12 -0800 (PST)
From: Kevin Hilman <khilman@baylibre.com>
To: Herve Codina <herve.codina@bootlin.com>
Cc: Rob Herring <robh@kernel.org>, Ulf Hansson <ulf.hansson@linaro.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, devicetree@vger.kernel.org,
 linux-pm@vger.kernel.org, arm-scmi@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH RFC] of: Add of_parse_map_iter() helper for nexus node
 map iteration
In-Reply-To: <20251125085521.451ea208@bootlin.com>
References: <20251119-topic-lpm-of-map-iterator-v6-18-v1-1-1f0075d771a3@baylibre.com>
 <CAL_Jsq+2sFzQb8j5bBWbwgyYn5apLTfWOTZW3+9n74uVyph16A@mail.gmail.com>
 <7hjyzedgoc.fsf@baylibre.com> <20251125085521.451ea208@bootlin.com>
Date: Tue, 25 Nov 2025 11:13:12 -0800
Message-ID: <7h8qfuc4dz.fsf@baylibre.com>
Precedence: bulk
X-Mailing-List: arm-scmi@vger.kernel.org
List-Id: <arm-scmi.vger.kernel.org>
List-Subscribe: <mailto:arm-scmi+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:arm-scmi+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Herve Codina <herve.codina@bootlin.com> writes:

> Hi Kevin,
>
> On Mon, 24 Nov 2025 17:50:11 -0800
> Kevin Hilman <khilman@baylibre.com> wrote:
>
>> >
>> > There's also this in flight for interrupt-map:
>> >
>> > https://lore.kernel.org/all/20251027123601.77216-2-herve.codina@bootlin.com/
>> >
>> > There's probably enough quirks with interrupt-map that we can't use
>> > the same code. Though it may boil down to handling #address-cells and
>> > how the parent is looked up.  
>> 
>> Hmm, I wasn't aware of this, thanks for point it out.  It looks very
>> similar to what i need, except for it's hard-coding the properties as
>> "#interrupt-*".
>> 
>> Seems like this should be generalized to handle the generic nexus-node
>> map. But it also seems to rely on an existing function
>> of_irq_parse_imap_parent() which is also specific to interrupt maps.
>> 
>> That being said, I'm not sure if interrupt-maps are really special, or
>> if they are just a specific case of the nexus node map.  This drivers/of
>> code is breaking my brain, so it's more likely that I simply don't
>> understand enough of it to know how to do this correctly.
>> 
>
> The main difference between interrupt-map [1] and the other nexus node maps
> is that in interrupt-map a child unit address is involved and translated to
> the parent unit address of the matched interrupt-map item.
>
> This child unit address is simply not present in other nexus node maps [2].

Ah, I see.  Thanks for the explanation.  Indeed, that makes it hard to
have common parsing code. :(

Kevin

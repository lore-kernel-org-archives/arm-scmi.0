Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com [209.85.215.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE82B43DA5C
	for <arm-scmi@vger.kernel.org>; Wed, 21 Jan 2026 22:30:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769034641; cv=none; b=PD2FXtB+2Phr3akaBwwKQqQn/IhVkfyVWt0BIKCB8jL8DMsiEBVuyDPtryCun8q7GYxRG2zkyOtNqtlg499cKa+GX8WTkA0KwHudKFe3G7UY+1TM7ySBUDD6+v3RPvW6PFLcxYhQf47tbBw4FIsWOYKLZYJS3u5rDMMsjxpYI3k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769034641; c=relaxed/simple;
	bh=5hFp/21h+uLKVO4+mY8xnOdOPowH5bBJcZ1ykjeIhj0=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=jIwZhKYxC256dejajWDSrIRGVWw7njPvyg0uUaYX85DruUjBy2L7PIBSazXKhhJ0Vl0q+Ch1QaDiBLshV7J627nbCxi/yq664O8P4DWhcVlxckHQS3xBqzBB+DrsmB2kd4c3Fvft2YMa4wUvHK9ajpDoB47064osA/UiYuds3Vw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=qeX4Fk0w; arc=none smtp.client-ip=209.85.215.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="qeX4Fk0w"
Received: by mail-pg1-f182.google.com with SMTP id 41be03b00d2f7-c2dc870e194so101694a12.2
        for <arm-scmi@vger.kernel.org>; Wed, 21 Jan 2026 14:30:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1769034629; x=1769639429; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:references
         :in-reply-to:subject:cc:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0tJn68TPaZpkJplzkCMANwUW6ksbuIjJy5fmGVUej7o=;
        b=qeX4Fk0wDQVMKCAh2knuAbShU42j6Jd4UrWys/czYRdO4G7p04UA7niSbGcnM/MEex
         KnPHKvjmwxyZN057ahC53TJttUlHDQffXqhtG21AamEyklD9/rno3M09oGYU/yzKKgHm
         xnKAGIThS7k/q7L65EfkNwDnoS35YbpSgijdHBMFz4GaF6ew7Y66mO26HgoAZVUQuF3a
         aKqr3swHcMeMUReUJkjISKR9UHZSrXzdZrxefsMdRxEx9oO2954dpxpgD4n7vfxFCMBK
         GwFT19YFS/uNfo7tPn7MATY8Y6Ov5FhSTP4WwbZUYbHqruVeenGtk5Oe0UhszPg81VBi
         RP3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769034629; x=1769639429;
        h=content-transfer-encoding:mime-version:message-id:date:references
         :in-reply-to:subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=0tJn68TPaZpkJplzkCMANwUW6ksbuIjJy5fmGVUej7o=;
        b=vTtQGVy1QCOI1h4+KvbitwPrrQHQBEEnfI9NsJ5XnNM4fx/B22DJegR9JdoFK7Uhd7
         g5S7laLnv7k9VoImeuVKOkoa+lc9zldPNzEsiV7tWlzKv1FJ+DpzDxpa8FIrlg3S3Jlv
         6TvNPhBvZDFVgfwLpLOhjeHgEcJqY+2VzLevGXJspDqUCAdN4QNQv81Z+UQ7Pf92MCZ9
         mdhutwQFQXdSy80k45Fdc4JXd8VstTh9xEfdH/8B9xuZKmv+4uqvXtRh0wZc6jnLBqaO
         0gWtFgwNb1Tp5yaHZg8h6cSBd336rLZTMe7qX+qjrfZqdUD2DefKzeVR+rKERiC+6sFr
         bMBw==
X-Forwarded-Encrypted: i=1; AJvYcCXDHgO2qSyNGQBS4UvwaQefV1+YbwH5rFoKNIpplP6iMvVtppqcw9NdxC7+65H2mlUN73/mdjEB2w==@vger.kernel.org
X-Gm-Message-State: AOJu0YzVplVsbuFXdfhOu17Ho/fuOVh8Fig0LH8d2gbuUSiGOXZbmXLQ
	ku9h2S5cGcrS3hpMzPf3C+708RPmsg6JkHsS8L4cUzHFxP85+4scfsHWX/etsRiKdII=
X-Gm-Gg: AZuq6aJedBuNUAHv76jOARAduwILQs3hxP1Al2+48m8FMYmtP3WOIAy0FYZJUgBYeO1
	aMTbCmrXTb8IT1PwyHhMvG+p5gBt3+kmbKag5VOWaurZHep1xDwsJQwZ3ZQnHSROK24C2oLfjx6
	p7BwXO7dD2JQUKRNJfGAw5Cn8AHimSKirOFJ1wil8D2XJI/17ktfSdufP0gwrU2e9rn61VjTqsW
	qTQ+YWlsIjNZNHBCVPdGbIYMf2GC8azW1mraqmVhC27JAPWgwfcWq1NK1S/E+Yl9jeGulwTqZqL
	yVQu3Tcd383hyYdbE5vJPwtNDD5kAP2OnDBcKnUc+ChEkqtdg9laz4y4YFKq5QeNOUih/bNmHpB
	yIKSpQpEkq/K9mkHhrQExgT5wyl+NcKnSxp2OZHirvHpqMe+qMzczDf9fE/dATBNag72Q4ETTiJ
	P3stmgILqp
X-Received: by 2002:a17:90b:3889:b0:340:d511:e164 with SMTP id 98e67ed59e1d1-352c4045646mr5200916a91.19.1769034629307;
        Wed, 21 Jan 2026 14:30:29 -0800 (PST)
Received: from localhost ([71.212.200.220])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35335229834sm489801a91.9.2026.01.21.14.30.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Jan 2026 14:30:28 -0800 (PST)
From: Kevin Hilman <khilman@baylibre.com>
To: Rob Herring <robh@kernel.org>, Herve Codina <herve.codina@bootlin.com>
Cc: Ulf Hansson <ulf.hansson@linaro.org>, Krzysztof Kozlowski
 <krzk+dt@kernel.org>, devicetree@vger.kernel.org,
 linux-pm@vger.kernel.org, arm-scmi@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH RFC] of: Add of_parse_map_iter() helper for nexus node
 map iteration
In-Reply-To: <CAL_Jsq+2sFzQb8j5bBWbwgyYn5apLTfWOTZW3+9n74uVyph16A@mail.gmail.com>
References: <20251119-topic-lpm-of-map-iterator-v6-18-v1-1-1f0075d771a3@baylibre.com>
 <CAL_Jsq+2sFzQb8j5bBWbwgyYn5apLTfWOTZW3+9n74uVyph16A@mail.gmail.com>
Date: Wed, 21 Jan 2026 14:30:28 -0800
Message-ID: <7hwm1ay4xn.fsf@baylibre.com>
Precedence: bulk
X-Mailing-List: arm-scmi@vger.kernel.org
List-Id: <arm-scmi.vger.kernel.org>
List-Subscribe: <mailto:arm-scmi+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:arm-scmi+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Rob Herring <robh@kernel.org> writes:

> +Herve
>
> On Wed, Nov 19, 2025 at 6:41=E2=80=AFPM Kevin Hilman (TI.com)
> <khilman@baylibre.com> wrote:
>>
>> Add a new helper function of_parse_map_iter() to iterate over nexus
>> node maps (c.f. DT spec, section 2.5.1.)
>>
>> This function provides an iterator interface for traversing map
>> entries, handling the complexity of variable-sized entries based on
>> <stem>-cells properties, as well as handling the <stem>-skip and
>> <stem>-pass-thru properties.
>>
>> RFC: There's a lot of overlap between this function and
>> of_parse_phandle_with_args_map().  However the key differences are:
>>
>>   - of_parse_phandle_with_args_map() does matching
>>     it searches for an entry that matches specific child args
>>   - of_parse_map_iter() does iteration
>>     it simply walks through all entries sequentially
>
> There's also this in flight for interrupt-map:
>
> https://lore.kernel.org/all/20251027123601.77216-2-herve.codina@bootlin.c=
om/
>
> There's probably enough quirks with interrupt-map that we can't use
> the same code. Though it may boil down to handling #address-cells and
> how the parent is looked up.

Yeah, as Herve pointed out[1], the interrupt-map has enough quirks that
a generic parser isn't going to work.

>> There are likely ways to extract some shared code between these two
>> functions into some shared helpers, but I'm hoping someone more
>> familiar with this OF code can help here.
>
> I would expect of_parse_phandle_with_args_map() could be implemented
> in terms of the iterator.

OK, let's first get the iterator implementation figured out, and then we
can see if that can be implemented by the iterator.

>> However, before refactoring the shared code, it would be good to have
>> some feedback on this approach.
>>
>> Signed-off-by: Kevin Hilman (TI.com) <khilman@baylibre.com>
>> ---
>>  drivers/of/base.c  | 167 ++++++++++++++++++++++++++++++++++++++++++++++=
++++++
>>  include/linux/of.h |  13 ++++
>>  2 files changed, 180 insertions(+)
>>
>> diff --git a/drivers/of/base.c b/drivers/of/base.c
>> index 7043acd971a0..bdb4fde1bfa9 100644
>> --- a/drivers/of/base.c
>> +++ b/drivers/of/base.c
>> @@ -1594,6 +1594,173 @@ int of_parse_phandle_with_args_map(const struct =
device_node *np,
>>  }
>>  EXPORT_SYMBOL(of_parse_phandle_with_args_map);
>>
>> +/**
>> + * of_parse_map_iter() - Iterate through entries in a nexus node map
>> + * @np:                        pointer to a device tree node containing=
 the map
>> + * @stem_name:         stem of property names (e.g., "power-domain" for=
 "power-domain-map")
>> + * @index:             pointer to iteration index (set to 0 for first c=
all)
>> + * @child_args:                pointer to structure to fill with child =
specifier (can be NULL)
>> + * @parent_args:       pointer to structure to fill with parent phandle=
 and specifier
>> + *
>> + * This function iterates through a nexus node map property as defined =
in DT spec 2.5.1.
>> + * Each map entry has the format: <child_specifier phandle parent_speci=
fier>
>> + *
>> + * On each call, it extracts one map entry and fills child_args (if pro=
vided) with the
>> + * child specifier and parent_args with the parent phandle and specifie=
r.
>> + * The index pointer is updated to point to the next entry for the foll=
owing call.
>> + *
>> + * Example usage::
>> + *
>> + *  int index =3D 0;
>> + *  struct of_phandle_args child_args, parent_args;
>> + *
>> + *  while (!of_parse_map_iter(np, "power-domain", &index, &child_args, =
&parent_args)) {
>> + *      // Process child_args and parent_args
>> + *      of_node_put(parent_args.np);
>> + *  }
>> + *
>> + * Caller is responsible for calling of_node_put() on parent_args.np.
>> + *
>> + * Return: 0 on success, -ENOENT when iteration is complete, or negativ=
e error code on failure.
>> + */
>> +int of_parse_map_iter(const struct device_node *np,
>> +                      const char *stem_name,
>> +                      int *index,
>> +                      struct of_phandle_args *child_args,
>> +                      struct of_phandle_args *parent_args)
>> +{
>> +       char *cells_name __free(kfree) =3D kasprintf(GFP_KERNEL, "#%s-ce=
lls", stem_name);
>> +       char *map_name __free(kfree) =3D kasprintf(GFP_KERNEL, "%s-map",=
 stem_name);
>> +       char *mask_name __free(kfree) =3D kasprintf(GFP_KERNEL, "%s-map-=
mask", stem_name);
>> +       char *pass_name __free(kfree) =3D kasprintf(GFP_KERNEL, "%s-map-=
pass-thru", stem_name);
>> +       static const __be32 dummy_mask[] =3D { [0 ... MAX_PHANDLE_ARGS] =
=3D cpu_to_be32(~0) };
>> +       static const __be32 dummy_pass[] =3D { [0 ... MAX_PHANDLE_ARGS] =
=3D cpu_to_be32(0) };
>> +       const __be32 *map, *mask, *pass;
>> +       __be32 child_spec[MAX_PHANDLE_ARGS];
>> +       u32 child_cells, parent_cells;
>> +       int map_len, i, entry_idx;
>> +
>> +       if (!np || !stem_name || !index || !parent_args)
>> +               return -EINVAL;
>> +
>> +       if (!cells_name || !map_name || !mask_name || !pass_name)
>> +               return -ENOMEM;
>> +
>> +       /* Get the map property */
>> +       map =3D of_get_property(np, map_name, &map_len);
>> +       if (!map)
>> +               return -ENOENT;
>> +
>> +       map_len /=3D sizeof(u32);
>> +
>> +       /* Get child #cells */
>> +       if (of_property_read_u32(np, cells_name, &child_cells))
>> +               return -EINVAL;
>> +
>> +       /* Get the mask property (optional) */
>> +       mask =3D of_get_property(np, mask_name, NULL);
>> +       if (!mask)
>> +               mask =3D dummy_mask;
>> +
>> +       /* Get the pass-thru property (optional) */
>> +       pass =3D of_get_property(np, pass_name, NULL);
>> +       if (!pass)
>> +               pass =3D dummy_pass;
>
> Generally the DT iterators need some state maintained, so there's an
> init function to do all/most of the above and stash that into a state
> struct for the iterator.

OK, I'm assuming you're referring to of_phandle_iterator_init()?

>> +
>> +       /* Iterate through map to find the entry at the requested index =
*/
>> +       entry_idx =3D 0;
>> +       while (map_len > child_cells + 1) {
>> +               /* If this is the entry we're looking for, extract it */
>> +               if (entry_idx =3D=3D *index) {
>> +                       /* Save masked child specifier for pass-thru pro=
cessing */
>> +                       for (i =3D 0; i < child_cells && i < MAX_PHANDLE=
_ARGS; i++)
>> +                               child_spec[i] =3D map[i] & mask[i];
>> +
>> +                       /* Extract child specifier if requested */
>> +                       if (child_args) {
>> +                               child_args->np =3D (struct device_node *=
)np;
>> +                               child_args->args_count =3D child_cells;
>> +                               for (i =3D 0; i < child_cells && i < MAX=
_PHANDLE_ARGS; i++)
>> +                                       child_args->args[i] =3D be32_to_=
cpu(map[i]);
>> +                       }
>> +
>> +                       /* Move past child specifier */
>> +                       map +=3D child_cells;
>> +                       map_len -=3D child_cells;
>> +
>> +                       /* Extract parent phandle */
>> +                       parent_args->np =3D of_find_node_by_phandle(be32=
_to_cpup(map));
>
> Before you update the parent node, you need to put the previous parent.

OK.

Kevin

[1] https://lore.kernel.org/all/20251125085521.451ea208@bootlin.com/

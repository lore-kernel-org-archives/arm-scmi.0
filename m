Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93A3A34B18E
	for <arm-scmi@vger.kernel.org>; Thu, 22 Jan 2026 01:16:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769044574; cv=none; b=tqoz3FYGTD+BD13t9iKva8tmPKRuSrtB3m2OgSnCJPKuWMNWMrJ0Ql7+hKWpJH1rpOB7oWRkKxxvCMap7Qmnv4G7ZJMoRicgVgYx5FELk0JAR64KpFP1z1TPhrnoqr79N55fnyVL09aPM2+/aSzUqmawwLAvOlUrRyOuOPrAIWA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769044574; c=relaxed/simple;
	bh=jqqaW2BxxsmEU0aFqYQDCxb3LGBQ3x2DI42L84wdJmU=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=rU7/Cb/mwBj3ySliuxIMhglfH0kIAFd45Z1vO2/2Vg45YP2D57WXojVx1SxCgt7zlcLaeXMN2S3UEErUcBhPkZrAa3/2rsMcPtltjIRnYbyJzxjy4fnjta9szqi8sLLxicCyrX78v6qSvtoZN6pR8G8AkkaPDGdZCcotDaNflFM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=zym84CyM; arc=none smtp.client-ip=209.85.210.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="zym84CyM"
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-8217f2ad01eso434557b3a.2
        for <arm-scmi@vger.kernel.org>; Wed, 21 Jan 2026 17:16:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1769044564; x=1769649364; darn=vger.kernel.org;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=lGeSjZ9YQbprMhk0/2IWvvFkHe84g+iu/Za5NoKtD6w=;
        b=zym84CyMNg7Hs8dMw9BMItXV/qGhaIHmkwTxxf59rVH3tNarStBAj788ED1922nbxt
         XZ0TUXp1xbgiLXay+gGPK+vWnk5GjJNOGBit7yEpSctF5wN8FTqMmJ3Oa0FWmtGetiIT
         KCjEPe0swzwaUGyLz5fMzKtp5Q/Wqfrqj0usItPvXbGhU1KOZWXnf67VeA3eztDX299M
         p2xZfqD5JskebXb1ZWc8kyAwkrn5MEEcHweZl/b1F/DughLcWtoUmAg9mAi4nwH1TdYG
         +Wl1QWl1ldkBNrrz/R9vZeIYB+DnDp130pCyasL6PPabHmD0RoIC7ukMvRMH7rKhF+92
         aeLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769044564; x=1769649364;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lGeSjZ9YQbprMhk0/2IWvvFkHe84g+iu/Za5NoKtD6w=;
        b=sOxV5fTl6HCj6y9yly1wSbDgwJLhdT6+5MOcqHf2ebqh6C7RQYYlHNyLkM+R+3IfFT
         LFLyqaUjXD2Fru7hx9nQSTB+4/bzfppyzpoVgEScKXj9WElZ7CKmiEf7enMUi42NeriO
         cYkCoh4BPrkDnG5V3TZwoyttVPc/C7L4AJ1Ynz6saQBL+YqXRmJEdEkEpOwFeEffEZZS
         gOFr2u5osdErH46xhTFRtoczuqmRUo66/H7ZoNJJlPzQUYW4gVo+wIvSBn3Ck0n4RGde
         PsThRXH628DH0mgy512ARnAirHffsg73hlb1VfRjB9J2kHjKcm1DdHf/+vYzJxpqze9j
         d9Eg==
X-Forwarded-Encrypted: i=1; AJvYcCW6AGw/5sg2rg0FVokDufBrMgBTop3BtHNXhbM7v10ilFe/A0TINKkQof8QPCins13esKgapnCfVQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YyVlQgmJhCpgoujA2w2NjHByjE6enMzKCqMPUlR1YUIpROpFKnB
	wA1A9Wlwnmw0Ok8Dsg223qMQZH0wOW3GoVnAz2MhTJoLgC2gQVdTsNxqrIAarpSZ1LM=
X-Gm-Gg: AZuq6aKheZ1d/dXu+eQ5n3dX/PrW/8OmmVmewdrqa/9S4zyw/gOzNmXQKTmgkJwYNrq
	EB66kz2u715n07f12QIx9IZILSqUVfSkKhJfJfLYY3XmAQQUzd6gibwkQGgFif+ZYWRPvWAKbQN
	QCxT2KafB+/cz9uKP3AMxC95iUtLxVG4ZNMe8DMH8X3XjJdOFXGET2RX4+b69melY+Y3onwGTP0
	hvTNOjXQOL7/TkQs5eRDB4Ew/+Le8gFBWcwmzx0FMwkdwColXqEL2knBKeIumVQ3w0Xd+iVH1qH
	8Yp1cvzHMn+ryajsX3sOwqoNTtChvq9H95GoHiTpOGwTgjI/L4doqstLyuLUYv4IZF336AHfxOI
	XdpvRMAoHfrgh5eA4kRt6ERrM4JtY+grvmCy9akPv8XLB0i7PfN71CXc0DWxwpphNzn36CwUf6D
	o9RPHR1SCI
X-Received: by 2002:a05:6a00:27a3:b0:821:81ef:5dec with SMTP id d2e1a72fcca58-82181ef6acdmr1855521b3a.8.1769044563642;
        Wed, 21 Jan 2026 17:16:03 -0800 (PST)
Received: from localhost ([71.212.200.220])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-81fa108b21fsm16266577b3a.13.2026.01.21.17.16.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Jan 2026 17:16:03 -0800 (PST)
From: Kevin Hilman <khilman@baylibre.com>
To: Ulf Hansson <ulf.hansson@linaro.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 devicetree@vger.kernel.org, linux-pm@vger.kernel.org,
 arm-scmi@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH RFC v4 1/2] pmdomain: core: support domain hierarchy via
 power-domain-map
In-Reply-To: <CAPDyKFoU10ASgtXVUiCyj+rWehkMhkX=w=W1ieTksPdpskUN0Q@mail.gmail.com>
References: <20251119-pmdomain-hierarchy-onecell-v4-0-f25a1d5022f8@baylibre.com>
 <20251119-pmdomain-hierarchy-onecell-v4-1-f25a1d5022f8@baylibre.com>
 <CAPDyKFoU10ASgtXVUiCyj+rWehkMhkX=w=W1ieTksPdpskUN0Q@mail.gmail.com>
Date: Wed, 21 Jan 2026 17:16:02 -0800
Message-ID: <7hpl72wip9.fsf@baylibre.com>
Precedence: bulk
X-Mailing-List: arm-scmi@vger.kernel.org
List-Id: <arm-scmi.vger.kernel.org>
List-Subscribe: <mailto:arm-scmi+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:arm-scmi+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Ulf Hansson <ulf.hansson@linaro.org> writes:

> On Thu, 20 Nov 2025 at 01:58, Kevin Hilman (TI.com)
> <khilman@baylibre.com> wrote:
>>
>> Add of_genpd_add_subdomain_map() helper function to support
>> hierarchical PM domains defined by using power-domains-map
>> property (c.f. nexus node maps in DT spec, section 2.5.1).
>>
>> This enables PM domain providers with #power-domain-cells > 0 to
>> establish subdomain relationships via the power-domain-map property,
>> which was not previously possible.
>>
>> This new helper function
>> - uses an OF helper to iterate to over entries in power-domain-map
>> - For each mapped entry: extracts child specifier, resolves parent phandle,
>>   extracts parent specifier args, and establishes subdomain relationship
>> - Uses genpd_add_subdomain() with proper gpd_list_lock mutex protection
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
> Nitpick:
> As long as possible, please use the terminology "parent-domain" and
> "child-domain" and avoid "subdomain". There are a couple of cases of
> this, in the code too, can you please update all of them?

OK.

>>
>> Signed-off-by: Kevin Hilman (TI.com) <khilman@baylibre.com>
>> ---
>>  drivers/pmdomain/core.c   | 64 ++++++++++++++++++++++++++++++++++++++++++++++
>>  include/linux/pm_domain.h |  9 +++++++
>>  2 files changed, 73 insertions(+)
>>
>> diff --git a/drivers/pmdomain/core.c b/drivers/pmdomain/core.c
>> index 61c2277c9ce3..592e9126896c 100644
>> --- a/drivers/pmdomain/core.c
>> +++ b/drivers/pmdomain/core.c
>> @@ -3483,6 +3483,70 @@ int of_genpd_parse_idle_states(struct device_node *dn,
>>  }
>>  EXPORT_SYMBOL_GPL(of_genpd_parse_idle_states);
>>
>
> We need to add some description of the function here.

OK.

>> +int of_genpd_add_subdomain_map(struct device_node *np,
>
> Nitpick:
> Hmm, either we should keep consistency with the name
> "of_genpd_add_subdomain", according to what you propose - or we should
> take the opportunity to move to use "child" in the name instead
> (of_genpd_add_child_domain_map()).
>
> Sooner or later it would be nice if we could rename
> of_genpd_add_subdomain() (and friends) to of_genpd_add_child_domain().
>
> No big deal at this point, I am fine with whatever name you decide to use.

I will update the changelogs/comments/descriptions etc. to use
parent/child, but I will leave subdomain in the function name since
that's what all the other APIs use.  Then in a later cleanup step, we
could rename the subdomain APIs to child APIs.

>> +                              struct genpd_onecell_data *data)
>> +{
>> +       struct generic_pm_domain *genpd, *parent_genpd;
>
> Maybe use "child" and "parent" as variable names instead. This should
> make the code a bit more clear.

OK.

>> +       struct of_phandle_args child_args, parent_args;
>> +       int index = 0;
>> +       int ret = 0;
>> +       u32 child_index;
>> +
>> +       if (!np || !data)
>> +               return -EINVAL;
>> +
>> +       /* Iterate through power-domain-map entries using the OF helper */
>> +       while (!of_parse_map_iter(np, "power-domain", &index,
>> +                                  &child_args, &parent_args)) {
>> +               /* Extract the child domain index from the child specifier */
>> +               if (child_args.args_count < 1) {
>
> This should be exactly 1, right?

Hmm, I'm not sure exactly what you mean.  Are you suggesting this check
should be "!= 1" instead of "< 1"?

I think args_count should match #power-domain-cells.  So for SCMI, this
should indeed be 1.  But if this function is used for other domains
where #power-domain-cells is > 1, then the current check for "< 1" is
correct.

>> +                       of_node_put(parent_args.np);
>> +                       ret = -EINVAL;
>> +                       break;
>
> If we fail here, we should remove child domains that we added for the
> earlier indexes in the while loop, rather than just bailing out.
>
> This applies to other error paths below too.

Yeah, the current error handling isn't really in place (hence the RFC)
but I will add it for the next version.

I'm planning to take the approach that all children in the map have to
be successfully added in order for this function to be considered
successful.  If any of the children fail to get added (for any reason),
then they all should be removed.

This remove function will look *very* similar to the add function
because it will have to parse the map (again), finding parent and child
info and attempting to remove each child from the parent.

At first, this seems pretty inefficient, but I think it's better than
the add function being required to keep track of the state of which
domains were successfully added.  Which gets even more complicated if
there are multiple domains which use power-domain-map.

So fora now, I plan to avoid tracking all that state, and have the
remove function be a simple reversal of the add, but looping through the
whole map, even if it fails to remove some items (because they may not
have been added in the first place.)

>> +               }
>> +               child_index = child_args.args[0];
>> +
>> +               /* Validate child domain index */
>> +               if (child_index >= data->num_domains) {
>> +                       of_node_put(parent_args.np);
>> +                       continue;
>
> I don't think we should just continue here, but instead treat this as an error.

Yes.

>> +               }
>> +
>> +               genpd = data->domains[child_index];
>> +               if (!genpd) {
>> +                       of_node_put(parent_args.np);
>> +                       continue;
>
> Ditto.

Yes.

>> +               }
>> +
>> +               /* Get parent power domain from provider and establish subdomain relationship */
>> +               mutex_lock(&gpd_list_lock);
>> +
>> +               parent_genpd = genpd_get_from_provider(&parent_args);
>> +               if (IS_ERR(parent_genpd)) {
>> +                       mutex_unlock(&gpd_list_lock);
>> +                       of_node_put(parent_args.np);
>> +                       ret = PTR_ERR(parent_genpd);
>> +                       dev_err(&genpd->dev, "failed to get parent domain: %d\n", ret);
>
> Perhaps clarify the print by changing the text to state that we can't
> find the parent's OF provider. If the print is needed at all.

Print probably isn't needed at all, but just useful for development
debug purposes.

>> +                       break;
>> +               }
>> +
>> +               ret = genpd_add_subdomain(parent_genpd, genpd);
>> +               mutex_unlock(&gpd_list_lock);
>> +               of_node_put(parent_args.np);
>> +
>> +               if (ret) {
>> +                       dev_err(&genpd->dev, "failed to add as subdomain of %s: %d\n",
>> +                               parent_genpd->name, ret);
>> +                       break;
>> +               }
>> +
>> +               dev_info(&genpd->dev, "added as subdomain of %s\n",
>> +                       parent_genpd->name);
>> +       }
>> +
>> +       return ret;
>> +}
>
> Except for taking better care in the error path, it also looks like we
> are missing a corresponding function to remove the child-domains that
> was added with the above new function.
>
> Perhaps that function can be used in the error paths too?

Yeah, I as describe above.  I will add that for the next version.

Kevin

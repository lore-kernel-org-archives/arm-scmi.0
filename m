Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2AAEC7483
	for <arm-scmi@vger.kernel.org>; Tue, 17 Jun 2025 00:50:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750121424; cv=none; b=asB8755imhaEzAXHIw+ZEeCdDe7dMAaHLQEOIp288K4f+3SFcBOAPKvgsWPcWrcgnsXEaKpT5giKJxwy2WWPVwimXicPtosvbHBd8IeEoAWp1cMgH+N/9skqE09Qej8O8oy0XPN7cEXqcL6J1Hkf2r4GJgouR5BBz+YSp2YLTZw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750121424; c=relaxed/simple;
	bh=XM/zTY4+hy2hx2K91S0s1R31CAExjH/f0Ow9Qp8GEIY=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=cfRVuhXTodVm8Tr278Z7U0cp5e2StA3XHNt6BnqpbOukpCIrSaWkxG0ewdEJHh0MJDobtc6SV11nh4Z1ju5uTTg1aTQLQ874p3SXP4+WohrFxTcSDJ2eiMUXrG+kuT8wXN0jHdgw6DngR4koFVtxoxeo/+VK3yb1leahz81Du9g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=JJRfMCMM; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="JJRfMCMM"
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-23602481460so47754285ad.0
        for <arm-scmi@vger.kernel.org>; Mon, 16 Jun 2025 17:50:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1750121420; x=1750726220; darn=vger.kernel.org;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=pnJW/sOQY9aQOY/9yftC8CvVAq36qpelS7zJm8mO7Qs=;
        b=JJRfMCMMhtKmbfInHoavMIE5ueOftQomDFSSf1tQ/XmPEn3O3pNjOLafqPSnmKAZ4t
         LUt8NRBM/REeMd6IS72bmnfQQjM7iPOIWhC/dF0hmwoFoTsb1JQDuKse5uKZxXgOlul9
         IwF+F6CT0oM/rh8Ivt/APLa0/Kl1WlD1AnAgMuPhidF7qGPVh0kSOelUwh+tE/6aGnRO
         1cPmsAJvjO+oH9AWwNYeRiE0i8Wyk7zd7DsnUiNAfEg3s5Mwb8B3vVWl8xaGfSeSws54
         hJiF/6P2b3EXzpujKd3g6ndI/JE913g81TMTJBMKf9CX+TVQgKHF4Sj9nMyORs1XPBID
         S3Mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750121420; x=1750726220;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=pnJW/sOQY9aQOY/9yftC8CvVAq36qpelS7zJm8mO7Qs=;
        b=iATzOFhXavXUcTIlGnF/acRrFtPDZKkF4ffFUVCkrH25z+mG59XnK02b9X58dL0FxK
         us8dj35lIIhA3qAhTSlQftxZReCt89GBtgvpam3Nc0aelUo14t4IxwU/UZS23VXAb25m
         WgGIc2wKFXw2bez31aXEJTX06KMZS2oHQEQlcNjSJ2wLUwgecXjGOaztPiFoMhsgG1YY
         m5ZTro9A3PAvWlRzeE+d1RH8zMfsSPH3NY2YzXPTu8L1UqB0TyYoMQFL8tCXeVYXqeZP
         xafpnj9Y/sHmfJl6P99zsjVj1asV3Ey0Qh5JdTU8tyCNg+SIIpO4y8bw1pgTRDTf49kx
         RM/g==
X-Forwarded-Encrypted: i=1; AJvYcCWCQXpsnRBASwDWIZeyiXOAIeKq4wgi9WN5oOcBOcuYDruoNXedwbGXBtNPLCZYHuedqNfRYdxXnw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwLRjm+VcxnEvMblfUWoSd95qqNGZWDheWW2kybRxnFtFrFrOBo
	kLmmt2Xl+1xn8XkJ6NHC9z8KM4evMnmjQp87geob+agviTpjAyp2+xvvlEpEUSODmOc=
X-Gm-Gg: ASbGncuVMWu/n0cfCOK9cxZYkAZC98yC2yGADhXBjNY7o1VxHHmqt9+QCcYSPuJvURZ
	SOSerrHxHF+xqAgPOhn4Lx/xZQRKGulF6RWfFnDW0BJBIJRteu216Ndn1x6fwFyJirJyA9zdFht
	P4UFNlMamIf2vxC5kBQ1rABGQpcDLWAXeuhKVlwICLWh9mDUffW0vFALoERIZa/Qet5ZCLKkRBS
	xqwJbC0tJ5jRZGppB6guC3dqzwBa5CbtkRZdRnnkApezXRcAKC9c/5dabXwT6t0gQZUnXLcVQ59
	13ykYehMaKBhiI9nMAw9DsE/+A5DH9iw+ANVWQJ5OKZ9QqlNJsm4Cwzdz11VJ+PfLQ6cef4=
X-Google-Smtp-Source: AGHT+IGK53DLu+F+32QwMSMZusoMyF5FfzxpNHKsB04ELuGZaLrGkgIzxJL9Nu6YdwjwU+Ly30E0TA==
X-Received: by 2002:a17:903:943:b0:234:cc7c:d2e2 with SMTP id d9443c01a7336-2366afc485bmr167667785ad.1.1750121420437;
        Mon, 16 Jun 2025 17:50:20 -0700 (PDT)
Received: from localhost ([97.126.182.119])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2365deaa9b8sm67698645ad.165.2025.06.16.17.50.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Jun 2025 17:50:19 -0700 (PDT)
From: Kevin Hilman <khilman@baylibre.com>
To: Ulf Hansson <ulf.hansson@linaro.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 devicetree@vger.kernel.org, linux-pm@vger.kernel.org,
 arm-scmi@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH RFC v3 2/2] pmdomain: core: add support for subdomains
 using power-domain-map
In-Reply-To: <CAPDyKFrO9rb0eDb2qO+EGaVjOFG=7emgca8511XACDhWY=dt5g@mail.gmail.com>
References: <20250613-pmdomain-hierarchy-onecell-v3-0-5c770676fce7@baylibre.com>
 <20250613-pmdomain-hierarchy-onecell-v3-2-5c770676fce7@baylibre.com>
 <CAPDyKFrO9rb0eDb2qO+EGaVjOFG=7emgca8511XACDhWY=dt5g@mail.gmail.com>
Date: Mon, 16 Jun 2025 17:50:19 -0700
Message-ID: <7hsejzp4xg.fsf@baylibre.com>
Precedence: bulk
X-Mailing-List: arm-scmi@vger.kernel.org
List-Id: <arm-scmi.vger.kernel.org>
List-Subscribe: <mailto:arm-scmi+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:arm-scmi+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Ulf Hansson <ulf.hansson@linaro.org> writes:
--text follows this line--
> On Sat, 14 Jun 2025 at 00:39, Kevin Hilman <khilman@baylibre.com> wrote:
>>
>> Currently, PM domains can only support hierarchy for simple
>> providers (e.g. ones with #power-domain-cells = 0).
>>
>> Add more generic support for hierarchy by using nexus node
>> maps (c.f. section 2.5.1 of the DT spec.)
>>
>> For example, we could describe SCMI PM domains with multiple parents
>> domains (MAIN_PD and WKUP_PD) like this:
>>
>>     scmi_pds: protocol@11 {
>>         reg = <0x11>;
>>         #power-domain-cells = <1>;
>>
>>         power-domain-map = <15 &MAIN_PD>,
>>                            <19 &WKUP_PD>;
>>     };
>>
>> which should mean that <&scmi_pds 15> is a subdomain of MAIN_PD and
>> <&scmi_pds 19> is a subdomain of WKUP_PD.
>>
>> IOW, given an SCMI device which uses SCMI PM domains:
>>
>>    main_timer0: timer@2400000 {
>>       power-domains = <&scmi_pds 15>;
>>    };
>>
>> it already implies that main_timer0 is PM domain <&scmi_pds 15>
>>
>> With the new map, this *also* now implies <&scmi_pds 15> is a
>> subdomain of MAIN_PD.
>>
>> Signed-off-by: Kevin Hilman <khilman@baylibre.com>
>> ---
>>  drivers/pmdomain/core.c | 24 ++++++++++++++++++++++--
>>  1 file changed, 22 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/pmdomain/core.c b/drivers/pmdomain/core.c
>> index d6c1ddb807b2..adf022b45d95 100644
>> --- a/drivers/pmdomain/core.c
>> +++ b/drivers/pmdomain/core.c
>> @@ -2998,8 +2998,8 @@ static int __genpd_dev_pm_attach(struct device *dev, struct device *base_dev,
>>                                  unsigned int index, unsigned int num_domains,
>>                                  bool power_on)
>>  {
>> -       struct of_phandle_args pd_args;
>> -       struct generic_pm_domain *pd;
>> +       struct of_phandle_args pd_args, parent_args;
>> +       struct generic_pm_domain *pd, *parent_pd = NULL;
>>         int ret;
>>
>>         ret = of_parse_phandle_with_args(dev->of_node, "power-domains",
>> @@ -3039,6 +3039,22 @@ static int __genpd_dev_pm_attach(struct device *dev, struct device *base_dev,
>>                         goto err;
>>         }
>>
>> +       /*
>> +        * Check for power-domain-map, which implies the primary
>> +        * power-doamin is a subdomain of the parent found in the map.
>> +        */
>> +       ret = of_parse_phandle_with_args_map(dev->of_node, "power-domains",
>> +                                            "power-domain", index, &parent_args);
>> +       if (!ret && (pd_args.np != parent_args.np)) {
>> +               parent_pd = genpd_get_from_provider(&parent_args);
>> +               of_node_put(parent_args.np);
>> +
>> +               ret = pm_genpd_add_subdomain(parent_pd, pd);
>> +               if (!ret)
>> +                       dev_dbg(dev, "adding PM domain %s as subdomain of %s\n",
>> +                               pd->name, parent_pd->name);
>> +       }
>
> Please move the above new code to a separate shared genpd helper
> function, that genpd providers can call build the topology. This, to
> be consistent with the current way for how we usually add
> parent/child-domains in genpd (see of_genpd_add_subdomain).

Yeah, you had the same comment on v2, and I'm not ignoring you.  But I
thought that moving this code to when devices are attatched to domains
(instead of when providers are created) would solve that problem.  IOW,
in this approach, `power-domain-map` is handled at the same time as a
devices `power-domains = ` property.

So, while I don't really understand the reason that every PM domain
provider has to handle this individually, I've given that a try (see
below.)

> Moreover, we also need a corresponding "cleanup" helper function to
> remove the child-domain (subdomain) correctly, similar to
> of_genpd_remove_subdomain().

Yes, I'll handle that better once I get through this RFC phase to make
sure I'm on th right path.

OK, so below[1] is a shot at just adding helpers to the PM domain core.  I
will then uses these from the SCMI PM domains ->attach_dev() and
->detatch_dev callbacks.

If you think this is better, I'll send a v4 tomorrow.

Kevin

[1] NOTE: this is based on v6.12 because that's where I have a functioning BSP
for this SoC.  If you're OK with this, I'll rebase to v6.15 and submit upstream.

From 12a3e5669dc18f4a9fdf9f25398cba4245135a43 Mon Sep 17 00:00:00 2001
From: Kevin Hilman <khilman@baylibre.com>
Date: Fri, 13 Jun 2025 13:49:45 -0700
Subject: [PATCH 2/3] pmdomain: core: add support for subdomains via
 power-domain-map

---
 drivers/pmdomain/core.c   | 60 +++++++++++++++++++++++++++++++++++++++
 include/linux/pm_domain.h | 11 +++++++
 2 files changed, 71 insertions(+)

diff --git a/drivers/pmdomain/core.c b/drivers/pmdomain/core.c
index 88819659df83..a0dc60d4160d 100644
--- a/drivers/pmdomain/core.c
+++ b/drivers/pmdomain/core.c
@@ -3100,6 +3100,66 @@ struct device *genpd_dev_pm_attach_by_name(struct device *dev, const char *name)
 	return genpd_dev_pm_attach_by_id(dev, index);
 }
 
+/**
+ * genpd_dev_pm_attach_subdomain - Associate a PM domain with its parent domain
+ * @domain: The PM domain to lookup whether it has any parent
+ * @dev: The device being attached to the PM domain.
+ *
+ * Check if @domain has a power-domain-map.  If present, use that map
+ * to determine the parent PM domain, and attach @domain as a
+ * subdomain to the parent PM domain.
+ *
+ * Intended to called from a PM domain provider's ->attach_dev()
+ * callback, where &gpd_list_lock will already be held by the genpd
+ * add_device() path.
+ */
+struct generic_pm_domain *
+genpd_dev_pm_attach_subdomain(struct generic_pm_domain *domain,
+			      struct device *dev)
+{
+	struct of_phandle_args parent_args;
+	struct generic_pm_domain *parent_pd = NULL;
+	int ret;
+
+	/*
+	 * Check for power-domain-map, which implies the primary
+	 * power-doamin is a subdomain of the parent found in the map.
+	 */
+	ret = of_parse_phandle_with_args_map(dev->of_node, "power-domains",
+					     "power-domain", 0, &parent_args);
+	if (!ret && parent_args.np) {
+		parent_pd = genpd_get_from_provider(&parent_args);
+		of_node_put(parent_args.np);
+
+		ret = genpd_add_subdomain(parent_pd, domain);
+		if (!ret) {
+			dev_dbg(dev, "adding PM domain %s as subdomain of %s\n",
+				domain->name, parent_pd->name);
+			return parent_pd;
+		}
+	}
+
+	return NULL;
+}
+EXPORT_SYMBOL_GPL(genpd_dev_pm_attach_subdomain);
+
+/**
+ * genpd_dev_pm_detach_subdomain - Detatch a PM domain from its parent domain
+ * @domain: The PM subdomain to detach
+ * @parent: The parent PM domain
+ * @dev: The device being attached to the PM subdomain.
+ *
+ * Remove @domain from @parent.
+ * Intended to cleanup after genpd_dev_pm_attach_subdomain()
+ */
+int genpd_dev_pm_detach_subdomain(struct generic_pm_domain *domain,
+				  struct generic_pm_domain *parent,
+				  struct device *dev)
+{
+	return pm_genpd_remove_subdomain(parent, domain);
+}
+EXPORT_SYMBOL_GPL(genpd_dev_pm_detach_subdomain);
+
 static const struct of_device_id idle_state_match[] = {
 	{ .compatible = "domain-idle-state", },
 	{ }
diff --git a/include/linux/pm_domain.h b/include/linux/pm_domain.h
index cf4b11be3709..5d7eb3ae59dd 100644
--- a/include/linux/pm_domain.h
+++ b/include/linux/pm_domain.h
@@ -410,6 +410,11 @@ struct device *genpd_dev_pm_attach_by_id(struct device *dev,
 					 unsigned int index);
 struct device *genpd_dev_pm_attach_by_name(struct device *dev,
 					   const char *name);
+struct generic_pm_domain *genpd_dev_pm_attach_subdomain(struct generic_pm_domain *domain,
+							struct device *dev);
+int genpd_dev_pm_detach_subdomain(struct generic_pm_domain *domain,
+				  struct generic_pm_domain *parent,
+				  struct device *dev);
 #else /* !CONFIG_PM_GENERIC_DOMAINS_OF */
 static inline int of_genpd_add_provider_simple(struct device_node *np,
 					struct generic_pm_domain *genpd)
@@ -466,6 +471,12 @@ static inline struct device *genpd_dev_pm_attach_by_name(struct device *dev,
 	return NULL;
 }
 
+static inline
+struct generic_pm_domain *genpd_dev_pm_attach_subdomain(struct generic_pm_domain *domain,
+							struct device *dev)
+{
+	return NULL;
+}
 static inline
 struct generic_pm_domain *of_genpd_remove_last(struct device_node *np)
 {
-- 
2.49.0



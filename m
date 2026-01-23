Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E947233D85
	for <arm-scmi@vger.kernel.org>; Fri, 23 Jan 2026 01:14:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769130863; cv=none; b=KMG2VdTPhLpOZwYVvjIH0+ryyZm49yvhmT8tm/57+b025+oTtxcLKoM2uTTO9k28OArMvJIbegqMr7Kn9xmJmY2Mk9G3aUtmbCMO3RmnoL3bz41yaIBZNpdmyb7LRUpIMq9jSsjcS1uQqvaDGUJRFikJAD/890p8+QDRgg3/tts=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769130863; c=relaxed/simple;
	bh=lzR3NEhB2g7iCRM+bJ588/XYQ1irfnPbijYHHqE2mb0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=fqRzjDiMSfp9/D0Cy7bCRTFDBa7/3J0aSFAncQaRiyOsG2GgFmP4UL1k6zYrm/crcpqu1o57os5f1tWj6VgeUEf7ui9t0CIqehWf7N93csOYwoNm/9HG68oWhMDQPdd3j1D1N6Ed5oI9eTfpw2OB2UfUBPgP57MFYAj3GFP6240=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=vHDbNJbE; arc=none smtp.client-ip=209.85.210.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="vHDbNJbE"
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-81345800791so1205118b3a.0
        for <arm-scmi@vger.kernel.org>; Thu, 22 Jan 2026 17:14:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1769130849; x=1769735649; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=aHt+mmH4C5nxGUCfgNrBDFG/vUcO3dbURh+yi1mxNm8=;
        b=vHDbNJbEttm8JfjkPQvBQCP9WxQ2R5luoLRm16EJt3yMUoaK6HShDsXKdtDplPwGn8
         +CHO4Pt/XoplG8z+KUtN8rqXgXQhezUehRR06ex5SNxxSsDbfIwl91AgJgoiaIS/HGj7
         fWXJ9ZDKnroFt3XBRnA01uJ+So86ZgU0JlE6MuiVVSg5OTpV94CKQ8Wd1OCrwRrAh7oc
         AU+2AVOmK61kAfwQfw1dgUXKUoUN3GCJdj3lKPFFmDZcs76kWLIbu5TBub6cSadatrqQ
         1PSHeT0W3V5CYhSk29jhpgfwNTcns56C8RgLhyKzz+ZZn3H0XHZDgfkU4W8R4Kz+VQXz
         6w/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769130849; x=1769735649;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=aHt+mmH4C5nxGUCfgNrBDFG/vUcO3dbURh+yi1mxNm8=;
        b=slM85ym+EMymXkGkgg3hr7ihVhSbQZ58CQKkw0qt+dEfn4f02zxXtHfp+3674NtT30
         tpUgGRkMeiY6tLdlIRUKo/+SLmnaAmYygbmJP3fD1MsOm+8yKWZYESe2LAHXU4WfuRPf
         OQ2Q6wUyTl/mOuUM5k3iiUBEVDPTkLfVgqy3REri7akd1b9zRo9uVEBs7gDhL29xjNTl
         mdrcQE3UubAWEwpeg0Pf+jZWrQSzZlCqfzFMVYC9I7W3l+s7wkonbQ9uQPBEptKKhghy
         EHui25aY79qEmDYB8Ps8nP5fXE2xe2GmqV3PAhnZKdiakyVTNwnn0O3ak3zoWySUJO4e
         l1tg==
X-Forwarded-Encrypted: i=1; AJvYcCVHQzyaXzZAKdvJvFurJx4fhezsVJ86v9o1PvlANXncAV5FJTCNVJzoO3/ck7gBI4hdZVMovtyKuQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzuJ0Mb/lsiZayAKxFN4a4te6hmCahVQS7jggfAsggUzFfbkGrb
	BNtGzZi6yLJv7zDDTOlt6u5+tEHR4KmFKf1v0vLhMqZ9ZbO3ArchPdwXaoMM5jewf88=
X-Gm-Gg: AZuq6aILwTIZra3Ag70g12pVXEl16grnhf+1iTNX39gs13Anh3kfnf1hbFqrtZwilE/
	0eL2u8LYxQP3VDmCaoT0Kuxfpfxn5Pc9GMDbD7F3KyzEAXdk0pOysW2f354Rt1nuu66nEcfGcDE
	g5rFMIP/VOZRR6oGX6VsIQVH5MZhLAa4YotZb87rS7R7F1iau9P/WXLn/x8ALLQLGq1dVjch6Pi
	2RxLcR1M6tLDgT5mjr4m52j1UyEtspUVO4SJD9+e9hYxuRu4L3eEAIEu2HUcVnt+jVp7KGAnDzC
	bWDA4ZXJYIYv8uSLOxBnnxO0kfVdacZreq0DsR0ZCIYYwEGnWTDwfYXOcHKklet4x65jfDb7mhe
	pKaA8R4JQOMIq5FFIcrEQlZ1oPS2IIjG/4OjRXsIetPWDYgOozWLnqCAq62kd2CT11GkIOihvb7
	DpPM/mVYlx
X-Received: by 2002:a05:6a00:228a:b0:823:ad3:4ff4 with SMTP id d2e1a72fcca58-82317e1f2fbmr995725b3a.37.1769130848424;
        Thu, 22 Jan 2026 17:14:08 -0800 (PST)
Received: from localhost ([71.212.200.220])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8231876e5d0sm495195b3a.61.2026.01.22.17.14.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Jan 2026 17:14:07 -0800 (PST)
From: "Kevin Hilman (TI)" <khilman@baylibre.com>
Date: Thu, 22 Jan 2026 17:14:00 -0800
Subject: [PATCH RFC v5 1/2] pmdomain: core: support domain hierarchy via
 power-domain-map
Precedence: bulk
X-Mailing-List: arm-scmi@vger.kernel.org
List-Id: <arm-scmi.vger.kernel.org>
List-Subscribe: <mailto:arm-scmi+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:arm-scmi+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260122-pmdomain-hierarchy-onecell-v5-1-76855ec856bd@baylibre.com>
References: <20260122-pmdomain-hierarchy-onecell-v5-0-76855ec856bd@baylibre.com>
In-Reply-To: <20260122-pmdomain-hierarchy-onecell-v5-0-76855ec856bd@baylibre.com>
To: Ulf Hansson <ulf.hansson@linaro.org>, 
 "Rafael J. Wysocki" <rafael@kernel.org>, 
 Sudeep Holla <sudeep.holla@arm.com>, 
 Cristian Marussi <cristian.marussi@arm.com>
Cc: devicetree@vger.kernel.org, linux-pm@vger.kernel.org, 
 arm-scmi@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org
X-Mailer: b4 0.15-dev-47773
X-Developer-Signature: v=1; a=openpgp-sha256; l=8104; i=khilman@baylibre.com;
 h=from:subject:message-id; bh=lzR3NEhB2g7iCRM+bJ588/XYQ1irfnPbijYHHqE2mb0=;
 b=owEBbQKS/ZANAwAIAVk3GJrT+8ZlAcsmYgBpcstegivFzLujdyy/XYyCoOTFhTKHJRAJ8NSZt
 PKtjt8GNvKJAjMEAAEIAB0WIQR7h0YOFpJ/qfW/8QxZNxia0/vGZQUCaXLLXgAKCRBZNxia0/vG
 ZYTyEACh3s27sFpbfZ/ydsd8FMkRCxosg8QXT/a2xgDoeAuFNT+1jyG2LMV6Cjudi5xBIfK5o5+
 K3rCkRFQItyaH0a2LcgHP1ysn+3J+w2O9jUPpq9M/bPVLnvG0wrPPggT5UyVG7/tuHVDuXbEUym
 E3YJRv9CholjJhRnXmP/Kr3ZBnbGrol0MS9vaP5sCLYbKRZR5dysNMLxbv4Tgq3N/AKfgBfw6b3
 Q74xOX/xuxPeFQD2H2MRdkrxmo9B62WkZkuMRYVMVERQxnn2oYBHTtl0X4e8IHnR1TtQBrhFAaa
 T6YDp5ROfuR0IFTYO1JkOYl2SkaCB5FvyM+nJx6GbuWKGzcUo/QsyzdiWSSiCfe6nGkwcuvnGa3
 2wje3dW4WqQfamM80nMSj1P6vznxc55kdLF/KxoRZRw/4pZwuoHt+Xuryy6vuV40VRntvMRE10D
 OxizOhFu6oqR26Yneomed1EZP0UaI66OIqdyQVj9Rqm8ZrTeVfJ35Y3hEjpHPr1HsRFZ/Ir4kCB
 LI59eoPpfLf+zMyBvm2ycc9gabfPz64DoKuvsnoGOgbxbSb0E8AIPP1XJ1mNJoelQmFGh8L1jhO
 /txN/VKIOHIm+hyiJleWlDYBJ2VOc8zeFSqePAamWNlzSi8bg91+VSFiBVONnrg409+suH1Gu2r
 kx4s+ReBZ01uOpg==
X-Developer-Key: i=khilman@baylibre.com; a=openpgp;
 fpr=7B87460E16927FA9F5BFF10C5937189AD3FBC665

Add of_genpd_[add|remove]_subdomain_map() helper functions to support
hierarchical PM domains defined by using power-domains-map
property (c.f. nexus node maps in DT spec, section 2.5.1).

This enables PM domain providers with #power-domain-cells > 0 to
establish subdomain relationships via the power-domain-map property,
which was not previously possible.

These new helper functions:
- uses an OF helper to iterate to over entries in power-domain-map
- For each mapped entry: extracts child specifier, resolves parent phandle,
  extracts parent specifier args, and establishes subdomain relationship
- Calls genpd_[add|remove]_subdomain() with proper gpd_list_lock mutex protection

Example from k3-am62l.dtsi:

  scmi_pds: protocol@11 {
      #power-domain-cells = <1>;
      power-domain-map = <15 &MAIN_PD>,  /* TIMER0 */
                         <19 &WKUP_PD>;  /* WKUP_TIMER0 */
  };

  MAIN_PD: power-controller-main {
      #power-domain-cells = <0>;
  };

  WKUP_PD: power-controller-main {
      #power-domain-cells = <0>;
  };

This allows SCMI power domain 15 to become a subdomain of MAIN_PD, and
domain 19 to become a subdomain of WKUP_PD.

Signed-off-by: Kevin Hilman (TI) <khilman@baylibre.com>
---
 drivers/pmdomain/core.c   | 160 ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
 include/linux/pm_domain.h |  16 ++++++++++++++++
 2 files changed, 176 insertions(+)

diff --git a/drivers/pmdomain/core.c b/drivers/pmdomain/core.c
index bf82775f6a67..cee7fbbda829 100644
--- a/drivers/pmdomain/core.c
+++ b/drivers/pmdomain/core.c
@@ -3556,6 +3556,166 @@ static struct device_driver genpd_provider_drv = {
 	.suppress_bind_attrs = true,
 };
 
+/**
+ * of_genpd_remove_subdomain_map - Remove subdomain relationships from map
+ *
+ * @np: pointer to parent node containing map property
+ * @data: pointer to PM domain onecell data
+ *
+ * Iterate over entries in a power-domain-map, and remove the subdomain
+ * relationships that were previously established by of_genpd_add_subdomain_map().
+ * This allows cleanup during driver removal or error handling.
+ *
+ * Return: 0 on success, negative error code on failure
+ */
+int of_genpd_remove_subdomain_map(struct device_node *np,
+				  struct genpd_onecell_data *data)
+{
+	struct generic_pm_domain *genpd, *parent_genpd;
+	struct of_phandle_args child_args, parent_args;
+	int index = 0;
+	int ret = 0;
+	u32 child_index;
+
+	if (!np || !data)
+		return -EINVAL;
+
+	/* Iterate through power-domain-map entries using the OF helper */
+	while (!of_parse_map_iter(np, "power-domain", &index,
+				   &child_args, &parent_args)) {
+		/* Extract the child domain index from the child specifier */
+		if (child_args.args_count < 1) {
+			of_node_put(parent_args.np);
+			continue;
+		}
+		child_index = child_args.args[0];
+
+		/* Validate child domain index */
+		if (child_index >= data->num_domains) {
+			of_node_put(parent_args.np);
+			continue;
+		}
+
+		genpd = data->domains[child_index];
+		if (!genpd) {
+			of_node_put(parent_args.np);
+			continue;
+		}
+
+		/* Get parent power domain from provider */
+		mutex_lock(&gpd_list_lock);
+
+		parent_genpd = genpd_get_from_provider(&parent_args);
+		if (IS_ERR(parent_genpd)) {
+			mutex_unlock(&gpd_list_lock);
+			of_node_put(parent_args.np);
+			dev_warn(&genpd->dev, "failed to get parent domain for removal\n");
+			continue;
+		}
+
+		/* Remove subdomain relationship */
+		ret = pm_genpd_remove_subdomain(parent_genpd, genpd);
+		mutex_unlock(&gpd_list_lock);
+		of_node_put(parent_args.np);
+
+		if (ret)
+			dev_warn(&genpd->dev, "failed to remove as subdomain of %s: %d\n",
+				 parent_genpd->name, ret);
+		else
+			dev_dbg(&genpd->dev, "removed as subdomain of %s\n",
+				parent_genpd->name);
+	}
+
+	return 0;
+}
+EXPORT_SYMBOL_GPL(of_genpd_remove_subdomain_map);
+
+/**
+ * of_genpd_add_subdomain_map - Parse and map child PM domains
+ *
+ * @np: pointer to parent node containing map property
+ * @data: pointer to PM domain onecell data
+ *
+ * Iterate over entries in a power-domain-map, and add them as
+ * children of the parent domain. If any child fails to be added,
+ * all previously added children are removed to maintain atomicity.
+ *
+ * Return: 0 on success, negative error code on failure
+ */
+int of_genpd_add_subdomain_map(struct device_node *np,
+			       struct genpd_onecell_data *data)
+{
+	struct generic_pm_domain *genpd, *parent_genpd;
+	struct of_phandle_args child_args, parent_args;
+	int index = 0;
+	int ret = 0;
+	u32 child_index;
+
+	if (!np || !data)
+		return -EINVAL;
+
+	/* Iterate through power-domain-map entries using the OF helper */
+	while (!of_parse_map_iter(np, "power-domain", &index,
+				   &child_args, &parent_args)) {
+		/* Extract the child domain index from the child specifier */
+		if (child_args.args_count < 1) {
+			of_node_put(parent_args.np);
+			ret = -EINVAL;
+			goto cleanup;
+		}
+		child_index = child_args.args[0];
+
+		/* Validate child domain index */
+		if (child_index >= data->num_domains) {
+			of_node_put(parent_args.np);
+			pr_debug("map's child index (%u) > number of domains (%u).  Skipping.\n",
+				 child_index, data->num_domains);
+			ret = -EINVAL;
+			goto cleanup;
+		}
+
+		genpd = data->domains[child_index];
+		if (!genpd) {
+			of_node_put(parent_args.np);
+			continue;
+		}
+
+		/* Get parent power domain from provider and establish subdomain relationship */
+		mutex_lock(&gpd_list_lock);
+
+		parent_genpd = genpd_get_from_provider(&parent_args);
+		if (IS_ERR(parent_genpd)) {
+			mutex_unlock(&gpd_list_lock);
+			of_node_put(parent_args.np);
+			ret = PTR_ERR(parent_genpd);
+			dev_err(&genpd->dev, "failed to get parent domain: %d\n", ret);
+			goto cleanup;
+		}
+
+		ret = genpd_add_subdomain(parent_genpd, genpd);
+		mutex_unlock(&gpd_list_lock);
+		of_node_put(parent_args.np);
+
+		if (ret) {
+			dev_err(&genpd->dev, "failed to add as subdomain of %s: %d\n",
+				parent_genpd->name, ret);
+			goto cleanup;
+		}
+
+		dev_dbg(&genpd->dev, "added as subdomain of %s\n",
+			parent_genpd->name);
+	}
+
+	return 0;
+
+cleanup:
+	/* Remove all successfully added subdomains using the removal function */
+	pr_err("rolling back child map additions due to error: %d\n", ret);
+	of_genpd_remove_subdomain_map(np, data);
+	return ret;
+}
+EXPORT_SYMBOL_GPL(of_genpd_add_subdomain_map);
+
 static int __init genpd_bus_init(void)
 {
 	int ret;
diff --git a/include/linux/pm_domain.h b/include/linux/pm_domain.h
index 93ba0143ca47..3baf224e4f24 100644
--- a/include/linux/pm_domain.h
+++ b/include/linux/pm_domain.h
@@ -463,6 +463,10 @@ int of_genpd_add_subdomain(const struct of_phandle_args *parent_spec,
 int of_genpd_remove_subdomain(const struct of_phandle_args *parent_spec,
 			      const struct of_phandle_args *subdomain_spec);
 struct generic_pm_domain *of_genpd_remove_last(struct device_node *np);
+int of_genpd_add_subdomain_map(struct device_node *np,
+			       struct genpd_onecell_data *data);
+int of_genpd_remove_subdomain_map(struct device_node *np,
+				  struct genpd_onecell_data *data);
 int of_genpd_parse_idle_states(struct device_node *dn,
 			       struct genpd_power_state **states, int *n);
 void of_genpd_sync_state(struct device_node *np);
@@ -505,6 +509,18 @@ static inline int of_genpd_remove_subdomain(const struct of_phandle_args *parent
 	return -ENODEV;
 }
 
+static inline int of_genpd_add_subdomain_map(struct device_node *np,
+					     struct genpd_onecell_data *data)
+{
+	return -ENODEV;
+}
+
+static inline int of_genpd_remove_subdomain_map(struct device_node *np,
+						struct genpd_onecell_data *data)
+{
+	return -ENODEV;
+}
+
 static inline int of_genpd_parse_idle_states(struct device_node *dn,
 			struct genpd_power_state **states, int *n)
 {

-- 
2.51.0


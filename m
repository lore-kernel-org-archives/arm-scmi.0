Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D696F24C06D
	for <arm-scmi@vger.kernel.org>; Wed, 16 Apr 2025 23:57:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744847844; cv=none; b=hn6IZZ2RxPpAjI0QZlp9Gcx9WE6EVMz97IyBQN8yhu4QxbbOLhDk9m8Fas9b2cU+umBXnMBQGs/jUwcLEiUVXJqL59jYu3yufISISzTl+M633He819zDmgeK9rdqZdRf66GBrVbZtxeb1+6IcOjWSGcl98H6bCzwY+8jVpAzNV0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744847844; c=relaxed/simple;
	bh=O9dkNj97iibyI0qPQZL9UeNkLhkIibMNK/4uSr1dA7U=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=urXVUaISvIr7JxAD/3db2/Yv04nvmnlNdJc4mG3T32Fvnj7MdyPaW5j/61t+4kW7laKInQccqWB7P763xMOnC16CRra4EEWc+SXWhxoi3fxm+R3UdvJmkf225pgOlsAJmIKfFntHGpO6+vK8Rm9FNaE612l36n9R91PN27bp2ms=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=UYk73qSL; arc=none smtp.client-ip=209.85.216.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="UYk73qSL"
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-30820167b47so224427a91.0
        for <arm-scmi@vger.kernel.org>; Wed, 16 Apr 2025 16:57:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1744847841; x=1745452641; darn=vger.kernel.org;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=KiGJvI789d50CVRixVA8tgxVI62WLOX7SQhw+v4E+Ls=;
        b=UYk73qSLVnyRHL8RqW2eVPqU3niTqqAPDVxJCCXjx0KmVAN0RwDmndT+2GqlkezVBO
         LPucL7na5ol4WWMuJ17KxWgEM0iIHSGURC/3nmCIVuurV408oaFPbrEdCqAGRQ5VdtQD
         jFrzBMPcwrIewDktWo9QvIdfpQamJQqI6Sfw+iFNhrHonbrl05wEVoXkwRwVEY87n+Eh
         SZAt12mm8DeZl6pS3+Y3PMAM83ltVp0fuAhPHobkgXf+aZ7sZ1er6BFw61DgrRo0iULH
         JCEV5dNfb6xxjgG9Haqc3k50Ho8BOG+XaTBksr3o8XCiPGJVJshEogGHKFRLSlswS1lM
         0vqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744847841; x=1745452641;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=KiGJvI789d50CVRixVA8tgxVI62WLOX7SQhw+v4E+Ls=;
        b=liri8SRhQLXAIcBWaw8pruYdbZPI/wzE+QWofo4V8RINQOb8alyAPk9ppCCN627fZ5
         CpatGcF081H4/ob6vrY/uMClC9chvllJcUxAT7reMFhXOuZ5/1Z+HmXZVZtbzExtdMwT
         nd6ZFjIA0IZc0MuX129+ZDKTcYCNnnhx6xAOePyCWQbeObl2eZhHOmRzroUwoZ6bn1CX
         vRVdlhcjB4lKA+3AtI7H3Eoi9zL7/O3KBvVjXcVEEmENXFkR+DKTMnN2YkwvmtM5BQqR
         c+Q2Y8f+WF0cMgOGfe3if25ZLwhozJfxfvzY+OPQFkqNUq+XiiVB85aiSIWi++gM+UH9
         Ezpg==
X-Forwarded-Encrypted: i=1; AJvYcCXLA2KmnFn81uNybvMh5tUFbadS2EA67Dp/f/n5kpDjIPU1ZXy6BWiBzayizVvXM7Fl8RQRjrsv9Q==@vger.kernel.org
X-Gm-Message-State: AOJu0Yxcs7Dky3rp/6YCw1QA7c4RzYNKca1iTtD3tSxgPb8+2PTNH0fu
	N1KIW8NPbf0q9eYqaQaw/9TfnprEkxupS31ojmocB0R6urb7Xu74KFu6xM8/INP+r55B3t86e37
	nz5Y=
X-Gm-Gg: ASbGnctMP9q42hWbz1pqzsDlFrtHwIZKi1P8D5CmWRGZIJkC7zREB8zLN+avOuvkt21
	XLuhBKt0koUjyUVZMsvy4ml533KtNp8NTJq2ELMFQDdEPQASP4/fTlDgdgsqtvSQvIzIgTtoCUz
	Sj6c9W64CiBUcM3J1PqUafZRg/aNfL5TO+rxr80B1ZMXKG2rdSLiG2rZ8qoiKx7lmOKPsTES0Lr
	91BCa3xZjRuQjnDw/G8Ch5ghZ+pZ2tAKZdjuTHkLUnKduHHbgz7b+76EBcHIlwDJS16UD7aBJP5
	XCol5lVgGS66svvJueIjFJ529vmzRQtTrXWBZBk=
X-Google-Smtp-Source: AGHT+IG0ZU0FIkM/h9tIRxTjdv06uVgjP1lCaGLWmo3AqKCB4TbgwueliG9dmifn29w5VAi0BZOfCQ==
X-Received: by 2002:a17:90b:51c8:b0:2fa:30e9:2051 with SMTP id 98e67ed59e1d1-3086f40e934mr1207180a91.5.1744847840983;
        Wed, 16 Apr 2025 16:57:20 -0700 (PDT)
Received: from localhost ([97.126.182.119])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22c33ef105esm20568675ad.32.2025.04.16.16.57.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Apr 2025 16:57:20 -0700 (PDT)
From: Kevin Hilman <khilman@baylibre.com>
To: Ulf Hansson <ulf.hansson@linaro.org>
Cc: "cristian.marussi@arm.com" <cristian.marussi@arm.com>,
 "souvik.chakravarty@arm.com" <souvik.chakravarty@arm.com>, Sudeep Holla
 <sudeep.holla@arm.com>, "arm-scmi@vger.kernel.org"
 <arm-scmi@vger.kernel.org>, Dhruva Gole <d-gole@ti.com>, Sebin Francis
 <sebin.francis@ti.com>
Subject: Re: mixing SCMI and PSCI power domain hierarchy
In-Reply-To: <CAPDyKFpuqk3jH91rkDDz_kejyJ5pFg5XH+=vdTA2aP8MJKUWrw@mail.gmail.com>
References: <7hecy3h7ky.fsf@baylibre.com>
 <CAPDyKFoLJ4zey6GNzCb9roAAJ5mS7B7exU1NEKtpLyyjD0aADA@mail.gmail.com>
 <7hikn5c5v8.fsf@baylibre.com>
 <CAPDyKFpuqk3jH91rkDDz_kejyJ5pFg5XH+=vdTA2aP8MJKUWrw@mail.gmail.com>
Date: Wed, 16 Apr 2025 16:57:19 -0700
Message-ID: <7hzfgf8xsw.fsf@baylibre.com>
Precedence: bulk
X-Mailing-List: arm-scmi@vger.kernel.org
List-Id: <arm-scmi.vger.kernel.org>
List-Subscribe: <mailto:arm-scmi+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:arm-scmi+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Ulf Hansson <ulf.hansson@linaro.org> writes:

> On Wed, 16 Apr 2025 at 02:22, Kevin Hilman <khilman@baylibre.com> wrote:
>>
>> Ulf Hansson <ulf.hansson@linaro.org> writes:

[...]

>> > 2) Enable parents to be described in the "scmi_pds" node. To do that,
>> > we need to extend the DT bindings a bit, as we need the SCMI index
>> > that should correspond to the SCMI-child-power-domain. In other words
>> > "power-domains = <&TOP1_PD>" would not be sufficient.
>>
>> This is the direction that I was thinking makes the most sense, and
>> actually reflects real hardware.
>>
>> If you have any thoughts about what that binding change should look
>> like, maybe I can have a look at implementing it.
>
> Usually we describe parent domains by using the original power-domain
> DT binding, but this is limited to work for when the child-domain node
> has #power-domain-cells = <0>.
>
> We need to investigate if there are any other DT bindings we can get
> some influence from, perhaps clocks have something similar?
>
> Anyway, without further thinking my idea would be to add a new
> property ("power-domain-child-ids") where we can put a list of indexes
> for the child-domain that corresponds to each of the parents that we
> can list in "power-domains".

OK, I have an idea.

First, the normal stuff.  We have the SCMI PDs:

&scmi {
	scmi_pds: protocol@11 {
		reg = <0x11>;
		#power-domain-cells = <1>;
	};
};

Then we have an example leaf node which uses that:

	main_timer0: timer@2400000 {
                [...]
		clocks = <&scmi_clk 47>;
		clock-names = "fck";
		power-domains = <&scmi_pds 15>;
	};

And then, we have the top-level PD controlled by PSCI:

&psci {
	compatible = "arm,psci-1.0";
	method = "smc";

	MAIN_PD: power-controller-main {
		#power-domain-cells = <0>;
	};
};

Now the new idea: The hierarchy I want to represent is that main_timer0
is in SCMI PD 15, which is in the top-level domain MAIN_PD.

So, what about simply extending the SCMI binding where we can
(optionally) define a parent domain for each SCMI ID?  So the SCMI node
would then look like this:

	scmi_pds: protocol@11 {
		reg = <0x11>;
		#power-domain-cells = <1>;

		/* main_timer0: SCMI ID: 15 */
		pd15: domain@15 {
		    reg = <15>;
		    parent-domain = <&MAIN_PD>;
	        };
	};

This requires adding a bit of code to the SCMI PM domain driver to check
for these subnodes with optional parent-domain properties, and I already
have a PoC[1] which works on v6.12.

One other reason I like this solution is that it actually kills two
birds with one stone.  The first one is describing the hieracrhy above,
but the second one is that it solves another limitation of the SCMI PM
domain implementation.

Currently you can only have a single group of SCMI PDs.  More
specifically, you can only have a single "protocol@11" or "reg = <0x11>"
SCMI node.  Which means, you cannot have more than one group of SCMI
PDs.  So if you have (like I do) groups of SCMI-controlled PDs that area
themselves grouped into multiple top-level PDs, there is no way to
describe that today since you can only have a single SCMI PD node.

To get more specific, on this TI SoC I'm working on now, there's more
than one top-level PD controlled by PSCI.  The top-level (PSCI) domains
look like this:

&psci {
	compatible = "arm,psci-1.0";
	method = "smc";

	MAIN_PD: power-controller-main {
		#power-domain-cells = <0>;
	};

	WKUP_PD: power-controller-wkup {
		#power-domain-cells = <0>;
	};
};

And in addition to the main_timer0 leaf device described above, I have
another timer that is also SCMI controlled like this:

	wkup_timer0: timer@2b100000 {
                [...]
		clocks = <&scmi_clk 85>;
		clock-names = "fck";
		power-domains = <&scmi_pds 19>;
	};

but..., this one is not in MAIN_PD, it is in WKUP_PD.  Which means I
need some way to declare that SCMI PDs that are part of the one (and
only) "protocol@11" node could have different parent domains.  With the
new idea, we just do this: (note that the subnodes have different
parent-domain properties):

	scmi_pds: protocol@11 {
		reg = <0x11>;
		#power-domain-cells = <1>;

		/* main_timer0: SCMI ID: 15 */
		pd15: domain@15 {
		    reg = <15>;
		    parent-domain = <&MAIN_PD>;
	        };

		/* wkup_timer0: SCMI ID: 19 */
		pd19: domain@19 {
		    reg = <19>;
		    parent-domain = <&WKUP_PD>;
	        };
	};

So.... what you think about this?  I guess's the "parent-domain" idea is
the really new concept here, but I guess it's not that much different
than a clock divider that points to its parent clock.

Anyways, curious what you think.  I quite like this solution because it
solves two fairly big limitations in the SCMI PM domain implementaion
that exist today with one relatively simple solution.

Kevin

P.S. maybe the most interesting thing about this solution is that it was
     co-developed with AI.  I've been experimenting with Anthropic's
     Claude Code[2] for both brainstorming and coding.  After coming up
     with some other ideas I rejected, Claude came up with this one, and
     when I realized it solved both my problems in one go, I was
     obviously drawn to it, and figured it's worth proposing for
     discussion.  I wrote this email, and had to manually write my own
     DT to test out this solution, but the patch below was entirely
     written by Claude.

[1]
diff --git a/drivers/pmdomain/arm/scmi_pm_domain.c b/drivers/pmdomain/arm/scmi_pm_domain.c
index a7784a8bb5db..1e4aa17ca1d2 100644
--- a/drivers/pmdomain/arm/scmi_pm_domain.c
+++ b/drivers/pmdomain/arm/scmi_pm_domain.c
@@ -54,7 +54,7 @@ static int scmi_pd_power_off(struct generic_pm_domain *domain)
 
 static int scmi_pm_domain_probe(struct scmi_device *sdev)
 {
-	int num_domains, i;
+	int num_domains, i, ret;
 	struct device *dev = &sdev->dev;
 	struct device_node *np = dev->of_node;
 	struct scmi_pm_domain *scmi_pd;
@@ -115,7 +115,53 @@ static int scmi_pm_domain_probe(struct scmi_device *sdev)
 
 	dev_set_drvdata(dev, scmi_pd_data);
 
-	return of_genpd_add_provider_onecell(np, scmi_pd_data);
+	/* First register the SCMI domains with the power domain framework */
+	ret = of_genpd_add_provider_onecell(np, scmi_pd_data);
+	if (ret)
+		return ret;
+
+	/* AFTER registering domains, now try to establish subdomain relationships */
+	for (i = 0; i < num_domains; i++) {
+		struct of_phandle_args parent_pd_args;
+		struct device_node *child_np;
+
+		/* Skip if this domain is not defined */
+		if (!domains[i])
+			continue;
+
+		/* Look for child nodes with parent-domain property */
+		for_each_child_of_node(np, child_np) {
+			u32 domain_id;
+
+			/* Check if this child node refers to the current SCMI domain */
+			if (of_property_read_u32(child_np, "reg", &domain_id) || domain_id != i)
+				continue;
+
+			/* Check if it has a parent-domain property */
+			if (of_parse_phandle_with_args(child_np, "parent-domain", "#power-domain-cells",
+						      0, &parent_pd_args) < 0)
+				continue;
+
+			/* Create a phandle args structure for the SCMI domain */
+			struct of_phandle_args subdomain_args = {
+				.np = np,
+				.args_count = 1,
+				.args = {i}
+			};
+
+			/* Use of_genpd_add_subdomain to directly establish the relationship */
+			ret = of_genpd_add_subdomain(&parent_pd_args, &subdomain_args);
+			if (ret) {
+				dev_warn(dev, "Failed to add SCMI domain %d as subdomain: %d\n",
+					 i, ret);
+			} else {
+				dev_info(dev, "Added SCMI domain %s as subdomain of %s\n",
+					 domains[i]->name, parent_pd_args.np->name);
+			}
+		}
+	}
+
+	return 0;
 }
 
 static void scmi_pm_domain_remove(struct scmi_device *sdev)

[2] https://docs.anthropic.com/en/docs/agents-and-tools/claude-code/overview

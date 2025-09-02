Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F328824E4BD
	for <arm-scmi@vger.kernel.org>; Tue,  2 Sep 2025 23:56:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756857375; cv=none; b=l9cmPJTmY3fAy19kjWg5OxLuSDjAmaOubx6une9+2xMR9MWgQtJGjgZUAiuW9qPC2TlQcUpV0fI6pwrkP1S0DE8+Hh4KlttwEQvHVMcGwZwl+G/ajhS1Ii+IE9vxks1Gk6ayftOgkU9p//VqUYgw3M/rEmsSpCDgIsRCC4W0W0M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756857375; c=relaxed/simple;
	bh=888ywDxPyUl4M6zpZ768anwPNrIvU3o92oYeraobAwY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=JuAhed9ZnB3IXnev0iiNXxcrWwD1ObzfwIQTThUTqfL8els7m4JxXuH7MD7EZZrGowcxWs0YGO8lBuWHDzqUWXFmwHV6XQNHBfK3JzcpCS3krneryDPXPNBQaKxk9Wucl6U+6LlnPgFoAR5s+AQgIo5mY6jvZels0rBBS6LeKH4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=G/388lof; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="G/388lof"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1756857372;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=h1ZYHDqv025lJgwhhRN8DEjjxbXljdscTG4+1iteT+E=;
	b=G/388lof8fZLNVbXRDZbgd5wCnXJVEwFl6QbHUnWykNYnFbQea0l1KDf2vDuyPzDRKGn38
	7ghgpFs1Zd2yhTWMltM9fzF8WdIaa4cIN6RnNqvoiFoJdIr74ZueZzBUPBErp2A47+vx+H
	viL24FWuXtfTxr8QWduiUO6LUXxg4Ec=
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-640-MKzyWINXOwiqTxVbKsBmsQ-1; Tue, 02 Sep 2025 19:56:11 -0400
X-MC-Unique: MKzyWINXOwiqTxVbKsBmsQ-1
X-Mimecast-MFC-AGG-ID: MKzyWINXOwiqTxVbKsBmsQ_1756857371
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-720408622e2so24589066d6.0
        for <arm-scmi@vger.kernel.org>; Tue, 02 Sep 2025 16:56:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756857371; x=1757462171;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=h1ZYHDqv025lJgwhhRN8DEjjxbXljdscTG4+1iteT+E=;
        b=rIKyfmxthgx+xXV3KaAcJz5uuCkRU43Ucp54mHWM8Y1jKsWnR+KTXwKnGmE8Vwccgp
         TSVM7336kTj2UoyZWpeUHGHtIEQs+lRfoF9YhyD9MblcTNtbgDWZGnyUpthHfHe3gLCE
         SYcEIS/RjadOAGWrVWBecoP6KxXrIiOsto9DzHIodHfm+dnUlQmiy1eQql+CCkEXMeqF
         ObWtFpLgE4C8Sp5440DOg6gfebgzv3T9BJLURHV1+4n1xJZeWkMZ3yG3LMrxGDvjSLRz
         yjwfSC5vn7lb9AO8rzBtHeWVCpyo0kzcpQGj1f3+M0EY5G4wnhH5KMCx5Ea0J0dyLun0
         UdNQ==
X-Forwarded-Encrypted: i=1; AJvYcCV2J2zzrzl5VJN5Y93ieoPmdw0nl6cBxdS8dvQiRo3x7RG8PsG3Me2cMXsVe5q3G0xFpibY6uXStg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yxqiy7TOppF0X88nypUxv9W5opLAh+xLrcDym3lxmfJw6ipvrVo
	uWfz/DSjJl+JuTlNlvaylb/0vxYl2IKnxPXtF27i9hbcCrTzRvlikLDwR23BC7svisE5YUkVBJ7
	11E48JMK52YqmlfQqN02jkuXtRJAUro0nPe6cYEJspnm0grMd835aGW+BGH0U
X-Gm-Gg: ASbGnctR8vjpZ6PZ1m7ftbjXfe1oqfH2iRurBi8PSY4/n2lDFu9El6H3kRZxpd9O1zx
	s/pluhpIupjiGRMoL2eaN7NAy/+MGnqhKRTyutpZtvemJpm00AdSYcs/U/qncw71dg00eLkV6E8
	BgaF/pDS7TpOFIelTV79zddvydUOimBYDWNQfIbky9t3hM6glumC1wI+nkvjKWdSOojwuAT+8el
	w7Ioa14ukFfN+CzTtkZz+vcFh+4jiGBpV6NfgY3DnQwkPVYoMXN6rtct8y9fWip9NmuE9cYFWq6
	hUgOVoaOgkd2+6zf8Po3Bdw7HQB54T3qrtt7/za0FhKpLwrC773MKFrL
X-Received: by 2002:a05:6214:403:b0:70d:ff3a:f96b with SMTP id 6a1803df08f44-70fac89e1acmr152518536d6.44.1756857371105;
        Tue, 02 Sep 2025 16:56:11 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHB9u8oxnT7u5IixuDLd0JsqQC/w6ZeQd7EFEgifkIuiCwykZelS8Lp+UAMgPRJm62ZRJZeJA==
X-Received: by 2002:a05:6214:403:b0:70d:ff3a:f96b with SMTP id 6a1803df08f44-70fac89e1acmr152518396d6.44.1756857370724;
        Tue, 02 Sep 2025 16:56:10 -0700 (PDT)
Received: from x1 ([2600:382:8106:c00:522a:3619:4560:3aa])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-720b4666156sm19976446d6.39.2025.09.02.16.56.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Sep 2025 16:56:10 -0700 (PDT)
Date: Tue, 2 Sep 2025 19:56:07 -0400
From: Brian Masney <bmasney@redhat.com>
To: Peng Fan <peng.fan@nxp.com>
Cc: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Sudeep Holla <sudeep.holla@arm.com>,
	Cristian Marussi <cristian.marussi@arm.com>,
	Marco Felsch <m.felsch@pengutronix.de>,
	Dan Carpenter <dan.carpenter@linaro.org>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
	arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2 2/3] clk: conf: Support assigned-clock-sscs
Message-ID: <aLeEFzXkPog_dt2B@x1>
References: <20250901-clk-ssc-version1-v2-0-1d0a486dffe6@nxp.com>
 <20250901-clk-ssc-version1-v2-2-1d0a486dffe6@nxp.com>
Precedence: bulk
X-Mailing-List: arm-scmi@vger.kernel.org
List-Id: <arm-scmi.vger.kernel.org>
List-Subscribe: <mailto:arm-scmi+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:arm-scmi+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
In-Reply-To: <20250901-clk-ssc-version1-v2-2-1d0a486dffe6@nxp.com>
User-Agent: Mutt/2.2.14 (2025-02-20)
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: gG6wM6_Jv7itvhFnKjAk9eZgOTWHasmY9ehodiC7iws_1756857371
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Peng,

On Mon, Sep 01, 2025 at 11:51:46AM +0800, Peng Fan wrote:
> Parse the Spread Spectrum Configuration(SSC) from device tree and configure
> them before using the clock.
> 
> Each SSC is three u32 elements which means '<modfreq spreaddepth
> modmethod>', so assigned-clock-sscs is an array of multiple three u32
> elements.
> 
> Signed-off-by: Peng Fan <peng.fan@nxp.com>

Stephen has also been asking for kunit tests to be added for new
functionality in the clk core. There's already one kunit test that
calls of_clk_set_defaults(). I attached a very rough draft of a patch
showing that it'd be possible to mock this up in a test with what's
already there. I set a log statement with the configuration from
device tree:

test_assigned_rate0: Spread Sprectrum Configuration: modfreq_hz=10000 spread_bp=3 method=1

You can run the kunit tests with:

./tools/testing/kunit/kunit.py run \
	--kunitconfig drivers/clk/.kunitconfig \
	--raw_output=all

Additionally, what do you think about making a dt-bindings include file
for CLK_SSC_CENTER_SPREAD + friends? Right now, the test illustrates
that we need to hardcode the number from the clk-provider.h file inside
the DTS.

Here's the patch and feel free to make it your own as you see fit.

Brian



diff --git a/drivers/clk/clk_test.c b/drivers/clk/clk_test.c
index a268d7b5d4cb..6cc3ad883b35 100644
--- a/drivers/clk/clk_test.c
+++ b/drivers/clk/clk_test.c
@@ -28,6 +28,7 @@ static const struct clk_ops empty_clk_ops = { };
 struct clk_dummy_context {
 	struct clk_hw hw;
 	unsigned long rate;
+	struct clk_spread_spectrum sscs;
 };
 
 static unsigned long clk_dummy_recalc_rate(struct clk_hw *hw,
@@ -83,6 +84,17 @@ static int clk_dummy_set_rate(struct clk_hw *hw,
 	return 0;
 }
 
+static int clk_dummy_set_spread_spectrum(struct clk_hw *hw,
+					 struct clk_spread_spectrum *conf)
+{
+	struct clk_dummy_context *ctx =
+		container_of(hw, struct clk_dummy_context, hw);
+
+	ctx->sscs = *conf;
+
+	return 0;
+}
+
 static int clk_dummy_single_set_parent(struct clk_hw *hw, u8 index)
 {
 	if (index >= clk_hw_get_num_parents(hw))
@@ -100,18 +112,21 @@ static const struct clk_ops clk_dummy_rate_ops = {
 	.recalc_rate = clk_dummy_recalc_rate,
 	.determine_rate = clk_dummy_determine_rate,
 	.set_rate = clk_dummy_set_rate,
+	.set_spread_spectrum = clk_dummy_set_spread_spectrum,
 };
 
 static const struct clk_ops clk_dummy_maximize_rate_ops = {
 	.recalc_rate = clk_dummy_recalc_rate,
 	.determine_rate = clk_dummy_maximize_rate,
 	.set_rate = clk_dummy_set_rate,
+	.set_spread_spectrum = clk_dummy_set_spread_spectrum,
 };
 
 static const struct clk_ops clk_dummy_minimize_rate_ops = {
 	.recalc_rate = clk_dummy_recalc_rate,
 	.determine_rate = clk_dummy_minimize_rate,
 	.set_rate = clk_dummy_set_rate,
+	.set_spread_spectrum = clk_dummy_set_spread_spectrum,
 };
 
 static const struct clk_ops clk_dummy_single_parent_ops = {
@@ -3192,7 +3207,13 @@ static int clk_assigned_rates_test_init(struct kunit *test)
 			consumer = of_find_compatible_node(NULL, NULL, "test,clk-consumer"));
 		of_node_put_kunit(test, consumer);
 
+		// Here's an example of a test that shows where
+		// of_clk_set_defaults() is called for the consumer.
 		KUNIT_ASSERT_EQ(test, 0, of_clk_set_defaults(consumer, false));
+		pr_crit("%s: Spread Sprectrum Configuration: modfreq_hz=%u spread_bp=%u method=%u\n",
+			clk_hw_get_name(&ctx->clk0.hw), ctx->clk0.sscs.modfreq_hz,
+			ctx->clk0.sscs.spread_bp, ctx->clk0.sscs.method);
+
 	}
 
 	return 0;
diff --git a/drivers/clk/kunit_clk_assigned_rates_one_consumer.dtso b/drivers/clk/kunit_clk_assigned_rates_one_consumer.dtso
index a41dca806318..a157a316a10d 100644
--- a/drivers/clk/kunit_clk_assigned_rates_one_consumer.dtso
+++ b/drivers/clk/kunit_clk_assigned_rates_one_consumer.dtso
@@ -14,5 +14,6 @@ kunit-clock-consumer {
 		compatible = "test,clk-consumer";
 		assigned-clocks = <&clk>;
 		assigned-clock-rates = <ASSIGNED_RATES_0_RATE>;
+		assigned-clock-sscs = <10000 3 1>;
 	};
 };


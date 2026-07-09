Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2079C28C840
	for <arm-scmi@vger.kernel.org>; Thu,  9 Jul 2026 13:28:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783603722; cv=none; b=dymIsJGgm0dqnPWc4KNHFiAICwEYMLZEqGvDwcwiZOBRmPrPuKvzbBQOl1mACSpTuI8cGlero5oj7seN7vvmO/18GSo7bk4yMZglxK7OPaGII1DxRiyDQSTX9JBbCOYr98cekzNm+rGgHFz42x3GNhMngrA3ArwRcB9Gy6PmkFY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783603722; c=relaxed/simple;
	bh=X3LJtoIF2cz78g7fd2JzTBDARU25iOSmEdSyogFuUdU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=NSBphAuOW1V2wTF3p21o8A8ve73/1kbnZCVId86ibmqkUxup6GeiD6CL3JXQOmvLUZ4H0HWcWYmVmDzp1PiycbKi2lODEbI4MMPmcuui0PR4+37JGLRhT6EZpEeLZh1+bVVbuCLRjEHKg/9agUkrRtn7tAyVHL7RcMWfdERKjps=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=WGbtrFI3; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="WGbtrFI3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1783603720;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=0io07SKI9Zq4iIODgABtJrQ9iS+xBoIqqRbw2Q3fX6U=;
	b=WGbtrFI3kjs/0P6RINPIfxfhEY4hJ5TVPCHW47qruNulaOl8UF6Dans02+L7o7U2dwjTFd
	LFItk1CHM7mth1nkcUEhSmeHaOBKVRQncEkdKiMvUhv2XSNe/u2aTwy7Yxt/l0opDnyKF8
	20trO5W5r4y5LuP78uxwQSyzW8n0+YI=
Received: from mail-yw1-f199.google.com (mail-yw1-f199.google.com
 [209.85.128.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-624-wBw4O1_TMMuyzxqpjMQ7vQ-1; Thu, 09 Jul 2026 09:28:36 -0400
X-MC-Unique: wBw4O1_TMMuyzxqpjMQ7vQ-1
X-Mimecast-MFC-AGG-ID: wBw4O1_TMMuyzxqpjMQ7vQ_1783603716
Received: by mail-yw1-f199.google.com with SMTP id 00721157ae682-7f582244e9eso33219467b3.3
        for <arm-scmi@vger.kernel.org>; Thu, 09 Jul 2026 06:28:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783603716; x=1784208516;
        h=user-agent:in-reply-to:content-disposition:content-type
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0io07SKI9Zq4iIODgABtJrQ9iS+xBoIqqRbw2Q3fX6U=;
        b=PPYOdTXH8WEaqUC7wDrLGgpEMCGTUSfL0XI3VDpGvo/o+4iKHF/jse5LG+xwZM5wW1
         wuRrgPZ0jniLaEkrA/unWMJU0e1Xo+r3aYYbfBrCN++fTtuCU3R2r+mZH5PQ2NU5Uvw/
         nXIo+B3aKdl5N7Smi8g7spBzxiXgUVmtpNml8wxySyyA+phuOAt39fTUDvzgDK8YLa0a
         pUvFUtyRn9iOhPX5UdI1sg+ydRFBT8wxlBMn7lOX8ROGDSlb6+B6W0UcgWFWnVwun1cJ
         FieUDjjjurtT6cMHGITIKBvc4RtwPlOwZhCcPC+eO+s5wzMl7gRrGqfQ7WifN/BpoCgf
         Eq4w==
X-Forwarded-Encrypted: i=1; AHgh+Rr23F0CkazeDmaIvhvmsEPD+tztCqWVConJfLcfKfEUjYeL7/fwQvkE+ocoYrol1wBakwzGbgcIIA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx4FUp0FdxnKsMf7sk9J0bTMcquzWAjs5d9JZSv0T8OVJJUMx90
	ljgANv022cTaWJvfpj9wqZI7sC3wBxnIVjhLvgJ+IPV8Ck6Xzg41moP/w+d6bWwWU3A998cHIsZ
	avkdYG7Pm3ge7iDvJs+2gg9ExVq4P6IWwI1Q2u/o4MSUbiCMQSpPfw2GsT1qa
X-Gm-Gg: AfdE7cnlmk9H3DdzfoCXz+gDiFME1PIfA+gFvylZWs5LECi9FicNPq8UmhrDaNYfkBM
	xh7N2mczwUPvmFbm5A/TljlIQTThDVoIpw6JKoyDU2YXM6kUSf5SPSp4pCQp/pQFBFKxP1kadpV
	8jzVOGYZpUPN0XXdcrq7b8Rc9/Vt8vSx/Y+enwrPEmid/Jwj2Ef7zO0jAI7KkGezXhyb1QXWoP+
	53ZqnrHQURjbcS4FaWKxDsSscos9KLjAkDN/1lQ2KzYOQKhUc6CVH+6NFxun2rUBo8H67mU53Gd
	83xjeaqWtQGBBtogF6UbY3+K+fJwyopnkfGLhFt4hT4jzcQVfrHBgLdcmYLxvmCV6SYvgUk25nT
	susidwjCDgGIW1vWX8eUi6eN2qFuOrACQ2ZE/Ht6ZRBA+aA==
X-Received: by 2002:a05:690e:d48:b0:666:39a8:fb82 with SMTP id 956f58d0204a3-6679f02acb3mr4957901d50.14.1783603715989;
        Thu, 09 Jul 2026 06:28:35 -0700 (PDT)
X-Received: by 2002:a05:690e:d48:b0:666:39a8:fb82 with SMTP id 956f58d0204a3-6679f02acb3mr4957877d50.14.1783603715498;
        Thu, 09 Jul 2026 06:28:35 -0700 (PDT)
Received: from redhat.com (c-73-183-53-213.hsd1.pa.comcast.net. [73.183.53.213])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-66787a49befsm4150627d50.16.2026.07.09.06.28.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jul 2026 06:28:34 -0700 (PDT)
Date: Thu, 9 Jul 2026 09:28:18 -0400
From: Brian Masney <bmasney@redhat.com>
To: Hans de Goede <johannes.goede@oss.qualcomm.com>
Cc: Sudeep Holla <sudeep.holla@kernel.org>,
	Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>,
	Cristian Marussi <cristian.marussi@arm.com>,
	Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nsc@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org,
	Stephen Boyd <sboyd@kernel.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Viresh Kumar <viresh.kumar@linaro.org>, Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Guenter Roeck <linux@roeck-us.net>,
	Jyoti Bhayana <jbhayana@google.com>,
	Jonathan Cameron <jic23@kernel.org>,
	David Lechner <dlechner@baylibre.com>,
	Nuno =?iso-8859-1?Q?S=E1?= <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Ulf Hansson <ulfh@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	linux-clk@vger.kernel.org, linux-pm@vger.kernel.org,
	imx@lists.linux.dev, linux-hwmon@vger.kernel.org,
	linux-iio@vger.kernel.org, linux-input@vger.kernel.org,
	linux-rtc@vger.kernel.org
Subject: Re: [PATCH v2 0/2] firmware: arm_scmi: Ensure automatic module
 loading
Message-ID: <ak-h8oPcL69fCUg2@redhat.com>
References: <20260618-scmi-modalias-v2-0-8c7547c1be21@oss.qualcomm.com>
 <8c2a4ae3-95cc-489a-a7a4-90a3ee2597e9@oss.qualcomm.com>
 <20260709-spicy-fiery-squid-6eec1d@sudeepholla>
 <dae4deba-7e5f-434e-80ae-89033bdeb793@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: arm-scmi@vger.kernel.org
List-Id: <arm-scmi.vger.kernel.org>
List-Subscribe: <mailto:arm-scmi+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:arm-scmi+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
In-Reply-To: <dae4deba-7e5f-434e-80ae-89033bdeb793@oss.qualcomm.com>
User-Agent: Mutt/2.3.2 (2026-04-26)
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: EQJBxRU7R6oepr21Rscmyen9vYZ4moKDHrn6LaDvpA0_1783603716
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Hans,

On Thu, Jul 09, 2026 at 03:22:29PM +0200, Hans de Goede wrote:
> On 9-Jul-26 12:10, Sudeep Holla wrote:
> > On Thu, Jun 18, 2026 at 10:31:12PM +0200, Hans de Goede wrote:
> >> On 18-Jun-26 17:56, Bjorn Andersson wrote:
> >>> SCMI drivers such as the Arm SCMI CPUfreq driver are allowed to built as
> >>> modules, but they are then not automatically loaded. Rework the SCMI
> >>> device table alias support to make modpost consume the information from
> >>> MODULE_DEVICE_TABLE(scmi, ...) and allow drivers to be loaded based on
> >>> this information, if known. Also add a protocol-based alias to also
> >>> trigger driver loading when only the SCMI protocol id is known.
> >>>
> >>> Signed-off-by: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
> >>
> >> So I just gave this a test spin and unfortunately it does not work.
> >>
> >> The problem with Fedora's kernel-config / setup is that the
> >> request_module() from patch 2/2 runs from the initramfs, but
> >> the scmi_cpufreq module is only available in the rootfs.
> >>
> >> It does work if I explictly add the scmi_cpufreq module to
> >> the initramfs, then it does get autoloaded.
> >>
> >> We really need some place to put a uevent sysfs attr which then
> >> gets replayed when udev is restarted from the rootfs and then
> >> re-reads all the uevent files as part of its coldplug
> >> enumeration.
> >>
> > 
> > I don't have much knowledge on uevent to provide any suggestions/help.
> > But isn't this a generic requirement ? I mean you could have modules
> > install on the rootfs and not all of them are packed in initramfs ?
> > Just wondering if that works for other modules, we can examine how
> > do they work and what are we missing ?
> 
> scmi is special because the actual devices under /sys/bus/scmi/devices
> only get created when the module with the driver is loaded because
> of some funtion/id mapping requiring info from the driver.
> 
> Patch 2/2 tries to work around this by loading all scmi drivers matching
> the scmi protocol which is known at bus enumeration time, but this only
> works if the actual scmi driver is in the initramfs because this done
> through directly calling modprobe() from the kernel which does not
> get "replayed" when switching to the real rootfs.

Should the SCMI drivers be added to the dracut module here?

https://github.com/dracut-ng/dracut/blob/main/modules.d/70kernel-modules/module-setup.sh#L73

A few years ago we had to add the interconnect drivers to the list for
Fedora.

Brian


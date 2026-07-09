Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD0A7280CF6
	for <arm-scmi@vger.kernel.org>; Thu,  9 Jul 2026 13:22:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783603355; cv=none; b=O7D3rDEdiM6ue97liVfwYekqS+U17KeMXZpHS6Tl6hhQMyghtzi1ds3DCP33c/Am1Hhrx4iJ2Kf9Js/OloiqR91xluHwNgw3eTJuHBn5E2jt/ZLezle5nnHeUxjh01BBLRyHPJnpst50o3U55qYWWG2vu8867KYdDcJRz3bTs7A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783603355; c=relaxed/simple;
	bh=HC/c+F4jWg20zvROZJFbcu4k56/NIbt+aeplVr2m0sE=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=DfInnlO375MKP4WmJg+R/HAlVUXbTFGhOrmepp9nlTh1Y4mvZf8xAvZgDOKpS5U561EAXNFktzeIG0Sx35FSp/9L/OA7duXNrn+10mtB8O04JB0Djc8HceRuU5OtswZz4fXXJsWXWrEXUbPJP6sv1N/1S54VQULtAZY4tKR7FQU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=HZXyUgE1; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=W5rqH2SG; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="HZXyUgE1";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="W5rqH2SG"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 669BNTsG1575699
	for <arm-scmi@vger.kernel.org>; Thu, 9 Jul 2026 13:22:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	kZ+qHHzBylMVPbNyXJjbWGadj0AyzM1uOWGl2xsnB+8=; b=HZXyUgE1qC2tTxRp
	aKFjpzhADqnvoEYITa97oc8yIkKnR+u1JIv4X7kGA/xylW8TlrprK1/2n8gdizjn
	SqH6jPS1A9ReZFi16fvqt33+8ne6u2f/p2fdCB2rCf69CfO4WPiN4AFhWCw4SMEy
	cJsCeKJSH821riMGaTH/p4VLM5HXOpFQ+eVb/sjejyChlxAvmpk4sdu12Vcc6dvF
	gFvgbcnYNwDO6PfzaVWqKHj723a2NHziHTrsWt4uyDE20o2iHI2zRSAgeKtsWPNa
	kcQpyQq1kwEn2+gkIMVOtBitJZjAkvamN9Jg/p3DsQwSblzKleKve345xTfFeE2B
	2sGVjA==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f9sqwcd3a-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <arm-scmi@vger.kernel.org>; Thu, 09 Jul 2026 13:22:32 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-51bff5c7035so16639871cf.2
        for <arm-scmi@vger.kernel.org>; Thu, 09 Jul 2026 06:22:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783603352; x=1784208152; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:subject:from:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=kZ+qHHzBylMVPbNyXJjbWGadj0AyzM1uOWGl2xsnB+8=;
        b=W5rqH2SG00y0TOBcJ/Zhs2706hRXQxlUk3aZdiTs8r52cW77KjojCAApJUPv9PvtZK
         f6C5KZA02QDQ4PSXbebsnIev8n25apKWn+XGPmsSPMwyr19dw2iDoxANn9ofqM2nszT4
         MKJ2c7ekOFUrSXgVLugnaDbahR/zH6GATnQZzRv6Z9+2EsaFkxn0jOCZJ2o3lX29CIMP
         zTYvb6AbCNRsmmVtCdyO6fapIdcj++KXXRtg16st9gZqpvN+BJQcOlgAYNag8m/ME3CI
         M+0O2M0ZDK7t7oXnnWHC0juxfZkweQYA60R5IAjRtNVoswnk3LzGw5m9ciDGqyYKz9H6
         iP5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783603352; x=1784208152;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:subject:from:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kZ+qHHzBylMVPbNyXJjbWGadj0AyzM1uOWGl2xsnB+8=;
        b=AOBNblX8jifgjVdUNQTPtQX4LT4VNonZ2SJC4xwek5rfB8keU7b5qmm8uEZh+WwnoV
         0MoqSXcIuk1mvgD1zHdDDsxwXbslsG+Bar07TsYNGSnVHENYFSh1YhjKkFdm8tRFtf8c
         XRKZwNrQWtkLcbFQPZV0iLu09/NeUGb75g9BG4YnETt1MjxMK0Kd3v80OG63f5+iJeul
         ZSK4R08Qw/ZfrT7UY/YE2hN4p/WniTRS7JkCE15Th0za/VPM6p4IbIZ6ykhAMOqoBN7l
         Kbaf29UZq+q62qvHtGTDjF91fpVmaNTQiS+H258ZCOrmMQ+DncsKvd0dDpZkVIU4M/ql
         ROag==
X-Forwarded-Encrypted: i=1; AHgh+Rq7YJE4a+a38YaJq5rdg4UCcYEpY54AH2U0FGn3dpSngPHX3h1D6ppD+mnPG0sxNHFmaFqY51cWzg==@vger.kernel.org
X-Gm-Message-State: AOJu0YwOTzBgGMKnUcq41cwOFtpiW5k7WRvEj2fimPVlchr+biscus/0
	+lUvik6pSqOdP5y7KmqhQpUf2E+iHX+ed3C5gwgOtPcTStbgWgUPM7BWrdeA3+okl/dQo1wZIKs
	ihkIq0aPkvEoyWiuc/QLzXuHNJmRTLIIWfPxugBLBDBiz94Y1e304xJNmcUon1g==
X-Gm-Gg: AfdE7cleUYBcAx2C8JEOwojrST9R690mTGkQIl9XAmsQSa1Hg9OhX6WzQMhVFr6OM4Z
	Uo2ReWJ755mnIbzC//wvPMmiH0etGofr1q3Q7yleGg+geZs6kkH4LGSzZpsTFN258DbdU6mX7dY
	Jagh9eBOhg6F1LDhbueugmbhoBeKkmBo7wCiu1MzTsB3GevlkWKWAJf+C/e/AnMqDwsAviFpkUL
	adIWWjKGBZZNm2lEHUA+9vbZG2D9jZuCkWjc67TYP433F7rQpH9gmO3eA+FSu3Ba5uXkyMAZKAp
	fBAf+qGbOTZ7QHFQchy7MEK/i5SC1vtNAjbEYiVkFiWmd4tUBKIVgoSVyRGTBFZgQMEv9UfKgi+
	oIgmbHADHNlu0bEeHn0dkPZXAcMv4vR07NUV//vTxZOTuLpdr65MCPmGRG3iv9iCiHfXnhvJgjm
	33t69E528GVrqjYjcqcPuw1DZ1mTopGXnbliQ1hTjU2ZVa7irQ2ced8SMHFG7HGIxiwQRP/mPPj
	EZs5g==
X-Received: by 2002:a05:622a:a887:b0:51a:8c86:bd48 with SMTP id d75a77b69052e-51c8b40894emr78889651cf.69.1783603351898;
        Thu, 09 Jul 2026 06:22:31 -0700 (PDT)
X-Received: by 2002:a05:622a:a887:b0:51a:8c86:bd48 with SMTP id d75a77b69052e-51c8b40894emr78888871cf.69.1783603351343;
        Thu, 09 Jul 2026 06:22:31 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c15bb51af39sm388139066b.29.2026.07.09.06.22.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 09 Jul 2026 06:22:30 -0700 (PDT)
Message-ID: <dae4deba-7e5f-434e-80ae-89033bdeb793@oss.qualcomm.com>
Date: Thu, 9 Jul 2026 15:22:29 +0200
Precedence: bulk
X-Mailing-List: arm-scmi@vger.kernel.org
List-Id: <arm-scmi.vger.kernel.org>
List-Subscribe: <mailto:arm-scmi+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:arm-scmi+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Hans de Goede <johannes.goede@oss.qualcomm.com>
Subject: Re: [PATCH v2 0/2] firmware: arm_scmi: Ensure automatic module
 loading
To: Sudeep Holla <sudeep.holla@kernel.org>
Cc: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>,
        Cristian Marussi <cristian.marussi@arm.com>,
        Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>, arm-scmi@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-kbuild@vger.kernel.org, Stephen Boyd <sboyd@kernel.org>,
        Brian Masney <bmasney@redhat.com>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Viresh Kumar <viresh.kumar@linaro.org>, Frank Li <Frank.Li@nxp.com>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>, Guenter Roeck <linux@roeck-us.net>,
        Jyoti Bhayana <jbhayana@google.com>,
        Jonathan Cameron <jic23@kernel.org>,
        David Lechner <dlechner@baylibre.com>,
        =?UTF-8?Q?Nuno_S=C3=A1?=
 <nuno.sa@analog.com>,
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
References: <20260618-scmi-modalias-v2-0-8c7547c1be21@oss.qualcomm.com>
 <8c2a4ae3-95cc-489a-a7a4-90a3ee2597e9@oss.qualcomm.com>
 <20260709-spicy-fiery-squid-6eec1d@sudeepholla>
Content-Language: en-US, nl
In-Reply-To: <20260709-spicy-fiery-squid-6eec1d@sudeepholla>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA5MDEzMCBTYWx0ZWRfX0DnT3WIqNB5C
 D62nsVxXURvF8km6HVZb5F/FGUqIlwRpllc7Pe/yU4tacWh2v8nFp/YacSa8wAFQKX7IT0F4j8u
 soAjVSI8xoMYB5JwdEbI9z7BQiYynV6KSPK8f9QuU8Ez7uWqrWkWwIiUCQz5W9fcuXXNy3++dKD
 AXTpyWylUF/KcajDNIcvwqrf5MKTfPuXSuQUhejLxRCpMD3La8MjXIot8+dn7pceeCUVtEltIuG
 N/4Ui76jZKtVB6cgRUxHSoCkxzoj8OBkU3noWY8INbLfnr40XaU6ZAcuos/X3fs8+oedxZDW6+i
 waJwG3dKrXsexvfT96PovDn0Gu2FlQ56jsN3U6IKZZVpHSUL3jw5/+vCEEcWnz8gqo40u0BF4+P
 ch+0xjDGJA5zf2QWqn1Tlh9swBj7ymhnoziEcnfnPv5kcOIFkOwOFFK8XSNFmUPvyOgvq60dRbX
 h1L/RaUMhWhGdXd6Gmw==
X-Proofpoint-GUID: 9EDn3NqEiNH20zmPYKo77Qoplo9FhA9p
X-Authority-Analysis: v=2.4 cv=fMIJG5ae c=1 sm=1 tr=0 ts=6a4fa098 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8
 a=fQniT2RDnAzmI7G1ES4A:9 a=QEXdDO2ut3YA:10 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-ORIG-GUID: 9EDn3NqEiNH20zmPYKo77Qoplo9FhA9p
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA5MDEzMCBTYWx0ZWRfX44KTP11yduWw
 uXB4gxuGZWe5bILbrvlTpLtqjN11H4yx+p84CfofGbxfxM5qHdWkWcWH+qvI/UwsDhdZxKCW4T9
 AVbo4HhV2P+hpwRQ0BLzIYMXWyof5fw=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-09_02,2026-07-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 bulkscore=0 phishscore=0 clxscore=1015 impostorscore=0
 spamscore=0 priorityscore=1501 malwarescore=0 lowpriorityscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607090130

Hi,

On 9-Jul-26 12:10, Sudeep Holla wrote:
> On Thu, Jun 18, 2026 at 10:31:12PM +0200, Hans de Goede wrote:
>> Hi,
>>
>> On 18-Jun-26 17:56, Bjorn Andersson wrote:
>>> SCMI drivers such as the Arm SCMI CPUfreq driver are allowed to built as
>>> modules, but they are then not automatically loaded. Rework the SCMI
>>> device table alias support to make modpost consume the information from
>>> MODULE_DEVICE_TABLE(scmi, ...) and allow drivers to be loaded based on
>>> this information, if known. Also add a protocol-based alias to also
>>> trigger driver loading when only the SCMI protocol id is known.
>>>
>>> Signed-off-by: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
>>
>> So I just gave this a test spin and unfortunately it does not work.
>>
>> The problem with Fedora's kernel-config / setup is that the
>> request_module() from patch 2/2 runs from the initramfs, but
>> the scmi_cpufreq module is only available in the rootfs.
>>
>> It does work if I explictly add the scmi_cpufreq module to
>> the initramfs, then it does get autoloaded.
>>
>> We really need some place to put a uevent sysfs attr which then
>> gets replayed when udev is restarted from the rootfs and then
>> re-reads all the uevent files as part of its coldplug
>> enumeration.
>>
> 
> I don't have much knowledge on uevent to provide any suggestions/help.
> But isn't this a generic requirement ? I mean you could have modules
> install on the rootfs and not all of them are packed in initramfs ?
> Just wondering if that works for other modules, we can examine how
> do they work and what are we missing ?

scmi is special because the actual devices under /sys/bus/scmi/devices
only get created when the module with the driver is loaded because
of some funtion/id mapping requiring info from the driver.

Patch 2/2 tries to work around this by loading all scmi drivers matching
the scmi protocol which is known at bus enumeration time, but this only
works if the actual scmi driver is in the initramfs because this done
through directly calling modprobe() from the kernel which does not
get "replayed" when switching to the real rootfs.

And no /sys/bus/scmi/devices/xxx device means no
/sys/bus/scmi/devices/xxx/modalias nor /sys/bus/scmi/devices/xxx/uevent
which udev uses for coldplug (hotplug event replay) when switching to
the real root.

The cleanest way to fix this from a how things are supposed to work
according to the generic kernel device-model design is to get rid of
the creation of the devices being delayed. Which may mean moving some
static mapping tables from the driver into the scmi core. I'm not
familiar enough with the scmi bus code to be sure.

Regards,

Hans


> 



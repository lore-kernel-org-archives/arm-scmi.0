Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4052336F901
	for <arm-scmi@vger.kernel.org>; Fri, 18 Sep 2026 14:09:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789740583; cv=none; b=O8rmFL7GK0hYzI+Y7XrVhVnI0cp0XhG6Y1RB33rX9BUMl/F7siu335xJdlQYwg4Zz6Vq09i2W4H49Ajnz9fMro9JArTa6fUVjQuRcrW1YzkF6PhInJfFLPYqMHuN9jlmVKf966Sxpr/OPLjZXeBB1Cnc7gX+qvgT1bjdtunuzww=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789740583; c=relaxed/simple;
	bh=cnZiEV9qRv1m/yHobliIfyHOjF7ER5ZdH2Zqgn45D0E=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=Yyb59a6ElgjL9ohKHDPobbAyghYOA0qF0CAacFUzWnvOQClLFZnJRMIY6GgYwXBJK4psL1Cu26oSj4qjIO0khblTbeLPtOmlrQ3zmJL/IQf9dFPc2aJ8LC78cP7Z5nTqUvyQoUNC1OFXruA7f4aeVVelMUhl1Qc8/wlzQkpw1c4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=k2LhjmS5; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=VWDvjZDd; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="k2LhjmS5";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="VWDvjZDd"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68IDOUtW215576
	for <arm-scmi@vger.kernel.org>; Fri, 18 Sep 2026 14:09:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	4SEZETyE0PARh6/jC3pFbG8uSXzUDG4JFO/9Ng3zjDc=; b=k2LhjmS5ACIvI3NX
	unsTFOy+rADBx+5G3nXHA0JV0jlaGnpZWpyp9ueVVrR94fWvvh550HL57gV+PIzW
	9jn+4LTQyoqQ7+v9sYn99cdpqsD6x40N6ccYcxvGX8kEHQ0RhaIYdgUpqWEhyY+d
	0hD0E52MCW3XfUrrSHMujLsnI1+qEs4XnQtXD/V7BKsWd+MqH19iAOiQzx1VFWzd
	ubVnbwrCmRJmbYPuxGgopGA7kn1SYxBefIOIn9Gc8r5XoKDY9VqKGFAeX0dZQfNK
	UzTWUpJqYW602hTtFERrNhlz1HcZxhgEv86Gt8Y6Bwa63x2cx70qmRqZGWsApQdS
	XUuqEg==
Received: from mail-vs1-f69.google.com (mail-vs1-f69.google.com [209.85.217.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4grrjdugr4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <arm-scmi@vger.kernel.org>; Fri, 18 Sep 2026 14:09:40 +0000 (GMT)
Received: by mail-vs1-f69.google.com with SMTP id ada2fe7eead31-79285c98038so733606137.1
        for <arm-scmi@vger.kernel.org>; Fri, 18 Sep 2026 07:09:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789740579; x=1790345379; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:subject:from:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=4SEZETyE0PARh6/jC3pFbG8uSXzUDG4JFO/9Ng3zjDc=;
        b=VWDvjZDdiVxeH5AoMPRXqH8ocgGq5Rv9tsFHMpWTNgbeyMvjDr2/Ary77UVWUO3iDy
         XI7W+us3o32Z6o0q0V+RMQbtX6JXQTV8idXxfuGAEgC+szBTw9iNMuLdxqf52TrxPO+k
         mBCPq+2SsNVHKZdMDCfRgUb3/mYQhUbLJaYbn9fAK+4PGTUcNDGaHxxTr5RUdP2f7oFf
         ugphDhB97s3HfmzOVHSAtZkCfh+P1lTGza0O2FOTTXJkzNyrUFgs+S2lqciSfk4ofeth
         l5rndUsLcu3kinMR+9ViWRlBtk7aP14AvoOgcuSTzIlXlW4MkiK6CLbxy+VrRFapEFI5
         fsbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789740579; x=1790345379;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:subject:from:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4SEZETyE0PARh6/jC3pFbG8uSXzUDG4JFO/9Ng3zjDc=;
        b=Z00ymMXmtbjdP/X/jUB+osau4mCSwi3IvYX5hdsV3Iap/UJPHF5zep4EC7/3IzvLxs
         j7SlxXtH5BJ6Ah8bgb4hHHJ/U0IRs1Y1vUndcdG/ldemtAE17aHqfApfGAgq0zLQoXHX
         dvpRH8FnjOaJzn90GUaXvbQLfuSAyQPyzubxbh78JS8g+yvrkmMDG1mxGV2gB4vssctp
         jik0L8340Xv+pkzXIvYL/uYxfP0b/URb/Fwhlb0LxxB/61JifvKSzkGqXDriBUSz874Q
         gT2l0Q2cgq055pjlZc1S38s6rsbTFZgEHVhEu1hQQsmTivwCcaeSzlEWWsxZQnJa1M0C
         qkOg==
X-Forwarded-Encrypted: i=1; AKwUvBzXeJxgOq+GeUGaZeSzE4HxIl71rpwWmK7QHlONg+9Ye1mg/SlQGRGAvwQKDOOHQV9KusrLuwRyJw==@vger.kernel.org
X-Gm-Message-State: AFuF++k7B6ifPSfhPs3jM2Qz6xLDf5j2FFejcGehCswnReVWnvyd8uEi
	ECSRAZ0B5XRTvzbW3m9RAVJk5gRa+VvtvIo9wT1rwcTRWtwOjroEHT3ObnJKU1vpWwHT6TX3rkS
	oqQcr88A87b+82bcETAsUtaiJfZy/u+5nsuvI3mv71wb02PCspX4wr1KIr+TGBw==
X-Gm-Gg: AYBFou3xnFLqPCAO/IIVpUQvqNcTQK+M1GQXYtDnfHfcNdui5KOBWKTROn8/WEMnE0K
	RjWpQotgAErCT2hGfNsGC29sxbPIe7SHqr4TFghY5TOIi44Xe7SwOcdHE1HP29U4jcFARuPOa6k
	JkpmUzVvY04x7VfLXxEoYn5JQJ+Zl2qqJ8/9MCudKel+iB98Ksp0ctHVyroFwhnm9P3XhIznuSO
	HsgahchWZU2CHCjEIJg1SoBiI1IdOTUkx7FasNSnLq5gM2IT6RK65iBWlC6ZTVss6VoqdSVrThu
	UAyJ1LturVoEjEZfUH5PizubDw0QxDZrPOMWPJ0z11d4Cl4sKiBsDOlyNJ+AT3F8Qt8eEcvUSGm
	OvJqy4YikF1SCglk6LT8StxyUztyELUxVuavkbIFaPUAP5M1R8daXmQYu2xp84cTH/Bm5gaE/UJ
	rz1bOPiH6A9I4PROcTGG/gy+lyU4t/R7yGK6M25i2O6Q+LGEfL8qmq2FBU9/9/c7JfyA==
X-Received: by 2002:a05:6102:578e:b0:7a2:2a6d:2d7e with SMTP id ada2fe7eead31-7a55b1407dcmr1308030137.8.1789740579198;
        Fri, 18 Sep 2026 07:09:39 -0700 (PDT)
X-Received: by 2002:a05:6102:578e:b0:7a2:2a6d:2d7e with SMTP id ada2fe7eead31-7a55b1407dcmr1307923137.8.1789740578364;
        Fri, 18 Sep 2026 07:09:38 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2a1b7a3a06sm58558766b.2.2026.09.18.07.09.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 18 Sep 2026 07:09:37 -0700 (PDT)
Message-ID: <dca62a09-2af7-463e-9ba0-1be935a95502@oss.qualcomm.com>
Date: Fri, 18 Sep 2026 16:09:36 +0200
Precedence: bulk
X-Mailing-List: arm-scmi@vger.kernel.org
List-Id: <arm-scmi.vger.kernel.org>
List-Subscribe: <mailto:arm-scmi+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:arm-scmi+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Hans de Goede <johannes.goede@oss.qualcomm.com>
Subject: Re: [PATCH v7 1/2] module: add SCMI device table alias support
To: Sudeep Holla <sudeep.holla@kernel.org>,
        =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Cristian Marussi <cristian.marussi@arm.com>,
        Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>,
        Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>,
        Frank.Li@kernel.org, arm-scmi@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        imx@lists.linux.dev, linux-kernel@vger.kernel.org
References: <20260918092951.5656-1-johannes.goede@oss.qualcomm.com>
 <20260918092951.5656-2-johannes.goede@oss.qualcomm.com>
 <20260918-impetuous-daring-barnacle-1ea4d0@sudeepholla>
Content-Language: en-US, nl
In-Reply-To: <20260918-impetuous-daring-barnacle-1ea4d0@sudeepholla>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE4MDIwMSBTYWx0ZWRfX6/V43UfH1Un8
 nxJ4VeME1mgJsIu7koEVT/vZZCj8miDvPMmI4I4oEENwNC0L6ac9JGZRhbv2JlXaCqyLT1fPrXN
 H+WzK3FZoMHknZ7f9TcpZso0VAwNp8vafnRYBbvwMVGW98NwjY3HzecTcgHZSvXhZPVek+TyME0
 2AO3IUnfP7HJ1bohpt1wrU0lpVXWaiTMAEkmVlTypOLecRJPWrFXn82gKvgSxR6o1+jcY3Qy6Nb
 FZkh7eIjRQbGV9W67nJba70/psCOIl/gTWrouDLcUJMAgswQJrQVqRnxj1+XsX3nlN/jPhTvtpy
 KOM8M/jADXXLFP0eOwNEgIrkV53GMyLl1PkQOgLZ+H28bph0TAeCOCiIa2xbwvcf0IVYp9FVRZ8
 MBz9YC+D4u7Ob8XbO0f50Pz44oSVnVFhEstFCQEWXmxB5Xky1OPH+ws7cE9YWDa8sJONn87VW/N
 NyPFsYijlaRoQ28V07g==
X-Proofpoint-ORIG-GUID: yfOb2WhWES0b9lkb8HOOo_BI7gwh8Tgv
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE4MDIwMSBTYWx0ZWRfXxHJTaGuA8xiE
 TjRUFwDpLS70s0+xmbOlq1p4rJIkuSLb5KML/Vo66ep+xudPz7MZTGE0NLfbIpKvJJxIRWnNBeF
 12xYyxWVCAnd50oIgL1fzoBXBzQVP0o=
X-Authority-Analysis: v=2.4 cv=J9Q/fwnS c=1 sm=1 tr=0 ts=6aad4624 cx=c_pps
 a=5HAIKLe1ejAbszaTRHs9Ug==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=VwQbUJbxAAAA:8
 a=vTr9H3xdAAAA:8 a=2jV7UpksSA8eYliVEwMA:9 a=QEXdDO2ut3YA:10
 a=gYDTvv6II1OnSo0itH1n:22
X-Proofpoint-GUID: yfOb2WhWES0b9lkb8HOOo_BI7gwh8Tgv
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-18_04,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 impostorscore=0 clxscore=1015 suspectscore=0
 phishscore=0 priorityscore=1501 bulkscore=0 malwarescore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609180201

Hi Sudeep,

On 18-Sep-26 15:32, Sudeep Holla wrote:

[...]

>> diff --git a/include/linux/device-id/scmi.h b/include/linux/device-id/scmi.h
>> new file mode 100644
>> index 000000000000..1b4ccfa9dcc5
>> --- /dev/null
>> +++ b/include/linux/device-id/scmi.h
>> @@ -0,0 +1,17 @@
>> +/* SPDX-License-Identifier: GPL-2.0-only */
>> +#ifndef LINUX_DEVICE_ID_SCMI_H
>> +#define LINUX_DEVICE_ID_SCMI_H
>> +
>> +#ifdef __KERNEL__
>> +#include <linux/types.h>
>> +#endif
>> +
>> +#define SCMI_NAME_SIZE		32
>> +#define SCMI_MODULE_PREFIX	"scmi:"
>> +
>> +struct scmi_device_id {
>> +	__u8 protocol_id;
>> +	char name[SCMI_NAME_SIZE];
>> +};
>> +
>> +#endif /* ifndef LINUX_DEVICE_ID_SCMI_H */
> 
> You need to include this above file in include/linux/mod_devicetable.h
> to avoid duplication of its inclusion elsewhere. That's the pattern followed
> I see.

That is what I did for v3, but Uwe, who is leading the splitting
of mod_devicetable.h from one large monster include to smaller
per subsystem/bus includes explicitly requested me to follow this
pattern, see:

https://lore.kernel.org/arm-scmi/aow2GFAfy84k-N2B@monoceros/

[...]

>> diff --git a/scripts/mod/devicetable-offsets.c b/scripts/mod/devicetable-offsets.c
>> index b4178c42d08f..91ec3704ee2b 100644
>> --- a/scripts/mod/devicetable-offsets.c
>> +++ b/scripts/mod/devicetable-offsets.c
>> @@ -1,5 +1,6 @@
>>  // SPDX-License-Identifier: GPL-2.0
>>  #define COMPILE_OFFSETS
>> +#include <linux/device-id/scmi.h>
> 
> Drop this for above mentioned reason.

This was explictly added at request of Uwe because the goal is to
get rid of mod_devicetable.h including all the device-id headers
in a big single catch-all include. This is done because currently
many files include mod_devicetable.h and then if any of the device-id
headers changes everything needs to be rebuild, making incremental
kernel builds much slower.

(and the same for the second include you point out)

Also replying to your other question here:

> Not related to above topic, but just wanted to check with Daniel if this
> solves module auto-loading for you. Was there someone else who was testing
> this series and was having issue with earlier versions or its you only
> Hans de Goede and it was with v1/v2 when Bjorn posted them. I remember
> something vaguely and couldn't trace back all the versions easily.

I tested Bjorn's original patch-series but since that makes the kernel
call modprobe it does not work when the scmi bus is enumerated during
the initramfs phase and the modules are only part of the rootfs.

So I've replaced this with a rewrite of Christian's approach to always
instantiate standard protocol devices. The rewrite was done because
of various lifetime management issues with Cristian's original approach
found by Shashiko.

Note that Bjorn's modprobe approach also only used the protocol id
as modalias, which means that if a vendor protocol id of say 0x80
were used and we have multiple vendor protocol drivers in kernel
which share 0x80 as id, modules from both vendors would get loaded.
This is something which I did not realize at the time, but this is
another good reason to go with the new approach from this version
of the series.

As for testing, I was the main reporter of this issue since I'm
trying to get Qualcomm Snapdragon laptops to work OOTB with standard
unmodified Fedora aarch64 live/installer media and scmi_cpufreq
needs a workaround to be manually loaded there, see:

https://fedoraproject.org/wiki/Snapdragon_WoA_Laptop_Install_(Fedora_Beta)

As you can see only a few workarounds are still necessary and
manual SCMI auto-loading is one of them. So I really hope that we
can get this series merged in time for 7.4 .

Regards,

Hans




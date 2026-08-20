Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 624F42C2349
	for <arm-scmi@vger.kernel.org>; Thu, 20 Aug 2026 14:50:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787237429; cv=none; b=RFGRomMyEG8Rdlv90qSWiaoLaPQcJdDx4syxeFvpk2+jLEFxWIa4AeWsmE4VgJ0CVUch+Iu8UrEuoteP9UuyfEqKfX+XyCtRBkjYx0HYMIOx1mT0yBt1LYwk4j1kCTq9AcaWKDHtchrR6DIoj4GrNLyHWKKx83xZ476pea41RKA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787237429; c=relaxed/simple;
	bh=4ulBlY2lsntxBGOupswQPoz8eNgqdCpcc9JMuuvIy/E=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=I/Znpl/y1VLUIzUUIJweLMmgX/z5BQUeQZbTU+gMcWNCzbrhGxIiQWXT6nwyhW2n5kGnMMSCHUSzt6K/pZXo9BSLFmAFGALwJtq2naYka9Jur79wsjnJnSYTFncSxE8lLKpp7t576C18qdH9swGOYlMYEb7o3QNk3cTHmcYGX34=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=T7nk6IPO; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Fosywj0K; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="T7nk6IPO";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Fosywj0K"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67KE7ZIm506093
	for <arm-scmi@vger.kernel.org>; Thu, 20 Aug 2026 14:50:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	5bJlYs2gsqYtvUByDGvMly/6TqEG9Rhh9y6e7cl/9vo=; b=T7nk6IPO4zim5nui
	arW7BpDjS0j1LjMTzCTPfKitekoqK/6WzAMjzOoTbn0u/u51x7+UT5czOez7NKvO
	1mhOxJh54S+iHuCHrgeED0KsF/GhKRjo2gS5jKYoazn2xd8wX0RGEG8sxcWnTvZ8
	eN6WyBX3cZHhZjkROCFUqHgsNW3KYp6S8vi9J3O3Xh7l63gDpg5iJeNKtg/di+1z
	MkEs22Yapk41ny5xJnZ3WrsDZvS0X0gESxQnHZLuBpNNer+TFiJlGBinDek0zPCp
	95vapcB6ppWTxWbGGTsVETljeyk+BvkJ6e7ouTk8ET264s86E1EeyW5kSJtOryos
	/UeRow==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g5vn89x6g-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <arm-scmi@vger.kernel.org>; Thu, 20 Aug 2026 14:50:27 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-934956beec8so410651585a.0
        for <arm-scmi@vger.kernel.org>; Thu, 20 Aug 2026 07:50:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787237426; x=1787842226; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=5bJlYs2gsqYtvUByDGvMly/6TqEG9Rhh9y6e7cl/9vo=;
        b=Fosywj0KNGmlE7a94A1YrJNgSQ4BiCX+NiglQjyY6pKdeHxT/QrothBLf9IVLW3J82
         a5kNL9dyJDnts9HYdIuv+yXIRPj1p85GxrFEahvrXnt+NjDvaoTDxeBpChEziCkWCmmV
         NQieXFWo/BmmpaXufTVfTJpPbmZMQwJLnqHrU9kRohNZgNC9eHS7s7E8fzwQN61/gCMu
         +oZr3BBZ0Z0QPwatyAvn/mETPC24aGGHC7bKKiFFvcxW9GKDccaep9kJy/gZ7GSNGoJL
         v+W+yYFtKsfXvv30Obarme49HxaCQLpSrwuNx3HRhMlMdjsAb3ATeXqk6pt02P6SA5Zq
         UolQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787237426; x=1787842226;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5bJlYs2gsqYtvUByDGvMly/6TqEG9Rhh9y6e7cl/9vo=;
        b=pl/20Qg9TDD/ne8o809KmTIg3fX/5OArt0vJJzI691WA2zhbxOIX7jXmxfyB95IKSv
         HI5639UsEZw+ql6k2oJLY7IU91S3DN1WvG0qZF6fT998dKojimoHG7/qblVCCBRol15X
         BzcisEmhGx6LCH425Y+4oLdnUfkqf2IVAJp31viuhUgeUHlDYtRvLYLppGvRA10Jo3IV
         BGBt67Nb5wICE5FjjA2t1rMKVbFf0eT6aYnccDvWnNkltHDk1OKd9gUiVu9LoXUSEFt1
         6Ou9ONT0tvuVY3IHeR6iWquyugQit0L2vi+mU0WF5sda4QwBz9Ox1CF6eoTa2KfQNIFc
         OmPw==
X-Gm-Message-State: AOJu0YzVx1KImNzZIWOqgy/S0eZt9hCCKULGKbj9xquuW7NtkWWr1Nyq
	vbhidNuveTsT3K2FznaeA0Xu4lHcpeKUwCGUZlS+92kYyMt9KNR/55Zv55Sj5D8tLkL+6YZH4kd
	yQqEWQdhcg9tlr6d5+PYChhBabb3Ay+Kmgh4pFPXGfrPDjvVyGOTHHFGyaMlSctNwqnatuQ==
X-Gm-Gg: AR+sD10+BgzGbZhhiWg+wdsWkk5/2lLOtzQk0ymSDL7IH6uc5WUtklZPF2UQrl4qVIA
	hcClPuvwjyS9R6FlIG3KsPX0oc1RDo27CoDACouoIPDBgTM2mSlP+AbgKUslD7DcleO67kKGvs9
	af6K7a/RaNToylxLZU6UOgTB8BvgrCPdHxxlcn58WQsEUddFMpUrRg9JQu0HLoIKotVEV78UtEs
	zqeHJOgN6Smae7iP6pj1j5taxp89h/hEbsAciFYdzMrywWioyM1OO7riXVnK0/l6gmRWGfdCO/v
	PwuUFasCsFKmjlZMmpg6u9v5bTmNdSPm+LIpIerVEjbX3EceQgTyhZlDNbngmshqeAag36Ukwfg
	zIIcBw4WemWiPvFqX/sulcaZ0/0IrXO5oY5Cqcq+0sfAtLAJIgrgrNamSa6DmYEeSuMt1tfaj0Z
	oT5o7h5bKHXFqidbk2XLqUPf3TAL2cyrHXaIvd4nYLheWf7KlpD6pAlfpO1beDy5PUj2o=
X-Received: by 2002:a05:620a:4728:b0:936:48f2:b04f with SMTP id af79cd13be357-9371e31e381mr1251881985a.6.1787237426493;
        Thu, 20 Aug 2026 07:50:26 -0700 (PDT)
X-Received: by 2002:a05:620a:4728:b0:936:48f2:b04f with SMTP id af79cd13be357-9371e31e381mr1251865985a.6.1787237425248;
        Thu, 20 Aug 2026 07:50:25 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2458b094c4sm90018966b.22.2026.08.20.07.50.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 20 Aug 2026 07:50:24 -0700 (PDT)
Message-ID: <09a17e4f-99cf-406c-9cf0-a237c9f0bb19@oss.qualcomm.com>
Date: Thu, 20 Aug 2026 16:50:22 +0200
Precedence: bulk
X-Mailing-List: arm-scmi@vger.kernel.org
List-Id: <arm-scmi.vger.kernel.org>
List-Subscribe: <mailto:arm-scmi+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:arm-scmi+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 2/2] firmware: arm_scmi: Add bus support for
 autoloading
To: Sudeep Holla <sudeep.holla@kernel.org>,
        Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>,
        Cristian Marussi <cristian.marussi@arm.com>,
        Bjorn Andersson <andersson@kernel.org>
Cc: arm-scmi@vger.kernel.org, guomin_chen@sina.com,
        linux-arm-kernel@lists.infradead.org, peng.fan@nxp.com,
        quic_xinqzhan@quicinc.com
References: <Z6CNWOp8B_ghIrJt@pluto>
 <20250203100154.140877-1-cristian.marussi@arm.com>
 <20250203100154.140877-2-cristian.marussi@arm.com>
 <aibW10NMmzw3QnZ5@mai.linaro.org> <aibzLcZiVwtUHAgV@pluto>
 <20260609-upbeat-bullfrog-of-enrichment-0f44aa@sudeepholla>
 <282af085-1669-4d9d-9c1d-2fc232252be0@oss.qualcomm.com>
 <20260729-optimistic-lemon-myna-a14bbf@sudeepholla>
From: Hans de Goede <johannes.goede@oss.qualcomm.com>
Content-Language: en-US, nl
In-Reply-To: <20260729-optimistic-lemon-myna-a14bbf@sudeepholla>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODIwMDExMSBTYWx0ZWRfXxor0gcF+L3Sc
 xxtPhOqMTwuqlnoxzjsQE0eSD/iLIRc7NRFDQoNhMhIZaQg5mQhAxdu7dWRou4Co9TSdYpYtS9O
 uXk1dEbOfWANh6w7Fjm8obrtvpJMCBHSvlUbepCjdEG84FNuEqNvJ/xUD0nbDiREBaCEqz31gLb
 GbY1ZC5iTXMIxWsg1129O5e/MtS94RFlcnQ6cXZJLWWjkMc3MYaZedzXuVYGIFGOgQA0uZg7Pyy
 uOYujj7A2F3MveXvY9PZKglCLodQ2y2zCknm9xLtWtZyJ9/Hvo8/G0R+05wFzy/YwbT1eY3U4Vu
 v4nwVxZLqGAh9eIw5pdwf8MUt050gUZ5i6V5yoKoNuCAc+X8l4nPXjgnVVOKEFN/1LHW0wVpH4S
 VSwv+d42WDB8In89EeRGQMy6DAmQHgulzu8XmS22eFsjK+nP835LLt7tIMXMMqui1K4sqqIBDTC
 AqOkFraCiv40bw7V4nw==
X-Authority-Analysis: v=2.4 cv=KpJ9H2WN c=1 sm=1 tr=0 ts=6a871433 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=Pb2rOm9Yw1pd37dnyEcA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwODIwMDExMSBTYWx0ZWRfX4qp4XT70rwzb
 /J7oAHkY4HvKloajj9Ve0nFgEVhiRO8ljfugGk6Q9dUVpuTgO/CTDAllMW3pqQFe6+7nL1qKcxI
 cdx7uFnKa49PtS/tSjCvNDgHkNaN5Zg=
X-Proofpoint-ORIG-GUID: P_rq3keyca2PtJiW3aQLFrM1qdySRAXa
X-Proofpoint-GUID: P_rq3keyca2PtJiW3aQLFrM1qdySRAXa
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-19_06,2026-08-20_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 adultscore=0 malwarescore=0 lowpriorityscore=0
 priorityscore=1501 impostorscore=0 bulkscore=0 suspectscore=0 clxscore=1011
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608200111

Hi All,

On 29-Jul-26 16:17, Sudeep Holla wrote:
> On Wed, Jul 29, 2026 at 04:11:18PM +0200, Daniel Lezcano wrote:
>>
>> Hi Cristian,
>>
>> On 6/9/26 11:01, Sudeep Holla wrote:
>>> On Mon, Jun 08, 2026 at 05:51:57PM +0100, Cristian Marussi wrote:
>>
>> [ ... ]
>>
>>>> Thoughts ? Plans ?

Given the internal discussion about this on Slack I decided to
look into fixing this and while reading the thread from [1]
found a pointer to this thread.

>>> Just repost as non-rfc after next merge window and we will see if there is
>>> much interest to get it merged for the following one and take it from there.
>>
>> Are you planning to resend the series ? I can test them on my laptop
>>
> 
> I thought [1] from Bjorn was addressing the same issue ?

Yes, but it does not solve the chicken and the egg problem we've wrt
module auto-loading. It tries to do so in patch 2/2 of the [1] series
but that relies on request_module() rather then a proper/normal
modalias uevent and that request_module() typically will happen
inside the initramfs and then fails if the needed module is not in
the initramfs.

Normal bus devices with a proper modalias uevent do not suffer from
this because there udev does the modprobe based on the uevent file
under the device's sysfs dir and it retries this after the switch
to the real rootfs.

The problem the current scmi code has is that it creates
devices under the SCMI bus based on protocol+name pairs in
the scmi_requested_devices list.

And that list is populated based on driver->id_table entries
from any loaded drivers. So for a device to get created
the module registering the driver with the matching
scmi_device_id-s needs to be loaded first.

And the way the device model + udev contract works is that
the module will be auto-loaded based on the modalias of
the created device.

So no module, no device on the scmi bus and no device no
module autoloading. Hence chicken and egg.

I believe that the first patch from Bjorn's series which
is similar but more complete then the first patch from
this (Cristian's) series + pre-populating
the scmi_requested_devices for Standard protocol devices
as Christian's second patch does should do the trick.

This break the chicken and egg problem for standard proto
devices. This means no auto-loading for modules for
custom protocols, there is no way to avoid this.

As an exception we could add any custom protocols for
which support is added to the mainline kernel to
the table used to pre-populate the scmi_requested_devices
list.

I'll go and prepare a new series consisting of Bjorn's 1/2
(unmodified) + Christian's 2/2 reduced to just pre-populating
the table and after testing that that does the trick I'll
post that as a v2 series obsoleting both existing series.

Regards,

Hans


[1] https://lore.kernel.org/all/20260618-scmi-modalias-v2-0-8c7547c1be21@oss.qualcomm.com

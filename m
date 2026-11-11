Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794357516;
	b=HoKdR9sdBpOkHpacl/NILHs7VwblE1lnVt1DeZK00rc9enSka5exCBgyPV+bPt2bp3v+
	 jVKE1jDDm0wDvirQPSZJfQyzj7JG87NUQ4S5HewkDpqPsOxa2M+uB873sVAiwYLVnB+yW
	 703vc/E+9ju1hWt8aarj5U7hi8CEHMIoH4f+of2HhVjJia5md3A59xUmFpxggUeY3y3dz
	 awGpwCHrefTM1ZAe7Y/odTZA68FkomEmRK3tzxoRVnEdzAWhGDKfVau/lFEy0OLi2WYe5
	 7xgdWQ/2Oj/i5XfgWRUXs5/W1l3ajXtdtcVPKLg2pbVSbzFNiDXQCsY9KyCgOedEL+w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794357516;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:In-Reply-To:References:Organization:X-Mailer:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=p7sT3iRRUxq4eJr8TTxsciCtoFllJMXAiuKtYZTtyv4=;
	b=wEDvJqUM93t5cSVru53Z5g6jUM4Q01seZcpewxFTUvew71T+XZuvUEOhFToV/xTuBkWL
	 Ay9WLdUmoA4oR9rmgSGcTHRZA3jGc5tLUIRMl0KH/EzaW0ZfNQQGisv4J9FvXl3dv3mro
	 qpX4S1dpMfqB2OJ8J3l8F5UT1igI39n5twvIMkL6hU5piOPKJJ7LW7M2+MKrE3IzlqbiG
	 yiqu1mx0Q+24Rwo1yMqw6buvIwBwZQbeOj3pp9U8aZJU5wctCLs55VuCHGr4rBYgftd56
	 KnnWzTacI887Ci0hA7WwuZAllHX+rwrA5TwpCOsO3mOxBgg3fRp0rvCvn4XG0PIryFA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=d+WhPqkk;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=DqHQhAp6;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C5B4606A31C
	for <arm-scmi@vger.kernel.org>; Wed, 11 Nov 2026 00:38:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3C5B4606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=d+WhPqkk;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=DqHQhAp6
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AB0LSkE407240
	for <arm-scmi@vger.kernel.org>; Wed, 11 Nov 2026 00:38:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	p7sT3iRRUxq4eJr8TTxsciCtoFllJMXAiuKtYZTtyv4=; b=d+WhPqkkWHezj4wX
	2kdBBiWrMpK1/053nQziauJcW2KmfS6U5FwfbZNNHWdl1hx+JRCCIdZpSckqruQf
	68yBu+FqiQjApvultKCAoDsutMAFpoOGgMWlHnDCkjCxuHU4zR0GTPwT//DHnHAg
	bBCrAlwwzqRtsh/+3dVE85fzZxKw5UcINxAbROB2+MZtemTP5rH5FH+JTfFaGTC6
	tnMpHn9SZBu90E5sVb65QqXACCl6P5nl4aMNyycWEQ2th0Uin6Y3pJrFGitUgTQi
	XWMUusSay7go5ZCCR+GGZEb/V9wxS9LpVtWFlXuvlB+iTS9favHA5t8ZkxGgqlVY
	gEklkw==
Received: from mail-dl1-f70.google.com (mail-dl1-f70.google.com [74.125.82.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hvdrh01t6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <arm-scmi@vger.kernel.org>; Wed, 11 Nov 2026 00:38:32 +0000 (GMT)
Received: by mail-dl1-f70.google.com with SMTP id a92af1059eb24-1383723dfddso3862052c88.0
        for <arm-scmi@vger.kernel.org>; Tue, 10 Nov 2026 16:38:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794357511; x=1794962311; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:organization
         :references:in-reply-to:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=p7sT3iRRUxq4eJr8TTxsciCtoFllJMXAiuKtYZTtyv4=;
        b=DqHQhAp6qgGrsyhPwVUaKwbB6ARGK7wgP/3K2ihCBOcVwkTmkicdQJz5wYdJZnfTsN
         1inGZU5Cssw8qyVndS2ifwKhHnCgvm64aBaDwjAIAplftdMrYr30jZAnLphgCMNKgGA7
         rA9y2NncLeYzhv2iZlfpn69HVVeN4iypiLnPTzKWz3pDgfyRnusLpvCW7lqConfa+Yer
         NbYNKAVp9lNmO8OFxGGeBXGRZ+ONSZepLONptmeR6o8R87sT8ZkQSRzZ3Im+mCCjLXu6
         pYEYJm0Ur0c/KB7HIf2rdyFv5GBQqeQswHztwg6yA2x953u92R8HXsiCnx+xfK86lxdJ
         Zu9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794357511; x=1794962311;
        h=content-transfer-encoding:content-type:mime-version:organization
         :references:in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=p7sT3iRRUxq4eJr8TTxsciCtoFllJMXAiuKtYZTtyv4=;
        b=nBSUHGyhKXrqbixuTPahtk30PRhgAGHN/MqWGqemrgcFzF0w5dt68EUGBcr7qcG6IY
         mFAbcNmYcs47mQyycDKy9A4CnuGcWiFV8ifCaXTOzLRwDFWe7MogYxkfMIvr8/rAwLqI
         qsvIpWUMS+43kvFPyxdmGZvdJPe35aCb7Bdp5490bKXwf/n54fDvfUuv+W76lceocGyh
         OPu+IHvZvZAcKlkIAORunaxS4vOwbj0P5NWX0XIrRmTRYx6uThHy2lK+JCHkXGpBDFgR
         731jKxWyBL53bdkeBYJoStXN+0zc1VquobmuZfYcJXSo5A0FpbX/o2yA+yYHRnVD9+fH
         c8pA==
X-Forwarded-Encrypted: i=1; AL+hErHp6+X/5zh8J+yF0flFJCXCfPX3id2GLBkTUC6bHGnKyXIVeCdequRBVdpx3ftblKpmYBlAmqLqUw==@vger.kernel.org
X-Gm-Message-State: APuU4Z9urtm31aHfpvZUXpD0LWuaqmHcY4XuEQxH3ihkwTnlXaTu/2GX
	VI5vXPle6S2UMGCVvOqg4Win37Iy4ou9lKsG9welDMPS7+kP/lLkyCe78nUO/UgAU24J1Fnwaij
	n55vwvuv60t3IKTIAfm0RnQUTuCR+v+19Yz/rh9IgzEmB8uOKVDsUGFNgDfW9yw==
X-Gm-Gg: AYBFou1DRvFo6FrGxm1GSYyjIulk6iSj8IiwD/Lmrldd+R0Beip032Aou6gSg8NmOgu
	483hBMrubjyDlPVLXFCdbZvfFsyYSMCQy5GShk9FGmDFIo7o07CFeiQYlhcWKwLo6mRR8rafl0C
	J0ZPGvQigLbIgzbvzn+4k75HQcxY4GM7aAGTJr2H5iJMcjRkT32UpTlK7TvBQ8Gxg0HYqEhCb1L
	cjdnBlQF+j1+Xt145tz7Q5qil5kIA53sATsB9Z6KfO8O1BiUMNkmBusmIyd/7cGOeRzz+7OMfUl
	AJiYqCbRdt8oi8Nxi+KkTMvtyZMSkZUBNyx3WPD05cpucYRGPq++vJg/65cFP8++JGs6+9DXD88
	BVQSL93thqJ3HHgFtXE7Z/TbFAV7mK8keXm4cYxXS/ktha4IXgpFVae1B0Q/RvOartkMeURc7Kx
	z0+6nRNY60otQKFO0ChIr3h00njqs=
X-Received: by 2002:a05:7022:170a:b0:189:d6bf:7eaa with SMTP id a92af1059eb24-1b3c02fd370mr642294c88.16.1794357510822;
        Tue, 10 Nov 2026 16:38:30 -0800 (PST)
X-Received: by 2002:a05:7022:170a:b0:189:d6bf:7eaa with SMTP id a92af1059eb24-1b3c02fd370mr642263c88.16.1794357510143;
        Tue, 10 Nov 2026 16:38:30 -0800 (PST)
Received: from localhost (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b3b5b2eeffsm10623417c88.9.2026.11.10.16.38.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 16:38:29 -0800 (PST)
Date: Tue, 10 Nov 2026 16:38:09 -0800
From: Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>
To: Cristian Marussi <cristian.marussi@arm.com>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        arm-scmi@vger.kernel.org, linux-doc@vger.kernel.org,
        sudeep.holla@kernel.org, james.quinlan@broadcom.com,
        f.fainelli@gmail.com, vincent.guittot@linaro.org,
        etienne.carriere@st.com, peng.fan@oss.nxp.com, michal.simek@amd.com,
        d-gole@ti.com, elif.topuz@arm.com, lukasz.luba@arm.com,
        philip.radford@arm.com, david@kernel.org, souvik.chakravarty@arm.com,
        leitao@kernel.org, kas@kernel.org, puranjay@kernel.org,
        usama.arif@linux.dev, kernel-team@meta.com
Subject: Re: [PATCH v15 00/35] Introduce SCMI Telemetry support
Message-ID: <20261110163809.000070d6@oss.qualcomm.com>
In-Reply-To: <20261109091221.2532706-1-cristian.marussi@arm.com>
References: <20261109091221.2532706-1-cristian.marussi@arm.com>
Organization: Qualcomm
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.51; x86_64-w64-mingw32)
X-Mailing-List: arm-scmi@vger.kernel.org
List-Id: <arm-scmi.vger.kernel.org>
List-Post: <mailto:arm-scmi@vger.kernel.org>
List-Help: <mailto:arm-scmi+help@vger.kernel.org>
List-Subscribe: <mailto:arm-scmi+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:arm-scmi+unsubscribe@vger.kernel.org>
List-Owner: <mailto:arm-scmi+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTExMDAwMSBTYWx0ZWRfX3AHc4WJELDAz
 9NdXwh6ooWgyPnkF9x52mjiAwxCD1Nz9qrAn2aBbze6cGlxUNCyxLOKtNhHk64mzYF19hShkcNS
 f3yi/dMiCFVqjkFHd7xioVnPc/0NYZc=
X-Authority-Analysis: v=2.4 cv=PoQG/AM3 c=1 sm=1 tr=0 ts=6af3b908 cx=c_pps
 a=SvEPeNj+VMjHSW//kvnxuw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=4wJChP4EGU-GPyPzoMAA:9 a=CjuIK1q_8ugA:10 a=Kq8ClHjjuc5pcCNDwlU0:22
X-Proofpoint-GUID: wT2e8bsPN3r3RONGgLCSDk2j7KRGGPMo
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTExMDAwMSBTYWx0ZWRfX2nHUA9UuiKF3
 btsS/T5TU8Mn0mDUkQu5Ql5hdyZCDU3pL34uIPBrhDfDYkmVN5IOe7rG2KZMG/P56mc8CJ2lYmq
 O7Cws2RjvIV6yJ/+0wJjYKULpgpigl6RrSW2Yn1gQKhZbXaQTSAGkVeXT+2BVYl9MN/N2uRBfyx
 CB3RJ8AdDAguXPhnT4AjZldUiSN9O9zVn2I7/+veaR74hEb2i1KZ/j5nmweKix//5dzNW/dowJA
 zbYni2EPyRHI9QGCzB1iwUzTg35xsMKPgGYwXIQ8r+gbfTv+kBZPczeies6RCNbP0by+MxGH9/4
 xIYuSwS2OCcYSVvUw5yqy8zjuFQYYEx0VeHVxuk0jo/YHGjI4lPontwa+8JEy4/9tTMyPA8HHqu
 N7u1tkZIKjsAcDOZc7UG/gTYdcQmmz2lnx1ioqxXHHiAD5qqsHi193K3mM5ofgpUplztHmPvtb/
 jmoKjW2v4KgVKpPb7BA==
X-Proofpoint-ORIG-GUID: wT2e8bsPN3r3RONGgLCSDk2j7KRGGPMo
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-10_07,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 suspectscore=0 clxscore=1015 priorityscore=1501
 malwarescore=0 bulkscore=0 adultscore=0 impostorscore=0 spamscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611110001

> The upcoming SCMI v4.0 specification [0] introduces a new SCMI protocol
> dedicated to System Telemetry.
> 

Hi Cristian,

So, the main issue here is pretty much summarized by:

 28 files changed, 12801 insertions(+), 99 deletions(-)
(obviously there are tests etc, but it's still > 10k lines)

There are relatively few reviewers who would even consider taking that on.
I foolishly thought it wouldn't be too bad (and I review a lot of code).
By about 3/4 of the way though, probably much earlier, I know the quality
of review went down considerably. Honestly it was probably a waste of
time continuing but I'm stubborn like that.

So, unless you have a path to bribing or sweet talking various folk to
deal with reviewing this with each having to set aside multiple days
to do it, likely repeating for a couple of versions yet, I think you've
got to figure out out how to make the first patch set more manageable.
Probably don't split it up as much as the mpam or CCA folk have had to,
but you have a lot of colleagues who are experiencing the same problem
at the moment. They may be able to advise.

So it would be nice if what was in that first patch set was 'functional'
but I don't think it needs to function on every systems or support more
than an absolutely minimal feature set.  Just fail to probe when you see
something that isn't supported by that minimal set if that means
the thing won't be functional.

Once that's in place, over a couple of additional patch sets you can
get to everything you have here.

So what if you choose one data path (shmti perhaps), no notifications,
events, maybe even simplify to one of the readback paths.
Maybe even drop event groups initially. 
Possibly even drop timestamps.  Definitely drop things like boot-on
support and debugfs (unless you are using that as a cheeky 'functional'
test ahead of the main userspace interface.

How much would that slim things down?  It doesn't even have to be
useful, just testable.  Realistically I think the hope of getting
enough review doubles if you can halve the size of what you are asking
people to look at.

Anyhow, gut feeling only but the code felt like it was in a much
better state than some of the versions I've looked at in the past,
so I think the game is now how to get it over the line!

Thanks,

Jonathan


> In a nutshell, the SCMI Telemetry protocol allows an agent to discover at
> runtime the set of Telemetry Data Events (DEs) available on a specific
> platform and provides the means to configure the set of DEs that a user is
> interested into, while reading them back using the collection method that
> is deeemed more suitable for the usecase at hand. (...amongst the various
> possible collection methods allowed by SCMI specification)
> 
> Without delving into the gory details of the whole SCMI Telemetry protocol
> let's just say that the SCMI platform/server firmware advertises a number
> of Telemetry Data Events, each one identified by a 32bit unique ID, and an
> SCMI agent/client, like Linux, can discover them and read back at will the
> associated data value in a number of ways.
> 
> Data collection is mainly intended to happen on demand via shared memory
> areas exposed by the platform firmware, discovered dynamically via SCMI
> Telemetry and accessed by Linux on-demand, but some DE can also be reported
> via SCMI Notifications asynchronous messages or via direct dedicated
> FastChannels (another kind of SCMI memory based access): all of this
> underlying mechanism is anyway hidden to the user since it is mediated by
> the kernel driver which will return the proper data value when queried.
> 
> Anyway, the set of well-known architected DE IDs defined by the spec is
> limited to a dozen IDs, which means that the vast majority of DE IDs are
> customizable per-platform: as a consequence, though, the same ID, say
> '0x1234', could represent completely different things on different systems.
> 
> Precise definitions and semantic of such custom Data Event IDs are out of
> the scope of the SCMI Telemetry specification and of this implementation:
> they are supposed to be provided using some kind of JSON-like description
> file that will have to be consumed by a userspace tool which would be
> finally in charge of making sense of the set of available DEs.
> 
> IOW, in turn, this means that even though the DEs enumerated via SCMI come
> with some sort of topological and qualitative description provided by the
> protocol (like unit of measurements, name, topology info etc), kernel-wise
> we CANNOT be completely sure of "what is what" without being fed-back some
> sort of information about the DEs by the afore mentioned userspace tool.
> 
> For these reasons, currently this series does NOT attempt to register any
> of these DEs with any of the usual in-kernel subsystems (like HWMON, IIO,
> PERF etc), simply because we cannot be sure which DE is suitable, or even
> desirable, for a given subsystem. This also means there are NO in-kernel
> users of these Telemetry data events as of now.
> 
> So, while we do not exclude, for the future, to feed/register some of the
> discovered DEs to/with some of the above mentioned Kernel subsystems, as
> of now we have ONLY modeled a custom userspace API to make SCMI Telemetry
> available to userspace tools.
> 
> With V5 we adopted a pure chardev/IOCTL ABI approach, refining the IOCTL
> based interface already present with the previous FS-based ABI.
> 
> INTERFACES
> 
> For each discovered SCMI Instance a character device named tlm_<N> is
> created under /dev/scmi/ subtree.
> 
> The IOCTL interface described at 'include/uapi/linux/scmi.h' is made
> available to enumerate and configure Telemetry resources: Telemetry data
> can be collected using a few different IOCTls, depending on the required
> granularity.
> 
> Alternatively it is possible to obtain a list of the file descriptors
> referencing directly the underlying SCMI Telemetry SHMTI memory areas and
> implement in user space an SCMI Telemetry parser accessing directly the
> SHMTI, while staying in compliance with the SCMI TDCF format.
> 
> NOTE THAT from v3 onwards the firmware interface level NOW supports ONLY
> the latest SCMI v4.0 specification [0].
> 
> Based on V7.4-rc2, tested on an emulated setup and AGI HW.
> 
> This series is available also at [1].
> 
> If you still reading...any feedback welcome :P
> 
> Thanks,
> Cristian


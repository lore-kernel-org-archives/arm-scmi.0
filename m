Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5492233D6FC
	for <arm-scmi@vger.kernel.org>; Wed,  5 Aug 2026 05:22:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.168.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785907328; cv=pass; b=Nmo9NraTr5U9co6QSbMFxRvszY4IMdijIpWLwDWpLP+elA4egQsL8QGpKTB0zNf8o/+EsGKAURj4jaAK8hb7+bJ6PXjBzcEMPMdlcnzJoN+9BrR7Z6wHmkf1eF7zF9stvoRYWqVWpifsq3joqk+M0/wEKNGG2jxGdMstWp7FoWU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785907328; c=relaxed/simple;
	bh=MdDSOdG+eGr7W9w/l/umK0rSEJRV3eTNzoP9xcPcR0s=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ti2JzWUsZxeMLUORMkjYxeDvbF1WknSAomoklOHAY/6B1wrn+GspBQ9HDLruIrSB1aZetlwGuqFRy99/qHZZMqoEM0m0hZfjbAtOMzwFgwdDuxEmWwaBJf5UaUdpXejcEvaMJdKr+Z+IY2GXHFwlewHIr3yQD9RMtbg3iA0XZCs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=pPgN49Sf; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=bozKKRGV; arc=pass smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="pPgN49Sf";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="bozKKRGV"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6752b9jG2082194
	for <arm-scmi@vger.kernel.org>; Wed, 5 Aug 2026 05:22:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	e7nS9ySE0V+JoTUsf6Q5P/ff+IkWVITjMMU83WN7jTg=; b=pPgN49SfebMmllw5
	reL9acnGkt7r+k6vgZBRUOVIm2WXZKZCadKoGvI6rsTvtcKp60Ky14Dp9kJDXFMU
	L0GkOLPb6VtcUUMV+mqF5bDuGdv3OIEq9K1ZB48Tewm89fXy6BaPG6K4W5FTGnLT
	EVAnsaAqE9XF3AZvWCNg9e8Glkbl8VpjzF+kfsRww3Af75CUCtiHnYnE/Q6bHyZ0
	jqZXLu1b0G+tbCFC3r/IJ2eakcjb/v8WDxlA5XxmKbnRDGpEsGK2TL9WSa9d2viK
	uOOaW3tEqooZpqUXxWzMhPnCc6gtoO8S4kZHow9B+agxXJthmlW/XQRhQOXGF3ho
	Tr1j0w==
Received: from mail-vs1-f72.google.com (mail-vs1-f72.google.com [209.85.217.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fuku32v6u-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <arm-scmi@vger.kernel.org>; Wed, 05 Aug 2026 05:22:05 +0000 (GMT)
Received: by mail-vs1-f72.google.com with SMTP id ada2fe7eead31-74ab6065f97so9663137.2
        for <arm-scmi@vger.kernel.org>; Tue, 04 Aug 2026 22:22:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785907324; cv=none;
        d=google.com; s=arc-20260327;
        b=iFTQeX2809S0glSPO+2Xif9vgynzS6ZFVIZBM2+1pVaKUrK0EVOBSiC/cRPcUiwFQk
         U/YR72jzUflX2nCT/dA8z/vDF4g8oUOFGt1Mfbir51KEKmOekG2V5Loq5rn7inNEAcqT
         MbM3FOxhylD38UW9lENW7wUicucNcIpmsbuwJ1Y/C2RacHOJ5IPi9/WxHbaXj+TAnEqj
         isVb4HYvISNxalm69PfYdyeQf3jolWuNtA0j8Kh6fU+JUlxfzKAQZQ92JT+kI1JpYmVT
         IDtWafwmL0gGSLqG4X6uXLpFIZzo+KjHgboRTHmPUojC8hD3VfRLHBFow2cxcAt+w0dU
         uolQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=e7nS9ySE0V+JoTUsf6Q5P/ff+IkWVITjMMU83WN7jTg=;
        fh=uYUm8hHI6yzH9lPZMY0TqYC5hf9B0AAbDlsN56UN8SA=;
        b=enfY2tu6sTyED5P1yLFsMdSVjCxghn5OaKwsg0Sw5uMt6vmouI6g6PSarOUlPkjdMK
         JRXyQ2KuEPZW3dKjmH/SRaarvXaHyk6/4BOhzkALSNKJh+SR4/6nk4ri34/dWdEpBrJS
         zItHK6TpVYP4cRpgti7UO1IfVA5cVYtuyEgy99TVCfYhfoqnN13t8O2iqPMfSnHPR/PW
         OeVO5cNJCoSLr4VWSw9h2PPl0jBnLU/gxA1FBAetHQy4s8cNsA9rJNskpI70I1W3FZUw
         AZUq7cQCFnwOjMouLV3iN/sgbIvLi+upRFLv9KxwB8nwEHrt2UI6hQjxa3d4maVqaljW
         4FqQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785907324; x=1786512124; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=e7nS9ySE0V+JoTUsf6Q5P/ff+IkWVITjMMU83WN7jTg=;
        b=bozKKRGVHSIiIrSQsLFTjvlZh9MLvYaKCOY1ut8mKDWK+vKhqjesRmBWS/vtdF0V6l
         zpVdZpYfK4roH5H2kjDziXRUs5MzG+hCb9pIZBKmJddavsmwMKxsDHRaInmkoXiMzMb5
         3h+hV474Vx6ZQk4IEsI/fog5H+JqpUqVeSvKDs/b4RX6dYgqXIHwsWxB3JWhno+1W6Fr
         vxlZFTcEuE018+3fbb4Lu90OLPpgvegqBF3E5XvTccpTwgznsxU0PpZihLwx1Pbps8lj
         k6OUSeO8OkwL7t2S1VYPhJtvUAqYZ7lt2MTr2Akx0FJddZcGHqcs8H0Dc2Fi8f0BpZoe
         LgsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785907324; x=1786512124;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=e7nS9ySE0V+JoTUsf6Q5P/ff+IkWVITjMMU83WN7jTg=;
        b=RFMoi88f8yKRw+Sd4/5Pt4OeEksZD+1SEHV+L8+lF1gCmVILWdcUr0CwJRSPhQ2tDt
         RWW/2XlRLPC0DMMDIYoi17XrcbuqixwHm+6KtfVtgcBoVsM9yZdZ5K8eOqIy1/t7Pmkb
         jw8hXec4sgYYt3br6IBTUltftfTDiRIBfV1pESNcFUkN7fPvoNv3BodgD//DdUudBqg3
         Njm0SiKwFXFkTDu8xZC7wyMePVm/UN2yRNHRygfWGh3q4uuIZrn2/UMqpBCOOp1JNPcS
         uB7NgUKrvhtKxzPbJqjuxAN/2JEYOUXm9wd5i5TIuVzdSWCHqVy7OXGFHgEKZlFxMXoC
         j6yA==
X-Forwarded-Encrypted: i=1; AHgh+Rp1Ql80j7RjsnxGR51YOlLuoOaWfSuI6rrAX1s9Pw1dBdTM8JvJzP0sOw97nkG1TqUelDlEA3TdiA==@vger.kernel.org
X-Gm-Message-State: AOJu0YyEATnDGkAQbmdvSwGM60RGbCqoeoDZhq1PNKZTfvEMkoc3yS7H
	XT3MEdi5dPb5pbMlpUJjEGZ2JkYIHvICi6DW74aZlApVRIHOsJBkPAfyz4I3WAAeU7Xjnq+XK6J
	UYvb3W+dRtJBfBF35pdsqyF5l1k1+R2waWu/O6iplbcpjViPagPzFnGNWYynhQZI7Oo5NurmytL
	xckKDoBV+l9HYV4XqlZ1HONxfR6ciyxY5Vuxud
X-Gm-Gg: AR+sD13ETVG+M22lWhdk/3Am+sf/CNHzYJRsKzNIOnbwOD901igxpr8xJRhAS+97Jij
	8ignaEA4cI2vFzPSHZOijjlVEkQqtvyYdNBQsE56AgWgiH50/auj0kxOBHt2PjD7bcxkFI87ok/
	4yfq9NuzruTMZeUdtXvNljMNs8pLg/YG5GwWP6eKrANalxqWjoTYcnfRW4Vw==
X-Received: by 2002:a05:6102:440a:b0:6d1:8f7:18a5 with SMTP id ada2fe7eead31-760ea954b62mr409763137.1.1785907324148;
        Tue, 04 Aug 2026 22:22:04 -0700 (PDT)
X-Received: by 2002:a05:6102:440a:b0:6d1:8f7:18a5 with SMTP id
 ada2fe7eead31-760ea954b62mr409745137.1.1785907323551; Tue, 04 Aug 2026
 22:22:03 -0700 (PDT)
Precedence: bulk
X-Mailing-List: arm-scmi@vger.kernel.org
List-Id: <arm-scmi.vger.kernel.org>
List-Subscribe: <mailto:arm-scmi+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:arm-scmi+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260802145618.1952804-1-cristian.marussi@arm.com>
In-Reply-To: <20260802145618.1952804-1-cristian.marussi@arm.com>
From: Subrahmanya Lingappa <subrahmanya.lingappa@oss.qualcomm.com>
Date: Wed, 5 Aug 2026 10:51:51 +0530
X-Gm-Features: AUfX_mzRGx5dw9aYwcYhXBsDImEFKOI9rADQzfxh9iY3_FvlM3uSNteDxmBmOLg
Message-ID: <CAPxK-6eoSguQXkQyhoKkxos89BL4Y5f43ntv8MAY7xoiNmMeYQ@mail.gmail.com>
Subject: Re: [PATCH v7 00/23] Introduce SCMI Telemetry support
To: Cristian Marussi <cristian.marussi@arm.com>, david@kernel.org
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        arm-scmi@vger.kernel.org, linux-doc@vger.kernel.org,
        sudeep.holla@kernel.org, james.quinlan@broadcom.com,
        f.fainelli@gmail.com, vincent.guittot@linaro.org,
        etienne.carriere@st.com, peng.fan@oss.nxp.com, michal.simek@amd.com,
        d-gole@ti.com, jic23@kernel.org, elif.topuz@arm.com,
        lukasz.luba@arm.com, philip.radford@arm.com,
        souvik.chakravarty@arm.com, leitao@kernel.org, kas@kernel.org,
        puranjay@kernel.org, usama.arif@linux.dev, kernel-team@meta.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-GUID: zhTFKPUhxHQySO8KcSg6FMC7xLG_81Mv
X-Proofpoint-Spam-Info: AW1haW4tMjYwODA1MDAzOSBTYWx0ZWRfX33X7qGMRq6mD
 OrGg4LGhd3KsNUf4x2HR8gML3wUG6EURqcj1n4ziu3bP1fdIEe6ih+3DKytBdxWlI0ObvtX8Sc0
 whG2EfmH3p3HvnhpTK3qezXYnsN2ZNk=
X-Proofpoint-ORIG-GUID: zhTFKPUhxHQySO8KcSg6FMC7xLG_81Mv
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODA1MDAzOSBTYWx0ZWRfX1j3rrWcChyw8
 /qBgY5evhQV6rvLqBK3IXhjb9bh6HpI5Ez/+G3AhAbI76yk5Gby19A0hJM6DIpslegidAG1t8X4
 cC228npUThnLUwl+UDWKwa1sPFUz2eT6YVi44gUUmFYxJsV6GibaIvfEHS6i+U9G8q/uWlw7gLa
 iv6v1liN9xkGcGLqQvKu68vkeek7m3AmWik4EYLj0bU03cmmP4FNPhpWjZGY3VcSCFoFxEU8Z3F
 P/NRx+eb/ILxFRHr1LRIWpQUZ49q2TjzpEddUHfkfUUgh+EP+3LbOVWnV5BYCrKGL9KgKmToPxi
 xBxE/t6Z+nWSIekbgRQD/aTNVhCYH0fl6EHGefI98zqWh+36UZNIbNsj/bqpY5j2X8NBXhhgsUl
 84W+Tf3X9ij4hFtgY95KAtu+TWVqo0VUPxGfG0y2EHrCHpGdM+AgqSsg4IwF6BNqmi864HmctAe
 26Xu+OrthAOm9D9Ih/Q==
X-Authority-Analysis: v=2.4 cv=X/hi7mTe c=1 sm=1 tr=0 ts=6a72c87d cx=c_pps
 a=DUEm7b3gzWu7BqY5nP7+9g==:117 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=Um2Pa8k9VHT-vaBCBUpS:22 a=7CQSdrXTAAAA:8 a=VwQbUJbxAAAA:8 a=NEAV23lmAAAA:8
 a=mde1ADDzGYFTShqxZZEA:9 a=QEXdDO2ut3YA:10 a=-aSRE8QhW-JAV6biHavz:22
 a=a-qgeE7W1pNrGK8U0ZQC:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-05_01,2026-08-04_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 bulkscore=0 impostorscore=0 phishscore=0 adultscore=0
 malwarescore=0 suspectscore=0 priorityscore=1501 lowpriorityscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608050039

Cristian and David,

On Sun, Aug 2, 2026 at 8:27=E2=80=AFPM Cristian Marussi
<cristian.marussi@arm.com> wrote:
>
> Hi all,
>
> [TLDR Summary]
>  [V7 highlights]
>  - V7 focus was on making the ABI complete feature-wise by adding:
>    + UUID enumerations
>    + BATCHED DE_CFG
>    + BATCH ops with per-DE status
>    + Generic EVENT Subscription with GENERATION_COUNTER support
>    + Better UAPI Doxygen docs
>    + Reserved space to grow scattered all-over
>  - V7 cleans up all the residual known sparse issues
>  - While aiming for ABI-completeness, V7 addressed also a few reported
>    general driver/protocol issues BUT the bulk of remanining Sashiko-V6
>    complains are still to be tackled
>
>  [V8 TODO (getting merge-able)]
>   - Tackle outstanding Sashiko issues
>   - [ABI]: more DOCS and examples
>
> The upcoming SCMI v4.0 specification [0] introduces a new SCMI protocol
> dedicated to System Telemetry.
>
> In a nutshell, the SCMI Telemetry protocol allows an agent to discover at
> runtime the set of Telemetry Data Events (DEs) available on a specific
> platform and provides the means to configure the set of DEs that a user i=
s
> interested into, while reading them back using the collection method that
> is deeemed more suitable for the usecase at hand. (...amongst the various
> possible collection methods allowed by SCMI specification)
>
> Without delving into the gory details of the whole SCMI Telemetry protoco=
l
> let's just say that the SCMI platform/server firmware advertises a number
> of Telemetry Data Events, each one identified by a 32bit unique ID, and a=
n
> SCMI agent/client, like Linux, can discover them and read back at will th=
e
> associated data value in a number of ways.
>
> Data collection is mainly intended to happen on demand via shared memory
> areas exposed by the platform firmware, discovered dynamically via SCMI
> Telemetry and accessed by Linux on-demand, but some DE can also be report=
ed
> via SCMI Notifications asynchronous messages or via direct dedicated
> FastChannels (another kind of SCMI memory based access): all of this
> underlying mechanism is anyway hidden to the user since it is mediated by
> the kernel driver which will return the proper data value when queried.
>
> Anyway, the set of well-known architected DE IDs defined by the spec is
> limited to a dozen IDs, which means that the vast majority of DE IDs are
> customizable per-platform: as a consequence, though, the same ID, say
> '0x1234', could represent completely different things on different system=
s.
>
> Precise definitions and semantic of such custom Data Event IDs are out of
> the scope of the SCMI Telemetry specification and of this implementation:
> they are supposed to be provided using some kind of JSON-like description
> file that will have to be consumed by a userspace tool which would be
> finally in charge of making sense of the set of available DEs.
>
> IOW, in turn, this means that even though the DEs enumerated via SCMI com=
e
> with some sort of topological and qualitative description provided by the
> protocol (like unit of measurements, name, topology info etc), kernel-wis=
e
> we CANNOT be completely sure of "what is what" without being fed-back som=
e
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
> Based on V7.2-rc4, tested on an emulated setup.
>
> This series is available also at [1].
>
> If you still reading...any feedback welcome :P
>
> Thanks,
> Cristian
>
> ---
> v6 --> v7
>  - [ABI] IOCTL EVENTS support: GENERATION COUNTER (stlm monitor)
>  - [ABI] expose DE tracking: UUID/SHMTI/OFFS
>  - [ABI] IOCTL BATCHED DE_CFG
>  - [ABI] added per-DE IOCTL BATCH status
>  - [ABI] new ABI feats flags
>  - [ABI] improved description in Doxygen docs
>  - [ABI] added reserved space to grow
>  - [STLM] added new ABI feats support (generation, UUIDs, location...)
>  - [SYS/TLM] fixed module_init error path
>  - [SYS/TLM] fixed interval DISCRETE flags reporting
>  - [SYS/TLM] check open FMODE before executing a config change
>  - [SYS/TLM] fixing DEs data cleanup on RESET
>  - [SYS/TLM] added _RAW helpers to handle non-MMIO TDCF-like accesses
>    (like Notification payload)
>  - [SYS/TLM] added UUID rescan logic at DE enable, when DE/UUID associati=
on
>  - [TLM] reworked UUID internal handling (endianity) and use uuid_t type
>  - [TLM] added generic Telemetry protocol support for events subscription
>    unknown
>  - residual sparse fixes
> v5 --> v6
>  - rebased on v7.2-rc4
>  - fixed a lot of Sashiko complains
>  - fixed ABI issues reported by review (Fayssal)
>  - added IOCTL TLM_RESET
>  - added ABI versioning
>  - added compat_ioctl support
>  - use a new IOCTL magic name
>  - better handling of UUID endianity
>  - reworked all bounds checks in UAPI implementation
>  - reject oversized SHMTI mmap request
>  - refined 'stlm' testing tool to be more interactive and to
>    exercise the full spectrum of IOCTLs ('stlm -h' is your manual
>    for now :P)
>  - fully reworked per-protocol notification handling
>  - dropped the last bit of human readable data attached to the
>    chardev .read
> v4 --> v5
>  - rebased on v7.2-rc1
>  - dropped FileSystem based driver
>  - introduced a new simple chardev SCMI driver using Telemetry
>  - reworked/reviewed the v4 IOCTLs based UAPI
>  - UAPI: better struct alignment and comments
>  - UAI: Removed flexible array members
>  - UAPI: make SCMI Telemetry protocol stack completely independent from
>          uapi defs
>  - UAPI: new ioctls support to enable RAW mmap direct access to SCMI SHMT=
I
>          areas from userspace
>  - added new ABI Documentation
>  - added new SCMI core facility to lookup the current SCMI instance ID
> v3 --> v4
>  - rebased on v7.1-rc7
>  - updatded doc to detail Concurrency model
>  - bail out on FW_BUG errors
>  - make all_des_enable/all_des_tstamp_enable entry readable
>  - refactored access to TDE values
>  - refactored common accessors for tlm_priv (FIX WARN on kfree)
>  - make all files by default world readable and user writable (if needed)
>  - added uid/god/umask mount options (and docs)
>  - added generation counter to aid spotting config changes (and docs)
>  - added DebugFS configurable support to debug/dump SHMTI areas (and docs=
)
>  - hide FS entries when NOT supported (like des_simple_sample_read)
>  - fixed output format of des/<NNN>/value to -> <TS> <VALUE>
>  - renamed top-dir by_components to by-components
>  - add a .remove method to SCMI System Telemetry Driver
>  - use kzalloc_obj
> V2 --> V3
>  - rebased on v7.0-rc5
>  - ported the firmware interface to SCMI v4.0 BETA
>  - split the SCMI protocol layer in a lot of small patches
>  - completd filesystem and ABI documentation
>  - renamed components subtree to by_components
>  - fixed uninitialized var in scmi_telemetry_de_subdir_symlink
>  - renamd tstamp_exp to tstamp_rate
>  - swap logic in scmi_telemetry_initial_state_lookup
>  - use memcpy_from_le32 where required
>  - changed a dfew dev_err into Telemetry traces
>  - define and use new helper scmi_telemetry_de_unlink
>  - simplify a few assignments with ternary ops
>  - added a missing __mmust_check on the internal SCMI API
>  - reworked and clarified de_data_read returned errno:
>         ENODATA vs EINVAL vs ENODEV/ENOENT
>  - removed some risky/unneeded devres allocations
>  - various checkpatch fixes
>  - reworked and clarified usage of traces in Telemetry
>  - added the missing DT binding for protocol 0x1B
>  - split out unrelated change around notification from patch
>    adding support for protocol internal notifier
>  - more comments
>
> V1 --> V2
>  - rebased on v6.19-rc3
>  - harden TDCF shared memory areas accesses by using proper accessors
>  - reworked protocol resources lifecycle to allow lazy enumeration
>  - using NEW FS mount API
>  - reworked FS inode allocation to use a std kmem_cache
>  - fixed a few IOCTLs support routine to support lazy enumeration
>  - added (RFC) a new FS lazy mount option to support lazily population of
>    some subtrees of the FS (des/ groups/ components/)
>  - reworked implementation of components/ alternative FS view to use
>    symlinks instead of hardlinks
>  - added a basic simple (RFC) testing tool to exercise UAPI ioctls interf=
ace
>  - hardened Telmetry protocol and driver to support partial out-of-spec F=
W
>    lacking some cmds (best effort)
>  - reworked probing races handling
>  - reviewed behaviour on unmount/unload
>  - added support for Boot_ON Telemetry by supporting SCMI Telemetry cmds:
>    + DE_ENABLED_LIST
>    + CONFIG_GET
>  - added FS and ABI docs
>
> RFC --> V1
> ---
>  - moved from SysFS/chardev to a full fledged FS
>  - added support for SCMI Telemetry BLK timestamps
>
> [0]: https://developer.arm.com/documentation/den0056/f/?lang=3Den
> [1]: https://git.kernel.org/pub/scm/linux/kernel/git/cris/linux.git/log/?=
h=3Dscmi_telemetry_ng_V7
>
> Cristian Marussi (23):
>   firmware: arm_scmi: Add new SCMIv4.0 error codes definitions
>   firmware: arm_scmi: Allow registration of unknown-size events/reports
>   firmware: arm_scmi: Introduce protocol instance notifiers
>   dt-bindings: firmware: arm,scmi: Add support for telemetry protocol
>   include: trace: Add Telemetry trace events
>   firmware: arm_scmi: Add basic Telemetry support
>   firmware: arm_scmi: Add support to parse SHMTIs areas
>   firmware: arm_scmi: Add Telemetry configuration operations
>   firmware: arm_scmi: Add Telemetry DataEvent read capabilities
>   firmware: arm_scmi: Add support for Telemetry reset
>   firmware: arm_scmi: Add Telemetry notification support
>   firmware: arm_scmi: Add support for boot-on Telemetry
>   firmware: arm-scmi: Add telemetry generic event support
>   firmware: arm_scmi: Add Telemetry generation counter event
>   firmware: arm_scmi: Add common per-protocol debugfs support
>   firmware: arm_scmi: Add Telemetry debugfs SHMTI dump support
>   firmware: arm_scmi: Add Telemetry debugfs ABI documentation
>   firmware: arm_scmi: Expose per-instance identifier
>   uapi: Add ARM SCMI Telemetry definitions
>   firmware: arm_scmi: Add System Telemetry driver
>   docs: ioctl-number: Add SCMI Ioctls
>   [RFC] Documentation: Add SCMI System Telemetry documentation
>   [RFC] tools/scmi: Add SCMI Telemetry testing tool
>
>  Documentation/ABI/testing/debugfs-scmi        |   22 +
>  .../bindings/firmware/arm,scmi.yaml           |    8 +
>  Documentation/userspace-api/index.rst         |    1 +
>  .../userspace-api/ioctl/ioctl-number.rst      |    1 +
>  Documentation/userspace-api/stlm.rst          |  148 +
>  MAINTAINERS                                   |    1 +
>  drivers/firmware/arm_scmi/Kconfig             |   24 +
>  drivers/firmware/arm_scmi/Makefile            |    3 +-
>  drivers/firmware/arm_scmi/common.h            |   18 +
>  drivers/firmware/arm_scmi/driver.c            |  119 +-
>  drivers/firmware/arm_scmi/notify.c            |   38 +-
>  drivers/firmware/arm_scmi/notify.h            |    8 +-
>  drivers/firmware/arm_scmi/protocols.h         |   17 +
>  .../firmware/arm_scmi/scmi_system_telemetry.c | 1515 +++++++
>  drivers/firmware/arm_scmi/telemetry.c         | 3762 +++++++++++++++++
>  include/linux/scmi_protocol.h                 |  261 +-
>  include/trace/events/scmi.h                   |   48 +-
>  include/uapi/linux/scmi.h                     |  517 +++
>  tools/testing/scmi/Makefile                   |   25 +
>  tools/testing/scmi/stlm.c                     | 1371 ++++++
>  20 files changed, 7877 insertions(+), 30 deletions(-)
>  create mode 100644 Documentation/userspace-api/stlm.rst
>  create mode 100644 drivers/firmware/arm_scmi/scmi_system_telemetry.c
>  create mode 100644 drivers/firmware/arm_scmi/telemetry.c
>  create mode 100644 include/uapi/linux/scmi.h
>  create mode 100644 tools/testing/scmi/Makefile
>  create mode 100644 tools/testing/scmi/stlm.c
>
> --
> 2.54.0
>
>

  Just to close the loop on my earlier comment: the second telemetry provid=
er
  I  had in mind is now public, RISC-V RPMI Specifications Telemetry
service group:

    https://github.com/riscv-non-isa/riscv-rpmi/pull/162

  V7 has already moved the SCMI ABI in a better direction: explicit ABI
  features,  reserved growth space, UUID tracking, batched operations,
per-item status
  and a  generation event make the interface less brittle than the
version I first
  commented on.

  So I am not asking to block SCMI Telemetry on a generic telemetry UAPI. T=
hat
  would still be premature. My remaining ask is smaller: please keep the
  chardev-facing descriptor/group/config/sample/mmap handling cleanly
  separated  from SCMI-private storage and TDCF parsing.

  The RPMI proposal has a similar kernel-side shape: telemetry elements,
  groups,  sampling rates, metadata, shared memory, timestamps and
sequence/freshness
  handling. The protocol details differ, but the Linux plumbing need not be
  entirely duplicated if a second provider appears later.

  With that boundary in place, SCMI can proceed with an SCMI-specific ABI n=
ow,
  while leaving a practical path to share internal telemetry plumbing later=
 if
  RPMI grows into a Linux provider.

  Thanks,
  Subrahmanya

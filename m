Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4C1C42D76C
	for <arm-scmi@vger.kernel.org>; Wed,  5 Aug 2026 11:06:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.180.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785927991; cv=pass; b=ZouBNxt/nNuOkgvTIXDO+kN7sNZFPy7uFuIE71n2DuJ99wmoAdvhXGq1gCLHt4rRvC4IX2Nhtacj++LUt/CCps9qN1GyRYfyBoB4w79sCIryLrbX5T/+8FQabw50Eh0KIC/Q0jkVGMO3xzIMglCEpRWtaXAhDuXuUAtF6t2TvFw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785927991; c=relaxed/simple;
	bh=CI/4Jb/uHbwhhmoQuQwX/mc8DWdT72vCECuWfjif4no=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=mhBNtHptwQkrdOFPqURjXAa8vw1bmVIKOV3kK1vbINfu86VUi/RmiwCsh5tMeBIN6muz/HqsS0cYJjKj/2fg0ZXtG/AeKrCTcCl+o9oy6kWp6WP8u479t3y6MiGGMRkwEGDhnea/F4J3mg+ZkUGl42kaF2mi/VjeqPElpz5StpE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gueJ8mtj; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=EB87wcHi; arc=pass smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="gueJ8mtj";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="EB87wcHi"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6758dE822132529
	for <arm-scmi@vger.kernel.org>; Wed, 5 Aug 2026 11:06:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	PdP7j+PM85jv59LWW3oHScYRNQLnSJgIIbuicxOjPE0=; b=gueJ8mtjDJvuiB6O
	/U7VY+LAbY7ZHpCN5YLWu1iiqsEGaDlCZWbuCiYpTXmnuow1cRNVoR4x/PALveCF
	UjFVtqF+fUuzB6SAvWJH3IRx20zflxXvQBkoaMw2w7JqOeoT9tlmG0VGsGgPn0SA
	M96bMY2vX7EZndXnnefNMiyhM3+piOPC+mwl/YhcrZGPvOsYG6BYeljT3mW99/0x
	kVNAFSJw5bjdgvdbY/s2jWlGLwjh6H865EMEKzT3BlZvUe4P7SKWl7l0gkrgLYfd
	4JjgB3v09a3QRACvhEvZgwUoXae+VJX31No2kfISTbflrUrhbDRPX/gBW6Z/nwoF
	NaRFLg==
Received: from mail-vk1-f197.google.com (mail-vk1-f197.google.com [209.85.221.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fum56c80p-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <arm-scmi@vger.kernel.org>; Wed, 05 Aug 2026 11:06:22 +0000 (GMT)
Received: by mail-vk1-f197.google.com with SMTP id 71dfb90a1353d-5c3cd150bc9so29613e0c.3
        for <arm-scmi@vger.kernel.org>; Wed, 05 Aug 2026 04:06:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785927982; cv=none;
        d=google.com; s=arc-20260327;
        b=Atk7Bj8oQJivk6U3GxflADSdUHkTk20XXKDyLJmMdFMOZJ24T/NmzuEVVzOxMT2mfw
         3XRABg3f//XkKJUOTcu45Sopu43nt84p6+oaqfw1Ut0kwIIArdctX4kV5zJv9Fwka3fz
         7XtzV9kq6TyeXfAtsZDWolg6zAqoyzc7ouu7liObglqtdfWWmMuKUTkVt4SnqafFbaJD
         4xRSp/MhbGjrCZg1UOJs8dRZhzHgkNL9QHlrRUpZvtM/XCPk69H1G8gjExIhakQRgbcm
         +7QbDRpoO+tNwKmqj6aVr3IjggXKDNfzU3U5HWJGSev4VPDvRzQrWIFV11XY/4ZQuDIF
         r4fQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=PdP7j+PM85jv59LWW3oHScYRNQLnSJgIIbuicxOjPE0=;
        fh=KpliitOyA2uZEfqB5bdRwmjZfMX+pSxFFH+5ybMaQiE=;
        b=GEqw/TzAVwe539sYbEK2l6+u70cnGEras3i593FdTOLRwnSw3fBB6p2JmJAlbpMvMj
         43CX8yp1edTVilFlpZ5c2wiyTH2zHk89fOk7FEuDFu4LZP3gN/i499n1k/28cMVgNzh3
         vR1J9DPD61Dj3GA5ZNYllPIm/4/nYvvELI1vqJMTKHrvJyHyNpAbgZ/Y03Lr2o5moMca
         du4HnEq8G2zzlp8I45IKIV0RhzUTKr+nmg9ZIRF54O4VsYD/dY7xwOJ/1bI1W7QOjUX8
         YxHwMIxkh6sCj0EesLjL00zZJorflj6w/ye9hyEO3tOJYiOFC+nDtc7I9iI6psdiFGz+
         PkPQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785927982; x=1786532782; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=PdP7j+PM85jv59LWW3oHScYRNQLnSJgIIbuicxOjPE0=;
        b=EB87wcHisdsbFLSNBnDx74gZ4xvw9h/sMAjllzhkYi/cXD/hY46RMxxsDiE5S4INTV
         R7tn0X8haGoT0ajZRo432R3Cd4+o8Y3HCf/+fKRxLpCDZVIGMJmVLsmvzB6gUkChWIEM
         E8/YJyvRSJ8kBifhWnJ/Cb9uFkkUUdgejYlQyFh/XFpynTN+k/BADF6/RjJG71nGfI5p
         UpybjfHx8EhB3ClSs9GNeT85WrJFx/xjNlbNQXsQscf45utblx3aGXa0NHpiunYEDLaZ
         WwncUMr+0l5eh00WTQ0P++udE0PKPxUBHFhXOUZhjD64VYtlQwHl2cu+hLJOM0I1GJgk
         Mb7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785927982; x=1786532782;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PdP7j+PM85jv59LWW3oHScYRNQLnSJgIIbuicxOjPE0=;
        b=O/WCe0m3iyUobOCUspFcCoOP/dgu30qOcFOfOX/N0e5jHOBuJhIWR9Lv1Evn8xcs0H
         GQyDSHS31uj6nwVbCTZlIA55fWOu1ZN3g9AjKFhq0V/YQUKSFM+/aiP4wqFRe3fTKbcC
         z4wd0yLPWjKE9SpfrkSn9KVNJHiYTtmiBHZ1J0lQnnNcNCBM4cJ0ieffceSuBv50eyy0
         aSK/7qDsm9LwPlospEA0qLUMJ+xQ7PronZIrjnSxvPWiAuk6BtdlLCj97zUfXywOa192
         FoD2Ci7vyY774/nzPYdpDlYCqS6Tdq2Nrj9HBLuTpqxD+ebMJVdMuK961zBwLKdH8xzL
         fNWA==
X-Forwarded-Encrypted: i=1; AHgh+RqTnbPNwTEy8kav3IZH6XvFRsRl/m6JVgjM47UKqBlF3htahj1MagvbT1upfHGHvbMbLxPUweUyQA==@vger.kernel.org
X-Gm-Message-State: AOJu0YyWQWQFSbSpFigMPtJFy98U1LUbDpZCc41kJHziF79Rrec8q2xC
	n1IJr2cIaBwtimqbGRUzLaJu0vAzud2P0PyPUZp96+DHsHr4q5IYyknMGu0wEl+gkpoBnAZ1IZk
	gqBBHcdoAIsYrIggN/sDkumkBIs4UFW6OOGSbDd5Zd8PFyayMfOtMhjJjttIXEk3j1nWPFNANf8
	bc77zuCVNtIBBpGy4DSgu07hlemtnPRxGMdflw
X-Gm-Gg: AR+sD10noRCtUuWYFUPdmAm7Zi4EoAsxGzv9HGtahLHoeJRzSFp4tkcPftAHjeofzCT
	EvMi61Fl9k8sBbM5TfECTSk+aLRHzt9qetNfdz8VPfhl4pqXtlrcIcUB9E8mf0tGC5FbOdAs0Ii
	0phq2bKEA4CkPTcvdoGT+nn72pJM7Y2fQIcupzfvkqqP4Rq46B96tGd/VgYQ==
X-Received: by 2002:a05:6102:3ed6:b0:738:9abd:9ebc with SMTP id ada2fe7eead31-760e79e969amr589181137.0.1785927981683;
        Wed, 05 Aug 2026 04:06:21 -0700 (PDT)
X-Received: by 2002:a05:6102:3ed6:b0:738:9abd:9ebc with SMTP id
 ada2fe7eead31-760e79e969amr589163137.0.1785927981095; Wed, 05 Aug 2026
 04:06:21 -0700 (PDT)
Precedence: bulk
X-Mailing-List: arm-scmi@vger.kernel.org
List-Id: <arm-scmi.vger.kernel.org>
List-Subscribe: <mailto:arm-scmi+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:arm-scmi+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260802145618.1952804-1-cristian.marussi@arm.com>
 <CAPxK-6eoSguQXkQyhoKkxos89BL4Y5f43ntv8MAY7xoiNmMeYQ@mail.gmail.com> <2e1996c3-4525-4239-ad17-4056071c9407@kernel.org>
In-Reply-To: <2e1996c3-4525-4239-ad17-4056071c9407@kernel.org>
From: Subrahmanya Lingappa <subrahmanya.lingappa@oss.qualcomm.com>
Date: Wed, 5 Aug 2026 16:36:09 +0530
X-Gm-Features: AUfX_mxJmEDJMYBb9pAHnD9lC9sTDUryeBkmp_1xfADIX__hgUO83zL9-a4n4N8
Message-ID: <CAPxK-6f4mQYeWPxLvfg6cqYsPa2e5C6dCfCjurV74059gF8JSw@mail.gmail.com>
Subject: Re: [PATCH v7 00/23] Introduce SCMI Telemetry support
To: "David Hildenbrand (Arm)" <david@kernel.org>
Cc: Cristian Marussi <cristian.marussi@arm.com>, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, arm-scmi@vger.kernel.org,
        linux-doc@vger.kernel.org, sudeep.holla@kernel.org,
        james.quinlan@broadcom.com, f.fainelli@gmail.com,
        vincent.guittot@linaro.org, etienne.carriere@st.com,
        peng.fan@oss.nxp.com, michal.simek@amd.com, d-gole@ti.com,
        jic23@kernel.org, elif.topuz@arm.com, lukasz.luba@arm.com,
        philip.radford@arm.com, souvik.chakravarty@arm.com, leitao@kernel.org,
        kas@kernel.org, puranjay@kernel.org, usama.arif@linux.dev,
        kernel-team@meta.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODA1MDA4OCBTYWx0ZWRfX5NpPRt5Vgt1Y
 SjE7Yv5O0P8XAC6l9+r5mh3S4duSeez7v5FlGIYAuD+6YKRFF48+wjvDb05vMh7Y7YTnJwuEnod
 +YKo2eblhFGKDvoDC1ZaaYzzdXAZZrCG74NP//LTljHKx4Xd7wH5clh7pcPumzD5W6TxGb22SlQ
 hKhdupJGCtVokJMCxp/6RbP/GVXh/hidF++GVhHp2ElsBmXW2DpyqSN93JP0E/4ddbyTu3LrTdr
 IdLyZW8k0fA6yMb41kof1+cG7cwnPkTFYcUcu/7L57xZJqk8SNRR9CnUdMPYqYBmTBuMUBYjNoT
 7xltjdLPgNgeDwXV9JzQ3TuV9fTAD7NOqTJr0tRea/40X3NnnLE+CevtUwytOx3g+U6m1x0mtjJ
 p11KP77NqA9b36JBRDK0U/5+JX+0rIYDSkcsNWkop9w9eDls7mm+PD6vVCZgRn/zGpX7byZtRXx
 fpe5fHeR6gb+EuHiPww==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODA1MDA4OCBTYWx0ZWRfXyhVChNieP1qZ
 BRzT/ojbmR/3GVGzG7Ltsh0KBsI+90jCopyRa9rcYK4jUPiDXLGH0Q/Hzv2MpdSEKhuI/URQ2q0
 8Q8YByv96CPqSGTGkBpIcMnTCqqRmtI=
X-Proofpoint-GUID: ClNN_YLWslYYt0dh-hD4jf3Co_Dp71X-
X-Proofpoint-ORIG-GUID: ClNN_YLWslYYt0dh-hD4jf3Co_Dp71X-
X-Authority-Analysis: v=2.4 cv=GL441ONK c=1 sm=1 tr=0 ts=6a73192e cx=c_pps
 a=JIY1xp/sjQ9K5JH4t62bdg==:117 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=yx91gb_oNiZeI1HMLzn7:22 a=7CQSdrXTAAAA:8 a=VwQbUJbxAAAA:8 a=NEAV23lmAAAA:8
 a=MWzHnyj4nXRH5IYb9WUA:9 a=QEXdDO2ut3YA:10 a=tNoRWFLymzeba-QzToBc:22
 a=a-qgeE7W1pNrGK8U0ZQC:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-05_03,2026-08-04_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 lowpriorityscore=0 spamscore=0
 malwarescore=0 clxscore=1015 bulkscore=0 adultscore=0 phishscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608050088

David,

On Wed, Aug 5, 2026 at 11:44=E2=80=AFAM David Hildenbrand (Arm)
<david@kernel.org> wrote:
>
> On 8/5/26 07:21, Subrahmanya Lingappa wrote:
> > Cristian and David,
> >
> > On Sun, Aug 2, 2026 at 8:27=E2=80=AFPM Cristian Marussi
> > <cristian.marussi@arm.com> wrote:
> >>
> >> Hi all,
> >>
> >> [TLDR Summary]
> >>  [V7 highlights]
> >>  - V7 focus was on making the ABI complete feature-wise by adding:
> >>    + UUID enumerations
> >>    + BATCHED DE_CFG
> >>    + BATCH ops with per-DE status
> >>    + Generic EVENT Subscription with GENERATION_COUNTER support
> >>    + Better UAPI Doxygen docs
> >>    + Reserved space to grow scattered all-over
> >>  - V7 cleans up all the residual known sparse issues
> >>  - While aiming for ABI-completeness, V7 addressed also a few reported
> >>    general driver/protocol issues BUT the bulk of remanining Sashiko-V=
6
> >>    complains are still to be tackled
> >>
> >>  [V8 TODO (getting merge-able)]
> >>   - Tackle outstanding Sashiko issues
> >>   - [ABI]: more DOCS and examples
> >>
> >> The upcoming SCMI v4.0 specification [0] introduces a new SCMI protoco=
l
> >> dedicated to System Telemetry.
> >>
> >> In a nutshell, the SCMI Telemetry protocol allows an agent to discover=
 at
> >> runtime the set of Telemetry Data Events (DEs) available on a specific
> >> platform and provides the means to configure the set of DEs that a use=
r is
> >> interested into, while reading them back using the collection method t=
hat
> >> is deeemed more suitable for the usecase at hand. (...amongst the vari=
ous
> >> possible collection methods allowed by SCMI specification)
> >>
> >> Without delving into the gory details of the whole SCMI Telemetry prot=
ocol
> >> let's just say that the SCMI platform/server firmware advertises a num=
ber
> >> of Telemetry Data Events, each one identified by a 32bit unique ID, an=
d an
> >> SCMI agent/client, like Linux, can discover them and read back at will=
 the
> >> associated data value in a number of ways.
> >>
> >> Data collection is mainly intended to happen on demand via shared memo=
ry
> >> areas exposed by the platform firmware, discovered dynamically via SCM=
I
> >> Telemetry and accessed by Linux on-demand, but some DE can also be rep=
orted
> >> via SCMI Notifications asynchronous messages or via direct dedicated
> >> FastChannels (another kind of SCMI memory based access): all of this
> >> underlying mechanism is anyway hidden to the user since it is mediated=
 by
> >> the kernel driver which will return the proper data value when queried=
.
> >>
> >> Anyway, the set of well-known architected DE IDs defined by the spec i=
s
> >> limited to a dozen IDs, which means that the vast majority of DE IDs a=
re
> >> customizable per-platform: as a consequence, though, the same ID, say
> >> '0x1234', could represent completely different things on different sys=
tems.
> >>
> >> Precise definitions and semantic of such custom Data Event IDs are out=
 of
> >> the scope of the SCMI Telemetry specification and of this implementati=
on:
> >> they are supposed to be provided using some kind of JSON-like descript=
ion
> >> file that will have to be consumed by a userspace tool which would be
> >> finally in charge of making sense of the set of available DEs.
> >>
> >> IOW, in turn, this means that even though the DEs enumerated via SCMI =
come
> >> with some sort of topological and qualitative description provided by =
the
> >> protocol (like unit of measurements, name, topology info etc), kernel-=
wise
> >> we CANNOT be completely sure of "what is what" without being fed-back =
some
> >> sort of information about the DEs by the afore mentioned userspace too=
l.
> >>
> >> For these reasons, currently this series does NOT attempt to register =
any
> >> of these DEs with any of the usual in-kernel subsystems (like HWMON, I=
IO,
> >> PERF etc), simply because we cannot be sure which DE is suitable, or e=
ven
> >> desirable, for a given subsystem. This also means there are NO in-kern=
el
> >> users of these Telemetry data events as of now.
> >>
> >> So, while we do not exclude, for the future, to feed/register some of =
the
> >> discovered DEs to/with some of the above mentioned Kernel subsystems, =
as
> >> of now we have ONLY modeled a custom userspace API to make SCMI Teleme=
try
> >> available to userspace tools.
> >>
> >> With V5 we adopted a pure chardev/IOCTL ABI approach, refining the IOC=
TL
> >> based interface already present with the previous FS-based ABI.
> >>
> >> INTERFACES
> >>
> >> For each discovered SCMI Instance a character device named tlm_<N> is
> >> created under /dev/scmi/ subtree.
> >>
> >> The IOCTL interface described at 'include/uapi/linux/scmi.h' is made
> >> available to enumerate and configure Telemetry resources: Telemetry da=
ta
> >> can be collected using a few different IOCTls, depending on the requir=
ed
> >> granularity.
> >>
> >> Alternatively it is possible to obtain a list of the file descriptors
> >> referencing directly the underlying SCMI Telemetry SHMTI memory areas =
and
> >> implement in user space an SCMI Telemetry parser accessing directly th=
e
> >> SHMTI, while staying in compliance with the SCMI TDCF format.
> >>
> >> NOTE THAT from v3 onwards the firmware interface level NOW supports ON=
LY
> >> the latest SCMI v4.0 specification [0].
> >>
> >> Based on V7.2-rc4, tested on an emulated setup.
> >>
> >> This series is available also at [1].
> >>
> >> If you still reading...any feedback welcome :P
> >>
> >> Thanks,
> >> Cristian
> >>
> >> ---
> >> v6 --> v7
> >>  - [ABI] IOCTL EVENTS support: GENERATION COUNTER (stlm monitor)
> >>  - [ABI] expose DE tracking: UUID/SHMTI/OFFS
> >>  - [ABI] IOCTL BATCHED DE_CFG
> >>  - [ABI] added per-DE IOCTL BATCH status
> >>  - [ABI] new ABI feats flags
> >>  - [ABI] improved description in Doxygen docs
> >>  - [ABI] added reserved space to grow
> >>  - [STLM] added new ABI feats support (generation, UUIDs, location...)
> >>  - [SYS/TLM] fixed module_init error path
> >>  - [SYS/TLM] fixed interval DISCRETE flags reporting
> >>  - [SYS/TLM] check open FMODE before executing a config change
> >>  - [SYS/TLM] fixing DEs data cleanup on RESET
> >>  - [SYS/TLM] added _RAW helpers to handle non-MMIO TDCF-like accesses
> >>    (like Notification payload)
> >>  - [SYS/TLM] added UUID rescan logic at DE enable, when DE/UUID associ=
ation
> >>  - [TLM] reworked UUID internal handling (endianity) and use uuid_t ty=
pe
> >>  - [TLM] added generic Telemetry protocol support for events subscript=
ion
> >>    unknown
> >>  - residual sparse fixes
> >> v5 --> v6
> >>  - rebased on v7.2-rc4
> >>  - fixed a lot of Sashiko complains
> >>  - fixed ABI issues reported by review (Fayssal)
> >>  - added IOCTL TLM_RESET
> >>  - added ABI versioning
> >>  - added compat_ioctl support
> >>  - use a new IOCTL magic name
> >>  - better handling of UUID endianity
> >>  - reworked all bounds checks in UAPI implementation
> >>  - reject oversized SHMTI mmap request
> >>  - refined 'stlm' testing tool to be more interactive and to
> >>    exercise the full spectrum of IOCTLs ('stlm -h' is your manual
> >>    for now :P)
> >>  - fully reworked per-protocol notification handling
> >>  - dropped the last bit of human readable data attached to the
> >>    chardev .read
> >> v4 --> v5
> >>  - rebased on v7.2-rc1
> >>  - dropped FileSystem based driver
> >>  - introduced a new simple chardev SCMI driver using Telemetry
> >>  - reworked/reviewed the v4 IOCTLs based UAPI
> >>  - UAPI: better struct alignment and comments
> >>  - UAI: Removed flexible array members
> >>  - UAPI: make SCMI Telemetry protocol stack completely independent fro=
m
> >>          uapi defs
> >>  - UAPI: new ioctls support to enable RAW mmap direct access to SCMI S=
HMTI
> >>          areas from userspace
> >>  - added new ABI Documentation
> >>  - added new SCMI core facility to lookup the current SCMI instance ID
> >> v3 --> v4
> >>  - rebased on v7.1-rc7
> >>  - updatded doc to detail Concurrency model
> >>  - bail out on FW_BUG errors
> >>  - make all_des_enable/all_des_tstamp_enable entry readable
> >>  - refactored access to TDE values
> >>  - refactored common accessors for tlm_priv (FIX WARN on kfree)
> >>  - make all files by default world readable and user writable (if need=
ed)
> >>  - added uid/god/umask mount options (and docs)
> >>  - added generation counter to aid spotting config changes (and docs)
> >>  - added DebugFS configurable support to debug/dump SHMTI areas (and d=
ocs)
> >>  - hide FS entries when NOT supported (like des_simple_sample_read)
> >>  - fixed output format of des/<NNN>/value to -> <TS> <VALUE>
> >>  - renamed top-dir by_components to by-components
> >>  - add a .remove method to SCMI System Telemetry Driver
> >>  - use kzalloc_obj
> >> V2 --> V3
> >>  - rebased on v7.0-rc5
> >>  - ported the firmware interface to SCMI v4.0 BETA
> >>  - split the SCMI protocol layer in a lot of small patches
> >>  - completd filesystem and ABI documentation
> >>  - renamed components subtree to by_components
> >>  - fixed uninitialized var in scmi_telemetry_de_subdir_symlink
> >>  - renamd tstamp_exp to tstamp_rate
> >>  - swap logic in scmi_telemetry_initial_state_lookup
> >>  - use memcpy_from_le32 where required
> >>  - changed a dfew dev_err into Telemetry traces
> >>  - define and use new helper scmi_telemetry_de_unlink
> >>  - simplify a few assignments with ternary ops
> >>  - added a missing __mmust_check on the internal SCMI API
> >>  - reworked and clarified de_data_read returned errno:
> >>         ENODATA vs EINVAL vs ENODEV/ENOENT
> >>  - removed some risky/unneeded devres allocations
> >>  - various checkpatch fixes
> >>  - reworked and clarified usage of traces in Telemetry
> >>  - added the missing DT binding for protocol 0x1B
> >>  - split out unrelated change around notification from patch
> >>    adding support for protocol internal notifier
> >>  - more comments
> >>
> >> V1 --> V2
> >>  - rebased on v6.19-rc3
> >>  - harden TDCF shared memory areas accesses by using proper accessors
> >>  - reworked protocol resources lifecycle to allow lazy enumeration
> >>  - using NEW FS mount API
> >>  - reworked FS inode allocation to use a std kmem_cache
> >>  - fixed a few IOCTLs support routine to support lazy enumeration
> >>  - added (RFC) a new FS lazy mount option to support lazily population=
 of
> >>    some subtrees of the FS (des/ groups/ components/)
> >>  - reworked implementation of components/ alternative FS view to use
> >>    symlinks instead of hardlinks
> >>  - added a basic simple (RFC) testing tool to exercise UAPI ioctls int=
erface
> >>  - hardened Telmetry protocol and driver to support partial out-of-spe=
c FW
> >>    lacking some cmds (best effort)
> >>  - reworked probing races handling
> >>  - reviewed behaviour on unmount/unload
> >>  - added support for Boot_ON Telemetry by supporting SCMI Telemetry cm=
ds:
> >>    + DE_ENABLED_LIST
> >>    + CONFIG_GET
> >>  - added FS and ABI docs
> >>
> >> RFC --> V1
> >> ---
> >>  - moved from SysFS/chardev to a full fledged FS
> >>  - added support for SCMI Telemetry BLK timestamps
> >>
> >> [0]: https://developer.arm.com/documentation/den0056/f/?lang=3Den
> >> [1]: https://git.kernel.org/pub/scm/linux/kernel/git/cris/linux.git/lo=
g/?h=3Dscmi_telemetry_ng_V7
> >>
> >> Cristian Marussi (23):
> >>   firmware: arm_scmi: Add new SCMIv4.0 error codes definitions
> >>   firmware: arm_scmi: Allow registration of unknown-size events/report=
s
> >>   firmware: arm_scmi: Introduce protocol instance notifiers
> >>   dt-bindings: firmware: arm,scmi: Add support for telemetry protocol
> >>   include: trace: Add Telemetry trace events
> >>   firmware: arm_scmi: Add basic Telemetry support
> >>   firmware: arm_scmi: Add support to parse SHMTIs areas
> >>   firmware: arm_scmi: Add Telemetry configuration operations
> >>   firmware: arm_scmi: Add Telemetry DataEvent read capabilities
> >>   firmware: arm_scmi: Add support for Telemetry reset
> >>   firmware: arm_scmi: Add Telemetry notification support
> >>   firmware: arm_scmi: Add support for boot-on Telemetry
> >>   firmware: arm-scmi: Add telemetry generic event support
> >>   firmware: arm_scmi: Add Telemetry generation counter event
> >>   firmware: arm_scmi: Add common per-protocol debugfs support
> >>   firmware: arm_scmi: Add Telemetry debugfs SHMTI dump support
> >>   firmware: arm_scmi: Add Telemetry debugfs ABI documentation
> >>   firmware: arm_scmi: Expose per-instance identifier
> >>   uapi: Add ARM SCMI Telemetry definitions
> >>   firmware: arm_scmi: Add System Telemetry driver
> >>   docs: ioctl-number: Add SCMI Ioctls
> >>   [RFC] Documentation: Add SCMI System Telemetry documentation
> >>   [RFC] tools/scmi: Add SCMI Telemetry testing tool
> >>
> >>  Documentation/ABI/testing/debugfs-scmi        |   22 +
> >>  .../bindings/firmware/arm,scmi.yaml           |    8 +
> >>  Documentation/userspace-api/index.rst         |    1 +
> >>  .../userspace-api/ioctl/ioctl-number.rst      |    1 +
> >>  Documentation/userspace-api/stlm.rst          |  148 +
> >>  MAINTAINERS                                   |    1 +
> >>  drivers/firmware/arm_scmi/Kconfig             |   24 +
> >>  drivers/firmware/arm_scmi/Makefile            |    3 +-
> >>  drivers/firmware/arm_scmi/common.h            |   18 +
> >>  drivers/firmware/arm_scmi/driver.c            |  119 +-
> >>  drivers/firmware/arm_scmi/notify.c            |   38 +-
> >>  drivers/firmware/arm_scmi/notify.h            |    8 +-
> >>  drivers/firmware/arm_scmi/protocols.h         |   17 +
> >>  .../firmware/arm_scmi/scmi_system_telemetry.c | 1515 +++++++
> >>  drivers/firmware/arm_scmi/telemetry.c         | 3762 ++++++++++++++++=
+
> >>  include/linux/scmi_protocol.h                 |  261 +-
> >>  include/trace/events/scmi.h                   |   48 +-
> >>  include/uapi/linux/scmi.h                     |  517 +++
> >>  tools/testing/scmi/Makefile                   |   25 +
> >>  tools/testing/scmi/stlm.c                     | 1371 ++++++
> >>  20 files changed, 7877 insertions(+), 30 deletions(-)
> >>  create mode 100644 Documentation/userspace-api/stlm.rst
> >>  create mode 100644 drivers/firmware/arm_scmi/scmi_system_telemetry.c
> >>  create mode 100644 drivers/firmware/arm_scmi/telemetry.c
> >>  create mode 100644 include/uapi/linux/scmi.h
> >>  create mode 100644 tools/testing/scmi/Makefile
> >>  create mode 100644 tools/testing/scmi/stlm.c
> >>
> >> --
> >> 2.54.0
> >>
> >>
> >
> >   Just to close the loop on my earlier comment: the second telemetry pr=
ovider
> >   I  had in mind is now public, RISC-V RPMI Specifications Telemetry
> > service group:
> >
> >     https://github.com/riscv-non-isa/riscv-rpmi/pull/162
> >
> >   V7 has already moved the SCMI ABI in a better direction: explicit ABI
> >   features,  reserved growth space, UUID tracking, batched operations,
> > per-item status
> >   and a  generation event make the interface less brittle than the
> > version I first
> >   commented on.
> >
> >   So I am not asking to block SCMI Telemetry on a generic telemetry UAP=
I. That
> >   would still be premature. My remaining ask is smaller: please keep th=
e
> >   chardev-facing descriptor/group/config/sample/mmap handling cleanly
> >   separated  from SCMI-private storage and TDCF parsing.
>
> IIRC, this is not a ABI concern, right?
>
> Any kernel internal refactorings can be had later, once RPMI actually lan=
ds.
>

 Yes, fair point.

  The internal provider/backend split is not an ABI requirement by itself, =
and I
  agree that a real common internal layer can wait until there is a second =
Linux
  provider, such as RPMI, to model it against.

> --
> Cheers,
>
> David

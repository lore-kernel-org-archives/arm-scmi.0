Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4F824B270B
	for <arm-scmi@vger.kernel.org>; Fri, 18 Sep 2026 14:44:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.168.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789742643; cv=pass; b=nJ9wf7BAjFwvQmxP1VxDtsF7gBEG4QmxeTOpCdPWZGBZbM7jnly6wU7jgEB4RnMjF3WUwyi5yfNmq1KUVI7y74/7kubhbDKCBvXl5ccbC+ysySl1etxK8tf9/wZ254riGzCcW78s5uEZjGv1F83F8AlMDFTSAuTeAq2ddfKnty0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789742643; c=relaxed/simple;
	bh=AcIVnsv8+2abkkPu8NU5Qxz7g11MxL22mpLiDkD0gKw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=q3FDp8oN/r6pPHK8t701vS6ofYQsU5e1KG7sAFDxjatfuNlSCteJDtNbqmNuQtofl/BGX75/vCPA9ydwk2Yy4wqVLGtp0gkM+QpAEbOHIx6pAkrAYoaY+3qDwt2yfmFZwoqbhj7gqr0B1oZ1m1DsiWgLDA5WnVpwhzNRdYEONhI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Ev7OIqCy; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=RHy/C4DA; arc=pass smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Ev7OIqCy";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="RHy/C4DA"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68IDOU2E215576
	for <arm-scmi@vger.kernel.org>; Fri, 18 Sep 2026 14:44:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:reply-to:subject:to; s=
	qcppdkim1; bh=W6tY/LrwQ6+wUFwfZF6CF5RRZwGXtm3/veslsZpmF+Q=; b=Ev
	7OIqCyObUjNIYqgsGclT+aFxz83DUJ5JXZT1YC6XQjxLTh3EEaGOdepPGd12JWPt
	sZhx4jpPGdr+yz3nJlvsx6/AXs0kGN8dhvgOuJnVPciG6jzrsoJWgWWnPhPsIxf6
	3GiYTYXTEMqGC4s8SoIIlq2bZTOOD8HFMPeqkNED+u/EX62sCxUgBWabe5hWda6H
	D5yQZU2fp7T/7D8zGS2ZTco/Dqz5b6+B/Nn00miVFLDHq46FqHcbpzmLl2uA82CZ
	m68Mrfof4f/gOFIrxUyH/q02GBWfffLXvKzCw+6k1RwHJBACJHECKXRIR8CaSl8z
	3WGR4a2+Km/YB2IyJF7Q==
Received: from mail-oo1-f71.google.com (mail-oo1-f71.google.com [209.85.161.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4grrjdun7e-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <arm-scmi@vger.kernel.org>; Fri, 18 Sep 2026 14:44:00 +0000 (GMT)
Received: by mail-oo1-f71.google.com with SMTP id 006d021491bc7-6c1b24c4d0bso1103006eaf.1
        for <arm-scmi@vger.kernel.org>; Fri, 18 Sep 2026 07:44:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789742640; cv=none;
        d=google.com; s=arc-20260327;
        b=f0DiN4mA/YpFgqrhsxzEc0OScJeaX9DaNT6pXQrS6Ny7i5I9FmlSKoAGiD75hw+pn9
         dIGep2wACL0JBnMbOubpUtIbMHRFv7nNCBKDjC6LsRIb90zKopWGtJcUs15dVlVPEvrW
         ylVOHjYoQsg6VC/Et177pTsqwWQu4uaeMFde4HUXsWuLM43KAiOqP0qn86/u8MUv6BBC
         XOq2EhuYBkvxuV+yHY+wqfld9PF0etvjgIjUEnFJo6bjVRf4F368frqiTH+hrcBLjYhs
         gg0ezyXeWv9CsQE/TK3r1Rf1DRjhCZ+pzGotecOOhUKBVLPoXuFghqotZirJxRaV/uhN
         gU+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:dkim-signature;
        bh=W6tY/LrwQ6+wUFwfZF6CF5RRZwGXtm3/veslsZpmF+Q=;
        fh=Nis5ylu9EoOgRAEf31yb7qO5tFnG7m+RakmcEUsbWs0=;
        b=fQzbuDvNKTW2Vx/5xuxQWDYODvs4v/dEUK6lyEjqhrLxVYtrTTa7a4fUbsk1iz+OQt
         BAfLSOIsEmUQa7J/LSsbj9CgJmz6C02a/V4PwpU7xw2zHkffYQfHrZlgYscsBNeM/dhU
         0TwItT0orlWZvHo5/Vl9MLAE8Zng0EtKyNVyeEKFCYgXu2Lj1BZrBzvmFr2UwrjHz0Vq
         eYiH4Q1mxvF19ytUN/CnxyGiGo57iK7j83zbUkSQ04dQ4Nmg8QqbaBNtwt4eKKetlM8z
         2IAEADnjc9QfYAu+3utR1oTq4VdLu8fLKmCUE8j2vt8HKgyMhEYdd5+f4TnBu2HnZl+L
         Q1dg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789742640; x=1790347440; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:reply-to:in-reply-to:references:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=W6tY/LrwQ6+wUFwfZF6CF5RRZwGXtm3/veslsZpmF+Q=;
        b=RHy/C4DAuXxWZLN9KmFfG1qic0RcRsh7bEtRbfxNPCkgEjtHUsRI6BaXAweNOAqyAo
         4aFCylBGOe2UVPK19w+Sf4MxXBXRyrjLOlzGy5roqTv8D+ZdkzEGlS1W6wHa0n8IomtJ
         y7j8Fo4/UdNQ33XdgEtj3vG9+7SJeKBVzildLanG3TuuA8yPKhv3VBlY9tmbz1kVu1FM
         V7Vn5sAuErRDuh9evlVbOHRaZEYzK1w1N+rZmInk12Y2Tnpy7UfnXCml6ui8Mz7mqoSC
         HDeu5QFOub2wCspalht0GradjJ32Pq1M5/ZrqYVFK8R8A6Rrrv9WumO9eMx3Fa4AotCf
         AAaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789742640; x=1790347440;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:reply-to:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=W6tY/LrwQ6+wUFwfZF6CF5RRZwGXtm3/veslsZpmF+Q=;
        b=CAh3QusYOxciexcAMrOBLwgboQ3ADUBOmXITOi7I92Uybzwt4D5vbrov4OMCZJPNdU
         qqs/auCRhUOuBH3Pi+xTBCPiBsdtnREghsQbTxltMQ8tUmJQ19VpvAVT00rfkLgIWIwl
         0axBowZILD+TqkTAusaGK8FQva2vFvxOPF9N7jjGoe4WwRXZUGrrE7pFTvPOKFfp5C8s
         VzMo4u+rxbP/zEy+MTLeRuzB0Ld2CICWFw3uQ7MKY1GZZyIgH15i2NdA5pIsfRkg+U1t
         HYfStOV1kgqVGHiMwdUR/gpQ41QDRYBLt2AUzCXp9AWHZVoFRY4Ynwu4rW5uFyAfZHDL
         4x4Q==
X-Forwarded-Encrypted: i=1; AKwUvBz5n3AB3AR0pkxQN9mECHCRLPfFWzACrbV9EAu5vZWiRvzSUjcLiyeqWnIg7gUmO0/Bq88ppn7G+Q==@vger.kernel.org
X-Gm-Message-State: AFuF++nRIY81CPykYE5aBo8SNcVNeh3ndd09wxKyB3o3XFmvs/QnzDGG
	CFKKUEA8gIT9K5q9mSLH+MQj2+zJFt/MNJu7aW5uHMxIMoWSXopjyqnGsLoccaInqgSan4tOGDa
	j3tovDgVscJKj4j+fCwFW7Wv+0lO7uJd79BIrs2OhJ4AYcoaZp1OUB/H0C1nVphpsh2QAxXDoBr
	vNmzXUwPr+HfQW3O4i7YLkZ9j8l73vfvmtfUpf
X-Gm-Gg: AYBFou11ozpezos6QK33IpkCTfyCSZljV/ZyHDbvsmU8oW7Timhh706g7bYlpozl0pb
	znaiKo/rKbtGYCfQcdsD+iT3w3SfgyV5P0ASWCkZbyB32bqyzp9gysKNSqxF6GPQ/sbHVBbwMJ7
	u0xAZXRDcoOy5NSSP+VOz8RLrHapiyxEtTMB8tIMdzxGQyN92nWZ6r+EgV
X-Received: by 2002:a4a:e908:0:b0:6c3:42eb:ec22 with SMTP id 006d021491bc7-6ca9a74fec8mr2397332eaf.23.1789742639860;
        Fri, 18 Sep 2026 07:43:59 -0700 (PDT)
X-Received: by 2002:a4a:e908:0:b0:6c3:42eb:ec22 with SMTP id
 006d021491bc7-6ca9a74fec8mr2397308eaf.23.1789742639405; Fri, 18 Sep 2026
 07:43:59 -0700 (PDT)
Precedence: bulk
X-Mailing-List: arm-scmi@vger.kernel.org
List-Id: <arm-scmi.vger.kernel.org>
List-Subscribe: <mailto:arm-scmi+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:arm-scmi+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260918092951.5656-1-johannes.goede@oss.qualcomm.com>
 <20260918092951.5656-2-johannes.goede@oss.qualcomm.com> <2104f437-e960-4e55-b0e1-2b37126e8c2f@oss.qualcomm.com>
 <82a72918-7bc7-4e2c-892c-0dcdd6dd5548@oss.qualcomm.com> <3f51bf6c-5318-4e32-a1ca-3ce8cf8c4ceb@oss.qualcomm.com>
 <20260918-roaring-bee-of-acceptance-50a8a9@sudeepholla>
In-Reply-To: <20260918-roaring-bee-of-acceptance-50a8a9@sudeepholla>
Reply-To: rob.clark@oss.qualcomm.com
From: Rob Clark <rob.clark@oss.qualcomm.com>
Date: Fri, 18 Sep 2026 07:43:47 -0700
X-Gm-Features: AcwNN1XOxS8g7aUV7HRRWF2PBl79h7D0NcKpS9p8imqdtEwjj4hgkc90NvRmmmI
Message-ID: <CACSVV01N8v4kfC0S8YZVUmyOvWcSKX0jFax4_S6vTpbB11X4HA@mail.gmail.com>
Subject: Re: [PATCH v7 1/2] module: add SCMI device table alias support
To: Sudeep Holla <sudeep.holla@kernel.org>
Cc: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>,
        Hans de Goede <johannes.goede@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Cristian Marussi <cristian.marussi@arm.com>,
        Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>,
        Frank.Li@kernel.org, arm-scmi@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        imx@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE4MDIwOSBTYWx0ZWRfX/ubikEPkPLTK
 zYA1BIvMbLH0xo1SdDpz4j7yK8wW/lTCm8u+SvVWWtJs0f0ZWxX0+g3Zn/KjD5ujbCy5v9BVKPW
 9biN1bFuieKPHekY8SRAZ1CLRBUdfaXM5ZQjbdpEoSrnFr0Idtlqfp1WbrUU9GY9hiFpbdbUI1U
 +Z/O6uyyYs/FCB+K1PVfOO1fi1FOGuzqFejTUzeeB1NUk1oJzmo8g3kf27bEn4t66TUcXhIpeUV
 oE+tJnwH317+E3qaWwRqtXl3or4oRqcwLv7K+uMw3qOa+tgMnOCLIh9LCE18lY80N8OEtS9nip0
 XMhCOEIDUNGaWi8wJVv8DXi0XebzKVcCje4vpCELm37JKuw4fpQ7E3KhW9Usv651dq4O0F+RnCz
 FeIRhhogsRlO3M1UpCSvSZnu/ZGlraT1DiJk80t/rGtVgrknLrAt+9+3MRqKxQnFnpQlssubEgN
 RhJtL8d6xSlawH9k1Rg==
X-Proofpoint-ORIG-GUID: RSS5RsdTYJ9TFC8VkWrd2Y8e9GJXpTD-
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE4MDIwOSBTYWx0ZWRfX1wPa6mc30IOL
 3jEwswnPchdJwg1HCCSdmdHejhodfa7ZZ1tQD5GN1P39q1wDBkk3PiVR87XPTdxL9YK53gBkhjR
 ZUsQAhtmDsFyydn/w+7zCuPkRWDjfkA=
X-Authority-Analysis: v=2.4 cv=J9Q/fwnS c=1 sm=1 tr=0 ts=6aad4e30 cx=c_pps
 a=V4L7fE8DliODT/OoDI2WOg==:117 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=_K5XuSEh1TEqbUxoQ0s3:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=CY0cOUppvrph7IambT4A:9 a=QEXdDO2ut3YA:10 a=WZGXeFmKUf7gPmL3hEjn:22
X-Proofpoint-GUID: RSS5RsdTYJ9TFC8VkWrd2Y8e9GJXpTD-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-18_04,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 impostorscore=0 clxscore=1011 suspectscore=0
 phishscore=0 priorityscore=1501 bulkscore=0 malwarescore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609180209

On Fri, Sep 18, 2026 at 7:10=E2=80=AFAM Sudeep Holla <sudeep.holla@kernel.o=
rg> wrote:
>
> On Fri, Sep 18, 2026 at 12:13:10PM +0200, Daniel Lezcano wrote:
> > On 9/18/26 12:02, Hans de Goede wrote:
> > > Hi Daniel,
> > >
> > > On 18-Sep-26 11:53, Daniel Lezcano wrote:
> > > >
> > > > Hi Hans,
> > > >
> > > > thanks for taking care of that
> > > >
> > > >
> > > > On 9/18/26 11:29, Hans de Goede wrote:
> > > > > From: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
> > > > >
> > > > > SCMI client drivers already describe their bus match data with
> > > > > MODULE_DEVICE_TABLE(scmi, ...), but modpost does not know how to =
consume
> > > > > SCMI device tables. As a result, SCMI modules do not get generate=
d module
> > > > > aliases from their id tables.
> > > > >
> > > > > Move struct scmi_device_id to mod_devicetable.h so it has a fixed=
 layout
> > > > > visible to modpost, add the corresponding generated offsets and t=
each
> > > > > file2alias to emit scmi:<protocol>:<name> aliases.
> > > > >
> > > > > Use the same stable alias format for SCMI device uevents and sysf=
s
> > > > > modaliases. The previous string included the instance-specific de=
vice
> > > > > name, which is not useful for matching modules.
> > > > >
> > > > > Assisted-by: Codex:GPT-5.5
> > > > > Reviewed-by: Hans de Goede <johannes.goede@oss.qualcomm.com>
> > > > > Tested-by: Hans de Goede <johannes.goede@oss.qualcomm.com>
> > > > > Signed-off-by: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
> > > > > Signed-off-by: Hans de Goede <johannes.goede@oss.qualcomm.com>
> > > > > ---
> > > >
> >
> > [ ... ]
> >
> > > > >    #include <linux/bitfield.h>
> > > > > +#include <linux/device-id/scmi.h>
> > > > >    #include <linux/device.h>
> > > > >    #include <linux/notifier.h>
> > > > >    #include <linux/types.h>
> > > > > @@ -951,11 +952,6 @@ struct scmi_device {
> > > > >      #define to_scmi_dev(d) container_of_const(d, struct scmi_dev=
ice, dev)
> > > > >    -struct scmi_device_id {
> > > > > -    u8 protocol_id;
> > > > > -    const char *name;
> > > > > -};
> > > > > -
> > > >
> > > > What is the reason of converting the char * to a fixed array? That =
limits the name and may result in truncation and potentially name collision=
, no ?
> > >
> > > Because of how modpost works to generate modaliases inside the .ko
> > > any string buffers in device_id structs need to have a fixed length.
> > >
> > > So the truncation / name collision issue pretty much applies to all
> > > foo_device_id structs in the kernel. People should now to make sure
> > > that any strings used will fit inside the fixed string. And I would
> > > expect the compiler to warn for overly long strings.
> > Ok, thanks for the clarification
>
> Not related to above topic, but just wanted to check with Daniel if this
> solves module auto-loading for you. Was there someone else who was testin=
g
> this series and was having issue with earlier versions or its you only
> Hans de Goede and it was with v1/v2 when Bjorn posted them. I remember
> something vaguely and couldn't trace back all the versions easily.

I'm using v7 on glymur slim7x, and it solves the scmi-cpufreq autoloading

Tested-by: Rob Clark <rob.clark@oss.qualcomm.com>

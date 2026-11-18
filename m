Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795043829;
	b=ai5wL74UAQY6k33LSOPweM1DnCXDOLZBiC0dGKm8IyfNZ06QIXCrHPSkwD/3UMVhIN1A
	 kGX3lR9y64E2t+4viYK99ZsAyiwoviORdHORBt9W4vblEKApj+fWaUm072FAsjGtm+J0q
	 paUYVSyQIjMJOcL0erO8PqbXCcvS+m5H/C+EDEc3b9yXxuoOXcmbI4hxvylSRyo2OLnsw
	 yUKHswVv9AQCY1ajSKnVo/QA/jC9FRswjUSQHiilMehcc1PUdrUqc/vMO+Pkt9RR7UkW9
	 sORdPc+sTiPXwwGm9weIdVyX89wQ52E0B2BMxVBfr1WaXR2uJKYgC+KR626Pt+a55pw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795043829;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:In-Reply-To:References:Organization:X-Mailer:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:
	 X-Authority-Analysis:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=LVpZsBQ2E3YbTOVgeYCjz8Lxd6C9Ro2zeP2g1RQdtq4=;
	b=XfRDC9Eh1wQMHEJNqxnwf43e2k0qmV6sZFzHcft51Lz9RAiYnQE5vGH89hUPPzEilFYl
	 nMWAxLBQ1KgTn6CMxsBD2KCiLSOpnciNEgwyB2yeCilkaSG6/iHc5ukGBD4yWVtMooW55
	 /zrS9HpI3FQsFhbKJsF6pZtG6BquvfVMm+0WxTAdyBC40jeDyMGdH0B1tB21ihDHk71qn
	 H/bGJlPVnze55FQybA2UonGFCY5ZNI2AUCtsZDpsMqFF0Jgw5He2aNLK+jNDMCtfGIZY1
	 pij5+GVklXQ5giBiCPnh5RNjJbeLCWpzqdYj47W2PNbtV9NfCCQMPydFy4ifoGiZIGg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=WzXoqy9E;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=UI2Ypq2h;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97BF9606A320
	for <arm-scmi@vger.kernel.org>; Wed, 18 Nov 2026 23:17:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 97BF9606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=WzXoqy9E;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=UI2Ypq2h
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AILD9HQ273853
	for <arm-scmi@vger.kernel.org>; Wed, 18 Nov 2026 23:17:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	LVpZsBQ2E3YbTOVgeYCjz8Lxd6C9Ro2zeP2g1RQdtq4=; b=WzXoqy9EZ8KUqGzJ
	dXcwQReYR+9nFSrq0rPM9W0S5fsrigFhMcZUm1L203qq4hjYQlupifvfpSbRBWH3
	vx+FjGkIXoIPtxMSEFxD++aCJuLCSgLUrBX1ObLXVHM9EJJdytruqp+W3Ag5vTIK
	qj7ztlV7CjWCKf1lmYEsj5u2oyN7yxYTlk/PQQBGJ4PZGoWt+MALbOv7lewgWnB6
	brOwltFJANKvco4ZYgD2EwVnNsvPBWHucCg0zcUbpZcnoPWLs+S7ADwAtF4k8ABD
	DScPdnZw0l5oTjPjU06QTe3g6geaPCqsdUsQRnwp0PvHfdg6mFtEirwPiAG6I1ki
	FEdSrA==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j1dpca7pe-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <arm-scmi@vger.kernel.org>; Wed, 18 Nov 2026 23:17:07 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-370230d93efso5592868eec.1
        for <arm-scmi@vger.kernel.org>; Wed, 18 Nov 2026 15:17:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795043827; x=1795648627; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:organization
         :references:in-reply-to:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=LVpZsBQ2E3YbTOVgeYCjz8Lxd6C9Ro2zeP2g1RQdtq4=;
        b=UI2Ypq2hRx0o5VHh0HHrADGqVA56gXypndxS4GBp7vlKiP+kCliO+jvzmn7ubVFxj5
         QEbX5oNTFDY1NjvvvCY3y0uOI4VDDca7nBz4+H48F9qjqkyN0yy/IjYtE5h/FdKyQ0tQ
         T4MIWxCM6904DkcQlv/yut5h7HeAiF5d9BnVMzAzwXkmx45KK6WDRb4dhpnY3AGVRK0D
         P/phK9L+GtfxzuwqKXGXomEM9jYjeAYnCl+o9nwzlyOTs9ZX/Pkvvf/twzvMLRoYu2IA
         dAQMadTd5Xh30RtGlKu1ysJ6AlxcjR1nQPuDahMlovjSWPrw1w2yltM5VHHURnA0A+W6
         35Lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795043827; x=1795648627;
        h=content-transfer-encoding:content-type:mime-version:organization
         :references:in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LVpZsBQ2E3YbTOVgeYCjz8Lxd6C9Ro2zeP2g1RQdtq4=;
        b=raqYSeke3T9Uyg58QS3V3D3SISaKB6nr8CQ3V1ihPMqLSTDk1TVjaYusaIVyTZK2U7
         W0C5sLHlM1yNhy3wa5LIRnA0adh5RazqdAH3Rhjb/k24+sU6V+X/q9GwtHhbwC5Fg2u+
         5LU0t+t4N9EXKFS8BZZ0jR49BRVabh2y0A9eLpzVb26R+5fZN9/7wwmvL6WNJ69PbvWp
         9dGioYSmoKMgHxomAbDyasRl3tShyVuJgxd1XqneuplnAdaaw51APWcafhYSPkcUvgrS
         iwSrozDydfjMunzDOCQr50wcwRdjY35tVTOus79CYweQ72ZIVOYy0z6QDJfeydIs8DHk
         3E6A==
X-Forwarded-Encrypted: i=1; AL+hErF9saFRva7555dGMKv6yYMprwc8vze4JhvVzpNdVgGJhjeJOdeubGgkuqs81eXFLBmXaTeofZmBmg==@vger.kernel.org
X-Gm-Message-State: APuU4Z//j3jbVdmkY4lMAq8dOw8gumbUqqqCT1U0KoOVO2hDdInMSPth
	PJE8ulVZg05P/ijCUYb6Vx9dms34U/Uz9pR1Q5EaIbIUp08BEcVRHF6H4LLOClKg+lMf3u1WD+q
	eUWv3KJGotOSKT7oWWCTzJuNJ7VI/mwgBrPtjwanOQ2yUr0OvpfHF1N+2rtmdFg==
X-Gm-Gg: AZFdTZfBupY9xv72oVS7+M21cBivGf7qY4F6A/vhIHbJRMWY37tMr6S3lpW1NGHS9Kz
	anYUvb9rH6mKdGnF6lePMaRDQBNQinqU1U7Pt8FIiANU7I7RCwhK4cg00LF0vSgnMGh6O83lXd6
	gDYPZes6uadQ3mQ7/jJGhdHBY+HG+mXLdL2wF6mzpZ6dn5hoVambC63HBs+9YeJluqctirQuEHY
	gKZhxlt0I04KKx51BzCWsb2dWswQ2yyH6lIxPG96CO8TmhP2fo2dDfSRBx/2ARTKXKj1h3Ni4FW
	UIsFXzcq1yXcBa9eWAWsLrDvPasyFhf7r1T9UmPR+3fLasLip0V11htbljsVV3OBs5HKQa5J0HE
	ALncGbukT+vuNkuTsEcbwG0iUsQqsl2+QIh7UeBVVQQs1mRF6NwGK7FIkFekw19zT2pwgRRURJY
	l8LBXJAfoxASoQk3Q/sggKqTXAuEM=
X-Received: by 2002:a05:693c:42c9:b0:36f:a72d:29f with SMTP id 5a478bee46e88-3828111ab25mr3971438eec.34.1795043826803;
        Wed, 18 Nov 2026 15:17:06 -0800 (PST)
X-Received: by 2002:a05:693c:42c9:b0:36f:a72d:29f with SMTP id 5a478bee46e88-3828111ab25mr3971402eec.34.1795043826254;
        Wed, 18 Nov 2026 15:17:06 -0800 (PST)
Received: from localhost (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-382a7eaf3b3sm12541673eec.27.2026.11.18.15.17.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 15:17:05 -0800 (PST)
Date: Wed, 18 Nov 2026 15:17:01 -0800
From: Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>
To: Cristian Marussi <cristian.marussi@arm.com>
Cc: Sudeep Holla <sudeep.holla@kernel.org>, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, arm-scmi@vger.kernel.org,
        linux-doc@vger.kernel.org, james.quinlan@broadcom.com,
        f.fainelli@gmail.com, vincent.guittot@linaro.org,
        etienne.carriere@st.com, peng.fan@oss.nxp.com, michal.simek@amd.com,
        d-gole@ti.com, elif.topuz@arm.com, lukasz.luba@arm.com,
        philip.radford@arm.com, david@kernel.org, souvik.chakravarty@arm.com,
        leitao@kernel.org, kas@kernel.org, puranjay@kernel.org,
        usama.arif@linux.dev, kernel-team@meta.com
Subject: Re: [PATCH v15 00/35] Introduce SCMI Telemetry support
Message-ID: <20261118151701.00007190@oss.qualcomm.com>
In-Reply-To: <av3w1CbwYxFRPStZ@pluto>
References: <20261109091221.2532706-1-cristian.marussi@arm.com>
	<20261117170709.00002088@oss.qualcomm.com>
	<20261118-poetic-robust-raptor-bcff2b@sudeepholla>
	<20261118093203.000069f1@oss.qualcomm.com>
	<av3w1CbwYxFRPStZ@pluto>
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
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Authority-Analysis: v=2.4 cv=YJ0KWhGx c=1 sm=1 tr=0 ts=6afe31f3 cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=7CQSdrXTAAAA:8 a=VwQbUJbxAAAA:8 a=iv0zGsx7Xu7kTqO63LoA:9 a=QEXdDO2ut3YA:10
 a=6Ab_bkdmUrQuMsNx7PHu:22 a=a-qgeE7W1pNrGK8U0ZQC:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE4MDA4NSBTYWx0ZWRfX8FTPwTXrbja3
 F8lmr3R227mUx4GFOMuPl/humN66yPUj0L4OCiVBqiNYF8sDc4Sp/Fsu8Iavks04voaUTqJ+Vl9
 Y5bzO1VvLUGt5plv6SBuCcT72au8JRqJkCzOo6HkeO0LQr+vcRzQsjDhjp+Ee8SG0qTPheizmKU
 0TJfjLktu63WalJCRrVZzCU+1gpl/0XmJeYcJTFMa4gc73iOj1ti8QNo+M2C67pTeogoU0oGdG4
 WxzEDWnA78jek0ClNVdiMobSYP1vLY41CWYw40xk/K0itdBpkt7bSaEhCMyA9+fcZCp9D2JSMVj
 0bcO0MT/NJKsr9JXz+hDY5J34rgjIVeyaxq/DcQMLSqetDCWfaeMx3n/2mfSb3KRGaKRBMmCtul
 SB/MHZ55LYgaF7/4n3qiJ3ynUBeWrpa7AMAmWd7UJaBkmTwzCmeU23k1mfjZZEfLhDSDgQUH6NP
 ZxZ9+5dFJqaM1Sus1mg==
X-Proofpoint-ORIG-GUID: yLV9X2bNlMKNYqdosbXZYqckpNzP1BU2
X-Proofpoint-GUID: yLV9X2bNlMKNYqdosbXZYqckpNzP1BU2
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE4MDA4NSBTYWx0ZWRfX8RBKBXLtzHwf
 E2gyHsR9XsVW2k+YDgOhXRMOKNvm65D92erQBxhyxA2b7+CZ0ljNP/KjoEAkYcgALbKu4AG1buY
 2MsYHjO4O4whidsJz0crYhIIj/2QJ68=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-18_07,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 malwarescore=0 priorityscore=1501
 lowpriorityscore=0 suspectscore=0 phishscore=0 spamscore=0 adultscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611180085

On Wed, 18 Nov 2026 18:39:16 +0000
Cristian Marussi <cristian.marussi@arm.com> wrote:

> On Wed, Nov 18, 2026 at 09:32:03AM -0800, Jonathan Cameron wrote:
> > On Wed, 18 Nov 2026 09:33:44 +0000
> > Sudeep Holla <sudeep.holla@kernel.org> wrote:
> >  =20
> > > On Tue, Nov 17, 2026 at 05:07:09PM -0800, Jonathan Cameron wrote: =20
> > > > On Mon,  9 Nov 2026 09:11:46 +0000
> > > > Cristian Marussi <cristian.marussi@arm.com> wrote:
> > > >    =20
> > > > > Hi all,
> > > > >=20
> > > > > [TLDR Summary]
> > > > >  [V15 highlights]
> > > > >  - general cleanup and hardening driven by reviews
> > > > >  - improved TDCF access routines to minimize lost samples under l=
oad
> > > > >  - completed ABI docs
> > > > >=20
> > > > >  [V16 TODO]
> > > > >   - address any remaining V15 outstanding Sashiko/reviewers issues
> > > > >=20
> > > > > The upcoming SCMI v4.0 specification [0] introduces a new SCMI pr=
otocol
> > > > > dedicated to System Telemetry.   =20
> > > >=20
> > > > This is one from the family of issues you find when reviewing ones =
own
> > > > (well LLM generated) emulation, realizing it doesn't match the spec,
> > > > and yet works.
> > > >=20
> > > > This works fine without the required SCMI protocol property in ACPI.
> > > > 2.2.2 of ACPI for System Control and Management Interface 1.0
> > > > Platform Design Document. 111115A 1.0
> > > >=20
> > > > Now, in here is an informative statement...
> > > >=20
> > > > Protocols not listed using a property may not be enumerate by the o=
perating system.
> > > >=20
> > > > But they are...=20
> > > >   =20
> > >=20
> > > Correct, I intentionally left that out. I do have a patch that restri=
cts it
> > > strictly to the listed property. However, I held off on pushing it be=
cause of
> > > an issue we saw on an internal test platform.
> > >=20
> > > On that platform, the firmware advertised the protocol to the OSPM vi=
a the
> > > base protocol, even though it wasn't functional at all. Once they rea=
lized
> > > this, they simply dropped the entry from the ACPI SCMI device as a wo=
rkaround
> > > instead of properly fixing the base protocol discovery. While underst=
andable,
> > > relying on that workaround delays proper firmware fixes.
> > >=20
> > > That is why I went with the non-mandatory "may not be" wording. I am =
happy to
> > > merge that restriction patch if a real production platform actually n=
eeds it,
> > > but until then, leaving it open helps catch and fix broken firmware
> > > implementations =F0=9F=98=84. =20
> >=20
> > You can't merge it safely as at a later date because chances are high
> > someone is relying on the current behavior and not presenting that
> > (currently pointless) package in ACPI for some protocol or other.
> >=20
> > I'm fine with a permanent decision not to check this but I don't see it
> > as a thing that can ever change (except maybe now whilst there are not
> > that many platforms out there using it!)
> >  =20
>=20
> Even though the change would be at the transport layer, given that it is
> NOT impacting the Base protocol, cant we anyway quirk it later on based o=
n FW
> vendor/version as an extrema ratio so as to support anyway older FW
> leveraging the current behaviour ? (not ideal I agree...and I have to
> double check what changes could be needed in the quirk framework..)

Quirking after a change is a pain because you only find out that it was
a problem when the regressions shouts start occurring.

I'd quirk the other way and paper over anyone who requires that record
to hid some firmware bug. Their stuff doesn't work today, so no regression!=
 :)
>=20
> Thanks,
> Cristian


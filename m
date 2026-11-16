Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794865010;
	b=GAkDGZ6KNS0967L6bgCIIeQ+uKHu5wtx5nXW11MpyTaWkIjoDveWLiSur9wVUxgDE0zJ
	 TTBuNzOyFYhNifvRxFLRw9xm2ATK5pHDQpNIWWRTouMNFUVSoSALx5CX1f7zTxJf0GTmC
	 jsyQTlSP/vcKwyY0QgfBegKJx8vfx4ZTfSaItJzcsC7pvnKAVWsGw7crKHifRZIJfWkis
	 MtaCwOFRq0fAs2G3EpsPArk0+FCXEYvL85rbZ2207L0PNeXK1G+rNjsj+Pw0pk/AkGcXt
	 dTT489PUR0WM9d+BVTmlG/tHKlUXVJlLDlLu3eFy0E/G2hPYzrI/gZzdk4dP0etFXYg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794865010;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:In-Reply-To:References:Organization:X-Mailer:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=/AgluZHo2ySEDAn6WZrinSTexthhU94/ezen/VxctZ8=;
	b=wfMAUnKd+v8DHh0oJHPSzVfllbXBIe9jaYZidjSC8jgv0BRVXzyndMEcU+YS5Bk1fYyA
	 ImRVDO/k9+um/O0ZFd7GbkyD/Th/iQ3CHq0GjdV0wUA8SIROu1dJs8hMAbC3CsvfWZY/6
	 Z6yzIdoRlGgtt+gSMzdb4UP0oZvPoSHztVpTr1KhNPNCEcSdalxp7t6H8JN8/6hSWRwNJ
	 GDVSjVIvFRwwBlcIQ4D1NQTr5rbOAFkgRX9BQJp4JmOAhNKAGHTmAV6op9K2LjlJRneNw
	 RnUkwle9DUO0pvNHEZF5owzkmTi2MGu1Mvx9JlLCMtKweIHMIL6ECbpWkKyU8tgexAA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ordM58WX;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=jWszpbxX;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B86D9606A33E
	for <arm-scmi@vger.kernel.org>; Mon, 16 Nov 2026 21:36:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B86D9606A33E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ordM58WX;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=jWszpbxX
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AGJfpYt4147360
	for <arm-scmi@vger.kernel.org>; Mon, 16 Nov 2026 21:36:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	/AgluZHo2ySEDAn6WZrinSTexthhU94/ezen/VxctZ8=; b=ordM58WX6OvSzfkH
	2RkoJdnWDDDt6VI11sOkEQF5+iUE6gXjTmj/e7hyGVkLUi8eLOI+pPSuSTwo5HdD
	aJXROrVTnBi34II790qMK2kASDD7rxYHchvesuu6n6N26reVA8TAPtA1lHcno2gR
	ney9S3uuALxlQnIPCQkf/D9Ybaa2ZedzaMcNMO9VQIq13Tovwl10iqgnQKIp8t8o
	Zjql9yIemvL6KZRJlmdjXayLGUTY9FrOYbCrejwtRyFTQnj4KcuEAvAS1MjH8rPs
	2mu+wJtmYNJ/T1fHFv8QTJVFGBJBasUG8487SnjpC7/uS/V7Tl+f5Q3QPUWdNqsk
	CRzOGw==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j01f826c0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <arm-scmi@vger.kernel.org>; Mon, 16 Nov 2026 21:36:47 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-36ecd5db581so4859308eec.0
        for <arm-scmi@vger.kernel.org>; Mon, 16 Nov 2026 13:36:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794865006; x=1795469806; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:organization
         :references:in-reply-to:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=/AgluZHo2ySEDAn6WZrinSTexthhU94/ezen/VxctZ8=;
        b=jWszpbxXSUdfSU3J2w+SRRJ40CdzDJqj2nGY5LIKP6JDO6SSsDkFE/hV+RQio/ydUY
         Wd9zrZg0zk1A/sCz5oxrZ7ywacCehw3VZq3SeU4nO4yiGxfllrwZn8LvJYETE/Dj3vqd
         1bOqYPvGxKVyBybMFf0rxdm0UDr7WOSQvltCpQIECmsBQHk27bbOenwhuB+JEQ60zgPR
         MMp6iWQd58l1dof+SRcgcB5YgT6OiNGFdYwE4w0RfanQ+9GQ9l+/P1C1s+DOJZjoBh0Y
         9bwz/5jNAjyaYT9ydzGyAwAKXE+ftCOktGBk9jkjo43VqcGsl0wKoaSXKn8BZv3lUBRk
         IJpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794865006; x=1795469806;
        h=content-transfer-encoding:content-type:mime-version:organization
         :references:in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/AgluZHo2ySEDAn6WZrinSTexthhU94/ezen/VxctZ8=;
        b=wz669m0ig6RIb0kS/aCgBqoBbVCsIj8nseCmALl3qm2cK2wHRRVtLSr46c5zg851nA
         F+9DAiLGwRjjCQhefyZWR0IGkvj2+hH5KpN6gEt2FEZx+VqjEa4FmKxYBGkl4AcuiGUI
         j+pw64stj4hS8DsW39d4qn6IhSfBZHQqKJALIJpnKOrlgBROlWPZXxcb8NmeeL2K43Dk
         8T2j6t/AFeKiz1RHN189h4gx6AvwG9pQNA4FwRYAvcpcVQy215Gua2VSH0Q5fAnPDEDD
         zccmxgdV2odw1n2o/Ccnc5yIwtTOTeQiZTurixQ7Ef1/1/up9c0jFlKo1ke5VUmRrvEI
         duVw==
X-Forwarded-Encrypted: i=1; AL+hErHzVGyXSpVaaGweUk36334CALJ26sV0sJXn14bj0f8HqM474T2MTEGJ+0eLrD9KOUQmXlU2m1S9Yw==@vger.kernel.org
X-Gm-Message-State: APuU4Z8bsYY1AJNf1OmYQ3+3z97Zd5ni6VVcIyUvMZf030uiq7bTVV68
	EJEHKcO1ozzNYihQtd5qZlykfXmy2qJp4SlnIIsCfEQaeFsxh2RaEfVkyezKKRQpUc3CHHJHsD+
	2f6k0YYNNdRR5oshj+nz8RozkL2cl6EMem+tto+QSbufciw9YfZJWvoFUD9anOg==
X-Gm-Gg: AZFdTZfiqfzK7JRe+KrJ3XZ2ReR7FHes7z9SiB9Vk9uZ8d+vi2myO/SdSUxx5iqFKTU
	RuOvItHdOzikoiwX9twDp87i7UHQWw+f2fudqpVTGLac70uqRZBHROYbre/TM/BuDtkn6DS7zJh
	8qqxwCSdHWWCWlArIh6j7rQocHESrEFobUH7CGMrlay728dhZM3ncaazGLTlbvVCw53DD7gGNYc
	Rg/NWwyLYK51ddk1xJSnY0uGQWfthk7w68X7kjtzWFY5kp6A5KU0qVJ3vNvqtmcDSduxrLAGplj
	QA1zuY6yTfjXp/a1GcCX+9RqUH4iUVXNWmgfRjIo/ACxGMCvxQhphex6MOyrRW0mwcMaiZNy4Km
	xhH7hfJgXb6We1Jw6ggn7b6HLp9HlSegEXXVxwD72QmwOgl5tCx/r2AfqtbGxcWz4wqqc+PO1JU
	Nsz3RXb42KT1nDglI=
X-Received: by 2002:a05:7300:e9c8:20b0:379:8c67:9b47 with SMTP id 5a478bee46e88-3798c679e38mr13306869eec.7.1794865005762;
        Mon, 16 Nov 2026 13:36:45 -0800 (PST)
X-Received: by 2002:a05:7300:e9c8:20b0:379:8c67:9b47 with SMTP id 5a478bee46e88-3798c679e38mr13306797eec.7.1794865004933;
        Mon, 16 Nov 2026 13:36:44 -0800 (PST)
Received: from localhost (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-38115cfdd6esm1111984eec.5.2026.11.16.13.36.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 13:36:44 -0800 (PST)
Date: Mon, 16 Nov 2026 13:36:38 -0800
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
Subject: Re: [PATCH v15 10/35] firmware: arm_scmi: Add Telemetry resources
 enumeration
Message-ID: <20261116133638.00006cc3@oss.qualcomm.com>
In-Reply-To: <avYZ2t_GoT7BN2nU@pluto>
References: <20261109091221.2532706-1-cristian.marussi@arm.com>
	<20261109091221.2532706-11-cristian.marussi@arm.com>
	<20261112100145.00000560@oss.qualcomm.com>
	<avYZ2t_GoT7BN2nU@pluto>
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
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE2MDA4NiBTYWx0ZWRfXwNpTULIm763i
 CRYRsTmIXdcmpnvSPzgM4mLKiJfFxPBOEBcEBBHg8rKAlEISTpO1mWZxbuHbU6acGHlQ7oSjGiP
 PjdoQH3bCc9SHW1R1sjgvpxXs5Numv9Xk+NTXzNqlvjaWd2W1L8WDGtEBejNOKmrI1Y9VjP8Hl7
 28GipNhl8BL6CXAp46T0ExQeMvDH3wmvSljo1V2NUsKcb++ictZSsERQofMnTaa/CTEnHhHJFpR
 n5BgbhpIc+I1w6bbhgawotEoFOkw+KhBUyl5Rnu+bjM3dBua7DJ/oVN0S4C+qDkkITYQhZyKENo
 OvYIqFG8yf7hRy/v5tpk1iruI8nrlB0XtQ16OLEn4MAt0c79UWPsFzu4O/YUuw7eKs5TWODDp+D
 8fSp0cxQlQV+mKrLktEe0uKEcnH1ld5zNupFPTgW3blM6N5MnZOCl4Ayhu3S5dEMshBte4IUl8v
 FgG2oMu5bXPnnj1SAtQ==
X-Proofpoint-GUID: quauvZNDBRcBz87a8qBNyi2jDAgER8cn
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE2MDA4NiBTYWx0ZWRfX571i2qjo2PnY
 ABH4EqJ2tIhM8gygCGbjmZ20uWECT8Oy4T/PFUfqCJnAyAo+BQUPN+y2sQABbhtcczNstfY+AQI
 c+6w7vmUCAzO6L4YdIjnjMxTL8NXDfY=
X-Proofpoint-ORIG-GUID: quauvZNDBRcBz87a8qBNyi2jDAgER8cn
X-Authority-Analysis: v=2.4 cv=VMpIDNPX c=1 sm=1 tr=0 ts=6afb776f cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=7CQSdrXTAAAA:8 a=EUspDBNiAAAA:8 a=xkoatq2HAAAA:8 a=p5E-qpGFH_M5T8BxAS8A:9
 a=CjuIK1q_8ugA:10 a=6Ab_bkdmUrQuMsNx7PHu:22 a=a-qgeE7W1pNrGK8U0ZQC:22
 a=CuNAHyPTimGbZf_9KV2F:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-16_06,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 suspectscore=0 impostorscore=0 bulkscore=0
 spamscore=0 adultscore=0 phishscore=0 clxscore=1015 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611160086

On Thu, 12 Nov 2026 19:56:10 +0000
Cristian Marussi <cristian.marussi@arm.com> wrote:

> On Thu, Nov 12, 2026 at 10:01:45AM -0800, Jonathan Cameron wrote:
> > On Mon,  9 Nov 2026 09:11:56 +0000
> > Cristian Marussi <cristian.marussi@arm.com> wrote:
> >  =20
> > > Add basic Telemetry allocation and initialization routines, introduci=
ng and
> > > wiring-up the logic needed to enumerate all the SCMI Telemetry resour=
ces
> > > optionally using a lazy on-demand scheme: this approach factors in the
> > > flexibility needed to minimize the amount of initialization work base=
d on
> > > the effective access pattern used by the upper layer ABI.
> > >=20
> > > Signed-off-by: Cristian Marussi <cristian.marussi@arm.com> =20
> >=20
> > Hi Cristian,
> >=20
> > This stretches across the patch set but first elements related to it are
> > in this patch.  How do we handle larger values of de_data_sz?
> >  =20
>=20
> We dont. This was somethig that was on my todo list initially, but then
> I realized that there was NO FW-side plan to actually implement anything
> larger than 64bit.

Understood, some set of firmware that you have isn't doing this. I don't
necessarily mind not supporting it initially but like the other features
it is very useful to have an implementation to make sure it doesn't break
the ABI. I don't want to go through a 'move to version 2 ABI if you want
this feature' path.

Let's just say I hit this for a reason. Whether that reason makes it into
a production firmware is an open question at the moment.

FWIW I have both QEMU based emulation (I'm working through the process to be
able to share that) and the changes to fit in via what I think is the
cleanest ABI change. Kernel / userspace change below.
I modified this from my original proposal to take into account the
desire to add it later (even if to me it smells like papering over a bug
rather than adding a feature!).  See below for what that required.
Not only shmti is tested.  The LLM found bugs in it's own fast channel
code, so take that with a pinch of salt!

>=20
> > The spec allows (and it's useful for things like histograms)
> > DEs to have an integer multiple of 64 bits for a single element.
> > In the shared memory buffer that just ends up with a bunch of matching
> > IDs with discovery via the parsing done in this patch. =20
>=20
> And I know that the spec allows it, but supporting this possible, but
> currently NON-implemented, feature would have added some non trivial
> complexity across all the stack to the benefit of no one.
>=20
> When someone will implement for real such big DE FW-side, the change
> will follow and of course there will need to be an ABI change.

My concern here is it might be a breaking ABI change. I'd like to
at least consider what it would be. It might be that we can just make
it a request time thing and add a flag to struct scmi_tlm_data_read that
says 'I know about multi word DE and have sized things appropriately
that would need to pair with version size change (always last resort
in my view as it means you designed your ABI badly) or a flag to indicate
support in the struct scmi_tlm_abi_info to say the kernel understands
the meaning of the bit in struct scmi_tlm_data_read.

>=20
> Given that I am currently in fact shedding a lot of already supported
> and tested features (groups/single_sample/notifs etc etc) to slim down
> the series dropping stuff that is indeed not implemented FW side (as we
> discussed), and would never be used, I would put this kind of support
> for big-data DEs in the same category of future possible work...

You are slimming down the series to a subset suitable for upstream.
That you are choosing a feature set that happens to fit with what you
have in firmware is your choice - I couldn't care less what you drop
as aim is to land the lot pretty soon anyway!

None of that should affect the ABI to make for problems later.  That's
why it is great that you have implemented a rich features set well beyond
what you need today.=20

>=20
> This remind me, though, that I wanted to place a check on de_data_sz
> so as to bailout with -ENOTSUPP when such data appears with the current
> implementation...

Ok. That would change a little what I have proposed below but
only the legacy paths.

>=20
> >=20
> > The only (I think) today to dump that from this patch set is
> > to use the shmti dump interface.  That's not exactly nice!
> >=20
> > I messed around with (well chatted with an LLM about) a couple of
> > options.
> >=20
> > 1. Make the whole stack aware of multi line DEs. So all the requests
> >    get to return more data.
> > 2. Adding indexing so you can get a multi line DE in multiple calls.
> >    That makes the interface for a bulk read a bit odd.  Userspace will
> >    have to be cleverer given variable sized elements.
> >=20
> > Given this is a ABI related aspect, needs figuring out sooner rather
> > than later I think.
> >  =20
>=20
> Talking about the ABI, since you mentioned in the other patches:
>=20
> As of now only the ABI_VERSION IOCTL is 'size-versioned' and there are
> flags to indicate supported features (both HW and ABI feats) AND fields
> with reserved spare space scattered all around IOCTLs so that it should
> be possible to add minor features using spare space and flags without
> changing ABI version, up to a certain point of course: if the changes
> are too radical a new ABI needs to be introduced and  ABI VERSION will
> be bumped.

Yup. I'm doing that, but the issue here is that it changes the meaning of
the data size.  Given old software has no reason to look for 'might be bigg=
er
than I expect' though I'm not sure it works in this case. You'd need
an opt in sent to the kernel for "I understand these" - before that don't
send them.

I'm dubious about the size ever really indicating a version.  If you go
truely incompatible just use a different IOCTL.  Until then flags + size
to allow for more space than extra reserved. Btw I personally think that
extra space is pointless as to add anything in there requires kernel and
userspace changes anyway, so why not change the size as well? (with appropr=
iate
fallbacks for under sized).

>=20
> This seemed an acceptable middle ground to me to avoid the complexity of
> having all the IOCTL structs 'size-versioned' and related flexibility that
> maybe is unneeded in this case...but I could be wrong (maybe the delayed
> future possible work to support >64bit DEs is a good reason to have an
> ABI that is more flexibile without the new of breaking changes...)
>=20
> Beside this I did not find really so many examples of ABIs using full
> per-IOCTL size versioning, and given my relative small experience on
> this and the lack of feedback till now (beside a lot of chats witth LLMs
> :P) I stick with this easier ABI layout.

For this sort of extensible ABI stuff don't just consider direct IOCTL inte=
rfaces.
Others such as fwctl have hit this exact question of how to make extensible
interfaces for stuff wrapped up in more complex IOCTL multiplexer style
interfaces.  It's particularly fun when the userspace is newer than the
kernel and hence sends it oversized data buffers. For those you need to=20
be careful to zero fill the extra size. That should always clear any valid
flags hiding in the bit you don't know about.

Anyhow, so code to satisfy the 'what does it look like'.

This is LLM generated so not tidied up as I was just wanting to get a feel =
for
what it looked like.  Not signed off as not in a state to actually apply
(needs breaking into kernel, userspace and test patches).

=46rom c2b6c80495759a62a65b692b54c93c830d95cc78 Mon Sep 17 00:00:00 2001
From: Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>
Date: Mon, 16 Nov 2026 11:09:02 -0800
Subject: [PATCH] firmware: arm_scmi: Support multi-word Telemetry Data
 Elements

A Data Element can span more than one 64-bit TDCF line (data_sz > 8),
but the sample ABI only ever handled a single word, silently exposing
word 0 of any wider DE.

Derive num_words =3D DIV_ROUND_UP(data_sz, 8) when parsing a DE
descriptor, and repurpose scmi_tlm_de_sample's previously-unused pad
field as an index selecting which word of a DE to read.

SCMI_TLM_DE_READ and SCMI_TLM_BATCH_READ take this index as an
explicit, caller-supplied field alongside the DE id. Legacy callers
always left pad zeroed, so index 0 reproduces the old single-word
behaviour and both ioctls stay backward compatible by construction.

SCMI_TLM_BULK_READ/SCMI_TLM_SINGLE_READ are different: they implicitly
read every enabled DE (or group), with no per-DE index to set. Default
them to one sample per enabled DE at index 0, matching pre-existing
behaviour, and add a SCMI_TLM_READ_MULTIWORD flag to
scmi_tlm_data_read.flags that callers must set to get one sample per
word instead. Report support for the flag via a new
SCMI_TLM_ABI_FEAT_MULTIWORD_READ bit in scmi_tlm_abi_info.abi_features.

The ioctl capacity bound used for both the -E2BIG guard and the
zero-query auto-size idiom is sized accordingly.

Signed-off-by: Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>
---
 .../firmware/arm_scmi/scmi_system_telemetry.c |  59 +++-
 drivers/firmware/arm_scmi/telemetry.c         | 302 +++++++++++++-----
 include/linux/scmi_protocol.h                 |  16 +-
 include/uapi/linux/scmi.h                     |  38 ++-
 tools/testing/scmi/stlm.c                     | 169 +++++++---
 .../arm64/scmi/test_scmi_telemetry_uapi.c     |  82 +++++
 6 files changed, 524 insertions(+), 142 deletions(-)

diff --git a/drivers/firmware/arm_scmi/scmi_system_telemetry.c b/drivers/fi=
rmware/arm_scmi/scmi_system_telemetry.c
index 185c8e646628..2ae58bdf85da 100644
--- a/drivers/firmware/arm_scmi/scmi_system_telemetry.c
+++ b/drivers/firmware/arm_scmi/scmi_system_telemetry.c
@@ -49,8 +49,8 @@
 			 "UAPI DE sample mismatch !");			  \
 	ASSERT_STRUCT_OFFSET(struct scmi_telemetry_de_sample, id,	  \
 			     offsetof(struct scmi_tlm_de_sample, id));	  \
-	ASSERT_STRUCT_OFFSET(struct scmi_telemetry_de_sample, pad,	  \
-			     offsetof(struct scmi_tlm_de_sample, pad));	  \
+	ASSERT_STRUCT_OFFSET(struct scmi_telemetry_de_sample, index,	  \
+			     offsetof(struct scmi_tlm_de_sample, index));	  \
 	ASSERT_STRUCT_OFFSET(struct scmi_telemetry_de_sample, tstamp,	  \
 			     offsetof(struct scmi_tlm_de_sample, tstamp));\
 	ASSERT_STRUCT_OFFSET(struct scmi_telemetry_de_sample, val,	  \
@@ -136,7 +136,8 @@ static inline void scmi_tlm_to_uapi_abi_info(struct scm=
i_tlm_abi_info *out,
 	out->abi_version =3D SCMI_TLM_CURRENT_ABI_VERSION;
 	out->abi_features =3D SCMI_TLM_ABI_FEAT_RESET |
 		SCMI_TLM_ABI_FEAT_UUID_LIST | SCMI_TLM_ABI_FEAT_BATCH_STATE |
-		SCMI_TLM_ABI_FEAT_BATCHED_CFG | SCMI_TLM_ABI_FEAT_DE_TRACKING;
+		SCMI_TLM_ABI_FEAT_BATCHED_CFG | SCMI_TLM_ABI_FEAT_DE_TRACKING |
+		SCMI_TLM_ABI_FEAT_MULTIWORD_READ;
 	if (IS_ENABLED(CONFIG_EVENTFD))
 		out->abi_features |=3D SCMI_TLM_ABI_FEAT_EVENT;
 	export_uuid(out->primary_de_impl_version, &in->base.primary_revision);
@@ -764,9 +765,6 @@ scmi_tlm_de_value_get_ioctl(const struct scmi_tlm_insta=
nce *ti, unsigned long ar
 	if (copy_from_user(&sample, uptr, sizeof(sample)))
 		return -EFAULT;
=20
-	if (sample.pad)
-		return -EINVAL;
-
 	ret =3D tsp->ops->de_data_read(tsp->ph,
 				     (struct scmi_telemetry_de_sample *)&sample);
 	if (ret)
@@ -871,6 +869,31 @@ scmi_tlm_grps_list_get_ioctl(const struct scmi_tlm_ins=
tance *ti, unsigned long a
 	return scmi_tlm_batch_finalize(uptr, &batch, ginfo, NULL, batch_sz, 0);
 }
=20
+/*
+ * Upper bound on the number of samples a bulk/single read can produce.
+ * Mirrors the enabled/group filtering done by
+ * scmi_telemetry_samples_collect(), but is only ever used as a capacity
+ * bound, so disabled DEs are harmlessly included too.
+ */
+static unsigned int
+scmi_tlm_des_num_words_sum(const struct scmi_telemetry_res_info *rinfo,
+			   unsigned int grp_id, bool multiword)
+{
+	unsigned int sum =3D 0;
+
+	for (int i =3D 0; i < rinfo->num_des; i++) {
+		const struct scmi_telemetry_de *de =3D rinfo->des[i];
+
+		if (grp_id !=3D SCMI_TLM_GRP_INVALID &&
+		    (!de->grp || de->grp->info->grp_id !=3D grp_id))
+			continue;
+
+		sum +=3D multiword ? de->info->num_words : 1;
+	}
+
+	return sum;
+}
+
 static long scmi_tlm_des_read_ioctl(const struct scmi_tlm_instance *ti,
 				    unsigned long arg, bool single)
 {
@@ -879,6 +902,7 @@ static long scmi_tlm_des_read_ioctl(const struct scmi_t=
lm_instance *ti,
 	struct scmi_tlm_setup *tsp =3D ti->tsp;
 	struct scmi_tlm_data_read bulk;
 	unsigned int grp_id;
+	bool multiword;
 	int ret;
=20
 	if (copy_from_user(&bulk, uptr, sizeof(bulk)))
@@ -888,10 +912,10 @@ static long scmi_tlm_des_read_ioctl(const struct scmi=
_tlm_instance *ti,
 	    bulk.flags & ~SCMI_TLM_READ_FLAGS)
 		return -EINVAL;
=20
+	multiword =3D SCMI_TLM_READ_IS_MULTIWORD(bulk.flags);
+
 	/* Check that a reasonably sized buffer has been requested */
 	rinfo =3D scmi_telemetry_res_info_get(tsp);
-	if (bulk.num_samples > rinfo->num_des)
-		return -E2BIG;
=20
 	if (!SCMI_TLM_READ_IS_GROUP(bulk.flags)) {
 		grp_id =3D SCMI_TLM_GRP_INVALID;
@@ -902,12 +926,12 @@ static long scmi_tlm_des_read_ioctl(const struct scmi=
_tlm_instance *ti,
 		grp_id =3D bulk.grp_id;
 	}
=20
+	if (bulk.num_samples > scmi_tlm_des_num_words_sum(rinfo, grp_id, multiwor=
d))
+		return -E2BIG;
+
 	/* Return max samples on zero-query */
 	if (!bulk.num_samples) {
-		if (!SCMI_TLM_READ_IS_GROUP(bulk.flags))
-			bulk.num_samples =3D rinfo->num_des;
-		else
-			bulk.num_samples =3D rinfo->grps[grp_id].info->num_des;
+		bulk.num_samples =3D scmi_tlm_des_num_words_sum(rinfo, grp_id, multiword=
);
=20
 		if (copy_to_user(uptr, &bulk, sizeof(bulk)))
 			return -EFAULT;
@@ -921,10 +945,10 @@ static long scmi_tlm_des_read_ioctl(const struct scmi=
_tlm_instance *ti,
 		return -ENOMEM;
=20
 	if (!single)
-		ret =3D tsp->ops->des_bulk_read(tsp->ph, grp_id,
+		ret =3D tsp->ops->des_bulk_read(tsp->ph, grp_id, multiword,
 					      &bulk.num_samples, samples);
 	else
-		ret =3D tsp->ops->des_sample_get(tsp->ph, grp_id,
+		ret =3D tsp->ops->des_sample_get(tsp->ph, grp_id, multiword,
 					       &bulk.num_samples, samples);
 	if (ret)
 		return ret;
@@ -948,10 +972,13 @@ static long scmi_tlm_des_batch_read_ioctl(const struc=
t scmi_tlm_instance *ti,
 	void __user *uptr =3D (void __user *)arg;
 	struct scmi_tlm_batch batch =3D {};
 	size_t batch_sz, states_sz;
+	unsigned int max_items;
=20
 	rinfo =3D scmi_telemetry_res_info_get(ti->tsp);
+
+	max_items =3D scmi_tlm_des_num_words_sum(rinfo, SCMI_TLM_GRP_INVALID, tru=
e);
 	ret =3D scmi_tlm_batch_initialize(uptr, &batch, sizeof(*samples),
-					rinfo->num_des, (void **)&samples,
+					max_items, (void **)&samples,
 					&batch_sz, &states, &states_sz);
 	if (ret)
 		return ret;
@@ -971,7 +998,7 @@ static long scmi_tlm_des_batch_read_ioctl(const struct =
scmi_tlm_instance *ti,
=20
 	/* Return max batch size on zero query */
 	if (!batch.num_items)
-		batch.num_items =3D rinfo->num_des;
+		batch.num_items =3D max_items;
=20
 	return scmi_tlm_batch_finalize(uptr, &batch, samples, states, batch_sz,
 				       states_sz);
diff --git a/drivers/firmware/arm_scmi/telemetry.c b/drivers/firmware/arm_s=
cmi/telemetry.c
index 7582fe295a23..6a27cefe9f9b 100644
--- a/drivers/firmware/arm_scmi/telemetry.c
+++ b/drivers/firmware/arm_scmi/telemetry.c
@@ -21,6 +21,7 @@
 #include <linux/io.h>
 #include <linux/limits.h>
 #include <linux/lockdep.h>
+#include <linux/math.h>
 #include <linux/minmax.h>
 #include <linux/module.h>
 #include <linux/mutex.h>
@@ -551,9 +552,10 @@ struct telemetry_de {
 	u32 offset;
 	/* NOTE THAT DE data_sz is registered in scmi_telemetry_de */
 	u32 fc_size;
-	u64 last_val;
-	u64 last_ts;
-	u32 last_magic;
+	/* Cached value/tstamp/magic per-word, sized to de.info->num_words */
+	u64 *last_val;
+	u64 *last_ts;
+	u32 *last_magic;
 	struct list_head item;
 	struct telemetry_block_ts *bts;
 #define BLK_TS_CHANGED(t, s, o)			\
@@ -571,6 +573,47 @@ static inline bool scmi_tde_has_tstamp(struct telemetr=
y_de *t)
 	return t->de.tstamp_support && t->de.tstamp_enabled;
 }
=20
+/*
+ * Continuation lines of a multi-word DE share the same Line-Metadata
+ * as the first line, so have a consistent per-line stride.
+ */
+static inline size_t scmi_telemetry_tde_word_stride(struct telemetry_de *t=
de)
+{
+	return IS_TDE_TS_LINE(tde) ? EXT_LINE_DATA_PAYLD_WORDS * sizeof(u32) :
+				      LINE_DATA_PAYLD_WORDS * sizeof(u32);
+}
+
+/*
+ * Derive which word of a multi-word DE a line at @de_offs belongs to,
+ * given the DE is already known to be located at @shmti/tde->offset.
+ * Returns false if @de_offs does not match a word of the DE at its
+ * current location.
+ */
+static inline bool
+scmi_telemetry_tde_word_idx_from_offset(struct telemetry_de *tde,
+					struct telemetry_shmti *shmti,
+					u32 de_offs, u32 *word_idx)
+{
+	size_t stride;
+	u32 delta;
+
+	if (tde->sid !=3D shmti->info.sid || tde->base !=3D shmti->base ||
+	    tde->de.info->num_words <=3D 1 || de_offs < tde->offset)
+		return false;
+
+	stride =3D scmi_telemetry_tde_word_stride(tde);
+	if (!stride)
+		return false;
+
+	delta =3D de_offs - tde->offset;
+	if (delta % stride || delta / stride >=3D tde->de.info->num_words)
+		return false;
+
+	*word_idx =3D delta / stride;
+
+	return true;
+}
+
 #define DE_ENABLED_WITH_TSTAMP	2
=20
 enum de_state {
@@ -706,6 +749,10 @@ static void scmi_telemetry_free_tde_put(struct telemet=
ry_info *ti,
 	if (tde->de.fc_support && tde->base)
 		iounmap(tde->base);
=20
+	kfree(tde->last_val);
+	kfree(tde->last_ts);
+	kfree(tde->last_magic);
+
 	/* Save clear and restore */
 	info =3D tde->de.info;
 	memset(info, 0, sizeof(*info));
@@ -779,12 +826,12 @@ static int scmi_telemetry_tde_register(struct telemet=
ry_info *ti,
 }
=20
 static inline bool
-scmi_telemetry_tde_cache_stale(struct telemetry_de *tde, u32 magic)
+scmi_telemetry_tde_cache_stale(struct telemetry_de *tde, u32 index, u32 ma=
gic)
 {
 	lockdep_assert_held(&tde->mtx);
=20
-	/* last_magic < magic */
-	return time_before32(tde->last_magic, magic);
+	/* last_magic[index] < magic */
+	return time_before32(tde->last_magic[index], magic);
 }
=20
 static void
@@ -794,21 +841,24 @@ scmi_telemetry_tde_cache_update(struct telemetry_de *=
tde,
 {
 	lockdep_assert_held(&tde->mtx);
=20
+	if (sample->index >=3D tde->de.info->num_words)
+		return;
+
 	/*
 	 * Update the cache only if stale compared to the current
-	 * sample, so bail-out when last_magic >=3D *magic
+	 * sample, so bail-out when last_magic[index] >=3D *magic
 	 */
-	if (magic && !scmi_telemetry_tde_cache_stale(tde, *magic))
+	if (magic && !scmi_telemetry_tde_cache_stale(tde, sample->index, *magic))
 		return;
=20
-	tde->last_magic =3D magic ? *magic : TDCF_BAD_END_SEQ;
-	tde->last_val =3D sample->val;
-	tde->last_ts =3D scmi_tde_has_tstamp(tde) ? sample->tstamp : 0;
+	tde->last_magic[sample->index] =3D magic ? *magic : TDCF_BAD_END_SEQ;
+	tde->last_val[sample->index] =3D sample->val;
+	tde->last_ts[sample->index] =3D scmi_tde_has_tstamp(tde) ? sample->tstamp=
 : 0;
 	/* Update returned value too */
-	sample->tstamp =3D tde->last_ts;
+	sample->tstamp =3D tde->last_ts[sample->index];
=20
-	trace_scmi_tlm_collect(tde->last_ts, tde->de.info->id,
-			       tde->last_val, "CACHED_DE_UPDATED");
+	trace_scmi_tlm_collect(tde->last_ts[sample->index], tde->de.info->id,
+			       tde->last_val[sample->index], "CACHED_DE_UPDATED");
 }
=20
 static int
@@ -818,16 +868,19 @@ scmi_telemetry_tde_cache_lookup(struct telemetry_de *=
tde,
 {
 	lockdep_assert_held(&tde->mtx);
=20
+	if (sample->index >=3D tde->de.info->num_words)
+		return -EINVAL;
+
 	/*
 	 * Bailout without providing any sample when the cache is
-	 * stale, i.e. last_magic < *magic
+	 * stale, i.e. last_magic[index] < *magic
 	 */
-	if (magic && scmi_telemetry_tde_cache_stale(tde, *magic))
+	if (magic && scmi_telemetry_tde_cache_stale(tde, sample->index, *magic))
 		return -EAGAIN;
=20
 	sample->id =3D tde->de.info->id;
-	sample->val =3D tde->last_val;
-	sample->tstamp =3D tde->last_ts;
+	sample->val =3D tde->last_val[sample->index];
+	sample->tstamp =3D tde->last_ts[sample->index];
=20
 	trace_scmi_tlm_collect(sample->tstamp, sample->id,
 			       sample->val, "CACHED_DE_READ");
@@ -1013,6 +1066,18 @@ static int scmi_telemetry_de_descriptor_parse(struct=
 telemetry_info *ti,
=20
 	tde->de.info->grp_id =3D grp_id;
 	tde->de.info->data_sz =3D le32_to_cpu(desc->de_data_sz);
+	/* A DE spans ceil(data_sz / 8) consecutive 64-bit words/lines. */
+	tde->de.info->num_words =3D DIV_ROUND_UP(tde->de.info->data_sz, 8);
+
+	kfree(tde->last_val);
+	kfree(tde->last_ts);
+	kfree(tde->last_magic);
+	tde->last_val =3D kzalloc_objs(*tde->last_val, tde->de.info->num_words);
+	tde->last_ts =3D kzalloc_objs(*tde->last_ts, tde->de.info->num_words);
+	tde->last_magic =3D kzalloc_objs(*tde->last_magic, tde->de.info->num_word=
s);
+	if (!tde->last_val || !tde->last_ts || !tde->last_magic)
+		return -ENOMEM;
+
 	tde->de.info->type =3D GET_DE_TYPE(desc);
 	tde->de.info->unit =3D GET_DE_UNIT(desc);
 	tde->de.info->unit_exp =3D GET_DE_UNIT_EXP(desc);
@@ -1297,6 +1362,15 @@ iter_enabled_list_process_response(const struct scmi=
_protocol_handle *ph,
 	 * ONLY be discovered later by  DE_DESCRIPTION.
 	 */
 	tde->de.tstamp_support =3D tde->de.tstamp_enabled;
+	/* Assume single-word till the real DE descriptor is parsed */
+	tde->de.info->num_words =3D 1;
+	tde->last_val =3D kzalloc_obj(*tde->last_val);
+	tde->last_ts =3D kzalloc_obj(*tde->last_ts);
+	tde->last_magic =3D kzalloc_obj(*tde->last_magic);
+	if (!tde->last_val || !tde->last_ts || !tde->last_magic) {
+		scmi_telemetry_free_tde_put(ti, tde);
+		return -ENOMEM;
+	}
=20
 	ret =3D scmi_telemetry_tde_register(ti, tde);
 	if (ret) {
@@ -2510,6 +2584,15 @@ scmi_telemetry_tde_allocate(struct telemetry_info *t=
i, u32 de_id,
 	tde->de.tstamp_enabled =3D LINE_TS_VALID_RAW(meta) || USE_BLK_TS_RAW(meta=
);
 	/* An approximation till the real DE discovery is performed */
 	tde->de.tstamp_support =3D tde->de.tstamp_enabled;
+	/* Assume single-word till the real DE descriptor is parsed */
+	tde->de.info->num_words =3D 1;
+	tde->last_val =3D kzalloc_obj(*tde->last_val);
+	tde->last_ts =3D kzalloc_obj(*tde->last_ts);
+	tde->last_magic =3D kzalloc_obj(*tde->last_magic);
+	if (!tde->last_val || !tde->last_ts || !tde->last_magic) {
+		scmi_telemetry_free_tde_put(ti, tde);
+		return NULL;
+	}
=20
 	if (scmi_telemetry_tde_register(ti, tde)) {
 		scmi_telemetry_free_tde_put(ti, tde);
@@ -2687,9 +2770,11 @@ static void scmi_telemetry_tdcf_data_parse(struct te=
lemetry_info *ti,
 	u32 meta =3D PAYLD_META_RAW(payld);
 	bool use_blk_ts =3D USE_BLK_TS_RAW(meta);
 	struct telemetry_de *tde;
-	u32 de_id;
+	u32 de_id, de_offs, word_idx =3D 0;
=20
 	de_id =3D PAYLD_ID_RAW(payld);
+	/* Offset is the same in the SHMTI and in the snapshot indeed */
+	de_offs =3D (void __iomem *)payld - (void __iomem *)snap->base;
 	/* Discard malformed lines...a preceding BLK_TS must exist */
 	if (use_blk_ts && !active_bts) {
 		trace_scmi_tlm_access(de_id, "BAD_USE_BLK_TS", 0, 0);
@@ -2721,49 +2806,57 @@ static void scmi_telemetry_tdcf_data_parse(struct t=
elemetry_info *ti,
 	 * original SHMTI device-memory area, NOT to the snapshot we are parsing.
 	 */
 	if (mode >=3D SCAN_UPDATE) {
-		u32 de_offs;
 		void __iomem *p;
=20
-		/* Offest is the same in the SHMTI and in the snapshot indeed */
-		de_offs =3D (void __iomem *)payld - (void __iomem *)snap->base;
-		/* Validate location before update */
-		p =3D scmi_telemetry_payld_offset_safe_calc(shmti, de_offs);
-		if (IS_ERR(p)) {
-			dev_err(ti->ph->dev,
-				"TDE 0x%08X updated location invalid - shmti:%u offs:%u\n",
-				de_id, shmti->info.sid, de_offs);
-			trace_scmi_tlm_access(de_id, "DE_LOCATION_INVALID", 0, 0);
-			return;
-		}
+		/*
+		 * A line matching an already-known word stride from the DE's
+		 * current location is a continuation word, not a relocation.
+		 */
+		if (!scmi_telemetry_tde_word_idx_from_offset(tde, shmti, de_offs,
+							     &word_idx)) {
+			/* Validate location before update */
+			p =3D scmi_telemetry_payld_offset_safe_calc(shmti, de_offs);
+			if (IS_ERR(p)) {
+				dev_err(ti->ph->dev,
+					"TDE 0x%08X updated location invalid - shmti:%u offs:%u\n",
+					de_id, shmti->info.sid, de_offs);
+				trace_scmi_tlm_access(de_id, "DE_LOCATION_INVALID", 0, 0);
+				return;
+			}
=20
-		tde->sid =3D shmti->info.sid;
-		tde->base =3D shmti->base;
-		tde->eplg =3D SHMTI_EPLG(shmti);
-		tde->offset =3D de_offs;
+			tde->sid =3D shmti->info.sid;
+			tde->base =3D shmti->base;
+			tde->eplg =3D SHMTI_EPLG(shmti);
+			tde->offset =3D de_offs;
+			word_idx =3D 0;
=20
-		trace_scmi_tlm_access(de_id, "DE_LOCATION_UPDATED", 0, 0);
+			trace_scmi_tlm_access(de_id, "DE_LOCATION_UPDATED", 0, 0);
=20
-		/* Just in case it was passively discovered boot-on */
-		if (IS_TDE_TS_NONE(tde)) {
-			if (use_blk_ts)
-				tde->ts_type =3D TSTAMP_BLK;
-			else if (LINE_TS_VALID_RAW(meta))
-				tde->ts_type =3D TSTAMP_LINE;
-		}
+			/* Just in case it was passively discovered boot-on */
+			if (IS_TDE_TS_NONE(tde)) {
+				if (use_blk_ts)
+					tde->ts_type =3D TSTAMP_BLK;
+				else if (LINE_TS_VALID_RAW(meta))
+					tde->ts_type =3D TSTAMP_LINE;
+			}
=20
-		dev_dbg(ti->ph->dev,
-			"TDCF-updated DE_ID:0x%08X - shmti:%pK  offset:%u  ts_type:%d\n",
-			tde->de.info->id, tde->base, tde->offset, tde->ts_type);
+			dev_dbg(ti->ph->dev,
+				"TDCF-updated DE_ID:0x%08X - shmti:%pK  offset:%u  ts_type:%d\n",
+				tde->de.info->id, tde->base, tde->offset, tde->ts_type);
+		}
+	} else {
+		/* Not allowed to relocate: match against the known location only */
+		scmi_telemetry_tde_word_idx_from_offset(tde, shmti, de_offs, &word_idx);
 	}
=20
 	/*
-	 * Has any value/tstamp really changed ?
-	 * Note that, if the magic currently associated with this TDE has
+	 * Has this specific word really changed ?
+	 * Note that, if the magic currently associated with this TDE word has
 	 * NOT changed compared to the current SHMTI magic, nothing could have
 	 * been changed across the whole TDCF, including any relation to
 	 * BLK_TS or UUID lines.
 	 */
-	if (!scmi_telemetry_tde_cache_stale(tde, snap->magic))
+	if (!scmi_telemetry_tde_cache_stale(tde, word_idx, snap->magic))
 		return;
=20
 	/*
@@ -2782,6 +2875,7 @@ static void scmi_telemetry_tdcf_data_parse(struct tel=
emetry_info *ti,
 	 * Parse data words ... only for the sake of updating TDE cache,
 	 * any error is logged by ignored.
 	 */
+	sample.index =3D word_idx;
 	scmi_telemetry_line_data_parse(tde, snap, &sample, payld, NULL, snap->mag=
ic);
 }
=20
@@ -3847,7 +3941,8 @@ static inline int
 scmi_telemetry_de_data_fc_read(struct telemetry_de *tde,
 			       struct scmi_telemetry_de_sample *sample)
 {
-	struct fc_tsline __iomem *fc;
+	struct line __iomem *word;
+	size_t word_off, valid;
=20
 	lockdep_assert_held(&tde->mtx);
=20
@@ -3858,9 +3953,34 @@ scmi_telemetry_de_data_fc_read(struct telemetry_de *=
tde,
 	if (!tde->base)
 		return -EPROTO;
=20
-	fc =3D tde->base + tde->offset;
-	sample->val =3D LINE_DATA_GET(fc);
-	sample->tstamp =3D IS_TDE_TS_LINE(tde) ? LINE_TSTAMP_GET(fc) : 0;
+	if (sample->index >=3D tde->de.info->num_words)
+		return -EINVAL;
+
+	/*
+	 * Words are packed data_low/data_high pairs, one per 64-bit word,
+	 * but the FastChannel layout has no padding to a word boundary: if
+	 * data_sz is not a multiple of 8, the last word only has a valid
+	 * data_low, with the bytes beyond data_sz belonging to the trailing
+	 * timestamp (or to nothing, if untimestamped).
+	 */
+	word_off =3D sample->index * sizeof(*word);
+	word =3D tde->base + tde->offset + word_off;
+	valid =3D tde->de.info->data_sz - word_off;
+	sample->val =3D valid >=3D sizeof(*word) ?
+		LINE_DATA_GET(word) : _I(&word->data_low);
+
+	/*
+	 * The optional timestamp, when present, trails the whole multi-word
+	 * data block and is only meaningful once, for word 0.
+	 */
+	if (sample->index =3D=3D 0 && IS_TDE_TS_LINE(tde)) {
+		struct blk_tsline __iomem *ts;
+
+		ts =3D tde->base + tde->offset + tde->de.info->data_sz;
+		sample->tstamp =3D LINE_TSTAMP_GET(ts);
+	} else {
+		sample->tstamp =3D 0;
+	}
=20
 	/* Trace originally read tstamp */
 	trace_scmi_tlm_collect(sample->tstamp, tde->de.info->id, sample->val,
@@ -4004,7 +4124,8 @@ static int scmi_telemetry_tdcf_de_payld_check(struct =
telemetry_de *tde,
=20
 static int scmi_telemetry_de_snapshot(struct tdcf __iomem *tdcf,
 				      struct telemetry_de *tde,
-				      struct telemetry_de_snapshot *snap)
+				      struct telemetry_de_snapshot *snap,
+				      u32 index)
 {
 	int retries =3D SCMI_TLM_TDCF_MAX_RETRIES;
 	u32 startm, endm;
@@ -4012,6 +4133,9 @@ static int scmi_telemetry_de_snapshot(struct tdcf __i=
omem *tdcf,
=20
 	lockdep_assert_held(&tde->mtx);
=20
+	if (index >=3D tde->de.info->num_words)
+		return -EINVAL;
+
 	do {
 		struct payload __iomem *payld, *bts_payld;
=20
@@ -4035,7 +4159,8 @@ static int scmi_telemetry_de_snapshot(struct tdcf __i=
omem *tdcf,
 		 * initialized and cannot have changed: accessing them here
 		 * is safe.
 		 */
-		payld =3D tde->base + tde->offset;
+		payld =3D tde->base + tde->offset +
+			index * scmi_telemetry_tde_word_stride(tde);
 		memcpy_fromio(&snap->payld, payld, LINE_LENGTH_BYTES(payld));
 		err =3D scmi_telemetry_tdcf_de_payld_check(tde, &snap->payld);
 		if (err)
@@ -4143,7 +4268,7 @@ scmi_telemetry_tdcf_de_parse(struct telemetry_de *tde,
 		return 0;
=20
 	/* Attempt a localized DE snapshot: DATA_LINE + optionally BLK_TS */
-	ret =3D scmi_telemetry_de_snapshot(tdcf, tde, &snap);
+	ret =3D scmi_telemetry_de_snapshot(tdcf, tde, &snap, sample->index);
 	if (ret)
 		return ret;
=20
@@ -4203,7 +4328,7 @@ static int scmi_telemetry_de_data_read(const struct s=
cmi_protocol_handle *ph,
=20
 static int
 scmi_telemetry_samples_collect(struct telemetry_info *ti, int grp_id,
-			       unsigned int *num_samples,
+			       bool multiword, unsigned int *num_samples,
 			       struct scmi_telemetry_de_sample *samples)
 {
 	struct scmi_telemetry_res_info *rinfo;
@@ -4215,6 +4340,7 @@ scmi_telemetry_samples_collect(struct telemetry_info =
*ti, int grp_id,
 	rinfo =3D ti->res_get(ti);
 	for (int i =3D 0; i < rinfo->num_des; i++) {
 		struct telemetry_de *tde =3D to_tde(rinfo->des[i]);
+		u32 num_widx;
=20
 		guard(mutex)(&tde->mtx);
=20
@@ -4224,19 +4350,31 @@ scmi_telemetry_samples_collect(struct telemetry_inf=
o *ti, int grp_id,
 		     (!tde->de.grp || tde->de.grp->info->grp_id !=3D grp_id)))
 			continue;
=20
-		/* Must be checked here to skip disabled and non selected */
-		if (*num_samples =3D=3D max_samples)
-			return -ENOSPC;
-
-		/* Note that this cannot fail when passing a NULL magic */
-		scmi_telemetry_tde_cache_lookup(tde, &samples[(*num_samples)++], NULL);
+		/*
+		 * A multi-word DE expands into one entry per word only when
+		 * the caller opted in via @multiword; otherwise every DE
+		 * contributes exactly one legacy entry at index 0, matching
+		 * pre-multi-word-DE behavior.
+		 */
+		num_widx =3D multiword ? tde->de.info->num_words : 1;
+		for (u32 widx =3D 0; widx < num_widx; widx++) {
+			/* Must be checked here to skip disabled and non selected */
+			if (*num_samples =3D=3D max_samples)
+				return -ENOSPC;
+
+			samples[*num_samples].index =3D widx;
+			/* Note that this cannot fail when passing a NULL magic */
+			scmi_telemetry_tde_cache_lookup(tde, &samples[(*num_samples)++],
+							NULL);
+		}
 	}
=20
 	return 0;
 }
=20
 static int scmi_telemetry_des_bulk_read(const struct scmi_protocol_handle =
*ph,
-					int grp_id, unsigned int *num_samples,
+					int grp_id, bool multiword,
+					unsigned int *num_samples,
 					struct scmi_telemetry_de_sample *samples)
 {
 	struct telemetry_info *ti =3D ph->get_priv(ph);
@@ -4248,7 +4386,8 @@ static int scmi_telemetry_des_bulk_read(const struct =
scmi_protocol_handle *ph,
 	scmi_telemetry_scan_update(ti);
=20
 	/* Collect all last cached values */
-	return scmi_telemetry_samples_collect(ti, grp_id, num_samples, samples);
+	return scmi_telemetry_samples_collect(ti, grp_id, multiword, num_samples,
+					      samples);
 }
=20
 static void
@@ -4257,7 +4396,8 @@ scmi_telemetry_msg_payld_process(struct telemetry_inf=
o *ti,
 				 size_t payld_bytes, bool cacheable)
 {
 	struct scmi_telemetry_res_info *rinfo;
-	u32 next =3D 0;
+	u32 next =3D 0, prev_de_id =3D 0, word_idx =3D 0;
+	bool have_prev =3D false;
=20
 	rinfo =3D ti->res_get(ti);
 	if (!rinfo->fully_enumerated) {
@@ -4283,6 +4423,14 @@ scmi_telemetry_msg_payld_process(struct telemetry_in=
fo *ti,
 		}
=20
 		de_id =3D le32_to_cpu(payld->id);
+		/*
+		 * Consecutive lines carrying the same id are continuation
+		 * words of the same multi-word DE, in wire order.
+		 */
+		word_idx =3D (have_prev && de_id =3D=3D prev_de_id) ? word_idx + 1 : 0;
+		prev_de_id =3D de_id;
+		have_prev =3D true;
+
 		if (DATA_INVALID_RAW(meta)) {
 			trace_scmi_tlm_access(de_id, "MSG_INVALID", 0, 0);
 			continue;
@@ -4311,7 +4459,13 @@ scmi_telemetry_msg_payld_process(struct telemetry_in=
fo *ti,
 			continue;
 		}
=20
+		if (word_idx >=3D tde->de.info->num_words) {
+			trace_scmi_tlm_access(de_id, "MSG_EXTRA_WORD", word_idx, 0);
+			continue;
+		}
+
 		tde->cached_msg =3D cacheable;
+		sample.index =3D word_idx;
 		sample.val =3D LINE_DATA_GET_RAW(&payld->tsl);
 		sample.tstamp =3D HAS_LINE_EXT_RAW(meta) &&
 			LINE_TS_VALID_RAW(meta) ? LINE_TSTAMP_GET_RAW(&payld->tsl) : 0;
@@ -4329,7 +4483,8 @@ scmi_telemetry_msg_payld_process(struct telemetry_inf=
o *ti,
 }
=20
 static int scmi_telemetry_des_sample_get(const struct scmi_protocol_handle=
 *ph,
-					 int grp_id, unsigned int *num_samples,
+					 int grp_id, bool multiword,
+					 unsigned int *num_samples,
 					 struct scmi_telemetry_de_sample *samples)
 {
 	struct telemetry_info *ti =3D ph->get_priv(ph);
@@ -4400,8 +4555,8 @@ static int scmi_telemetry_des_sample_get(const struct=
 scmi_protocol_handle *ph,
 		scmi_telemetry_scan_update(ti);
=20
 		/* Collect all last cached values, override any PARTIAL_ERROR */
-		ret =3D scmi_telemetry_samples_collect(ti, grp_id, num_samples,
-						     samples);
+		ret =3D scmi_telemetry_samples_collect(ti, grp_id, multiword,
+						     num_samples, samples);
 	}
=20
 out:
@@ -4429,9 +4584,12 @@ static void scmi_telemetry_local_resources_reset(str=
uct telemetry_info *ti)
 		struct telemetry_de *tde =3D to_tde(rinfo->des[i]);
=20
 		scoped_guard(mutex, &tde->mtx) {
-			tde->last_ts =3D 0;
-			tde->last_val =3D 0;
-			tde->last_magic =3D 0;
+			memset(tde->last_val, 0,
+			       tde->de.info->num_words * sizeof(*tde->last_val));
+			memset(tde->last_ts, 0,
+			       tde->de.info->num_words * sizeof(*tde->last_ts));
+			memset(tde->last_magic, 0,
+			       tde->de.info->num_words * sizeof(*tde->last_magic));
 			tde->cached_msg =3D false;
 			if (!tde->de.fc_support) {
 				tde->sid =3D SHMTI_ID_INVALID;
diff --git a/include/linux/scmi_protocol.h b/include/linux/scmi_protocol.h
index 8c143cbddb5f..5731c73d95f3 100644
--- a/include/linux/scmi_protocol.h
+++ b/include/linux/scmi_protocol.h
@@ -929,6 +929,7 @@ struct scmi_telemetry_de_info {
 	unsigned int id;
 	unsigned int grp_id;
 	unsigned int data_sz;
+	unsigned int num_words;
 	unsigned int type;
 	unsigned int unit;
 	int unit_exp;
@@ -999,7 +1000,7 @@ struct scmi_telemetry_info {
=20
 struct scmi_telemetry_de_sample {
 	unsigned int id;
-	unsigned int pad;
+	unsigned int index;
 	unsigned long long tstamp;
 	unsigned long long val;
 };
@@ -1027,11 +1028,14 @@ enum scmi_telemetry_event {
  *		  the value will be retrieved at the proper SHMTI offset OR
  *		  from the dedicated FC area (if supported by that DE).
  * @des_bulk_read: on-demand read of all the currently enabled DEs, or just
- *		   the ones belonging to a specific group when provided.
+ *		   the ones belonging to a specific group when provided. When
+ *		   @multiword is false, every DE contributes exactly one
+ *		   sample at index 0, regardless of its word count; when true,
+ *		   a multi-word DE contributes one sample per word.
  * @des_sample_get: on-demand read of all the currently enabled DEs, or ju=
st
  *		    the ones belonging to a specific group when provided.
  *		    This causes an immediate update platform-side of all the
- *		    enabled DEs.
+ *		    enabled DEs. @multiword behaves as for @des_bulk_read.
  * @event_subscribe: subscribe to the specified event @type using the prov=
ided
  *		     @eventfd_ctx.
  * @event_unsubscribe: unsubscribe to the specified event @type the previo=
usly
@@ -1059,10 +1063,12 @@ struct scmi_telemetry_proto_ops {
 	int __must_check (*de_data_read)(const struct scmi_protocol_handle *ph,
 					 struct scmi_telemetry_de_sample *sample);
 	int __must_check (*des_bulk_read)(const struct scmi_protocol_handle *ph,
-					  int grp_id, unsigned int *num_samples,
+					  int grp_id, bool multiword,
+					  unsigned int *num_samples,
 					  struct scmi_telemetry_de_sample *samples);
 	int __must_check (*des_sample_get)(const struct scmi_protocol_handle *ph,
-					   int grp_id, unsigned int *num_samples,
+					   int grp_id, bool multiword,
+					   unsigned int *num_samples,
 					   struct scmi_telemetry_de_sample *samples);
 	int (*event_subscribe)(const struct scmi_protocol_handle *ph,
 			       enum scmi_telemetry_event type,
diff --git a/include/uapi/linux/scmi.h b/include/uapi/linux/scmi.h
index dd78220554a2..4809d138ac28 100644
--- a/include/uapi/linux/scmi.h
+++ b/include/uapi/linux/scmi.h
@@ -52,6 +52,7 @@ struct scmi_tlm_abi_info {
 #define SCMI_TLM_ABI_FEAT_BATCH_STATE			(1 << 3)
 #define SCMI_TLM_ABI_FEAT_BATCHED_CFG			(1 << 4)
 #define SCMI_TLM_ABI_FEAT_DE_TRACKING			(1 << 5)
+#define SCMI_TLM_ABI_FEAT_MULTIWORD_READ		(1 << 6)
 	__u8 primary_de_impl_version[SCMI_TLM_DE_IMPL_UUID_SZ];
 	__u32 num_des;
 	__u32 num_groups;
@@ -249,9 +250,12 @@ struct scmi_tlm_de_info {
  * struct scmi_tlm_de_sample - A DataEvent reading
  *
  * @id: DE identifier - IN
- * @pad: Padding fields to enforce alignment.
+ * @index: Word index within the DE's data (0 for ordinary single-word DEs;
+ *	   DEs whose @data_sz spans more than one 64-bit word, as reported by
+ *	   SCMI_TLM_GET_DE_CFG, accept 0..num_words-1 here to select which
+ *	   word is read) - IN
  * @tstamp: DE reading timestamp (0 if timestamp NOT supported) - OUT
- * @val: Reading of the DE data value - OUT
+ * @val: Reading of the DE data value at @index - OUT
  *
  * Used by:
  *	RW - SCMI_TLM_DE_READ
@@ -259,7 +263,7 @@ struct scmi_tlm_de_info {
  */
 struct scmi_tlm_de_sample {
 	__u32 id;
-	__u32 pad;
+	__u32 index;
 	__u64 tstamp;
 	__u64 val;
 };
@@ -275,14 +279,28 @@ struct scmi_tlm_de_sample {
  * @num_samples: Number of entries in @samples. In input represents the si=
ze of
  *		 @samples, while in output carries the effective number of items
  *		 filled-in.
- *		 On input this has an upper-bound determined as:
- *		    - @scmi_tlm_abi_info.num_des if NOT referring a group
+ *		 Note that, when SCMI_TLM_READ_MULTIWORD is set in @flags, a DE
+ *		 whose data spans more than one word (see
+ *		 @scmi_tlm_de_sample.index) contributes one entry per word, so
+ *		 the effective count can exceed the number of enabled DEs. When
+ *		 SCMI_TLM_READ_MULTIWORD is NOT set, every DE contributes
+ *		 exactly one entry, always at index 0, regardless of its word
+ *		 count - this is the legacy behavior predating multi-word DE
+ *		 support, kept as the default so that callers unaware of
+ *		 multi-word DEs keep seeing one entry per enabled DE.
+ *		 On input this has an upper-bound determined as the total
+ *		 word count (if SCMI_TLM_READ_MULTIWORD is set) or DE count
+ *		 (otherwise) across:
+ *		    - all DEs if NOT referring a group
  *		    OR
- *		    - @scmi_tlm_grp_info.num_des if referring a group
- *		 When provided as zero it will return the upper-bound itself
+ *		    - the group's DEs if referring a group
+ *		 When provided as zero it will return that upper-bound itself
  *		 leaving @samples untouched - IN/OUT
  * @samples: A reference to an array of struct scmi_tlm_de_sample containi=
ng
- *	     an entry for each DE - IN/OUT
+ *	     an entry for each DE word if SCMI_TLM_READ_MULTIWORD is set (one
+ *	     per DE for ordinary single-word DEs, more for multi-word DEs -
+ *	     see @num_samples), or one entry per DE at index 0 otherwise -
+ *	     IN/OUT
  *
  * Used by:
  *	RW - SCMI_TLM_SINGLE_READ
@@ -292,8 +310,10 @@ struct scmi_tlm_data_read {
 	__u32 grp_id;
 	__u8 flags;
 #define SCMI_TLM_READ_GROUP		(1 << 0)
-#define SCMI_TLM_READ_FLAGS		(SCMI_TLM_READ_GROUP)
+#define SCMI_TLM_READ_MULTIWORD		(1 << 1)
+#define SCMI_TLM_READ_FLAGS		(SCMI_TLM_READ_GROUP | SCMI_TLM_READ_MULTIWOR=
D)
 #define SCMI_TLM_READ_IS_GROUP(f)	((f) & SCMI_TLM_READ_GROUP)
+#define SCMI_TLM_READ_IS_MULTIWORD(f)	((f) & SCMI_TLM_READ_MULTIWORD)
 	__u8 pad[3];
 	__u32 pad2;
 	__u32 num_samples;
diff --git a/tools/testing/scmi/stlm.c b/tools/testing/scmi/stlm.c
index 5e158ba61f35..a31ce70bb92d 100644
--- a/tools/testing/scmi/stlm.c
+++ b/tools/testing/scmi/stlm.c
@@ -42,7 +42,9 @@
 	"\t\t check - Sanity check of all SHMTis\n" \
 	"\t\t dump [<sid>] - Binary dump of <sid> or all SHMTI areas\n" \
 	"\t\t decode [<sid>] - Line-by-line decode of <sid> or all SHMTI areas\n"=
 \
-	"\t des [info|data] [<de_id>] - Display detailed DEs info, config or data=
\n" \
+	"\t des [info|data] [<de_id> [<index>|all]] - Display detailed DEs info, =
config or data\n" \
+	"\t\t data <de_id> <index> - Read a single word of a multi-word DE\n" \
+	"\t\t data <de_id> all - Read all words of a multi-word DE\n" \
 	"\t groups - Display detailed GROUPS info and config data\n" \
 	"\t cfg [SUB-COMMANDS] - Configure Telemetry\n" \
 	"\t\t tlm on|off - Enable or disable Telemetry as a whole\n" \
@@ -52,7 +54,7 @@
 	"\t\t group [<grp_id>] [[on|off]:[on|off]:[<update_msecs>]] - Get/Set GRO=
UP configuration\n" \
 	"\t single - Perform a single sample read\n" \
 	"\t bulk - Perform a bulk read\n" \
-	"\t batch <de_id> [de_id [de_id]... ] - Perform a batch read of the DE ID=
s listed in input\n" \
+	"\t batch <de_id>[:<index>] [de_id[:<index>] [de_id[:<index>]]... ] - Per=
form a batch read of the DE IDs listed in input\n" \
 	"\t reset - Perform a Telemetry subsytem reset platform-side\n"
=20
 struct tlm_de {
@@ -118,24 +120,60 @@ static inline void dump_des_info(struct tlm_state *st=
, uint32_t *de_id)
 	fprintf(stdout, "\n");
 }
=20
-static void dump_single_de_data(struct tlm_state *st, uint32_t *de_id)
+#define DIV_ROUND_UP(n, d)	(((n) + (d) - 1) / (d))
+
+static void dump_one_de_word(struct tlm_state *st, uint32_t de_id, uint32_=
t index)
 {
 	struct tlm_de de =3D {};
=20
-	de.sample.id =3D *de_id;
+	de.sample.id =3D de_id;
+	de.sample.index =3D index;
 	if (ioctl(st->fd, SCMI_TLM_DE_READ, &de.sample)) {
 		perror(IOCTL_ERR_STR(SCMI_TLM_DE_READ));
 		return;
 	}
=20
-	fprintf(stdout, "\t[0x%08X]\t\t -->> TS:%16llu %016llX\n",
-		de.sample.id, de.sample.tstamp, de.sample.val);
+	fprintf(stdout, "\t[0x%08X][idx:%u]\t\t -->> TS:%16llu %016llX\n",
+		de.sample.id, index, de.sample.tstamp, de.sample.val);
 }
=20
-static void dump_des_data(struct tlm_state *st, uint32_t *de_id)
+static void dump_single_de_data(struct tlm_state *st, uint32_t *de_id,
+				const char *idxstr)
+{
+	unsigned long index;
+	unsigned int num_words =3D 1;
+
+	if (idxstr && !strcmp(idxstr, "all")) {
+		gather_tlm_res_state(st);
+		for (int i =3D 0; i < st->num_des; i++) {
+			if (st->des[i].info->id =3D=3D *de_id) {
+				num_words =3D DIV_ROUND_UP(st->des[i].info->data_sz, 8);
+				break;
+			}
+		}
+
+		for (unsigned int i =3D 0; i < num_words; i++)
+			dump_one_de_word(st, *de_id, i);
+
+		return;
+	}
+
+	index =3D 0;
+	if (idxstr) {
+		index =3D strtoul(idxstr, NULL, 0);
+		if (index =3D=3D ULONG_MAX || errno =3D=3D EINVAL) {
+			fprintf(stderr, "\n+ BAD index: %s\n", idxstr);
+			return;
+		}
+	}
+
+	dump_one_de_word(st, *de_id, (uint32_t)index);
+}
+
+static void dump_des_data(struct tlm_state *st, uint32_t *de_id, const cha=
r *idxstr)
 {
 	if (de_id)
-		return dump_single_de_data(st, de_id);
+		return dump_single_de_data(st, de_id, idxstr);
=20
 	gather_tlm_res_state(st);
=20
@@ -162,15 +200,16 @@ static void dump_des_data(struct tlm_state *st, uint3=
2_t *de_id)
 	fprintf(stdout, "\n");
 }
=20
-static void dump_des(struct tlm_state *st, const char *action, uint32_t *d=
e_id)
+static void dump_des(struct tlm_state *st, const char *action, uint32_t *d=
e_id,
+		     const char *idxstr)
 {
 	if (!action) {
 		dump_des_info(st, de_id);
-		dump_des_data(st, de_id);
+		dump_des_data(st, de_id, idxstr);
 	} else if (!strncmp(action, "info", 4)) {
 		dump_des_info(st, de_id);
 	} else if (!strncmp(action, "data", 4)) {
-		dump_des_data(st, de_id);
+		dump_des_data(st, de_id, idxstr);
 	}
 }
=20
@@ -192,15 +231,19 @@ static inline int cmd_dump_des(struct tlm_state *st, =
struct parsed_args *args)
 {
 	uint32_t id, *de =3D NULL;
 	const char *action =3D NULL;
+	const char *idxstr =3D NULL;
+	unsigned int idpos =3D 0;
=20
 	if (args && args->cnt) {
 		const char *idstr =3D NULL;
=20
 		if (!strncmp(args->opts[0], "info", 4) ||
-		    !strncmp(args->opts[0], "data", 4))
+		    !strncmp(args->opts[0], "data", 4)) {
 			action =3D args->opts[0];
+			idpos =3D 1;
+		}
=20
-		idstr =3D !action ? args->opts[0] : ((args->cnt > 1) ? args->opts[1] : N=
ULL);
+		idstr =3D args->cnt > idpos ? args->opts[idpos] : NULL;
 		if (idstr) {
 			id =3D strtoul(idstr, NULL, 0);
 			if (id =3D=3D ULONG_MAX || errno =3D=3D EINVAL) {
@@ -209,9 +252,12 @@ static inline int cmd_dump_des(struct tlm_state *st, s=
truct parsed_args *args)
 			}
 			de =3D &id;
 		}
+
+		if (args->cnt > idpos + 1)
+			idxstr =3D args->opts[idpos + 1];
 	}
=20
-	dump_des(st, action, de);
+	dump_des(st, action, de, idxstr);
=20
 	return 0;
 }
@@ -898,11 +944,14 @@ static int parse_options(int argc, char **argv, struc=
t parsed_args *args)
 	return 0;
 }
=20
-static inline struct scmi_tlm_data_read *bulk_buffer_alloc(struct tlm_stat=
e *st)
+static inline struct scmi_tlm_data_read *
+bulk_buffer_alloc(struct tlm_state *st, unsigned long ioctl_op,
+		  const char *tag, bool multiword)
 {
 	struct scmi_tlm_de_sample *samples;
 	struct scmi_tlm_data_read *bulk;
 	size_t bulk_sz, samples_sz;
+	int ret;
=20
 	bulk_sz =3D sizeof(*bulk);
 	bulk =3D malloc(bulk_sz);
@@ -910,7 +959,23 @@ static inline struct scmi_tlm_data_read *bulk_buffer_a=
lloc(struct tlm_state *st)
 		return NULL;
=20
 	bzero(bulk, bulk_sz);
-	samples_sz =3D st->info.num_des * sizeof(*samples);
+
+	if (multiword)
+		bulk->flags |=3D SCMI_TLM_READ_MULTIWORD;
+
+	/*
+	 * Zero-query probe: a DE spanning multiple words expands into one
+	 * entry per word, so the required capacity can exceed num_des and
+	 * must be asked for rather than assumed.
+	 */
+	ret =3D ioctl(st->fd, ioctl_op, bulk);
+	if (ret < 0) {
+		perror(tag);
+		free(bulk);
+		return NULL;
+	}
+
+	samples_sz =3D bulk->num_samples * sizeof(*samples);
 	samples =3D malloc(samples_sz);
 	if (!samples) {
 		free(bulk);
@@ -919,18 +984,19 @@ static inline struct scmi_tlm_data_read *bulk_buffer_=
alloc(struct tlm_state *st)
=20
 	bzero(samples, samples_sz);
 	bulk->samples =3D (uint64_t)samples;
-	bulk->num_samples =3D st->info.num_des;
=20
 	return bulk;
 }
=20
-static int cmd_single_read(struct tlm_state *st)
+static int cmd_single_read(struct tlm_state *st, struct parsed_args *args)
 {
 	struct scmi_tlm_de_sample *samples;
 	struct scmi_tlm_data_read *bulk;
 	int ret;
=20
-	bulk =3D bulk_buffer_alloc(st);
+	bulk =3D bulk_buffer_alloc(st, SCMI_TLM_SINGLE_READ,
+				 IOCTL_ERR_STR(SCMI_TLM_SINGLE_READ),
+				 true);
 	if (!bulk)
 		return -1;
=20
@@ -943,19 +1009,22 @@ static int cmd_single_read(struct tlm_state *st)
 	fprintf(stdout, "\n- Single ASYNC read -\n-------------------\n");
 	samples =3D (struct scmi_tlm_de_sample *)bulk->samples;
 	for (int i =3D 0; i < bulk->num_samples; i++)
-		fprintf(stdout, "0x%08X %016llu %016llX\n",
-			samples[i].id, samples[i].tstamp, samples[i].val);
+		fprintf(stdout, "0x%08X idx:%u %016llu %016llX\n",
+			samples[i].id, samples[i].index,
+			samples[i].tstamp, samples[i].val);
=20
 	return 0;
 }
=20
-static int cmd_bulk_read(struct tlm_state *st)
+static int cmd_bulk_read(struct tlm_state *st, struct parsed_args *args)
 {
 	struct scmi_tlm_de_sample *samples;
 	struct scmi_tlm_data_read *bulk;
 	int ret;
=20
-	bulk =3D bulk_buffer_alloc(st);
+	bulk =3D bulk_buffer_alloc(st, SCMI_TLM_BULK_READ,
+				 IOCTL_ERR_STR(SCMI_TLM_BULK_READ),
+				 true);
 	if (!bulk)
 		return -1;
=20
@@ -968,8 +1037,9 @@ static int cmd_bulk_read(struct tlm_state *st)
 	fprintf(stdout, "\n- BULK read -\n-------------------\n");
 	samples =3D (struct scmi_tlm_de_sample *)bulk->samples;
 	for (int i =3D 0; i < bulk->num_samples; i++)
-		fprintf(stdout, "0x%08X %016llu %016llX\n",
-			samples[i].id, samples[i].tstamp, samples[i].val);
+		fprintf(stdout, "0x%08X idx:%u %016llu %016llX\n",
+			samples[i].id, samples[i].index,
+			samples[i].tstamp, samples[i].val);
=20
 	return 0;
 }
@@ -998,24 +1068,35 @@ static int cmd_batch_read(struct tlm_state *st, stru=
ct parsed_args *args)
 	if (!args->opts || !args->cnt)
 		return -EINVAL;
=20
-	if (args->cnt > st->info.num_des)
-		return -ENOSPC;
-
-	/* Allocate for full size with status */
-	batch =3D batch_buffer_alloc(st->info.num_des, sizeof(*samples), true);
+	/*
+	 * A single multi-word DE can be listed multiple times at different
+	 * indices, so args->cnt isn't bounded by num_des; size the buffer to
+	 * what was actually requested and let the kernel enforce the real cap.
+	 */
+	batch =3D batch_buffer_alloc(args->cnt, sizeof(*samples), true);
 	if (!batch)
 		return -1;
=20
 	samples =3D (struct scmi_tlm_de_sample *)batch->items;
 	batch->num_items =3D args->cnt;
 	for (int i =3D 0; i < batch->num_items; i++) {
-		unsigned long val;
+		unsigned long val, index =3D 0;
+		char *sep;
+
+		sep =3D strchr(args->opts[i], ':');
+		if (sep) {
+			index =3D strtoul(sep + 1, NULL, 0);
+			if (index =3D=3D ULONG_MAX || errno =3D=3D EINVAL)
+				continue;
+			*sep =3D '\0';
+		}
=20
 		val =3D strtoul(args->opts[i], NULL, 0);
 		if (val =3D=3D ULONG_MAX || errno =3D=3D EINVAL)
 			continue;
=20
 		samples[i].id =3D (unsigned int)val;
+		samples[i].index =3D (unsigned int)index;
 	}
=20
 	ret =3D ioctl(st->fd, SCMI_TLM_BATCH_READ, batch);
@@ -1026,9 +1107,10 @@ static int cmd_batch_read(struct tlm_state *st, stru=
ct parsed_args *args)
=20
 	fprintf(stdout, "\n- BATCH read -\n-------------------\n");
 	for (int i =3D 0; i < batch->num_items; i++)
-		fprintf(stdout, "STATUS[%d] =3D> 0x%08X %016llu %016llX\n",
+		fprintf(stdout, "STATUS[%d] =3D> 0x%08X idx:%u %016llu %016llX\n",
 			((uint32_t *)batch->states)[i],
-			samples[i].id, samples[i].tstamp, samples[i].val);
+			samples[i].id, samples[i].index,
+			samples[i].tstamp, samples[i].val);
=20
 	return 0;
 }
@@ -1542,11 +1624,14 @@ static int query_intervals(struct tlm_state *st)
 }
=20
 static int query_samples(struct tlm_state *st, unsigned long ioctl_op,
-			 const char *tag)
+			 const char *tag, bool multiword)
 {
 	struct scmi_tlm_data_read data =3D {};
 	int ret;
=20
+	if (multiword)
+		data.flags |=3D SCMI_TLM_READ_MULTIWORD;
+
 	/* Global interval */
 	ret =3D ioctl(st->fd, ioctl_op, &data);
 	if (ret < 0) {
@@ -1562,6 +1647,8 @@ static int query_samples(struct tlm_state *st, unsign=
ed long ioctl_op,
=20
 		data.grp_id =3D st->grps[i].info->grp_id;
 		data.flags =3D SCMI_TLM_READ_GROUP;
+		if (multiword)
+			data.flags |=3D SCMI_TLM_READ_MULTIWORD;
 		ret =3D ioctl(st->fd, ioctl_op, &data);
 		if (ret < 0) {
 			perror(tag);
@@ -1576,7 +1663,7 @@ static int query_samples(struct tlm_state *st, unsign=
ed long ioctl_op,
 	return 0;
 }
=20
-static int cmd_query_ioctls(struct tlm_state *st)
+static int cmd_query_ioctls(struct tlm_state *st, struct parsed_args *args)
 {
 	int ret;
=20
@@ -1628,11 +1715,13 @@ static int cmd_query_ioctls(struct tlm_state *st)
 	if (ret)
 		return ret;
=20
-	ret =3D query_samples(st, SCMI_TLM_BULK_READ, "SCMI_TLM_BULK_READ");
+	ret =3D query_samples(st, SCMI_TLM_BULK_READ, "SCMI_TLM_BULK_READ",
+			    true);
 	if (ret)
 		return ret;
=20
-	ret =3D query_samples(st, SCMI_TLM_SINGLE_READ, "SCMI_TLM_SINGLE_READ");
+	ret =3D query_samples(st, SCMI_TLM_SINGLE_READ, "SCMI_TLM_SINGLE_READ",
+			    true);
 	if (ret)
 		return ret;
=20
@@ -1678,15 +1767,15 @@ int main(int argc, char **argv)
 	else if (!strncmp(args.cmd, "cfg", strlen(args.cmd)))
 		return cmd_configure(st, &args);
 	else if (!strncmp(args.cmd, "single", strlen(args.cmd)))
-		return cmd_single_read(st);
+		return cmd_single_read(st, &args);
 	else if (!strncmp(args.cmd, "bulk", strlen(args.cmd)))
-		return cmd_bulk_read(st);
+		return cmd_bulk_read(st, &args);
 	else if (!strncmp(args.cmd, "batch", strlen(args.cmd)))
 		return cmd_batch_read(st, &args);
 	else if (!strncmp(args.cmd, "reset", strlen(args.cmd)))
 		return cmd_tlm_reset(st);
 	else if (!strncmp(args.cmd, "query", strlen(args.cmd)))
-		return cmd_query_ioctls(st);
+		return cmd_query_ioctls(st, &args);
=20
 	return cmd_unknown(args.cmd);
 }
diff --git a/tools/testing/selftests/arm64/scmi/test_scmi_telemetry_uapi.c =
b/tools/testing/selftests/arm64/scmi/test_scmi_telemetry_uapi.c
index 24a8170a4380..b4bcdeda81e1 100644
--- a/tools/testing/selftests/arm64/scmi/test_scmi_telemetry_uapi.c
+++ b/tools/testing/selftests/arm64/scmi/test_scmi_telemetry_uapi.c
@@ -934,6 +934,88 @@ TEST_F(stlm, tlm_bulk_read_null_ptr_rejected)
 	EXPECT_EQ(EFAULT, errno);
 }
=20
+TEST_F(stlm, tlm_abi_multiword_read_feature_reported)
+{
+	ASSERT_NE(0, ksft_session.info.abi_features & SCMI_TLM_ABI_FEAT_MULTIWORD=
_READ);
+}
+
+TEST_F(stlm, tlm_bulk_read_legacy_default_one_sample_per_de)
+{
+	struct scmi_tlm_de_sample *samples;
+	struct scmi_tlm_data_read read =3D {};
+	int num_samples =3D ksft_session.num_des;
+
+	if (!ksft_session.de_list || !ksft_session.num_des)
+		SKIP(return, "no DE list available");
+
+	samples =3D malloc(sizeof(*samples) * num_samples);
+	ASSERT_NE(NULL, samples);
+	bzero(samples, sizeof(*samples) * num_samples);
+
+	read.num_samples =3D num_samples;
+	read.samples =3D (__u64)samples;
+
+	ASSERT_EQ(0, ioctl(self->fd, SCMI_TLM_BULK_READ, &read));
+
+	for (int i =3D 0; i < read.num_samples; i++)
+		ASSERT_EQ(0, samples[i].index);
+
+	free(samples);
+}
+
+TEST_F(stlm, tlm_bulk_read_multiword_zero_query_matches_num_words_sum)
+{
+	struct scmi_tlm_data_read legacy =3D {};
+	struct scmi_tlm_data_read multiword =3D {};
+	__u32 words_sum =3D 0;
+
+	if (!ksft_session.de_list || !ksft_session.num_des)
+		SKIP(return, "no DE list available");
+
+	for (unsigned int i =3D 0; i < ksft_session.num_des; i++)
+		words_sum +=3D (ksft_session.de_list[i].data_sz + 7) / 8;
+
+	ASSERT_EQ(0, ioctl(self->fd, SCMI_TLM_BULK_READ, &legacy));
+	ASSERT_EQ(ksft_session.num_des, legacy.num_samples);
+
+	multiword.flags =3D SCMI_TLM_READ_MULTIWORD;
+	ASSERT_EQ(0, ioctl(self->fd, SCMI_TLM_BULK_READ, &multiword));
+	ASSERT_EQ(words_sum, multiword.num_samples);
+}
+
+TEST_F(stlm, tlm_bulk_read_multiword)
+{
+	struct scmi_tlm_de_sample *samples;
+	struct scmi_tlm_data_read read =3D {};
+	__u32 num_samples;
+	int i;
+
+	if (!ksft_session.de_list || !ksft_session.num_des)
+		SKIP(return, "no DE list available");
+
+	read.flags =3D SCMI_TLM_READ_MULTIWORD;
+	ASSERT_EQ(0, ioctl(self->fd, SCMI_TLM_BULK_READ, &read));
+	num_samples =3D read.num_samples;
+
+	samples =3D malloc(sizeof(*samples) * num_samples);
+	ASSERT_NE(NULL, samples);
+	bzero(samples, sizeof(*samples) * num_samples);
+
+	bzero(&read, sizeof(read));
+	read.flags =3D SCMI_TLM_READ_MULTIWORD;
+	read.num_samples =3D num_samples;
+	read.samples =3D (__u64)samples;
+
+	ASSERT_EQ(0, ioctl(self->fd, SCMI_TLM_BULK_READ, &read));
+	ASSERT_LE(read.num_samples, num_samples);
+
+	for (i =3D 0; i < read.num_samples; i++)
+		TH_LOG("SCMI_TLM_BULK_READ[multiword] - [%d] id:0x%x idx:%u tstamp:%llu =
val:%llu",
+		       i, samples[i].id, samples[i].index, samples[i].tstamp, samples[i]=
.val);
+
+	free(samples);
+}
+
 TEST_F(stlm, tlm_batch_read)
 {
 	struct scmi_tlm_batch batch =3D {};
--=20
2.43.0



>=20
> Thanks,
> Cristian
>=20


Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794336589;
	b=qUI3Kab5xAyXFxRxu6hAYlaK9xsUbtKsU7rasXK7oycOc7SXjqssfmDB7fPyrgkpi67Z
	 XBgrFizetuliy9GthoQExfUkbXIhc7DYTsCLpr6+lxh2gOmHHTFvbfTXsTOoKzqw74b8L
	 wQm2JF+7C7OVmNcYSqcNGvxP6CT3QCGQ9bbhZmmiEoLkoJbz3/SFyv0P9/z3W8xkvqvxl
	 oSRrnBG8xPm/FeB2pROO1SYSJHOOgJvJra1VcpwrcPkhQ3uZ9r7y+RKDNG9R9r23FBhTB
	 tzXrUnJuQK6t8JZMouR0LHY76ETnJKD3zl00I+L3S6nmUKrvWrpM1Lq0+q8iVxFlFEQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794336589;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:In-Reply-To:References:Organization:X-Mailer:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=QlOMOYWweaD3rhIBYK0FxaPkexbukY9Q5FW/PQSKho0=;
	b=XPG9s08CxkY40enYPrb+ADhM7Lr8ylzQwRAKR+au+1SRzZfte926eF9CX6VpX5CAgfHM
	 tXT4C2Ityp14EzqG/vVHd+SGGJ/nlfyRyg6z/x32DwR1Y28MOh3eThLw04rjnODndYK74
	 BdK0LA+vnpH18uaKCTeU3njjrE1BkfbjyhABbjYULnpsyKrdJQG6XfnFDGxIuCJfgdaCM
	 /025RzNFYDpC6FxZMzOk7iV4UjDz/0nyzp3Vq7J+B3K7pPNpw2F/bkFmholzOe1ekmlQB
	 uWQVrpVojOxxkdVFqvMjRsOn2MI0LLglWF2VD2ko/ig8dzkQqiDxwhOVq1nednlG+Ow==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Y+XOPo5s;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=dJUIbwn2;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC28D606A31C
	for <arm-scmi@vger.kernel.org>; Tue, 10 Nov 2026 18:49:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CC28D606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Y+XOPo5s;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=dJUIbwn2
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AAIcGIB3670524
	for <arm-scmi@vger.kernel.org>; Tue, 10 Nov 2026 18:49:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	QlOMOYWweaD3rhIBYK0FxaPkexbukY9Q5FW/PQSKho0=; b=Y+XOPo5sh17BDAvJ
	nfpDK75yQgj6nL0Xk2giaKLnNdnKo6OTUstdAfHMLjPDtuJegrWc6VzQTOJOlwTk
	jediEOjLx4GjeE1F+UrlB22Pyiya0u7op6Lk/2pdCXc37PWVgZ2djhrh/MrNBRc5
	FdrYSIG5IT7CIGgfE/UYVq4vqBHyfdZDFVPaK01QQ5Gx3I6JtYVQbbGVGrMAzPJD
	dWX0szOzxXQlmEFe15FE7ZhP54hqQ2Vinzw87Py9rbC6yateKJ5BFOSGQXr/JqLS
	1SfyfyNFilw+dcdvmkvu4T9AjU45omESi53oMEeWOUCv9CmTlW0DCMuhdpTmXLqz
	z8EFzQ==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4huucp3fbm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <arm-scmi@vger.kernel.org>; Tue, 10 Nov 2026 18:49:47 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-30c0d568830so5401874eec.1
        for <arm-scmi@vger.kernel.org>; Tue, 10 Nov 2026 10:49:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794336587; x=1794941387; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:organization
         :references:in-reply-to:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=QlOMOYWweaD3rhIBYK0FxaPkexbukY9Q5FW/PQSKho0=;
        b=dJUIbwn2w/PKp5E4KeVhPlvLWq9tfSVba2c6NeWYZyVmr6STkvDRbAZGyQBUnrpbjK
         rAJGrgLJNxHNUAzHrg6cBMnXO2x4X1wCj/56Ia4hVQWtdG2kuHZBZs5DxPLvnaTcUPLy
         I25CIQKJl1HqY8DSrIqwO6TVd3qoA7ViQCGcLMXRwub6FeWRubynDFdXHXGXnu5GW3VX
         NsD/IFx3vBzbaAU7Rw4t5s9/WMsdpDgjZn0rFiGgpyLazkyUpIjnEe1tSWz9c5aOrOi7
         6RNaGMTvkOQhd+rBGQ811dHxDV4JV9wmtZTiJjQvfHIpKn/QsJ6m/afC3AMIZOPx5T87
         PQ7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794336587; x=1794941387;
        h=content-transfer-encoding:content-type:mime-version:organization
         :references:in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QlOMOYWweaD3rhIBYK0FxaPkexbukY9Q5FW/PQSKho0=;
        b=A/jTJU5GmLB3ML1NXv0i2xdnO2Z39QVfPxIxubQGwvMDE0xuKHenZAIQKyaEfFGwDs
         e/sRMyZfoEKx9YP76WtaVUDeeuyApihx8yP1VdUsP7FvSzzbowGrLuQOtFTCu8e9I02g
         9O8Vw6owLlhHyYg9lSjX+6Vz39T7oWXr4LiPN5coYhZyxnqb+KdKFGiEiWtaAIFasSA+
         pwb7fE86kxK/XB7yzwirxPJql2+p7gEdVf02YzCouJQNWg2jRWduVpO/CHjAIJp7SxFi
         smBkcszEqSFGl/QbS8JRalMJVMZQxQbpgJXQ2Dvip0cFxJgKzoX3ztMb99m6ilvjYZTO
         P7Wg==
X-Forwarded-Encrypted: i=1; AL+hErFoTIe7yuhJp2K0HtuQk5q+0f5eg8rsQ/XCK9491lxU61vusDfoTThlUZ43k2V6WhzY5yKNfIIGXA==@vger.kernel.org
X-Gm-Message-State: APuU4Z+hES5ZztAdbctbHO6XkUo9PXGgdoKluyvxJNiGiwRT2paX6c9q
	GxEIRYQXfsOrWbiNCxLCIPHV2s6jgXg70KozYTgW1N4pkTF+r8+UjVGOzm53TY1Kc+Rm15iCr1P
	8ITvcys8ub6sNWoCdon9zi1k4pJYsmdItg3cXANQ35YSKMJuzXVrqam2vVjswNQ==
X-Gm-Gg: AYBFou0xsuztzGDtU96aPg/9itiRZkC/lFUGRFrrBqTLzftPczQBOw0/+ndEFNNnFOz
	lZPiiVUETeASjTVtay2HqxHhV0Kl8Qdya8h7T/hf/kG1gdjrYZ8DNLl2AcX6ZRK4n56YcU12n+s
	4DFsizcJ0qShjjKLVEOnhcP4fy6fpBHho/Zo/p0TvgVNpjQpDSq5JOJhHr98f5JTQayqmsjezGy
	NIQNeQo7J5AOIxKbfmUw60jAFkReHbPceM8r0nzfGziYKEgadqs2niFPEaKYcomZWBzym7ajqVy
	PwQ8Z7hdG2YKjD6tpjuEoe/JxduN/Qn0RrvbAz1XGPx+EhJDiKXLaBKT1QnKxwusPnUBipBVnwp
	cQ12GzHmiZa0akkEtLipO0y9VjdaKxcXfrBMoUEkZ8GKZeTX9Rmt0xl0dJe/6RT0DlvuQSY27Qu
	jVaxaLWXjtU/9aOMavEtfmwqPhBJKe
X-Received: by 2002:a05:693c:66d2:10b0:36a:1f:9b74 with SMTP id 5a478bee46e88-3768636e4b1mr198803eec.27.1794336585380;
        Tue, 10 Nov 2026 10:49:45 -0800 (PST)
X-Received: by 2002:a05:693c:66d2:10b0:36a:1f:9b74 with SMTP id 5a478bee46e88-3768636e4b1mr198736eec.27.1794336584648;
        Tue, 10 Nov 2026 10:49:44 -0800 (PST)
Received: from localhost (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-37520512ec1sm7990922eec.12.2026.11.10.10.49.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 10:49:44 -0800 (PST)
Date: Tue, 10 Nov 2026 10:49:25 -0800
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
Subject: Re: [PATCH v15 16/35] firmware: arm_scmi: Add Telemetry TDCF
 parsing for UUID lines
Message-ID: <20261110104925.00001db6@oss.qualcomm.com>
In-Reply-To: <20261109091221.2532706-17-cristian.marussi@arm.com>
References: <20261109091221.2532706-1-cristian.marussi@arm.com>
	<20261109091221.2532706-17-cristian.marussi@arm.com>
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
X-Proofpoint-ORIG-GUID: zyO-09HG8WMXGl5Wa_z3cNE_qlPQB7QB
X-Authority-Analysis: v=2.4 cv=U4oHnuru c=1 sm=1 tr=0 ts=6af3674b cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=7CQSdrXTAAAA:8 a=gDUTI9D6LIilfzPf5l8A:9 a=CjuIK1q_8ugA:10
 a=6Ab_bkdmUrQuMsNx7PHu:22 a=a-qgeE7W1pNrGK8U0ZQC:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEwMDA3NCBTYWx0ZWRfX30AowZ8NGUAW
 gRfE8Ct3HFzRvz8jB51xVi/sOqORHQagQRtY7wibEEuOF//bLoYMpiFzOCJogfPhUyHdPCVh2fo
 0vricLl5/UWkeqbj1qORrlEIBRWMJPiLaoitGWgpQUR4ofaA1+O3QSPfSGP6kAG7lApu08hjI63
 khvLlKfKJbjsJ/cEitWXlnG32n5VWCVhMYiumezvlbUKUQjYpdZf5mLM2TXVe7E/27EZrMEF7yj
 aJbPj9TqyC2+8Xn7eezUGUHwCKED4BoX9dKsC2tA8zn63zsJdwplVstPaKeAh2EH44JaMKTRdCW
 vTdM5eT/9pz2KDIr3ulgN75e8kU4y+pY4SgshmyEwrCBfNY69j7TEbTBzcFrgSiZt5hvUhLk6GA
 dpIiSNm9Tr4WzAbvOYUKYTg/mWh2kY8p038uZmRQm5utjOAXecpuced4rvYURXslHckHwes4APn
 YNSbTglggQnV9hTLqLA==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEwMDA3NCBTYWx0ZWRfX2zacM4c2RSSc
 TwoVDDVS0wWFwq3Ib4drbHC2CsAPU/xRL4kzfJ195kEXBilhpAr49hs3AU7krjUZa7tccNDkUHi
 KfWHduSBkZom3/zopWNN21x9OmFrPck=
X-Proofpoint-GUID: zyO-09HG8WMXGl5Wa_z3cNE_qlPQB7QB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-10_05,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 impostorscore=0 clxscore=1015 priorityscore=1501
 malwarescore=0 spamscore=0 adultscore=0 phishscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611100074

On Mon,  9 Nov 2026 09:12:02 +0000
Cristian Marussi <cristian.marussi@arm.com> wrote:

> Add support to parse, track and link TDCF UUID lines to the related
> discovered DataEvents.
> 
> Maintain also a central list of discovered UUID lines.
> 
> Signed-off-by: Cristian Marussi <cristian.marussi@arm.com>
Trivial stuff + a follow on about how you are handling the
devm_ cleanup for the de and it making your code more complex
than it needs to be.  I think a simple helper will get
you to a better state (and my preferred approach of fine grained
management is probably overkill!)

Jonathan

> ---
> v14 --> v15
>  - use proper casting in tlm_collect
>  - use snapshots to collect UUIDs during full scans
>  - stop tracking UUIDs lines singularly..it's useless
>  - use UUIDs line hashing for lookup
>  - clarified UUID/DE binding are permanent
>  - fixed WARN_ON invocation on missing active_uuid
> v13 --> v14
>  - split out of previous single patch implementing parse SHMTI routines
> ---
>  drivers/firmware/arm_scmi/telemetry.c | 277 +++++++++++++++++++++++++-
>  include/linux/scmi_protocol.h         |   2 +
>  2 files changed, 277 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/firmware/arm_scmi/telemetry.c b/drivers/firmware/arm_scmi/telemetry.c
> index e3fbcb1e6ea7..38a94d66116f 100644
> --- a/drivers/firmware/arm_scmi/telemetry.c
> +++ b/drivers/firmware/arm_scmi/telemetry.c

>  
> +static int scmi_telemetry_uuids_update(struct telemetry_info *ti,
> +				       struct telemetry_uuid *uuid)
> +{
> +	uuid_t **cur_uuids;
> +
> +	/* Resize array if needed ... */
> +	if (ti->info.num_uuids + SCMI_UUID_DB_THRESH >= ti->uuids_len) {
> +		uuid_t **new_uuids, **old_uuids;
> +		unsigned int new_len = ti->uuids_len * 2;
> +
> +		new_uuids = kzalloc_objs(*new_uuids, new_len);
> +		if (!new_uuids)
> +			return -ENOMEM;
> +
> +		old_uuids = rcu_dereference_protected(ti->info.uuids,
> +						      lockdep_is_held(&ti->uuids_mtx));
> +		/* Copy/move old allocated UUIDs */
> +		for (int i = 0; i < ti->info.num_uuids; i++)
> +			new_uuids[i] = old_uuids[i];

memcpy?

> +
> +		/* Expose new UUID pointer */
> +		rcu_assign_pointer(ti->info.uuids, new_uuids);
> +		ti->uuids_len = new_len;
> +
> +		kfree_rcu_mightsleep(old_uuids);
> +	}
> +
> +	/* Store new UUID reference into the globally accessible UUIDS */
> +	cur_uuids = rcu_dereference_protected(ti->info.uuids,
> +					      lockdep_is_held(&ti->uuids_mtx));
> +	cur_uuids[ti->info.num_uuids] = &uuid->uuid;
> +	rcu_assign_pointer(ti->info.uuids, cur_uuids);
> +	/* Update UUIDs count */
> +	smp_store_release(&ti->info.num_uuids, ti->info.num_uuids + 1);
> +
> +	return 0;
> +}



> @@ -2362,6 +2554,7 @@ static int scmi_telemetry_resources_alloc(struct telemetry_info *ti)
>  	}
>  
>  	INIT_LIST_HEAD(&ti->fcs_des);
> +	hash_init(ti->uuids_ht);

Why init the hash here but the mutex at the caller? I guess
maybe you wanted it to be obvious the mutex was valid, but to me
just doing mutex_init up here is easier.

>  
>  	ti->shmti = no_free_ptr(shmtis);
>  	ti->info.shmtis = no_free_ptr(shmtis_info);
> @@ -2427,6 +2620,37 @@ static void scmi_telemetry_lines_cleanup(struct telemetry_info *ti)
>  	}
>  }

>  static void scmi_telemetry_tdes_cleanup(struct telemetry_info *ti)
>  {
>  	struct scmi_telemetry_de *de;
> @@ -2471,6 +2695,7 @@ static void scmi_telemetry_instance_cleanup(void *arg)
>  
>  	scmi_telemetry_groups_free(ti->rinfo);
>  	scmi_telemetry_tdes_cleanup(ti);
> +	scmi_telemetry_uuids_cleanup(ti);

See below.  The monolithic approach to devm cleanup is making
your setup code harder to read.  Suggestions down there on how
to avoid that.

>  	scmi_telemetry_lines_cleanup(ti);
>  	scmi_telemetry_resources_free(ti);
>  }

>  /**
>   * scmi_telemetry_instance_init  - Instance initializer
>   * @ti: A reference to the telemetry info descriptor for this instance
> @@ -2563,6 +2805,8 @@ scmi_telemetry_resources_enumerate(struct telemetry_info *ti)
>   */
>  static int scmi_telemetry_instance_init(struct telemetry_info *ti)
>  {
> +	unsigned int uuids_len;
> +	uuid_t **cur_uuids;
>  	int ret;
>  
>  	ret = scmi_telemetry_resources_alloc(ti);
> @@ -2571,6 +2815,35 @@ static int scmi_telemetry_instance_init(struct telemetry_info *ti)
>  
>  	xa_init(&ti->xa_des);
>  
> +	/*
> +	 * Always allocate at least one slot for the primary and anyway at
> +	 * least enough to avoid immediate resizing, assuring uuids_len
> +	 * always greater or equal to one.
> +	 */
> +	uuids_len = max(ti->num_shmti * 2, SCMI_UUID_DB_THRESH + 1);
> +	cur_uuids = kzalloc_objs(*cur_uuids, uuids_len);
> +	if (!cur_uuids) {
> +		xa_destroy(&ti->xa_des);
> +		scmi_telemetry_resources_free(ti);
This sort of dance of not using a goto block because we
have unified cleanup at the end always suggests to me one of two things.
Finer grained devm_ callbacks, or a helper that can have a clean return
to this outer function with no side effects, those having all been
cleaned up via goto based unified error handling in the helper.

I personally prefer fine grained devm with each element clearly
being paired with the undo, but the helper is perhaps easier to
introduce here.

> +		return -ENOMEM;
> +	}
> +
> +	mutex_init(&ti->uuids_mtx);
> +	/* Expose new UUID pointer */
> +	scoped_guard(mutex, &ti->uuids_mtx) {
> +		rcu_assign_pointer(ti->info.uuids, cur_uuids);
> +		ti->uuids_len = uuids_len;
> +	}
> +
> +	/* Initialize the first UUIDs in the global list with the primary */
> +	ret = scmi_telemetry_primary_uuid_init(ti);
> +	if (ret) {
> +		scmi_telemetry_uuids_cleanup(ti);
> +		xa_destroy(&ti->xa_des);
> +		scmi_telemetry_resources_free(ti);
> +		return ret;
> +	}
> +
>  	atomic_set(&ti->des_enabled[ENA_STATE], 0);
>  	atomic_set(&ti->des_enabled[ENA_TSTAMP], 0);
>  	mutex_init(&ti->des_enabled_mtx);
> diff --git a/include/linux/scmi_protocol.h b/include/linux/scmi_protocol.h
> index b7b8bd77b37d..3973779c0aba 100644
> --- a/include/linux/scmi_protocol.h
> +++ b/include/linux/scmi_protocol.h
> @@ -981,6 +981,8 @@ struct scmi_telemetry_info {
>  	unsigned int active_update_interval;
>  	struct scmi_telemetry_intervals *intervals;
>  	struct scmi_telemetry_shmti_info **shmtis;
> +	unsigned int num_uuids;
> +	uuid_t * __rcu *uuids __counted_by_ptr(num_uuids);
>  };
>  
>  /**


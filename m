Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 668F637F30B
	for <arm-scmi@vger.kernel.org>; Mon, 24 Aug 2026 17:49:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787593797; cv=none; b=XLrFQy0SgIZlO57iZm1RAwc6d+WrIz8DuhMiEhlAOsbFUh9AmtiKDEf7cn1ikfIMhqZJqVMYjq07aNv+4Jpb7fjnJ080z1ygOz58G1Hr9q+sTosiGuOyiec8Sa6iSuDW+NG57x/nZjKro6+fxrzvBK5x3PaEsLMfPzhDBF5UVs4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787593797; c=relaxed/simple;
	bh=u9uNlcarZ+0eQ707JKTZEmQc0ONXvpN8iDDx1iZbCSA=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=KrxzZwe2vJywJn9h8CbwsJPYetgv+KCEl8wqg7a3FFtVbvfwn/06+PtmkMlAIzPHLqQ1bzKkJBbntOY5wMa1k+kEDt5zpos4vzbzFordVSakYty70eDLT9raEppW8h7tnLKoazHLx2FJd+12vaufYNSzB4pe/ie7zyu6PmMMw2c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=LSLREBkT; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=hV5mfClm; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="LSLREBkT";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="hV5mfClm"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67OH5MQ43504160
	for <arm-scmi@vger.kernel.org>; Mon, 24 Aug 2026 17:49:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	hC4tsXY7Tn8f9AYfjvECYAdjTMrX5zvDSdSMGlCzQyw=; b=LSLREBkTuhBvVODP
	eWe6LVgwJP2xBGXNeJVCkEecomyec/PmJhicfIbENRXwAGA+/56bbLwBwmINStC6
	Bdo0lcLYqiduXHSks2B9N0iw6UarCrV7ST6SJaeq5To6095iWFagb+VVMyOvZgXw
	z3YLjkdooErj87oSPQowZS706yRxBOexCvfyF/ApcXFO71ifdzhcfPychLqDXDzz
	ZN6/6HSr7wwafpLr039XoU72/I1X01XWtU22mgSH/ejCrGYKxBDXv+MkBKlbcXNU
	wGeg8NPRf0kcY4VFQnSMHtVHo8/9bGGsiqZbn2LbatFmoueUzEFEd8LqVcP9GNrx
	Thk57w==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g8t1s05ud-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <arm-scmi@vger.kernel.org>; Mon, 24 Aug 2026 17:49:53 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2cacf17c7e0so59835495ad.0
        for <arm-scmi@vger.kernel.org>; Mon, 24 Aug 2026 10:49:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787593793; x=1788198593; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:organization
         :references:in-reply-to:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=hC4tsXY7Tn8f9AYfjvECYAdjTMrX5zvDSdSMGlCzQyw=;
        b=hV5mfClmmanPjLoqS771+JE9vw68sndtpIbW/wyv3nyrJUyPsnNxjKfH5FgSQAP+9C
         jhuDkj67yIkwkPgR6iU65DgN35h//z3mmLToXY6AzFSOf8ViFvUStzbGNdNUFLv1NAgk
         Xha00CcIABzPTuMFkAupkH2vXsgg23r45MkW3tGX1Zji6UI2zzgjFyEND3/srjG4KjFN
         Au/XltDzUgp7nJhGP7JanFyyzT2LAEBQf3hhvG/eMKQSISFuyvNpkDtLbE/AuzVyVEoF
         Lu8PSrWZ3gKJ8PzZSVsAkyPpGMi58syixJeAv0ltKTvZuT0oCwwc6aFphUpqBircmIi+
         sdcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787593793; x=1788198593;
        h=content-transfer-encoding:content-type:mime-version:organization
         :references:in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hC4tsXY7Tn8f9AYfjvECYAdjTMrX5zvDSdSMGlCzQyw=;
        b=FFplvrpvlw3zVuEg4eyB91xv/CCwSHTU8u/Jt5jPtPpaKlgK1JrEyR0JepNvcJflpH
         fUZqoSkQabei49UeCUG/zLxm9koFuj19fXj8/3fuFYpMuHGHsS3L4vG7x9SbhJkkDj/Q
         SOIyXWtubAkgwX5sYlh8NL1GYqUlCIeeNuC58HKnp1JbHqqyqQNdLggrzTZNAZuFix9G
         j+c4A7nLC1ge0bTilyNaI7Fc7Sj3EkVxR4/oNcJ5VcU/oJE5lvCUsemxQjdLEUZ7W4yD
         RJYpH0YOkY7BtPBtY/SrWpWVxGR2py5QdDKGO/GaxavLRc+8kbttN+P7t3XeuoAqBxy6
         tRxg==
X-Gm-Message-State: AFuF++mjR7Z/VzTeq/gtTLmpgvKm3zBEbP7YFoZBe2kTHgOmrgKoCY6c
	/b9UrgkblVKrfMvp/R972mDtMOFTxw3TJbL5ZLnQ2Jd2UKCAyLvrVl8ITa1W2Ch7PfKB31emtIh
	tB+KPBTV65UF+gLJ/E/0+blECbenZIDx7pAki+VyjIulNVMeDYTLIL/069sd4YQ==
X-Gm-Gg: AR+sD13QfGMlWrsoGuq/HIVyfuoMSYl20xVXrW1pTwdIzFN5jJuzSzHMTeCYTudyCXg
	MFmLtZua5mXE7YpEalrJpr5+C1M6UPx55yvLminy4okzsQHpJf6jtYtbjm/ovJgWpeE1YGpicUZ
	T6VPDX9mPixCcJRivbRsi6xTBgF0NBVOa74WYHI/JQVBC/EuZusCE2H8Ld/qJQLPuKD6ON1bySs
	6xMByKCZmiRrbn8D9DmgySgLlcV6ty7X4+cnN4nVhh4OA2U7y9SyFiUlhNmlNbZcemGArnslYGa
	rf9PPzuzDjxw94vpGlhwmQv8hZ6426WiiK71YZnBKf8iqlxzk68NTtrry1YCOLNBiHntFkrMvxS
	lrjz//fu5N9IM4ZZ2QN1sy8ER0w==
X-Received: by 2002:a17:903:32c3:b0:2cc:777f:d67c with SMTP id d9443c01a7336-2d6dcc248c5mr14169475ad.13.1787593793005;
        Mon, 24 Aug 2026 10:49:53 -0700 (PDT)
X-Received: by 2002:a17:903:32c3:b0:2cc:777f:d67c with SMTP id d9443c01a7336-2d6dcc248c5mr14168725ad.13.1787593792583;
        Mon, 24 Aug 2026 10:49:52 -0700 (PDT)
Received: from localhost ([50.35.46.84])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-327f90c0dd3sm30555960eec.7.2026.08.24.10.49.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Aug 2026 10:49:52 -0700 (PDT)
Date: Mon, 24 Aug 2026 10:49:48 -0700
From: Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>
To: Sudeep Holla <sudeep.holla@kernel.org>
Cc: arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        kernel-team@meta.com, Cristian Marussi <cristian.marussi@arm.com>,
        Breno
 Leitao <leitao@debian.org>
Subject: Re: [PATCH v3 6/9] firmware: arm_scmi: Refactor protocol device
 creation logic
Message-ID: <20260824104948.0000454b@oss.qualcomm.com>
In-Reply-To: <20260813-acpi_scmi_pcc-v3-6-cb6b88b4ebb3@kernel.org>
References: <20260813-acpi_scmi_pcc-v3-0-cb6b88b4ebb3@kernel.org>
	<20260813-acpi_scmi_pcc-v3-6-cb6b88b4ebb3@kernel.org>
Organization: Qualcomm
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.51; x86_64-w64-mingw32)
Precedence: bulk
X-Mailing-List: arm-scmi@vger.kernel.org
List-Id: <arm-scmi.vger.kernel.org>
List-Subscribe: <mailto:arm-scmi+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:arm-scmi+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: 69UgL45Hdge3Np-7LhKaCkQQVIbbuw5x
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI0MDE1MCBTYWx0ZWRfX60P/GmIL9HmY
 WlG4/Dsl888+V2GZ+KoNMNRQPpsSuvPMyoy9d5SeLwUfpRhhWmpr6YTnZDmiibeY0W5XsEpyaRB
 TabR5xVvWXOh0ljVaIHfxGZZaXnMudoWgbLbe3RZ0gRpYxQfWR9u0x/pU/ViHC7LjSsEjM2UDZW
 YgH1l6FQUQh07yvSVcG9wBpfXGS3X4CNfLfaTMeXvJ9+7PZI5cfhL/f2FPqmXXOaHqwNUunEOzf
 jVa3akrgxWRLzFpfi7VQCxU+ZcETDrDfgC4xxrSj8bwk4J4sf7I5mec3hQ20ogDZqUPXdUFseNs
 DhiesfDMpAdxG1KuogI57Mb7qIWM1009hvhwEP0JrvcfBm9/DpvRwpalUV7HYG2ObUKhc0btcAB
 VPoQyonBBUO4eRhcrPS1XusyqTbmYV00hQBnuyz/FvPCf8KfUw4fqswAOLaOlWmgnSeEIw6hnB0
 xT3rAnuvjgE1KWe+oeA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI0MDE1MCBTYWx0ZWRfXzNM02JYAiCdP
 Rfu8PdLcE+8tYY8e09oxeogwSn3cqT4tdhz1TCmVJn7cKWOSWU71GAD0LhSiO5f074ad+XrUBSh
 8UxVoybzqIRuHCm9xZLufXuAx6/ezq0=
X-Authority-Analysis: v=2.4 cv=L7ItheT8 c=1 sm=1 tr=0 ts=6a8c8442 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=qC1CW/w66vtJz1P9yTJxNA==:17
 a=kj9zAlcOel0A:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=uSDrWeKFmoLr1Pkb7YkA:9 a=CjuIK1q_8ugA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-ORIG-GUID: 69UgL45Hdge3Np-7LhKaCkQQVIbbuw5x
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-24_05,2026-08-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 adultscore=0 bulkscore=0 priorityscore=1501 lowpriorityscore=0
 malwarescore=0 impostorscore=0 spamscore=0 clxscore=1015 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608240150

On Thu, 13 Aug 2026 12:33:01 +0100
Sudeep Holla <sudeep.holla@kernel.org> wrote:

> Move the protocol validation and device creation logic in scmi_probe()
> into a reusable scmi_device_check_create() helper.
> 
> The helper centralizes checks for the protocol ID range, implementation
> availability and duplicate activation before invoking
> scmi_create_protocol_devices(). This preserves the existing behavior
> while allowing the logic to be reused by the ACPI path, where protocol
> child fwnodes are absent.
> 
> No functional change intended.
> 
> Signed-off-by: Sudeep Holla <sudeep.holla@kernel.org>
A trivial thing and one follow on from earlier.  For that just be consistent
with what you choose to do for the earlier comment.

Reviewed-by: Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>

> ---
>  drivers/firmware/arm_scmi/driver.c | 60 ++++++++++++++++++++++----------------
>  1 file changed, 35 insertions(+), 25 deletions(-)
> 
> diff --git a/drivers/firmware/arm_scmi/driver.c b/drivers/firmware/arm_scmi/driver.c
> index aad678db0f6e..951ba3df6ba6 100644
> --- a/drivers/firmware/arm_scmi/driver.c
> +++ b/drivers/firmware/arm_scmi/driver.c
> @@ -3244,6 +3244,40 @@ static void scmi_enable_matching_quirks(struct scmi_info *info)
>  			   rev->sub_vendor_id, rev->impl_ver);
>  }
>  
> +static void scmi_device_check_create(struct fwnode_handle *fwnode, int prot_id,
> +				     struct scmi_info *info)
> +{
> +	int ret;
> +	struct device *dev = info->dev;
> +	struct scmi_handle *handle = &info->handle;
> +
> +	if (!FIELD_FIT(MSG_PROTOCOL_ID_MASK, prot_id)) {
> +		dev_err(dev, "Out of range protocol %d\n", prot_id);
> +		return;
> +	}
> +
> +	if (!scmi_is_protocol_implemented(handle, prot_id)) {
> +		dev_err(dev, "SCMI protocol %d not implemented\n",
> +			prot_id);

Fits on one line. I didn't check if you modify this later in the series
though so if this is churn reduction, fine to leave it as it stands.

> +		return;
> +	}
> +
> +	/*
> +	 * Save this valid fwnode protocol descriptor amongst
> +	 * @active_protocols for this SCMI instance.
> +	 */
> +	ret = idr_alloc(&info->active_protocols, fwnode,
> +			prot_id, prot_id + 1, GFP_KERNEL);
> +	if (ret != prot_id) {
> +		dev_err(dev, "SCMI protocol %d already activated. Skip\n",
> +			prot_id);
> +		return;
> +	}
> +
> +	fwnode_handle_get(fwnode);
> +	scmi_create_protocol_devices(fwnode, info, prot_id, NULL);

If you take the suggest I made earlier to make the hand over of ownership
slightly more obvious by using the return value of fwmonde_handle_get()
then applies here too.

> +}

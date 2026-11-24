Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795560624;
	b=qwA6/R7DsYZ8FkOBTpXLdT9i7fyQ7faZjwIS+N1s/l8ufZYHw3LM29nvDiItJas1wKbz
	 z+Lygz79eq/QnsR49Sd4gPpxDAvzhk18yluG/LbYwlti8a4gGwghUspjXd6OepWvGOs8n
	 gn6k37FQPIJs7jKGgtKBr8QlNxhJRvuSBTDe6oIj9Mi4VX2pMY1BOmiycnZu6Y8P0f5gI
	 URTXT+GZ9CSkj2pDGmJ7MaG4llFJ6FamtoQKUGj6P1c6rgizW/tL/HSKnRB3wQU4XVvAD
	 sLRo1kiiogdeebAT1nPtytwKUK/Xg/OPBmYALQrz53yG4oXiayBdy5pAu1/pEaXDgng==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795560624;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:In-Reply-To:References:Organization:X-Mailer:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=e93XYvnnmR69yyrZgHmrvJK6riMd1HvvXUQLB/b+Wmo=;
	b=ptcioCvEYRhs3D51VY9Q/mHwM07RyV6MGpYc5iVBe8M13CxGCgPXDh1BODeyC82itfQF
	 iURuwZaofQSnhi3mQFLJaDKY70CcP4sIoNBGJoUTPD37JVXYDLnl1h1C/O6AzJXCXSF1b
	 iNiq5HPK7kceJtVv5BN4ssM0ojqFb80kADSPelW3tytyTI81L33HEACcMYnD5ndHcKc22
	 5XYrosE1fCFhpB/3B5bIqsJZJHjurHbQCF0a/olGQoZDPSlPBymJXER+YdD6vfoEa7pfz
	 RnZi1m0L6w2WevzuG0dasrSn70T0XRInUDj+16K8M+KyJn/JptpDfooMx6QoI8P0fSg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="TzX/Y9Tk";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=XupDSKsX;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90E39606A327
	for <arm-scmi@vger.kernel.org>; Tue, 24 Nov 2026 22:50:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 90E39606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=TzX/Y9Tk;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=XupDSKsX
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AOMarFV3520423
	for <arm-scmi@vger.kernel.org>; Tue, 24 Nov 2026 22:50:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	e93XYvnnmR69yyrZgHmrvJK6riMd1HvvXUQLB/b+Wmo=; b=TzX/Y9TkWw/uOJkZ
	b1ybUzAde1TA/HmSrnOU6olDuykfTgNFMJiO7/qL4o016GK1BGTw/IU0ltsNc65R
	DgTHZyAlgwgi3MtQJWTNwP4KpoNDnM453LIEqGEhBPRJHz3LPqAm8kqinHd8zoF5
	v/TSAMmlGr/KeJ1RkfFKiVp/UCNGR6z1xmNZ9EPEdhjmuXFy5y7Sg/28Zssldfse
	t13corOqh/ulmWOjQw74JeCk54fByFIpIksno+MoppOs3FORAm7jMFy5TT5W15FO
	LKj/4wvo6kgSPTem/8JUElunF26eVv60y4WGdW2lE5HZhxfLc3eYdkyf/jaXKpS3
	PqW6VA==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j5f00h654-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <arm-scmi@vger.kernel.org>; Tue, 24 Nov 2026 22:50:22 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-33c35f5ca6cso6820538eec.1
        for <arm-scmi@vger.kernel.org>; Tue, 24 Nov 2026 14:50:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795560622; x=1796165422; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:organization
         :references:in-reply-to:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=e93XYvnnmR69yyrZgHmrvJK6riMd1HvvXUQLB/b+Wmo=;
        b=XupDSKsXkN+qJBwREIeVSgDFOU9/TkqbB+jSi6xg9joh8lmSJ5vV/a8Z8AKRjRlYUu
         F2trWmI1LvlsSBLCy3clQkX25mitmdcyEm6XmbTHWfj1Qx7p1rHe0qsiHPIKKDdgfRRA
         HS+vdKn7o70eyBl1h6cXGaj/4jery51dQrU3pemHYb01Guvyn/D0jbEp2TCW06JaAP1l
         GjeCNn0GY67Dc67vO8iKD9bFxZvAGIUB1CPeJ4mLdbfB415gn6+aHx19c5r5FuRZzFgU
         HZx2VkDEI4wJB8Go6PYvOMxlhsPArd3hnyMkXHbZ2qOaObRDxRYrLPSITK1Y/7sS0uCo
         JQDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795560622; x=1796165422;
        h=content-transfer-encoding:content-type:mime-version:organization
         :references:in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=e93XYvnnmR69yyrZgHmrvJK6riMd1HvvXUQLB/b+Wmo=;
        b=zDk0MZmkydac77cSWwNZSkJDQeMjpwYR9iMZiK6LZ0Ae1agT9il+ue/LldJDYiWLhP
         fasjx17snUvB9j3RUA/PqtPul27Qfg8Mr926u2l1GRUCR6AqPV2h+g0lyQZVRh7wDENA
         2evNCUdO56JLz/B6AL+qKs9yxErTqLKDghsQ1UQbe/pC2nCSTN1Ycxyv/gZU4ti5rRUZ
         YmdxlLE7pN2sOVvqnpqD4fcrTlA+9fEvJq8RZECZnVgu8NkT+VY7i2NURO9AK2iiTqU7
         omwaXy5ixe1xJQQWp66n1FPygkycP2UVlM5Punf9lwM6qCHcPRxC5xt8lj7zg5alCisA
         2IWQ==
X-Forwarded-Encrypted: i=1; AL+hErGQJHN6Ac2/QlR7SWpqrM8PJWIpHeuYU82PzlXitEWnxdZHFExcJrZyTCm1conkdNWSTdtRSewNNA==@vger.kernel.org
X-Gm-Message-State: APuU4Z9bX18BQl1PerXIuDEhzJ5b2nzJyeAoRtSmNV2hpiFeFEVY8OlP
	Ih8w1ZQim2lyu5Jrh7SJ5dOZWYHBSODYxWoDRIzkGKJfJmyw2EF7cBaQxrVW0XRY3nbIlMQmQS3
	kRwnQz9IQbwKYt6wCJaw0/WHs6EyVggodKc6T/zUbVwbDXv+C1UK0JW7PZWp1qA==
X-Gm-Gg: AZFdTZcsN2IeDOclW2Gd9LDUJcbvLSdeGc6Suwm8mvFEN4+hggaI8CQzTS/KM6IMysO
	29KataZANd8mR/YNeTX/k5pM5EWtkucOLsu8EidmKrTe19xkdTknudhLJoZtGB2gS9VMIFTY7uV
	lPrF2rTB4yoMuCtqax5G0xBQYjELDPqMT2nSX3NIdBkcRoiWBWvAOM2sifnU4gnnJS2zOyRVp82
	MrJC7nCWeVZgj3CMmlelW8uf2dHj4spUwDvI7kalmW81CRhkl2vfEIvBxc3BPF+YcyaO32VvNKK
	tF1UYEHnz3oMIvcm+BOyiHhAba5eGGfRwbfePpE1VPyR6l5cvJysLC70YGOl1zVbzTMN8cuMSd0
	/zPrOXPk9G220pxu5bp1VEEbW5QaIvkbmvCN6r5reYEy/s6XX17S8ei/HL1Qhf2SLofLnCzhyW6
	iME2LcUbr8qOUdaLBUVrtMewJDMSo=
X-Received: by 2002:a05:7301:6188:10b0:386:9ba8:2864 with SMTP id 5a478bee46e88-3869ba82acfmr11462730eec.0.1795560621947;
        Tue, 24 Nov 2026 14:50:21 -0800 (PST)
X-Received: by 2002:a05:7301:6188:10b0:386:9ba8:2864 with SMTP id 5a478bee46e88-3869ba82acfmr11462702eec.0.1795560621322;
        Tue, 24 Nov 2026 14:50:21 -0800 (PST)
Received: from localhost (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-38566cd40c5sm57035445eec.10.2026.11.24.14.50.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 14:50:21 -0800 (PST)
Date: Tue, 24 Nov 2026 14:50:15 -0800
From: Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>
To: Cristian Marussi <cristian.marussi@arm.com>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        arm-scmi@vger.kernel.org, sudeep.holla@kernel.org,
        philip.radford@arm.com
Subject: Re: [PATCH 2/2] firmware: arm_scmi: Refactor protocol allocation
Message-ID: <20261124145015.0000358e@oss.qualcomm.com>
In-Reply-To: <20261124185111.1022322-3-cristian.marussi@arm.com>
References: <20261124185111.1022322-1-cristian.marussi@arm.com>
	<20261124185111.1022322-3-cristian.marussi@arm.com>
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
X-Proofpoint-ORIG-GUID: Qg5CM4-JfDUvlNLlRScbsG6D2EAPwt1y
X-Proofpoint-GUID: Qg5CM4-JfDUvlNLlRScbsG6D2EAPwt1y
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI0MDA4OSBTYWx0ZWRfX99KTX9DdgdiM
 gPgv1Za3IcPU+1+bgQ7uy+NUjMvU6SylfylLbuj1z27YcsFyxHo5e/8Q5bhkogBDdieoHbmM56E
 eCnNmty3ePV75OxymKywwug9XAl9ZMg=
X-Authority-Analysis: v=2.4 cv=JqtkP84C c=1 sm=1 tr=0 ts=6b0614ae cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=7CQSdrXTAAAA:8 a=EUspDBNiAAAA:8 a=dr6W7SPZJ_YoKJA_jgUA:9 a=CjuIK1q_8ugA:10
 a=bBxd6f-gb0O0v-kibOvt:22 a=a-qgeE7W1pNrGK8U0ZQC:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI0MDA4OSBTYWx0ZWRfX0b4E91c+as/x
 i4OpMqKxVPjPi/Yx+336tCav5xkkh5x7njQvRhbV0roIAAeLti1fSSA/ZOA+cn0Q8o2wwHaggpq
 1B2mjoAkkCLaAFjt1aO5OpaN9FlIpQyuBTKjwks7q0Zrl0ffSmcrgknnMMSgHNBQzN0NlzUXBbg
 o0X6BoX1M+fw/uym0YWqZJv6BGInBhjpNUrFPtlYgNoOsrVroe5tiBRqi03+wCNVyLt4mSrrWEo
 rgycg5ur4wNxZM0OKBrjsAH4jP/Aumw4PSjAgIMdT7B0EHCsqs4EY1bASl62fGz2kxBUhpY5nqP
 PWS7SAv0MCK2XrrlISUaw4CBYMzs1GvG4EiRdIM+XBZJxh76QV9q+wqZhuRj2xYpCumjB8FkWXH
 R3L0aK6i3X/avar7zFoNQLeKnJX6BtCxG/klGF0UsP81JfIjA8e2Q2xbuxYAVOBBB+I/cWpyBMR
 NivSMTcN2lSUyYWWeZQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-24_06,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 suspectscore=0 impostorscore=0 spamscore=0
 priorityscore=1501 malwarescore=0 adultscore=0 clxscore=1015 phishscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611240089

On Tue, 24 Nov 2026 18:51:11 +0000
Cristian Marussi <cristian.marussi@arm.com> wrote:

> Simplify protocol initialization and finalization using cleanup handlers.
> Relocate the protocol put operations out of the setup and cleanup code so
> as to be executed strictly after the protocol devres groups have been
> fully released.
> 
> Signed-off-by: Cristian Marussi <cristian.marussi@arm.com>

Lol. I should have read on! Nice that you have found the time to look at this.

> ---
>  drivers/firmware/arm_scmi/driver.c | 53 +++++++++++++-----------------
>  1 file changed, 22 insertions(+), 31 deletions(-)
> 
> diff --git a/drivers/firmware/arm_scmi/driver.c b/drivers/firmware/arm_scmi/driver.c
> index 2c4424aa0d37..199f0a189432 100644
> --- a/drivers/firmware/arm_scmi/driver.c
> +++ b/drivers/firmware/arm_scmi/driver.c
> @@ -2256,24 +2256,21 @@ static void scmi_protocol_version_initialize(struct device *dev,
>   *
>   * Context: Assumes to be called with @protocols_mtx already acquired.
>   * Return: A reference to a freshly allocated and initialized protocol instance
> - *	   or ERR_PTR on failure. On failure the @proto reference is at first
> - *	   put using @scmi_protocol_put() before releasing all the devres group.
> + *	   or ERR_PTR on failure.
>   */
>  static struct scmi_protocol_instance *
>  scmi_alloc_init_protocol_instance(struct scmi_info *info,
>  				  const struct scmi_protocol *proto)
>  {
> +	const struct scmi_handle *handle = &info->handle;
> +	struct scmi_protocol_instance *pi;
>  	int ret = -ENOMEM;
>  	void *gid;
> -	struct scmi_protocol_instance *pi;
> -	const struct scmi_handle *handle = &info->handle;
>  
>  	/* Protocol specific devres group */
>  	gid = devres_open_group(handle->dev, NULL, GFP_KERNEL);
> -	if (!gid) {
> -		scmi_protocol_put(proto);
> -		goto out;
> -	}
> +	if (!gid)
> +		return ERR_PTR(ret);
>  
>  	pi = devm_kzalloc_obj(handle->dev, *pi);
>  	if (!pi)
> @@ -2328,10 +2325,7 @@ scmi_alloc_init_protocol_instance(struct scmi_info *info,
>  	if (pi->proto->instance_deinit)
>  		pi->proto->instance_deinit(&pi->ph);
>  clean:
> -	/* Take care to put the protocol module's owner before releasing all */
> -	scmi_protocol_put(proto);
>  	devres_release_group(handle->dev, gid);
> -out:
>  	return ERR_PTR(ret);
>  }
Better though the devres group approach works best in my view when it's a wrapper
around a helper.

	gid = dev_res_open_group(handle->dev, NULL, GFP_KERNEL);
	pi = __scmi_alloc_init_protocol_instance();
	if (IS_ERR(pi)) {
		devres_release_group(handle->dev, gid);	
		return pi;
	}

	devres_close_group(handlde->dev, gid);
	return pi;

Though here you'd have more or less a wrapper surrounding a wrapper, so fine to
just push this up into scmi_alloc_init_protocol_instance()

Anyhow even if you leave like you have it this is a great improvement.
Lifetimes in these calls are now a little less complex to reason about.

Reviewed-by: Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>

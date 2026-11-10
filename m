Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794350835;
	b=mBBsh3fz6Cf7L3tZpLVP9yeTAOtt2t2qSs3zHrU4MgoK77MEv2sPQnTsyzVP9WRz9iji
	 moi8i09XC8RpjT+QqNXXfoEYJR1+Nk853XxxmzcGn229AXLeyIU3IA9tqs+lREQ+fjkKy
	 o2HXTpZb+Kx6+0rNtvyerWId9EN3VMFeBMQ05HEmV2+bzUrTpDBiYFB4pr8FVQKMNS3qr
	 XmnneK+rUI3UKemSeo/GFJSTjivCbGiSRLrWKA8660dkEo2LKmfm+2OEXCK+5PkCZ5BOu
	 Y5RoYjQsW+AuL7cNwbFVcTVZ1PrDEgUhsGD5NouKqSvZm7xj+keX1BNrOXmChnxIMRg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794350835;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:In-Reply-To:References:Organization:X-Mailer:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:
	 X-Authority-Analysis:X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=J4W0ikGgFM9zKPD/Fw/OVvFAzJFp3P3xmCgp+1t1D+8=;
	b=Q7JcKYXdroYma1b1lrcYHdI1u/QXXSlVdSjE7z6BGuIFizld+/xbz4AU/EK06CoyCwWr
	 HWfop0dVQ0f1E/ZQQKC4eJ35pZDj1eIuB98AlHBlpvVhBByrnO9pAbGrG2bxgQAo7NjoH
	 Q7LceDeflErDdHUYEVqxwwhLTlfBOqorp4wrY6vJvrhavZoVVdk3VRtjxzXpyi7k06yoF
	 4oUzD8apSOxDJtNkMvqUxCmPf56WQrFKfTTxRx88eHvBSSDX7zGjuOKq0TC0vKNO3oNih
	 zcmrEoO5h07eWAt81isf39n9Q/IJfAQGwfssueOrLscy9VDCvsTvFcV5uUxcqXIRz/Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=G312ZYHh;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=DzQQBjM1;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E02D3606A331
	for <arm-scmi@vger.kernel.org>; Tue, 10 Nov 2026 22:47:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E02D3606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=G312ZYHh;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=DzQQBjM1
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AAML5JA1117090
	for <arm-scmi@vger.kernel.org>; Tue, 10 Nov 2026 22:47:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	J4W0ikGgFM9zKPD/Fw/OVvFAzJFp3P3xmCgp+1t1D+8=; b=G312ZYHhWJ4RA8TO
	ubEW2+HPOqqU/suRUSiYvGRhEfntYedSdH5+UJsj8eLDQE6J05QChMWhdxfOFUdx
	t+DBWN2mcezGVO9FPgjtPClqb3K5tDg8yQGdbbIT1c/qX6jfVMbtV/JFJJzbbJhm
	5GYQ7pMJJXXJf4uEFkfeVFHvsawvDkuLAQp3h/52waU09fb6+8qSB16W+oLk5j3g
	m5TJ9Pd3przbuBfHtdmIU9bLqB+Wt4wWOEDNch6vxRzFEbwmTaoaBBi25HQ2OmGo
	54Vd955tycZQfSgarFEjIV72YP/cwlczbFZjRApG/qFJUbyjUK8g7Wgcok7c5yl9
	bTkPnw==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hv4pva3f8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <arm-scmi@vger.kernel.org>; Tue, 10 Nov 2026 22:47:13 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-37549877380so1947634eec.0
        for <arm-scmi@vger.kernel.org>; Tue, 10 Nov 2026 14:47:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794350833; x=1794955633; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:organization
         :references:in-reply-to:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=J4W0ikGgFM9zKPD/Fw/OVvFAzJFp3P3xmCgp+1t1D+8=;
        b=DzQQBjM1q7kWmLebokVMHwKDR274PgLwA/CubPlmbhj3PbeM4xu/fs7J6oAB1gQj19
         +vfmZ6vvkAPui8n/fMzwerjxCR2BVPc+TXh3nc7X31vZ34jaSH5uy3z+B+f6RUQ3zLqd
         S4EZRPkoPVQ/iVLid8+XL46VP4OBGZ0Wfdgeny4GuJsZUP1BdHHlQoJ95110dB3TGucg
         qlooT4KZyAkqpc6vTxD2CDLMb8gIVyJouRHC1LrmBQ6kbDKWXgoFXwoya/v75hRFm3pV
         5NDZgC5l5Yw+GgqcWD9Pe3QmXfETHYbQ65/VRjgn+Ciqc7FwqzyuTuNVWgSCjF+M/VKb
         F3/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794350833; x=1794955633;
        h=content-transfer-encoding:content-type:mime-version:organization
         :references:in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=J4W0ikGgFM9zKPD/Fw/OVvFAzJFp3P3xmCgp+1t1D+8=;
        b=zqg/6ZSdnIBT+hUG3cPATwsARMxuaMuj3KGcJFh3UBJiLlb1lxKLUmSCtdX+SA636U
         r9a5E7asDK3mQ142WYfoPH07zRs/AleCGJFCCLrigv1NkroURb9h2jysGqrIkchyDWrt
         yp7wP590m/7RTphUpRjapBdTiLE+dAmHnNAqEjPwKc4WNZwVzvgwKh0PWS6xINWQVZWX
         mRUYFDa9uQS8E+r3vH7/Xi+mO5FJd6afGw9gu5empxCSQazimwzH/aoqcLIYW99F+FSw
         AZlIIHk8sz1lx1E7K4EfexA4/Vn7SAaK20S4llCJbBjnSLi2WmvuZVi+vRV0ODB9BoXa
         K6vA==
X-Forwarded-Encrypted: i=1; AL+hErHFfNG9E9RgeAMhgdHeGx2QcOPj+T1QjGIfCpNzT5VyaA5g5WUs48i887zL+ElbwQOHsBJ/dFW96w==@vger.kernel.org
X-Gm-Message-State: APuU4Z8U2sUuVjDNCDqy8ak5u+81hTuh0qaQQoy6LSnMHTdHAY0Wigm3
	xIKUEQKto36YZeS2IS2G+I5Eb/0JEDb56SQut4VgMX6n82hPpDwHWJU+hamX+zGaor6/H586Gjp
	3ijy3Xg8ClGCne2OqSjyqfQHZCl2P2UFCmuj6tyo/LG+rTYq0tDZQohamima/cQ==
X-Gm-Gg: AYBFou02/YlPErUlw56xxwxDSwmChKJOrbL9Wgee1J9T3gHvEcDmGxqXFqvX3842gRP
	l9ZXmb+2EOVFUrEvN4H9apaoIzKKD6GtABWH4rNybZvkWiD9WMBZJTU5kRC93j3VSkQV6cmd3lr
	O90IiSmkOtIwnfXAIjqI9/oTLUGMnnbJ77xpSIRu+V+s9LnJXrcssagzfzzHBVC80RLnLfJKurN
	5CtGk9oM0vpSKtnOtiAWsgm3svepNtZAfhRpZ6zJ6XP1lnCC/7PcSRues4hCUd6Ttv/P91MWIbY
	xIJYlQkthvLY9Bkqu3DH/NAKv+MZPqNIGEwRVzc2BSw6A66eTJ05xO86GDseVXJVArWDP+9dYaZ
	29ZsOPDzkYL5HTEBrXyc6dJoTik5Ck71j4B1d2uevWI8XSImR/FCC6SygZP3+MGVy5+h3y5/1UY
	XHOWuquoINEuvGOyft6jGQQ/HN7/Q=
X-Received: by 2002:a05:7300:cb13:b0:376:7cda:a103 with SMTP id 5a478bee46e88-37686d30378mr1356759eec.32.1794350832620;
        Tue, 10 Nov 2026 14:47:12 -0800 (PST)
X-Received: by 2002:a05:7300:cb13:b0:376:7cda:a103 with SMTP id 5a478bee46e88-37686d30378mr1356702eec.32.1794350832037;
        Tue, 10 Nov 2026 14:47:12 -0800 (PST)
Received: from localhost (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3751fe2ff5dsm9820360eec.5.2026.11.10.14.47.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 14:47:11 -0800 (PST)
Date: Tue, 10 Nov 2026 14:46:35 -0800
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
Subject: Re: [PATCH v15 23/35] firmware: arm_scmi: Add Telemetry generation
 counter event
Message-ID: <20261110144635.00005964@oss.qualcomm.com>
In-Reply-To: <20261109091221.2532706-24-cristian.marussi@arm.com>
References: <20261109091221.2532706-1-cristian.marussi@arm.com>
	<20261109091221.2532706-24-cristian.marussi@arm.com>
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
X-Authority-Analysis: v=2.4 cv=XqZvqlF9 c=1 sm=1 tr=0 ts=6af39ef1 cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=7CQSdrXTAAAA:8 a=C8gR6w-PNCreNn7I4OwA:9 a=CjuIK1q_8ugA:10
 a=6Ab_bkdmUrQuMsNx7PHu:22 a=a-qgeE7W1pNrGK8U0ZQC:22
X-Proofpoint-ORIG-GUID: smzlYG9tcfCvH7Fz9WzODtuOWzUQP9by
X-Proofpoint-GUID: smzlYG9tcfCvH7Fz9WzODtuOWzUQP9by
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEwMDA5MCBTYWx0ZWRfXwgL/e8V/X7jm
 qHO9/lN+2IjESlZ3WeMffoj7jJBh2bLY+9f6C5JWrOlrGZxedxE5ScSPlaqTe0FHCnEyzLFCv2r
 81v5tXdYCKOkcGZIqb8KPsbpUCHzmLU=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEwMDA5MCBTYWx0ZWRfX+gSI8gUmKrMU
 dm/Nf2GGLz7kGv6rIHHbT+z9ZXnTSv5nUpAvajyAnZKgl/GanzsZd5ChNbYf9sBphFYCeAAv1zR
 eeX19yilVFB2oEftvs95SadpQ1bystMEcz5KCKj/688naPoXutVUpqW5R1n6EGKIkVNgweln5Yk
 FvrpPSHrHhSrMjcWnjyAMQn9Gfwp+4vQUiva55UcLupoq6sDVqPnGrVqPsZCab6FhJJGAwEw98J
 iwGsb6AxUXWacwApR9FrxDeWg+te8EXl8OmzCCeZLp1wicOworaebZ38wk/tVMImwaG+EMIfqXl
 WzPRmMQ4R2jTRKDEuA2ad6kCd0dYkDq+620+Oyl+8ZLr62uyLr4aXb1VpazRst0B2l8n5UWjlb6
 0au2adv8ERbFHtyxsCmo095aZrRMYlBzKINF14ybQ9QpHAnOGkGzE0vPWdz31wAHhMQHPNb73xk
 AQKzgArqHdE1Z3Un8wA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-10_07,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 clxscore=1015 priorityscore=1501
 malwarescore=0 bulkscore=0 lowpriorityscore=0 adultscore=0 spamscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611100090

On Mon,  9 Nov 2026 09:12:09 +0000
Cristian Marussi <cristian.marussi@arm.com> wrote:

> Add a per-instance generation counter to track configuration changes which
> uses the common telemetry events framework.
Why?  What's the usecase for this?
Needs some more information or I'd leave it for now.

> 
> Signed-off-by: Cristian Marussi <cristian.marussi@arm.com>
> ---
> v14 --> v15
>  - do NOT reset generation on RESET
> v12 --> v13
>  - update generation counter on do_xfer succcess even if failing to process
>    response since the change hass been applied: this avoids state misalignment
> v11 -->v12
>  - reviewed generation counter update logic
> v6 --> v7
>  - use new Generic event mechanism based on EventFD instead of WaitQ
> v5 --> v6
>  - add relese semantic to the atomic set of the generation counter
>  - use new eventfd_ctx common event logic
> ---
>  drivers/firmware/arm_scmi/telemetry.c | 46 ++++++++++++++++++++++++++-
>  include/linux/scmi_protocol.h         |  6 ++--
>  2 files changed, 49 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/firmware/arm_scmi/telemetry.c b/drivers/firmware/arm_scmi/telemetry.c
> index ba17204bbfc4..c21700bd1b43 100644
> --- a/drivers/firmware/arm_scmi/telemetry.c
> +++ b/drivers/firmware/arm_scmi/telemetry.c

> diff --git a/include/linux/scmi_protocol.h b/include/linux/scmi_protocol.h
> index af882c1e4ea4..585eb3a4684e 100644
> --- a/include/linux/scmi_protocol.h
> +++ b/include/linux/scmi_protocol.h

>  struct scmi_telemetry_de_sample {
> @@ -1003,7 +1005,7 @@ struct scmi_telemetry_de_sample {
>  };
>  
>  enum scmi_telemetry_event {
> -	SCMI_TLM_EVT_DUMMY,
> +	SCMI_TLM_EVT_GENERATION,
>  	SCMI_TLM_EVT_MAX,
>  };
>  
> @@ -1030,11 +1032,11 @@ enum scmi_telemetry_event {
>   *		    the ones belonging to a specific group when provided.
>   *		    This causes an immediate update platform-side of all the
>   *		    enabled DEs.
> - * @reset: reset configuration and telemetry data.
>   * @event_subscribe: subscribe to the specified event @type using the provided
>   *		     @eventfd_ctx.
>   * @event_unsubscribe: unsubscribe to the specified event @type the previously
>   *		       registered @eventfd_ctx.
> + * @reset: reset configuration and telemetry data.

Unrelated change.  Belongs in previous patch.

>   */
>  struct scmi_telemetry_proto_ops {
>  	const struct scmi_telemetry_info *(*info_get)


Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792672093;
	b=tQNUOZ1lLU45ZMt6I3coqeEJbXIzOIv3hVXPAt/NydnozDJOOxYJGoc/exgpmj6y49DO
	 UbUFBtIAzFdwuz5ZZKOi9Ik4yU1PGRXCCkjPawro566mJPjgJXcTFPZtb2P6Ijh6qpqVQ
	 vveHjDEP+e12OVG6yrO8EBvgjJ2E9xSgZIQg+bbj9zqvTYl8pfEHjMEdOHZJUjt+QBFn1
	 Yw+acXmXwUPaWu0My/R90ydY+CeIQ0M/foh/75+TYhUmOWYrQRBfYL5MwlNbN9FEByuHV
	 Uqn6B787heekhzLQK2MpOpckIl2hg70ml6hTafvFKZNFEP0Rl+L1AD4tvdwh5BDnVkQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792672093;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=ffhVe/j6yRlCzr2Q00fG+yNfZLrhxessWH3dfhlXdzY=;
	b=drfYZOLlhNFH3f8klc3TY1+8cXIWQS9VoE8tPQ92So5vyEx1COGc6F02FfgeA2gsj9Ti
	 A6HNUrzebWOO91OQaRwb0JcMNCygYtmC4toSWqXUw/mFPN/EmdWTTOua/afP/79/Fouqn
	 HdSD785tticcW06gxNJYDsaAhsQwguBTRejKlzF2sYbvvgGZm3wGSOtYUPpGfrIEPNl/h
	 zg4UmL3p3nBtL1VMhjCq06pYoVxsMzSpB8VqAzOwTG12jfgtpCEGW7O7n8hGWLeQryP9t
	 KoFsWNFWPSXwkXpiIRJZSnlN/Y+NkH2LTKqP0FQzVI5NRnFkEPzqeVQboUe8XoBbM0g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Qk7LeKmg;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="YDDvB//5";
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7E59606A324
	for <arm-scmi@vger.kernel.org>; Thu, 22 Oct 2026 12:28:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D7E59606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Qk7LeKmg;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=YDDvB//5
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69MA0BFA2396813
	for <arm-scmi@vger.kernel.org>; Thu, 22 Oct 2026 12:28:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ffhVe/j6yRlCzr2Q00fG+yNfZLrhxessWH3dfhlXdzY=; b=Qk7LeKmgKfl8ASss
	r/S31nkFb5YhbcmUSm5td/BECe5v1/SgAUKL+3yoqW/lRibA20tcdz8GOCTejfBg
	SJnhc6mDE3oLYQ7nfvuFZ8AOxYLsPwr0r1E38ln8TXP18dG+8EWHGPBJlKfBr3fE
	VcGF4BIJOrqH5FDylxqT4Lq/KDCj1IJpqJhG5yfK7/MIdqpE/fgqBrq9Q/nILTw1
	IzY44rprRytmIoIGq05urfI+V3wtpeFQtS4HFrD3I/HhyzSUlG0u+Vhxnhui2rLv
	qbPfovCQT1cJYHYgXzKW0O4anTJTXMj/jGOLvJ/icvRKkqNw4umV6qAIrYgHlM58
	W+/f+w==
Received: from mail-ot1-f69.google.com (mail-ot1-f69.google.com [209.85.210.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hf93bu6b9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <arm-scmi@vger.kernel.org>; Thu, 22 Oct 2026 12:28:11 +0000 (GMT)
Received: by mail-ot1-f69.google.com with SMTP id 46e09a7af769-80a4a17618dso1662072a34.0
        for <arm-scmi@vger.kernel.org>; Thu, 22 Oct 2026 05:28:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792672091; x=1793276891; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ffhVe/j6yRlCzr2Q00fG+yNfZLrhxessWH3dfhlXdzY=;
        b=YDDvB//5wUrrsMjA+YOjITn6gFH07RI8ByXRGm5tbEi/x3FTKojCVivuRWJ8C5RsGE
         hpAN++kQIO2OzyiQI61LcvkrklJLzwQhpZe0FPXz+0w977W+VaOzM0xrifW2TDcLrySu
         ntOAlduDV/IVdjKapF8Sr0LDsRgzDICMUTekO0VJsHXE2UjAySxZ6INfhIbHZwZsf/y9
         otgi6zR74w7vRYgkYAy4l2d3R4CCVY9tNUrFutkieB20d0VTUXkEcX85/XMgBYH/YwCi
         7ePqJ+8bn2e1Jp2AVdwBRmo2ZNnqF/m/kfZDxOIoGZ6cgr79hzVrAZCvEoZwSqBKuQnl
         Dt6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792672091; x=1793276891;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ffhVe/j6yRlCzr2Q00fG+yNfZLrhxessWH3dfhlXdzY=;
        b=PL12oU9o/8PR+TiMEyzA4GtX36+CHgs4c5aNuU2E83MQySKB4DJlbSlEcy9QKQmBrX
         3qchF4CZ/0BXc9uOIjWE8qd9PzwFH2TvJ7w4JK758XUQH0zBUADYhkqQxFOJQAl6Ysdv
         MkEJXCAeH+wm2GhR7vuLfjrjbYgBB6L5bF3eI62Pv0Sw0bsoUPTBE9KQNUcF+Be5QAJ/
         83RZWMKPje+LhyrxUiGPzuvdAwtmiBFDRMWXgygB2lOaMAk8ZMo1r9Yaw3NTxGksUTnl
         R/VdFK9RoDW9FyjA6M0G2sqMYY0pwYjxX5Nfc3O8R41MW0ePbSg5glteq8Xw6w70StKw
         13fg==
X-Forwarded-Encrypted: i=1; AKwUvBz7GLnceQL1CvX6+9TStjF5Sj3FlSvOow2yNDkf+sbWd61U69xgcS+gZ79BoDLhA6OsaV7wdPEtUw==@vger.kernel.org
X-Gm-Message-State: AFq9FYIgP4xDv2vREgUfUCRUstB2T7wljPaYVFje80HhX7zaiabYySP7
	dpUSxQLFWWKLiXxtOD7W0gXxkjfN/9tB7Xe7DZorQeAPfmWaq44UOvLGK1gYvmCGSoHDpNL8vIM
	KMhbUC69wzEmDtJln58+Xdjc41nq4bJrKjbZpEgsDQU87O5EEFnA45vydSrcOjw==
X-Gm-Gg: AYBFou2+yUOQJio+WgItQxGzRee9F9CVGGiVWwGZDuRGlySlv59FFvuYFYf/KnndX9i
	w1EXNjJ+FrpI+PP9PlU9yKlE7lzA43uBgI7GUH/qrrn8rWs5ToZ/4WBYZDVxR8pKIIfTmW7gm0Y
	RDlHhMyhR5dhwrspLPA7VWGi2kDqm3PZ5evaCKEDyVLbwNlV6uuj8n46oNG8N3MQnnXf1KvB5h8
	WelMAFo4/WTfCI6PFj6dtYfdTAofCNFlfWFGlGgi2GZnOWJafATQ5OTNh8mvVMZrszBAAQWS3o+
	9rmlqdNssd9lp7P8lu43d3b1PN4+y14E61nJj5e3/tgmS8V0mVovCnfbqSob/dZY7ZqQ44DXDiX
	79eJwkRqVaaBrhwX2O56eLKHLderzF4mT
X-Received: by 2002:a05:6830:6f88:b0:7f9:555:1def with SMTP id 46e09a7af769-84e30c31e32mr1258632a34.11.1792672091196;
        Thu, 22 Oct 2026 05:28:11 -0700 (PDT)
X-Received: by 2002:a05:6830:6f88:b0:7f9:555:1def with SMTP id 46e09a7af769-84e30c31e32mr1258609a34.11.1792672090792;
        Thu, 22 Oct 2026 05:28:10 -0700 (PDT)
Received: from [10.217.219.98] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-84cbcdd9d82sm4892517a34.10.2026.10.22.05.28.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 22 Oct 2026 05:28:10 -0700 (PDT)
Message-ID: <d6a3a783-c6ec-4f93-83ee-ce30848917d0@oss.qualcomm.com>
Date: Thu, 22 Oct 2026 17:58:00 +0530
X-Mailing-List: arm-scmi@vger.kernel.org
List-Id: <arm-scmi.vger.kernel.org>
List-Post: <mailto:arm-scmi@vger.kernel.org>
List-Help: <mailto:arm-scmi+help@vger.kernel.org>
List-Subscribe: <mailto:arm-scmi+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:arm-scmi+unsubscribe@vger.kernel.org>
List-Owner: <mailto:arm-scmi+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 6/8] i2c: qcom-geni: Vote for SE clock rate using OPP
To: Praveen Talari <praveen.talari@oss.qualcomm.com>,
        konrad.dybcio@oss.qualcomm.com, Sudeep Holla <sudeep.holla@kernel.org>,
        Cristian Marussi <cristian.marussi@arm.com>,
        Ulf Hansson <ulfh@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jiri Slaby <jirislaby@kernel.org>, Mark Brown <broonie@kernel.org>,
        Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>,
        Andi Shyti <andi.shyti@kernel.org>
Cc: chandana.chiluveru@oss.qualcomm.com, arm-scmi@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-pm@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-serial@vger.kernel.org, linux-spi@vger.kernel.org,
        linux-i2c@vger.kernel.org
References: <20261015-derive_clk_perf_tbl_from_perf_domain_opp_table-v3-0-5da1096243c9@oss.qualcomm.com>
 <20261015-derive_clk_perf_tbl_from_perf_domain_opp_table-v3-6-5da1096243c9@oss.qualcomm.com>
Content-Language: en-US
From: Mukesh Savaliya <mukesh.savaliya@oss.qualcomm.com>
In-Reply-To: <20261015-derive_clk_perf_tbl_from_perf_domain_opp_table-v3-6-5da1096243c9@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: 1H6TyZLzYbLDFVGD1ReMiIYTL_0GeoHP
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIyMDA0OSBTYWx0ZWRfX7QD49lAqUiOW
 60OlhiNGJDBU/KtvEPExtbOdnFq++z1PvVnZkc7xFIp2TkT4WzUSaNwFXQOj4jzDfCxO8nklGV2
 EoyyQ07qzhnEhn1QsQ8VQ9hQN7kLats=
X-Authority-Analysis: v=2.4 cv=F4fC5ahN c=1 sm=1 tr=0 ts=6ada015b cx=c_pps
 a=z9lCQkyTxNhZyzAvolXo/A==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=gi_f2RLh3HdMVU9WvNgA:9 a=QEXdDO2ut3YA:10 a=ZXulRonScM0A:10
 a=EyFUmsFV_t8cxB2kMr4A:22
X-Proofpoint-ORIG-GUID: 1H6TyZLzYbLDFVGD1ReMiIYTL_0GeoHP
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIyMDA0OSBTYWx0ZWRfX02wzUyXoZPJD
 OucsUBk+8gjRT91ARItnye/HM8Z6005+fuD1tljUiFPVPTyXAgFtsnOAQopCtkzgK/fDLN1GOrb
 HpXHBp3QjlS565Sjf0QIc4bh4bumpVG8ou0YKxGXVIQwnoZeEPBBDvW/GyZdMfg9FT4lK9OfkeI
 WQQLa79UBJRr/kY459Yh5H1v23bKJr4mm6H8fpl60ov6dySRXpvxr8npMvIAp2l3uImY4viKkSQ
 00JpNNlfgYUIuDd20RxfI5wEdOCA6TIXTscnbYyAMWOHtL+B3uv8GfYicTt8KomDIaJhSUYdowK
 ksDo7aAs44mCpM5G8Dkb25VgxUjJ+geyFdPiVly495217g1u8UfHsttp5PBYTeXr6z2RtnWecXt
 VLd2jaThSdmQM54bmJp2X+SDQSnrM/MPYAIPj8w4sVI7+CpCQp6MjahqKbF2xKO8KfbLsvRM17A
 pvIWrOUgIyRYzHA2YKQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-22_04,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 malwarescore=0 priorityscore=1501 adultscore=0
 phishscore=0 bulkscore=0 clxscore=1015 impostorscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610220049



On 10/15/2026 6:28 PM, Praveen Talari wrote:
> The GENI I2C driver selects a source clock based on the requested bus
> frequency and programs the corresponding clock selector. However, it
> does not request the selected source clock rate when OPP-based clock
> scaling is used.
> 
> Store the matched source clock frequency and vote for it through
> dev_pm_opp_set_rate() before programming the clock selector. Also remove
> and restore the vote during runtime suspend and resume.
> 
> Signed-off-by: Praveen Talari <praveen.talari@oss.qualcomm.com>
> ---
Reviewed-by: Mukesh Kumar Savaliya <mukesh.savaliya@oss.qualcomm.com>

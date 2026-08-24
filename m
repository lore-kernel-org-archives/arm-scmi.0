Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 796EC40E8CD
	for <arm-scmi@vger.kernel.org>; Mon, 24 Aug 2026 11:40:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787571609; cv=none; b=YVAx43kCbSGXjcxaVK5O8iTGz02w+dLHfTRiQWMRvxle3udz0Msl05ygjxLeJnY7DktIg0fZzNzhOfZnrQJb0pfg7JMvyBXpo6n0NjF+mYjZa7ptIqeHgjQjIv/7l1fdaKzBvJglUUPwmmnpXuM/5dGbIecpSijCUTFiOXprYRQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787571609; c=relaxed/simple;
	bh=mhM1nJgariA7Drln0GvxSUCFkFDiM3od2qwlyHrudFk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Uj+52caPk9g5k1dysp+0xytfOreTNvGrNw03+lLEv2cKMa3Bx2PPi9Ag1JdoU6ifm/ngv0rgYezW3Ui2W29FBwImTlOo63OxKOzo/l+lZ/6yQBBAvnWtzrvHfG4lihEFcawVEQgtzGS+Nu9kTlm0YnWBZ+jWcx9c2JuCGOMeN48=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=iFJI3fRU; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=DbsCTWw9; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="iFJI3fRU";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="DbsCTWw9"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67OBMd2J3194970
	for <arm-scmi@vger.kernel.org>; Mon, 24 Aug 2026 11:40:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	3PFyPMRWHHZzfiXJ+pBlyqnTTzHCJvh3CG4+6T4pjYU=; b=iFJI3fRU23uszfgu
	5sEEIzYEiTTWjY1lLLHsvKScGW1RZlun7PE2G2leVNNyC5gj+t4lxuZpkWDMJBoZ
	7EFRFKRd1CkFXa2bxK4W4YfsWUUTBSkkAQTsXFtU86Ys5cOj6uMCbzUrtrag4eVb
	cJl/kxC9jSRcvT5OkGz06ZeFsHdmpF68J5Be8yqRhapo5MsFG38diRuSJIk+XBTu
	tushN3mu71MMuQnbh3Ln2PThkoIYOfGfVBX39ZSTJQnrpqVpYNiH5vXzCbIw7FEx
	6+UeqFTb9ea82QUhLuPY69R2WrpoCo7diq1RQKGBo5bL3oLbeLX6Mvp6+fg4q1R8
	G7cD8Q==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g8hjgs14f-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <arm-scmi@vger.kernel.org>; Mon, 24 Aug 2026 11:40:06 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-385d2703b64so4750152a91.1
        for <arm-scmi@vger.kernel.org>; Mon, 24 Aug 2026 04:40:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787571605; x=1788176405; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3PFyPMRWHHZzfiXJ+pBlyqnTTzHCJvh3CG4+6T4pjYU=;
        b=DbsCTWw9qBigNpukJCfLohk0niBZIcPnLiUe5MK1YvR1kNtfOL9bxrmgeE24mIz/Qw
         YVPNF3l961Db6M4e8+Kozmr4Ubs0I018s/DyrOW3PjyCZbTYE7jO2peV/HYk0vXjrxN8
         Tt1LjCIi+EFKNVqLIIoLmfDRntM7X/W4RkYUFyUEzge/wo7M/yI06K3Fj/Yj6oltqX3f
         NeRXNY/BtInmePjX2EGPotcRnsQODsm7UR6gFvSw7B7LpTB/rD5OSXGjD9FVZJpH+KeH
         7UidrantMfF5xAQmM2QKktkZcpDZYj8DpuUBJyTRvJHoh+AQl5gB/tgRKpCyuqmEXGdR
         9V4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787571605; x=1788176405;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3PFyPMRWHHZzfiXJ+pBlyqnTTzHCJvh3CG4+6T4pjYU=;
        b=gD1LHdozjzqryoAddW4KD4bjcxuSf751IuzFBq6ulj+fC9ff7ikqJPipM6JNFb8BcI
         /qKifieqyDD5tCiytX7x9hsJn3cFvA/1qqSk0gwoPdI/cx+z117W0uDPYyDMIfLmCygL
         RuBEeSzfg8hocKQdjSah0AFX5Xjz4sD7je7tN6PIw4pbQCU8t+gxxfYq99js/OVtmhWM
         If1QXSeCPsfMtRLr8TABT3ZiIRmf6/6C2jF0sx5YaWqBRl9HBJrmErRoLMs8D7TxS/X1
         veIdjNzlQ+H6WAjcY7OPyDqzocTkJsnF1ETMO84sydaEvN2VPAn2Q/IoXISXiIsx+GIC
         b62A==
X-Forwarded-Encrypted: i=1; AHgh+RqJ3YU74R9WPM7ZzE5p4dpW6qBJdfYCovuEf2HxlN8Dkukn0q1X1hJLf1C6aWODqvvfst9qxsImwA==@vger.kernel.org
X-Gm-Message-State: AFuF++kgetir9HxQqCAg2dEzN6hqKaIVEvvB3KDit/efpzYng/mlD8Ne
	Ms/IIXPX1fkEMCQx0BvVXyPTTcrZKBtSv6YzJh8tF7VU3Jognrkcror4t0AI997dHJXxiWXkiUJ
	v9eXrKkVdnoRlDLr+FFLymabH54/RYDrYT6Ja3OqunRBbTxvD0UDIb4NR4XVxnQ==
X-Gm-Gg: AR+sD11yl1QajWB5AdwSq/IYGzYY4mN00JXRzH+pnNdpNHjSJWkENbRXB8LTZAJeK9P
	/ZlnQ0SrBKAt0siLkQ9LIBH9hmXPo9VSBip+3D3mwdKIeBZUb2uLOfQ2qw3XqatFro/f9eiU8MO
	XqurE735YMPBsd9ty5uWaargau7gsM2VyTmn0Ue6KnUaeHi9xjYnKgKvdFxerUBm0KzXRtuYOQj
	1mi9ojpFFRvOjDNnS8u4dt3m0E05QVzuM/V7u5m6bvPqjXD8RfZf4FMVjTpHJ+kjNokuuhkMlK4
	s2clRQI46Tn+INs1kLKCEuKqqHoE0L3V8unVENwNeHbc+NtcWR1eekrr+Z0WmCfI4cL7gH4MmF2
	LidinzUSXunr4JehLdcDAkE3GLdQ2gjI/2dg=
X-Received: by 2002:a17:90b:57c3:b0:395:8124:ac53 with SMTP id 98e67ed59e1d1-395c4fa443fmr22916685a91.6.1787571605402;
        Mon, 24 Aug 2026 04:40:05 -0700 (PDT)
X-Received: by 2002:a17:90b:57c3:b0:395:8124:ac53 with SMTP id 98e67ed59e1d1-395c4fa443fmr22916593a91.6.1787571604902;
        Mon, 24 Aug 2026 04:40:04 -0700 (PDT)
Received: from [10.217.218.158] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-395e49e6f59sm9678818a91.12.2026.08.24.04.39.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 24 Aug 2026 04:40:03 -0700 (PDT)
Message-ID: <9d73e9aa-240c-40b5-94cb-9b1b9c2ee380@oss.qualcomm.com>
Date: Mon, 24 Aug 2026 17:09:55 +0530
Precedence: bulk
X-Mailing-List: arm-scmi@vger.kernel.org
List-Id: <arm-scmi.vger.kernel.org>
List-Subscribe: <mailto:arm-scmi+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:arm-scmi+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/7] serial: qcom-geni: Use geni_se_set_rate() for source
 clock configuration
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
References: <20260805-derive_clk_perf_tbl_from_perf_domain_opp_table-v1-0-61171ab1cdce@oss.qualcomm.com>
 <20260805-derive_clk_perf_tbl_from_perf_domain_opp_table-v1-4-61171ab1cdce@oss.qualcomm.com>
Content-Language: en-US
From: Mukesh Savaliya <mukesh.savaliya@oss.qualcomm.com>
In-Reply-To: <20260805-derive_clk_perf_tbl_from_perf_domain_opp_table-v1-4-61171ab1cdce@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI0MDA5NyBTYWx0ZWRfX0hipOLTFSrX2
 60oT7S146aF7gFOZhMkeGxVqjUBJvktS2Fg4NqRKx/3eGaThtoOfENuOv6CLLt0mPyBbXKGiGSR
 FZ0ntq7VkQbZeo4PeADC11MoPxkGUCQ=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI0MDA5NyBTYWx0ZWRfXwEWdYyrI4WQd
 ToiHEGkSPJVu9c1Kl1trhm9wBVnr9v2Pcf+CVHleqfW//UbWEtGn5NSfRIkMNugaKXAMM/S/9tJ
 8A9/nC2HUTB6Mw23185PmMZF9Bj/vCclyR7zvFLmVjdXGneL4GSfMYDPStdwM6sEXTv3EeelSFQ
 lPbmA8gsInJXQY1cJgrIKtVUxRNLNiAvS2WiImWmQan03rB8pZYtGYL6wvYZtXfRH6979MPkdNc
 t1UZ00+alBKdfsXlP7fpm/3ewoHmVG820AgJsB2OU7ezCdTcQfPusS/1QlJSJJ5aBTsQj18gvWS
 YTHyQeTS/TWX06O+5B3exIFy+DtDOLnHvoVQdW0nUoHOQrKtvAefv/IF7DPRMez6Id21jQLfPLN
 efYTnq6psLru4XEfWoWq/bmgIs+LcIUeI1xP9Gyi+CUdcn8ZPuqP99V364/qeuC4Nx4NnrzTmCK
 R3hjv0YZQtbpV6wRrGA==
X-Proofpoint-ORIG-GUID: 0Uci-mJeK3-z-KUMNjU8wmKSI17MHHLV
X-Authority-Analysis: v=2.4 cv=CoCPtH4D c=1 sm=1 tr=0 ts=6a8c2d96 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=qpM7YB9Ikm2qReIqoCUA:9 a=QEXdDO2ut3YA:10 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-GUID: 0Uci-mJeK3-z-KUMNjU8wmKSI17MHHLV
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-24_03,2026-08-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 priorityscore=1501 malwarescore=0 phishscore=0 bulkscore=0
 adultscore=0 spamscore=0 clxscore=1015 lowpriorityscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608240097




On 8/5/2026 1:27 AM, Praveen Talari wrote:


> @@ -1474,7 +1473,10 @@ static int geni_serial_set_rate(struct geni_se *se, unsigned long baud)
>   
>   	uport->uartclk = clk_rate;
>   	port->clk_rate = clk_rate;
> -	dev_pm_opp_set_rate(uport->dev, clk_rate);
> +	ret = geni_se_set_rate(&port->se, clk_rate);
> +	if (ret)
Can you add trace log with an error for geni serial driver ?> +		return ret;
> +
>   	ser_clk_cfg = SER_CLK_EN;
>   	ser_clk_cfg |= clk_div << CLK_DIV_SHFT;
>   
> @@ -1513,7 +1515,7 @@ static void qcom_geni_serial_set_termios(struct uart_port *uport,

[...]


Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51E993E4C7A
	for <arm-scmi@vger.kernel.org>; Fri,  9 Oct 2026 07:18:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791530300; cv=none; b=QwdUJLE+aVjVj4NGfNHb0c2bMQF6oz4py4eIkDVNL5GElzDrMNV943O5my1Ov1ucWuKDtCLP3JiINqZWv1rNCLcmsbHc6fNYfpyyl8aQVt/ILbATWV+Hk6mSjsjNq79S81KfZO6RccyY/IDyEQNQyJzsRGnhfbzslpRbcYqP/zo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791530300; c=relaxed/simple;
	bh=Hb0rWW40uKXilgUjU9jGWK/YbIuEzO3fmI8pUzTP80M=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=cEXGtIqvbCgdzcDt3USLHTFdc/CHIVSNYl8zsklRw3Us3dMT7UquLszJhJg7QJ6ke+olcFYZAn8dI5+qBaza691GidTE8No+F2BYy+YRTPehMO4W/iUs4UNifHuhn1MFrqsuYXlldW9XUHB7KdSxXvWKyD239Qvn5YJYG5PrWv4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=A8j7lPXI; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=PZ0hMFhO; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="A8j7lPXI";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="PZ0hMFhO"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6993HfRR564984
	for <arm-scmi@vger.kernel.org>; Fri, 9 Oct 2026 07:18:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	mNde9hgXNQrDxjgqmzc1QflzS3/KQtZKPHcsGvNzPEY=; b=A8j7lPXItWDRlbhr
	o+oL+AXG1K2QL1HZDerROxemTLf23p4YhRJIh9NsaF9tGAWmcbpm91baVgAByifj
	teZ0yy5FN1SWwbLkBl1kzQL1oudTQR+Jzl5FOydTR+clbYRouOHtV86LsZroqsac
	qTlhBL62/nZmfjPRPXCgcsPzPSqipgbIPWrmytfbLYTwBuvJVO+P9oCkCt6y4tlx
	4xsorh+lfFY5NmoRKvSPRFXhxPSxAZI6QgDHVVVBEYGx/mBUdsjNy7w6kR4yNTjy
	1SDVwePtnUmrn9jlgN+w+kfXSW0UYkv5IeXmKTcJZWhisx3o9OEcweVFK2Qa/Kwt
	lUfRhA==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h6fxkabbw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <arm-scmi@vger.kernel.org>; Fri, 09 Oct 2026 07:18:18 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-38e8fee6af3so7085496a91.1
        for <arm-scmi@vger.kernel.org>; Fri, 09 Oct 2026 00:18:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791530297; x=1792135097; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mNde9hgXNQrDxjgqmzc1QflzS3/KQtZKPHcsGvNzPEY=;
        b=PZ0hMFhOTaIXhlFJofCzLDRXZVFSDhe+aahXuE88YaKtRHXhbJJJPXar9KM6HB2A4m
         TphJHI3MHtVpbHN4EUiijdjDO7I4zxRbpQrqhNTs9dCROOjRZCKXZv/lJpnY7Zc+svQM
         72lHUKaF5O6/zRUUiWadlQRuFh0WhYTeAUbHM1K4H9oxfGVLtVXaH2WeTA3KaxAc/snJ
         CjwyQJ2bmcrk+AkOvmUAx5WpUWmTksdgVUy4NMOXchAnef8qIxXwtEuk5lIaHhA9B3fH
         iXfjueN9iBjy2lwLVWQu2ilFB/8G4OpgtPaHnLKsnU5CBe0jkF905nqp/dhGMvBNFQ2w
         NyBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791530297; x=1792135097;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mNde9hgXNQrDxjgqmzc1QflzS3/KQtZKPHcsGvNzPEY=;
        b=1pQEshr7W2bldLlCXxikjr2pnL2zDB1gZk+OxL24oGWcSlG3WDmv8YpIl1E0ZYLAxU
         JOLc4BVYSdhFlIGt30ieLDQa9wcV+iwmmkp492p9aw0ZzAlDmRfWhRAIWtjgryLDj7y/
         3Hmgz6NLvcLc6O9eRMjCEfDK75F2YDbERcFMnWnORorgpbrKoxnjPvS90dO8KRVvC42o
         IZ1YmjODP9A4vHvujAFo8OGUm5nAS1VCiDlNW87xQy5sa+zy4ZCyzDozIojHLRQ+ldOi
         fCeRu/wMXJW+X9xY/vdUqd+GsfHCWnE0NrisXWE/W4/jlE0UmTrQUzq/EHglWiwxzR3q
         olcQ==
X-Forwarded-Encrypted: i=1; AKwUvBzurkv5y82bSpceThowIimt723Oz8nINrQdU0nxwc8kS3UTTej0mWSOJ/uwsUTEk78G/gGbwdx/gQ==@vger.kernel.org
X-Gm-Message-State: AFq9FYJy6GdAL1VQbfU3aD8+UVMy1AVA9YKIqVRMGhPi++of3SrYFIKi
	uRjk3gT98RwEFv9rHx0vGOolMhaC6y4jIeSvpxhh5YTTEuNo1kkqucLf1Bq5SFV/nlhFxb8azlj
	vaUt5/p7Yr/D+Hs6oqMLes8gkDuAWP01XILYt7S+l2/rQ5vPPvudaFi4Cdt411A==
X-Gm-Gg: AYBFou0EBt0elaw2xHAGQBpHkBCFmhfCJRSg2MBRVzAiKRYHVaJFAmdnhqyBBnSlOgr
	JsucgvdsnEAqu8EnBWJx/663bCFQEt5R+0xr/gJZkPRlQWaaS7iup98BZJq44x0IhcJPXjp1taN
	h3pA1ydcA7mDDcOTbGV1LFjn7S34z+KkbhIul21CYx4wM7XPHXXxX+MIf2C53Jr/XGNSKX1Os6t
	ie1I20diD8Xb6dYhZ2qliky+GvLiwDVbnSOlBm468q4pUF8NMcfG7VCIGTNuYDqzNfUcGllH5x5
	6YgdQIjRX3WORoAOFFzCtmFEOeCknbclmdvPPyYqwjsttDDBIfQ9Q10V27/sIHS9S1U5LAw1MxX
	NbXtzdD50njqb1ubC1wowncBgFo+kqpPecw==
X-Received: by 2002:a17:90b:2784:b0:3ab:9cb:b5a5 with SMTP id 98e67ed59e1d1-3ab3a74739dmr1040711a91.18.1791530297123;
        Fri, 09 Oct 2026 00:18:17 -0700 (PDT)
X-Received: by 2002:a17:90b:2784:b0:3ab:9cb:b5a5 with SMTP id 98e67ed59e1d1-3ab3a74739dmr1040694a91.18.1791530296591;
        Fri, 09 Oct 2026 00:18:16 -0700 (PDT)
Received: from [10.217.219.98] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ab32d58bd0sm1274180a91.0.2026.10.09.00.18.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 09 Oct 2026 00:18:15 -0700 (PDT)
Message-ID: <0a8e4d43-1ba3-49f7-bd50-ca5e240116ae@oss.qualcomm.com>
Date: Fri, 9 Oct 2026 12:48:06 +0530
Precedence: bulk
X-Mailing-List: arm-scmi@vger.kernel.org
List-Id: <arm-scmi.vger.kernel.org>
List-Subscribe: <mailto:arm-scmi+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:arm-scmi+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 7/9] i2c: qcom-geni: Vote for SE clock rate using OPP
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
References: <20260827-derive_clk_perf_tbl_from_perf_domain_opp_table-v2-0-091697dbeb02@oss.qualcomm.com>
 <20260827-derive_clk_perf_tbl_from_perf_domain_opp_table-v2-7-091697dbeb02@oss.qualcomm.com>
Content-Language: en-US
From: Mukesh Savaliya <mukesh.savaliya@oss.qualcomm.com>
In-Reply-To: <20260827-derive_clk_perf_tbl_from_perf_domain_opp_table-v2-7-091697dbeb02@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: HIjxVInSdGHEfUu4igoOJ0c5DDmRRRTF
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA5MDAyOCBTYWx0ZWRfXz+ShiZXukC++
 3oif55INzmaBGw5dnV6OP0YHwuIvqSrBcYcx21UlogtT4Ws5D/C7efcwrOsKmfkOYZ7aR0qSjoB
 nOIl8rUjknji1fFRzS29Xruxf4i76qI=
X-Authority-Analysis: v=2.4 cv=Cs0q4X4D c=1 sm=1 tr=0 ts=6ac8953a cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=e2LvkIfHUWP2XQjg4Q8A:9 a=QEXdDO2ut3YA:10 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA5MDAyOCBTYWx0ZWRfX8b5rsSFvKEqq
 tVbYK901mSVyDNAiFJCuyf/Sj8iukwCrU1yFBjJzJeEC+BMGlvLeglRw6bngiMgKI1wBRwXfODX
 OJ7nnrkOoilehkwwJVhtF5x4tqb+W8ryw1iidXQ7OpDgORWPMEJHwYXhc8JCuqFinu1kYoXJIwu
 3HGuGz9W1AZf9bnS0NvTNSBCX8JRQgfWCtbPvd4VRKsSxrasNAcFfeoTPbVYS9HGavfwPslDQSG
 Ajg0wvz558CTs4kC6V1mfn0VA1honLcB6rV+DW4qtdjCVH27pviw2O4FVMpomkIa/w13xIfe1Z8
 ITpFDEgtcqPBXiSoEOKXZXRT0JUBmb1x+yFb5YvTLPl74vyxWpeUN4b5QJ5MsQ3Vn/10LR5D+xC
 GPypDsUL6FnrSQpNGkHj6IcaTz8RDPne0VAOd6aJR0I3Tfk+YLuUFJFcCchVPuJDCRvsyFtxGw0
 xK1z1Xpxm8c8b3vX8pw==
X-Proofpoint-ORIG-GUID: HIjxVInSdGHEfUu4igoOJ0c5DDmRRRTF
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-09_02,2026-10-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 bulkscore=0 clxscore=1015 adultscore=0
 priorityscore=1501 lowpriorityscore=0 impostorscore=0 spamscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610020000
 definitions=main-2610090028



On 8/27/2026 11:29 PM, Praveen Talari wrote:
[...]

> @@ -218,8 +224,13 @@ static int qcom_geni_i2c_conf(struct geni_se *se, unsigned long freq)
>   	struct geni_i2c_dev *gi2c = dev_get_drvdata(se->dev);
>   	const struct geni_i2c_clk_fld *itr = gi2c->clk_fld;
>   	u32 val;
> +	int ret;
> +
> +	ret = dev_pm_opp_set_rate(se->dev, itr->src_clk_freq);
> +	if (ret)
> +		return ret;
>   
> -	writel_relaxed(0, gi2c->se.base + SE_GENI_CLK_SEL);
> +	writel_relaxed(itr->src_indx, gi2c->se.base + SE_GENI_CLK_SEL);
>   
>   	val = (itr->clk_div << CLK_DIV_SHFT) | SER_CLK_EN;
>   	writel_relaxed(val, gi2c->se.base + GENI_SER_M_CLK_CFG);
> @@ -1228,6 +1239,8 @@ static int __maybe_unused geni_i2c_runtime_suspend(struct device *dev)
>   		}
>   	}
>   
> +	dev_pm_opp_set_rate(dev, 0);
> +

return capture and return it else it's always success here.

>   	return 0;
>   }
>   
> @@ -1236,6 +1249,12 @@ static int __maybe_unused geni_i2c_runtime_resume(struct device *dev)[...]

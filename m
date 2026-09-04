Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F17FF3FCB37
	for <arm-scmi@vger.kernel.org>; Fri,  4 Sep 2026 08:52:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788511951; cv=none; b=Ge4sJnDhuvlcKbiQPpugB/9L6v06/AHRzQwCQvDHCXEMNbY8UZVV87ERJXYp6tNI6uhgV5X4jHprvq9rmAka6NNjMTX7Yd9w1aivTPIWTgzUbBmViU9XsV668RhMBi8deRsUK++KhEP8pIvDm1g+HRcC/yiwFN/uYm1fD3fq7Cc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788511951; c=relaxed/simple;
	bh=u8emeScZ1VxCOwdH8jxMxsFHL75wPiRAAT/6Jj7JFYE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=WCC8yiWo9TiOAOWVfXn5PBHWoX7Kph4eLHRhbkpkYgVfO2xUgmxNaldFtU2huNoBvfUFxu4kFtcYcBIBCiZmV+gZNWdnbP6zXKCT0RxQS40DlyTU56KhJGyCM5III7bFwTcidFdofoB8aljRuyZZaCy8vQy7nZdiGbkfkH9UavA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gp9RnXbt; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=a6J/2ngq; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="gp9RnXbt";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="a6J/2ngq"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6847mnHe2351565
	for <arm-scmi@vger.kernel.org>; Fri, 4 Sep 2026 08:52:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	cZ/scEjeUFKQEeVzgH7yc5/BjZu/YvnYriZvaWHljSs=; b=gp9RnXbtsidWyTJ8
	cZNY/UT2P0V+NFDYRFzz2J68xJ1rm9JcKlNlnaYAfnnHja5VKKxwyJ/NzOKJbWDW
	g6Ih3xK90ZflwVVd/BOCpP6lJI5WE2QTNagaBs1ysG4Z8GPEOyFBL6WekZmg8czJ
	4syRIeuKE1VJORmbgGnUZKEGX8WLNl9KX+Wmz4/qZuCop3uGZ5qGdPRrN0GoxpR2
	t0KE/S2LpQopgjYYpn9jVhyo4M8kzFxZd64HOQdjBJ8YAJH1peCKEAIo6Di+KW3u
	+QbCWyGj1E/0TriRNcAafN+sGTg5T+o/wLnkxOPTkDGXz2jjQiPKwb5rrK6DM4VU
	Jz3O3A==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gfp1fgyun-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <arm-scmi@vger.kernel.org>; Fri, 04 Sep 2026 08:52:28 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93102454272so14070285a.1
        for <arm-scmi@vger.kernel.org>; Fri, 04 Sep 2026 01:52:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788511948; x=1789116748; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=cZ/scEjeUFKQEeVzgH7yc5/BjZu/YvnYriZvaWHljSs=;
        b=a6J/2ngqipS9J5NCh6+sgN04+JE4IfBsdSXLB+Srv8SuIBNYWrqGWPkahMb9E/J7eg
         yPn/PxedNk0tXQb4P89otAVm8heYi+J0kZ0vf64370lMAbuvxeDOwLgTGJl5gyK3Kmxu
         dPuLbU+sehTFvNoGaCHzErH5JyyFDkSW89mAGotu8yxRP1bbju8P5vaSXqo8ZXZWvwXq
         /ldcpKPAbs43xHlGypWAcVbk729iP5mPaswCtb4V8Scl6YPeGhEy/DXgnMh7DAQOcGqC
         hCZ8VyR8sVew8EaJaC9XgHCCemqK283D7y7UQyAYQKsti7cASIsQP4LB5fkgkUZ4ceW5
         HwLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788511948; x=1789116748;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cZ/scEjeUFKQEeVzgH7yc5/BjZu/YvnYriZvaWHljSs=;
        b=W3qcxKodh9HfZdkAdx2x/MX8Ww9R7TUweui4WpYaNn6c3UoX0ct04OI3GVUTzJ+3nr
         m0ES1JJckoAMaME4N6r1/h3QxT5AOs6s+Qu6YTlp8jHz88TNyK4eQq2uUxw06ig5dViS
         utF8CYRHHwJWnHo4oYwHvINnAMRRiSoEELpkUfEK8/uw2J0a0a1dJd9JaGhuRg0zOC7U
         IaUNQAX5jfVmguxeZbpJhx42lPPuyFS2qpVoFLfcuxFmqsEMdh4IrDN1YYBdAZMrJ54H
         eG6tpMx2dm/8o9qIsr1jq+lUWPIrN4IviplAmmIS4FrcVBhHH0bouaDDvOuZN/5jc8NX
         wkNQ==
X-Forwarded-Encrypted: i=1; AKwUvBwyCpDGzdVxQ/DlD8+I4nLCuuo7ApogPS86QKQYLv6wf9N1P1t9BwNOl2DcwIYxklp2Pp7SrB372g==@vger.kernel.org
X-Gm-Message-State: AFuF++mnGZK73Qn3M3oQsHnnnVX0vj3EAn92ueU36TcbuLH9Edm0aOvf
	Xd0/4td7r9t2hr+A4ToH2dBvz22cncUI5YsNvdEEdDJuTROHZIK5zf5t86taJOBz63bVL5rjte2
	C06IEPDs3yR5cKGDfzndRbHxqMlRummsZ12DekV1d6KZVH0eFXC3jp241/is3Qg==
X-Gm-Gg: AYBFou2MVVTFXLDjDjt1abrA8zhznJXlMcKvMnUklsY8dMG4y9vPQ4pzwdiCa47z8yP
	1M1OoVAwjCQFWKJnvhkyQHsm49apwYjHiHOw27aEA1hG8qVTNWdzEYJkwYj6WUYeFVm1jy8VhUE
	q0yPzXosTb7WwRe0Jx4lYsjWgEN3kTje52wSwwI3Aocrj9c0hd7nuxQxEJSKg90XH1/9kksu4Kt
	xzk05zkGDKNIH7RghRdUYdLmCYvSODxNGH6RMfxg8p+utr3/IWYA/knw1WFd90D3ww1aaXmA3A7
	TmfGjCgKWAR7up9NRP71IBSynlDTt2sAPl5/Rcatw948vXaQtKDOjKi2RmbWubiTHvVhYpa7btC
	bff2dLvtyImz8aPW6VfA5QA==
X-Received: by 2002:a05:620a:d93:b0:939:7e96:d296 with SMTP id af79cd13be357-93980964b18mr303191585a.1.1788511948005;
        Fri, 04 Sep 2026 01:52:28 -0700 (PDT)
X-Received: by 2002:a05:620a:d93:b0:939:7e96:d296 with SMTP id af79cd13be357-93980964b18mr303188385a.1.1788511947490;
        Fri, 04 Sep 2026 01:52:27 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c260d4a8b72sm76908166b.18.2026.09.04.01.52.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 04 Sep 2026 01:52:26 -0700 (PDT)
Message-ID: <fdfbd73f-8739-4845-ab18-c5f59898e192@oss.qualcomm.com>
Date: Fri, 4 Sep 2026 10:52:23 +0200
Precedence: bulk
X-Mailing-List: arm-scmi@vger.kernel.org
List-Id: <arm-scmi.vger.kernel.org>
List-Subscribe: <mailto:arm-scmi+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:arm-scmi+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 7/9] i2c: qcom-geni: Vote for SE clock rate using OPP
To: Praveen Talari <praveen.talari@oss.qualcomm.com>,
        Sudeep Holla <sudeep.holla@kernel.org>,
        Cristian Marussi <cristian.marussi@arm.com>,
        Ulf Hansson <ulfh@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jiri Slaby <jirislaby@kernel.org>, Mark Brown <broonie@kernel.org>,
        Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>,
        Andi Shyti <andi.shyti@kernel.org>
Cc: mukesh.savaliya@oss.qualcomm.com, chandana.chiluveru@oss.qualcomm.com,
        arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-serial@vger.kernel.org,
        linux-spi@vger.kernel.org, linux-i2c@vger.kernel.org
References: <20260827-derive_clk_perf_tbl_from_perf_domain_opp_table-v2-0-091697dbeb02@oss.qualcomm.com>
 <20260827-derive_clk_perf_tbl_from_perf_domain_opp_table-v2-7-091697dbeb02@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260827-derive_clk_perf_tbl_from_perf_domain_opp_table-v2-7-091697dbeb02@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=F+xnsKhN c=1 sm=1 tr=0 ts=6a9a86cc cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=eEzEi8mspgMuG-bTNdcA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-ORIG-GUID: sLCmtMVk3wnJqBEFBX-1xSdWPMAPlF_V
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA0MDA4MSBTYWx0ZWRfX6r4RNFXGpr6K
 E8K1C+zcHH52GHE7DvR7FOXbufDkete3tRbKTVDswsint55t4D1cwAGip8SIAOzY5lHhC/tJxL1
 e/NhsqOnb9mflGh3hhNXZSb/uQgVcjs=
X-Proofpoint-GUID: sLCmtMVk3wnJqBEFBX-1xSdWPMAPlF_V
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA0MDA4MSBTYWx0ZWRfX2HeooZcDfjy7
 0c+Ft4M6pUJRGeckqMiMcWdsdEn4IMp6YwKQM/okE5LvmIJM26vP2sAg8wZ+l3k3FSfJvZVHqrc
 xFKPyoSnDrIMtqutI3wu9l9pjPBaAAFblTqIatO6y0doTHuBqzdobvLc/FAQoem7xr1w5F6YQiO
 1HQOJ8hNI8yH1JSGU/8FGpSf6kB4Rj4raZjg7QawqnSWpROQOzda8AOqRWmCbIq2g97bJgWu7fR
 0HVa+wHQtsmlXjLeZq2Pdms5jHREAmByA10C9spBeFSoGHXWZT2Bn5yOIWKWO3xIfcJnZqPVXEP
 Eq3cpVopESr5feiKIaAwD3jOpCNndhVg53IpdJmJZwChCghHHDzwbAqcpQswlNwjBAiOjNJ9x0A
 CKKOTShtMNF+7aRH1KhO20NlrH9bvhSgjI5ZxH1sY/tqVoB/ySo81aw+e/g+QO0M2SAZt0RVjR1
 3M1roV/dzoiXeMeSkRQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-04_02,2026-09-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 adultscore=0 spamscore=0 suspectscore=0
 lowpriorityscore=0 priorityscore=1501 malwarescore=0 impostorscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2609040081

On 8/27/26 7:59 PM, Praveen Talari wrote:
> The I2C driver currently assumes a fixed source clock selection and always
> programs SE_GENI_CLK_SEL to 0, which is not sufficient when the controller
> needs to switch between different source clocks.
> 
> Add the source clock index and frequency to the I2C clock map entries and
> use them while configuring the controller. Request the required
> source clock rate through dev_pm_opp_set_rate() and program SE_GENI_CLK_SEL
> with the matching source index.
> 
> Signed-off-by: Praveen Talari <praveen.talari@oss.qualcomm.com>
> ---

[...]

> +	dev_pm_opp_set_rate(dev, 0);

This and the below call are unnecessary, rate and enablement/disablement
of a clock are orthogonal operations

Konrad

> +
>  	return 0;
>  }
>  
> @@ -1236,6 +1249,12 @@ static int __maybe_unused geni_i2c_runtime_resume(struct device *dev)
>  	int ret = 0;
>  	struct geni_i2c_dev *gi2c = dev_get_drvdata(dev);
>  
> +	if (gi2c->clk_fld && gi2c->clk_fld->src_clk_freq) {
> +		ret = dev_pm_opp_set_rate(dev, gi2c->clk_fld->src_clk_freq);
> +		if (ret)
> +			return ret;
> +	}
> +
>  	if (gi2c->dev_data->power_on) {
>  		ret = gi2c->dev_data->power_on(&gi2c->se);
>  		if (ret)
> 

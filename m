Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC93C3EBF18
	for <arm-scmi@vger.kernel.org>; Tue, 22 Sep 2026 04:26:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790051180; cv=none; b=OTgek692QHOjFF47B0K7Lv7R0djKP9FxjgQHSJj/wHB6mgkES9bxTupf8qfq5RFoGAQ85KF0nhcCed5JrE26XHOW2lzqcy3LkkCduWzPDiFUu4a46A8L7HCW7kXWzvRlBsPuwV3k9ccoTcfdfglGmKEgkEW/Df8b+hKZCYzVXuw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790051180; c=relaxed/simple;
	bh=5x6DgSrKV2/hlp0HHFPmrZvte+Zh2z1LZIewo8/NzLc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=PQYHSc4sOTsklMiAOwrrWpB6VAmu/qeTEj+3ShxUCKkcuD/D0FFtbs3yJuDS1F7qDFNQnKhq4M+rj4Rx0PpOIKl9bRx6nflwFg4CFA/1r4HLC8NLwjsu5gKwNhSxeYaL5LPrCHtMFc6wglL2M2CtTyP0wjEnX71jOEqa6elQwe0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=akvYb8nc; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Pooj9zLd; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="akvYb8nc";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Pooj9zLd"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68M00DKa1978713
	for <arm-scmi@vger.kernel.org>; Tue, 22 Sep 2026 04:26:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	REcT7GpoJk/zgvrjat3xAPdg5wUsQTnHiK/QOr1Gnhs=; b=akvYb8nc/xB1yOJa
	RjvETW+LBi7P8iCn3VFoiP8AvvD7mWrissADOaqLA4VjTzsTYQWaPICW3fOJ0sQS
	noBEAIXzEwIpP7oksvnCYdzASejBwMRDjYXkiTLGqy3OGe2VAGQoFJbM2ag2m6mi
	6e8SsLgdPMviNJbHzF7kmRkaA6wcrJ2Vtp8Ke5hTawahuLTUJ9bq9odf0hYXYESc
	k2NRcpLtM+o6odpMukwVFgS0rBDZTyvfcIjaDqEdwzKEvo7+f9Pkve8sRX94DUdL
	xRnTaOe/zHcJOVONzDD1f9vz8GVpQIWV8wcHpPDQuxYd9o/ckW2Vjzv+GKZ6ZAG5
	nE/e+w==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gudw0gxk8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <arm-scmi@vger.kernel.org>; Tue, 22 Sep 2026 04:26:17 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2d55d8cd938so65371005ad.1
        for <arm-scmi@vger.kernel.org>; Mon, 21 Sep 2026 21:26:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790051177; x=1790655977; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=REcT7GpoJk/zgvrjat3xAPdg5wUsQTnHiK/QOr1Gnhs=;
        b=Pooj9zLdVYUY87fVH6aOV2aiM4MAef8LLC8MmpYjN9UJs7IDsvujEQ4dYf0ZhkLvdI
         WNV8pDBrOY1xA5Gn5kC8cB9shuu5LjjXNaR6CVA9VrB6hJbCmvdeCeUhJAL43Tiu8UMd
         y84a2ab4/C4uYmJ0gqcFRPVJIj7TYYQ7ncWwzSU9KlzW/8vSvGgXVAJb/eKSwhruGNT6
         HB/VdxSxfp2hUVbNrNdmunbIOfg5+NOz4+0YSVMgVeesCYzaImaTBRIOoUmU5VtGcn5J
         hRCs9EYJ6R85mRL6iaeL5jEz2UeQeDD37yDqFwOT5kYAMn2M9DwtSVHHl01jxev52ieo
         yQsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790051177; x=1790655977;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=REcT7GpoJk/zgvrjat3xAPdg5wUsQTnHiK/QOr1Gnhs=;
        b=kFx7WieWiFDPPJsdm/USRhaSGJWlRJqisJhrHg7DREz0Nc2t0CRTwwF3CUG5i9CNet
         25mkmpgU7ROJNzJKAxHDRZVGD9FHg/PfdBnQ/bJQncykyE8uYho2cICEV/X+sPU9zQem
         RQPwT6xwFvdDqvU0/lCgLDEhEOjGzSCTvyeaGyViFWOJgQ8UbUZvUxNXCqJXjJZM8Hnb
         //sA3r8xpnvxmkZqTHDs3RQHW+dwy943Gu2HLwK4OCniehpGbdPdmctuKfbdaB7xE6uD
         bC1XGPEdaGSGgzzHSIXvjnABSB9wR+PVBciQr7pp309CSeZlWcA+tpQI0Nt7lxOUYs+X
         It2A==
X-Gm-Message-State: AFuF++k1vx96x7nuoNeTuWW0JZQmbuOOTgI8lYEWW2NGXPr9tjasVtTS
	m1rIjISheSlkCynJKobwpqSfdbofOQYdIY2UrTJ3qigBqEg5eybBesHMcfO1Ma9sSQUqKdHeC9n
	krN4VfIuPOPBZ8/z+ptXsJG5j/TT5fMhjMrU1lvyfmKxClP7CgYE0t8YIZLc8Kg==
X-Gm-Gg: AYBFou1Ai621mLN2QHpBtHMT7aqU0ZTEb+GCa5cBMJmQEZF0vF5yjLMjbZPT+oeL+Bw
	jYCt+2g1TooxFm6D0iuZX2+l9L/8rGEEmnW+pTYB8vftlCo3rVyAY9PDOu1Avmb+buQXeCoz1so
	z6+GJJVW3JoGekqWYIpXQGLdyLlqi9NumOKMVGlN9FhbsnapoMZ/bTYY51a2KltZV3ntOsZ0C7/
	q0ien1bDSLFgr/jMUgMPXHLfMGvZxqKF3nRqeNniBpXk7k4ch6YCHqkKvFFoqOY5zHafyu0UOih
	0cXICToaC4MEBAkcD0E9Tic3QnRO5FjQdCHtoZReyBbInmR/G+2FgKh2wlAdveVBveTOF2nlV+V
	v8MBGT26w89TQBvYMxDs2UqXKz/HrEOnLDZiZSC3VOnzqHWQdHDQP/xrbhBAqIT5AKirk5mWK
X-Received: by 2002:a17:903:19e4:b0:2d9:2149:57c0 with SMTP id d9443c01a7336-2ddb1ba35aemr181420925ad.22.1790051177261;
        Mon, 21 Sep 2026 21:26:17 -0700 (PDT)
X-Received: by 2002:a17:903:19e4:b0:2d9:2149:57c0 with SMTP id d9443c01a7336-2ddb1ba35aemr181420605ad.22.1790051176726;
        Mon, 21 Sep 2026 21:26:16 -0700 (PDT)
Received: from [10.133.33.126] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2df5d0308ccsm2592795ad.42.2026.09.21.21.26.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 21 Sep 2026 21:26:15 -0700 (PDT)
Message-ID: <641a111f-ad07-4a40-9fcc-6af2f7f98c9b@oss.qualcomm.com>
Date: Tue, 22 Sep 2026 12:26:11 +0800
Precedence: bulk
X-Mailing-List: arm-scmi@vger.kernel.org
List-Id: <arm-scmi.vger.kernel.org>
List-Subscribe: <mailto:arm-scmi+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:arm-scmi+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] cpufreq: scmi: publish perf_ops with release semantics
To: jaidevshastri@vt.edu, Sudeep Holla <sudeep.holla@kernel.org>,
        Cristian Marussi <cristian.marussi@arm.com>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Viresh Kumar <viresh.kumar@linaro.org>
Cc: arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
        zhongqiu.han@oss.qualcomm.com
References: <20260921-mb-scmi-cpufreq-v1-1-934da6400a26@vt.edu>
Content-Language: en-US
From: Zhongqiu Han <zhongqiu.han@oss.qualcomm.com>
In-Reply-To: <20260921-mb-scmi-cpufreq-v1-1-934da6400a26@vt.edu>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: JWvWg42idREIxuOkAyOswmhSUI0fkTGL
X-Proofpoint-GUID: JWvWg42idREIxuOkAyOswmhSUI0fkTGL
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIyMDA2MCBTYWx0ZWRfX//GbI/tW1fa7
 H+62jnFtBsQWTRrtslerE5x4Pqe+J1TqwvqssIXuIYNKOoZHvanzxQIxzJbHWoGHbCdnQwk1pWw
 hE/MBaYLFM+2xGG6ufWNPAfuhLUhF/sQAihpLD/kpccmg/82JwWakigW0897k9yPUncuH0dMZ0W
 mQVZw5/2zEb4j4H4hcjzpj1QQ4INW7IY8mouWNOSVwLDYvd+rfJHkySQxs/yC4ea0cHTfghRwZ/
 4/PR2LyAVAaNyKvjVoqOnST0h8xE9vFStIpyRs4mARB1ryTpFlH/dCWZVbnOWSVywrQY5XnWJDu
 +fx+cgrM0K/ZvU7CxX8Ag4CA/F9wtldqHVXQ+LTQSBOhVuZiwTFdfZ1vS+bOoMGrUYm5H5oVfmv
 Wz1KTVUZSaJBS6VFT85ttvEQcdLP/ClwXRD4oT0nCBIONu9GElgfTPwWOFMUz/UUgv9BooTM6oF
 lAtQoqjuC2BezQPPukA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIyMDA2MCBTYWx0ZWRfX4wdJx1dUttkg
 31/+oNrjP6c85HL/+CJE74jrUn2c03rKcXmjQN6/hl367WElmofEdyldEJOSIKkbzYLTEZ1yB6W
 fgGW5lo+ffbW6HdgF40eCQyU8IqI4/o=
X-Authority-Analysis: v=2.4 cv=TvFzFzXh c=1 sm=1 tr=0 ts=6ab20369 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=cw3u0DvnAL9Q_YTEX8oA:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-21_07,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0 priorityscore=1501 suspectscore=0 malwarescore=0
 lowpriorityscore=0 phishscore=0 bulkscore=0 clxscore=1011 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609220060

Hi Jaidev,

On 9/22/2026 9:19 AM, Jaidev Shastri via B4 Relay wrote:
> From: Jaidev Shastri <jaidevshastri@vt.edu>
> 
> scmi_cpufreq_probe() stores the SCMI performance protocol ops pointer to
> the file-scope perf_ops with a plain store and then registers the
> cpufreq driver. The callbacks read perf_ops with plain loads, starting
> with scmi_cpufreq_init() on whichever CPU brings up a policy.

This doesn't appear to be a real issue, similar to the case discussed in

https://lore.kernel.org/all/495a47a3-ac6d-4002-abe3-23b85b2f2034@oss.qualcomm.com/

> 
> Keep the pointer in a local, publish it with smp_store_release() and
> read it with smp_load_acquire() in scmi_cpufreq_init(), the first
> callback invoked for a policy.
> 
> Found with MBCheck, a static herd7-based memory consistency checker.
> 
> Signed-off-by: Jaidev Shastri <jaidevshastri@vt.edu>
> ---
>   drivers/cpufreq/scmi-cpufreq.c | 21 +++++++++++++++------
>   1 file changed, 15 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/cpufreq/scmi-cpufreq.c b/drivers/cpufreq/scmi-cpufreq.c
> index 4edb4f7a8..c394f63cc 100644
> --- a/drivers/cpufreq/scmi-cpufreq.c
> +++ b/drivers/cpufreq/scmi-cpufreq.c
> @@ -197,6 +197,8 @@ static int scmi_limit_notify_cb(struct notifier_block *nb, unsigned long event,
>   
>   static int scmi_cpufreq_init(struct cpufreq_policy *policy)
>   {
> +	/* Pairs with the smp_store_release() in scmi_cpufreq_probe(). */
> +	const struct scmi_perf_proto_ops *ops = smp_load_acquire(&perf_ops);
>   	int ret, nr_opp, domain;
>   	unsigned int latency;
>   	struct device *cpu_dev;
> @@ -252,7 +254,7 @@ static int scmi_cpufreq_init(struct cpufreq_policy *policy)
>   	  */
>   	nr_opp = dev_pm_opp_get_opp_count(cpu_dev);
>   	if (nr_opp <= 0) {
> -		ret = perf_ops->device_opps_add(ph, cpu_dev, domain);
> +		ret = ops->device_opps_add(ph, cpu_dev, domain);
>   		if (ret) {
>   			dev_warn(cpu_dev, "failed to add opps to the device\n");
>   			goto out_free_cpumask;
> @@ -293,14 +295,14 @@ static int scmi_cpufreq_init(struct cpufreq_policy *policy)
>   	/* SCMI allows DVFS request for any domain from any CPU */
>   	policy->dvfs_possible_from_any_cpu = true;
>   
> -	latency = perf_ops->transition_latency_get(ph, domain);
> +	latency = ops->transition_latency_get(ph, domain);
>   	if (!latency)
>   		latency = CPUFREQ_DEFAULT_TRANSITION_LATENCY_NS;
>   
>   	policy->cpuinfo.transition_latency = latency;
>   
>   	policy->fast_switch_possible =
> -		perf_ops->fast_switch_possible(ph, domain);
> +		ops->fast_switch_possible(ph, domain);
>   
>   	policy->transition_delay_us =
>   		scmi_get_rate_limit(domain, policy->fast_switch_possible);
> @@ -443,6 +445,7 @@ static int scmi_cpufreq_probe(struct scmi_device *sdev)
>   	int ret;
>   	struct device *dev = &sdev->dev;
>   	const struct scmi_handle *handle;
> +	const struct scmi_perf_proto_ops *ops;
>   
>   	handle = sdev->handle;
>   
> @@ -451,9 +454,15 @@ static int scmi_cpufreq_probe(struct scmi_device *sdev)
>   
>   	scmi_cpufreq_driver.driver_data = sdev;
>   
> -	perf_ops = handle->devm_protocol_get(sdev, SCMI_PROTOCOL_PERF, &ph);
> -	if (IS_ERR(perf_ops))
> -		return PTR_ERR(perf_ops);
> +	ops = handle->devm_protocol_get(sdev, SCMI_PROTOCOL_PERF, &ph);
> +	if (IS_ERR(ops))
> +		return PTR_ERR(ops);
> +	/*
> +	 * The cpufreq callbacks read perf_ops after cpufreq_register_driver()
> +	 * below. Publish it with release semantics so that ph and the ops are
> +	 * visible together.
> +	 */
> +	smp_store_release(&perf_ops, ops);
>   
>   #ifdef CONFIG_COMMON_CLK
>   	/* dummy clock provider as needed by OPP if clocks property is used */
> 
> ---
> base-commit: 93f51579e7df248780214094418f205253383cc5
> change-id: 20260921-mb-scmi-cpufreq-cabfeb548027
> 
> Best regards,
> --
> Jaidev Shastri <jaidevshastri@vt.edu>
> 
> 
> 


-- 
Thx and BRs,
Zhongqiu Han

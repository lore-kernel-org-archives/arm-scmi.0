Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E8BD382398
	for <arm-scmi@vger.kernel.org>; Wed,  1 Jul 2026 20:15:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782936918; cv=none; b=istPC9SYO0dQLv7MJcisQt7AaOkiwY2xjNRAR7vmhBG6K291n83e0mFGLirANBfqkVgkNv8qO4Pod9/VH2kZg793Fc8lctoEVixBV4CIm1+Wt3kLWRrIYNoHstxRLpbTd9HF4ibRU4j8nizCWxDBC/ngLF/YdQ/QbeCOKjp3bVs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782936918; c=relaxed/simple;
	bh=qbknqAYZmPxfRwbqcU3Sz00LFa87wd+S4zJeOJIzXSg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=tHO2hbqlMVj1fyBGibGBY6mcFBYjSIhYSpYydmTVB3rUfwG7VkOKXRaHDQGhsNzZ1J0uXi6Wbvc7QM0ZU4hISrkOY6kDkkm3RPiMlFWIdEj60/Sb6ENTYJ0m3rIq06K4gB3oIDJHrOaNkXuics8MkVdiEQtwxmODEGKz5wJeJS8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=VJMD/e9z; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=BZ13DhTp; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="VJMD/e9z";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="BZ13DhTp"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 661Gmhe61711589
	for <arm-scmi@vger.kernel.org>; Wed, 1 Jul 2026 20:15:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	qbknqAYZmPxfRwbqcU3Sz00LFa87wd+S4zJeOJIzXSg=; b=VJMD/e9z7HUThUD2
	L5GjT4qqw3dMF7M310mF7xsS6p0DOG5vuvctFE30BDECahkwx10QRUoRQ5EOfh8G
	Um2bGmtC0UxJx3Ep2kcZw9U72hmyDIcp0WtXq0U6eleoVFGubytVTqNSyOkPBpjJ
	TxOmt9KfIxnhpDoizQvnC/kr6hlp0+nOrPuMN8aUh17YUDL3tLvTzX6FwDYuIq22
	I28OIlygKKqLvsIGWWKPlRTb4skRNPPhofsOSWx0PAeWLppy93RqnXuZRdDIrswB
	jcWHyHZi2BHl/0PuMdK3rMuI+TFJIu2nGF7DoXehJRyH4eBFwdI0quB2/29l+SYY
	iPhylg==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f5541seev-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <arm-scmi@vger.kernel.org>; Wed, 01 Jul 2026 20:15:16 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-37fb51faa63so1040184a91.0
        for <arm-scmi@vger.kernel.org>; Wed, 01 Jul 2026 13:15:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782936915; x=1783541715; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=qbknqAYZmPxfRwbqcU3Sz00LFa87wd+S4zJeOJIzXSg=;
        b=BZ13DhTpB05mvoFmjf7dXjhhkN+iOSro341hQqAxxpje4t5ET985ZXYji+wkiaUXxQ
         aKtr16KYEWkxvSA0cPmW/R8cJJ39kZeTFjA5V70FeVQfB98g/zXx9Nb6VhKyO3YP760n
         5P+W7suInigpqjCpMeTiWrDnEBhBfPbTLr/pbA5Q2I6KvH4TZCnbjHqWIzzWqSGREMS0
         QJsXt2AfwKTFbZjwROV29ZlIkTSngKX81h0XJS8inZKcDDoOU0pl7JSz/i1cYlI5li45
         be1j5Z+8dAG64D1KiprClPzwrSRK0KY0Qm6+4EP+YXZ0OkyabUVw1r9G0MpOVROzH6o+
         LXvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782936915; x=1783541715;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qbknqAYZmPxfRwbqcU3Sz00LFa87wd+S4zJeOJIzXSg=;
        b=VCrNF6HDUUp1jj+o3M3g/OF/IPiS52hS4oHFik0GzXbPIC2ckEh2wHdq3z9jMRUAVk
         mObUkk02o4umCJcOTXk7K1wLfaWmD+Y2u3NFRxRf9F4WVDybvCFFPV/1VBXBlQd8PKXc
         SSe/kL6KmKzs09BBANc5tlEzc+ff6R0usTTlAq+1sJifRP/ac7/ltamtQadCfIbBAN6e
         FAugNTwS2784DYaMywEPNqBexDROKLWmD9HDEcxn7R3AcnN4u0Hu+NcZR1QRp9M7kbcv
         17aiIQIglx1vOwUQ1FrOw8CKkbz9WHrBUbQvyVY5dgCzt0WRNe0OtNe52q+0MkxCEJYo
         8CMg==
X-Forwarded-Encrypted: i=1; AHgh+RrBnRu3qeIL29W4XA9dMIirRFGN/TWE5KqjEzzzhCE6sLDzGCASCzQG2TbMD3YhwBoPL3chZFlJTQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz9FXdR5ix5h8ugYVQounNsJo4icv5QNboB5vlc4p0y51e1uqBN
	mNYwQ7L+055euOXP6Jkfs5sI4tuMBtkoHxrcfB9wljWLkeZFBjcaKHzpIcwmrfBz3+hkNbITpQf
	XcQA73BMpCObYPBhaedsMncCKxiVsMwzzWVC5FVIGtzK2WcNTxKB6HJBx1vUDhQ==
X-Gm-Gg: AfdE7cn8qknzPDxgF5hyiPdtKGRRlQkhRLjJmV0xJaxuB8iDf2p0657jdmKXAhc9JpV
	iM9aHCUzMEsWW0ba6b70KktK8IGljDGpmfwRafSGTJbRRsIrEr42AvJz79G5bF2GqayUlRxX5Bp
	BKinoXs3pV+ogMGLQZ5Pd4h+lSFusOuR6xGwOE5i7J3ann0ntxJJlY4X2xhufo9icyLLp26PVe/
	elttkISLlsinIuXEHvLBTYTTEGx1MOjEyRXMaLo71f3E3ZOHkgMdV8RgB8LPti3TRQrQgo1825C
	Wj7jvHymY+I4MwgHLrDv6XYFnuRsC2uFAFIwzTi8mYcDHCP8QQchcQBQmc9T69QoL4RJzpIpRsI
	A+4e0beY+yieD33sqx5ZKG21rq5LMnvWmKtboT5jQCFxHSM10sO8hZ1c=
X-Received: by 2002:a17:90b:3e8b:b0:36a:caf2:3815 with SMTP id 98e67ed59e1d1-38069c56f8dmr6708428a91.15.1782936915325;
        Wed, 01 Jul 2026 13:15:15 -0700 (PDT)
X-Received: by 2002:a17:90b:3e8b:b0:36a:caf2:3815 with SMTP id 98e67ed59e1d1-38069c56f8dmr6708381a91.15.1782936914545;
        Wed, 01 Jul 2026 13:15:14 -0700 (PDT)
Received: from [10.73.235.220] (pat_11.qualcomm.com. [192.35.156.11])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30f0bc27e0dsm872064eec.27.2026.07.01.13.15.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 01 Jul 2026 13:15:13 -0700 (PDT)
Message-ID: <50fa76ba-91a9-4bab-ae85-46f7a8a9f1ed@oss.qualcomm.com>
Date: Wed, 1 Jul 2026 13:15:12 -0700
Precedence: bulk
X-Mailing-List: arm-scmi@vger.kernel.org
List-Id: <arm-scmi.vger.kernel.org>
List-Subscribe: <mailto:arm-scmi+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:arm-scmi+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/5] scmi: Log client subsystem entity counts
To: Sudeep Holla <sudeep.holla@kernel.org>
Cc: Jonathan Cameron <jic23@kernel.org>, Jyoti Bhayana <jbhayana@google.com>,
        David Lechner <dlechner@baylibre.com>,
        =?UTF-8?Q?Nuno_S=C3=A1?=
 <nuno.sa@analog.com>,
        Andy Shevchenko <andy@kernel.org>,
        Cristian Marussi <cristian.marussi@arm.com>,
        Linus Walleij <linusw@kernel.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Viresh Kumar <viresh.kumar@linaro.org>,
        Guenter Roeck <linux@roeck-us.net>, linux-iio@vger.kernel.org,
        linux-kernel@vger.kernel.org, arm-scmi@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org,
        linux-pm@vger.kernel.org, linux-hwmon@vger.kernel.org
References: <20260513-scmi-client-probe-log-v2-0-36607e9dd540@oss.qualcomm.com>
 <20260514164422.0eba9a61@jic23-huawei>
 <8857fc71-aec6-4682-b4f4-0bd463f367c4@oss.qualcomm.com>
 <20260515-strong-lionfish-of-effort-f74c7a@sudeepholla>
Content-Language: en-US
From: Alex Tran <alex.tran@oss.qualcomm.com>
In-Reply-To: <20260515-strong-lionfish-of-effort-f74c7a@sudeepholla>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: K_h6PzBJT-m8pOGlAXWs9JXILIATF_aM
X-Proofpoint-ORIG-GUID: K_h6PzBJT-m8pOGlAXWs9JXILIATF_aM
X-Authority-Analysis: v=2.4 cv=Xbm5Co55 c=1 sm=1 tr=0 ts=6a457554 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=ZdW6uxA9NKXbfdqeeS2OGA==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=vxRzfglfhILO5636UqgA:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAxMDIxNiBTYWx0ZWRfXyTj3GAmHj2yu
 rHWMRvgFRFNXTupdmiPo3Em24Gnfq8CTe39Wvaf9S2Bd9WxT5TkUWmqEfRguW6o0qc1LeiIprUH
 /nJdkmBOhRPFErWEBRY/VnSImPUfSp01AHedCNgxqoQEQi+rdfXTSwsnFjQsXzVsIGxVJFdcu1C
 hDAKRvV4qH71/+iagjHDhuDB3eUTV4ihnE+JdMciO6GlJEfl9UvnVFS+05Hxb9NGnfnbZdNG//U
 yl056KmUcZeo0D98r8vcB3pfkfzZc5iWHDkHYaGKFUL12xOmytRmldXQTMDP+uNzDsrMv7LTjCX
 zNdrU3BmAsjTD4gI2YWXqWya3S0HfRLGv4p+Tn97Nd4t7n+B6XSkikVePFx3bxaOaKcvJsDN2jN
 9UITzM1q0eoRFR4/K98+5AWoPCX3xOf2KAH2dYbh+SJejXaWW7rhdcOnHcNx0kCjmDJ5Npu9kmT
 nhFPs/UWmKtMypbCaww==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAxMDIxNiBTYWx0ZWRfX0601aSaNmBEH
 BzT5yOZhx1ZpW2qqa2mLYs+R5wgqkc4iptxF+5ZTCM3IBMIxX1boNMBbN5bkuUmxnmVlEdwa1y2
 ci9DjVoTrjyOr2zKSuoO7Qfqr/Dma18=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-01_04,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 malwarescore=0 lowpriorityscore=0 spamscore=0
 adultscore=0 phishscore=0 priorityscore=1501 impostorscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607010216

On 5/15/2026 1:29 AM, Sudeep Holla wrote:

> On Thu, May 14, 2026 at 02:23:56PM -0700, Alex Tran wrote:
>> On 5/14/2026 8:44 AM, Jonathan Cameron wrote:
>>
>>> On Wed, 13 May 2026 10:16:53 -0700
>>> Alex Tran <alex.tran@oss.qualcomm.com> wrote:
>>>
>>>> SCMI client drivers do not consistently log the number of supported
>>>> entities discovered from firmware. This information is useful during
>>>> debugging because it shows which domains or resources were exposed by
>>>> firmware during probe.
>>>>
>>>> Add logging of the number of supported entities to the SCMI cpufreq,
>>>> pinctrl, reset, hwmon, and powercap client drivers after a successful
>>>> probe. This aligns these drivers with the existing logging in the SCMI
>>>> power and performance domain drivers.
>>>>
>>>> Signed-off-by: Alex Tran <alex.tran@oss.qualcomm.com>
>>> Hi Alex,
>>>
>>> Just curious but why +CC linux-iio and IIO folk?
>>>
>>> May be you had a false suggestion to add them from get maintainers.
>>> If so be sure to check it's suggestions make sense!
>>>
>>> Not to worry - we can all hit the delete button ;)
>>>
>>> Jonathan
>> Hi Jonathan,
>>
>> Originally, there was another patch in this series to add the same
>> functionality to scmi_iio probe but it was dropped. Apparently running b4
>> prep --auto-to-cc does not prune stale entries from the cover letter. Will
>> manually remove all entries and rerun the command in the future.
>>
> I guessed so, but why was it dropped ? I don't agree to adding them elsewhere
> just curious about why it was dropped in this case.
>
We could not determine whether to log the sensor count provided by SCMI or the number of sensors that were registered in probe since the driver appears to only support 3-axis accel and gyro sensors, skipping the rest.


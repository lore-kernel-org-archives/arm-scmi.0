Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F6E949EC5E
	for <arm-scmi@vger.kernel.org>; Fri, 18 Sep 2026 20:15:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789762521; cv=none; b=YZiaL1OaHtEMgNE3wlsI7fqEDM4rN6bBCWbioRDKqpIPr55Nqqg6bf1Z5SBjreOaNTkxpGXxtcXelLauEU9X1xrusRUgUq3tS6+BaiOJXv5zFPAC9LKzUEKUoB0pez+//UFA5rV+PWzZyIqa9G0yBFh/rMOkteLmZpjTCrbghRs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789762521; c=relaxed/simple;
	bh=IihQtvlu3mM7DoVd4/V7ME+mCuTIcJBZbRiO8v34YNE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=DY1HVmH/AVP7m9u3C7K7m2b0Tv5UUznJRhM9UTPCxv0CUCL+h/CvXdizPPaZ9OPp0/atlt30MF4CZouKQmBG2YBo0jHvfjBwdHo3Ete5c+iOu3JNGE6KVSd9V+w4jkvEcXnCSRimibYDtKBIu+4tqQ2+AcFBWDnenpq5Di+BrDE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fD+GOeD7; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=khwwsyAq; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="fD+GOeD7";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="khwwsyAq"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68IKF6mg1552721
	for <arm-scmi@vger.kernel.org>; Fri, 18 Sep 2026 20:15:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	4fphhkzCia/0/dPRwk/cb2MyHyGqohOAAxhBw9rbGd8=; b=fD+GOeD71lokuXXG
	oJyTKl62II+bfiT3x5V68weBwsLkg9k0od+HRHDm4+GZPneZ0rSVR3w2QUOH7/pw
	UNWejuimY6L0ZLLOeESBh50eAYjFNfHe3zXTwhOZP1teCpiEJouwTj8EGHL+Qdrh
	RMVz/5TxpvNsuqI8wUqK/nhIHybVDHbECqwV6i5UopMmYUHa+WXWSsTJKITIBDoy
	J43SqZyKNI4Ha47J3UAMB2X5473TXYAcCHjWOvProVmHTJZ4IbW4pi9G7Hk7AzN/
	c3svFtW3XkzaM/ld+k00yhCe2xKa+ZG3Iddv2wTj+6RaugeS9ztWVNOzGN/e52eD
	O/3zpg==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gry2bum8n-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <arm-scmi@vger.kernel.org>; Fri, 18 Sep 2026 20:15:19 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-936708f129aso187037185a.0
        for <arm-scmi@vger.kernel.org>; Fri, 18 Sep 2026 13:15:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789762518; x=1790367318; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4fphhkzCia/0/dPRwk/cb2MyHyGqohOAAxhBw9rbGd8=;
        b=khwwsyAqehJtlMHGmYIsL+PtUxpe+q82eyCpDo4wSSWjDhRrzn3V3eOUeecwIzhWVj
         vUdmvMp+j2leO/FgSaDL77tI5zvxX8tlL2C3f/q9jUIgNo6uGR9Fa5DMLZdTcVWPJmBl
         lBIvlS4hL4klX7Kzgzyyiw2pcKgDVrxEvqONpkbjh0PU3DW3WYcOSZZeyPuzNcOnnLcR
         tE9n6Jvwu8oJljnMlCfG0IUD5yEjk2hkpYcp+xopiKGk+My9ECUH4Im2N2BtbZ9dHGHn
         JqEkII9dDAfLFlvguLFigtwuVY0T8CjBYDefg3aHqmM+kQHT1as5vyaIYjjXV23rXV1V
         552g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789762518; x=1790367318;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4fphhkzCia/0/dPRwk/cb2MyHyGqohOAAxhBw9rbGd8=;
        b=diGyRf8wDWgyH8Y/8sfRLK7QBHoipcv2C7nNMDjG9QZhTdp5z36ZRl6xUWtoj6wJND
         c+UvD1/Ne1oM/T9dvmL/7sDvL/B6spo851hqBZVTjbYeqBZwtoNc1ycQvfagOtLkEM0n
         TINR9DIbPWmlOoPScUf2Z8dleVGLp0aRuWuu1ygTaZwFe3lAaFFC7GwUYNqt3Epf8jwj
         69YDG6QKJzF7ZW4bX8CtO8NGin+oy5mmu2wwHfSnKyhlmnbJV/XW3nkp0hZ6FUtzS4E8
         anzlWzhtGoS7MPxj6Q1fDd3lx5rNCwkDDOS4xUccfr7yqGAuFF+dBXv0+5VCv0YFmJU2
         Po5A==
X-Forwarded-Encrypted: i=1; AKwUvBwu19sry/EXitCyyCZGaJWmPmDGK8U+O40tn3WXZCP/llgFrM5VkVe30x9z2rnHgiTX/aTAKV3IaA==@vger.kernel.org
X-Gm-Message-State: AFuF++mt7X3zrjt4KZQBoEV9W+1Yr7VhA+vgaOnkIqYgON+3x43Xs7hj
	iiBXkKSnh8cs3ziucKb6jhjEA+nfDEFwWYmZAUWVkO67C8ONIQFKVuBtu7kgJEWSaPZd3vaX7PA
	uTqbG8+FGqBw5ZJhhtHN0UNbPF4QFPDsYhoxx+Rbxta8bMwxOafq0/EDCwXhaCQ==
X-Gm-Gg: AYBFou1Yzo1d5wVNhF3tSeeeHIjUf5f7hypfV/HV3JICZrXRxiLoQSIAr0rheZyhvNo
	eR1mqIe7G8x8rENtIylXxK496e1clwx2/3qeiQzBn/MOqJZm3YnJMiFs5X5THWoKlD3GgkmDS5u
	bEVV03AmLx/aLpP5ZwVN+lPCCfM1eZiHQeiLGAy/YCaKGPPmtr/rq/Jdb0FblPt3cVyHu1NIzmh
	rq93XOnILuPkFiZBGKGdmkQD3Wz3nG3XTE5oNEODgRlDCsHZ9wMXJl8licWef7uGmxLBYRHUjsn
	lEdW63w98TOfQHWyNhtYkKwQB9essZ2PfqFbEDTUiILJhwzdojJD8atiOakjIAi5C3opEYgYZ2n
	KlQMk47WiIzg950g+hMxN86Q9nBG4VO8M52V6eSmuQWTfMsaSrPFdNbSQWSMG
X-Received: by 2002:a05:620a:8909:b0:93b:c537:fdb8 with SMTP id af79cd13be357-93bdc6d5b54mr581374285a.6.1789762518457;
        Fri, 18 Sep 2026 13:15:18 -0700 (PDT)
X-Received: by 2002:a05:620a:8909:b0:93b:c537:fdb8 with SMTP id af79cd13be357-93bdc6d5b54mr581369285a.6.1789762517999;
        Fri, 18 Sep 2026 13:15:17 -0700 (PDT)
Received: from ?IPV6:2a05:6e02:1041:c10:bb0:6e51:d247:d411? ([2a05:6e02:1041:c10:bb0:6e51:d247:d411])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48724460978sm1103863f8f.11.2026.09.18.13.15.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 18 Sep 2026 13:15:17 -0700 (PDT)
Message-ID: <4189b4c4-3544-4602-b1c5-f298e033c17c@oss.qualcomm.com>
Date: Fri, 18 Sep 2026 22:15:16 +0200
Precedence: bulk
X-Mailing-List: arm-scmi@vger.kernel.org
List-Id: <arm-scmi.vger.kernel.org>
List-Subscribe: <mailto:arm-scmi+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:arm-scmi+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 1/2] module: add SCMI device table alias support
To: Sudeep Holla <sudeep.holla@kernel.org>
Cc: Hans de Goede <johannes.goede@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Cristian Marussi <cristian.marussi@arm.com>,
        Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>,
        Frank.Li@kernel.org, arm-scmi@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        imx@lists.linux.dev, linux-kernel@vger.kernel.org
References: <20260918092951.5656-1-johannes.goede@oss.qualcomm.com>
 <20260918092951.5656-2-johannes.goede@oss.qualcomm.com>
 <2104f437-e960-4e55-b0e1-2b37126e8c2f@oss.qualcomm.com>
 <82a72918-7bc7-4e2c-892c-0dcdd6dd5548@oss.qualcomm.com>
 <3f51bf6c-5318-4e32-a1ca-3ce8cf8c4ceb@oss.qualcomm.com>
 <20260918-roaring-bee-of-acceptance-50a8a9@sudeepholla>
Content-Language: en-US
From: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
In-Reply-To: <20260918-roaring-bee-of-acceptance-50a8a9@sudeepholla>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE4MDI5MiBTYWx0ZWRfX5m/6Gubh4/4y
 xDUBO/aumJTzh0LpgeQHDB8m9Q5rn1RoDcR3ZHP8ceVg1rOTUggY8jgqZk9KRjfTlxj2AyU0tEi
 Xa7srmAnISp8hAiYkKHNevb8uUAat9uq4gr2zdOyEY1e34IhITzyyJfmOBPNPPGT385qvuXPWb9
 t+gG6Dy9ZC3A0snmcjuO1oja0wRIbVbwPCkl0OMY/hfWytaP3SmRCquhTZkKWlfzX+ATb1JF7ki
 fjerJ+iTYw6yIwhFaxrLzlAE6Qrx3zML+OQ/bg+x493HqDyv6LbpAQE0VO6XQ7hxLcYvcR/qoID
 IJ5b86kTxPqPEz9klXYs0qR14AV5gOgFhPmi3qXf5ICaXJX1T7shBDz2mlbK1PERbVWjGmUePwf
 zafDdiKzVEsH6mP8wZ5u5cPvccWw3mPXn2gbhE4OHUrxF9k8y6TAINrVbE+ETkchWbnnu0Lmpb5
 swXGKmzF7/ShzR9YPtA==
X-Proofpoint-GUID: Prr9mtEx9-ia2TIjs_yNfRgIECpRuAUl
X-Authority-Analysis: v=2.4 cv=bYP+w+PB c=1 sm=1 tr=0 ts=6aad9bd7 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8
 a=pMJ2f0pklUtnlmghVxoA:9 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE4MDI5MiBTYWx0ZWRfX5hb3YjmshkcR
 M5WnHPtU1FQuA77EcSKOiWQuQ2P8kmHEY+bpenXg4D+KaoN4celWtfZcu8MlZEi8Iboyy8z06ra
 +/uy3dZGi7TLBxuGCYLwR7xeWPPeB0w=
X-Proofpoint-ORIG-GUID: Prr9mtEx9-ia2TIjs_yNfRgIECpRuAUl
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-18_06,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 priorityscore=1501 impostorscore=0 bulkscore=0 clxscore=1015
 suspectscore=0 spamscore=0 lowpriorityscore=0 phishscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609180292

On 9/18/26 15:38, Sudeep Holla wrote:

[ ... ]

> Not related to above topic, but just wanted to check with Daniel if this
> solves module auto-loading for you. Was there someone else who was testing
> this series and was having issue with earlier versions or its you only
> Hans de Goede and it was with v1/v2 when Bjorn posted them. I remember
> something vaguely and couldn't trace back all the versions easily.

The scmi-cpufreq driver loads automatically now.

Tested-by: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com> # Lenovo 
T14s Hamoa


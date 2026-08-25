Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F0403A48F6
	for <arm-scmi@vger.kernel.org>; Tue, 25 Aug 2026 04:01:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787630462; cv=none; b=GIP9sbopGR8tIlJrVfrD0h0vc/wWZDO+XhrfA1RHYGJymF2dnpojQ2JXmTSsh3bIggSiD1Cmo+RuOPH/KnqDKSONW33MmlR6MWmWhtDtgEl13qDj7Emcqh46LbRGRJaHdQoZ+r/j4dzRB5ldZLAnkwnMT57DqnO4jLzo3GsC4oE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787630462; c=relaxed/simple;
	bh=YWl90OOdVCd9KNVgHHy4ovXFe+CNKeFkWuTjHDRfD6g=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=swELOYbSh6mVNITWQm7z3V0gJ+98rNgBl0bjx5Ub/l1P/BiHoqALvvd1Zi7eTeInN5N9Ri9ByX/grzYjn4znbeh8ITsovd2ipk1k/ibTAyuWm8+9bhea8irJb+dsZKuXdn7mWOhTLaeOsc0wai/WdeyUd3w5hHjSOFdTMAfow+0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CIKC2iN1; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=YUzmf28P; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="CIKC2iN1";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="YUzmf28P"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67P2R5Qd3741455
	for <arm-scmi@vger.kernel.org>; Tue, 25 Aug 2026 04:01:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	C+XQZtMktBy7ekGjf4/plKpxlv6MDb59qUzxqeoByG0=; b=CIKC2iN1ZReAWWl4
	16vuxGWUUJO4xlufvERdBG5vjw/2gSxGqmXPC3TO7qRE01rxoNS3b0E6F0UWkQ2K
	QckfiY4rR5jXrMqy40XdPryMBVmLBSUaL1UuSGjLWV3KIy/uz/xZtAAgmhlzp45M
	HK6JULyoHkGuMBOxSZabRJxkrGFdjLMMe7TdnLRgD8zBLP2vm4w7v9ancNLyWVLl
	TgxoTUwWMI3dGtzARP2pFInlrRH+smkBhuxm1CGTOAzZXx0kht45IKSJhqTpbV9S
	zVl47i3TaNETzacmw0QpARosk1k2JHFISAAOM+BmBeD6LzEjWK1uqsXsKcydMsBX
	GhzTgg==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g8kv7bv5h-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <arm-scmi@vger.kernel.org>; Tue, 25 Aug 2026 04:00:59 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-84f0d3ab2f4so3186455b3a.1
        for <arm-scmi@vger.kernel.org>; Mon, 24 Aug 2026 21:00:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787630459; x=1788235259; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=C+XQZtMktBy7ekGjf4/plKpxlv6MDb59qUzxqeoByG0=;
        b=YUzmf28PbofztZn+3f0/ELIvx+6cCQcsbwmPEYaPiz6h5VT2Phr665iE0ArPYqKHDO
         w//j1xbT+toYiugC6yEmrZnLVaH4nuRFwAZfmsRlCXYS9hvcgKbszOMK9ZJVUVHWRC84
         QX2nMEX2AMu3R1JKs9aID9ijNMgFuFvuEn4mdNMfp1i7b70HRdzGSzUdzjkeK5FhPCEL
         V9ZBWgGESSVU9tUSgGrsUhy6SoSXtGSNdnKENqhOofkuXYRs52fvi4Dv/zx86nyWAKl9
         S4AsylhRJD8CNh68wLzhEO+hA7loJskQEe5HcGZfTltlXhYb3k8Hiuwp2nWhj4P0vX2P
         l7dQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787630459; x=1788235259;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=C+XQZtMktBy7ekGjf4/plKpxlv6MDb59qUzxqeoByG0=;
        b=Q9NeV7AA+8xfWkTrkr0YCWit1QIUaKZzJmvr2Z7iEegj8SktntBJ2a9sK0jMhiGrs9
         F5WsrqqbLrDxZu6rci62ZDSJ5TXxXbFTHYxoQVUp6/hJb0jNjpDALZn9Zzniyvial5mE
         NIPGwHV26TSALH+InCQ8kM3miI+x6XUcv3uBNR4RO2TFiNYQLWOjCsTi1GyOrrdwaqX3
         zvQCwrngbTZ/o0oXzO+k7VE8Wn6dt6j+hPkPjDznMRUgVk9wnObdUDZF9GhfUaKHhfYJ
         i1jcWuvuahgEVXKCRBPqd+TDvGMYbG8tz0dOueATsrBJDtQ9opTkFWFQTOePylyBaC+F
         2c+g==
X-Forwarded-Encrypted: i=1; AHgh+Ro+SZ4Y8U1c8878+LszCPvWw0LbYf883ao+m7XLWQKiQRQXoKq0px4QL0hPwPAvmhg7vdHD6x4c6w==@vger.kernel.org
X-Gm-Message-State: AFuF++niHYtVMgBEiADPINReJ+Nc1kJBpPz6s6bbbATIQbTj1eU071Hc
	f31hv8uHk39X0JvnkEXH/TB+Vi15oJb9hj8XR8Hl644yaxdpS2MAJDw81raBx1mQLrCU7mMlAYk
	rimMGa0WRoLrRNQs7KdU7rAwkWz85o0DeGN+QywXiJ+HzoE+FscY2LJqvoiA3ow==
X-Gm-Gg: AR+sD12GdSvnS9PFAwHLbAKP+ah87fx1ehDTPklHzOVLEI3AIlbniTKRbt6LFlmRqRc
	ZObxVH1A/3QoTQYntredV30xb7HgroaEl3/a2Eks4J/zUPooHSPH+H2+YDi11KRoUvpLyILErEY
	f05oMpBvKe7+5KJzBaPUoWhdUNTKjsuTCD0Macnhr2PygDHKGinf9UrpYqATAxkTCmBGmtz+CQQ
	bXquMmALtJ97mOJKC2nfj1FuB1huy0j5RArIMsWhUk6GS2bdNjCTKrgQ/vB2L6EMwfhFRUjysJu
	51p53nceWH8h1Wsf5msV1xxJ3gxDvp1HvTtZ7ce6FrsgJ00b7CG0i3IiFq4K/aXdfevFkGxlWlY
	d/JwlaDj9yLALdIyRQLyL4KbLwDnoGxM=
X-Received: by 2002:a05:6a00:4c13:b0:851:8bde:7873 with SMTP id d2e1a72fcca58-8520b98be69mr40252206b3a.8.1787630459258;
        Mon, 24 Aug 2026 21:00:59 -0700 (PDT)
X-Received: by 2002:a05:6a00:4c13:b0:851:8bde:7873 with SMTP id d2e1a72fcca58-8520b98be69mr40252038b3a.8.1787630458620;
        Mon, 24 Aug 2026 21:00:58 -0700 (PDT)
Received: from [10.218.14.97] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8520f1638aesm2534359b3a.57.2026.08.24.21.00.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 24 Aug 2026 21:00:58 -0700 (PDT)
Message-ID: <17735f83-fd07-4fad-97a3-727cfbeabbcb@oss.qualcomm.com>
Date: Tue, 25 Aug 2026 09:30:50 +0530
Precedence: bulk
X-Mailing-List: arm-scmi@vger.kernel.org
List-Id: <arm-scmi.vger.kernel.org>
List-Subscribe: <mailto:arm-scmi+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:arm-scmi+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/7] serial: qcom-geni: Use geni_se_set_rate() for source
 clock configuration
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
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
References: <20260805-derive_clk_perf_tbl_from_perf_domain_opp_table-v1-0-61171ab1cdce@oss.qualcomm.com>
 <20260805-derive_clk_perf_tbl_from_perf_domain_opp_table-v1-4-61171ab1cdce@oss.qualcomm.com>
 <4e0d636a-7975-4711-8070-6f71957b754e@oss.qualcomm.com>
Content-Language: en-US
From: Praveen Talari <praveen.talari@oss.qualcomm.com>
In-Reply-To: <4e0d636a-7975-4711-8070-6f71957b754e@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=Cfg4Irrl c=1 sm=1 tr=0 ts=6a8d137b cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=gztmCChag-4to_nYmxUA:9 a=QEXdDO2ut3YA:10 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI1MDAzMSBTYWx0ZWRfX3eZ7CAQzMQUs
 l5iDOqEzDx+7KvYWqDXDKxX6FtgKrAcdNbuayXopVqBPjZL63eWgKNV6LGGG2DR+tZpioxyeUTM
 xgO2ugjNs6lj0nCq5yqjS+7Dbx9e3BM=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI1MDAzMSBTYWx0ZWRfX1n8I49sZj2Gb
 kVvy8MZbmMvPMynOK9g6GGfUhvObL9O0AxeBosNwYbzZUbVwpANzBONwcnqq68SoE5u6R3MO4KF
 qe//0YPe6ZY0wDBnVeBf2N35PSW8hvvcJoW7+p4XrpLTYBIXCeNekFWm5rfalQgeUB8TQ2Q4KHv
 Os0EX8RXGYfl3vu/7klYJPXp09oN2PlEPQS8MAt9Q4dhRWlulVIy0Cu15ZHo3ztwJnBKIsjZ0lj
 UeDSxgaBysHyHDLhWOC5A2zZiV+kFY2Vi0B+ONm9bgMKKB16BX0GyGTsyHuMFtLydGK3u4Lg2BM
 zLPs/nT2GdO8XxqTTtRA2tgoAuCNTe0t6c+aj93h8iQE/Z75FEqtigg0Poos1RiT1cFZsQA4uIX
 fPJ51ykZ8spE2Ri34KLs2hhfSjuOIBMi02G4pNsBoVLMhQE/6rpQ8iBlR1Rwhj6A+qcnNUDkEe9
 rrEcfRMcyBwHQBAICRA==
X-Proofpoint-ORIG-GUID: FUwO8ndKikt3ObSQsPx_O8_qXSvD8maK
X-Proofpoint-GUID: FUwO8ndKikt3ObSQsPx_O8_qXSvD8maK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-25_01,2026-08-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 phishscore=0 impostorscore=0 spamscore=0 suspectscore=0
 priorityscore=1501 malwarescore=0 clxscore=1015 lowpriorityscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608250031

HI Konrad,

On 24-08-2026 20:35, Konrad Dybcio wrote:
> On 8/4/26 9:57 PM, Praveen Talari wrote:
>> The driver calls dev_pm_opp_set_rate() directly on uport->dev to apply
>> the computed source clock frequency, and dispatches baud rate handling
>> through a per-variant dev_data->set_rate() callback that either
>> recalculates the clock divider (Linux clock managed path) or selects
>> a performance level via geni_se_set_perf_level() (SA8255P firmware
>> managed path).
> [...]
>
>> +	geni_se_set_rate(&port->se, 0);
> This ends up calling dev_pm_opp_set_rate(0) [i see this is an existing
> bug in geni_se_resources_deactivate()], which removes the power vote,
> but does nothing to the clock (neither set_rate nor disable_unprepare),
> which will crash the platform
>
> Both of these calls (new and existing) should be removed. Clocks will
> be disabled by geni_se_clks_off() in geni_se_resources_deactivate().
>
> Then, we should do dev_pm_set_opp(se->dev, NULL) *after* they are off
> to remove any trailing OPP resources (i.e. icc votes defined in the OPP
> table in our case)
So, if I understand correctly, the expected sequence is:

1. Disable the clocks.

2. Remove the OPP/performance resources.


Thanks,

Praveen Talari

>
> Konrad

Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D3BF3DD873
	for <arm-scmi@vger.kernel.org>; Tue, 25 Aug 2026 08:22:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787646182; cv=none; b=u/YRaKzPv0xaqn9pG5CUaCGFi55jbg9jPEKK/VBurx+ouvQQ5eV7qi3/WKcnbN3ZRF24IsuVf8rJAQc1ELv9ui8DbZcOnt4cLl9IvVZapObTqqfEzmKPrOGc/JTc+w6MVG9tXORUF4rNSJMmFaJVr3+YnsULDitWSnY+7x91Aa4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787646182; c=relaxed/simple;
	bh=3k4yRXSRua7NYMqAmmhy33cZ3AnCSJOK1rbJA9IReO0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=L9OE9KiIPx1/vE8kD25/kWDe5pO0Tm97ob2gDVkiHGhNuHASHWPx9Sjq/h/zTz+VthJR3CHRQNInmaWOy/+n0MafxHS+0CyVXvtZO6fnm8d5xi00SvpEcIE2icO2Yjt7t25bwFGlT1ooxS1A+6Xv2oxQHsw/rta87CChEuQKmsM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cJObNxZo; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=HyXWDdyD; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="cJObNxZo";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="HyXWDdyD"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67P88SOx196317
	for <arm-scmi@vger.kernel.org>; Tue, 25 Aug 2026 08:22:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=Ywz9kH7gTln627j++0eOYkrz
	Mzb6+AiHqb1QNVbCm78=; b=cJObNxZoa+HbrFvBFQ1ru1TxDdBS/19QcmdXzbsS
	JezWSTJ/JX6BEnSx3McaDZcdeRb8zxcJzt9OBCsmpJ5TbONQYMbmEoQXrw64sQKf
	+knun4kxmL+UuXAoIeVu2eeJdoDwUxzlTFYHo5k8TCUSyPXow1jnxrU1VAZ8b0Ck
	3y9kD7g9xKnIqG9hMv9IkhKaTlNAipvMBpAHTYzMTRN81ghQAbFEpV91PvrV8tWc
	b1aWJoSxXSMbwAQEArCCERwR63DVMQeE1thTJO9Qc7WQ38z/vr45Z9pmttd65BWE
	sHIopSczy/pbsFYxJVJUHaCWDWBE28+IsSynzfO7mzXeBQ==
Received: from mail-ua1-f71.google.com (mail-ua1-f71.google.com [209.85.222.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g93pvgw44-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <arm-scmi@vger.kernel.org>; Tue, 25 Aug 2026 08:22:58 +0000 (GMT)
Received: by mail-ua1-f71.google.com with SMTP id a1e0cc1a2514c-97bf8ed9594so386486241.0
        for <arm-scmi@vger.kernel.org>; Tue, 25 Aug 2026 01:22:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787646177; x=1788250977; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Ywz9kH7gTln627j++0eOYkrzMzb6+AiHqb1QNVbCm78=;
        b=HyXWDdyD3OW2/m+QwPYkeAWHghMpqauY/tw6ep0hjnos0fjM/FRZK/NhHsOjHRkMld
         6HmWhlY2cvxgnjeJhekGMQVUgMt4F2ZZOO0lc6idx6fI2VzeyYZMC4jTHSu99IfX5pap
         ZoGwwP4eRi3QV4rtTgKWcGSyQbc18aLjLEKZBZRtBz9Yt4GgIoTMq8ukuSHoyQIQIlAw
         PscJ+3IfQB/N2+SbZTYz+k1+uL935bNCBD8mnRxuToDSTmX2wdEdC76ljCK2XnQcN1hw
         /VjNsQYV+Gq4qXxjGps9cCEr3NR5vLwtibDP/4cQeft+1D6nxFP+VIOWnPNarSjK7gJO
         VIRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787646177; x=1788250977;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Ywz9kH7gTln627j++0eOYkrzMzb6+AiHqb1QNVbCm78=;
        b=oNoRN4SlGhng1iMp4TMJex/29b7dG6K80c3vGQHt4WNuzYYhmG1Zn+KPDwslTHnNfP
         ycoikcSTm9Oq4D3LwW/k7gDN43T98mEeQK0fGDz2in6ARo6vVkJzu27vBGp4FtavTaFw
         tkfu0H7sOlaSB1bxH7JYoWPRDsxkcEKkXgdHxEcQlbH+CdQFgf2pUnYS0fIo9aMmzmAk
         okTte/zZOqKs6G7YUQI5d91Bd97flD5TISFOuUYeqqKL4ZBYOShHWC3Yrb2fFg28wRZI
         FAh5igMOZAb5g8l+Vj3h3XG61IRdTbwu1l5tQZzKgpSLBtVSDEdr96WRQ9AnhaERHk8v
         V9KQ==
X-Forwarded-Encrypted: i=1; AHgh+RovhiYmuya2+Z33D+JvfGw27cTSOQQY0Oqgi9nMaN7+70PcaqiR+4B5f/JBSQxLIMsC3o6mEJ4qpg==@vger.kernel.org
X-Gm-Message-State: AFuF++kz/7cRiMibjzN1cPMS5ITmLp0TLQPl1yS6zrncPFW3C22FSFfP
	lN9IVUg/cCazIbIl+y+jkwwWwWFt0/8UKln/XK3igS0TkKEkuAtD6E8xq6Mu1ACOSfRQg7IyHwk
	EEeHOXtuokKcCEvZfzmRDs9godr5C6jODvyj8oWU+2BsZ4s/sCCE7dbwpN5GLphmLq1V7kg==
X-Gm-Gg: AR+sD10RTxql3x06MB3KXZI3HHGklMt+SM1DWxNJIj9zTRFElXP5sF5LhYtOkbk56K/
	lEz+boTvQkkeWhkbSmxT5hUQ9CbIMn/YILWzzbj2A8CPxktyVkWVZv7xOSlole0Kkzw9opEWvyG
	pSr/Ziaij4FmL3VMXFaZ4DfI70Oy0fHhj1YG0u9mFu8Q6KAnwo9wlazjuKRd+otq++9OxiMkkub
	JZMB+hKU/HOC7QWX6Ui9+POH8S/Wgtl2ZQKAh5r5EFXmgYQag0xLgp1uztUhagDF8h6NXyBpu7U
	+ppPaL48NAVx3Xdtb9Jom6xr2JFd9QoVjsVtjdjhmivNxAn+ZIktf5cFi8T74PwfT0gS+6f6vKs
	HhHF2DB90waETWQ==
X-Received: by 2002:a05:6102:6883:b0:777:4e99:6f84 with SMTP id ada2fe7eead31-77fe635f317mr1644159137.1.1787646177500;
        Tue, 25 Aug 2026 01:22:57 -0700 (PDT)
X-Received: by 2002:a05:6102:6883:b0:777:4e99:6f84 with SMTP id ada2fe7eead31-77fe635f317mr1644138137.1.1787646176998;
        Tue, 25 Aug 2026 01:22:56 -0700 (PDT)
Received: from oss.qualcomm.com ([86.121.170.13])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6a59e2da49bsm14366325a12.29.2026.08.25.01.22.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Aug 2026 01:22:55 -0700 (PDT)
Date: Tue, 25 Aug 2026 11:22:53 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Praveen Talari <praveen.talari@oss.qualcomm.com>
Cc: konrad.dybcio@oss.qualcomm.com, Sudeep Holla <sudeep.holla@kernel.org>,
        Cristian Marussi <cristian.marussi@arm.com>,
        Ulf Hansson <ulfh@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jiri Slaby <jirislaby@kernel.org>, Mark Brown <broonie@kernel.org>,
        Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>,
        Andi Shyti <andi.shyti@kernel.org>, mukesh.savaliya@oss.qualcomm.com,
        chandana.chiluveru@oss.qualcomm.com, arm-scmi@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-pm@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-serial@vger.kernel.org, linux-spi@vger.kernel.org,
        linux-i2c@vger.kernel.org
Subject: Re: [PATCH 1/7] pmdomain: arm: Fix -EINVAL from
 scmi_pd_set_perf_state() on state 0
Message-ID: <2ah2wpjrqixhnws6y33tlkuep3et36q6typfd7ausgaslykmrb@cn6usezfkae6>
References: <20260805-derive_clk_perf_tbl_from_perf_domain_opp_table-v1-0-61171ab1cdce@oss.qualcomm.com>
 <20260805-derive_clk_perf_tbl_from_perf_domain_opp_table-v1-1-61171ab1cdce@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: arm-scmi@vger.kernel.org
List-Id: <arm-scmi.vger.kernel.org>
List-Subscribe: <mailto:arm-scmi+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:arm-scmi+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260805-derive_clk_perf_tbl_from_perf_domain_opp_table-v1-1-61171ab1cdce@oss.qualcomm.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI1MDA3MCBTYWx0ZWRfX1NMRHka8gIIZ
 79sSHysmM61l4lNQy2cTWNST8kUQTshx00Y6uc7b2jm3A6mtuvL4dAFSHOY6bJeIu/99oc6CeHZ
 C/phcCqM+fLaqDT/VZX/ahVqantMOsc=
X-Proofpoint-GUID: doxE4QG-2YszacJoa58JHVL-dFNVMj7Q
X-Proofpoint-ORIG-GUID: doxE4QG-2YszacJoa58JHVL-dFNVMj7Q
X-Authority-Analysis: v=2.4 cv=Ru716imK c=1 sm=1 tr=0 ts=6a8d50e2 cx=c_pps
 a=KB4UBwrhAZV1kjiGHFQexw==:117 a=clBUptZa5v5FR042Ey+sjA==:17
 a=kj9zAlcOel0A:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=dS1doENrTls30Ym8nGUA:9 a=CjuIK1q_8ugA:10 a=ZXulRonScM0A:10
 a=o1xkdb1NAhiiM49bd1HK:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI1MDA3MCBTYWx0ZWRfX17CJgAawImxQ
 vMuI17wwTrV9SslMuhhJjP4cVtO63Ac/0Y+b9oXxiv2HVE/GOwE8UgIeuQRRoDkmXedyfIkIkIi
 AzR0ZCe+mnJ21B7x+g9scyAD8oWg91rm1DZSzDDKgcgYp0pv6+i4WJAdg8RlNuEVDlVRXiEOpEw
 2DBPSuGm80JcEHZ5iO0Svfvz2OOQ50GYRqHF4RESUmlX/4WYybDQ6Eqz7iFg0SEO5X6tXEWTClV
 rvhqXqayOB2mmWaC81LFbxNqs3zmkDAVBCf1aRwC0V0C/eqF2YUS0peeGHndRvti9kWs+HzlrdX
 YdA74bDMHWmv9O3dUqsKYjeU3Z/7CppkpA65VXbT/Qxt+lhAGtBWrmTLAnU/+MEW45f91VVFi5F
 7N5u1AXETRq98Q/GFHfqbvE37SyVV8clsByvaRJlezMVWD9P+QtWvgEea42c9zEFjdh+YumRr1d
 TSGQenJrX0f1BaSpYNg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-25_02,2026-08-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015 suspectscore=0 adultscore=0 lowpriorityscore=0
 phishscore=0 malwarescore=0 impostorscore=0 spamscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608250070

On 26-08-05 01:27:39, Praveen Talari wrote:
> Currently, scmi_pd_set_perf_state() treats a performance state of 0 as
> invalid and returns -EINVAL. As a result, devices attached to SCMI
> performance domains can report failures when relinquishing their
> performance vote.
> 
> The OPP framework use performance state 0 to indicate that no performance
> vote is required. For example, dev_pm_opp_set_rate(dev, 0) is commonly
> used (by firmware or linux)  when a device is runtime suspended.
> 
> A zero performance state does not require any SCMI performance request
> to be sent. Treat it as a no-op and return success instead of reporting
> an error.
> 
> Signed-off-by: Praveen Talari <praveen.talari@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>

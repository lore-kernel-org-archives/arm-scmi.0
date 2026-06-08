Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3D743D524D
	for <arm-scmi@vger.kernel.org>; Mon,  8 Jun 2026 14:51:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780930270; cv=none; b=gjgiXetksB546frweTox1MuDHkp0m/HjSkipNgISDbL2/UFmDNjsLCA2GllaPcu1EBNTMAhGNi6TuZ6d0HBhyGmgUUzx5QJrSKt9PulW6qfkx0zXzR05hepzejtF6rzSjwZk2mnaDffyiklm1il+eyFpn1UeH9ds2cIxeim/sfU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780930270; c=relaxed/simple;
	bh=7bAFlegNcaAM7jIazsJsCsQAzM/frNRmVYN6YKb/GCQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=C43FDYTC4eSNsh3pJXiHiclDi70F9NeHVTvDmHYedrq8A3WDPUpwYdnrEf+SqsZt87BCIQmdgSywVkDThCsUenVMybimuz1000kKJ/cDb4ivdSnU3grJFzQVrUvStUwWSvpDRUoRleNPNIUArTnkL4nXOt0SyJwDkcO1hIJWFJ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lOADQZXd; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=UDpNcFti; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="lOADQZXd";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="UDpNcFti"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 658EXrrN3425503
	for <arm-scmi@vger.kernel.org>; Mon, 8 Jun 2026 14:51:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=j8EnpuCzcUuvRBN9723uAbPS
	zr4hbEhiIjtXLvgbe0Y=; b=lOADQZXd/+BGi1qsjoi1RLvtcZfOEV8NeFRqV9T1
	uokej1B/s3PGI3pJNElvDNacgSVtBmBzgtGF8pticzbcr75c1/VSjN97Hn8dPtlL
	tJVC+atuqJPLXCXyR5eHedCfXdqC/V+Q7JGtbYZprcTFVr2k2/Rr9+VQzIc6B0pK
	9AeSLTF/2sQFZ5M8UA0caAW6O2ozyQEbMKYUU1kAYsqV1iDBMmPypNC2fkcr2SH/
	nJrUZdhK+KTOJdppu9QUyo8XWKWecZyVc0o6vhibWlI0nM2n+xm9AUESi0sUBue4
	/NmRyG9Z3znpVtPcHE26Td4sPwKMRPLLccewmrG4EVPHFw==
Received: from mail-vk1-f198.google.com (mail-vk1-f198.google.com [209.85.221.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4entrksk58-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <arm-scmi@vger.kernel.org>; Mon, 08 Jun 2026 14:51:08 +0000 (GMT)
Received: by mail-vk1-f198.google.com with SMTP id 71dfb90a1353d-59e6c1217b6so3201646e0c.3
        for <arm-scmi@vger.kernel.org>; Mon, 08 Jun 2026 07:51:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780930267; x=1781535067; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=j8EnpuCzcUuvRBN9723uAbPSzr4hbEhiIjtXLvgbe0Y=;
        b=UDpNcFti5Kr//o38MVp47jOdsO88vnYi0RmolCO+N9boA2B/Y2QulJsrKp/Twg6YZ4
         Qcp3lEpUY8Hvre0wP+j9nmAdtKzfMK2viIxkwrDYqTXXnQTeM9cbAI06sw/Kp2cN7Ewd
         s1OflRkCINiXkbSzE4CpX/zVLzQSX5LI21LnjzYuiE6QAv8WRQoLoi+zWxGGS1RSwes3
         SZe3di+m9jkf+p6PHSGPaAnMgeXleOgZeC4lbAQbM9uoEBWMQvGkWtrWCvR4k7CpXVBC
         5POVT+/1puNe8BykQTMdV8rRLAbWGFfjDDhwGhWpau+QnkBCCmPgdA4/Q3Gr/2puuolP
         ACFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780930267; x=1781535067;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=j8EnpuCzcUuvRBN9723uAbPSzr4hbEhiIjtXLvgbe0Y=;
        b=TD9qjQJLrYBEDOmjZT6a60kH8+zzHjaOvVcNnIPnNz5f4voRxG23yLM9jNjvijNGx1
         HSKCTUn/mHnkYvdrwhCWEVoURHmQTdG2u5UDJrLcQ98Y5D6gbjxCjH3TkKWaE/o23G7y
         26nBhXIe02JF4qlEcfmE295nOvaJFDC/wsGbOqf/OEd+yWSW2goYroa4cGVAwXKfTBVT
         gY5CBiIvi5l04/1N4TkOwRjDDuDeooPYqhpS3yl62NMzu7Vu5CDT/RDVb9bZI+tKgQK0
         HsfUITOlxEJbQt97z6XdLO66bZbpldJqiI+GWiWn5lkdXgbKFAE64jhiVxY3JyjXcLyb
         BAng==
X-Gm-Message-State: AOJu0YyMhDLgcN7/p7iw1dKDLUr3cM8wtiro3QsmKjkTspjQpu+dx+0u
	lFXVZyYaKvc4KVFD/G0Uzu4AT3Nd6pvY5gtoIq+Awoy2PTgMlGY6MVIBFbXa5aejmxyoBv3kMtj
	m7eAQ2p9nlU3aeLG/jIJ2LM2hpIshIcDk+UcEOr/gyJDJ6VixSy1pAaCgcDQ06Q==
X-Gm-Gg: Acq92OEPMmB5uawRU8xxCikOP0g8dKXcFcsiHHq5p6hPQjFmwRODXACyqK7eaI+Zj6+
	JDa7EXtJ//v4m9mBIv0xUP3Z7VxNpf76DWb+gYQYXmkcCtZw9iHh1lY4Du84qJumxO99S1AzlEt
	Xza4MIRkWUimIV1hiLr7ts8LQtOpYjon7w8r5KFTJZMEYoU3u3MLLbQFSnBs/upJA0rACsJc2jz
	Y9mtsJkTxtrxOsYmmQCtpl/F1DLlH6aP3oPXyVKubIzljVsiq5eFBXsG9lcESJin7MR5s8TlieA
	Q8ttnzu7+bmQl6FW0mHv9egec0o1pyiaYgVYZ1/1TqDmxRiqkF5F9yFGPmaw40ZZ3ri7vpFl46r
	enWdoMUK9tK5jtksSSVUtuHo3Q7/HFkGhW1FoCz5dwSuWcK73XO7IXg==
X-Received: by 2002:a05:6122:3d49:b0:588:33d2:9249 with SMTP id 71dfb90a1353d-5ac4fc3c59bmr7051101e0c.8.1780930267170;
        Mon, 08 Jun 2026 07:51:07 -0700 (PDT)
X-Received: by 2002:a05:6122:3d49:b0:588:33d2:9249 with SMTP id 71dfb90a1353d-5ac4fc3c59bmr7051053e0c.8.1780930266712;
        Mon, 08 Jun 2026 07:51:06 -0700 (PDT)
Received: from mai.linaro.org ([2a05:6e02:1041:c10:2c9a:9b81:ddb8:1d14])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490bc4082c3sm385684105e9.13.2026.06.08.07.51.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Jun 2026 07:51:06 -0700 (PDT)
Date: Mon, 8 Jun 2026 16:51:03 +0200
From: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
To: Cristian Marussi <cristian.marussi@arm.com>
Cc: arm-scmi@vger.kernel.org, guomin_chen@sina.com,
        linux-arm-kernel@lists.infradead.org, peng.fan@nxp.com,
        quic_xinqzhan@quicinc.com, sudeep.holla@arm.com
Subject: Re: [RFC PATCH 2/2] firmware: arm_scmi: Add bus support for
 autoloading
Message-ID: <aibW10NMmzw3QnZ5@mai.linaro.org>
References: <Z6CNWOp8B_ghIrJt@pluto>
 <20250203100154.140877-1-cristian.marussi@arm.com>
 <20250203100154.140877-2-cristian.marussi@arm.com>
Precedence: bulk
X-Mailing-List: arm-scmi@vger.kernel.org
List-Id: <arm-scmi.vger.kernel.org>
List-Subscribe: <mailto:arm-scmi+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:arm-scmi+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250203100154.140877-2-cristian.marussi@arm.com>
X-Proofpoint-ORIG-GUID: 52ruGvhV2EMmVCIBpMysAJ7mPaUnOhsj
X-Authority-Analysis: v=2.4 cv=Z+3c2nRA c=1 sm=1 tr=0 ts=6a26d6dc cx=c_pps
 a=1Os3MKEOqt8YzSjcPV0cFA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=7CQSdrXTAAAA:8
 a=RjQnVeMJaLWvdfoecCEA:9 a=CjuIK1q_8ugA:10 a=ZXulRonScM0A:10
 a=hhpmQAJR8DioWGSBphRh:22 a=a-qgeE7W1pNrGK8U0ZQC:22
X-Proofpoint-GUID: 52ruGvhV2EMmVCIBpMysAJ7mPaUnOhsj
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA4MDE0MSBTYWx0ZWRfX8xWISb83mTaF
 X1Yo+A0UhUrXUW/806cNS58p9ikbt6yVUwNfRqL5i5/JJFHUFWygtgh1Q+qQPVXmX5jiVA+G+O1
 3GuwEqm6KcPI2rW081hbttv7yBZR7d0SarbNXa2DnT8QOgNk6l6tTHFhMonmpDxHm4TrpB5ZsB7
 yg3gzXPh1OEkaKv5H/91OuMUX7g8JUFHiQ9lHZTVGFckNP4YiJRF6lv6gAhqHvmqr5+B/HIAHOi
 w8R+MYgwzNTzQoxmQbIyzfZiMFWK618B4B/MYJ3p2ftOmfax9CwmgxEaJXosP/2qGe3jNhTn6x6
 u3f2gZ6ONw6wfZ1HBux8U5bGKrdsGBovQAivJ1msrItrDpa2EnrnBnswem69ZEhUpGn71nbhWZW
 vw7EIDQB3gR9FkQJzCdOIdxFmkGsKZv5JRaD0pgidjWbrpKMEWX/UV9XaYaZbOToJi1UnXHtHgn
 zrA6SyWoAz7LQBPrmnw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-08_04,2026-06-05_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 malwarescore=0 suspectscore=0 clxscore=1011
 adultscore=0 priorityscore=1501 spamscore=0 impostorscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605210000
 definitions=main-2606080141

On Mon, Feb 03, 2025 at 10:01:54AM +0000, Cristian Marussi wrote:
> Emit proper MODALIAS uevents when SCMI devices are created and make sure
> all the standard protocol devices are requested when the bus is
> initialized.
> 
> Signed-off-by: Cristian Marussi <cristian.marussi@arm.com>
> ---

Hi Cristian,

what is the status of this patch ?

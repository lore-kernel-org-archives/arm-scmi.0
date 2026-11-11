Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794356243;
	b=2fnboElVcSjh4t54EkIBy0u6kfY+yl55y8z04RdIaW+16vZh0khdlDSLe/kIRsLhSKL3
	 WhqgikjnG1WVpdavq0Xe4Nq4PryvgMPFP945QSeS08u2oPROHcN9H1SC5kotVt/LqsIde
	 X7VUMlgYfC3xIQBm4pqnUcbj+PHpahLldf/MG4gDuCtAyPFgbjPWenxacp+J8A2Phot3Y
	 TaoAzXs6MbX0Ali4QGoYLe/QThxQ5Mi83Q85Cy6qOMzb6EJqAXW2EYd8v9FNGY1UgyXy+
	 7aNLbieBqEoXswxygt9TM3IfaREURvh74tt2tQ7oK5kskSha2ChRd023vUzF10N7mqg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794356243;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:In-Reply-To:References:Organization:X-Mailer:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=nbWhx2amPnBedKqcixZZvPPSyHTBlFBe/3TWhbUU5Nk=;
	b=3ycCNYyyj+TZCijjemXfQJoUQQrM0tltjZ1xnIK8tqhXm+tG7EWYTBQimX4u6z2xzDCm
	 p8GkLA0RqXeLooaJGRNktbzlo3FEKyAMUr9SCZzpk++JXx86tmlGFSPtdWVVgFu9l6aco
	 FqcmQM8Z22H4Kf/l8uQ3lVfpZ6HtkrXa9xWCwcx1AO+xeDi/xnRqTjsMSozCFC0HhAbv1
	 SLrDgrro8Dw9bvTXPKYR/BDuhOdFn1N47Oc/fdXHLkNigzbnPLefKAhOxC/dCvE2DqzPp
	 W2Ag/xqCf1dpF8kB4HIalwdJmwoBXQAErkk4A0DijsdpoMziUezRYFeEBxPDGu6hEaA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=P1jWdHr6;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=IfKcJwZ2;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91D28606A31C
	for <arm-scmi@vger.kernel.org>; Wed, 11 Nov 2026 00:17:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 91D28606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=P1jWdHr6;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=IfKcJwZ2
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AB0FOGn725935
	for <arm-scmi@vger.kernel.org>; Wed, 11 Nov 2026 00:17:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	nbWhx2amPnBedKqcixZZvPPSyHTBlFBe/3TWhbUU5Nk=; b=P1jWdHr6o70PdxdE
	ca3zbWHpNS/Q01CDJVg19jkHrl++unZ1XbyzY7IsBwRaRE98NN5l57+rfglCjeUs
	EUzFmvU2dHipnb51F/07MnWsrAT3JLLqaS70e8R8bqSzycczc6dy6CqnrEuVAqKu
	nq1TCW6iE1eq39FbMLvDxji8cx0sV2H9n5TQFTz3+z3CtTKIidu2Xia/1LsqCJM7
	bugsPotgrISQsh1mLnoqZhzMQfmCRbwrprnHgHYj1gFH5lV4pvfT9BHZ1yvwCE4a
	r2Ya+sB5losn1NopcXYulLCciEAn065bS/RRGx7WTUiJF4I/T8Cz69InGfJ4ZM+8
	6daWUw==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hvdnm806f-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <arm-scmi@vger.kernel.org>; Wed, 11 Nov 2026 00:17:21 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-36ecd5db581so3983044eec.0
        for <arm-scmi@vger.kernel.org>; Tue, 10 Nov 2026 16:17:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794356240; x=1794961040; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:organization
         :references:in-reply-to:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=nbWhx2amPnBedKqcixZZvPPSyHTBlFBe/3TWhbUU5Nk=;
        b=IfKcJwZ23KCmVgfWqjInA/YlX9jyme5yUyzl51RliJC9RALv2izz6/I8YPlGOrDSdN
         CYSG8BKDuaX/HCLYwyLioiAroFk37HD9sGPYtU3gVaZVMhAX0kGxQeDfVraS/lHpR66c
         qGpbh2UDA9eOJies0Uvn8oDHhWTNpq0cRo7sDWqPcvA32wFtY+KVVMQG2+ZALdR+OBDx
         CQB1QDfkBUklbYXddFVeNrC4OECHgb1ln9cfNGug9KmIo+r82bip7arXeT5ASi1J4I6N
         6zyPTstWdvw5/mMJnastI1bPcgSbbT6+vzH3zzB6qlggHwg+ho5NkcSUZhn3Wl85xxFP
         yIpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794356240; x=1794961040;
        h=content-transfer-encoding:content-type:mime-version:organization
         :references:in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=nbWhx2amPnBedKqcixZZvPPSyHTBlFBe/3TWhbUU5Nk=;
        b=h99lCmRDCFC2Qpxx2/2+xpWtkFAe2QKmyb2hNLOaxjTZcssrJrhd9QqcIPBVgvi5g+
         NFGnqcdNmdfKGTWReux8QKTLrxVAVF7cWeS+lCyMDmhh/5pyXjvPTSR9hrc8crgStp9u
         eAqMSDyqAfq8+/295Sk6U2LvfIW2rty1JMWVTbpJ/bqZrH44E7G0CD0M7h5T4KpexmhF
         KDXkZkGdkTEj333wY/jARFsbZrql1gwBzqbjorJcKTwm5ee/Q2kPT/rN5Q+zMmY5657b
         W4ArFp1jtvBev1hcW7SyXBarVkTG9dYuUZfxkPQHd5EAicUSOvBgXYL7iwcR4/mSbpFl
         VPUA==
X-Forwarded-Encrypted: i=1; AL+hErHl1HnNg0WxuuzvuWdtR+QHp+18dQ/0mreKkE0HEyPSmYwOrgGXEH515BF1nkXiv1ZKhi5ge2capQ==@vger.kernel.org
X-Gm-Message-State: APuU4Z+ppBeZ9hg6RvEDHVIcFOxYydcfbpfgb/g+Clv8a4WXUPQOkuxO
	pdKXZC9/pm6oLEfRVPrsHnys4Fw9/fEgBlyYN3L0qJMlhqt3GqlxyhcOTjarj/Lc1ORS7q8+zG0
	Xnc9TYeMjjVTP57xc8dHiGHbzs1o6kscew8kS/gnD+Ljr7TCGnE4iytndggd2kw==
X-Gm-Gg: AYBFou0ox8WSR7RfF5RLs2zLH+wVYfS9/XwdbrLoQJM+CflPVoGo8j4DD84tofxGF7k
	A9m9lKl+cYfaqAmnqiCVpnbJgAWPpMWd0zQaHJ196aYupdGfH6sNF0Xh+Po7A2s0ekDDD+BfUNo
	NgUTyeoktfg0HyxbYwB85DcBCTP8AhMrfFAYZnL/5sEj78EkVvyVZKzgXfCO7ryRH1gk1h2zFD6
	l9DoT9xTLW2BMfBwb/YLX5u07LWnx+3B4qwskV/ifRTAyHOsvOinqyGVPfY+Ye5ZqzD+k9Q+Ysb
	PyfGG/hz/Pbz4+JDoKmkBjmyDQ3dckbqlDcJ53V4hLWhkmrcEtmkD+7bcGfH4za1TkKzl/e1Xxz
	TO74iPY+37r8dqT602AHdjdcFf7G5R/s2tn0TerO7W9MhBJ3vHx6ZtCGYaLn2nPBn4oryZlp1JX
	7K+jXUNsnMKQIzVrjQ8MgH+YgbzvOB
X-Received: by 2002:a05:7301:904:b0:375:c862:34e with SMTP id 5a478bee46e88-3768636dc95mr1339970eec.20.1794356240135;
        Tue, 10 Nov 2026 16:17:20 -0800 (PST)
X-Received: by 2002:a05:7301:904:b0:375:c862:34e with SMTP id 5a478bee46e88-3768636dc95mr1339925eec.20.1794356239547;
        Tue, 10 Nov 2026 16:17:19 -0800 (PST)
Received: from localhost (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-375218c7c50sm19260603eec.29.2026.11.10.16.17.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 16:17:19 -0800 (PST)
Date: Tue, 10 Nov 2026 16:16:56 -0800
From: Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>
To: Cristian Marussi <cristian.marussi@arm.com>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        arm-scmi@vger.kernel.org, linux-doc@vger.kernel.org,
        sudeep.holla@kernel.org, james.quinlan@broadcom.com,
        f.fainelli@gmail.com, vincent.guittot@linaro.org,
        etienne.carriere@st.com, peng.fan@oss.nxp.com, michal.simek@amd.com,
        d-gole@ti.com, elif.topuz@arm.com, lukasz.luba@arm.com,
        philip.radford@arm.com, david@kernel.org, souvik.chakravarty@arm.com,
        leitao@kernel.org, kas@kernel.org, puranjay@kernel.org,
        usama.arif@linux.dev, kernel-team@meta.com
Subject: Re: [PATCH v15 35/35] [RFC] tools/testing/scmi: Add SCMI Telemetry
 testing tool
Message-ID: <20261110161656.00002a1c@oss.qualcomm.com>
In-Reply-To: <20261109091221.2532706-36-cristian.marussi@arm.com>
References: <20261109091221.2532706-1-cristian.marussi@arm.com>
	<20261109091221.2532706-36-cristian.marussi@arm.com>
Organization: Qualcomm
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.51; x86_64-w64-mingw32)
X-Mailing-List: arm-scmi@vger.kernel.org
List-Id: <arm-scmi.vger.kernel.org>
List-Post: <mailto:arm-scmi@vger.kernel.org>
List-Help: <mailto:arm-scmi+help@vger.kernel.org>
List-Subscribe: <mailto:arm-scmi+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:arm-scmi+unsubscribe@vger.kernel.org>
List-Owner: <mailto:arm-scmi+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: U5AucHCnDFFCnwaAjTWOAj8GFPefoUnu
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTExMDAwMCBTYWx0ZWRfX8xbFYocZglys
 JMZ1iwT1YCcl/O1KzhVyiId823blypXClLe1QfcebwBoxIXcToF1EpgqT87CZfYYlhQ1TD1z8fk
 rWZ3DYKhdBnqT7gNiUZ0LN8O7fhg4D4=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTExMDAwMCBTYWx0ZWRfXwENVll6+80oo
 dAQOiFPAhWVFEwDo19lSXwHfQp2jBT+bMe5tAR8ohn18ql1yBeT6g0wxjNCsN874aJUZksjBVsl
 ypSkY65G61QaHkDspfTKH37gNVy2KDALIlEY+TSHRfVs5k34+tBaIpcK0wq+LSsu0Zy6Q9pKgF0
 V308aOGJSrDbyDQVETXOJUa0V+9EH6a2dZQ8fDqp8XfDSo9ITOjdE4LL9KAdqAPdQ1l8JrnZsBd
 ysEu1gt9+7oO5Sc6EMV6RqIeQN3ck7hykC3U4H/L96qMRpnUJ7N6wlc0iwNl9HV+VzZBzw+JZwq
 /27D6tF/b/daI45LtPMTpeUgXxA8kcwMHCrV/d/gHjxiB4pb2B+5AJUfyULc6LxydGJmTG1l6ri
 y0w0cXIf1lQVKg19c4hqJXhJndL/2QHcH81mUDim73wZz/+dJAwGpk1YDSP7Hjx9l+2te67bgrr
 dM+UImWvR5AqmnuXKzg==
X-Proofpoint-GUID: U5AucHCnDFFCnwaAjTWOAj8GFPefoUnu
X-Authority-Analysis: v=2.4 cv=MpzHeGae c=1 sm=1 tr=0 ts=6af3b411 cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=7CQSdrXTAAAA:8 a=Rq-k35hIRNRoFwHvQQQA:9 a=CjuIK1q_8ugA:10
 a=PxkB5W3o20Ba91AHUih5:22 a=a-qgeE7W1pNrGK8U0ZQC:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-10_07,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015 impostorscore=0 lowpriorityscore=0 phishscore=0
 suspectscore=0 spamscore=0 malwarescore=0 priorityscore=1501 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611110000

On Mon,  9 Nov 2026 09:12:21 +0000
Cristian Marussi <cristian.marussi@arm.com> wrote:

> Add a testing tool that exercises the SCMI ioctls UAPI interface: as of
> now the tool simply queries the initial state of the SCMI Telemetry
> subsystem, tries to enable all the existent Data Events and dumps all
> the Telemetry data.
> 
> Signed-off-by: Cristian Marussi <cristian.marussi@arm.com>

Test tools need breaking up into bite sized patches too!
Perhaps a little easier to read than kernel code, but you aren't
generally going to get great review on a 2000 line ish single
patch.  I'd be tempted to do this a bit like we do PMUs vs perf.
Separate series, often posted before the driver merges but not
really considered for merge until afterwards.

Anyhow, enough telemetry for me for now so not going to review
this yet.

Jonathan



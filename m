Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795563775;
	b=W4O73ZO17dOMEZD81N81Nom7+AqV/UNSDFUc+0zzxqsC1L6pykzA71raASojCojYL9F+
	 YcF+/vrwQvd/uxK/2ty6EdhRFrI+CMeGErDa4D92u4wy8ilAXn6h+Pc9eVi/UFkkm5dew
	 hFUDWFwMgtEAW+/avczqLwTBZtFefZxyQNEuqNC8XHfNv/yejrUd9ATN2xNRguxhElRuE
	 Rtrh8hc8jAhtsZj0MC21pXBV+8TeU3GXzQP0otEGKuHm0UIwPavqa/hCh/Y1pt371a91X
	 JzNkvrLB1jHoMRVN9miFhXVtwoC9xNZ8a/nuvlJXPBI1GwYSBgQOS86qr2OgKAaFaIA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795563775;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:In-Reply-To:References:Organization:X-Mailer:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=qqVnxMuDZt6tT6zXcpMuhndEwJo916wGqastscvSmQ8=;
	b=dbRM+I+PWmTmUtc3BfmxY9ZdlC7QWYgP9VjGtOQgHkMc0bYeT5XSjEBNYVkp8KwDn+in
	 RsnWyPeBrO+skGEn4mBYt2ntDO902S2mM/xPbMzSty5+REnaNfnWHyRs7dtpVW3WhAHmu
	 wxRZ42+pMtkXeD5TVv77dCxMqYpxXBFjzSjPA4qbT+/+U3oRNs5NWjKJjdCw7vjrqJNzQ
	 SF/5+2zdIvSv7FhB69b6S8l2q1T51ufJythwMx/HR+7aSS+6uv06MDVVjbqlRdOKDlMIl
	 1Nn27BePkIRq1fjat/00SbIwWFIHq4opQMnPa1fIcOeelod0Pg+H3ntxJMeoxD8rK2w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=DaYzFZsD;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=R0jaRQl0;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54A45606A321
	for <arm-scmi@vger.kernel.org>; Tue, 24 Nov 2026 23:42:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 54A45606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=DaYzFZsD;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=R0jaRQl0
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AOMb9xZ2288840
	for <arm-scmi@vger.kernel.org>; Tue, 24 Nov 2026 23:42:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	qqVnxMuDZt6tT6zXcpMuhndEwJo916wGqastscvSmQ8=; b=DaYzFZsDbHmhOPgW
	ohtf7O2aDR3j1uhYhMagM5N5PcxjpIkbO40Pq7BnbIgf1e127zOT1h02zjV5U6GW
	xYvNHWfjdKIJ5kiai/qZl4H0diuC1W1cF9+cxzxw4cdGGr0Y+FnU73hxfeMQ7ESE
	u24XtZtnOmmihO5/z0C036Amck2Dw7QLHjck+M76h09mMjp/sWvVDHpl59OzPIsI
	OBnFKdD+8rOuMuRzP061C1SOynYs2dXCc66sqM0M3lbIdLZixX3j/6qJPEpc27/O
	TgMpIiOK9c01OVBZKoZ4hfpHhQTU3Im6jdupwHoA5gLKGfkIHMDj0F1TNophSXh3
	0bv8cA==
Received: from mail-dl1-f72.google.com (mail-dl1-f72.google.com [74.125.82.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j5egs9f5y-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <arm-scmi@vger.kernel.org>; Tue, 24 Nov 2026 23:42:54 +0000 (GMT)
Received: by mail-dl1-f72.google.com with SMTP id a92af1059eb24-16bc6f3fdb1so3252149c88.0
        for <arm-scmi@vger.kernel.org>; Tue, 24 Nov 2026 15:42:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795563773; x=1796168573; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:organization
         :references:in-reply-to:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=qqVnxMuDZt6tT6zXcpMuhndEwJo916wGqastscvSmQ8=;
        b=R0jaRQl0n2REaxPdpJy4m1Z7afJYQ5eOdhUiKac4OzFikfrv23chVNXbiwqolt2RUi
         izvgE8sAZl3i6ac2h2rrhWpNnuAWk1RnovP3cqV1fqsXFxyeytWgrwvYEkGI2983wxM9
         7+2Ss+D0/8BrP3CpMvaJ42zJyILbGgk5INAz3EzjnAVmR1yi4YSTu/EUE+qMYjtUy29I
         30Q2PaplARbfBuCp2npyFg2JKwL9Zyv4Rhtp9RWnExszYh6ZViU3IbL11jMX8U+pifS8
         JZend+fre019BLna7kf260Ff0d4g6sky0cwKH04nRS2QVD3HHv2mYbBGBsv84wHCm7gh
         jPCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795563773; x=1796168573;
        h=content-transfer-encoding:content-type:mime-version:organization
         :references:in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qqVnxMuDZt6tT6zXcpMuhndEwJo916wGqastscvSmQ8=;
        b=ZCzSCfbBJjTdngWB9MvNt1zoWrPO6OwA8pP/akvNiwQHej8Fc6PwT+biMb+tvcKLPj
         HzLNL8sNESlPzNKyCdiheFYnzWeBkKQIPDdM0L6Iq2rNpfxjH2CzgGIJcMAIb7jH5z0g
         rEOEPDnRjJGyL1ILOXy/XSCcgFOOcuI7qa+hy9N8bMSbGccZTBiuAP2F0HZm7QFoWsgU
         Q3HYt7WYBK3i4rdxOnXoR2rCu+n4uVDPZJxYS3BglEyQQcixq/3v38f/j9ECt3KN41X7
         OShWb5Lg8EsvEYf6RlnemD5O4EYqjOjxLlAZAdLhg66MBbmy0wi/FkVx5z5JgJBKZ8nr
         WY5g==
X-Forwarded-Encrypted: i=1; AL+hErEnj2u1ssu68k7KjfO1r2n2wyRv+2XLBUDeHcjoP0l5bt1VEXOljKREbqRWRHm5MTQwBLZnQdTtjw==@vger.kernel.org
X-Gm-Message-State: APuU4Z/Z8OHp5MLbvNVSrS2RpRdxrfoi/DaBvmt1QYef6KaZIDm0m2my
	SzoehGz16/CyXUw3401z8SuPrktsRaUVzcK7zp6o+s5BIcK3h909dJpX5/RNeEDdwgEPPzuzncu
	NQ9qjiBhx/WDmBrlsSvFNzD/9s3Ldrftx/Hf3pONNRM9qjpxtTWBuJRozLHGfnQ==
X-Gm-Gg: AZFdTZfXGx3dCg+4KTgIHL5fQSL+YgsBLf3g7Voad/ZXWCZ8TDbSuL8uAxphdQbiMqn
	5T/NVVQqJCU7iWFN7v1dRDV3DAdTYPIZjWltnSRHWCE9WKtBjz9fBGxS87hdxnv5fdzLM2eJUtj
	CjcWiSNTW94KKAK94dPEC+5Y41rz84zWz02yXkgnN0bitdaNOLMVx0z+nlaHAhNmgt7//uyPX3B
	aLd9u2E2p+4QMNTonnN+xpLdwg0mpjl/vhzPpd/w+oRTA2YdVVoeifQew1LLO3GIIp0ppJXZMqQ
	vmz0hF7GvQx0vYSNSjP6Xg0aHqVNKvRztKu3vLHysptbaWNIvVLaWgY9QuudJZsSeS0GpYVwRaw
	g76k52qfULdsFjUR+9jyhb5lLyRBWh4ZkFGe8w+cGTa1j1FI9ypgMeNFJZR6zExHlC24ak8JkZ+
	JomfuG0RHsW+Vo30PsJhCrF718Bbps
X-Received: by 2002:a05:7022:5e09:b0:1a0:b8f5:872d with SMTP id a92af1059eb24-1b5567c13a5mr15272361c88.4.1795563773004;
        Tue, 24 Nov 2026 15:42:53 -0800 (PST)
X-Received: by 2002:a05:7022:5e09:b0:1a0:b8f5:872d with SMTP id a92af1059eb24-1b5567c13a5mr15272345c88.4.1795563772474;
        Tue, 24 Nov 2026 15:42:52 -0800 (PST)
Received: from localhost (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b556829d31sm61388919c88.9.2026.11.24.15.42.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 15:42:52 -0800 (PST)
Date: Tue, 24 Nov 2026 15:42:47 -0800
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
Subject: Re: [PATCH v17 05/34] firmware: arm_scmi: Introduce a dedicated
 SCMI Errors header
Message-ID: <20261124154247.000075e6@oss.qualcomm.com>
In-Reply-To: <20261124194841.1147072-6-cristian.marussi@arm.com>
References: <20261124194841.1147072-1-cristian.marussi@arm.com>
	<20261124194841.1147072-6-cristian.marussi@arm.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI0MDA5MyBTYWx0ZWRfX5CuhbZ9acxh5
 /uGBFllO4G5rWYI1Jv69J4CfpY3adp3lNV1ESfZbx5l42MINY1H3r9E73xBnIAqv8RRF+Vgm2cd
 ko+LRmhOOIZC7j6SpMqxGK1fIGIODt4ywHYnMtPDBmTuoQODzeKT5+k0fRjMwAiHWCLLO1jG/Jd
 Y6NM6iE3ybgW4yIn60S72Ao0cm27uZHFM0Qdrx4UjRrnzzcxrL4wvTYgJhuT6F9q9A2Tf8oqdE2
 iBvu4eGrRDixcyXXWPlTJ6UwKMxp45/GRPb1DjphWBGO+BFCmYabfBr//lWuzXq+Df1sPgWWfAr
 ZI1oEyZg79B+iaS1uxsdHyTdTMrtHIcCJGdmWSuFbc+Y4e+H//lFgOmbHvOrsqH2x4lHI8ovIgn
 RRU0H+27Yuvk7myZQawCIL4f1cFVdiTCzHwyYRECDbQV5s1ZRZ8YTwJCBYgkXCanfc+b/OYm7Rh
 CCh8IuEu4tW3LblO9jw==
X-Proofpoint-GUID: gZzY9w1mxmmAFtzxcp2xZsRJkirjfHuV
X-Proofpoint-ORIG-GUID: gZzY9w1mxmmAFtzxcp2xZsRJkirjfHuV
X-Authority-Analysis: v=2.4 cv=Zt54uN7G c=1 sm=1 tr=0 ts=6b0620fe cx=c_pps
 a=bS7HVuBVfinNPG3f6cIo3Q==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=7CQSdrXTAAAA:8 a=EUspDBNiAAAA:8 a=gAdJEDVPSiZ2okViQt8A:9 a=CjuIK1q_8ugA:10
 a=vBUdepa8ALXHeOFLBtFW:22 a=a-qgeE7W1pNrGK8U0ZQC:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI0MDA5MyBTYWx0ZWRfX4rYfQjPsBtEP
 oqUFzhQ6ok/gIPtCIkRJRQ+Sgw7qhWuZ7tBlahVAgErTyizNN+SuZ0T18YbbR9HY6JzgmYLNEJA
 QIzuSvo6Qjh885EudyNeNPoWQNLNuzk=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-24_06,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 priorityscore=1501 lowpriorityscore=0 adultscore=0
 suspectscore=0 spamscore=0 phishscore=0 impostorscore=0 bulkscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611240093

On Tue, 24 Nov 2026 19:48:11 +0000
Cristian Marussi <cristian.marussi@arm.com> wrote:

> Add a new dedicated header and move all of the errors definitions and
> mapping helpers into it and out of common.h so that SCMI errors definitions
> alone can be easily included in protocol files without all of the unrelated
> additional stuff contained in common.h
> 
> Signed-off-by: Cristian Marussi <cristian.marussi@arm.com>

Reviewed-by: Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>


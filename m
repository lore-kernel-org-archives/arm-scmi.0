Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF6C24A3412
	for <arm-scmi@vger.kernel.org>; Tue,  4 Aug 2026 19:58:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785873493; cv=none; b=kEJ+L5lXtTMNquSvr8K7Bcp2fVReuwJxCJcMnh8TfUes1zteQVUGXXRXSCNe8s0e4UAB/DA6SqOANW+u7H+2SnhTqYMbhi6mqh4B0OYqn1xBWmDxN3YcFE3/vZ1p2JaY7Qi4LFzA4uV2QL2vtZoOEcb09Q+0qjNY6+NyVEIOa9s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785873493; c=relaxed/simple;
	bh=QHusmMhaGbIFkLVmVmgpKIxh1LPrPBJEiHcg0koGGmY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=N8qtwHJGJIBFKhvL3uxW5Q0LMyAFQyVTZBnGQjEzQqMtrNnScw0BH/8eN5xoVnbrV7KuRLV2wOjSnna4MmLpAhovcxkpT07/vRLKn01bbdN79tPlAQWncgGgLFXDpDPAQ9U8i39cgGcUnPAFrcLgJB4Q2gKdly29IWQJtKjacO4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bDzRUF6A; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=L8PjozER; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="bDzRUF6A";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="L8PjozER"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 674JmF4I953037
	for <arm-scmi@vger.kernel.org>; Tue, 4 Aug 2026 19:58:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	rNzC3IaAnkPqtcJDYyITkxHHLY0+YZOnhmPnAjsn054=; b=bDzRUF6AGiYwU31V
	sKUzppBV/TmVNZW4HBN0zogVQ/S+kQkMRGFn6d+DNoPUNpDQ1lALXnEDEZTK2Ktt
	RIR4HRcQWw0tUzjAbpzuS+PnsUKUnh4JAfENHT7wtVaxOkVc5/8YBCSvSV81OE1a
	xl1/qg9C30MJfMQDhAweUQwkAvddAU+/BOlwCgEkRfdd45eFHvTATC13DiMQ7Boo
	2e7uj7j0xSU3gjsIGe6C65Vpq2JVz9vPZSiH2iy0RBqAZrxe2z87vQBmqrMFPCx8
	slRNMuxOKvUlCznecZWZFzof8fSerwRVqJfnmqQSqbik25jTrTyA53pp/8E5BLc1
	6usgpg==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fum3q8t56-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <arm-scmi@vger.kernel.org>; Tue, 04 Aug 2026 19:58:09 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2cc640dfde3so2962945ad.1
        for <arm-scmi@vger.kernel.org>; Tue, 04 Aug 2026 12:58:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785873489; x=1786478289; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rNzC3IaAnkPqtcJDYyITkxHHLY0+YZOnhmPnAjsn054=;
        b=L8PjozER8DK34tRVhaqasaeOC6f6GcgQDiG5TIX+pimElr9mLnML4JPUqve9tgTuT1
         J+wKK+jVNtL4K9yjpPAH/LNswcrRbShozmxjhqGH1n2m9TYw6u0h3mMufPtPs5Z/h8P4
         LLyxnIvheVR7uIrHPbGxHaTa40vEDa70Qk+VLptvVzzwpLgRbX/e260daDjwd4rbX/tm
         0/bMdOz/c5uztLuYGmYV5pQGfb1PrSUG4j6CHZp+goxexL5XdsYvb9wzb57h8DM954tX
         LaJ2bQ2cR7i+Ht8IrBaRB/x7nU9FhgCSkrs+ZF+n+/t1CeQ/8jK+oiLIeR3FYth/70k8
         fRyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785873489; x=1786478289;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rNzC3IaAnkPqtcJDYyITkxHHLY0+YZOnhmPnAjsn054=;
        b=J6ZGNHz2vT4WUsz1JMXUB7o7Qivs2aD1PI5QDe8xfHDSBieDLgaxJL0DsqoWUrfpLH
         dkDyW/Ad5oe/E4ru2Vgn8FsOUGFzfgsMVeKg9CLAQJJ1iN+z7x8vc2zcSrJjqkk7BZyo
         Up/73TIIDYTYpNXIdwsMCECkxttGbtQvqTcUCoQobIg2yih8cZFdhtHc9YyOUDLyaRNd
         DLzYfRk9A/815KvE5MxqnlJUnpwvzMIvX2I2PMtUOFNBp1yHDbRjFs5ntBu6zocS4o4y
         +Dc/bHyEtfw7DgCP/Bp3vyxyFsHfudFkmb0NxHmA9AwPC2IeFZ0ZkObQisXEqDdYhnI8
         O5cg==
X-Forwarded-Encrypted: i=1; AHgh+Roo34yAJiZQdLIwmrwT+MWuK+/hFzOGA25MJ3vCyhXJeUMl1xp36qR5v1/wFTTRfv1+Tlh1Cn6tiA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yxo3RqH188fW0q+WVQmThMvbYwqySe18JT5yl7ndF5ttBzhYUcD
	FoGFR4Ez65E7p+3Dk6u0AHTfFxVcS0qmwdl+V2sitFcmN+N2FWovemGP/agq/+vtmQpF2uDmLic
	QStPhHp0HN2C9tDIzP/H4tblKEKl9NOlvV+4N4kh4mVjeUNtS1phndqy9iwCmbg==
X-Gm-Gg: AR+sD13lITVw+2O4P+MRSNrPLUKqvcaClM2jpnOtCDx8WKlyngTHBtYQJ87yq+unwuj
	GXEpwfcr+HiMEUlfbFZdGJDv0EEiSnsIOnvfeTAumVDIbQoOhRDoIm4cn0YgiXCCKqBKkYChtPa
	PITnveRLb5Tm1tt9qIuo+5HwNFRBkA861kFetrA1+OQaH95Q+mUOebc9yVAa2fZ31wt2vzuXQPT
	rLiM649U8WZz7j/uvZ7ywj/M+nse3R0VCQ4JlJrwdXTUks1y9qNTaEXEv0PK1nJ6Ujf846KrEYc
	DdIW3jgyTvmsPQMsA/XSVAEyWxUZaKk+erTC4/1mjq/3dx/jYzsa/vPmBWruWMdi1kbCc+zAEnQ
	+2EMz9KPPvpiygf3CC7G3BIRy4KhyNg3kJQ==
X-Received: by 2002:a17:903:1a6f:b0:2ce:d957:59c4 with SMTP id d9443c01a7336-2d0ca7afcb6mr11223925ad.6.1785873488797;
        Tue, 04 Aug 2026 12:58:08 -0700 (PDT)
X-Received: by 2002:a17:903:1a6f:b0:2ce:d957:59c4 with SMTP id d9443c01a7336-2d0ca7afcb6mr11223555ad.6.1785873488203;
        Tue, 04 Aug 2026 12:58:08 -0700 (PDT)
Received: from hu-ptalari-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-315867a68fdsm12316636eec.25.2026.08.04.12.58.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Aug 2026 12:58:07 -0700 (PDT)
From: Praveen Talari <praveen.talari@oss.qualcomm.com>
Date: Wed, 05 Aug 2026 01:27:39 +0530
Subject: [PATCH 1/7] pmdomain: arm: Fix -EINVAL from
 scmi_pd_set_perf_state() on state 0
Precedence: bulk
X-Mailing-List: arm-scmi@vger.kernel.org
List-Id: <arm-scmi.vger.kernel.org>
List-Subscribe: <mailto:arm-scmi+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:arm-scmi+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260805-derive_clk_perf_tbl_from_perf_domain_opp_table-v1-1-61171ab1cdce@oss.qualcomm.com>
References: <20260805-derive_clk_perf_tbl_from_perf_domain_opp_table-v1-0-61171ab1cdce@oss.qualcomm.com>
In-Reply-To: <20260805-derive_clk_perf_tbl_from_perf_domain_opp_table-v1-0-61171ab1cdce@oss.qualcomm.com>
To: konrad.dybcio@oss.qualcomm.com, Sudeep Holla <sudeep.holla@kernel.org>,
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
        linux-spi@vger.kernel.org, linux-i2c@vger.kernel.org,
        Praveen Talari <praveen.talari@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1785873474; l=1262;
 i=praveen.talari@oss.qualcomm.com; s=20251114; h=from:subject:message-id;
 bh=QHusmMhaGbIFkLVmVmgpKIxh1LPrPBJEiHcg0koGGmY=;
 b=7NY2Qy1Uo7WrW93Aafa/QMqSQ+Cxokh+1WKAM1JvMN9b7jCvxdSzi5lT/yaqVn42n6Vozm6sR
 p4joM409JU5C8U5yINalro4nLUuP5VF3/aH1robdOvX6a4UlWUTsGBG
X-Developer-Key: i=praveen.talari@oss.qualcomm.com; a=ed25519;
 pk=NGK/88fjyHXgfhIKwag7+uIytOmyOypvZ/hDFaYPEss=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODA0MDE2MSBTYWx0ZWRfX98g9y1Q7pQ0a
 HZ6s/t8u1Uif+MifV4TIUAol/yqFQuo/ETNsoII20jcpxC/lbR4QlGLIkPOblIUqDScm9DMZiM2
 2kocRRta4iaGjlNwtlR0SQfU80f+PDS2PiaVSV9uKeRXAb8dWqjv7EC9EtBvJ9KmtvoV0t+ZU6D
 XNqACqgK+OP3aO5XJi6RyeoPimXNipWAiydrpcBbYEyFyoCnfyBTgQ+nJduyaZyr20Wm/2FzJXt
 BpZ/oM0cfZsmert/i6w/DiAtNttkVrXFsJm/FJ2kfcA9+VYG2cVTsjnsJGv1tg6q28CRrlSU5fH
 vpchmkzJW/7XFw1knb6nMyS/UhHh6LAUhuItcKXHozwb1DS6hoq8rGXiySVxfAKlUTlnycvfaSN
 uAlPHq9rUoUyEjCCosFZsh+Nu7q224cu73/b763fHlETdjRcjLzfI8oFUzF3CGZICzQV0BJmXhc
 I5KnzegPLO7IyVrwv3g==
X-Proofpoint-GUID: KfhQibTwLZTSeEDEIDX0AWWZjZOy52zI
X-Authority-Analysis: v=2.4 cv=LsiiDHdc c=1 sm=1 tr=0 ts=6a724451 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=sIx0R2CjXXeYvnaWutoA:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-ORIG-GUID: KfhQibTwLZTSeEDEIDX0AWWZjZOy52zI
X-Proofpoint-Spam-Info: AW1haW4tMjYwODA0MDE2MSBTYWx0ZWRfX0pzr2zITDec9
 r2lBd71lSJOGQpDGBJn0RJ5F5QY5Z4ppOj6keMIL0cTocN53Np0OFGEbS5n2+OZmh1qZTOnfv99
 vtnckkRVhMVPF5wQ+IjeOUpOKs9WnzY=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-04_05,2026-08-04_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0 suspectscore=0 clxscore=1011 malwarescore=0
 priorityscore=1501 bulkscore=0 lowpriorityscore=0 adultscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608040161

Currently, scmi_pd_set_perf_state() treats a performance state of 0 as
invalid and returns -EINVAL. As a result, devices attached to SCMI
performance domains can report failures when relinquishing their
performance vote.

The OPP framework use performance state 0 to indicate that no performance
vote is required. For example, dev_pm_opp_set_rate(dev, 0) is commonly
used (by firmware or linux)  when a device is runtime suspended.

A zero performance state does not require any SCMI performance request
to be sent. Treat it as a no-op and return success instead of reporting
an error.

Signed-off-by: Praveen Talari <praveen.talari@oss.qualcomm.com>
---
 drivers/pmdomain/arm/scmi_perf_domain.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pmdomain/arm/scmi_perf_domain.c b/drivers/pmdomain/arm/scmi_perf_domain.c
index 3693423459c9..e390f902a444 100644
--- a/drivers/pmdomain/arm/scmi_perf_domain.c
+++ b/drivers/pmdomain/arm/scmi_perf_domain.c
@@ -33,7 +33,7 @@ scmi_pd_set_perf_state(struct generic_pm_domain *genpd, unsigned int state)
 		return 0;
 
 	if (!state)
-		return -EINVAL;
+		return 0;
 
 	ret = pd->perf_ops->level_set(pd->ph, pd->domain_id, state, false);
 	if (ret)

-- 
2.34.1


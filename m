Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794350085;
	b=hJhGFemI0vt6bMmAlUejkXe8zPmfUL5STNfw+xShLzHDzA9qkIz0lESUMDb1SQgEMCYe
	 KDU6b51WLjFD9Ps7DmNWa47uPGSd0CyHMth2KhvDiYWO7MhTi78krLAA/RAQfjAQU37Wn
	 tEgNDzk0IaEUU32YMtpEHcx6qRhCwtylrv6XffxN8Ks4XWPKPZZvWo99wtQuRLAGkZ2oA
	 CoWUUHGqHu3mEc4AagbMjktUEDZTt5twIcpQNSEO7tPdKMa61RjkpirU6xQ8b0J9zjnVX
	 SRCE0xcF8fIQzfwbBJgBAbkt1xngJ5YPwi8OiWZf38XUBR4YD1OFPltMu8Fk/W8Hk6Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794350085;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:In-Reply-To:References:Organization:X-Mailer:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=IvL1zYmWG1e38nSpp9eLWnXl9WrfBht/vX1XlfPoCws=;
	b=m7tcTJluvw7DRVxlUt4H4m7r3Ha81jYKoU2YOxzqMrs6U9vUan0hNFrObvIZOleUW58o
	 4l9xDumZaBKIFq25q2FGdBuF0YelP0RtCVnelTWH9QIVE3g2FUDG9PaTIbC70eybwYtVA
	 j3LOaapPtwBJeeTfu+6BiqNZC+EYprnpteSLovsfQerlt+gAeZs8jQVOizsN7j+iwpMgx
	 Mp0rfHrG/o7FX2rbv8OKVAj9MxcccYb1MyJeDz0Yn9stLEykcSPgYY3P5o0B7GVGoDYM3
	 EcRCsHspggj1AkAHItQATObEak4W1S1kpb51DHaWLFpIIaowlFUDq3TmyoYxEj6od8w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=DAZ4n8Nf;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=PPAF4IC5;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB255606A325
	for <arm-scmi@vger.kernel.org>; Tue, 10 Nov 2026 22:34:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BB255606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=DAZ4n8Nf;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=PPAF4IC5
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AAMKTSp1448800
	for <arm-scmi@vger.kernel.org>; Tue, 10 Nov 2026 22:34:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	IvL1zYmWG1e38nSpp9eLWnXl9WrfBht/vX1XlfPoCws=; b=DAZ4n8NfveJRN+DB
	Z6DoHMAXwsKCwN+7FUx7rhjwPSFRNim82pOhUdcoLn7/CnwHW/ITl3U7Ee8i/Mwk
	e9wk7mWcjGShg0lOfnvU35X0c9Vl9imrcTkmwZ8BHmLXK2Zdkmzn0rNnnUMn5fGB
	l8QV59zgmOgU9IQbJsTfTBvIDdCO1aUWxUuVpeXY5vIIooYlKxJXrUuMIjRzeO4e
	YVG/XR0BEo2w8/AdnVdHznhEBbdv1JNdXjNxjEOOV8rRzuRV7VPgPPFK85ddBF+R
	byTC/t4ZBoxSqgf0drJaTfjdtqprj+qaJEYs2XrCVJFxcJuiJ04rFBmljglIHI0t
	biJ5Dw==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4huyvwk6k3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <arm-scmi@vger.kernel.org>; Tue, 10 Nov 2026 22:34:43 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-36a3451ea93so3843400eec.1
        for <arm-scmi@vger.kernel.org>; Tue, 10 Nov 2026 14:34:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794350083; x=1794954883; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:organization
         :references:in-reply-to:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=IvL1zYmWG1e38nSpp9eLWnXl9WrfBht/vX1XlfPoCws=;
        b=PPAF4IC5WFWPoax6gEDSaw0qDTp7ldi6HPYFAwsFYt6mmwiSqIs8jLELd7dYLgIxpY
         FC38XwYmIHVjR95UQJ4zDpbBYRthtA/sDQ9CMfpNeFUQ6qt28mejuxfZTIEGUD2DaMEw
         JlE83AeDFGZZFLXXbV8xzJPNC7XtWa/kN3UR5e3LmTImyL6Q2+fUTc2RqL3jDdScREpj
         i3BBw4cIs5BcTmMnr+9w7lkRND7pjjLjpONDz6RVIEcWo+sI7yN8Es1JxMTkSA8dfKZE
         p5H/kfmiBh5R+CWl2Ora1kjIz0uJMfEQvASSrp+AMZQX0OqyEvVXhz2LrSkLcddzobul
         AKrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794350083; x=1794954883;
        h=content-transfer-encoding:content-type:mime-version:organization
         :references:in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=IvL1zYmWG1e38nSpp9eLWnXl9WrfBht/vX1XlfPoCws=;
        b=gWmEeuh+8QHwer/O3K3oG0bMTdEtx0JKAsctVf1ksjtL6KiccSLNQ3gxwlZbmEUUm/
         4ep+M5gFKJmu6OXNnLgS7wZn2xp+VzPvEmGyRs0D+8n/AkqCnwingQBzk90Dv2e4d04m
         VhXg3vwkFYXq8q1a8k+KRr/dg1zcfjpB/pxG2wxfaw0QsyS1QGSNMOYEXDifsQg6dSEI
         2W0/8ddq3mqghv268X5Y0IekwGHKwHX3yypuD/+e47h5KaNHKM/zK1EazWLNGAdRU4/W
         5lnMbKuIiqHeBticGTqJ1WRhkPm7bD7d9Fs9dFPZjX9ynN8X8TOfdOBc8F9L5Ujq2U2v
         +mUw==
X-Forwarded-Encrypted: i=1; AL+hErF2YHnMNlz7qJUOqhFfQI6PyC6kgk4ZreHRRPpUNB8adoyn3ZfBp+FdSbAFcY4u92jTLsByquxXHg==@vger.kernel.org
X-Gm-Message-State: APuU4Z+gwYYjd6j8kGbBoS4CRCh0BMO/pry0qB2OxVUxa6I7XArRoqB1
	k+Px6bhSXsgOu+xbRClA25BXLfsZDss1Pw2FUCHojeVheFQeZBno+Ia5vFGKDmCwvHx2hB8gM1V
	qxXIFS5orApBooY9SD1F1cmICcExARrcEDxGx6ZyJNx4kB8M5+Kk9geYGVFvg9w==
X-Gm-Gg: AYBFou1n0Fv8oJOE1OFXXz6KY++5Gk+BlQsRlrDZkiR778Kf9hWHD0eA9LBCb+zerg7
	ab3ZbIqlSMjldS0v5UfcRHvELoOfzJGViX8Z4fduRI1+KD6mbqSVNXwDpzBbNBLcwxFnUQJW22V
	UNA8gFEW8oVU5QfPHSH1fXdWGv2QEcwi+RSLKdlZvCufrOA2ijLwCOglZ6a5nLC1QPMUo3NlgVp
	Q+zHk13JMF8lZ20Y1GQVVk4xi+BeW9RObCWCSc9uRMRaiPmDGdSXmv3QBK9tnlcUPibOVmsP6EH
	CzOf6Bovu0buhXnCQTCHk0TpSWEsMF0bP1fmtpv7XdqrrM4yzpZNHvgaUtxueBTgSfXmITWRZM8
	UlccirAz1/WYR4p9ZNsNohT2Al9yEchbGllTzAdSSp+W0w7gA+D4kiMn/9d5fHFDZjeAwRprm/a
	VRNaYz+26knVfOFoQDWxB1GdzKrF8=
X-Received: by 2002:a05:7300:509:b0:376:2e3d:7c62 with SMTP id 5a478bee46e88-376854b98afmr1391397eec.12.1794350083191;
        Tue, 10 Nov 2026 14:34:43 -0800 (PST)
X-Received: by 2002:a05:7300:509:b0:376:2e3d:7c62 with SMTP id 5a478bee46e88-376854b98afmr1391305eec.12.1794350082385;
        Tue, 10 Nov 2026 14:34:42 -0800 (PST)
Received: from localhost (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-375215d8889sm10389393eec.27.2026.11.10.14.34.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 14:34:42 -0800 (PST)
Date: Tue, 10 Nov 2026 14:33:56 -0800
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
Subject: Re: [PATCH v15 22/35] firmware: arm-scmi: Add Telemetry generic
 event support
Message-ID: <20261110143356.0000451a@oss.qualcomm.com>
In-Reply-To: <20261109091221.2532706-23-cristian.marussi@arm.com>
References: <20261109091221.2532706-1-cristian.marussi@arm.com>
	<20261109091221.2532706-23-cristian.marussi@arm.com>
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
X-Proofpoint-GUID: 9o6OhKLbICOdoMakc25pshXDIlTVDGCd
X-Proofpoint-ORIG-GUID: 9o6OhKLbICOdoMakc25pshXDIlTVDGCd
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEwMDA4OSBTYWx0ZWRfX59q2AqmIbUH8
 4z5HQnz1hu+6c+E0tOZV0Xmcbh13FPRplrSHROci8nXRLSImTM7HjPVcg+1d3OnVnNroSUkdHWK
 HOUhGlanb3BNGB1NiAPOOagdVCUw0X0=
X-Authority-Analysis: v=2.4 cv=NNpAaE6g c=1 sm=1 tr=0 ts=6af39c03 cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=7CQSdrXTAAAA:8 a=phf3XAa3S0evUxb1xUUA:9 a=CjuIK1q_8ugA:10
 a=6Ab_bkdmUrQuMsNx7PHu:22 a=a-qgeE7W1pNrGK8U0ZQC:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEwMDA4OSBTYWx0ZWRfX28I8A4Pn9OGH
 7Qskdh+oz84qso9dxwLpUpF47RIO0Pzd5IonVzJBelGPzdL8qLwZXIt1OV6GVkYelCfFmNkv5TW
 bAUydO2mNk/+RqMDZlDTjeHmLvAWa9T6I5EDkshgcHPj/j2yWRgi10bAW2CWw/P79HO3mXxdSGF
 K5gLI70cI62oBG85CPMWH0KpED6DqjaJmM3stxuC9KpIdDAuogCRU0ll61XUEqZucmwlowWJ4DA
 MC+dZ5VGLNwq2oT0QTuOTjXaCcdkmlMyVwbYKJJXnthABpBgHELHApsuZJ77FmN6dnMt7ncIAC4
 3ve+3lxgQaDe3Y35dVV3XKeJgWDuEmMZlh2+tiIttjGc6es7pEoTfgwdc6+aiqMJJ9uGpBJzNzd
 6JjkYWe8Cl9Q6i/vVTNTNtu1z9fWXovbOrkZ2kLudoBu0Sjol7yUzN3IOF53/WUaaclwaeftcOP
 /LSrM6rlRbnt/Fr5TgA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-10_07,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 adultscore=0 phishscore=0 priorityscore=1501
 bulkscore=0 clxscore=1015 impostorscore=0 malwarescore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611100089

On Mon,  9 Nov 2026 09:12:08 +0000
Cristian Marussi <cristian.marussi@arm.com> wrote:

> Add support to allow SCMI driver users to subscribe/unsubscribe to specific
> Telemetry  abstract (non protocol) events.

Bonus space before abstract.

> 
> This enables SCMI drivers to subscribe to available events by registering
> an eventfd context that the core SCMI stack will use as a signalling
> mechanisms. Still no real subscribable events introduced at this point.

Adding a fake event isn't that helpful. Just combine with the next patch.





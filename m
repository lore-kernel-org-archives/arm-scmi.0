Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794519855;
	b=OtLmMtc1oW6rXBZG9g6cpqGIb17tyL6Xh6ul2MuNHfzq2aMaSXeoEBcvEs3NRXloIn7k
	 rOuaoWLs9OTNlRgNRqqWhpWMxxH1y6ionZquJgMQQx6CWlja+t1QCrwd3588JGPKmFtx0
	 tUzOlFQDe86P/1pf8erparVjZ0cUz5jQi1+MHPdrF72aADJ31GwUJjoTxqT1Z7iT1JikP
	 4IYxsSn7iD8quOXYCFkFNG/YkWQWfC9EXEMsQMGPHdYl/7VjbG/mOd4Qltk08Lpk6dAHV
	 ecUDR3wjS45y5yBbRvEi8iN/5CD/UYiif3BJL5qQBZEvZz93uILibIu0PshCYXCJyog==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794519855;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:In-Reply-To:References:Organization:X-Mailer:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:
	 X-Authority-Analysis:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=ZeMxHXnCBkE76aNWIiCzfKnISExLlSlffb4po3vqmdI=;
	b=UVWPM/S9X3s21G9MCkcC14QV/UbKqN0RbKyHiu7zmPb8YNAPBYTT/zbnfWZemSnhAUrR
	 PVe9UOK0Cx4NO78/nNanuGvaO7Gq4RvCD651/W7yQCS53jNn/KwIL9UHj7ZvIyocmu75n
	 guwFxTrlylhImfjFy0VT0Rk5j+TpP14qgOBgYg1+6exI7W5v7oMYbTcmR3idmH7XQKsg3
	 8LM+yMXFz5iwE81/wSc2NPKqlH9reP04mi6OfG5HJFR6MR+VIeDXS9Uqs8G5JHT9QGiWL
	 yfYWKpQMDFEJ1lMSK17dEecGmELPxLBGqcGMDg04uRYgSZU7s0VNOgO1UdF329CnjNw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=SWGQudK9;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ZAgLUXUv;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C7B9606A323
	for <arm-scmi@vger.kernel.org>; Thu, 12 Nov 2026 21:44:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3C7B9606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=SWGQudK9;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ZAgLUXUv
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ACJZjFd3120870
	for <arm-scmi@vger.kernel.org>; Thu, 12 Nov 2026 21:44:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ZeMxHXnCBkE76aNWIiCzfKnISExLlSlffb4po3vqmdI=; b=SWGQudK9aYrpfeUe
	qRTs6vz+IblA+g6HLzEh+HNTp1JWnELbXeYXlgSZ4D2fPe+3AlgY0nfJCmojVecr
	C+1aHyfw3yXogZgwWvUmpNvISQm8rSXicGpc0601ymsG3vVC0nnNzwu95tt4+vCs
	Bcbxjn6HZZ1X+cJSRElTcFVnvSQtwtYku8TUD74ZDphUWF3awQLaBdGsgW4AyT6G
	W7qzXHipUPiDrXYSvquV31srFzv4S58RZ78Y7ViWJZJBenOG9EhrEswCtIA4dsCW
	+blKhYiBYZZmgIcAWEdkgIczvQxR8YKz9apSBUid1wHdMvLOpVaKFGoUNnLABD8m
	RzxBcw==
Received: from mail-dl1-f72.google.com (mail-dl1-f72.google.com [74.125.82.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hwbx32cnt-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <arm-scmi@vger.kernel.org>; Thu, 12 Nov 2026 21:44:13 +0000 (GMT)
Received: by mail-dl1-f72.google.com with SMTP id a92af1059eb24-154e9d2d94fso574735c88.0
        for <arm-scmi@vger.kernel.org>; Thu, 12 Nov 2026 13:44:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794519853; x=1795124653; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:organization
         :references:in-reply-to:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=ZeMxHXnCBkE76aNWIiCzfKnISExLlSlffb4po3vqmdI=;
        b=ZAgLUXUvXHLfJwIUZC1/C8MgADJ8bUzvPkeTGkQgmRFBESKj86Eb+up/j8RDo/aGan
         hWTCNA5UNItE1z0awL2jdVixZNnuUSNZRDnNRbXuVs0fC6SN9vXM5H0w/rEL9QBXDvoF
         e931G5J8EiW0fEmBtyEODT5lweQLwCQ7+MU6X/Pzy49lGpPBuLRjVYwd3eT62NXEti6/
         M00s6UBc/B1F7oA5F5BBIuVnX8WQf3e+hkDxCdyDfEc7/GiZ0rYaHjUa8gelPpkVbJ5b
         JVkvvkOQNh7yi7xMfsKwWCBynT+7hj8XNgL9vRPLfPeRBIp8To0AFs9lnAoDpw1q5d7J
         lEaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794519853; x=1795124653;
        h=content-transfer-encoding:content-type:mime-version:organization
         :references:in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZeMxHXnCBkE76aNWIiCzfKnISExLlSlffb4po3vqmdI=;
        b=f+36MgAZiNbevIlN/sZ48HC2L5Iqr4tvAjQsrrVuJUx8JBP1BbzGDh+0DJUfM7qz1D
         QgdLePFfw0t+kglVTwW9kuQLlYgjCFW5PflJ2VUyoNQm8S3Daafk51PqOduUw9bZDqQ3
         PPg+S/LP6w5anGIl3CeJhGKNE1aKNP8c58/OLaPJI78LKzyeP46OvFX0qbNAEVqCCzpj
         gyNI9xmNWnMOqg2uVM4ptLrYJIpEwe6tDuICz/vkOGLxR8GPoMFDlpit1s8ckDlx3CNq
         DAdl8zrYzK05rg9h4Iwjgu2xSSNefvaiak/KdHqN3y7cpk1k6pHKg18N+ds96KagVwWM
         uoeg==
X-Forwarded-Encrypted: i=1; AL+hErEhc9D52wasTJOqyKVQc8rAt70jv1RL0gHTnHZ/r1ZAh0oEGzhazrGeY/HPSl34Avsw5g1yhe3ecQ==@vger.kernel.org
X-Gm-Message-State: APuU4Z9g/20I0iCBPTrBSdcrR3trdGhPReAy5J6XFrzFJZCVvyzudhRK
	mlkW0rXRBtYLz+Fs4gWFdVZxEai81kVYO4xDD0kJCHGi9YjhfWIdL24g3mJumep27x+PiuyKlNQ
	LRH3bMZS7XJ42b0OtdQTKn4xgKHRpONX+yZllshYQtajF/M6+4LizZLpbBTFCZA==
X-Gm-Gg: AYBFou0rSF6acYinoUCfJgNPn/SuorDocMkZbsGeHvXhbqmZngcp/lfCh3m9PT9t8Wh
	/T1cxyFxuAqYQL9NyyC5+EtsGAsKGV/o5vSO7Fkqrco3tywtX8YJuEA0jf5kL0p10etIAIrj5k9
	uTkishf8QMVCQZ1WecICxNeK7hO1n3O903r9c+PGpIHDlDohKrQ6wySOKxF/af8vN6FTHiqdNRg
	9TPttZbxTaESD6Yocn9ZYawOCwuBsjsR7i38eD0zkih2fjZFYKJggBqjuRnXLWUeZQA4c6TqBaL
	06yvIr3dqySDjSpzjNo2zpD+PJIdhqHVuYSntfiDHPj8MlPJfq0D/G2A+tbxhezMr1MP6Rc+SvU
	fNtTIQKghcJnfeY7Z0o43Tb9AQv7YBZ5sgZ/sOxAaTVyqCyliRdamIRhvW5LEmpTrD7lMcU6pAD
	r1PewyjI4HzOuqJxLsb1I9xZo8IzY=
X-Received: by 2002:a05:701b:450d:20b0:181:ccdd:ed2a with SMTP id a92af1059eb24-1b50315f88bmr668910c88.43.1794519853014;
        Thu, 12 Nov 2026 13:44:13 -0800 (PST)
X-Received: by 2002:a05:701b:450d:20b0:181:ccdd:ed2a with SMTP id a92af1059eb24-1b50315f88bmr668878c88.43.1794519852364;
        Thu, 12 Nov 2026 13:44:12 -0800 (PST)
Received: from localhost (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b50319e381sm1541771c88.12.2026.11.12.13.44.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 13:44:12 -0800 (PST)
Date: Thu, 12 Nov 2026 13:44:07 -0800
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
Subject: Re: [PATCH v15 23/35] firmware: arm_scmi: Add Telemetry generation
 counter event
Message-ID: <20261112134407.0000457f@oss.qualcomm.com>
In-Reply-To: <avYe37QP4Upvp51c@pluto>
References: <20261109091221.2532706-1-cristian.marussi@arm.com>
	<20261109091221.2532706-24-cristian.marussi@arm.com>
	<20261110144635.00005964@oss.qualcomm.com>
	<avYe37QP4Upvp51c@pluto>
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
X-Authority-Analysis: v=2.4 cv=S+5MU4sP c=1 sm=1 tr=0 ts=6af6332d cx=c_pps
 a=bS7HVuBVfinNPG3f6cIo3Q==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=7CQSdrXTAAAA:8 a=reF3IxvR5ta2O57t2W8A:9 a=CjuIK1q_8ugA:10
 a=vBUdepa8ALXHeOFLBtFW:22 a=a-qgeE7W1pNrGK8U0ZQC:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEyMDA4NiBTYWx0ZWRfX/xgwFxH22tLO
 mAUKCay8ILZlKn/2AYTMnuSzUoDigpyTW9ylmLZ2HzBN/xSr2bElwv7grUEsbjTOx8die0ybblE
 6DhZobqJywvgc2JKEQPy0ErtIhr9zDNodwemHwCeF9ie6m7gSUAB7xPN2OJcEuPF8ZYPLU9J+8j
 JzLKglb0yNFFZbFugf835ZV+YdmGkHRPF/nH81aC4nyqERyWUzaOrZMI5z0HqgG/+j2t7xCNGEg
 5MVyPyM+tCg+/tJjYLbSMPVLALIh6Tu1IOZOlfY78X6xCtgQZ/RIDmFI47O0BrPU8qQrCKojDVq
 je3R6+Kdn41j00+Npe3IDL7eJDU7SpcwFhJjVbXAywV2Z4eEk4J4jweZpgHnJzfcO436R1O8DQF
 0Eq8Q3f2y0wV9NoIc3MczWc2zq9E1Ti2PTWqyjaWUwjqpbw4JMG1drLWAy2XJG6Vk3xKgVeKjA5
 FZ7xmu4NFJOY0yqXHJA==
X-Proofpoint-ORIG-GUID: A3zsxMb0PyjyIU1bYv_E7MyJQm3OF7di
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEyMDA4NiBTYWx0ZWRfX7VNOlDWbKSqR
 ec/nuEMikz770Oayzj287Ino99o1X9VSQrY7/DW5o6w5zvdmypuXNGlRqXEjcpaC4Z2gYcEBm/d
 060KWcaVOVVi4RGrIPoyP+mn0IK1DDg=
X-Proofpoint-GUID: A3zsxMb0PyjyIU1bYv_E7MyJQm3OF7di
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-12_03,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 clxscore=1015 phishscore=0 malwarescore=0
 adultscore=0 spamscore=0 suspectscore=0 impostorscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611120086

On Thu, 12 Nov 2026 20:17:35 +0000
Cristian Marussi <cristian.marussi@arm.com> wrote:

> On Tue, Nov 10, 2026 at 02:46:35PM -0800, Jonathan Cameron wrote:
> > On Mon,  9 Nov 2026 09:12:09 +0000
> > Cristian Marussi <cristian.marussi@arm.com> wrote:
> >   
> > > Add a per-instance generation counter to track configuration changes which
> > > uses the common telemetry events framework.  
> > Why?  What's the usecase for this?
> > Needs some more information or I'd leave it for now.
> >   
> 
> SCMI Telemetry is specified and designed FW/Kernel side to allow for
> multiple readers and multiple writers issuing configuration changes:
> give that there is NO HW/FW/SPEC limitation in allowing such concurrency
> (unlike e.g. for a serial or an RTC) the telemetry driver does NOT
> enfroce any kind of exclusive access...last one wins when multiple
> acctors tries to configure overlapping stuff...none of kernel problem
> userspace should co-ordinate...and I suspect most of the time having
> multiple apps trying to concurrently issue conflicting Telemetry request
> would be a matter of wrong platform configuration/setup (similarly to
> what would happen by running together all the lovely varied network
> configiratio solution on a Linux box...)
> 
> As said the Kernel SHOULD NOT care, going back to the networking example
> Kernel indeed does NOT active policy netlink access..you are free to shot
> into your foot...
> 
> Anyway, co-ordinating access to the Telemetry resources in userspace can
> be a pain, so the the generation counter is an optional mechanism to be
> alerted when some of the Telemetry has been changed, so that userspace
> can spot that something odd is happening (if it was unexpected) and
> avoid to sample and analyze bogus data...
> 
> The generic event support upon which this is based, it is meant to
> support future events like relaying notifications to userspace...but
> given that notifs were NOT implemented for real, it is not present (NOR
> the related ABI...)
> 
Ok. That explanation makes sense.  Given it effects how userspace will
be written against this stack (maybe assuming folk don't just bind a single
daemon process to it) it does have to be there fairly early. Maybe
a follow up to the initial set like the stuff for already events.

Anyhow, add this info to the patch description!

Jonathan

> Thanks,
> Cristian


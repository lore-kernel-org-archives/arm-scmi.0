Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22C85569F1C
	for <arm-scmi@vger.kernel.org>; Wed, 14 Oct 2026 18:50:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792003832; cv=none; b=mOVHGqXIvBGu29LAS5RA+beq+Ifm309GqewfbO8hfQS7fDtwX9LCn5NW6JNLT88GuyY/Mpxk81JePWkloisWtbjraiRCAhGh+kjuzFcb+eEQ3K7Bc4ihR6eXZTHIFe/XkbUbW0l8QZjcMEJPA+WHM21A3YpS1nzkl26PZKdbMuo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792003832; c=relaxed/simple;
	bh=7ah7jUqQtUDrn4PSNymda/Iqm5p7zMRB4PxJ+OtxpWs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=LfXkZtqQWmtbbeLSH5e/TwF1ENGoRtQ003mpv5Gt/v34lrdKjMOieHT6znIt7IWbPSLTMucODRClvzFkiMze2MsMhASUxwISmgrkysjBgLbDsgn0GMgWbspfmPYd8ILWo9JpBCxtjZGGNjqgGowZpwy5nYLhebRPI+UZQ/R2GOc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hLw7FgaY; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=CDlyxjpb; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hLw7FgaY";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="CDlyxjpb"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69EEbJ9p3642838
	for <arm-scmi@vger.kernel.org>; Wed, 14 Oct 2026 18:50:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	QmKAgT+BMROb7bsj9FpwRJzAdtcudV6UZcveycRYTO8=; b=hLw7FgaYpyNo6zxN
	l8UvMhOCymTJmyoS3bWMjr5HzJVHGUDmM15PoeZw62rTAv7lAWVn+4w/Hn5g1+4X
	/m3XN9322dQYzH9LtDo5PYG58tsWg3pKe4CtmZEZalzj1aiYPrgalBB9KeuhcMVa
	BjmDS62vTj3Cuh3fTXBp0SJqfQjY8d1DAXX/AKNu1k1YrIaTOed3GbTA2OUWXI0b
	5Q0OHU11f0kfDr+XCUAoOHBPuYcu2vtzh4LNNBYJz1WtBvllA9e5EVxr1BQsDWjP
	ON1rFDnOcHjgSE319n24TVY1oL3h6wsAC8z3P7FyoemA7Qxus3vGzHqRDohxXyc1
	mVfA8g==
Received: from mail-dl1-f70.google.com (mail-dl1-f70.google.com [74.125.82.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ha470b29n-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <arm-scmi@vger.kernel.org>; Wed, 14 Oct 2026 18:50:26 +0000 (GMT)
Received: by mail-dl1-f70.google.com with SMTP id a92af1059eb24-17dc865c94cso707714c88.1
        for <arm-scmi@vger.kernel.org>; Wed, 14 Oct 2026 11:50:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792003826; x=1792608626; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QmKAgT+BMROb7bsj9FpwRJzAdtcudV6UZcveycRYTO8=;
        b=CDlyxjpbo4zfV8DHanOTSiS05l5uhhmSw4x4HmEeO6jd7EnFjH6mgXE2HrctTZPbN/
         e8SsLNqVy5gBLbCh8DDpE2cV2mKYOfynhO9ia0RmoigQIVmBmzTeXl8VlHSrOUaL/Q8D
         +8A4zRPmQG8Pf4ld8OM53/7MlXZVp+4xyVDCOkP/KUtUGwneUTlao2Wmmhu3bIrqzHhj
         f0jsb3cOXldJbgracQEGeGqDTjoNaSXmIOoDu+vUVW2RsRVxtIMUL56l7CQkOdYBQx5R
         RMrNGxQh3iwFWy4o10BdUzuBQZ9l3OUV5h55liOhAjqM+6YQQ3WWyGTd9p35OQbEWn09
         werg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792003826; x=1792608626;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=QmKAgT+BMROb7bsj9FpwRJzAdtcudV6UZcveycRYTO8=;
        b=K1A+qhozGinsITm9AGtlBpxCKfS+jUJE0+gikGuIzg3ako26jO7k6OX0PJNrrnf8VS
         PuY8TQktAKiHznDvWb9jtiiFELIjqWHvSw0KG3T1OTflQHcLvNVfBAiwCLwZCPxapFAn
         TT/x5JwlSG+1WAirKGJa2ocSKif/RFmfLz0CiNtO84XpEEN3RUW5kf0tQ6ah9l47p2J+
         cLxPhNU57jQ2pM7W3dMr+a3GuzUWdwYoA7wH2GULJKjXU4wGl6PIxgcGrviQ2sbZCR9e
         6l863xaGPtMKMpYKATeHGf/QO6Ti1cgMHR6TMM9YL3afFJSLqetTbiENRhFtgrFYhw/f
         7Sjg==
X-Forwarded-Encrypted: i=1; AKwUvBw1r9qeW/poY7Ii+4jGN/tTOL2nIsrB5bWVFaKZiaVosXLaWOPL6StIARlMUNrb8XI6c8suaJwLRg==@vger.kernel.org
X-Gm-Message-State: AFq9FYKmGxNME3lRufb2A9zU5dDNcLO2ixCbCYaEyJoXU7qQfDUUWEDi
	HLKQR0wf4mbFT/9x6t+05B+NVkDIGyUfMZm6/Vu4kQ8wQ8eatCAO8hG27sbeO//VGuWbuhOo30g
	/5IG42Yw6+Ycq9PTeYzrX8ybTHSexLFEUWlN84HU5/el0PNh443rXIjH0AItAxg==
X-Gm-Gg: AYBFou0DXgm1uXHs3lfZp8HOLudZ+BFdZtBs4PybHbv3k8+iRGrWnAk39oAMCflJoxR
	YRlygsl0YBTrQhow/OndxFF41xaOx3Fk1//Di2C29Ifl6UfXaDatdasMEf5ZAlAm1MNevs2HIkA
	n21Q1/aK48ldguSUUA/s6dTiWap9lpyjZFDnfemkF2N7aqba8Wf+8JPxvYhCAZqK2LgW7em2POi
	stxUCRlF65fTfwkRtH8QgKoio/OFoDdqtaaWfsr8s8B3U2gxuKUFYEQPqENP/ci7lXsaSegFSzR
	8drUHGRDFVd3do3c2DLAyf77UTfHCrkoSpLxRk3WWK4Qx3bYrEH1szp+ozSees+CYFqKrvYWwpZ
	inXyXEpcPfD77pCs/0u8UioBNq6aOWENL
X-Received: by 2002:a05:7022:1582:b0:143:298e:913d with SMTP id a92af1059eb24-16a63b2edc7mr32561298c88.47.1792003825566;
        Wed, 14 Oct 2026 11:50:25 -0700 (PDT)
X-Received: by 2002:a05:7022:1582:b0:143:298e:913d with SMTP id a92af1059eb24-16a63b2edc7mr32561225c88.47.1792003824748;
        Wed, 14 Oct 2026 11:50:24 -0700 (PDT)
Received: from [192.168.1.2] ([106.222.235.49])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-169a442956asm62519780c88.16.2026.10.14.11.50.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 14 Oct 2026 11:50:23 -0700 (PDT)
Message-ID: <16d94994-ff80-405c-ad98-ccefe4f951d6@oss.qualcomm.com>
Date: Thu, 15 Oct 2026 00:20:14 +0530
Precedence: bulk
X-Mailing-List: arm-scmi@vger.kernel.org
List-Id: <arm-scmi.vger.kernel.org>
List-Subscribe: <mailto:arm-scmi+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:arm-scmi+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 9/9] i2c: qcom-geni: Use geni_se_set_rate() for setting
 source clock frequency
To: Praveen Talari <praveen.talari@oss.qualcomm.com>,
        konrad.dybcio@oss.qualcomm.com, Sudeep Holla <sudeep.holla@kernel.org>,
        Cristian Marussi <cristian.marussi@arm.com>,
        Ulf Hansson <ulfh@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jiri Slaby <jirislaby@kernel.org>, Mark Brown <broonie@kernel.org>,
        Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>,
        Andi Shyti <andi.shyti@kernel.org>
Cc: chandana.chiluveru@oss.qualcomm.com, arm-scmi@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-pm@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-serial@vger.kernel.org, linux-spi@vger.kernel.org,
        linux-i2c@vger.kernel.org
References: <20260827-derive_clk_perf_tbl_from_perf_domain_opp_table-v2-0-091697dbeb02@oss.qualcomm.com>
 <20260827-derive_clk_perf_tbl_from_perf_domain_opp_table-v2-9-091697dbeb02@oss.qualcomm.com>
Content-Language: en-US
From: Mukesh Savaliya <mukesh.savaliya@oss.qualcomm.com>
In-Reply-To: <20260827-derive_clk_perf_tbl_from_perf_domain_opp_table-v2-9-091697dbeb02@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE0MDA3NSBTYWx0ZWRfX5nLSrT3myYv/
 ss3MF4c+ph9x+16PxjwfwU5adg7DPGttPVw1vEK3RLZS+/2PtbHPHg2JktKHzizHg0vWXPQKdi9
 56j5gH/Jb/Rr4hehSb7SUpwAhBXK1Hw0BXmQ9Ak0LL4xAfmb5L7h6NI947D5/s7HjCLAL1nDL31
 HL2+G8ugkz8EDVdFFcB7ZmvyGTn2u6+qgy0TctAcealKp3Q8wshULg7FveqnkwpxfCuXq6QsrGK
 xy70eER2uL8BUank7TzAL6pHALZYAAwZr8ratEpdpttUfq0XtrDTaJmWbUfOhtDOj/rcOfZ5A8m
 Zi8q5L9kh7wydlieoXLjwoNaVbbtr+7zA4BESi1e/eJ3Nj7rBGEzZTgD6CeRuPQlRb+NzJZvO2n
 26jlqlw+3GMrPY56jnByczki4aZeMoFo14VrBWun4lL2HcHQvdH/70JVdBYvYtMldOrx7Gq7hUO
 iIowJUbMg5kXrhvULJw==
X-Proofpoint-GUID: SxmwbpBKlCjy1-b04LLxaiNgKLMkw1uY
X-Authority-Analysis: v=2.4 cv=P6avFSAu c=1 sm=1 tr=0 ts=6acfcef2 cx=c_pps
 a=SvEPeNj+VMjHSW//kvnxuw==:117 a=N5Y/PXOiYxOVLBGg3HvMCg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=UheTk5Niw0niUJ_rJrEA:9 a=QEXdDO2ut3YA:10
 a=Kq8ClHjjuc5pcCNDwlU0:22
X-Proofpoint-ORIG-GUID: SxmwbpBKlCjy1-b04LLxaiNgKLMkw1uY
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE0MDA3NSBTYWx0ZWRfX94VE12Y78xcD
 zimT77xGRQb8Z+ftI9XfMaMqpG8kptwx+l2ClixCRarJtUGQ4yJ/+VafSSD80TlIU8ToP25w5H6
 7BR8obh5qmkIOVDu0kwmAxlryMgFe1c=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 lowpriorityscore=0 priorityscore=1501 adultscore=0
 suspectscore=0 clxscore=1015 impostorscore=0 malwarescore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610140075



On 8/27/2026 11:29 PM, Praveen Talari wrote:
> GENI resource management may be handled either through the Linux clock
> framework or a firmware-managed performance domain. Source clock
> programming currently depends on platform-specific callbacks.
> 
> Use geni_se_set_rate() for source clock programming and perform the
> source clock configuration from qcom_geni_i2c_conf(), allowing the GENI
> core to abstract the underlying resource-management mechanism from the
> I2C driver. This removes the need for platform-specific rate-setting
> callbacks and enables a common code path across all GENI I2C platforms.
> 
> Signed-off-by: Praveen Talari <praveen.talari@oss.qualcomm.com>
> ---
Reviewed-by: Mukesh Kumar Savaliya <mukesh.savaliya@oss.qualcomm.com>

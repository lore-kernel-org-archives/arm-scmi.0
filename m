Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794351452;
	b=YTTGhFM2U8vJT5mQtaH0HzESSv4beW3waJQluA7FgYV3a07XNs75mSFGSxyk77OD3dSL
	 AN9jz9ha46yiQhTebmLIGLjxIHgQyfBFnjdv9FpFy1WkSDNt2Ve3SwE7pzAw7ApRPOp0l
	 A1BVEpu8bf+lEvOfximmofcxM9hW7RbBzRxvgkIt/wGfF3dM9ST05KzO6QJID0BgXOaZX
	 FfiaUjO2s+fd1V7UuiNhJE3r977/PD57A9ddADEovz0fLqSXIURWTwTxniQxTrBHxTz/x
	 fopUmtynjMI4KLqBdYXXCPx0HvBjcYe7R5ZqVlKiWJS2AKGDulCc0j2+RrzuKmsKBzg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794351452;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:In-Reply-To:References:Organization:X-Mailer:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:
	 X-Authority-Analysis:X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=delInrFccnRDmpD2O0gZtftiyVmvNs6sg+QiUy5od1A=;
	b=lJjIXqooVHjJn9dpLK54crZeZeZD3AXeBiadXgYx6/iLcHOdKip3DeE9hCd095S5AZC0
	 Tww6IimGXZKCY/jnUi1b3Pn6gxHMZ7CXCq0sgcrcXsruJ2+IxKwE8fFDU8YIObrz7gErR
	 Kns7RFb4c/VxZ1sQzxL5OacPFixUPitNgs7wlapH9yIzzQ2wIA7lFnyp7dp7vPnrnPaJS
	 blpIxfE8AGwroPxBwcNMvUTFmr641h+iIR/6ByBCxOvB4dI7NRVJ9YnflR8MDgZ+H5Kff
	 ZKx+yupFqAh4oVFu3TY55Celaeed9ECHTo71UNXJfFP0q4uDrit737ALqtYyaNCB+mA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Js6AusJU;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ISXlkT0g;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7FCF606A321
	for <arm-scmi@vger.kernel.org>; Tue, 10 Nov 2026 22:57:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B7FCF606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Js6AusJU;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ISXlkT0g
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AAML1mN1116998
	for <arm-scmi@vger.kernel.org>; Tue, 10 Nov 2026 22:57:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	delInrFccnRDmpD2O0gZtftiyVmvNs6sg+QiUy5od1A=; b=Js6AusJU1aJqM0Sm
	v85gNtaAorFofzWUIJj7Ha322GvPgEpTIeZVy1T9q4VzD4/LSFGttG0M6DoaGvk6
	0ZHvrN1ExCGzKerskWkckIa2bJKrCw/J57iuco6mbbfZS2DR4xwSQmUJNQwy6ASM
	5dsPklECATLC56/EJd6s2hg+aa7V7DKHOurFeqoV0m3SPrK2H9z6iz0Nu8+7ZyT2
	Co/GBipnC5PRTxKG3gonvMdijBtHI3BZOpJ1K4C5qYn694totCReBFyZ4xZ6Trn1
	EHnvY3KqFjffoFFWFc2vv490UPCKr42SksVLKistVAAVMyMZHmShPQLJt+RQc4cf
	Si6RnQ==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hv4pva4kv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <arm-scmi@vger.kernel.org>; Tue, 10 Nov 2026 22:57:30 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-36f479b9819so4536140eec.1
        for <arm-scmi@vger.kernel.org>; Tue, 10 Nov 2026 14:57:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794351450; x=1794956250; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:organization
         :references:in-reply-to:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=delInrFccnRDmpD2O0gZtftiyVmvNs6sg+QiUy5od1A=;
        b=ISXlkT0gdxS2LCoEVKNhs2+2BW0QEC6izaSBA9U9+id3U0YbvEauQtYDggoYEpbvDR
         gISrPnbIFNsVsmCd2leoL6Ff8J4SbE7NoRdmlHuwAoUBkxtn+8eN8QXRBWY+FX1WHxss
         4xcD1YafpDWonBqlm7qe9zRIa9opzo0ElI+EEzn9gR5lliT8wpbCgv/kBPpHwl5lAJ/F
         eBMQw33JrCYfJX2D2RDSoEV+rlt5T3LsIwsPdNZySXSbK75OQP2qY9rcbnsovSdCrvuo
         MNSRm1T9o3iUHDQVX2wI/qJY8D8ZBu2J5KGalUW18FJmLvrhcW4UUafnhhePV6sUTQmZ
         Gohw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794351450; x=1794956250;
        h=content-transfer-encoding:content-type:mime-version:organization
         :references:in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=delInrFccnRDmpD2O0gZtftiyVmvNs6sg+QiUy5od1A=;
        b=l1s3MPp+jejYHEpTy6E81XqZbhInkN+NCkqWVTkFHbg0JmrSJZ2pS7UcuMGCUGbQ+q
         H/Ykf/jdZ+0Ewu9/z5CvR967Md1JMiuK3OlR+Y3Tz7pcoWOYSsv4xPSmRXbdVB2XnElO
         sOaYrg2vtvUkvBz4Tg3oPF/tG8Jz09HG7vXPkKAX02I0FKOjBzIgBwQrKEAJrirDK4r5
         6eOjVUjlOe3ogL2+kDMjDAYh+W95HW6mvZBqcPHmrMrd6Wpn4Pz45sfeOd2qs/IZcw0Q
         R5RWV7gLIGt+BTqlQCq6EZyNnJObsDvXnbzngHsgJbPmY8nJo2mDutQWcUVrhR5AU7nI
         rngA==
X-Forwarded-Encrypted: i=1; AL+hErExtCXr2EOIWEuj+E6RuP/YJT4mKUT4GUXhaCEimwuwxzb519LID+8bJz6xGjl6ALD/lTNtcrrEVA==@vger.kernel.org
X-Gm-Message-State: APuU4Z9/MWn9MwFs2ZzhSdHA6Ba7gJC0wX2aN9wuqWJ0IFBSAlrv+40e
	TnGWgSjs1FjoUFqhgq0qIOh38e/STg9Da6Tzwh3xrdSa6n7U0otkMnjdD6IghVJbXKGai8k8OIl
	/sCMe1KwD790OAeXnFsTnWMbdaO7nxuEGWItiSFEX5oue2x1KFoVt/ZraOCHfQQ==
X-Gm-Gg: AYBFou1uNHRuH4hsnG85XrL7H1p66Jiuo8O9EwiiV6PC22OXE7wNLiYfzIZOH2M5NNx
	WqkHDB2XCaqLt47Y7d4PbShR06B16GFVqcUujx4blJfkBvOgnvX89gB50dZVZlIBPlfkQTFL3jr
	tniTXFnSpvn3Vp+yG4PMj8bFb0lZFlFqKzX58UkjlTRfikBVj1jozFePEKExT2TBzVds+FBOj8D
	xFgqeGjxjvGxgaJAQfmhiuYFTFxTAcbiCSO/zBb+6fCTbRrjSuNV2sjcXLi5GGuad7OJDcnImS3
	kp0i9ZnGMo7L5HhS9nKaavLSrUEvjgfnJGqaL35rJr51QFUuU5F9CvsoY26GAC6KoJtqbxH/XTR
	/a47f0YH5dFFeF5pEVVAPmC4fNlAQ9/bvegAEuEVrWPLQabxQqSdRPhWbTZEhclK/iwtiPK7ULB
	wNJFAMyO6KI5xxT1TWevAt6RF7ckI=
X-Received: by 2002:a05:693c:66d3:20b0:35e:f1a5:9ba6 with SMTP id 5a478bee46e88-37683188881mr1061657eec.5.1794351449592;
        Tue, 10 Nov 2026 14:57:29 -0800 (PST)
X-Received: by 2002:a05:693c:66d3:20b0:35e:f1a5:9ba6 with SMTP id 5a478bee46e88-37683188881mr1061633eec.5.1794351449088;
        Tue, 10 Nov 2026 14:57:29 -0800 (PST)
Received: from localhost (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3752060dc0csm11561398eec.14.2026.11.10.14.57.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 14:57:28 -0800 (PST)
Date: Tue, 10 Nov 2026 14:57:11 -0800
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
Subject: Re: [PATCH v15 27/35] firmware: arm_scmi: Expose per-instance
 identifier
Message-ID: <20261110145711.00002217@oss.qualcomm.com>
In-Reply-To: <20261109091221.2532706-28-cristian.marussi@arm.com>
References: <20261109091221.2532706-1-cristian.marussi@arm.com>
	<20261109091221.2532706-28-cristian.marussi@arm.com>
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
X-Authority-Analysis: v=2.4 cv=XqZvqlF9 c=1 sm=1 tr=0 ts=6af3a15a cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=7CQSdrXTAAAA:8 a=EUspDBNiAAAA:8 a=P0Bfr-jsjiM-HyT3fQwA:9 a=CjuIK1q_8ugA:10
 a=6Ab_bkdmUrQuMsNx7PHu:22 a=a-qgeE7W1pNrGK8U0ZQC:22
X-Proofpoint-ORIG-GUID: -J4qyosZ3ZNFHmqwKp0u1hADgKdPd80X
X-Proofpoint-GUID: -J4qyosZ3ZNFHmqwKp0u1hADgKdPd80X
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEwMDA5MSBTYWx0ZWRfX+iM3NFRMnPFC
 5xqboEx375zhDX44gWGFvqLJTYFF2jr9O/1dAbvXVvlDKA7xSgWoar2DltPq+8ozIPRKt7Xav6c
 GBfY21g65WzYJC8685ru+ot7btRcMNQ=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEwMDA5MSBTYWx0ZWRfXwbLJsNkwcHWs
 MiWvah05UUh/zTIW57EW/jsroNOBO0gOLuJhb72ZlL/aqsCj3BuPs+Vw+bJDLFfjSAo1kDUSGez
 jI6EbN/qH0WcWs5znyBKXZpmocWYF9Pbj8qrajgQe9V5UZrDqnnIJxIdKH7V5eVxCXgyOexrR92
 Noc6EHJvZX7B+BcplXb1n9eXzj5GoclV/oDjyXdcdk5bgQyx+Q+LaKHgobdZA/FSuFPWUZMzthN
 WhZc7y5dkQdRnIwNYXWewbJIQZWdcm2xRlCfvyxVacN330Fm+2ZyPJ3IXGuE8p4pRxW6tng0+vb
 qTA1wWAYf1C8x/OPWl288CsM1e2a/d8HQ/5Smf0+xTw2XhZcXtvANed6dyIGWgYXDgbt6Bb8lZG
 XY0j8W3D/bbK+MJkIMNcOD8/x/GevGDvNuG2PfvkhLMxoxRTG0b81DfTnemvyi+ct0JrTVkbl5H
 lPevhjyD19zlEn4JxqA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-10_07,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 clxscore=1015 priorityscore=1501
 malwarescore=0 bulkscore=0 lowpriorityscore=0 adultscore=0 spamscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611100091

On Mon,  9 Nov 2026 09:12:13 +0000
Cristian Marussi <cristian.marussi@arm.com> wrote:

> When multiple SCMI instances are configured, the SCMI stack probes and
> it is initialized multiple times: one core stack for each defined instance.
> 
> Each istance is simply identified internally with a number and such number
> is already exposed to the user to name the root of the per-instance debugfs
> subtree, if enabled.
> 
> Expose such unique identifier to the SCMI drivers so that they can use
> that same identifier when in need to name their per-instance resources.
> 
> Signed-off-by: Cristian Marussi <cristian.marussi@arm.com>
Reviewed-by: Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>

Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794275645;
	b=Uw7bD1wYPkhf79WQa1fsmtUBf7uj1gGiRBXh8WyCXVwz+7LndwJz1W5iVD9tx/pBQBWW
	 RS23qE0Elifb2YEL1aRnXSk1jo+weDeGeBrclqftUwdnXfqHEGsbguqqlsbQOeHQp2DrW
	 WICPTaQuYKvX9AtR0zenrQBZQfSWZnv7mCZNaTHAMEmectJeCKYBXa7DNGs4ntPECVw8H
	 rG4pkckTQx3KWw4KaQttQHPeFGD1wckCaDLFvC64GytwnXB2Wj33rNP/HcPQ8O6mewcm5
	 JZ3ha2HskHEYGBfpY3LoypAEZ+Z5gFB44+3w3vZr658LPT0Qsv/rS7HBLgu+xD8LLuA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794275645;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:In-Reply-To:References:Organization:X-Mailer:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=vNUYRJyOqyBXuBM9afubrzQAAxPsq0B7mcCz3ADXaiA=;
	b=kR0M4qejki/rYUYrD3ZsxVn1ML9eF17zMnoOnfXaRSA5JwzWwiiNd9gaGvCaUD6/LqlE
	 P/hx3GBTeWO8vKgSWMXAJeLpHoZ3pqg5shbQMJ0NWan21VjW3Y/HAmZtEQ1lpXpJa6HP3
	 oSW2EweKzoWPvA/Ck4RjeNeFhZY/pUK3MJ+n5gAWvvPq/kVqgbho8OVyAz4L3AmBqn0Tw
	 BCn+Tea2MJegKlYMmSpwCJx75jpkyBReulMnALDCrfWw8q6NRsMG8GvRmj09C5FSNDX/M
	 xpMq8lk1Uqe5NqtxrfW0mIM7tgs2/4uuCHTYPO85sYae9htwI44NS9XLX/QnjaBm4aw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=YbGuCeg+;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Z2siSvUs;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2130E606A32E
	for <arm-scmi@vger.kernel.org>; Tue, 10 Nov 2026 01:54:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2130E606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=YbGuCeg+;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Z2siSvUs
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AA0j98O764421
	for <arm-scmi@vger.kernel.org>; Tue, 10 Nov 2026 01:54:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	vNUYRJyOqyBXuBM9afubrzQAAxPsq0B7mcCz3ADXaiA=; b=YbGuCeg+OL8arg0D
	FQid+FuWjDgFl5JcYyY1kre2UEvasRPLKD22+ZYrNj51VN71fTosyJvCDHzRyPc3
	HD//TPeMyhbJmdlkcSMVsBMYECh7xaGi9cUBgs1sJHH6bx8IctqcQQ7KkfvC//2c
	KM2vUrPstmF97uhm8q1XP5zphDdR88bDTLjlDkzu/afuccdPWIe0YLyXAU/iT9xn
	gF12hCOt/h6KimzcP3mJonCKASNg0MS7Cfor5JWlap7AU1NF5eDbLE2/xOMt1Rht
	WxFxc2kS+6+RWiV7//ykBqhqoS6rMSzTEYkMxQAxTFRUMdkWSblhZ19brlHfUFqs
	w22a+w==
Received: from mail-dl1-f72.google.com (mail-dl1-f72.google.com [74.125.82.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hunwkgucq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <arm-scmi@vger.kernel.org>; Tue, 10 Nov 2026 01:54:03 +0000 (GMT)
Received: by mail-dl1-f72.google.com with SMTP id a92af1059eb24-139b62317d0so417311c88.0
        for <arm-scmi@vger.kernel.org>; Mon, 09 Nov 2026 17:54:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794275643; x=1794880443; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:organization
         :references:in-reply-to:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=vNUYRJyOqyBXuBM9afubrzQAAxPsq0B7mcCz3ADXaiA=;
        b=Z2siSvUsituLbs/AluxyD3nUh0bgD5uW//0VJ7s83+GBDcDvxvrkukW4YY+aqS+vw1
         sgSdHStTdkfdIrHSHdsVp3oEkNNbiohr6/+DlgmvVr3bq4bQDm97ncFWQ6hLLdmRgemZ
         Yoq0SJGH012wGU08QkZ2+gXeQvzqwpPzk4ZqcQvFfR4zv6gKhfE3oKiqAWqpd5nbDsFe
         5X7PcM+1d5C1NGdm18V9Xb6bZt65bN9s99ZHRgRdUBfaGsuZmfvU3ik0soGN96NoS1ZV
         As+7Pw4KzYz5LjLf9txjg4+R44yyjT7nuu6Xm9VH2hg4NeC/cVhVtfhQgKI7ZTGDVGLT
         udgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794275643; x=1794880443;
        h=content-transfer-encoding:content-type:mime-version:organization
         :references:in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vNUYRJyOqyBXuBM9afubrzQAAxPsq0B7mcCz3ADXaiA=;
        b=GwEo/yUNaEZpJvOijMadYC2oO2cLm4MQlPjDLEPV+SFleidOUScM4Ttg7CNy5hzXf4
         Lf9cZF0CBNnZhVDFBv2WSdWTC/Ih4/8d1aRzJR1CUhRp18JZQIClKDoOR69dx+QxcdtX
         yvKhzu+bMuh4Ss2v+9DE0HD/rD73rST7GVxofHBz4xrioPMk/Jb61czTCEmSCak8Bt6J
         wvqRW2hnR2y7J9EDzyKxuku2ZIUjNHTFQ7aP08ih8kgu4qQBsiPdHtayJTIondTdaxm0
         nmoRIRb3wIn+Qsxz83APU8+c8WoBVOnQwyPkyHrGsmMlU7K3wbcI7oiOqeKJUhJoDYKU
         emfA==
X-Forwarded-Encrypted: i=1; AL+hErE1vB5+eCIhZ9pi7K0OBeDKER/zYfIlO7CFTvs2wSfJ/GytBNnj15JaHmUWOByLJMNOpMac//3mIw==@vger.kernel.org
X-Gm-Message-State: APuU4Z8K2PFn1MayAq50h3+/1QOCeFZFaHSTU0a5gdLPkpsOLq/Vu2wW
	UrzfT1qApG5HGnAk6hTAEQ+B19chWHAe1k8fjX/42ufhfstUtIoz1LlgEHyLeWch1HCY8kM8hbJ
	DTHJSfhDY+xZdIK8lHLs7gRb582obw8V0t1ptmA4R/gGYZazwOgkvBMUjLCh7yQ==
X-Gm-Gg: AYBFou2FgldmFinpYKPx0kEgrRI0dPli8prpfFhiG+Bx7xOxRegPDgZU2NcsVZLL/1s
	YCjlqnqs5Pna3r2fC1wq7vvpSF6QWZ9SoexjnRkM9Ziz6JkUt+zpw68dNuleKgOlOerAPqGa5FH
	4f0zee/jChRvFsI6hKgmFNamkzdhOR0H8YyX7Cj49CMlQNsWEBBnjjK2Xb24gyXCmw8mY5O01eW
	H3hKAzSwGWIZtJ5SKHbizqpYeojFOBf/QkQqEPALiRgllOoOLTpwZ74J6j0Nqli5pu3APdU6kJ4
	1TYBNBGOoAR9LBKx366QCD4b6zg29HMiPln+laKTRijWVjp+5votHu3fz0iCGstDhzvcEfhZFK0
	Zv/bZisZun2YEk2GKQCWLsD7AORaXz/UWCIelxHe5aUcyojJOBt7Me3AwXfaBy8Eha8TduaqWw4
	Hzx9g6K1k4hfwVril8egiGJgz5sw==
X-Received: by 2002:a05:7022:2521:b0:195:e4b9:d326 with SMTP id a92af1059eb24-1b3b5fccc3emr2282459c88.12.1794275642831;
        Mon, 09 Nov 2026 17:54:02 -0800 (PST)
X-Received: by 2002:a05:7022:2521:b0:195:e4b9:d326 with SMTP id a92af1059eb24-1b3b5fccc3emr2282413c88.12.1794275642187;
        Mon, 09 Nov 2026 17:54:02 -0800 (PST)
Received: from localhost (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b3b5b11435sm3080274c88.4.2026.11.09.17.54.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 17:54:01 -0800 (PST)
Date: Mon, 9 Nov 2026 17:53:53 -0800
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
Subject: Re: [PATCH v15 11/35] firmware: arm_scmi: Add Telemetry groups
 initialization
Message-ID: <20261109175353.000008c0@oss.qualcomm.com>
In-Reply-To: <20261109091221.2532706-12-cristian.marussi@arm.com>
References: <20261109091221.2532706-1-cristian.marussi@arm.com>
	<20261109091221.2532706-12-cristian.marussi@arm.com>
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
X-Proofpoint-GUID: aAhQx7iy2FY0DtbKMr2GDK__W5ig7by9
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEwMDAwNyBTYWx0ZWRfX617vMQicxR+V
 PpCJPFxpHCMvT/QxVoVSbzhdjXLEUhhELzrsAlA13QgDS/55Wbxvzzj5Ryx6+TWQP1eXBIGh3qn
 QrXZ2iZSnnrap/FLdgugGC4K5F7ccOM=
X-Authority-Analysis: v=2.4 cv=TOrQ2Fla c=1 sm=1 tr=0 ts=6af2793b cx=c_pps
 a=bS7HVuBVfinNPG3f6cIo3Q==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=7CQSdrXTAAAA:8 a=EUspDBNiAAAA:8 a=0-nDijDy15vjLcikf0YA:9 a=CjuIK1q_8ugA:10
 a=vBUdepa8ALXHeOFLBtFW:22 a=a-qgeE7W1pNrGK8U0ZQC:22
X-Proofpoint-ORIG-GUID: aAhQx7iy2FY0DtbKMr2GDK__W5ig7by9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEwMDAwNyBTYWx0ZWRfX8tRkLo2c+7lg
 jvMR5f/yXwe7ys4QfiA+NIXiFXGC50QGB+OrE8yyz2/cwbbiRwvH3Q54uJ9fEDA8oMSJa6At8XZ
 SysPFi2neN+QNRCKNxdegrMtZlgdNMok/D/xdr4XNdIsBKt5VfgCQnOpG4sxsXrChriwXiYUjsE
 WQdJCnGmLOMwtzmdOxh+MyUAXLHXsjdGsVJ+1RcG05/jR7mV49ONiGobPQTHWoHmHm7+n6HnKMA
 fxQt8Haez1W/NJ49JVaZiZy3hCpBCi2L/xgTFIP82dXbf7MzXHZyBKFE9mQt3/lUhjSOSFwRqiE
 6zrIN3s8oN82EBCAFrJQCJo3srMpDh9cDReQpljw/0jdH2744lM6MI9nG+zqktgi+qWv1fnP0Gz
 haRDu9AwrzZrMjzwAg9RO8rZucUml+gLUkn6K1ntUJldgRKBITYkEhUfRU9Et9mIN+jNvQpDdSQ
 8jmMxmpi5VDTrXg8pwA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-10_01,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 bulkscore=0 priorityscore=1501 impostorscore=0
 phishscore=0 clxscore=1015 spamscore=0 malwarescore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611100007

On Mon,  9 Nov 2026 09:11:57 +0000
Cristian Marussi <cristian.marussi@arm.com> wrote:

> Allocate and initialize Telemetry Groups from base DataEvent data.
> 
> Signed-off-by: Cristian Marussi <cristian.marussi@arm.com>
Reviewed-by: Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>


> +static int
> +scmi_telemetry_de_groups_init(struct telemetry_info *ti)

one line maybe?  I guess follow local style.

> +{
> +	struct scmi_telemetry_res_info *rinfo;


> @@ -701,6 +833,9 @@ static void scmi_telemetry_resources_free(struct telemetry_info *ti)
>  	kfree(rinfo->des);
>  	kfree(rinfo->dei_store);
>  
> +	kfree(rinfo->grps);
> +	kfree(rinfo->grps_store);

Same as earlier about reverse order being most consistent way to do
release of stuff.

> +
>  	kfree(rinfo);
>  
>  	dev_dbg(ti->ph->dev, "SCMI Telemetry resources freed for instance\n");
> @@ -722,10 +857,25 @@ static void scmi_telemetry_tdes_cleanup(struct telemetry_info *ti)
>  	xa_destroy(&ti->xa_des);
>  }

> +
>  static void scmi_telemetry_instance_cleanup(void *arg)
>  {
>  	struct telemetry_info *ti = arg;
>  
> +	scmi_telemetry_groups_free(ti->rinfo);
>  	scmi_telemetry_tdes_cleanup(ti);
>  	scmi_telemetry_resources_free(ti);
>  }



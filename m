Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795563991;
	b=SQ7c0+K3ndsB0oomkHIzI3CGUlyS0yQKbcsiDbME7fhQun53OhDWZCs39CivnHO4tnk5
	 KuMkI/7buQ0IG/R3Py/+ThT4hV3ReOHSMjIrG1baOfP7lMEjkDTTlT9+k+UR5iljhzkGy
	 cLi06wIFEF9kMgV2S0BLZ31xEODAG9y1gzQF/VvvFpy2kYAqSGYSMYtOb8eN5hpp+3Mf3
	 wg0LlbdXzsuIzWIMV27WL6whb3DTYRsvzjkbGYTCWcKCgNr/Fr3mJqdtPgkscp07Qvv1f
	 La9EO3N/D6mRBl4nymL37gX0mCAtX12/eVbXmct1lnn/jENHfd+ojRRUwVcoE8hMirQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795563991;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:In-Reply-To:References:Organization:X-Mailer:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:X-Proofpoint-GUID:
	 X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=h9PLOclrJUCEyLmOGP/JKvrxQpzGt+LITgqfp1kq59I=;
	b=qvLWr5MYO9m2c1hZfM0Pi/A7yzWbcPHKGgFn4Eo+LNXw3qGdPmvtH+9i0suPD1LwTU1C
	 erikZr4cpbBXRb5Cq6hvMa0172WrXQ3JI+vGMcZA0zFZvo5/5lKp4Qy6JAxnepoVkEOlq
	 IEEaXLdDCro4nQjqXY/mgRfgoqfCE4bvyaBad+v4/VkqojZdSimf+fcY8HrbJxioUkfAY
	 qinQioWbXoGBl3gInCKyBeixl6AXyxUV9vVjJThEQCzBomjeK5bLNjGINEKkkymeImCHz
	 aY7ZY4qbHP+rQP8ScSJWV/ZK8oB8vCwQq5LbExbK0VKaUK73F2lnaedeyHloIUGLbMA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=CUa2qDGt;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=dMs8C6eq;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A19C1606A323
	for <arm-scmi@vger.kernel.org>; Tue, 24 Nov 2026 23:46:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A19C1606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=CUa2qDGt;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=dMs8C6eq
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AOMabEG2139894
	for <arm-scmi@vger.kernel.org>; Tue, 24 Nov 2026 23:46:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	h9PLOclrJUCEyLmOGP/JKvrxQpzGt+LITgqfp1kq59I=; b=CUa2qDGttwLbSHCe
	3/pC86Ngts4KXgnbkhsDq/KclOuhAVRzaTqbMXG/Vg+On3NjvZqF1nm5/iSTOcm+
	tpP1nId2DuTIHQU4UbYXU4F4YToDCFwCAiTfAxw4r3S8BWbq7x7gxJpMCzan36d/
	v3Nmwt9JgL01GAFGwrpi53seHnHUhefzuDFplx2m8PSUAhWWcjIswqyk1+Bsasti
	W/+b53ygej1z4kJetQ9I/1B77I7q2JnCJKo+uFqRtwzjR1HHlABiLkYkPAMS45J+
	8dRr/QwxDemzJRrsJpMpS6TOhglWR4ggdG2gHR95jFd5toa9OogBGhjQ/LZyG877
	N8z3HA==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j5gns8u2v-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <arm-scmi@vger.kernel.org>; Tue, 24 Nov 2026 23:46:29 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-3854627c1c8so7297574eec.1
        for <arm-scmi@vger.kernel.org>; Tue, 24 Nov 2026 15:46:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795563989; x=1796168789; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:organization
         :references:in-reply-to:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=h9PLOclrJUCEyLmOGP/JKvrxQpzGt+LITgqfp1kq59I=;
        b=dMs8C6eqRPCtEBWcVED492Bexr9FYlS+abGyMDHGZoVtgWNStmm/juYzjc+0h5DBEj
         GHr1ozSZinhyv/jn8z23lnp9z5ExnZ8yG1fmE2ZC5c4NQtZchsfqGw5oYyX8OLCLWMhu
         ghxhguOShbUXMsdtzChNhJ2HGNensBOVYcCv0fw7fZeEiULXcVZwSyrp+OhKx3NIS0rS
         pZnI841DTJK0ptnA7JCM+yKq/FoyWkVkMCCBPLsU9jwxy99GTUmZz1SGR4wT9zTcUj1Y
         5wa+V/BJrVH8AOAEp9vJn/I/fowKmiIc+LL+me9krhALTcyWX9ss6eV7GFIhLEIUKREE
         5Csw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795563989; x=1796168789;
        h=content-transfer-encoding:content-type:mime-version:organization
         :references:in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=h9PLOclrJUCEyLmOGP/JKvrxQpzGt+LITgqfp1kq59I=;
        b=gbti0CUbQBXpxjTi15sDM5gSSf1lVeWiHsJgI2FWU5TNnSlXTpOvQeTyhycmWHjLoI
         UU8LYcSn+DPqiWaDdTZ9mhHIR2ww2Wzf6ieASVZAxwqcGjxB/I9/mKDjKnOkoAadeUeB
         x6eQx2g1qwfczskQZaKu670XKlo4UPZfL56GF5ijnEfSK+dWZujVUhAy16w+VoxcQL7V
         PZlGzzbPXODdC7m0Wt4CchXaqShG+IBPJ6tA4tj3+5kzP+Y1yn9eRWBHxyDy8GCFYWJf
         hzBg11KbacBPfVWFAz/L5AUxkaxKGh9hOTD3lTQQu7cXayzNutEHt9d9Npo3GkXUZnXA
         sl7A==
X-Forwarded-Encrypted: i=1; AL+hErH3WRdKvfJtCHVSb0dxyOTFyNAoxziKhdx3gS3XRz6oHZNbxNhEd+IqADlFPDLpo7ZW4Um7dVpB/A==@vger.kernel.org
X-Gm-Message-State: APuU4Z+rnHQwRapKFVxIGd3HfdjrTisLAfaYUoFvmBe+qAeOxJroenKQ
	S5eyHTbU56QBVPwKsOLtQwQOqVLQbQBKRW90nD7T3V6DLwWIRu1jHkxwp2oasqOpZUsoauj7iUB
	1lD0+S6ZtmR/JdrcaxkNpxXspLOc6EZEduZEm8Aoe2ZFdrPJqRR2HG2tmsoig1w==
X-Gm-Gg: AZFdTZczS+af62G6UJ0iU2RDoot7cvzVLSb/wKvEtXaqyKv+/y+pb8weUJyB/WmjWvj
	QJQYGbSR2JM4ol6rIMsCgXJ9B8ImeomjO5K7LvPqDHMvyagpwk+UFhOeg99wvCbc1Mb9FE8jnoe
	oQN05SKZ/hBG59SBqOgeN5MPa/P1oB5pFj6kl7HNJI6cgkEKXR5zigQZP4LddbaTfYaO0uclAzb
	UJ+Fk+CnDKYMcvVkCoyk9o7BmQv6ded0YxCyJKaZQV8xIMNSrSEPlEQwxQsoE17zWSInNY6CcA2
	JNAoB0RSj/BpxO5vsjns+vM9qbDxLR9voXxgnxdPV0Z2qxlEFKV+e4pmYmRD42Hi2TUDLpdNUHB
	782882aPFvwh94n2AA+5NzLXb9nm+dfCVrXXfq2fAqVEI8Lt2Ze4wopXhctFpP+BBuByWh8i1XY
	HMjRK7IM0xmUz6B+8eyH/LZQZ5PhXL
X-Received: by 2002:a05:7300:e9d9:10b0:386:ce20:31c6 with SMTP id 5a478bee46e88-386ce20334emr1027388eec.29.1795563989138;
        Tue, 24 Nov 2026 15:46:29 -0800 (PST)
X-Received: by 2002:a05:7300:e9d9:10b0:386:ce20:31c6 with SMTP id 5a478bee46e88-386ce20334emr1027324eec.29.1795563988410;
        Tue, 24 Nov 2026 15:46:28 -0800 (PST)
Received: from localhost (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-38566cd40c5sm57314365eec.10.2026.11.24.15.46.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 15:46:28 -0800 (PST)
Date: Tue, 24 Nov 2026 15:46:23 -0800
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
        usama.arif@linux.dev, kernel-team@meta.com,
        "Rob
 Herring (Arm)" <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org
Subject: Re: [PATCH v17 09/34] dt-bindings: firmware: arm,scmi: Add support
 for telemetry protocol
Message-ID: <20261124154623.00000587@oss.qualcomm.com>
In-Reply-To: <20261124194841.1147072-10-cristian.marussi@arm.com>
References: <20261124194841.1147072-1-cristian.marussi@arm.com>
	<20261124194841.1147072-10-cristian.marussi@arm.com>
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
X-Proofpoint-GUID: Ck_Cy-OkIq65ZyHMy0RaOfy6fodLXD--
X-Authority-Analysis: v=2.4 cv=G+SJgNk5 c=1 sm=1 tr=0 ts=6b0621d5 cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=7CQSdrXTAAAA:8 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=Cq6dmUWW68VXehLBlYkA:9
 a=CjuIK1q_8ugA:10 a=scEy_gLbYbu1JhEsrz4S:22 a=a-qgeE7W1pNrGK8U0ZQC:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI0MDA5MyBTYWx0ZWRfX+W3ttHon5HEP
 QRzn0kzl/tKhdgXRslYGzgYEz6D32B+uRHZ4BkuRZuUD5+e0pirfEeELJs5ifd9EsRLEaFnjAzg
 Vg1To6o0wqMKwf9oOROtWlWh3Zjmn1k=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI0MDA5MyBTYWx0ZWRfX78iradpNreEj
 yggVQa9G0mb/rh2Jeu2e0BDSau4ggks8PobPWphxiaghxKAdKbJkuJ5fdd+REgtBBHzFoSCa05b
 4D4u2sn/m1sIjS1I2oJsRVfzO3Aze/USkIy4aMCc33W9Lyxcaw8+boPQb1SVgUF4lKeFRIfyb/l
 XDGqBkhXk26SWqiM54JgLK6mgu3eF38HlrB6WIR08BcWsdWaqZ+HO4vZldFJwfWXwKunKnY4QE5
 0Sep0awC9cysLAjWX3N0lTgdHY0G6lB1GirTtDz83KMFFkjxxE+VcFSm8XML+B1s+xqThTl9ijV
 7sKy7GuUOTP2G9FzLRKw4qcwVjqKdm2Kq+0dHJH2wXVHqxQdLJX/+y70jQZGjoQbouQifjoOPOK
 wNrSKiBDEcZWDzg+1HhN7SnUYQxe9OBHkhneQZTd7sRAyI5ZLwBj5N4VUjbkdha2IO3T9GC6fOx
 /BJBfo2jbTF7WTVlVVA==
X-Proofpoint-ORIG-GUID: Ck_Cy-OkIq65ZyHMy0RaOfy6fodLXD--
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-24_06,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 bulkscore=0 phishscore=0 malwarescore=0
 lowpriorityscore=0 adultscore=0 priorityscore=1501 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611240093

On Tue, 24 Nov 2026 19:48:15 +0000
Cristian Marussi <cristian.marussi@arm.com> wrote:

> Add new SCMI v4.0 Telemetry protocol bindings definitions.
> 
> Acked-by: Rob Herring (Arm) <robh@kernel.org>
> Signed-off-by: Cristian Marussi <cristian.marussi@arm.com>
Reviewed-by: Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>

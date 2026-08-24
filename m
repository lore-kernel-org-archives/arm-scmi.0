Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1215D453A50
	for <arm-scmi@vger.kernel.org>; Mon, 24 Aug 2026 16:51:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787590305; cv=none; b=u4HCZK4P5tjXS15fOlnvW0e60Vg8/ZUevt8fe6Y2YmhK7pXkv22x1YHP5R2r4S3gfeioW/RrPzx6Z53KUaNnJDZW9jQeRBk5VcxmxIJew3k7BrePZkXfUsL8OPsTuYf0sF2IYYqQsmtIGMHtEH6Cl7WLv3TTjLUfIVQt7PTyPn8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787590305; c=relaxed/simple;
	bh=5v77F1jxIZAWs0P/tIb1Z87dFviFUceo6u8DoyixeAw=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Y96cjlzsQlTam9o4P6Y2IHb39D9nF/Yd4eTIzbue1ZWLqWI3JtVxGFrzZ5lWQ89LyFJnxnvHu0OI6eF1hmAEeDF7vGJWThfAH5YBoEs34iuQZW/ANuP9GFOCrSFMOIs9W6ykaFTEQfHtg8d+5+IAvMFQ+ByBt6h7JmAiPZwEurc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kSXZ2Zu5; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=NttBxBXt; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="kSXZ2Zu5";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="NttBxBXt"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67OFmhG03994122
	for <arm-scmi@vger.kernel.org>; Mon, 24 Aug 2026 16:51:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ERZilrXY/3hHR5+jqOyEP4/9xdUWJrsKbHUl2RWk+U8=; b=kSXZ2Zu5hKXsHruL
	1w4OpGry9K3Qi3G+Dfj3eR7JWTXK7C0vbNrDQiauyCptqJMm0gnvoYrPNJev1bg5
	SaT3aqroMKO9zbDwlQl7hQlMab2QsIAMaAEWzU+L2kd0ddpodr38hfjgfRqdV7dS
	CjatDtUGsPbFBSvnSGZmP6SYal2i3eySlmqNAj+oPywRP8BasseCOy/HVwCPpOGk
	5Z4x1J/pNdFl6/tnzMBQspjf8zmlIihhDj8qKrZpBQCOaqtpw2RghTLIXeZf3C8b
	W8pgxLWufK948I69hHPJ0SAP0c3blgKJeaaEOeSikm8S5NkXjbjT001UWokfMQXm
	OzzDvg==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g8jgk29dw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <arm-scmi@vger.kernel.org>; Mon, 24 Aug 2026 16:51:43 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2cc7e86e7c5so68593615ad.3
        for <arm-scmi@vger.kernel.org>; Mon, 24 Aug 2026 09:51:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787590297; x=1788195097; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:organization
         :references:in-reply-to:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=ERZilrXY/3hHR5+jqOyEP4/9xdUWJrsKbHUl2RWk+U8=;
        b=NttBxBXtX+id5czCopg3lFjY/TLIcUxhjTxWZUHb7dsaydwA5elK+O02w0H/E9lZeA
         F+02p7M49jJXmE+cSixhP/daloqFQYpRmT6Jt1IyxD6wu5Sc4gys3DSu7qIeL3Jem8C1
         6WZYxwqNAuSDIhEkJJNpuGveAibJRJdcsdh1DH8/39lOlkksblo2WoUD3AabNNGwl49x
         Z8M3En+bMIKXbwAqAf6suKDZysZHuIAoG60UaYZNdpNCcMycybwBwK1qYC26rRuNUP5l
         RP+eTaDC3Mjs8KMcgucjoepV1tOiufwEx35O2gwLkWpLz8gVAwn/FD92W0z7lhEK2B7J
         GO8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787590297; x=1788195097;
        h=content-transfer-encoding:content-type:mime-version:organization
         :references:in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ERZilrXY/3hHR5+jqOyEP4/9xdUWJrsKbHUl2RWk+U8=;
        b=KRAunMS6mrIRjo3QGGi4olLy3yg3xLBWUJs11O8SH6KDeDbtkAHGxtjuBual76OzNY
         Fgt/keGavhmWUooxr/7yI8oBAIzLCLixumjMUxGJO7gninZMvwZKFiw2eF/gh/nNTqpd
         j1NK+8+AaL02kA0TjDuQ4QO570iACIYAfybros+vCEi9aSTNjHuB4CmnMINTimgvaj7Q
         NHI9QV9HAs48UPsat9uScmQuG9bM6R47pqlV80T9Rrqg0tLSNsxiZF/oH2Q6IHBDJFKb
         spKIRDBOQctn96Ew5jeQ7e03xEE6OG8SaZfs39Adnu3f1AWCKnwOpGAzjm2EbH53lyO6
         3DVA==
X-Gm-Message-State: AFuF++l+8XQGmnxb4hx9NTXDz1uKJu/Y4ONFTp1ZmfyaIUwSVn7MF6MZ
	Yq3QhqtyCE7JFBH06HlvvwcGawZ/Kf7M/J4ThCpB511fPBi+ZehN2bePLA2SHzYTqPo7i22pxNA
	uGohovw2Tc/GTco3YCtHYVM+O4so02ozzGhTi7Z9hHjns2wGLCAtzHExF8ImSYw==
X-Gm-Gg: AR+sD11n+u+ThskLV8B6+QC+Bb5lW8uzk2MKVlJmmfD3EAY+hdns6gJhQ7l7/GkiMYy
	WBH/eVeuQuCRbpGtUsXN7DVysaEfjG6VzHoMkJEJ5WZyJnfIfMXnYARfS/1uS1JX2PCdfVJeEqu
	PgelqHvDyZQicZ7aKv/tkBY4B1xju+kmItboG0n2MIVvXTXoZayR+vTTb1U2UkF2pWuRvsMFSAv
	WumvKZTnDSQ8qK2lMG/Jn8xOzH1nrDn1uYxYyyeBgIh+yq0038aGOSD5IgFZZxRcl+Ieujchm4Z
	T8vRoQjb/QZAtv722egGS1yHF3WgjZTV83S1I59Vw+oVwoRnOxBnB8Nwyy1mCc4l9vhAEF0k0mY
	nVn1MVhgoXRQrlh2Z5FXCASLGGw==
X-Received: by 2002:a17:902:d552:b0:2ca:e19c:97b with SMTP id d9443c01a7336-2d670b85ea7mr430160815ad.5.1787590297479;
        Mon, 24 Aug 2026 09:51:37 -0700 (PDT)
X-Received: by 2002:a17:902:d552:b0:2ca:e19c:97b with SMTP id d9443c01a7336-2d670b85ea7mr430159625ad.5.1787590297053;
        Mon, 24 Aug 2026 09:51:37 -0700 (PDT)
Received: from localhost ([50.35.46.84])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d6768ba291sm20372535ad.64.2026.08.24.09.51.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Aug 2026 09:51:36 -0700 (PDT)
Date: Mon, 24 Aug 2026 09:51:33 -0700
From: Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>
To: Sudeep Holla <sudeep.holla@kernel.org>
Cc: arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        kernel-team@meta.com, Cristian Marussi <cristian.marussi@arm.com>,
        Breno
 Leitao <leitao@debian.org>
Subject: Re: [PATCH v3 1/9] firmware: arm_scmi: Set fwnode for the generated
 SCMI platform device
Message-ID: <20260824095121.00001b9c@oss.qualcomm.com>
In-Reply-To: <20260813-acpi_scmi_pcc-v3-1-cb6b88b4ebb3@kernel.org>
References: <20260813-acpi_scmi_pcc-v3-0-cb6b88b4ebb3@kernel.org>
	<20260813-acpi_scmi_pcc-v3-1-cb6b88b4ebb3@kernel.org>
Organization: Qualcomm
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.51; x86_64-w64-mingw32)
Precedence: bulk
X-Mailing-List: arm-scmi@vger.kernel.org
List-Id: <arm-scmi.vger.kernel.org>
List-Subscribe: <mailto:arm-scmi+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:arm-scmi+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: DYjWZ4zDs9Z9PYwNkolTG8V6nHOZ4VlB
X-Proofpoint-GUID: DYjWZ4zDs9Z9PYwNkolTG8V6nHOZ4VlB
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI0MDE0MiBTYWx0ZWRfX27PbI07hOhDp
 ckgL5EHqRRdK8XLVGFuHqwapLV2XGXPNsSw1JEB6voHzac0fmZ6X8SD2lhAo1mrbiVP15A9qpEM
 a6yhTLTyYxmMJUC6tfdtRHcY1A6k6bs=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI0MDE0MiBTYWx0ZWRfX/OVyGbJ1dj9r
 Pmi7P3Qh/ePV6/WTsyoS/2ycsnHGM5VlTRTlS/1Z79SDQeEQSAJpD4Luw1izfDvIA+E8AORB7yg
 QSXTWMVAe7lXzMpexFOcHl3r4zYcHx+YCositkgcToXLD8UiMIhLBCiVxeo820wmMjuop6DI47T
 UvQ8yz7B3NNiPgLN/D6d04JLdefPed4+Ay/scwreGnIR9TZp/k4GvexekLyS8iS5v5FAJwq3SYK
 Hk6Ofc0CxEiGWwVAGXXoSn5Fee6UBON8Ljo7LnG65BZAS58EfQJBknidYfjM1aOk8qNDn5i5jiO
 fJD/MbVN2WrtJsI5zqfAGFJK2m23JqJqPmgMjio8A/Tib8DecwS8EcnjLQ/iLUIo1EFRqDItEwO
 C8G0Y1wZyLjDN6s1oBZ1VQimqD36hWCIEeUWhGmbupucWHBKyT0KoygolXgceQ84YEsKBM2AiRK
 21aAl6FYoo1ZP/IkVuA==
X-Authority-Analysis: v=2.4 cv=KcvidwYD c=1 sm=1 tr=0 ts=6a8c769f cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=qC1CW/w66vtJz1P9yTJxNA==:17
 a=kj9zAlcOel0A:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=VwQbUJbxAAAA:8 a=Y7bUGcAVvLU6MJrLthgA:9 a=CjuIK1q_8ugA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-24_05,2026-08-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0 adultscore=0 spamscore=0 priorityscore=1501
 lowpriorityscore=0 bulkscore=0 clxscore=1015 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608240142

On Thu, 13 Aug 2026 12:32:56 +0100
Sudeep Holla <sudeep.holla@kernel.org> wrote:

> Add a call to device_set_node() in the SCMI probe helper to associate
> generated SCMI platform device with the firmware node of its supplier
> transport device.
> 
> This complements device_set_of_node_from_dev() and ensures that
> firmware node information is propagated correctly for both Device Tree
> and non-DT (e.g. ACPI) based systems.

Hi Sudeep,

When you say 'complement' I'd like to see a little more.  The guts
of both calls includes setting dev->ofnode() adn the extra bit
in device_set_of_node_from_dev() is about ensuring we drop existing
node reference (there isn't one) and increment the reference for what
is the parent of_node.

I may be wrong, but I think that is unnecessary and if I'm wrong I'd
like to see more info here on why it is needed.

Also, if this is commonly needed why doesn't device_set_node() include
that dance?

Unless I fumbled the command, a grep suggests there are no instances
in tree of these both being called near each other.

Jonathan

> 
> Signed-off-by: Sudeep Holla <sudeep.holla@kernel.org>
> ---
>  drivers/firmware/arm_scmi/common.h | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/firmware/arm_scmi/common.h b/drivers/firmware/arm_scmi/common.h
> index fe8c22cfb9f7..cc7d11c3c1f3 100644
> --- a/drivers/firmware/arm_scmi/common.h
> +++ b/drivers/firmware/arm_scmi/common.h
> @@ -650,6 +650,7 @@ static int __tag##_probe(struct platform_device *pdev)			       \
>  	}								       \
>  									       \
>  	device_set_of_node_from_dev(&spdev->dev, dev);			       \
> +	device_set_node(&spdev->dev, dev_fwnode(dev));			       \
>  									       \
>  	strans.supplier = supplier;					       \
>  	memcpy(&strans.desc, &(__desc), sizeof(strans.desc));		       \
> 


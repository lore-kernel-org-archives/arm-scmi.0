Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792444188;
	b=lmBYk5TZy9EZWTwZpZHerBOg7XY8Uu6KTq+eGxhQGxFXedgnP1+MKvZ5OTo8gBX8hT5m
	 lfaPWkd1myamyNMWzCibIUteQ5Fq8hNhWSCzsE6m4x7GCrnZMTwCcX9Ear4kxxcKmiuYi
	 WO0gKbyhwnSRG7L4/cFBKA54bOXkwEjrdVsTyriy4mKOqq0OTyn0FyPsWEqsJcvBt36lM
	 WPQFPF3XkSMF3ftzF7loGRqXzlEyLBVSj88SB5X7hbpZcBIby439DbOHYc4lJSWwesXd1
	 OyKXdeb0sDCwu+7qVyhlDTu3DxSIPLg/z4HIDxDu5ikJDT39K9eaxRvGdKsd3lV0+TQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792444188;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:In-Reply-To:References:Organization:X-Mailer:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=OBwZx726/9ho3XoZMIYvptvPiQNJGceesFvYTKcqywY=;
	b=wtvNTqSQSttl7dad7Of5NSiojk7HtVI1kSp0mymBwk9Cdi/SOppIr8WVOK5W/flZnGf9
	 +o4DKEX6iYiYzSEIU/tZ0dvOgXySm2OypAbyzV+Niiw6jM8/VoAa4Qug5sXy5BhZQL+cU
	 0CZdg5StZIghhpYFB2JTOeAKrj98Fw6EwEf9zgQrMZ0aWdmxntRtigUrM3VQKV7uWCPwC
	 BlbRt3+Iubmn6Yny82Vwab8y+TXoCtmZTp9OdAz6MRtZ88FN34yyDU1IeRmeDhm76pIck
	 /ZRl16V5x47QbUnrrdhXSqd1NMdHhaOH9XE1ObiQRMTqYZzjIB6A9mPyOn1E2RluN1A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=iWLJ+KLw;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=DDNlglqC;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F68E606A319
	for <arm-scmi@vger.kernel.org>; Mon, 19 Oct 2026 21:09:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7F68E606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=iWLJ+KLw;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=DDNlglqC
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69JJJqvD3103215
	for <arm-scmi@vger.kernel.org>; Mon, 19 Oct 2026 21:09:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	OBwZx726/9ho3XoZMIYvptvPiQNJGceesFvYTKcqywY=; b=iWLJ+KLwsyLtbo8g
	7uhBHNgEeXH56UX1iDgdr7ckbrl9UcP8hYvhmJnWZksrEdLRGVqd4KePkrhgBJ6a
	9/4T9I4HH+fVyfRKhXGGs8ZUbEUtH7qPUqi93fcBXiTQSw+1ttJ0J5IUeMhne+Jv
	o9z2umVaBQrwb6IDHIwqLQ/gqe0KJVmbPZ3dMq75pfL9gLthJXupNJWdCdG875jo
	mu08ain1Ki9lDk6XdIvQS9nkQ+5BaDRkRcQJORRr27XVIs0hDn0iKwKh1hcTsAVg
	6z7QllGcKXJzalgoqqRlJ1qq/DlC+KVhwj2MMIqnPcMAymgNX3TwJyeMfatct3ud
	OD6Ebg==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hdr4q0mdx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <arm-scmi@vger.kernel.org>; Mon, 19 Oct 2026 21:09:47 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93a3f673221so949795885a.0
        for <arm-scmi@vger.kernel.org>; Mon, 19 Oct 2026 14:09:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792444186; x=1793048986; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:organization
         :references:in-reply-to:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=OBwZx726/9ho3XoZMIYvptvPiQNJGceesFvYTKcqywY=;
        b=DDNlglqCa7GUeLLCVsBMi7TuXHjRckoaEiV1qGxM67Za0wSJsRth/08JoJK8604Qtg
         4hnmi7GZtdHdN6fT2MnokgJPQAUVHHNLLC0W2yj/uylNgRLFJp4iXo7Zeu5o8YxgsIq9
         UnWBPa9NuMW2b2HJYDuI31FOoz1xI1IJC91jcWTw5botOkH7AGZTZYxubCrMIpj1Ec2k
         PGawdNLFfos7B1zZ+1CDQhW9+gprnBJ+tPUtbSYV7xbnws1b0gJvaeSrSx52tO8xKBVG
         VofH/Xm/ih8ibHeYF+qNTU4KPwddfDn4Pp0FLfSp7kW3nLcIiQz8rXxMCiQsXeQuiNui
         HDfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792444186; x=1793048986;
        h=content-transfer-encoding:content-type:mime-version:organization
         :references:in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=OBwZx726/9ho3XoZMIYvptvPiQNJGceesFvYTKcqywY=;
        b=w6n+SgBLdC635aShTw/a1l72Y/tHXnky4Us52Q4N6Pywv5HbNgogXEkZ85Ce+4nv+z
         gQxKvTEUn+sn/1ibOTkVD8RrtbSeVDj/mdnA7BzQrn4H3YFCixyJA4OQ+4oONzQ1gMAK
         KqQqElwLYlVAU4Z4Im0+h9NiZzoGFMnkQZAnu1/f1HOxWoPDGNaozw046hvrzSnLuu6N
         eB3Puvzdr7lLcFDWr6nHwOz5AgRnl0q03RYUJKFE9sAbRV7DrRhbqMUsLKEkGjuxoLFm
         i0LlylO0sIW5q2gd7je2JJ4XN6aRb/kLycHgwDsfSRuD+ByI93+h8/ggGyQpUWniWDpm
         I4fw==
X-Forwarded-Encrypted: i=1; AKwUvBwN45E0/Joetg1q6zvh9a1nnB8EwqpUascxDNvcXO4TuAWmw6+Q4L0HG8qopcA5yy6UjUiaRp0IiQ==@vger.kernel.org
X-Gm-Message-State: AFq9FYK3r4Ds0Y4Kxt4FavH0jV9ODXPnqyltdwy9OmLGTSn8TX7inJJJ
	a2n577XnCbyaCUpoprTU5tAH5xosTDFOEV9hm5QGq2XPqIcJgT1wzxrWw5s1MEPCXVPNb+3cddY
	UaovcvxmqG6p9Xg82tlinbn0c25pK+jh5ynETua+GW1AHPHC6TIlT7QspBkfO/xCPbcaVaw==
X-Gm-Gg: AYBFou1p0ai8wIvny/K+P/IqXCM+OnuCiKG3rKdHFJU2RP7kvreDRdYHV9lpBk684Dz
	RZ2/xP+LeM8OQjVIFluYnayB9WxczoQBls3RiByZwLv5HB4nk9BbyGsbN5D9Gx6G1B4E8HehhNB
	19BMKOgQZXHOt34cKB5C9XzmqMa2ryuKjFmA90DkwoaJGPr9NxAJVmB0sy67zJCuDJR0/29TGZM
	e4L6jc4iHVciSB232gfeYgDCEa0azwXm+rZZAbZv1avwA4mpNvOJB1jn952gqQN+2tybCfJjKB2
	jAqDocx+8k/87QkIodrAChE+WAXENvZo95MmlITnRd0ZOBYnsg8qTXWrRaARJ1EZ2zzXrbavrjm
	7EkNlzvbTJkDBzTcE1teLxf2Pft9PkVBJIWzMxnctZg==
X-Received: by 2002:a05:620a:4687:b0:93e:c12c:fbb7 with SMTP id af79cd13be357-93f29db647dmr1615189385a.68.1792444186524;
        Mon, 19 Oct 2026 14:09:46 -0700 (PDT)
X-Received: by 2002:a05:7022:f51b:b0:159:aa67:28c1 with SMTP id a92af1059eb24-18512b3e25dmr12731519c88.20.1792443735366;
        Mon, 19 Oct 2026 14:02:15 -0700 (PDT)
Received: from localhost (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-18314b1722asm32711150c88.1.2026.10.19.14.02.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 14:02:15 -0700 (PDT)
Date: Mon, 19 Oct 2026 14:02:03 -0700
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
Subject: Re: [PATCH v14 04/32] firmware: arm_scmi: Introduce protocol
 instance notifiers
Message-ID: <20261019140203.00000f2a@oss.qualcomm.com>
In-Reply-To: <20261016185553.2794459-5-cristian.marussi@arm.com>
References: <20261016185553.2794459-1-cristian.marussi@arm.com>
	<20261016185553.2794459-5-cristian.marussi@arm.com>
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
X-Proofpoint-ORIG-GUID: 8rYd1UeacRAirT0wFHInyAwM7fYp1KtE
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE5MDA4NCBTYWx0ZWRfX0vQyzyNzQk7F
 /hWcAeMnQ3PRF6K/Ws7iBrwLmdkHstuhxYuT6kfYgH9OYESxZo1J8zldHgiz4gJVsrDElRq8ZFN
 eJH5J0U84AlmzVGuiYwJRC4rry1o7/A=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE5MDA4NCBTYWx0ZWRfX2uxe/JQpbmKw
 80c+0KosVoEYQ5o33fZ0FuBfNIfE2ymiToL1Ie9MY0qBxD+jlIOYQ88CvID0qLZviaLSPbhub4W
 SVe3dsCwkMAM8ZOqJoVvJwb+Tdtzbj6D5AauRJE1RTIQfy1hpelh5EcC6PEKjy2aipJeJtAWKRR
 zwvIvBgkNN9oSLgbOLoYPE+VnxHzBu/gRxQmT2B6/vEjUg3b7rJhcOZ4SsCZOrSfhhgOvyTDbtu
 0WLgAGkss4OeWbhFlGHbjqgbk5V1gLE8shdooYR+dbfJYjrzqx45cwABoR9zUczVM0FwBeTZ1SI
 d80IWmymvXF7be3kgit0Xhf+bH+Kw7V+997gQe2bsMYcBmVsuL1fEKpZalZMr7PbY3NkLoxnALl
 vWvBF7M5q1ILwLI6VsaJSmUJdQ9IpsOMGsh+N6hMQdMfMWQBDddct55n6V8LBxSl92tAPUERbw2
 TfGi6RSwOCRGpshkVmg==
X-Authority-Analysis: v=2.4 cv=aqsnmiZV c=1 sm=1 tr=0 ts=6ad6871b cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=kj9zAlcOel0A:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=7CQSdrXTAAAA:8 a=EUspDBNiAAAA:8 a=gIk6nJaUoXxf6RY8mAcA:9 a=CjuIK1q_8ugA:10
 a=PEH46H7Ffwr30OY-TuGO:22 a=a-qgeE7W1pNrGK8U0ZQC:22
X-Proofpoint-GUID: 8rYd1UeacRAirT0wFHInyAwM7fYp1KtE
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-19_05,2026-10-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 impostorscore=0 adultscore=0 lowpriorityscore=0
 suspectscore=0 clxscore=1015 priorityscore=1501 bulkscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610190084

On Fri, 16 Oct 2026 19:55:25 +0100
Cristian Marussi <cristian.marussi@arm.com> wrote:

> SCMI Protocol notifications are typically used by SCMI drivers to detect
> and react to particular conditions: this was the assumption and the classic
> usage scenario upon which the SCMI notification framework was built.
> 
> Some protocols like Telemetry, though, could be interested in enabling and
> registering for such notifications: in such a scenario each initialized
> protocol instance could want to register a common protocol notifier.
> 
> In order to reuse the existing SCMI Notifications machinery, allow
> protocols themselves to register for their own notifications and provide
> their own notifier callbacks.
> 
> Each protocol, at the end of its initialization phase, can now provide one
> unique per-protocol-instance notifier block, which will be registered, by
> the core SCMI stack, on the related notification chain: such notifier will
> be automatically removed during the protocol de-initialization phase.
> 
> Signed-off-by: Cristian Marussi <cristian.marussi@arm.com>
Whilst I'm not that familiar with this code, it seems fine to me
(i.e. needs more eyes despite the tag)

Reviewed-by: Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>

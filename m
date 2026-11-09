Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794262066;
	b=QoL5ws/let7UGPW24AJwYhM0l66knmAsjcuUYps+7QLc2SAjenolb+KG+i033gUnSfwl
	 OWhJCcP/RPrmBSVuAYC6b/53lpEFOhYVjUo7vIncVulR1W2affCp5ONuL5HWpT9ppDZFe
	 qyEzV7ToainwmfOROuwdDvfqN0ms7xf+DhwvU45eQtYaNI4ODs/xzpZvWNnBtFaAg0jGz
	 yGZiwnpnM0TKitQ1I57OIelNMwiHROux1TY15h7rPK8QtB4u2uhVAJ+6aZSvkvCJ4uW6T
	 eN0ltcjH1DS4kxYD9mGY+i7v8rHy51WiQM/ILjM8fAL9EWN1xeF1i1fCI/6DZFW59hg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794262066;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:In-Reply-To:References:Organization:X-Mailer:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:
	 X-Authority-Analysis:X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=uRDiN5YvmzpYpVtQ4WCNWSVVBmZmOtN02V0vIY9KlBc=;
	b=H5S7j7wOWd04StSUxJW1FBEbGF32AEJQ7QmTsIVbMbpgeW/dFoUqvpeSMs6eDAJyNLsj
	 kfXrVxwfNtwpG/skltyQp5vvwCo7Y58QElkELXPnYcGbYOUqJ9cxhOVVz6wdzG8dSSnhN
	 RsW/qhHThdPFrdZpPJacsa25ia6wt5KeMLcIF8ZbcGxW0RzuwCUoUo7KI1FyNUb8O5MBJ
	 sqtmSGrXh3vW5dCPNrfnrDLJbq6gSZZ3s6m8plXJl4P5KZjPPANIVbo5f82eCYJMVLJNh
	 Y62DJoWCOAIJrBkStrVklHqdxnG8Ju3EBlY0yjsHZH3tSZPiqlFTnxchjLzLZt363Sg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=k27vhz8w;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=aMzEZUrM;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85E33606A337
	for <arm-scmi@vger.kernel.org>; Mon,  9 Nov 2026 22:07:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 85E33606A337
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=k27vhz8w;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=aMzEZUrM
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A9LAPip1401219
	for <arm-scmi@vger.kernel.org>; Mon, 9 Nov 2026 22:07:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	uRDiN5YvmzpYpVtQ4WCNWSVVBmZmOtN02V0vIY9KlBc=; b=k27vhz8wVvvcrL6l
	474K+JnAqSvQJwpwRco1Wu24Vl/Nep5ME71Q9GOO0jRZzox6C6TRlfar/s9scZQ7
	zuITRoLj06qza6O/7o/KjvESXHDjvM/TsyhMmq/+Fe4bgKFtB3d3v45ZD9dvkiAI
	8JNiper23JeS7ZR6dptscHWBxIyDAh9siyzyINiOLiDsCxLc4ggeH+TiTRAggUxW
	jACzqyP4Sro70axn9Gvqk3+WlZL0s3FWA3kcTDzYfhK+c7WsJRUx3tusHxRg1ava
	7lAa74keKoyQ5Rj1tjDDFg/X3chbhJB8ydGW329Jeah4miF9OF6lvJ6O27HNtnpc
	04txSA==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hu6x2krjx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <arm-scmi@vger.kernel.org>; Mon, 09 Nov 2026 22:07:44 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-37390b2989bso2438288eec.0
        for <arm-scmi@vger.kernel.org>; Mon, 09 Nov 2026 14:07:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794262063; x=1794866863; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:organization
         :references:in-reply-to:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=uRDiN5YvmzpYpVtQ4WCNWSVVBmZmOtN02V0vIY9KlBc=;
        b=aMzEZUrMwnW2UADO2U/ixUjBB/Gr7Ue5SOidcVfDFUetWdgBSsmVophpgAU9j9iSSd
         ZPMy44Y0sLrgdyvI1eeeYR4sSO8kMyON/CX0nALVbZKE5WijFY8UhuUZCXPndosLUvQY
         CcjMcncwZtYYmmYjGueaw+H6ebO8j6yVoMGRs5kmYutWy/F8fU6Kim4gjOiVNpscTmOx
         ncw++Qv79AvwnP4I5PjRcupP6rmGwI2e/kbmtfyQNaOs/gJLKngbnKYcqo9znjJi5EtS
         +6eY7cU7B6QZjstj/rqMjc6woxwRZzXrIGnddVWaF2ZV72R1x0/QmNBXwQGV6R2Yj0uk
         HNfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794262063; x=1794866863;
        h=content-transfer-encoding:content-type:mime-version:organization
         :references:in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=uRDiN5YvmzpYpVtQ4WCNWSVVBmZmOtN02V0vIY9KlBc=;
        b=D2Q+ba156XtSvGH3rfXuThF3LqdYMFgQnxwnCtUYECQ1nf2ESnW16li1PBRTGyVy9n
         dNvZDgXvrddD2DLy438hba7lHXooWEXzFn9uUhaXt41cPr1xqpfS0UGNySisRL8I/30l
         O3uiETgj3RHe7x40ym2b5J0GkuSWAKpZIc4pInEoKi12tbp0F+2EzE5XiMxG2Sh4ydIY
         tY5/50tlThGe25kVmsiNGFgAJYXShlW8uD45HWwDgMZcUzTsL6albjEXSPecIVmjQE8R
         Fzv+2KqWPous5gGnFO0YO7yU+VUF2XjWLkyh9djK+JxllX6TcQbs0Tma9n9BwWEBbQpW
         9fUw==
X-Forwarded-Encrypted: i=1; AL+hErGPmhnAVstjufMTZMIuMdXb90oI+1O4UOzh6IBBnMrfegPpeazvstx/V87GWvzUJeHvi1SsyDqTUg==@vger.kernel.org
X-Gm-Message-State: APuU4Z/5CJdIEhgfRVlJecGUf2c28FnsFy5qN9CPOl0CXZwBoo4zjlwv
	D8tPZ6acvcRBa3Gr/1fBk0wYqgu2+FWKRz2r1VL3qNLX3SbX1tO9JDf9ovRO846RxkxV7ZR7Hmh
	ewLURS6CIZ1QrPbyiCaJdIts2hllw34Pb6vf6Af/hcdLhNDpUeCR6eoyUJ0d6RQ==
X-Gm-Gg: AYBFou09cvASgf1rGWdqxi+dhSUtoNzyGogT18+SWydUbdyqES9xwLAh4uRBPXVSfhR
	nx23fFXIaZ1cLHf+cvtthMWbVNkavNe82qnahwRwS30+3aC/KTZ3r5WZ7eNT9sKbUcUZzudSnxG
	VRMf7GDt/8/yYIhY3iwWV8C0TJGdAje7d9zBNFiF6F76Gf+i9zHPukV9VNWNbK8+UoKZjDba2gZ
	rjA3YvItqDff23DLmee79OjydLTlPT2ln3cj8WC7xuZsHOFiIUqVzhmCxDH5wuh0fwcbskKfI/O
	Yh7gwG3gKEkiVwJQuQ6XlG0aTZrYAtAXT+iRtkclxN14kUwrmDI3ACruD97mX1vamnR1J8+1yto
	7kc/vjgz+ucg3m3yZpL+UmQEHT+iATibIqf3ZwwPII11oSIjRc2yPP8Sen+h/OlGOFLK0bTYWki
	LZjxRlDdwjPHITyY4d/RD3PTqgzA==
X-Received: by 2002:a05:7300:d20d:b0:36a:7bb7:4609 with SMTP id 5a478bee46e88-3751fa3d46bmr785357eec.34.1794262063191;
        Mon, 09 Nov 2026 14:07:43 -0800 (PST)
X-Received: by 2002:a05:7300:d20d:b0:36a:7bb7:4609 with SMTP id 5a478bee46e88-3751fa3d46bmr785302eec.34.1794262062597;
        Mon, 09 Nov 2026 14:07:42 -0800 (PST)
Received: from localhost (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-375212e76e2sm1256570eec.24.2026.11.09.14.07.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 14:07:42 -0800 (PST)
Date: Mon, 9 Nov 2026 14:07:36 -0800
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
Subject: Re: [PATCH v15 04/35] firmware: arm_scmi: Allow registration of
 unknown-size events/reports
Message-ID: <20261109140736.00007915@oss.qualcomm.com>
In-Reply-To: <20261109091221.2532706-5-cristian.marussi@arm.com>
References: <20261109091221.2532706-1-cristian.marussi@arm.com>
	<20261109091221.2532706-5-cristian.marussi@arm.com>
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
X-Authority-Analysis: v=2.4 cv=TMjQ2Fla c=1 sm=1 tr=0 ts=6af24430 cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=7CQSdrXTAAAA:8 a=EUspDBNiAAAA:8 a=4nPJYbkOPloEEcwyAJsA:9 a=CjuIK1q_8ugA:10
 a=bBxd6f-gb0O0v-kibOvt:22 a=a-qgeE7W1pNrGK8U0ZQC:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA5MDA4OCBTYWx0ZWRfXzSwYoHespdHr
 XgyTchJMsyIEuq5WsZzsvnOwmjwU0kj5GXa49x2isAW/pPK1BjevI7VKgm2O30KI8ex3ySews6z
 JEV6AGuS/JYhnRc49YDGhaTyaFQFSX8yBdHft2+6XcK9YEETeFcRRq8qWdmrkFoNTOu6LTE3BfG
 aD+/A0CisHt6kT5iJYPehHGmbchANj0v22LhzuAXY9GsAoCDboJzd7QrUYpBpUvXzR5Yoi8drT3
 wRf40Kt8w5pU5ZkCEfGOcC+WVchrdzpMdN4FEvVDZrU238K7j8CFzJgeK0lThM3GZwFc6dMPLzQ
 6grckouo190s5LFKz4zKY4uSdKHPIWMTRHvqioDBsh2+P5XKw7/WQu7mRAP7cwVQQsufjU+DYuz
 UNBgnPx2SWvW2PZ2cp1ytj9+nIBib7JvQSMBQUII8782XJUQVjD2s/mka0qGDpQ4gFWjxXoF413
 wqZH98D0QoPTLYJB6iA==
X-Proofpoint-GUID: N8POKD3Izz-mP0YeZuLG3K6w4aoqEBok
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA5MDA4OCBTYWx0ZWRfX5ob/mgLN79nF
 5vgUi+lMCVc/ymTJzL78wm4M3zvYMaustzqycMv+EZT8thu6FNxAQlYxeZi8zrIEKxTTV92h/fh
 pG31NNqdCcrYtdKkawbBrpnyZ2zwgkU=
X-Proofpoint-ORIG-GUID: N8POKD3Izz-mP0YeZuLG3K6w4aoqEBok
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-09_07,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 lowpriorityscore=0 clxscore=1015 malwarescore=0
 phishscore=0 priorityscore=1501 spamscore=0 bulkscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611090088

On Mon,  9 Nov 2026 09:11:50 +0000
Cristian Marussi <cristian.marussi@arm.com> wrote:

> Allow protocols to register events with build-time unknown sizes: such
> events can be declared zero-sized and let the core SCMI stack perform the
> needed safe-net boundary checks based on the configured transport size.
> 
> Reviewed-by: Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>
> Signed-off-by: Cristian Marussi <cristian.marussi@arm.com>
> ---
> v14 --> v15
>  - better commenting

A few bits of feedback on the comments.

> v12 --> v13
>  - improve variable naming
> v10 --> v11
>  - account for ktime_t field when checking boundary
> v2 --> v3
>  - split out of previous patch on protocol notifier
>  - use max() instead of max_t()
> ---
>  drivers/firmware/arm_scmi/notify.c | 28 +++++++++++++++++++++++-----
>  drivers/firmware/arm_scmi/notify.h |  8 ++++++--
>  2 files changed, 29 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/firmware/arm_scmi/notify.c b/drivers/firmware/arm_scmi/notify.c
> index bc046f2f83a6..a30589c9b377 100644
> --- a/drivers/firmware/arm_scmi/notify.c
> +++ b/drivers/firmware/arm_scmi/notify.c
> @@ -595,7 +595,16 @@ int scmi_notify(const struct scmi_handle *handle, u8 proto_id, u8 evt_id,
>  	if (!r_evt)
>  		return -EINVAL;
>  
> -	if (len > r_evt->evt->max_payld_sz) {
> +	/*
> +	 * Events with a zero max_payld_sz are sized to be of the maximum
> +	 * size allowed by the transport: no need to be size-checked here
> +	 * since the transport layer would have already dropped such
> +	 * over-sized messages.

'such' here to me refers to the first bit. That is, those that are "
sized to be the maxim size allowed by the transport.

I'd just drop 'such' and have
	 * since the transport layer would have already dropped over-sized
	 * messages.

as that avoids this potential confusion.

> +	 * Note that, though, while this protects from buffer overruns, it is

Drop 'though'. Doesn't add anything and leads to odd flow to the sentence

> +	 * no more possible at this layer of the stack to detect zero-sized

'not possible at this layer ..'

The 'no more' refers to code that isn't here if someone reads this code
once the patch is merged.  So if you want to refer to what changed, keep
it in the patch description not a comment.


> +	 * events corrupted by truncation.
> +	 */
> +	if (r_evt->evt->max_payld_sz && len > r_evt->evt->max_payld_sz) {
>  		dev_err(handle->dev, "discard badly sized message\n");
>  		return -EINVAL;
>  	}



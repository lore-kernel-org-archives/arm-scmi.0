Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794354908;
	b=QXiM3KHMG8RmyE2dnZcM1GGvkrpXKYw2xeK2IaJGwQJtlJEtspGE038aA9Joh4xkoBkO
	 R7rUwwkAsRqSco7D7gEijGM7sbNTFw0IXTvYCml39kcoiFkkazlTeZSnaP/7evj/2fR2l
	 ZEOV7apP+KFAU/CbW6SgZJNz4HbsgS99fF72ejzX68oVWSHDNG5/+iQPheD/uqls+I54/
	 KetuV458gU+WbEJ20jRaaj1mi22YKsZe6zjiwso9v7aiE92gMZzx1uw1B6yYbx4sK1Oq+
	 EDid7OOPPKiB1XVcrN6hFabpI1h+xsSGXwEhmMBKdTkP1GKPoAbtV4kDIiHoxTkuXPw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794354908;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:In-Reply-To:References:Organization:X-Mailer:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:
	 X-Authority-Analysis:X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=AUql2wymmW69Kp3VegqeXpHQ2/+7j980FfOkqgfA5LI=;
	b=xsBvLKKkusDfzPHTi5vYUb4c2CbPMoap8ikxyrdy0w3dQqgHaEwiGrkBT2oAvzY36Wbb
	 06XuV7/fGkM7Vc8uG9a/OWmY+G0U3/cQdmsfrdxwfptfmeBW+FhKRSRd6H+RRR98mQCQ9
	 YVdsGodGmagpYQnrCeQhhp/aifO3T690BL/JpkhlLjUllj5PffKbxsOUB0MWl9kXIEhcN
	 UCk96ae1W9nSgPPfJtrHM6M72VZI54UI/lnUIt6d01tVA1IR0qVIrLnjBuFDKgtTvVEZR
	 dybS03cwyNnxjVupJ6bsN6gEzmbzlOiLK8S+ugAMfyKNLVVz2rt2n6A9sgzaj+eIdOw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=RvSrJur+;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=imj1+QS4;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8741C606A339
	for <arm-scmi@vger.kernel.org>; Tue, 10 Nov 2026 23:55:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8741C606A339
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=RvSrJur+;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=imj1+QS4
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AAML1Cf1117003
	for <arm-scmi@vger.kernel.org>; Tue, 10 Nov 2026 23:55:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	AUql2wymmW69Kp3VegqeXpHQ2/+7j980FfOkqgfA5LI=; b=RvSrJur+C7Q3n8AL
	zjxGsdpF4JAjs2TkgsUSFax51novUV/gWuNOBY9bR2hYMr+5g3dKI7L8MAw1RUgS
	ahREeWE3wwDuKFS3NpCGsORX1hfGhN37Wi46BALSWNXfwY3pb6zvewTAzs3mHu4b
	cXdtGcVFq/SOcUn3ajhzCa7CBIIU8A+xsvr5A/b1GqJ38eRS1zGk4/INMgZQsg90
	kkfsru0YWfqf9UR7l31J8wQsz8NaIDl9+WyeV8G7B7cf6AeH/fj8yvqkp+BEOlZx
	OIjlBKKPxjGZ/6mLx4/UXS346IOByZRCJe5uZWfXPyqmUQMpN4QvEgMC+iA5GMv9
	aWtYPQ==
Received: from mail-dl1-f72.google.com (mail-dl1-f72.google.com [74.125.82.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hv4pva9w8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <arm-scmi@vger.kernel.org>; Tue, 10 Nov 2026 23:55:04 +0000 (GMT)
Received: by mail-dl1-f72.google.com with SMTP id a92af1059eb24-1a71dd190b0so25042c88.1
        for <arm-scmi@vger.kernel.org>; Tue, 10 Nov 2026 15:55:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794354903; x=1794959703; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:organization
         :references:in-reply-to:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=AUql2wymmW69Kp3VegqeXpHQ2/+7j980FfOkqgfA5LI=;
        b=imj1+QS40auHKD6GPA//+z7x9mXp91dU9o25h+zG/akBZpge6GeYPo+aqWAtZi2yyf
         OxFYGgda/CExZvsvFuRyeYyxdrC1CJLpvmwY2jAFObBUWf2goMhki3Z6WwGscMwV6eIj
         SDDmt8lpWTVP0HlgVsgnV6iDtEdBy/UrQXoH63P0eDHQoZBWTLLkxLvQ/i7LZhClgoer
         orCtCDLdNh49uuU8oS5CeRthhLQadRmC7zkYs9j+qtUE2GdBB5W+5cNpwMDnYcUB8vDT
         TQdK5Em48dC2gj4cB+7wJIWIfUylK69WiVHkuaAEEllRmY/9nVAsecLbZNmNWc7xSpnc
         qQJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794354903; x=1794959703;
        h=content-transfer-encoding:content-type:mime-version:organization
         :references:in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=AUql2wymmW69Kp3VegqeXpHQ2/+7j980FfOkqgfA5LI=;
        b=oMnIcUsycOjwOYaG7BhZqIewtb4W/X5EkUp8yw4SLvdjeiYGg8QfTqnNS8SLYnB+3P
         SxXz6Fo1pkOfpTNs3gRbJfoqE9AWewvPQAjNEbYUQuEQl2cSSn2+u/SFFy2Qr7QIaE11
         uaeCz7/TAc42pmvVpijKAox90hYR04KjAm0DS4DYVoZzMAquQgLVmpMotIE5thixLpQb
         yrhzIREhcvrXsBrQ5KfVrpEp/M2BJtf8ubOlg46BYgxQBB4JsGFXafbkirqTKGPDodIp
         yMQUWBKPfz8FyNfPzOb6phrXFKQfcqTyAGIcCYCOI+nyY1k90lflqn2FTwi1RRqV4JBK
         QGsw==
X-Forwarded-Encrypted: i=1; AL+hErFJm9b7KvmpLEugkRAFZf4q2JyzjuwvqVYADhBPID7/ieYcLIaWUgm2NadZh2PRfCwoVYjQPiHbQA==@vger.kernel.org
X-Gm-Message-State: APuU4Z8QSbUs5dsgr2feUjHtWGidzkXNJQm1t/GS2ESZexIwoToiXSdt
	f0swAqz2ahe+shseOU6vmmX2XbM4BCcIy8u6oWODCGE4PVjac6hEPvtRSEbg2K3GydW5+gtKKRn
	xJCJCUUdcwp5SGdRqy22dMEllJUYh34i9NQd6u/n18VE/f6Z7N2voA4nw7nJXVw==
X-Gm-Gg: AYBFou3i3HmKH8mR/aTUKmBKxSF4H6P0ZnFwGhILDO6A94KL5ODsUSEzsPV8UEBCT4I
	xzyxKAdn9aiPkdo+UUteWOrJJq6DKbGYyuUmvz1j4ABzNCFofwgSdteAvcwpi1JRKt3dbC2EftV
	LA7b191tA/NAk7JU0As+6PlXWuv8hVtYQXHCIjFiFChWLXoMuZgGkddaJopTUVs/xzGbL11EgRG
	sCUjC5oT00bfjh+yyRkxK+AGUDZEKx+MCefDBxyz2RfO0m0kGCP+aGC6TeCDOkmuYJZq7cKvimX
	Tmr/jHrss+TS1X6doCUwwtWbzszRAGwHM0O3voqgFv79EsJ+1vzW5nHuPzgNc/503hns52XQ3Wy
	3sFKfQfIirFbvqdIJXGdT8HgHoxxBZ/vc9hFF44qqKfSBF1KMQ8ZLJ5HXI49gd+AnzYA6nWap6o
	OoB11KeuyGj7sXhG9R/m+K1XiYwO5H
X-Received: by 2002:a05:7022:b0c4:b0:13e:5a50:1e17 with SMTP id a92af1059eb24-1b3c023cd8bmr667207c88.3.1794354903266;
        Tue, 10 Nov 2026 15:55:03 -0800 (PST)
X-Received: by 2002:a05:7022:b0c4:b0:13e:5a50:1e17 with SMTP id a92af1059eb24-1b3c023cd8bmr667173c88.3.1794354902630;
        Tue, 10 Nov 2026 15:55:02 -0800 (PST)
Received: from localhost (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b3b5b2fc09sm21003960c88.10.2026.11.10.15.54.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 15:55:02 -0800 (PST)
Date: Tue, 10 Nov 2026 15:54:43 -0800
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
Subject: Re: [PATCH v15 33/35] Documentation: Add SCMI System Telemetry
 documentation
Message-ID: <20261110155443.00002e33@oss.qualcomm.com>
In-Reply-To: <20261109091221.2532706-34-cristian.marussi@arm.com>
References: <20261109091221.2532706-1-cristian.marussi@arm.com>
	<20261109091221.2532706-34-cristian.marussi@arm.com>
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
X-Authority-Analysis: v=2.4 cv=XqZvqlF9 c=1 sm=1 tr=0 ts=6af3aed8 cx=c_pps
 a=bS7HVuBVfinNPG3f6cIo3Q==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=7CQSdrXTAAAA:8 a=UJirIprmqi7MR36yQRAA:9 a=CjuIK1q_8ugA:10
 a=vBUdepa8ALXHeOFLBtFW:22 a=a-qgeE7W1pNrGK8U0ZQC:22
X-Proofpoint-ORIG-GUID: iAhU_OeQAGRx8X9lPAmqdnW4G1hTLUWU
X-Proofpoint-GUID: iAhU_OeQAGRx8X9lPAmqdnW4G1hTLUWU
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEwMDA5NSBTYWx0ZWRfXyX3LbDfcMCqr
 uovaM5wYFlgXeQtWIxdNmCZ7Mp/vGv1aHiYzqNX7HDfhjWlZ3hMlTZt3+5+HdvtgVk/zjCYdCso
 0XtRwlg2sAcd0Mbq6A1gVs24NE9VLG8=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEwMDA5NSBTYWx0ZWRfX4L6mdSnPW0Ly
 /Aj5pkRXzI+JpGH0Fd88T85PnN6hePM74CSLtTY5EUeOAfYB7IlLXKdvRKyZRd5j0wDDjUgKA4j
 yvJkF8ZTpMrxX3KrKP6r7kBLgqf9xXNwZuWjg6ip2b3CDoxqH0A3gXw+78VcIUwtKg7y7lgwyIU
 9LABfpyoCv29O9cmK5a9cz/OJyyM2rv2mOiTjt65e6BU61KuUlB4OgCVBdvJANW7vg/dssqZLcQ
 CEyodgpkUTrPnBbrVfGjZFEQwfcaFKiAyINWLiKUUrDlMAWzxtJvPKfPnkTD7TidCQ5mSC6jYky
 exZDjac9aPJC/gKMnmlDxDBCFJMyC5w9YbVWVIzlagpYxZHgwq3ftkXWub4WemA0xCIHBD+Z3o8
 wAB2bQsHebjJaMpliflQ2SlaM4DfoNPtuA2APZ3s8WvYs4aye2mD+nVVnVMffCkwvFAH2gB8Yw5
 W/fF9zjoJtVy7puim5g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-10_07,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 clxscore=1015 priorityscore=1501
 malwarescore=0 bulkscore=0 lowpriorityscore=0 adultscore=0 spamscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611100095

On Mon,  9 Nov 2026 09:12:19 +0000
Cristian Marussi <cristian.marussi@arm.com> wrote:

> Document ARM SCMI Telemetry IOCTLs interface.
> 
> Co-developed-by: Philip Radford <philip.radford@arm.com>
> Signed-off-by: Philip Radford <philip.radford@arm.com>
Various trivial things inline. For example code it is always
a balance between writing production quality stuff that
has lots of info that doesn't matter for docs, and over simplifying
to the point of ending with random broken code.

Here there is enough error handling to expect it to work but
there are cases where it doesn't. So tidy those up for consistency.

Jonathan


> ---
>  Documentation/userspace-api/index.rst |   1 +
>  Documentation/userspace-api/stlm.rst  | 590 ++++++++++++++++++++++++++
>  2 files changed, 591 insertions(+)
>  create mode 100644 Documentation/userspace-api/stlm.rst
> 
> diff --git a/Documentation/userspace-api/index.rst b/Documentation/userspace-api/index.rst
> index a68b1bea57a8..22daa7ebf78e 100644
> --- a/Documentation/userspace-api/index.rst
> +++ b/Documentation/userspace-api/index.rst
> @@ -54,6 +54,7 @@ Devices and I/O
>     dcdbas
>     vduse
>     isapnp
> +   stlm
>  
>  Everything else
>  ===============
> diff --git a/Documentation/userspace-api/stlm.rst b/Documentation/userspace-api/stlm.rst
> new file mode 100644
> index 000000000000..ea05a10d314f
> --- /dev/null
> +++ b/Documentation/userspace-api/stlm.rst
> @@ -0,0 +1,590 @@
> +.. SPDX-License-Identifier: GPL-2.0
> +
> +=======================================
> +STLM - ARM SCMI Telemetry Userspace API
> +=======================================
> +
> +.. contents::
> +
> +Overview
> +========
> +
> +ARM SCMI is a System and Configuration Management protocol, based on a

Wrap docs to 80 chars.

> +client-server model, that defines a number of messages that allows a
> +client/agent like Linux to discover, configure and make use of services
> +provided by the server/platform firmware.

> +
> +Enumerating DataEvents
> +======================
> +
> +SCMI_TLM_GET_DE_LIST returns the DataEvent descriptors exposed by the
> +Telemetery instance. Users can size the request from
> +SCMI_TLM_GET_ABI_INFO.num_des or by issuing a zero-sized batch query.
> +
> +Example
> +-------
> +
> +.. code-block:: c
> +
> +	int main(int argc, char **argv)
> +	{
> +		struct scmi_tlm_abi_info abi = {};
> +		struct scmi_tlm_batch batch = {};
> +		struct scmi_tlm_de_info *des;
> +		int fd, ret, i;
> +
> +		fd = open("/dev/scmi/tlm_0", O_RDONLY | O_CLOEXEC);
> +		if (fd < 0)
> +			return fd;
> +
> +		abi.size = sizeof(abi);
> +		ret = ioctl(fd, SCMI_TLM_GET_ABI_INFO, &abi);
> +		if (ret) {
> +			close(fd);
> +			return ret;
> +		}
> +
> +		if (!abi.num_des) {
> +			close(fd);
> +			return ret;

returns success. Make that explicit with return 0;

> +		}
> +
> +		des = calloc(abi.num_des, sizeof(*des));
> +		if (!des) {
> +			close(fd);
> +			return -ENOMEM;
> +		}
> +
> +		batch.num_items = abi.num_des;
> +		batch.item_sz = sizeof(*des);
> +		batch.items = (unsigned long)des;
> +
> +		ret = ioctl(fd, SCMI_TLM_GET_DE_LIST, &batch);
> +		if (ret) {
> +			free(des);
> +			close(fd);
> +			return ret;
> +		}
> +
> +		for (i = 0; i < batch.num_items; i++) {
> +			printf("0x%08x: %.*s size:%u type:%u unit:%u", des[i].id, 16,
> +				des[i].name, des[i].data_sz, des[i].type, des[i].unit);
> +
> +			if (des[i].flags & SCMI_TLM_DEINFO_GROUP)
> +				printf("group:%u", des[i].grp_id);
> +
> +			printf("\n");
> +		}
> +
> +		return 0;
> +	}
> +
> +Enumerating Groups
> +==================
> +
> +SCMI_TLM_GET_GRP_LIST returns the groups exposed by the Telemetry Instance.
> +Group descriptors report; the group ID, the number of DEs in the group, and
> +the number of update intervals supported by the group.
> +
> +SCMI_TLM_GET_GRP_DESC can then be used to retrieve the DE IDs of a specific
> +group.
> +
> +Example
> +-------
> +
> +.. code-block:: c
> +
> +	int main(int argc, char **argv)
> +	{
> +		struct scmi_tlm_abi_info abi = {};
> +		struct scmi_tlm_batch batch = {};
> +		struct scmi_tlm_grp_info *groups;
> +		int fd, ret, i;
> +
> +		fd = open("/dev/scmi/tlm_0", O_RDONLY | O_CLOEXEC);
> +		if (fd < 0)
> +			return fd;
> +
> +		abi.size = sizeof(abi);
> +		ret = ioctl(fd, SCMI_TLM_GET_ABI_INFO, &abi);
> +
> +		if (ret){
> +			free(groups);
> +			close(fd);
> +			return ret;
> +		}
> +
> +		if (!abi.num_groups) {
> +			ret = 0;
> +			free(groups);
> +			close(fd);
> +			return ret;

			return 0;
rather than setting ret.


> +		}
> +
> +		groups = calloc(abi.num_groups, sizeof(*groups));
> +		if (!groups) {
> +			ret = -ENOMEM;
> +			free(groups);
> +			close(fd);

return an error rather than carrying on.

> +		}
> +
> +		batch.num_items = abi.num_groups;
> +		batch.item_sz = sizeof(*groups);
> +		batch.items = (unsigned long)groups;
> +
> +		ret = ioctl(fd, SCMI_TLM_GET_GRP_LIST, &batch);
> +		if (ret) {
> +			free(groups);
> +			close(fd);
> +			return ret;
> +		}
> +
> +		for (i = 0; i < batch.num_items; i++) {
> +			struct scmi_tlm_grp_desc desc = {};
> +			__u32 *de_ids;
> +			int j;
> +
> +			printf("group:%u des:%u intervals:%u\n", groups[i].grp_id,
> +				groups[i].num_des, groups[i].num_intervals);
> +
> +			if (!groups[i].num_des)
> +				continue;
> +
> +			de_ids = calloc(groups[i].num_des, sizeof(*de_ids));
> +			if (!de_ids) {
> +				ret = -ENOMEM;
> +				free(groups);
> +				close(fd);
> +				return de_ids;
				return -ENOMEM;
I'm curious if sashiko noticed your docs and spotted this stuff?
I guess it might be conservative as often such examples in docs
skip error handling.

> +			}
> +
> +			desc.grp_id = groups[i].grp_id;
> +			desc.num_des = groups[i].num_des;
> +			desc.composing_des = (unsigned long)de_ids;
> +
> +			ret = ioctl(fd, SCMI_TLM_GET_GRP_DESC, &desc);
> +			if (ret) {
> +				free(de_ids);
> +				free(groups);
> +				close(fd);
> +				return ret;
> +			}
> +
> +			printf("DataEvents:");
> +			for (j = 0; j < desc.num_des; j++)
> +				printf(" 0x%08x", de_ids[j]);
> +			printf("\n");
> +
> +			free(de_ids);
> +		}
> +
> +		free(groups);
> +		close(fd);
> +		return 0;
> +	}

...


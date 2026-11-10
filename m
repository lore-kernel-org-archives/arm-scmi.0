Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794352457;
	b=jAI5iLXRnFNYmra9CGTFLP3FPnK6lKgBiTF4PeFkJuZGhGaGNaeHuzzOeZt5XQoCVdFR
	 8n59lgNDgifN0d/JJrLWiIOhVaSebtZbCS3PwLRX7ikO+qdYeyoNI3nP6n3rDOCDrrrR4
	 jxRVH3g2Dyh9u25JMQGbu1v9eP7QvZt8DwttAC+qfSb24wikqRULSBsDXfxUDD2uxJnaR
	 BMJg9/OP06vbOAciNXSweSRRRoN+ldQVIpF0eeKP+oN3hzcq6tNfSRei5do28HZV5BhrJ
	 /XhmVJgT6p8ZazN2ArLcYTPRM6Y7nl37N51z0lR8/3r0gGzIL6OqXciFZRhs8DQcCzQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794352457;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:In-Reply-To:References:Organization:X-Mailer:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:
	 X-Authority-Analysis:X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=4Xpscwyy3jFhQfYrCqIDewqcILIH2yywXOfnayr7y/Q=;
	b=KBDOT/L63P7Vamqqw0pkC7uvoFFX3xhIJcC0/ufC0dVb4B0D6qGsW+RNVruAAwsoe63R
	 OTvAmGM5dnUSX2kfEln+erNBiD51uk+FX0TJ781X2cQS1L80D7z6BtKaosR/+qWl8Q2mY
	 FbT2Ilky73HdCNbmgWUgoJZ5Ovy+shUsGkXAMZE0YGgDobrtIon2BQ31Um/1V/23vcsKJ
	 hoyLrc1P/rUMV2jc6FAasdSeD9bw2JESIXPXEtV4tDE3uMPauCGL1MiJccmBYtgHWx2q7
	 7tZuuzm0Ot2A+lWdY1YDTwE4sSzPVsyS+mlHneOHh44ozA/gXap8cEYyQzPRgftaR3Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=pg+rAz5n;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=HbCJyZAO;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2EAAC606A325
	for <arm-scmi@vger.kernel.org>; Tue, 10 Nov 2026 23:14:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2EAAC606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=pg+rAz5n;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=HbCJyZAO
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AAMLCOM1117233
	for <arm-scmi@vger.kernel.org>; Tue, 10 Nov 2026 23:14:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	4Xpscwyy3jFhQfYrCqIDewqcILIH2yywXOfnayr7y/Q=; b=pg+rAz5niP/2exc5
	mmAqnWelZCxUE3DBGcXTX6EVbGMLGuESy8uaJgx+lHzThpBSRau6OQyon1EMXycD
	udel624sixOUdWNg0uBOyMtSEx2Nv+HNd72dxKdA4/wCgjGuD07G+WR3JT4Hxr53
	kKokAUEB84+QcitMbyGAs63fxc/tji9cxc5xDzjTJ5mOA4qMniP89Aauj2DIhFG0
	ePoh6eBPxMXL4SjNjSvk4tMuyPrUD1gk03Ov3MsZANm4LMO3nOeaazXB9tackSm7
	V656QbeY22V1reYdpD11W5klNuwk66jlKkOYfnL3u0p7QWIs0SZDrKQCr4uELWio
	HH4mlg==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hv4pva67a-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <arm-scmi@vger.kernel.org>; Tue, 10 Nov 2026 23:14:13 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-36efb506f29so3588098eec.1
        for <arm-scmi@vger.kernel.org>; Tue, 10 Nov 2026 15:14:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794352453; x=1794957253; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:organization
         :references:in-reply-to:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=4Xpscwyy3jFhQfYrCqIDewqcILIH2yywXOfnayr7y/Q=;
        b=HbCJyZAOzGB26wi0Yefw3YX+qMZxioxDZ9e/4Z3dcHFJDtV4v3OMdI3eLAY2oim3TQ
         tNcbxFQL4q+RwIjKASEiMQhQWiKZeV8HMbhe7WytuDuZkv2ymIaLtESCcKtgpt7vNKaJ
         B+rhJHOyhAzebbf6iWegu8hpurutWOZ8WMXTska4vANFBVlknvWzS3rAnQCoAn7B+ja7
         I9rSTu4AE3KsiDQ1jp1My9TBpRVi3/GdRu8DRD69nBK7WvYSpMlGyoT6YCbe491zrhyu
         c0TlceAtl9RP1bGNyOsk30up4n5JUsNbYW/K+AdGTatvqX8e64kZp24jINBp4PyggTAf
         bjKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794352453; x=1794957253;
        h=content-transfer-encoding:content-type:mime-version:organization
         :references:in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4Xpscwyy3jFhQfYrCqIDewqcILIH2yywXOfnayr7y/Q=;
        b=0sWIW/dyJqfkAX+Szjzmm3NneCKQJP/Hh6UytSm/MyQ5egPiSNevGtF+g1YsH6YtFz
         itzoygyfvOlAyB3sZfUkMClihB6tiaOSEPx0PkKdB6pMbk+QDYgKgusd+r6AFT0Ax9z8
         kgA15TfBN5K5R1UPIjenq/lH+qxAT5VKSpnU383zVyMvJ84dRPhFNKmzms8Oe0mJqoF/
         lWIT+3NWQdx4z2HY8Y+W2rZA7oJomXDcURvw2LB4pOy4jFk6uH7pX7Lqqy1bbqrmOY3m
         6rHbPvJEge+FIZyRo1APe5+N8p1xv2ogBDcKJTC2j9Jt1Vxte0UNbdPW43urJ/YZZp6s
         WTrQ==
X-Forwarded-Encrypted: i=1; AL+hErG80hmBSD3kx2G2uN9RgixZNhjQmQjt0dbUfgwJpHezwX0gNTEyZpy2wRofq9dOyYHCRvYF3GqwJA==@vger.kernel.org
X-Gm-Message-State: APuU4Z84PVzJvBkLVU8IK1onH6jclW9A2uMhuGmMVN/LYRd5VqdY0rqD
	o3w1Ul/fdIKabGnU4jiVYOkw0keK5v2i0d1MSr5d1ZvpJoVBQ9LWFk5ZMPyGWgpYddFcGthHk53
	R9W4IDlSD3C1EqFtfZGx4UkgcoBfyBEfKxqhDShil7S5/Wgz+x8LOvMi40f3AnA==
X-Gm-Gg: AYBFou3lQ5hbAycKNHGzNpJtKw7H5dlNxnnqsD9xA3tIDxIWlY86f8KeAW+m3+xZwEg
	VstcepgaNukP8aHMraSVphv9v7u2dF1Ap0B1qwOUjeOAwbeicdFsIDa6uLQnNdS5Xv5W7qi/1NW
	aznMrwY+hKqKB4gY0l3VKs4NWbS1Dp/bVfu//qk44CARAIW0rB8cnfMHLQLYso/0Mq/lUZlkagD
	KxHuBxNpBuFMpr1OOeRH4u+h2svZzNryABvU1gUMVkKSbIkM+fKyXGajrwzwKnD6C5I/Z4nvA94
	/qpiPquxg0TOjbJCDXpeCqacQfvBtPgRUZOTesmYgiapYFvMv2Zd519BCvs2+j2hN7sueAp+/iB
	V415aGUuAI8GdVPBOAYxFn3PxEp9lOvucgvEq6HJck2FPFtVW7tiqfUKKfrEycPGCnW5lMeKvNZ
	Y/N5kiS5Oi2Z1xUbgTCoNxxT5/08w=
X-Received: by 2002:a05:7300:f78e:b0:36a:12bb:7f8e with SMTP id 5a478bee46e88-37685d7279dmr1026962eec.13.1794352452877;
        Tue, 10 Nov 2026 15:14:12 -0800 (PST)
X-Received: by 2002:a05:7300:f78e:b0:36a:12bb:7f8e with SMTP id 5a478bee46e88-37685d7279dmr1026919eec.13.1794352452279;
        Tue, 10 Nov 2026 15:14:12 -0800 (PST)
Received: from localhost (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3751fe306e3sm10490952eec.7.2026.11.10.15.14.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 15:14:11 -0800 (PST)
Date: Tue, 10 Nov 2026 15:13:49 -0800
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
Subject: Re: [PATCH v15 29/35] uapi: Add ARM SCMI Telemetry definitions
Message-ID: <20261110151349.00005df7@oss.qualcomm.com>
In-Reply-To: <20261109091221.2532706-30-cristian.marussi@arm.com>
References: <20261109091221.2532706-1-cristian.marussi@arm.com>
	<20261109091221.2532706-30-cristian.marussi@arm.com>
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
X-Authority-Analysis: v=2.4 cv=XqZvqlF9 c=1 sm=1 tr=0 ts=6af3a545 cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=7CQSdrXTAAAA:8 a=XiCDCQztHa5vJwnvm_YA:9 a=CjuIK1q_8ugA:10
 a=bBxd6f-gb0O0v-kibOvt:22 a=a-qgeE7W1pNrGK8U0ZQC:22
X-Proofpoint-ORIG-GUID: W2XsLgfNuxC2ksoQcMtBe92sTF7r2TqJ
X-Proofpoint-GUID: W2XsLgfNuxC2ksoQcMtBe92sTF7r2TqJ
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEwMDA5MiBTYWx0ZWRfXw4Er0/o7Mrpn
 4LscgN2Cp8hkNQjZPVPk/WBLYpeZ+KRXSxywZJecqtsi0mqSei3SnRUf0XSRQ0vtJfyEYByIejt
 NifiQuMyNFrmHN9JrBfH5lwik/5htes=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEwMDA5MiBTYWx0ZWRfX3YPe9G+kPGb3
 Fy+wrVlzLWTqJ+U6nmQhkgux66KjohuO7jm8byVFfXKvE3hoRDeZsVQBMRwshnvAETus9xj5lL/
 qxMNShLaZFZW7bosbvyWfGyRCYytC9NtMpym1bW+Sz1hCzYuBnQ4lL11yu5ChJW3py5nB4nSPIF
 +bPE/lUpFSxqIk6+p5YkP7HvF+eXyxV3wR5SITgCRJWIUQZBy7OvSXrZSyakN4XTnipCozCTGvt
 RifQMNs/d5C5/FvE2q8X9LfsX2Q8LjD2XSvfJcM2BRDyOKdpqCYigHNVB1QKHMumpwgtHQsdPgL
 8lH0ABMSUIVbXmwuxh3EOberKlFfrCZtreUZxQrKuG/ILJECkYhgRC7vIehU2wRdxv92zLb8O/V
 5Nt3UCeF0Sx4KVoP0k9Hv7sIiYy26FvYYABjm6zUS5/pFHJDw74QanAGswX9qg6aTu4RzA1wQZ1
 lqncO21VBUFcqntXBZw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-10_07,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 clxscore=1015 priorityscore=1501
 malwarescore=0 bulkscore=0 lowpriorityscore=0 adultscore=0 spamscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611100092

On Mon,  9 Nov 2026 09:12:15 +0000
Cristian Marussi <cristian.marussi@arm.com> wrote:

> Add a number of structures and ioctls definitions used by the ARM
> SCMI Telemetry protocol.
> 
> Signed-off-by: Cristian Marussi <cristian.marussi@arm.com>
> ---

> ---


> diff --git a/include/uapi/linux/scmi.h b/include/uapi/linux/scmi.h
> new file mode 100644
> index 000000000000..dd78220554a2
> --- /dev/null
> +++ b/include/uapi/linux/scmi.h
> @@ -0,0 +1,531 @@
> +/* SPDX-License-Identifier: GPL-2.0 WITH Linux-syscall-note */
> +/*
> + * Copyright (C) 2026 ARM Ltd.
> + */
> +#ifndef _UAPI_LINUX_SCMI_H
> +#define _UAPI_LINUX_SCMI_H
> +
> +/*
> + * Userspace interface SCMI Telemetry
> + */
> +
> +#include <linux/ioctl.h>
> +#include <linux/types.h>
> +
> +#define SCMI_TLM_ABI_VERSION_V1			1
> +#define SCMI_TLM_CURRENT_ABI_VERSION		SCMI_TLM_ABI_VERSION_V1
> +#define SCMI_TLM_DE_IMPL_UUID_SZ		16
> +
> +#define SCMI_TLM_SHMTI_ID_INVALID		0xFFFFFFFF
> +
> +/**
> + * struct scmi_tlm_abi_info - Basic information on the ABI/instance
> + *
> + * SCMI Telemetry characteristics like number of DEs, Groups, Intervals and
> + * SHMTIs are statically determined by the platform and do not change within
> + * one boot/session; they are reported here so that they can be used to properly
> + * size the requests on other IOCTLs, without having to discover dynamically
> + * those sizes by issuing a zero-sized IOCTL request at first.
> + *
> + * @size: sizeof this structure - IN
> + * @abi_version: ABI Version - OUT

I'm curious what the plan is for ABI versioning.  Normally to have
any hope of backwards compatibility it needs to be a negotiation between
userspace and kernel (and then hardware if appropriate). Is there any route
to do that?

> + * @abi_features: ABI capabilities bitmap - OUT
> + * @primary_de_impl_version: SCMI Telemetry DE implementation revision - OUT
> + * @num_des: Number of defined DEs - OUT
> + * @num_groups: Number of defined DEs groups - OUT
> + * @num_intervals: Number of available update intervals (instance-level) - OUT
> + * @num_shmtis: Number of discovered SHMTI areas - OUT
> + * @features: Instance specific SCMI feature-support bitmap - OUT
> + * @reserved: Some room for future expansion without the need to resize.
> + *	      Must be zero.

Why?  I'd expect the input size to indicate what userspace supports.
As such what use is this reserved padding?

> + *
> + * Used by:
> + *	RW - SCMI_TLM_GET_ABI_INFO
> + */
> +struct scmi_tlm_abi_info {
> +	__u32 size;
> +	__u32 abi_version;
> +	__u32 abi_features;
> +#define SCMI_TLM_ABI_FEAT_RESET				(1 << 0)
> +#define SCMI_TLM_ABI_FEAT_EVENT				(1 << 1)
> +#define SCMI_TLM_ABI_FEAT_UUID_LIST			(1 << 2)
> +#define SCMI_TLM_ABI_FEAT_BATCH_STATE			(1 << 3)
> +#define SCMI_TLM_ABI_FEAT_BATCHED_CFG			(1 << 4)
> +#define SCMI_TLM_ABI_FEAT_DE_TRACKING			(1 << 5)
> +	__u8 primary_de_impl_version[SCMI_TLM_DE_IMPL_UUID_SZ];
> +	__u32 num_des;
> +	__u32 num_groups;
> +	__u32 num_intervals;
> +	__u32 num_shmtis;
> +	__u32 features;
> +#define SCMI_TLM_SCMI_SUPPORT_RESET			(1 << 0)
> +#define SCMI_TLM_SCMI_SUPPORT_SINGLE_SAMPLE		(1 << 1)
> +#define SCMI_TLM_SCMI_SUPPORT_GROUP_CONFIG		(1 << 2)
> +#define SCMI_TLM_SCMI_SUPPORT_UPDATE_NOTIFICATION	(1 << 3)
> +	__u64 reserved;
> +};
> +


> +/**
> + * struct scmi_tlm_config  - Whole instance or group configuration
> + *
> + * @enable: Get/Set Telemetry enabled state for the whole instance or the
> + *	    group specified in @grp_id - IN/OUT
> + * @t_enable: Get/Set timestamp state for the group specified in @grp_id - IN/OUT
> + * @flags: Bitmask to represent special characteristics - IN
> + * @pad: Padding fields to enforce alignment
> + * @grp_id: Identifier of the target group upon which this configuration will
> + *	    be applied: ignored if not marked as a group in @flags - IN/OUT
> + * @active: Get/Set currently active update interval for the whole instance
> + *	    or the group specified in @grp_id - IN/OUT
> + * @reserved: Some room for future expansion. Must be zero.

I'd add a size field for this one too to make it easier to expand.
Probably the same applies to all others.


> + *
> + * Used by:
> + *	RW - SCMI_TLM_GET_CFG
> + *	WO - SCMI_TLM_SET_CFG
> + */
> +struct scmi_tlm_config {
> +	__u8 enable;
> +	__u8 t_enable;
> +	__u8 flags;
> +#define SCMI_TLM_CONFIG_GROUP		(1 << 0)
> +#define SCMI_TLM_CONFIG_FLAGS		(SCMI_TLM_CONFIG_GROUP)
> +#define SCMI_TLM_CONFIG_IS_GROUP(f)	((f) & SCMI_TLM_CONFIG_GROUP)
> +	__u8 pad;
> +	__u32 grp_id;
> +	struct scmi_tlm_update_interval active;
> +	__u64 reserved;
> +};
> +
> +/**
> + * struct scmi_tlm_intervals  - Update intervals descriptor
> + *
> + * @grp_id: Identifier of the target group upon which this configuration
> + *	    will be applied: ignored if not marked as a group in @flags - IN
> + * @flags: Bitmask to represent special characteristics. When the interval
> + *	   is NOT marked as SCMI_TLM_INTERV_DISCRETE, @intervals will
> + *	   contain a triplet: min/max/step - OUT

I'd have a reference to this in the num_intervals text. What happens if the input
only allows for two intervals?

> + * @pad: Padding fields to enforce alignment
> + * @num_intervals: Number of entries of @intervals. On input this represents the
> + *		   size of @intervals, while on output carries the effective
> + *		   number of entries filled-in.
> + *		   On input this has an upper-bound determined as:

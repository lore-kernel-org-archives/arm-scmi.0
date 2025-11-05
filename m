Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D7422FA0DD
	for <arm-scmi@vger.kernel.org>; Wed,  5 Nov 2025 11:49:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762343383; cv=none; b=iaU1J/0ww7vZt07hIhlI+YitMup+krh3vksOFPcV57J+EwHoVLSikWpiCkN1ysrjuuxp7018AlQLXoKw3mihRIOcAlJ43xRlWdmCo3HO3AMQEZR05EOp/zTgd7elY9blRfVZSeDb7NoczJDfR+Cg9LxjXdTYD885M9Ww+8Q8LvA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762343383; c=relaxed/simple;
	bh=h9PY5OPkCf2uBskEyBIwrFcuGzu6eGdyxya46lIvAoA=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=Q9HXspKAUmpK9JWRIy82a0jgXQKbZgLavjxwgBFtD7JcW61/5vY02TextdBnSC3JhuaNyt0yhOGJOrGupmNKszGkrtPZDdVV92bDL1WEHx70mSE1wsIKLNSZD0dPFGMrqUprpSa8xJqYXyZa3i64qJ1rCN71iDrkXSbN7Ls3ur0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=pnQFNcCK; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ZKf4trhq; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="pnQFNcCK";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ZKf4trhq"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5A586DKj2927453
	for <arm-scmi@vger.kernel.org>; Wed, 5 Nov 2025 11:49:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=i1p5yPFhjSMK/trdPZcnNN3W
	gSdZl8jXwKqYLsu5EBw=; b=pnQFNcCKT8It91GGvLLP7GAM1mcHkGRieWjEr9Ol
	eXAGNBfliOOhU7LxoSKZ2nlenz05sB6hHg9il8FC2L283pOgAmZX3f72LJoaYg36
	Wg3gqzu6hsL2EO4MPdn8uPKATwKGB/aaUMqL8+ZKtmKDnnscdevy3TqXK4jvr39/
	UrxeLHgtGjy9j4qgE81mz7wT8RrZ+NNnvxB/YjenVzVT39Wa9iEZ//zoYRVuj87+
	DLeuefwiMc4YmfVP6fQF7BMqZwiRUUUefA45AXhNjZqRquYp+czJ9qhpqpQZ/hIK
	LXnQ0jOUbZwZQ4OCPvwMW/8jqd4n9ckzULX4bhAG7jJ9Og==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a7me5u5nx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <arm-scmi@vger.kernel.org>; Wed, 05 Nov 2025 11:49:41 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-4ecf8faf8bdso202076361cf.1
        for <arm-scmi@vger.kernel.org>; Wed, 05 Nov 2025 03:49:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1762343380; x=1762948180; darn=vger.kernel.org;
        h=mime-version:user-agent:message-id:date:references:in-reply-to
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=i1p5yPFhjSMK/trdPZcnNN3WgSdZl8jXwKqYLsu5EBw=;
        b=ZKf4trhqhB4dJMD4NiCmtYFulI9gkc8z+9CSc+a3YtJYEXuOnMK5+kE0fjmOO5WHPu
         u/00ltdla7/bJWtg6xYQb5WA8MNbz5Vz5ez6Ngth5DTDbiAC6uqPd4n5fPo0vGJe9TKB
         fbDLhcws3h91wQ093keAW2OH6CyDIOgFqIiNiKFvf/CgXQQ+VXMJUh+Un7NTPuzaDtVq
         JqPiEtAPNPYEr9z4qtiHaidIgRWlOTJfuK+INQzQoA/lvWIIZIhUsXownBQyAIIpJRrG
         eGIJVCkN12wFWo5ka8KkQFo+XYE8pfOXDcEuiH7eOkun3HIHnW/OV27WeKKs0+dcdXN9
         8rDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762343380; x=1762948180;
        h=mime-version:user-agent:message-id:date:references:in-reply-to
         :subject:cc:to:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=i1p5yPFhjSMK/trdPZcnNN3WgSdZl8jXwKqYLsu5EBw=;
        b=qRzODWfBbiaXgJqFL+/q2HER04Z2GJ7O9VfZLKUjeteFRayHH35/jqzhbiiOdkAzGv
         DLSE+DXkdMsbuDXsDNgWSZi1X2Cky/Z5ldXQpyn4RLK3LY3Y7+m20QofANAA+ybCZfcz
         5MFIoaZVOoJnaSkvodawltjDGiG+ki1SQXH+6Lwv4lrMzkJM/f4A+tv1ZU2FX2DWzR7j
         KFeV/JjdoHgfrhOnt+svJW/MP9RU8qfh9b8ZVuwx3LewGnO6W//gciIK7nS9Wjn+BKg5
         xjAeUWjSJOdunG7ipDp6sAz62q4V/S/Pv1vsA53roUMXziPGFi+SAoBe34PoZRFBDfe2
         4U6w==
X-Forwarded-Encrypted: i=1; AJvYcCVPJWmB6oNHCdKr/6lPTwHe6ic3zNaj+7NG/wdzV6Xy6vPrht7n5vk+RwWsxrvUl7o4BkPi+FUgGg==@vger.kernel.org
X-Gm-Message-State: AOJu0YwO/7MEhsOLdIX/FFXLgD8mC9kmM7oC8IPdaIRubwYZ5dznVdq3
	qM7DatvA8MU4KEPUjyVK8c3oiv9EGG+erS0yBUK3vcadIx/86ieioP+mDeUGG8n0xnoUnMNIfRM
	0AZHM1Moqmk7/0bdcRag6wm6HAO0CBe8kGvDUqYk9deAStEJg2a8JMBfcII35QQ==
X-Gm-Gg: ASbGnctik2446MMztBHgzcjt/I8RJGr9Iz0mEyspufNbaG7Y2rp2BMkJm6qGzWoatif
	wN4FhrNvogPdhj9T9SdhWwzLybaeKmUTz19TIqB7FZBGriG4iRkbyk4xdssngTLz1YnP5BGUUAW
	Y6e9mStNmZRRoBCMsCMv0cbmNPNOVHW+yTsnXWSvXlz2QHd3w2Ai4vYU39fRpb1pHsZovj7EweV
	C+tb7r63AvCtsr0lpCYxg4JLkLA4X59mgZyvW9sWwTZYN1dSGbWMCz1SxMMpw+2EtCqPcHMZ+Y3
	1rvv1rM5b0oRM+FsQ8S9Fa9t+fdIq+Ag73k18IVjpM3Z68eWK2oqwpMrvgMoCa3ZrZqTinMMdF1
	HiqiNk8hFPAO2DQ==
X-Received: by 2002:a05:622a:830f:b0:4ed:44a7:cf78 with SMTP id d75a77b69052e-4ed723a8f55mr30373891cf.34.1762343380172;
        Wed, 05 Nov 2025 03:49:40 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEFviZmOscvu3WeDg7aLm2At05oLETpKTO0Bo+Vv4IMN5Nrz6eqob/nlu0UHv+XYfNOe61kkg==
X-Received: by 2002:a05:622a:830f:b0:4ed:44a7:cf78 with SMTP id d75a77b69052e-4ed723a8f55mr30373751cf.34.1762343379595;
        Wed, 05 Nov 2025 03:49:39 -0800 (PST)
Received: from localhost ([2a01:4b00:b703:c200:1ac0:4dff:fe39:5426])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-4775cdc2d14sm44637865e9.1.2025.11.05.03.49.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Nov 2025 03:49:39 -0800 (PST)
From: Punit Agrawal <punit.agrawal@oss.qualcomm.com>
To: Sudeep Holla <sudeep.holla@arm.com>
Cc: Cristian Marussi <cristian.marussi@arm.com>, arm-scmi@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 0/8] firmware: arm_scmi: Refactoring and enablement of
 ACPI PCC transport
In-Reply-To: <20251017-acpi_scmi_pcc-v1-0-0adbab7709d9@arm.com> (Sudeep
	Holla's message of "Fri, 17 Oct 2025 14:23:43 +0100")
References: <20251017-acpi_scmi_pcc-v1-0-0adbab7709d9@arm.com>
Date: Wed, 05 Nov 2025 11:49:38 +0000
Message-ID: <87wm44aect.fsf@stealth>
User-Agent: Gnus/5.13 (Gnus v5.13)
Precedence: bulk
X-Mailing-List: arm-scmi@vger.kernel.org
List-Id: <arm-scmi.vger.kernel.org>
List-Subscribe: <mailto:arm-scmi+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:arm-scmi+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
X-Proofpoint-GUID: 1nUc3pLS8xRfToEnRI8Qv79wf3gFZ9Ez
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTA1MDA4OCBTYWx0ZWRfX6Pzh+1s4GKCG
 0l3t+5Dv9j3JbmTvFcPY70HpiP6wPvKGtAerBe8egGHhzRID+xCsX528TReT9a4u9jhnQAQ6lre
 A5gnfupRTT21pOcRhCRNXpPyXqa7LyDZMm8ZUWVcnRmIKI0MsZE8DKT/PihX9/mtgnPvLILDwZI
 9LuUVrgwZfcfoN9nMW5pIRhBEuMfNevTNJ9+py7x4NCZozF7D757ArKjg7DSM/B1HEAWfO9VHPi
 cZvHZUS+YXIoU0C9EeP5t73c0DJwfak4gZYp6FannM5I44DmhT1qzjx5KiQsSstvTt/pRs4BZmm
 89rB5bdbc6GvKZlFwyYxC2zxHECarfXg7RyK5Df0S0Dz5fn2D5Blb07Irg1XD2Txo8lCo+/EKs8
 3ftDlgBrPOMcvj/z/QmZ1eo1mognLQ==
X-Proofpoint-ORIG-GUID: 1nUc3pLS8xRfToEnRI8Qv79wf3gFZ9Ez
X-Authority-Analysis: v=2.4 cv=IpsTsb/g c=1 sm=1 tr=0 ts=690b39d5 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=6UeiqGixMTsA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=7CQSdrXTAAAA:8
 a=XzXL5FNJrteVcywYxDQA:9 a=a_PwQJl-kcHnX1M80qC6:22 a=a-qgeE7W1pNrGK8U0ZQC:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-05_04,2025-11-03_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 bulkscore=0 clxscore=1011
 malwarescore=0 adultscore=0 suspectscore=0 impostorscore=0 phishscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2511050088

Hi Sudeep,

Sudeep Holla <sudeep.holla@arm.com> writes:

> The SCMI can be utilized in systems using either the FDT or ACPI specification.
> While FDT-based systems can natively use SCMI, ACPI-based systems often
> need to abstract the functionality provided by SCMI under ASL methods.
> So far, there has been no need to support SCMI natively on ACPI systems.
>
> However, with the addition of a few new protocols such as Powercap and Telemetry,
> which lack abstractions in the ACPI specification, there is now a need to
> run SCMI natively for those use cases.
>
> This patch series introduces ACPI PCC transport support for the Arm SCMI
> framework, alongside several foundational refactors and enhancements to
> achieve firmware-node neutrality between Device Tree (DT) and ACPI systems.
>
> The key changes include:
>
> 1. ACPI/DT abstraction and fwnode transition
>
>    Converted the core SCMI code to use `fwnode_handle` instead of DT-specific
>    structures, ensuring seamless operation across both ACPI and DT
>    environments. All property lookups, child enumeration, and device
>    association paths have been updated accordingly.
>
> 2. Unified transport registration for ACPI and DT
>
>    Extended the SCMI transport driver macros to support ACPI match tables,
>    enabling transports to probe using ACPI device IDs while maintaining
>    backward compatibility with DT-only systems.
>
> 3. Protocol device initialization and refactoring
>
>    Refactored the protocol device creation and validation logic into a new
>    helper for improved readability and maintainability. Enhanced the
>    initialization logic to handle ACPI-based SCMI devices without explicit
>    child fwnodes.
>
> 4. Introduction of ACPI PCC transport
>
>    Added a new SCMI transport driver leveraging ACPI PCCT (Platform
>    Communications Channel Table) subspaces via the Linux PCC mailbox
>    framework. This enables SCMI communication over PCC on ACPI-based
>    platforms.
>
> Collectively, these changes lay the groundwork for robust SCMI operation on
> ACPI platforms, achieving near parity with DT systems where applicable,
> while enabling the new PCC transport path for firmware communication.

I was interested in taking a closer look at the patches here but they
have a dependency on support for the telemetry protocol patches. I get a
compile error.

I was wondering if you have a branch with the dependencies included. Are
the v1 telemetry support patches[0] the right version to be using?

Thanks,
Punit

[0] https://lore.kernel.org/all/20250925203554.482371-1-cristian.marussi@arm.com/


[...]

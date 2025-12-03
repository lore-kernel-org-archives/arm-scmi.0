Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF70528313D
	for <arm-scmi@vger.kernel.org>; Wed,  3 Dec 2025 11:04:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764759855; cv=none; b=goFE0tYmLb+ghVtTAzX/AxThX+B7hr9SSY9WZNbi4CKKVFqxU+YhKAtdpJirxwdkPbtQcPmrxPKNyPYnRV8lbOQrB5muYVxGtoL6d5+IbPvDH+y9ktzt5TOIcAXRAE5VUzFY5ZJ5Wi/tEbLjmwN/65EH46HB/+eRf17NU8dA6yE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764759855; c=relaxed/simple;
	bh=DVSHlg5AtibGGLcYUpC5EV9Hn7EXmPtngd4IFQZc+iQ=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=TrMezfsQ5dATcXCm5Ro4CHiReIY5HblJdW8NFEove4bPWg4fE/P1zccwmjFnhA3hExxSv0hsRbU5rQqFVpkRw5PPz5proue+1tMkoTmoWjOhRk+773RgnElQIOrLk1AgVYe6v2t9+EAHmSaQNTxq8f+jMMxGI0jdUiSNhCKFUzw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Gg00H11q; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=OJCOyEdZ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Gg00H11q";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="OJCOyEdZ"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5B39Q4fl1969626
	for <arm-scmi@vger.kernel.org>; Wed, 3 Dec 2025 11:04:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=UFJKTwjHiAis4wfTQBy6AYXP
	EaNWvPiC5x9VaYm8ow4=; b=Gg00H11qipOHcrB7keAw49wsoP8Cp9Tq3ogmFR4a
	e7sRK6abkd/3G4Wvt9I4RlnZCc/rh6mIbkLkPIfALL7Y1ZgN40NGW9PvnxAM3bJn
	MKeoLUUXOqL7BaFpvRqbWpV2lFpANC8zp0Ry4/Uea9w9yTJHVLc3dUGqMarZZHXU
	XpLBU8gfXCagKknovJommArBx7SS/YSjDLrh9vmlryIcFehDVFANyg9RvZsDTvhe
	QCwSPYrhwfoO8BGJzqzt/cRjVZ5sULdrNevaL1kQgao9N/CTOoGwKD6XLDdQiVr6
	FPlU907ZZ6avMMWNS3oMxptbo0riAC2tFDvp4UVjSBhzTA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4atjjs0bf2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <arm-scmi@vger.kernel.org>; Wed, 03 Dec 2025 11:04:12 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8b24a25cff5so1217225885a.2
        for <arm-scmi@vger.kernel.org>; Wed, 03 Dec 2025 03:04:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1764759851; x=1765364651; darn=vger.kernel.org;
        h=mime-version:user-agent:message-id:date:references:in-reply-to
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=UFJKTwjHiAis4wfTQBy6AYXPEaNWvPiC5x9VaYm8ow4=;
        b=OJCOyEdZzv5hYTfJ9JFwNFbKEs4J2bHLKIyDEUygJuGq3oB7HhfJGS0NjwpiWfi8Q+
         fuAGCPrLM7jwXTn0d6X6FjTcybokvxGsdkL4JTlHst1DjaX7JAMdY8WIhrX22xpdELQH
         g1lSuNpsCxWuvR0nXDD+CEmSuowgpuFiBalR3AJDRzUCb0wtgQfwyQ6v5fhpcoWHEmKG
         2etwjfqpoUyUlrmWMG26PpfcOqyo3VCIi9AM8X0Asj7ORt3JfFc0AzHjcEZ3M+BnOpw3
         sCB7UUnMkUXZdpvIUXO1h6ZKtJBzAkWXsWwxPndsU7kF9PbJe4RMN2U8Wy8o+ZZ86863
         4JUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764759851; x=1765364651;
        h=mime-version:user-agent:message-id:date:references:in-reply-to
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=UFJKTwjHiAis4wfTQBy6AYXPEaNWvPiC5x9VaYm8ow4=;
        b=bcUgC5vTsIfZhdoOAydNhxwhdf7QNFCqVGOcREy1eZghVn5gvzCKPW2vDDttS7qUE/
         KeDebEicTGOmjFIvmIzKVNopsHH3aR+6hy9dwEWS1G3ztxXOkiI9k6CBAlQdTpcXKZN8
         EqP3TcQ08bWdVbIgPitdkqLyqty3d/E+2P9kOE1CZRWd2ZeW3oVifwPfDV2S5kVuAbrN
         QbChvLMlX5sDC8+rwMUYso/JWdm2BT4paF+OO0kuwOJecbxFDuIzznW75lGu50ifJNya
         NbPs08G1tL17TtSbFhR51B4sGq4LLQA5/AvOMGcvDrAOTHKt/YofM0uwfksxqedlxCob
         WSQA==
X-Forwarded-Encrypted: i=1; AJvYcCVaEPTwtRGBE6Yh40+nex5geqw9nUtKpZyXY7wrV9GrQuGtCpkKopXoY5RvVGU3vsNL6l8QDMXZ4w==@vger.kernel.org
X-Gm-Message-State: AOJu0YzmqgJuXyfFHFkvzQqOXdNIxn96IQJVZYS51kC2TA75L1bC1Lhz
	61GPBSxwAddSVQSwfitBJKDBKLINEfPiCL8z9x+Z3ORcVVCTpj+RoihaGA6E3ic8+jNJXa5MItQ
	Sm8VZzl4ElUuyaJbPAKHDW9jXo99I+YxclW8AZBGDzxwgy99kI+OnZPmfnwI9V9/ux8I4IA==
X-Gm-Gg: ASbGncv1rN7W5hLXpPoYW3FxWxrWd1uzMv/9BdNeX44ZtZOWmU/89XHav6RuOi7r9eB
	mMIO0MHarJ0A4LyrR8OIWJnPojwUXna0RPG3qBNi0GQl5PERcNa0+Bhmvj6iec8iejlYdpLNWSI
	eXZxNpXcMxgbK5R5TqmxqTNiwWfveHPNkr8Q6lK8h4cTd6HSBouL84V6PJkA3dIzII+SX/XKCnZ
	Yf7zAOdsKixLiggZuqUhOFanSMdsQ6HEF1ycaz4iJSN9Q6AxuOsIKSWlvRBB504iDWSJQmlGeUh
	sQ79guEDYn1v9DmfIf/Myb45pqLx2PUPL3I94+NUA9gfMzr+QcoHX7mmTG4PxudjTlZ/aPXz65o
	Pu7P3B9U0nXc5Vs0QX3hvliIb
X-Received: by 2002:a05:620a:44d4:b0:8b1:fde4:59ee with SMTP id af79cd13be357-8b5e763d0aemr234587485a.85.1764759851353;
        Wed, 03 Dec 2025 03:04:11 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFNbWJbzcy/B+fJSd0ZSuNTdWoH8tv96dKu+U9fsX4anpstqGkK1k1pN4CLnfJoddBVt0Y8gw==
X-Received: by 2002:a05:620a:44d4:b0:8b1:fde4:59ee with SMTP id af79cd13be357-8b5e763d0aemr234581985a.85.1764759850885;
        Wed, 03 Dec 2025 03:04:10 -0800 (PST)
Received: from localhost ([2a01:4b00:b703:c200:1ac0:4dff:fe39:5426])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-42e1cac995esm37331534f8f.43.2025.12.03.03.04.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Dec 2025 03:04:10 -0800 (PST)
From: Punit Agrawal <punit.agrawal@oss.qualcomm.com>
To: Sudeep Holla <sudeep.holla@arm.com>
Cc: Punit Agrawal <punit.agrawal@oss.qualcomm.com>,
        Cristian Marussi
 <cristian.marussi@arm.com>, arm-scmi@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 0/8] firmware: arm_scmi: Refactoring and enablement of
 ACPI PCC transport
In-Reply-To: <20251126-camouflaged-delightful-cuckoo-ddeac8@sudeepholla>
	(Sudeep Holla's message of "Wed, 26 Nov 2025 14:31:30 +0000")
References: <20251017-acpi_scmi_pcc-v1-0-0adbab7709d9@arm.com>
	<87wm44aect.fsf@stealth>
	<20251126-camouflaged-delightful-cuckoo-ddeac8@sudeepholla>
Date: Wed, 03 Dec 2025 11:04:09 +0000
Message-ID: <877bv3n7x2.fsf@stealth>
User-Agent: Gnus/5.13 (Gnus v5.13)
Precedence: bulk
X-Mailing-List: arm-scmi@vger.kernel.org
List-Id: <arm-scmi.vger.kernel.org>
List-Subscribe: <mailto:arm-scmi+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:arm-scmi+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: H6acBoIGnklk1IHrZs7sENo81WzgLxeq
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjAzMDA4NyBTYWx0ZWRfX4hhY5A26nEhu
 f3lms8sewb+8F9+MOdaJiQ3ur0+GnrMXqFhftFIOsq3JpAzmuuZXfeMocWDIM+SzSYmeUmiLtCb
 FF8sG3baJsUKavratx6BvIkA6l2wMAT2b6DkNEp91BpGNFnlkA10btDbrsTOg8pA/seX37raPCl
 EmWKEvzt6rfwCBMRYpZxBUPmOyph4rGQvD8+gxWz9BbnBgF8Jd47Aa0+ETx7dRq/lbuojagqUhV
 3FZyYrNB4V25wVfqY4LUAJxklzQCOpb7PMPvmwBXFn5q5jW/34OVoOr4i0+O4gw4Zeiz6ynhLak
 28g+nStegi8dZ6mfE/f7O2pCIs2UO/RUuQaVyv7OV31y1flOiIApZgLN489oLB0konDoXORBxpA
 VG0Hk7/OZDd3GphtuVKW8fojv4wu5Q==
X-Proofpoint-GUID: H6acBoIGnklk1IHrZs7sENo81WzgLxeq
X-Authority-Analysis: v=2.4 cv=ZqDg6t7G c=1 sm=1 tr=0 ts=6930192c cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=wP3pNCr1ah4A:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=7CQSdrXTAAAA:8
 a=Wh0JOPiwVpfDxFduUbEA:9 a=PEH46H7Ffwr30OY-TuGO:22 a=a-qgeE7W1pNrGK8U0ZQC:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-02_01,2025-11-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 lowpriorityscore=0 suspectscore=0
 priorityscore=1501 spamscore=0 bulkscore=0 adultscore=0 phishscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2512030087

Hi Sudeep,

Sudeep Holla <sudeep.holla@arm.com> writes:

> On Wed, Nov 05, 2025 at 11:49:38AM +0000, Punit Agrawal wrote:
>> Hi Sudeep,
>> 
>> Sudeep Holla <sudeep.holla@arm.com> writes:
>> 
>> > The SCMI can be utilized in systems using either the FDT or ACPI specification.
>> > While FDT-based systems can natively use SCMI, ACPI-based systems often
>> > need to abstract the functionality provided by SCMI under ASL methods.
>> > So far, there has been no need to support SCMI natively on ACPI systems.
>> >
>> > However, with the addition of a few new protocols such as Powercap and Telemetry,
>> > which lack abstractions in the ACPI specification, there is now a need to
>> > run SCMI natively for those use cases.
>> >
>> > This patch series introduces ACPI PCC transport support for the Arm SCMI
>> > framework, alongside several foundational refactors and enhancements to
>> > achieve firmware-node neutrality between Device Tree (DT) and ACPI systems.
>> >
>> > The key changes include:
>> >
>> > 1. ACPI/DT abstraction and fwnode transition
>> >
>> >    Converted the core SCMI code to use `fwnode_handle` instead of DT-specific
>> >    structures, ensuring seamless operation across both ACPI and DT
>> >    environments. All property lookups, child enumeration, and device
>> >    association paths have been updated accordingly.
>> >
>> > 2. Unified transport registration for ACPI and DT
>> >
>> >    Extended the SCMI transport driver macros to support ACPI match tables,
>> >    enabling transports to probe using ACPI device IDs while maintaining
>> >    backward compatibility with DT-only systems.
>> >
>> > 3. Protocol device initialization and refactoring
>> >
>> >    Refactored the protocol device creation and validation logic into a new
>> >    helper for improved readability and maintainability. Enhanced the
>> >    initialization logic to handle ACPI-based SCMI devices without explicit
>> >    child fwnodes.
>> >
>> > 4. Introduction of ACPI PCC transport
>> >
>> >    Added a new SCMI transport driver leveraging ACPI PCCT (Platform
>> >    Communications Channel Table) subspaces via the Linux PCC mailbox
>> >    framework. This enables SCMI communication over PCC on ACPI-based
>> >    platforms.
>> >
>> > Collectively, these changes lay the groundwork for robust SCMI operation on
>> > ACPI platforms, achieving near parity with DT systems where applicable,
>> > while enabling the new PCC transport path for firmware communication.
>> 
>> I was interested in taking a closer look at the patches here but they
>> have a dependency on support for the telemetry protocol patches. I get a
>> compile error.
>> 
>> I was wondering if you have a branch with the dependencies included. Are
>> the v1 telemetry support patches[0] the right version to be using?
>>
>
> I can create one but that is not strictly necessary. As mentioned in the
> cover letter, the only dependency is on value of SCMI_PROTOCOL_TELEMETRY
> ins `scmi_std_protocol` enumeration. Just add one and you must be able to
> compile the series independent of Cristian series.

Thanks, I managed to get the patches building. Looking forward to the
series progressing. If possible, do keep me in the loop for future
updates.

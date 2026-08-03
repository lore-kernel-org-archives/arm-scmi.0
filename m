Received: from MRWPR03CU001.outbound.protection.outlook.com (mail-francesouthazon11011032.outbound.protection.outlook.com [40.107.130.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F1D2345EA5;
	Mon,  3 Aug 2026 22:57:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.130.32
ARC-Seal:i=3; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785797843; cv=fail; b=nvUSuPktHuur6TQqFSXLwhdxNlFcUYTyWkj8rEx/5qG30MBPB6B8hYjfJXbOyCTy0e0K8zgLPU9w/mYBN+kZkDDGgtjdh+i9OjVXY9/ropdCpzEh5TSibspd26i+u2akbjCQQa71dF+Ks6RMbHYCiOCOw6qr12NsC+/kaNEqgMA=
ARC-Message-Signature:i=3; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785797843; c=relaxed/simple;
	bh=5D+Js1zqD/fmmKDv2Cv4GfK9/LLHhUZrjaXGCXHOTmY=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:Content-Type:
	 MIME-Version; b=QB5bcZdKfEW3UBmIHf0uYSDLgQLmRbB20fhJw9cmsTkR0eyhkvFlLVsZHh2D8L6Iy0s0Z8s5VCFOA7RkzFymuUGy8mDvVSs03xSzM0Rakmt39tp5kllwbH9uIGz9tEf+/bzLMZXif6cwABC3xSLi5/oXKCx1bA5PPNtW/nuCxYw=
ARC-Authentication-Results:i=3; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=MmC31q29; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=MmC31q29; arc=fail smtp.client-ip=40.107.130.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="MmC31q29";
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="MmC31q29"
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=ReruV2bxSRiIMTtqouozQH9PGMjiucsvtxKjIcSNaEu4g7n1Uijot5UAIgEWc8xzC+NZxojAOkTLz0qjwERFYfNWZaBe+vTGme4jHerm9GTbK/jIKXfHsPH+lxiWvQCMhSw0RIo0X+NmVwIaTmxuaY2/bqkVPJ2gxw5w6nOAFQ4nKD/hn4lSiJ+StuGrr4CFohcj+a54RSasJf9RiR2/HxY0b19N+kbYtwQgtNkp6kz3yPJdHEujCubWAMYzhSYHRwtP/2aTh7NLI5fiPsLJ0iJ+H5AP87kQkUgEmFe8glapeOy5DIyrVzBWGqM1O60tEVvTCQouZcl5WgeNoKTsIA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5D+Js1zqD/fmmKDv2Cv4GfK9/LLHhUZrjaXGCXHOTmY=;
 b=adEg+lF//mVfZiWkorHeThF18sF0tQ2/OtwE1wHiwJ1OxM2HLy4v6132zvHR5JTbSrMW9xOuuMbTgelqsxEUCplqYoPOoUSompFXX1nFBJ9cV5L+baAQyFYY23DE5KC5MfE+fRgBO1szcd1SUl4CJF1ISD3FZrWXDmsX/YKPplhk1Ycub812s8S/sbbVmCrxRNrE5sd1UiXco7uzHIqqJ9g13pqUOfSu+YQU27mtW7944XT7r2ihOAoEZiaagnEFCc/tJyWA4L4Tfpw7VR/fABIOEXdLwHZeuTFdrKFhvLAszNolTZb5Ge2Wi8Rs82E+NtQl8m2Q82VEBw2wyCT3KQ==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5D+Js1zqD/fmmKDv2Cv4GfK9/LLHhUZrjaXGCXHOTmY=;
 b=MmC31q29pmRhjmqOhr0xDnFSqf0ML5hMvdp6GO0dT3mwnrgmw9rgOwB0qXiPBlQXqd9le3kcaLMTmPyJKrAokZVWfzQyNXZ9uCBxfBHFZZSSpRVzBQJ5LPhpJYoPXbpEors59veCF4Wy+ekAxRwZzahTav2UPzz2M1v+Z+ooeWE=
Received: from AS4P251CA0019.EURP251.PROD.OUTLOOK.COM (2603:10a6:20b:5d3::7)
 by AM0PR08MB5377.eurprd08.prod.outlook.com (2603:10a6:208:181::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.18; Mon, 3 Aug
 2026 22:57:14 +0000
Received: from AM1PEPF000252DA.eurprd07.prod.outlook.com
 (2603:10a6:20b:5d3:cafe::4b) by AS4P251CA0019.outlook.office365.com
 (2603:10a6:20b:5d3::7) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.270.18 via Frontend Transport; Mon, 3
 Aug 2026 22:57:14 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 AM1PEPF000252DA.mail.protection.outlook.com (10.167.16.52) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.292.8
 via Frontend Transport; Mon, 3 Aug 2026 22:57:14 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Zd3hWJiNOcVSSrCuaUOmwP0rgqslNB5LTMCx5AJEBlwH74JF0m/sn+QdTa0ibYQxg9cLeQeFPhvHFpurrW88ntNMXzRHfoE1s7NnJ56llVOReBNtPxMjtqNFvAF8HEf+FCmtgyY2zMUCvkXY4GpPxz20ayYE147wvv6Bdg7VKrjW18KMPlxcIGSY/VTrgDWzoveO8x7Fk7yLMqxbyeA6cn3by4apgvJr2nuqaOvgqpeXxHlU10qgGGhUuFkeWtwx91nCLqbsWOfKHjaRNWvGhfHpI3O44AGcI74AA9mVZtQ8jjEi1WWumm+2o9bh+17Lt8qmbxSBhfiQjZHQMSgmeg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5D+Js1zqD/fmmKDv2Cv4GfK9/LLHhUZrjaXGCXHOTmY=;
 b=KXlZFaq5mQr4kIg5VQwSZf8AysAEY9J+5d8mL/GiWNjR7hN393481F9su01YxJTiqzSuhIIKX0Kd8/wONREFCYud9+hn+f8Rckn3ZE1DtcSljS0gXhBS5SXti++v5PvNjghxds8dOYYsx2a0KwRxbVKE/Kp9rZxg3EDH+rvHOJObe38wOhhETV3CYWP7LFiiOdRUueZVDO3ysKgFYcYYdN6Ob+oNgzsyKeppDfMAtiwM08HLUJF36KiqKc/uMuFu5iWGbr+GHEpt4LnBzuCyxE3ShEAItMms1l4Mj0MY+1rNvrt+QwihYOSAyGYujK4mxE3p9zmwKryio5JudDkQeA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5D+Js1zqD/fmmKDv2Cv4GfK9/LLHhUZrjaXGCXHOTmY=;
 b=MmC31q29pmRhjmqOhr0xDnFSqf0ML5hMvdp6GO0dT3mwnrgmw9rgOwB0qXiPBlQXqd9le3kcaLMTmPyJKrAokZVWfzQyNXZ9uCBxfBHFZZSSpRVzBQJ5LPhpJYoPXbpEors59veCF4Wy+ekAxRwZzahTav2UPzz2M1v+Z+ooeWE=
Received: from DB9PR08MB8651.eurprd08.prod.outlook.com (2603:10a6:10:3d1::9)
 by AS4PR08MB7503.eurprd08.prod.outlook.com (2603:10a6:20b:4e7::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.18; Mon, 3 Aug
 2026 22:56:41 +0000
Received: from DB9PR08MB8651.eurprd08.prod.outlook.com
 ([fe80::8fb8:7cf9:49c4:6f90]) by DB9PR08MB8651.eurprd08.prod.outlook.com
 ([fe80::8fb8:7cf9:49c4:6f90%4]) with mapi id 15.21.0270.016; Mon, 3 Aug 2026
 22:56:41 +0000
From: Fayssal Benmlih <Fayssal.Benmlih@arm.com>
To: Cristian Marussi <Cristian.Marussi@arm.com>
CC: "arm-scmi@vger.kernel.org" <arm-scmi@vger.kernel.org>, "d-gole@ti.com"
	<d-gole@ti.com>, "david@kernel.org" <david@kernel.org>, Elif Topuz
	<Elif.Topuz@arm.com>, "etienne.carriere@st.com" <etienne.carriere@st.com>,
	"f.fainelli@gmail.com" <f.fainelli@gmail.com>, "james.quinlan@broadcom.com"
	<james.quinlan@broadcom.com>, "jic23@kernel.org" <jic23@kernel.org>,
	"kas@kernel.org" <kas@kernel.org>, "kernel-team@meta.com"
	<kernel-team@meta.com>, "leitao@kernel.org" <leitao@kernel.org>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-doc@vger.kernel.org"
	<linux-doc@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, Lukasz Luba <Lukasz.Luba@arm.com>,
	"michal.simek@amd.com" <michal.simek@amd.com>, "peng.fan@oss.nxp.com"
	<peng.fan@oss.nxp.com>, Philip Radford <Philip.Radford@arm.com>,
	"puranjay@kernel.org" <puranjay@kernel.org>, Souvik Chakravarty
	<Souvik.Chakravarty@arm.com>, "sudeep.holla@kernel.org"
	<sudeep.holla@kernel.org>, "usama.arif@linux.dev" <usama.arif@linux.dev>,
	"vincent.guittot@linaro.org" <vincent.guittot@linaro.org>
Subject: Re: [PATCH v7 16/23] firmware: arm_scmi: Add Telemetry debugfs SHMTI
 dump support
Thread-Topic: [PATCH v7 16/23] firmware: arm_scmi: Add Telemetry debugfs SHMTI
 dump support
Thread-Index: AQHdI5tYApq3vclUskiK8381+1R6+Q==
Date: Mon, 3 Aug 2026 22:56:40 +0000
Message-ID: <518FE94B-F7C8-49D6-A298-7A5C1B1F3A25@contoso.com>
In-Reply-To: <<20260802145618.1952804-17-cristian.marussi@arm.com>>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	DB9PR08MB8651:EE_|AS4PR08MB7503:EE_|AM1PEPF000252DA:EE_|AM0PR08MB5377:EE_
X-MS-Office365-Filtering-Correlation-Id: 1c364c57-2576-4344-0808-08def1b28f38
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|1800799024|366016|376014|7416014|23010399003|38070700021|18002099003|22082099003|3023799007|56012099006|10067099003|11063799006;
X-Microsoft-Antispam-Message-Info-Original:
 5uRpXIml4iifVMGiOhmNKaZLQ3/UzKVb0ghQdvi7jk4+tA7ZuTdWfacr4vZKLl5q9aHdOifMwRL7tb4gvE5To+tHiuQEU547nl/dp5gc7AlynGrUiAfkzPFXXu5rSdOpB/81ckpjQ9PstDKfOoLDaANAFTD/lWJFJYuaP3qMZuPXdOuhIMGDRpy4QyRtfwzV6rOFQSMNYh1VwitiOV5ZHOEX/ZwSFpPAaWRuby+uRorCYTYWVg8yjwVJPPXZFrazpCvYbsyB7XdP6x/wPc9oW+LCY0f8JBGm4RUFav6s6vDTmfE2769bmM1ipALrmVaUUzAj5SyIXFgEn5wIEVDW5J7yz+MS/Ed4Zwo6s2blg3Vn7+01g3M/EtPLUgadIEENzWImQCJaZySQGyFOwEZEZ5rM7lENi37wykktHEg5rMAgsLhum2M1+b98VjH6xcpefmwgCTk4Wq9L0twOTZCqDsRozhZ4GmLSJdw4vTocEZoR8JtFXZ6IIA6J658XoBISGBS/fRb/fflA/TdpN6aktjBHcbRD3DpFSFQ3jAYcv2nYnpPs9ZaU4BVgj3brA900hqu1WNUf3ZTm1l5Zzqfo7pPyfWMQZdaDGPCi2OKMgMlyoUzeaj8Yf88Ily0F9GGxtFGElTY7ZK775jSkcH7wm8LqY9zXFDkHq6+Ul4fKHDw/JzOXVnTF6LlN33ROxBcPBuPIm4hfN4DUHlwv8vHzxWsNLiymODohYDCzvHRyMcI=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR08MB8651.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7416014)(23010399003)(38070700021)(18002099003)(22082099003)(3023799007)(56012099006)(10067099003)(11063799006);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <0E2CEB08CB815F4D895A13A9A014DA62@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: arm-scmi@vger.kernel.org
List-Id: <arm-scmi.vger.kernel.org>
List-Subscribe: <mailto:arm-scmi+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:arm-scmi+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked:
 V98tE2b6dHHiTHzQGsNG/D5ecmDH38MzY3nhuTs2VBn8z375JAjUpGOIE3dzhRpHSB1I5DQDeF75MAB0YS6iYE2+E32aQ+hMtgfB5Tni6EHV4w0JTSnKkNMTi7NdEL8GSQw+voxC3V7Z/cZOyP2NoTeLjW/iJviNiIQL35xLR8OQxCz0z1UvwIVchpyGqRI9OpjdpkSXWAzuTyYeglXC/EbkF+LHu/Vpm+ljf4VsBepV1DLvz5T5sM012foquG0+noKCHVQGVT2DjGUdqBv2I8/l4C9w5TtnqLx1STGEy8UNmscwrFDPli6leRdE5wwDeFlshRXB2AULhfJVigaJDw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS4PR08MB7503
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM1PEPF000252DA.eurprd07.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	1d88dd7d-90c1-4bbc-4809-08def1b27b71
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|14060799003|1800799024|82310400026|35042699022|36860700016|376014|7416014|23010399003|18002099003|22082099003|3023799007|56012099006|10067099003|11063799006;
X-Microsoft-Antispam-Message-Info:
	fSZHPd9p523sUgh9CoJLhv/VQgd4VkL8rpPbYLSABigJcbPLSzMAcAVc9+XFP+dddW8dcM3WkPFMVLtOtcS9AXaY1G6YNVsuQdelTPiPmo2g6WlS1/YYV1oOf72vA+9fovfsdIY7wv3s24TsfqJZbg7q4BwaHwCTWUV4qc6sJ4wPf7mnN6qHx89eqp023RnncfDEWVhYIU7CxF/jI6WsJC8zoeqoUQYaiHUiNz1OJjdD7oHdDTIm1UiDz+05LScG6SwDxukPd7SRujL7Gjfdps3sS4Y18jtUGh7ZCsEMzTBBHXcTYZveUABJckllZ71NFn60uX62NqAJ05MEO4gaKMZRB3makr+fOaFvyUepNcQxOzouNL0QYTpGy9tItzdMEZy3K4boMdD43fDKgoOZxQP/jggIuQ9Qn38GI+bUg4CPsDvP4/DdBXCRxHZaftms/hAMkiNBzLvGFPsHwTgN4EEs2vzAlmNynJjlF41i3WI+NoYIjYycGR9q6EE9owgogwrE6ExuTvxJNY34OUmLbJQfpjk44O6LqxNQZNFZij9l7d5SEShRsLQbwS5PTWm/PupCm+BMBtcxOHmzJhMTZ62Umu3OqGK5zvcNEVXgv+f9s2Rzp6MSQSH6QCN9DqsvE4KKOivu7eAtp5CKRkOU9SPfUBL5DB1zYyPbv6zpjy9QNdYxWGAEB496Hik/4S9Bu6Bz/uW9nLSdtQ6o3eFU/A==
X-Forefront-Antispam-Report:
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(14060799003)(1800799024)(82310400026)(35042699022)(36860700016)(376014)(7416014)(23010399003)(18002099003)(22082099003)(3023799007)(56012099006)(10067099003)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	QgNACeSl0FMAinAJSnWARPtbSILbFoeeNsqh/yM+qa7MuVwyoRaT9ga5TpLZ2HJvRQs4apmYHAX3PUi6pHHb6CvTgEaMxFUUcZ9IzX+QyUXdTsnOhNRp6E6I5tvBDTc0qdmPlQlwHMHM6QTjJohZKWgHYt0lU7PSXwf1KFsXtzwxaefMEHwJ/TTiwoy99yezrNTNmmtkwApLSyD04gUBQghT0ZEFzJIIHqYwHxlx5Q8C53MMi46lAPILtr3H9qCQO6E9i/ulPFP6gG3XqMDutCA6MnI6lv5JWh1ZdUWh7OuTziUVXk/ThbAYzB3cU3v43PpEEHobnir5O+RL4fILvQ3nkwVhKkautCwmAFSR1E5APaLyCnJJWtsbnacw7wtDt4mflQHAtAKb++C20DYvmAJ7+x186bQjvXzg4wlGdDz+ccigpiVTIADUTk4T9F49
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Aug 2026 22:57:14.1629
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1c364c57-2576-4344-0808-08def1b28f38
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM1PEPF000252DA.eurprd07.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB5377

SGkgQ3Jpc3RpYW4sDQoNClR3byBkZWJ1Z2ZzIGlzc3VlcyBpbmxpbmUuDQoNCj4gCXNobXRpID0g
aW5vZGUtPmlfcHJpdmF0ZTsNCj4gCXNibG9iID0ga3phbGxvY19vYmooKnNibG9iKTsNCj4gCWlm
ICghc2Jsb2IpDQo+IAkJcmV0dXJuIC1FTk9NRU07DQo+DQo+IAlzYmxvYi0+c2htdGkgPSBzaG10
aTsNCg0KQW4gb3BlbiBkZWJ1Z2ZzIGZpbGUgY2FuIG91dGxpdmUgZGVidWdmc19yZW1vdmVfcmVj
dXJzaXZlKCkgYW5kIHByb3RvY29sDQpyZW1vdmFsLiBzYmxvYiByZXRhaW5zIGEgcG9pbnRlciB0
byB0aGUgZGV2bS1vd25lZCB0ZWxlbWV0cnlfc2htdGkNCmRlc2NyaXB0b3IgYW5kIGl0cyBkZXZt
IG1hcHBpbmcsIGJ1dCBvcGVuIGRvZXMgbm90IHBpbiB0aGUgU0NNSQ0KZGV2aWNlL3Byb3RvY29s
IG9yIGNvb3JkaW5hdGUgd2l0aCBkZWJ1Z2ZzIHJlbW92YWwuDQoNCkEgbGF0ZXIgcmVhZCBmcm9t
IGFuIGFscmVhZHkgb3BlbiBmZCBjYW4gdGhlcmVmb3JlIGRlcmVmZXJlbmNlIHJlbGVhc2VkDQpT
SE1USSBzdGF0ZS4NCg0KUGxlYXNlIHVzZSB0aGUgZGVidWdmcyBmaWxlLWxpZmV0aW1lIGhlbHBl
cnMgb3Igb3RoZXJ3aXNlIHBpbiB0aGUgb3duaW5nDQpkZXZpY2UvcHJvdG9jb2wgZnJvbSBvcGVu
IHVudGlsIHJlbGVhc2UgYW5kIHByZXZlbnQgcmVhZHMgb25jZSB0ZWFyZG93bg0KYmVnaW5zLg0K
DQo+IAlmb3IgKHVuc2lnbmVkIGludCBpID0gMDsgaSA8IHRpLT5udW1fc2htdGk7IGkrKykgew0K
PiAJCWNoYXIgaWRbMTZdOw0KPg0KPiAJCXNucHJpbnRmKGlkLCAxNiwgIiV1IiwgaSk7DQo+IAkJ
ZGVidWdmc19jcmVhdGVfZmlsZV9zaXplKGlkLCAwNDQ0LCBzaG10aV90b3AsDQo+IAkJCQkJICZ0
aS0+c2htdGlbaV0sDQo+IAkJCQkJICZzY21pX3RlbGVtZXRyeV9kYmdfc2htdGlfZm9wcywNCj4g
CQkJCQkgdGktPnNobXRpW2ldLmluZm8ubGVuKTsNCj4gCX0NCg0KVGhlIGZpbGUgaXMgbmFtZWQg
dXNpbmcgdGhlIGFycmF5IGluZGV4LCBidXQgdGhlIEFCSSBkb2N1bWVudGF0aW9uIHNheXMgaXQN
CmlzIG5hbWVkIHVzaW5nIHRoZSBTSE1USSBJRC4gRmlybXdhcmUtcHJvdmlkZWQgU0hNVEkgSURz
IGFyZSBub3QNCm5lY2Vzc2FyaWx5IGlkZW50aWNhbCB0byBlbnVtZXJhdGlvbiBpbmRleGVzLg0K
DQpQbGVhc2UgZWl0aGVyIHVzZSB0aS0+c2htdGlbaV0uaW5mby5zaWQgYXMgdGhlIGZpbGVuYW1l
IG9yIGRvY3VtZW50IHRoZQ0KZmlsZW5hbWUgYXMgYW4gZW51bWVyYXRpb24gaW5kZXguDQoNClRo
YW5rcywNCkZhecOnYWwNCg0KDQo=

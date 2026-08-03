Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11012026.outbound.protection.outlook.com [52.101.66.26])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC66F344D91;
	Mon,  3 Aug 2026 22:57:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.66.26
ARC-Seal:i=3; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785797872; cv=fail; b=kDPFZ+B//VLaK8Qg12tWsc9B0K6oOxZOsKSshlNKkOf3PzMlkBzTvj6nYp1h7MXZ/PUimkbcMml3oiCeSC1K5fXE/epREuVP/cRX8saZ5FgPoGjuA15FqfqoC1XRcXHuRK3Qo9agohJBcdaGyv886bPz5DVXH8CsCpX9a4ZMuiA=
ARC-Message-Signature:i=3; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785797872; c=relaxed/simple;
	bh=DqPoyWhIlfnRFLwWKoUbMx+WqodHoKZ/smT8hmyb8Ak=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:Content-Type:
	 MIME-Version; b=R3N85X3v3jBcWTm2zhEu3atCTtxLTsAryXTj7zWU+TSsNMxYOmqhGgpBK0f4tZONvOFFkgjHdd8r90xBvRYkzUGp17LmJQob8mD0MlbOky8mE1Z+rOp7dfITwgAMZ9HO1O05qhtMi0mK6ptVyxcqQY5fUc2TqEaqrHmjPZjFsz8=
ARC-Authentication-Results:i=3; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=ahImF4ei; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=ahImF4ei; arc=fail smtp.client-ip=52.101.66.26
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="ahImF4ei";
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="ahImF4ei"
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=WJNJuYRZnRULN+Xf5tRelUQJEJXWD0NaetnTCUDZdS9ybx5OsK+cCn4SQsa6LVbsO72/MPEFOTm28Euhqp9tlhhFJ3mx9X15oa7qnSAvlPIpr8CYxeIxMCZ3qtlpwp6feFdmcYG4PuAmMGfb9DgsjQlvho8+tRXuNjP27K5a+KFxsIrpgd9zGgPjhDkaPn4phNl0c01teIKNTFRefFNXuC3YulxJPQrPPyG00kZk/sP1l5TK9rHyj+JeBQIMHxdy91AbuEYCxL7LNy7jMkKLLndVr1rxh90CpqSd2gsMJcEth6B7P6TnjxTUk5W8u8WPhyg/wJWdDbT05CshpsDw6A==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DqPoyWhIlfnRFLwWKoUbMx+WqodHoKZ/smT8hmyb8Ak=;
 b=gcAUPQix7FooepkbsCXSPb2/tG5VdmeMkKJTnAQmv/X+1SjL5yqa8sl2qpbnPFePy6hLxqhfswxCB980N7RKTT+/5BLOXgbDz3m7PwmXSH2rkqCAJOAtp7nhDRt0uD7JZ1i1ZdInHCFHmUMAu9riv/S017PrPzNZXg5SVNmq/FK5oR8ZjQeTuI3taPkKCLw41MJGAJUimePaNLU365LO0zdjcwM48v1S9xMxMmU7dglRjGtbizV90nCoWaCN++dwgjNkB50/iedpMn88eLUKTJn1izqbn7V07Am7VpX1SKfOjaNRYE4k7nI+00JiIqX2HVIFbeP+8RT9xkHXjOlceA==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DqPoyWhIlfnRFLwWKoUbMx+WqodHoKZ/smT8hmyb8Ak=;
 b=ahImF4eig/Bf5hvhI+1YjH7K3DH4wRLlVng6bP2Vo1WR5f6vTq4Q4kg4X4pFcrF4nz0surOHDPwMoWoo1OaTOWuj45IDTKM5Z19RqCG0CKJNpPsbKAysHm5hCq6XnlWWPWV6vbah2QDXnfEICQJwOHaqQw1zcHjroeU7i8E0Gxw=
Received: from AS4P190CA0001.EURP190.PROD.OUTLOOK.COM (2603:10a6:20b:5de::7)
 by DB9PR08MB6697.eurprd08.prod.outlook.com (2603:10a6:10:2ad::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.18; Mon, 3 Aug
 2026 22:57:44 +0000
Received: from AM3PEPF0000A792.eurprd04.prod.outlook.com
 (2603:10a6:20b:5de:cafe::4d) by AS4P190CA0001.outlook.office365.com
 (2603:10a6:20b:5de::7) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.270.18 via Frontend Transport; Mon, 3
 Aug 2026 22:57:44 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 AM3PEPF0000A792.mail.protection.outlook.com (10.167.16.121) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.292.8
 via Frontend Transport; Mon, 3 Aug 2026 22:57:43 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fX49UJ4mE6UichRnJIP09pJ5fc1NFCSS7GzUz0z1+sq8g1RVqHBTJJ+6cBtWF4XFjkhP+m1CmlsKhi/annwPAod6zqYkjYarj2BoMjhRBUtKH8c5A2nhdvmZT/Lv+Wcin+R9u18B01NAGJZ0nELO9nSOrQ0hMq2tOv+rTDn67lmkUroMH5HY7Ei3FGXbCLBgMD+4s2mRrsOizKygGnqUf8xarTz8tf8S6ewu2ku5s/Jb7rF5LYZzu3Wdo+ZQtSoT34a0PT0u9EcLvMmkc6VPGVSxtL86pEs29/xd8Qv5mhy2UhZBS1FUumOQA21iwgTuCyaM+v2U1SoYaOn8le7Gtw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DqPoyWhIlfnRFLwWKoUbMx+WqodHoKZ/smT8hmyb8Ak=;
 b=RkNGb4b0DjEdnqlPTUNMAf/xOoerwp8/Dk0gShET6UgXXfmK1bTAyK5dHXMZVPEU8NBb1f7suD3mFjSMBP3bVAVKMBnrxB0HktOELtNNLXxG/RB38AYuv9RkrItH5kjLgo9oYuGH1dJS32GxI3gd44zDixfGMecAPwcr+u+AdkVS0+/QwmXY+RI1sn3cp3/QlK22gxCQ8OnML1eJdbqaNrG3l4Ap5tNbPsfMaorhp72b+WYkr6fbcpU1sQXEMivLSBjdJZr7eMowBgXX02eo2rZ0cKWhXIViJxEEad/MSCv3yXja3TaMogJS/8ZlvUWcY4wJAu5wceTVMO1kqmCA2g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DqPoyWhIlfnRFLwWKoUbMx+WqodHoKZ/smT8hmyb8Ak=;
 b=ahImF4eig/Bf5hvhI+1YjH7K3DH4wRLlVng6bP2Vo1WR5f6vTq4Q4kg4X4pFcrF4nz0surOHDPwMoWoo1OaTOWuj45IDTKM5Z19RqCG0CKJNpPsbKAysHm5hCq6XnlWWPWV6vbah2QDXnfEICQJwOHaqQw1zcHjroeU7i8E0Gxw=
Received: from DB9PR08MB8651.eurprd08.prod.outlook.com (2603:10a6:10:3d1::9)
 by AS4PR08MB7503.eurprd08.prod.outlook.com (2603:10a6:20b:4e7::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.18; Mon, 3 Aug
 2026 22:57:09 +0000
Received: from DB9PR08MB8651.eurprd08.prod.outlook.com
 ([fe80::8fb8:7cf9:49c4:6f90]) by DB9PR08MB8651.eurprd08.prod.outlook.com
 ([fe80::8fb8:7cf9:49c4:6f90%4]) with mapi id 15.21.0270.016; Mon, 3 Aug 2026
 22:57:09 +0000
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
Subject: Re: [PATCH v7 17/23] firmware: arm_scmi: Add Telemetry debugfs ABI
 documentation
Thread-Topic: [PATCH v7 17/23] firmware: arm_scmi: Add Telemetry debugfs ABI
 documentation
Thread-Index: AQHdI5tpBXyZaXME7kq++quwQx1s8w==
Date: Mon, 3 Aug 2026 22:57:09 +0000
Message-ID: <371AB8E2-05D4-41A6-8470-91B2C10E89F0@contoso.com>
In-Reply-To: <<20260802145618.1952804-18-cristian.marussi@arm.com>>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	DB9PR08MB8651:EE_|AS4PR08MB7503:EE_|AM3PEPF0000A792:EE_|DB9PR08MB6697:EE_
X-MS-Office365-Filtering-Correlation-Id: 67089498-bf02-43fa-0b41-08def1b2a0ec
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|1800799024|366016|376014|7416014|23010399003|6133799003|38070700021|18002099003|22082099003|3023799007|56012099006|10067099003|11063799006;
X-Microsoft-Antispam-Message-Info-Original:
 ufj5vG5VcYNo9ovpB/NtlstL3jB6qeqzn9D3RX4FGhs8+7usAOSiJKYgC1DFKSwyVqmmvTpyBGkBBy+mLDS+DDOuD4TJc/7yBrwkZRoB7Ge99R/bMZW1rGh8jUzMYdVlwxgOCCOZOMJGXNJLAZ3RrPiw7doqaP+8R/5pr7rKbpaBlxAOQMD0ZMoByMoX5LsTbBbm4+Dk5t3UWYdBLz3ppHwRevZp9v+rCl1BeISWXL9j49DyybKsPJL9t9QhKRVeMjgjW5mii6mI65A+6RWlKxZ9gDs3XR37VyEnxHwF2SFudZv8+ADLR82bEL+nAqJs2NIPA5hEzDYfA3zZSqNepb0+ux1YguA29pvB7yzUHk76iFu5sjN2GlxStCQb5caelAbEnSx3sB/9D8M/mziFzV1yAnm6E1FLrh9V70Dw9MT5H6+aXhnNyMxvQZSBw8hHa0ewEQWuwVvB/vHqx6oH4Cyg92qJVYnPdqdnraW9ghTh8/r/Ym6WfqfQHyzqtpeQnfUWRB40FoRVJKVsPjPkxsG/BFoqkpt5CtWE/+jG4N47R68mIhhJrJRYVkG6vPWAgwEGNSysa9/eMoVj4cd5lFPrkYSpLiSO1AeIK0kIORZOJlpnMZ/u8wcdL9hOmCj8eRj1tf/MDzqcRygPEBYEn/E0WxFp9HQ62V+c1AMJbHZMuVEw96uEeJUk+8BSPf1ygEm9aEuZI4gYpdXSABtpNpi80pe14sf5TEWNmnITJV8=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR08MB8651.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7416014)(23010399003)(6133799003)(38070700021)(18002099003)(22082099003)(3023799007)(56012099006)(10067099003)(11063799006);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <D240FBE537A35F429B6B6047244EACA1@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: arm-scmi@vger.kernel.org
List-Id: <arm-scmi.vger.kernel.org>
List-Subscribe: <mailto:arm-scmi+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:arm-scmi+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked:
 psx4KgrSYs0tVMu25lvbWSiOLaUeLacOyPj92yE2n/5B7+2r4rWxwTVHEb4p9KiVLnEAyEstnrOe/FVA0ijKEQdV/wvAGGiMAeIWPSJMxBhO10rOOklTGFLqeBsTrSFwje5KNm6B6QIBvbgQPp94AioHvbO0bCnAKICPLrvhCU3/lJp7EBEBZSZbCqppfvDCRgvGH8/0MFPNdXRUhu+QFMC7IblUyTZ8x94S4KR2lAYLXMULyn4vwkpu7gYw1rDhdBeNHXRvBHRFKIHv8oDXfrSMWuTyq+kefXHhQRbCMHhUQX1qFb+fn5WLbcvxQJxpjFziCZeXxPjmKdqhYaLaaA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS4PR08MB7503
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM3PEPF0000A792.eurprd04.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	229447c5-f257-4b8c-cd5c-08def1b28c6f
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|35042699022|14060799003|36860700016|376014|1800799024|7416014|23010399003|6133799003|11063799006|3023799007|56012099006|18002099003|22082099003|10067099003;
X-Microsoft-Antispam-Message-Info:
	2Kr5jqSe2+rc8F3/Zka6JcGq4yIieoJUnRXf3KCMtagtsVzVR8rv1t3iAF3aaagIfSHOwJ2tcvoON1ql8UWM5fxGFTf3bwfAoMC40p5eR3FhnP6JsTbRJ/gCKlYryY2U/7ZQ7lgtH9qfiO/AgUykSl4b9B//MXBfIfT+iiiUFNc4CbzEs1He7UTCaHefdmjnAnSK0e1sBlAiVvLyTM3UB1jV5jdcORhFeHgRIV4JOnE9LGZ/7AppysSKancY7L7i73b2UTQVoZVY9Yct3iyksCUsZbsvFwC9B4BsPtCPTVGMX9EXycx7QUb6p2kU3RI0lP1OztPRuEz2YIpHCwGCgoSan4mNNNAY8gpxXS1r+k6M7XHYGM0iguSAxSiqvXW9QqMy83VGhOHDfM4sDzN2Cnzs6v7PrUQP0VikjdWOYAkFvRf1C1/7xF6dOdUtzmstlK02FJCrv2FOU3hkscuEJfUDfl4jnpaVqeXy/CmetQHL1OB1/Uv8uTPksnc+BuBq3umG0ynq9Cd8tWPk+p+zd9cwL3f0xGzlM3/ygoJ2E+hD16GkQmr82XRaHGZSLLeCOhvIlTnb5fqRm2HuQvSLU6Grb5t+Hykjr/sBONZfI19iY+0IGylGw78exnRO7+m0rVxmWb2qssQv47w1+tNF0+Cg7g+ntNvOXZhEt2q00sfXt/sdZDuzGbsHugGbyQtqr4b39n637t45wvP2TaFoyA==
X-Forefront-Antispam-Report:
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(35042699022)(14060799003)(36860700016)(376014)(1800799024)(7416014)(23010399003)(6133799003)(11063799006)(3023799007)(56012099006)(18002099003)(22082099003)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	E/a91BTfeD/yKTooJwC4z2h5CihKvrlLLBLh0OhUzHXR0hRM1TFBb8UuNIP88q/hlgvldgTetbZuw3XB1BHac8il02IZDGwmSUHLX4KNBgYb1PsYw9e8V2nt/WINjzB4yWc79O9rd+MbwETbq4LTHibjk1SFw94sVISPkEp3w0ASpTHN6t3tNWE2yWlD5RelYOfJ4uIlrym7PjtGeiFtJau9qbCLOXKZJ9YpW05kgvEM8dCRLWz1YyNTLN/AkLV5zv7nIq9MneA/25QxLyYaFnYJ8yS6Di4UpnhXZLREYvI7yBP6riHFTGYvmQyWec6QAv1IGU2JZ2+I2f1keRxFi0u8lobD02Nk1UC+RlmyzTksyTwSKvftR27KWjFOn1SnejWB1asZSh0fSSkcT60ZzKpbQK1ebgPt686R7CdbyScgcsbSWLSvQI+pymjRDErB
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Aug 2026 22:57:43.8593
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 67089498-bf02-43fa-0b41-08def1b2a0ec
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM3PEPF0000A792.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR08MB6697

SGkgQ3Jpc3RpYW4sDQoNCkEgY291cGxlIG9mIGRvY3VtZW50YXRpb24gZGV0YWlscyBpbmxpbmUu
DQoNCj4gV2hhdDoJCS9zeXMva2VybmVsL2RlYnVnL3NjbWkvPG4+L3Byb3RvY29scy8weDFCL3No
bXRpcy88bT4NCj4gWy4uLl0NCj4gRGVzY3JpcHRpb246CUEgc2V0IG9mIFJPIGZpbGVzIGV4cG9z
ZWQgYnkgdGhlIFRlbGVtZXRyeSBwcm90b2NvbA0KPiBbLi4uXQ0KPiAJCW9yZGVyIHRvIGR1bXAg
dGhlIGxhdGVzdCBzbmFwc2hvdCBvZiBlYWNoIFNITVRJIG1lbW9yeSBhcmVhIGluDQo+IAkJYmlu
YXJ5IGZvcm1hdDogZWFjaCBmaWxlIGlzIG5hbWVkIGJ5IGl0cyBTSE1USSBpZC4NCg0KVGhlIGlt
cGxlbWVudGF0aW9uIGN1cnJlbnRseSBuYW1lcyBlYWNoIGZpbGUgdXNpbmcgdGhlIFNITVRJIGFy
cmF5IGluZGV4LA0Kbm90IHRoZSBmaXJtd2FyZS1wcm92aWRlZCBTSE1USSBJRC4gUGxlYXNlIGVp
dGhlciBjaGFuZ2UgdGhlIGltcGxlbWVudGF0aW9uDQp0byB1c2UgaW5mby5zaWQgb3IgZGVzY3Jp
YmUgPG0+IGFzIGFuIGVudW1lcmF0aW9uIGluZGV4Lg0KDQo+IERhdGU6CQlOb3YgMjAyNg0KPiBL
ZXJuZWxWZXJzaW9uOgk3LjMNCg0KVGhlIHNlcmllcyB3YXMgcG9zdGVkIGluIEF1Z3VzdCAyMDI2
LCBzbyB0aGUgQUJJIERhdGUgaXMgY3VycmVudGx5IGluIHRoZQ0KZnV0dXJlLiBQbGVhc2UgdXBk
YXRlIHRoaXMgbWV0YWRhdGEgdG8gdGhlIGFjdHVhbCBpbnRyb2R1Y3Rpb24gZGF0ZSBhbmQNCnRo
ZSBrZXJuZWwgdmVyc2lvbiBpbiB3aGljaCBpdCBpcyB1bHRpbWF0ZWx5IG1lcmdlZC4NCg0KVGhh
bmtzLA0KRmF5w6dhbA0KDQoNCg==

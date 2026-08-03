Received: from MRWPR03CU001.outbound.protection.outlook.com (mail-francesouthazon11011033.outbound.protection.outlook.com [40.107.130.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03D5A21C16A;
	Mon,  3 Aug 2026 22:55:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.130.33
ARC-Seal:i=3; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785797709; cv=fail; b=ZLRsLfjnk+GkU6oyjuVxMU6H67oz2W5/YcNnV9t5Gj2lzpt/xfQiy6L1iR/09RtA3PWrHyG3biE4+ntcb/qJpcObc8kDa2YKcfbj/1dxsLBLkyLOvWQJoEVky4yUKcg+4k1jaYiEmxPDsJtDX/Pdn8twcIZ93Hl5A/BvmilCYO4=
ARC-Message-Signature:i=3; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785797709; c=relaxed/simple;
	bh=7YPiw+llDl8XKzS7/bBL6TDdZPr5TLp6/U+NiY2BzOE=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:Content-Type:
	 MIME-Version; b=RDXu6HZ1kI9u8+syFyQgCPBxE00heILMgIMrR+yDYtDRSQOvE7TrsTCnQL8mYAVDOHvU3b3l2Ejn277o0e8c6gsBV1mgxyD41IgWSE3SKKeyXVk4K83+N6v4ctEH2dhBri06Q98ABYBhyCGnlJo1e649yCHkLfcywiJmEEUOowE=
ARC-Authentication-Results:i=3; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=eH18ZQ+A; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=eH18ZQ+A; arc=fail smtp.client-ip=40.107.130.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="eH18ZQ+A";
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="eH18ZQ+A"
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=lnRoPtgD38KKMgu0D3uSYuisd36VEBrC9y7CZoxiXSCmKAnHCsVe+Tyw/xtbiSQXX+NMueObLPdGIpfTZRzYmtNP5B3CUOaiLqaeytS0i/r6r/xFryQQ+UfLWxSIDOa84BMSdhUweNTxC5Khr4dIxlh2swEV5yqro0UHIeh7NdoMZxW3dCBRwWKR88+Kgm/v53FDF2JF3I15VKG5elIvqriukdhxUPVhF2yTnYcnGOUjAfg08aT0wkHbH+Y1viAKv5bI4m5iZT1aIMZrSL7CasUJ1o3rnf9rrInb9jD2GRaladBxQ5Ukq2AOdyu5AmScsLp7peNWC2dvyBQcqVVJ1w==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7YPiw+llDl8XKzS7/bBL6TDdZPr5TLp6/U+NiY2BzOE=;
 b=mmlMQxCdRJ2bPww0Pn6+eYYirur81lN9NrPvJos/Hp364qL4ymJG3PM1/Onct0jzyaUPVd4dRqyK3ibvnu9ZwBfS1jzbmHhdlJmr+rNgXmAZ0Gg6GrZIiMN7WjbQSlNR4ru6HcG42qMTWuSLq5jWWw9ZseR0AWfV2Y3QM7uYejM7Q56AIi9esjDgRzHGbTk8t3X1Fmw3DuarregUis+Xu4dFH6TIpJAy60wB9mahBVfcM6DijvagX0FRijeijzkPADCaVyn8D85cRewE9/XiE0if7XRWdqpS8oOt966F4QMa6sVlKhQNdsRoA8CipYz2Bw1eUBumcvkRTm/UsFq5Gw==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7YPiw+llDl8XKzS7/bBL6TDdZPr5TLp6/U+NiY2BzOE=;
 b=eH18ZQ+AQfRqG7TfhPPs82OHwictme5ot43W4LYF96DwieciBuWK//Esj6a9Us1A/rdjY8ROoHTUTNO3UNkV2bbqrnDtyNpEPLeRCZoF+LKtCgb9ZVuBTyA0y170ENtdqJ28BMp5MNNu/e8pt79q0piDvwEa7wFJG9kXa3dx49A=
Received: from DU2PR04CA0259.eurprd04.prod.outlook.com (2603:10a6:10:28e::24)
 by AS8PR08MB6341.eurprd08.prod.outlook.com (2603:10a6:20b:33f::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.18; Mon, 3 Aug
 2026 22:55:03 +0000
Received: from DU6PEPF0000A7E4.eurprd02.prod.outlook.com
 (2603:10a6:10:28e:cafe::93) by DU2PR04CA0259.outlook.office365.com
 (2603:10a6:10:28e::24) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.270.18 via Frontend Transport; Mon, 3
 Aug 2026 22:55:03 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 DU6PEPF0000A7E4.mail.protection.outlook.com (10.167.8.43) with Microsoft SMTP
 Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.292.8 via
 Frontend Transport; Mon, 3 Aug 2026 22:55:03 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cy0L15mICNc9sD+ZdqLyxUfA/aUZv7fDG3roylo3kTcCqcDCvcTrz2b3OjWclg6SMYS6xO8DObFHgZWlr5OHCoZwMDmSIaZWl843+PV6eJtOoPkK1Ojv8DLzCy02is4bTml/SXiu/2gKWm+0lw+da8/dYyW8IfqxwQ+iEGBPJI8VWB8vtKh+TKmzwDxhURLF3PHdFiJWhg7cgRw1SFM4n7TSO5M14og/rPQjGcz7IE+h0UUdVj5DdN2koMuhxGOfb9IYS2gmts/ipHLdQITGJRbmqBpeoK5UsazxlX+4C1DD1K2XDTDn7QxH/9D1bGaNs3ovB9jxBq0UDMSZPLBJzQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7YPiw+llDl8XKzS7/bBL6TDdZPr5TLp6/U+NiY2BzOE=;
 b=nb4Yt6B6WjpOH1RX/4kj9TkY7yYHPhiQ5NJLQwf/ZoSByYKQnO8uFBYbQw3k1wgPbomhZKYClunob0IFNm1WbYSU+mBRkgo/pWAccqLNDZjtCOiJOn3C1s5S7f1Wb8yJVtZ3XQ/fM0cFM8fTAT6KGvUvzXuY9DDSPDpgTEe0sM1eF7U64jr7flBsUAmRgf8V0ILt0Sb6ufxm+H/ptPuCn1M4TB7Kz3IF6Z84Qc0n7hyPrTpJDBodLllya7gnyodPph80bpYhMndQowhwHkFKuv57YYbIcgFOrS8bsm+EFd8Cf0L0GNbFGvbVUP9xC/8I53pcmph5hiZYMfpg1lN8uw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7YPiw+llDl8XKzS7/bBL6TDdZPr5TLp6/U+NiY2BzOE=;
 b=eH18ZQ+AQfRqG7TfhPPs82OHwictme5ot43W4LYF96DwieciBuWK//Esj6a9Us1A/rdjY8ROoHTUTNO3UNkV2bbqrnDtyNpEPLeRCZoF+LKtCgb9ZVuBTyA0y170ENtdqJ28BMp5MNNu/e8pt79q0piDvwEa7wFJG9kXa3dx49A=
Received: from DB9PR08MB8651.eurprd08.prod.outlook.com (2603:10a6:10:3d1::9)
 by AS4PR08MB7503.eurprd08.prod.outlook.com (2603:10a6:20b:4e7::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.18; Mon, 3 Aug
 2026 22:54:30 +0000
Received: from DB9PR08MB8651.eurprd08.prod.outlook.com
 ([fe80::8fb8:7cf9:49c4:6f90]) by DB9PR08MB8651.eurprd08.prod.outlook.com
 ([fe80::8fb8:7cf9:49c4:6f90%4]) with mapi id 15.21.0270.016; Mon, 3 Aug 2026
 22:54:30 +0000
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
Subject: Re: [PATCH v7 08/23] firmware: arm_scmi: Add Telemetry configuration
 operations
Thread-Topic: [PATCH v7 08/23] firmware: arm_scmi: Add Telemetry configuration
 operations
Thread-Index: AQHdI5sLLg9cyK++h0ma/jRCGIoQpg==
Date: Mon, 3 Aug 2026 22:54:30 +0000
Message-ID: <1E14B66B-A2A3-4FF7-8178-D27433A316B1@contoso.com>
In-Reply-To: <<20260802145618.1952804-9-cristian.marussi@arm.com>>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	DB9PR08MB8651:EE_|AS4PR08MB7503:EE_|DU6PEPF0000A7E4:EE_|AS8PR08MB6341:EE_
X-MS-Office365-Filtering-Correlation-Id: 08ccc7d9-1972-4ec4-aac3-08def1b24148
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|1800799024|366016|376014|7416014|23010399003|6133799003|38070700021|18002099003|22082099003|5023799004|56012099006|10067099003|11063799006;
X-Microsoft-Antispam-Message-Info-Original:
 h5CbhIcw4mc5DeNReLqK5HDHcxzm+sikqGgB2AqopWfl31Spqbdr8+1Pmdg21iTaiB85Ki0RkRFQfdPpCiTQUXjMumOsld8J8iy/bZqURlUxoqYcIJetCfXAbJn9vpb6v+9mTvsOMwaDEBAIwasxDmM9v1ACOsjL2d6kefoAtpULflxI+f1hX+15hn4+GaNo4/gpmb0wMqglc1Hyw7+7MynmL4wVbuse13zeTgVaVsho+AhlKO1znLMVhMgZ5SpsQUw1kfd2ws0JTCyExO5xIP/EUN0vMdhuGIctgfrRk7YXzFSG3l//R7zyQ6TYyqiUsZocpZFsfI3mHYSPHTSjqEFiPSLyndCLJ4FgH4lyOHj/flITgoHhWgG6dtGWxzKgyiSejiy+rrdFxBr7YtSfkWjX70NDkZ1hva0rUn/h6/akWg9utWdS3MPKmEtycAPTK6nZF9VWorm0TQ70w8E2XBqW81uqfwZmi+U6TL3PU9TrDBqYBMKs1PUGfiHDZfE+XJmY7zFJpK7E/B3+YnQSfwE1Zh/QfiENmnMYslXg3MC74bwdRLc4/5Oei4b2ggJKLyvGvRRA+oU6gRvg3L34QIKR/nm3SMz0GpwgDji9e5YA1uyksnMh2xj000/lRz0TGnjBScHUQMFrjqWpIW0ueUWboQck9z2tDY28A+uNNAWdCg0FBrMZwkLx6mCphpgTZU7O4U+NRHzoV15/rH7E/f8wUTV3Zs5ho4TU/ccLQSw=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR08MB8651.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7416014)(23010399003)(6133799003)(38070700021)(18002099003)(22082099003)(5023799004)(56012099006)(10067099003)(11063799006);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <702A960BCEB5B246821707F17453C20A@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: arm-scmi@vger.kernel.org
List-Id: <arm-scmi.vger.kernel.org>
List-Subscribe: <mailto:arm-scmi+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:arm-scmi+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked:
 Ei+kKh/p1EooQyXU6aH6TZYO24eT+HfIXYhs4HMz4D0zJlGtUZBk88/gBMq2SZxGYf5Y+T99rXH+iCaUYR4Z1tPvHfu5Rc1CXRnNjHCth5ObKR1DYqJeRXrNbbQnfK6qYQZuHpBqbALNvKdCH+pFzHafZJ5UbrhEO/LyOMCx4xANEX9LmVpuWMxzcJzsAVTHhAH0POARtpP1Jbt/pulIwpV24UnyBBJKtickC0nf4QVEqM0ArhGjikre1IHWp0dwkid7LE0LgKJ9JIo7+niJDoNF9UBoflwDhyYPoQXvRawVn/s2ZEYd9c3XLjnbtye2DN4Z/cG1dI93ZW/Ji3mjvA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS4PR08MB7503
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DU6PEPF0000A7E4.eurprd02.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	fcb922b2-1aeb-43b1-8619-08def1b22dd2
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|23010399003|7416014|1800799024|376014|82310400026|14060799003|35042699022|56012099006|5023799004|11063799006|6133799003|10067099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	u7Zc28RsS8m9IAju7BmLSem8xrzP7ZGa0pCAI52V+/7swYx9e2fU5cbVMJWrb+jZHjpJd1HngbG5TxaU9yd+sGauMLaA61JXHY+6eIR56VsOT0fh65B8Z3vYYgoMzQ6T9M97fpBTSHMGYFSAFm/1PxUKXNkPzqEkvJO9PkkFBzaAIKni0IXl3BVCV23iAn+LfP5xYqTjr5vzvCBTR/lQVnpMZUKECy29qmMfRwGs9+O3TaUS7m6aVbZ3a3ZoRWMrTMOqZkBXxURXpI2aJ/8bkrGNwXsd1yH7dg+03TAoL/akV3PR7uzx13uSOmgDQucZmosjH0xsHLCqFxWfVnOol2S3QcFLG8xbuD6EzN5MBeCPACs1qL8/M6WSwweSbsOf74CLnrwuEeRsg0UfSXsDtEgzlh/IBWQWIDxWtl+h9Jqk17RzuT1yHFSqG+LFfcATeCn+1sU5PsooKRxyKMkpoGv/bQHLkESpE5EjS5oJPTfRgGz2RD0YkMR4Y15HvqJ/9rYxe9sEm+ieHI8ho0G55n5TXHjxuIiI4hppjjq20lzkK5KLyfkjcdwApNc+mMTBWqEY8aJA+unCBmWYuuJlnT/gCaprJyxxYmQQ1S8fl7fJNyWYdKD/J42cZdJbQylEBag26sZe2CGprxi91OD4zR76rcJsU3DcTfwP7F1Ui7o0zldjZgBj1EMuci9tjKspd5PAI+R3ZSXDGS7+Qp1Cxg==
X-Forefront-Antispam-Report:
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(23010399003)(7416014)(1800799024)(376014)(82310400026)(14060799003)(35042699022)(56012099006)(5023799004)(11063799006)(6133799003)(10067099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	IY3dGIUoJAYi02uBhrSoNuDA9sQP7oNv5nA7W+WkCfovaEALIYhB4qx5kIbtNMTM0WYXS6TqHPaE6M/vYgYGrJe+b3rvXswfTmi7cxHgc1FyjZ8mDoqbxBv0FhTX7i/UfqPqZzHfrhBBtLhmXVm2wPNW0yU1/wEp7E6bQXafItlNpQhGqzjGKVU61Scvi0MkZPCEQW7ySD2AGB57nNITDtmmO15VPcS2GyHGUARVaROaoOcE1ZtGvbaYNyRs6DnupLtqDTb6RJSsGwLfs6xdn6aP69U66KFMeJdp8SH5RvvnVSEuhY+FWN5sZie5MWJTVMqjfch12F2as7+t1w6XhU3B4qKw9IrHCFaHcoCOcfpLmPZtNXYQO1OzmlDXMoapcrmnYBpv0KqlSdy9lSJSoO5LQ9bhCf7er8mQ02G+rq6oHzFV3ditJJjI1L4EMw5x
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Aug 2026 22:55:03.3934
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 08ccc7d9-1972-4ec4-aac3-08def1b24148
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DU6PEPF0000A7E4.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6341

SGkgQ3Jpc3RpYW4sDQoNCkkgZm91bmQgdHdvIGNvbmZpZ3VyYXRpb24gaXNzdWVzIGlubGluZS4N
Cg0KPiAJaWYgKCFpc19ncm91cCkgew0KPiAJCWFjdGl2ZV91cGRhdGVfaW50ZXJ2YWwgPQ0KPiAJ
CQkmdGktPmluZm8uYWN0aXZlX3VwZGF0ZV9pbnRlcnZhbDsNCj4gCQljdXJyZW50X21vZGUgPSAm
dGktPmluZm8uY3VycmVudF9tb2RlOw0KPiAJfSBlbHNlIHsNCj4gCQlzdHJ1Y3Qgc2NtaV90ZWxl
bWV0cnlfcmVzX2luZm8gKnJpbmZvOw0KPg0KPiAJCXJpbmZvID0gdGktPnJlc19nZXQodGkpOw0K
PiAJCWFjdGl2ZV91cGRhdGVfaW50ZXJ2YWwgPQ0KPiAJCQkmcmluZm8tPmdycHNbcmVzX2lkXS5h
Y3RpdmVfdXBkYXRlX2ludGVydmFsOw0KPiAJCWN1cnJlbnRfbW9kZSA9ICZyaW5mby0+Z3Jwc1ty
ZXNfaWRdLmN1cnJlbnRfbW9kZTsNCj4gCX0NCj4gWy4uLl0NCj4gCWlmICghcmV0KSB7DQo+IAkJ
dGktPmluZm8uZW5hYmxlZCA9IHRsbV9lbmFibGU7DQo+IAkJKmN1cnJlbnRfbW9kZSA9IG5leHRf
bW9kZTsNCj4gCQl0aS0+aW5mby5ub3RpZl9lbmFibGVkID0NCj4gCQkJKmN1cnJlbnRfbW9kZSA9
PSBTQ01JX1RMTV9OT1RJRklDQVRJT047DQo+IAkJaWYgKHVwZGF0ZV9pbnRlcnZhbF9tcykNCj4g
CQkJKmFjdGl2ZV91cGRhdGVfaW50ZXJ2YWwgPQ0KPiAJCQkJbGUzMl90b19jcHUoaW50ZXJ2YWwp
Ow0KPiAJfQ0KDQpGb3IgYSBncm91cCBvcGVyYXRpb24sIGFjdGl2ZV91cGRhdGVfaW50ZXJ2YWwg
YW5kIGN1cnJlbnRfbW9kZSBwb2ludCB0byB0aGUNCmdyb3VwLCBidXQgZW5hYmxlZCBhbmQgbm90
aWZfZW5hYmxlZCBhcmUgc3RpbGwgd3JpdHRlbiBpbnRvIHRoZSBnbG9iYWwNCnRpLT5pbmZvIHN0
YXRlLg0KDQpEaXNhYmxpbmcgb25lIGdyb3VwIGNhbiB0aGVyZWZvcmUgbWFrZSB0aGUgZHJpdmVy
IGJlbGlldmUgdGhlIGVudGlyZQ0KVGVsZW1ldHJ5IGluc3RhbmNlIGlzIGRpc2FibGVkLCBjYXVz
aW5nIHJlYWRzIGZvciB1bnJlbGF0ZWQgREVzIHRvIHJldHVybg0Kbm8gZGF0YS4gQSBncm91cCdz
IGNvbGxlY3Rpb24gbW9kZSBjYW4gc2ltaWxhcmx5IG92ZXJ3cml0ZSB0aGUgZ2xvYmFsDQpub3Rp
ZmljYXRpb24gc3RhdGUuDQoNClBsZWFzZSBzZWxlY3QgZ3JvdXAtdmVyc3VzLWluc3RhbmNlIGNh
Y2hlZCBzdGF0ZSBjb25zaXN0ZW50bHkgZm9yIGV2ZXJ5DQpmaWVsZCB1cGRhdGVkIGhlcmUuDQoN
Cj4gCQkJZGVfb2ZmcyA9IGxlMzJfdG9fY3B1KHJlc3AtPnNobXRpX2RlX29mZnNldCk7DQo+DQo+
IAkJCXNobXRpID0gJnRpLT5zaG10aVtzaWRdOw0KPiAJCQlwYXlsZCA9IHNobXRpLT5iYXNlOw0K
PiAJCQkvKiBDaGVjayBib3VuZGFyeSBmaXJzdC4uLiAqLw0KPiAJCQlpZiAoZGVfb2ZmcyArIExJ
TkVfTEVOR1RIX0JZVEVTKHBheWxkKSA+PQ0KPiAJCQkgICAgc2htdGktPmluZm8ubGVuKQ0KPiAJ
CQkJcmV0dXJuIC1FUFJPVE87DQoNClRoZSBhZGRpdGlvbiBjYW4gd3JhcCwgYW5kIHRoZSBwYXls
b2FkIG11c3QgZW5kIGJlZm9yZSB0aGUgVERDRiBlcGlsb2d1ZSwNCm5vdCBtZXJlbHkgYmVmb3Jl
IHRoZSBlbmQgb2YgdGhlIGVudGlyZSBTSE1USSBhbGxvY2F0aW9uLg0KDQpQbGVhc2UgdXNlIGNo
ZWNrZWQgYWRkaXRpb24gYW5kIHZlcmlmeSB0aGUgY29tcGxldGUgbGluZSBhZ2FpbnN0IHRoZQ0K
cGF5bG9hZCBib3VuZGFyeSwgc3VjaCBhcyBsZW4gLSBURENGX0VQTEdfU1ouIFRoZSBzYW1lIGJv
dW5kYXJ5IHJ1bGUNCnNob3VsZCBiZSB1c2VkIGZvciBhbiBleHBsaWNpdGx5IHJldHVybmVkIGJs
b2NrLXRpbWVzdGFtcCBvZmZzZXQuDQoNClRoYW5rcywNCkZhecOnYWwNCg0KDQo=

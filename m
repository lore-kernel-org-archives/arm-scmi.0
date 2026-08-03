Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11011054.outbound.protection.outlook.com [52.101.70.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C1F521C16A;
	Mon,  3 Aug 2026 22:52:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.70.54
ARC-Seal:i=3; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785797567; cv=fail; b=j69wsm72nQWE61hPA3E15uSR3iM1p+/DdqdWP5SydZrAISaSSjayJHfOrjT2K8ZvCeDgaiio4otma6KW1PLXqx6N1MMiQMoXzRScZewl90/qy7FHCKnNcc8EKvB+OSsMJoohBlr/cprU0GAfLWuFVsW44+8LorS5FTaWzxBMcT0=
ARC-Message-Signature:i=3; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785797567; c=relaxed/simple;
	bh=IO8DqWqgRSnXw8UsW7e1NuPD/OlDEDMCaWd7XoQVP0w=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:Content-Type:
	 MIME-Version; b=PwfIoRrruywX9O9MjOryAgfeMMacsjMu1iJelscRcsSAzrhaYqfOS6POhh7OrrgtAZJ8f2nTIlBlmWKGw9Qp8wSDE+M9JBcWy7izadt7fCC7N0oP/PthX6M5PkyG22HIelz7bagKorn2DuFH/6lRLvxPDZxVe6DZld9OzfU3isc=
ARC-Authentication-Results:i=3; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=fx6rjq28; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=fx6rjq28; arc=fail smtp.client-ip=52.101.70.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="fx6rjq28";
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="fx6rjq28"
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=BhGwkjwxXJyIKFZotgbTS7kOIAmR0ReRqoLjhETeMeLP8368oLkPLQqMKpDamMlXjFhG+p6veE+3iNyrDjBzjlDfm7lSergihrFLlbD8B8u2qcM5Zx4RWkcQqyrtPfeXNfCw62xJDWlvDE4/lzuZzByv0mVrnOpbLNY5Rs6dIq0wrBWdwycgG4i+sZPvI0xIAtS78CJ3fPb01FphD2j0j3DY95t1INSMiR38eA6gdpqt30OaQHgNp8JEdMJHeOA0LZpOVWYZh2XNxpovGsKOuMPiawL/4NFFWAuN+02xaWZZq/gTxGhzCHxMUrZpscP9UfU2M4VOsgTTEk5mUIksvQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IO8DqWqgRSnXw8UsW7e1NuPD/OlDEDMCaWd7XoQVP0w=;
 b=aIbphmaPU/BSTIklqVsjtJobM8N26aBP97ynJEgbJMNIdNhjR/BO5PLJbMDJ7S9nj0wMfwiIHfpq4IttgjqakMi4T9r/K87ZxbI9aD3HTk2x3RpM6dj2ZX81o4ybYoVv2OciGeMEWyBdp84X34p4h6L+0DPVPlDifNlD3vcMIhKUQs0EJ2KldlgbmBCAdhd5+O88NvesyzpyV1hpwRSFPgey5jTARD0Mqu7n6HMkDLkSytGYOWJvIMJB/LEiwkP7uJKX/pnzzempn/tF1Upz2jaN7Xc3vRu/ji55WIs0DugwvfnLS9B1nMnCPdWHQ+RDEeY0tPgVddRtL8BGYDxfyw==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IO8DqWqgRSnXw8UsW7e1NuPD/OlDEDMCaWd7XoQVP0w=;
 b=fx6rjq28lrt3aOtscgI6bFiH26DL4mQge7wDiZ3DnNybem2cesGShqEvesYjhmhkkP9Ejm4LTXqxUrViHcICjyyWKfde32S4gA/kaPDnFPgN8OU8OlQTRyHlhSxJRtQaCfsJGOmPbDIt3FqHW533Yr/6SFWwk7/La1G1GlhdZWk=
Received: from DU2PR04CA0350.eurprd04.prod.outlook.com (2603:10a6:10:2b4::22)
 by DBBPR08MB6028.eurprd08.prod.outlook.com (2603:10a6:10:208::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.18; Mon, 3 Aug
 2026 22:52:40 +0000
Received: from DU2PEPF00028D09.eurprd03.prod.outlook.com
 (2603:10a6:10:2b4:cafe::50) by DU2PR04CA0350.outlook.office365.com
 (2603:10a6:10:2b4::22) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.270.18 via Frontend Transport; Mon, 3
 Aug 2026 22:52:40 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 DU2PEPF00028D09.mail.protection.outlook.com (10.167.242.169) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.292.8
 via Frontend Transport; Mon, 3 Aug 2026 22:52:39 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=B7A0WbCgeGGoKl6pFvt9/RSerIDaOSo9+k5jo9u+2t8Bze1vkDEmfTd0pL2vctxaJGmix+bCHElDK9imHrCyleAhyf/QTnWgxaHk2A8T3Rt18LpdnyylTjYx9pkXB9GkLTGdb0zk1nmt89rU9PMrCSAdNha6jZtBgG65bCyTMC+i2Y9eECa8hoZV+uK10L9edlm1+S9b8TeIg6OOHV8TSTppXAzFN82VpmH2x0gSzZiGYmfoSqzrRkpdjKDTsfTdFkqY4Ua8XiN1JtSK4YM8g1CSr7A7X66sKvUXnz4C4Ll8Tpe4GiTVfyzTdJtycKJpWyAwNLR9AEjs+4yy2Xa64Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IO8DqWqgRSnXw8UsW7e1NuPD/OlDEDMCaWd7XoQVP0w=;
 b=rrZDKHPQvhDz9onRPkM0UNh5BDGyrFPOk/x4a6cfqNrjIPMO61LD1YAi77XF32qJfMGaTr04KrPBLgivmhM3YuAmve7qeXXHnvgENSgM8AW8RlhFp3Ul93D4acEiiJi2ZZHbGn4Voru5DkQgTHgK1/59EjOkccVbwJaTMuWpv3HmHrSNu9haFRXb4H+yGeChf6zxRfoP2mYrmaFzXApMarcGCh4OWk48NvfE83sT6Gd0MUO9M7aLz9Xs09wzma1am1ZEzhH2z0gPMhNlfw7pY9B99u19PKE7vrT7gtAAi99ZKT6r3L8S6BUjMZ/LuXZQirisvcl89E/sc/kp4tRsmQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IO8DqWqgRSnXw8UsW7e1NuPD/OlDEDMCaWd7XoQVP0w=;
 b=fx6rjq28lrt3aOtscgI6bFiH26DL4mQge7wDiZ3DnNybem2cesGShqEvesYjhmhkkP9Ejm4LTXqxUrViHcICjyyWKfde32S4gA/kaPDnFPgN8OU8OlQTRyHlhSxJRtQaCfsJGOmPbDIt3FqHW533Yr/6SFWwk7/La1G1GlhdZWk=
Received: from DB9PR08MB8651.eurprd08.prod.outlook.com (2603:10a6:10:3d1::9)
 by AS4PR08MB7503.eurprd08.prod.outlook.com (2603:10a6:20b:4e7::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.18; Mon, 3 Aug
 2026 22:52:06 +0000
Received: from DB9PR08MB8651.eurprd08.prod.outlook.com
 ([fe80::8fb8:7cf9:49c4:6f90]) by DB9PR08MB8651.eurprd08.prod.outlook.com
 ([fe80::8fb8:7cf9:49c4:6f90%4]) with mapi id 15.21.0270.016; Mon, 3 Aug 2026
 22:52:05 +0000
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
Subject: Re: [PATCH v7 03/23] firmware: arm_scmi: Introduce protocol instance
 notifiers
Thread-Topic: [PATCH v7 03/23] firmware: arm_scmi: Introduce protocol instance
 notifiers
Thread-Index: AQHdI5q0wnQlDBU/p029cQkyPotXUQ==
Date: Mon, 3 Aug 2026 22:52:05 +0000
Message-ID: <B5F86BAB-83E2-4C54-BEC9-7714C865CB7D@contoso.com>
In-Reply-To: <<20260802145618.1952804-4-cristian.marussi@arm.com>>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	DB9PR08MB8651:EE_|AS4PR08MB7503:EE_|DU2PEPF00028D09:EE_|DBBPR08MB6028:EE_
X-MS-Office365-Filtering-Correlation-Id: 0f79af5f-6154-4d35-56b0-08def1b1eb7e
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|1800799024|366016|376014|7416014|23010399003|38070700021|18002099003|22082099003|3023799007|56012099006|10067099003|11063799006;
X-Microsoft-Antispam-Message-Info-Original:
 jqAJ6H0KrY1CI3DbBpcCYFV+ofTjo2v9SWCHCWzNsy9eCsNdCNjizNAi450De6AL1kSIFww/spbdxG1G1YtylaaXwHnNx9x7jxHZyrFi4VbsEdaXfHMPsqdj9bl3Hflbvjcmgv7P1kInkrTZnnbiWX7NWBIn8EtnSCVXhZ0WRuSg0KzSedtbe2sm68VDuxWxggzbNkuXcF+V48h3/FVFn3dCKjslHpS/RawaUVKa7I8Kg8Xsz8hs1UHDL3rT9zkfq5EI4IbiBeVs4hRXvcNAzRbDdMD47cYEwP0NuLLXe0k3ph10tULWGwv0RJ+xt3Mn4uCFG+4CcHv5QilfOxz7wICQ1JEYXJZclr8LeJoNHVrSYS1pkBClNxMQN0IKKN4lEXhroYujEkrAOm73Q8KOzF73k01hZ5zq2QZTz1/6DBsouTN8I4OfeLLOeM2zy17r6z3pQPeabjyIEzps2nRRZCy9cdupE3b5VgRrs7xiLQ9yMlb+j5417ij4Iog8sa/cHAOjgGXA+SouMikKjV9Bh2xOGnq7kCiW8ZrhrmLjs/iQskfDR3VXgGewc4s745j+Im0dTn9mPAtcZZBckmIQrOiG1k482avv64jeG220BoOSyBGpW1ie5uwCy7UaYeBkq+t8scE2m0MPFyoZGSgpoOxvqYgt2idvvmAkotdIdjFT2XcDRO1LwS8A688b9QqWYozmN/73jVO1eHbXM0sKSQ==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR08MB8651.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7416014)(23010399003)(38070700021)(18002099003)(22082099003)(3023799007)(56012099006)(10067099003)(11063799006);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <072209CBE0B4E6479C3A6B2949348BC4@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: arm-scmi@vger.kernel.org
List-Id: <arm-scmi.vger.kernel.org>
List-Subscribe: <mailto:arm-scmi+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:arm-scmi+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked:
 YmAh/FItcXRucwwqhOZsjNExeR+2ou3VB2JxCit28Ah9kVgtu9wc64hy2uK4O0rN7EWFbs0h2xu+VwR9POZyqS2GpJThYQObs4fYeVJ3cR5Au9cEDiwJ/d0bX2oPjNZFa0KN+B4V/Pvl5dxS8wV5tLTbs340640QfGKOZe7Hwagex+mYQ3+2lXhQfe1zmmJIWsIzVyFL5ArLkKOLB5yF3C+CK6gWrk9MNKpvXbNK62kAulp8BDvPNdVriS1gtn+J26vBp4h1El2JKeHsee/GatRGWJ1OZoehsQY8hLtZtZPkIM1Lr8RsPUrmhVrtW+chmpYtNc2WBP+zI57ChLrGfg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS4PR08MB7503
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DU2PEPF00028D09.eurprd03.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	a7ea81dd-ef06-4194-bbbb-08def1b1d74a
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|35042699022|14060799003|36860700016|7416014|1800799024|376014|23010399003|11063799006|3023799007|56012099006|18002099003|22082099003|10067099003;
X-Microsoft-Antispam-Message-Info:
	MQSEKvYjc2mC5OgJ8XrHIbNdbnD11gaHAzUoBDJ240eCpLZgqQ3wnt2i7cKu4WTVSd0yxVDS6vn1fh8zgqIwZddaznRe+0KgHkb0JLc8uQ3ffk3pZ0Oa0aVagY3Rdj4VwwwUngIFJu6j2NHBFfQe+YdhnONu9fSfgWfyvdy+RncN1/ukpDbIIZq8Lk9qlEY79FZ/Zkw0dErKPYIWDi7AXAj1BKdSYftIvMrVEME+PAj+nrdlM6OGvmzPervnGs+qwiwwXjW5eTOfdpQCLc3igTyHqtX/V19Ig04YbNiu7kq5xSyBup+mGoBqjUPSEqDxNSMtHRDrp/xJFiYOFI+f9O9wqLLicmsoO0qGuWJIXppVPCxoZeTduJCjxjV96ciTQqQwRbCdUQY9pIAYBs8RGVGMdZ5FcBNiKWthql1sfQ7FU3valaaDKeU8gdmS7oBVAKoFYUBOO0pMGRVWfTm7ybKLMR1fGr8uYBYPtsofZ+/+c8Gqh4ig5ciMaOJsjNNnr55v/W/A1eUVNCicA3FpNhJOxL7PylmEWih5X24aGgy1dAl7lfXE2l9aFZdZ9biNZNON0E5K9WvUMk/C+pi9xjI2vkAebE7HAEC5OVtesWURTVFVIPwIbgm+rf5TBoQT4u0avJivZrzQqi7I2lyhHEmUL95yCntdQNJ5sjDnPdTMsAm4asIpo0qmkErPjd7tOeSLNIz5Y6oYMgWXUIXx0Q==
X-Forefront-Antispam-Report:
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(35042699022)(14060799003)(36860700016)(7416014)(1800799024)(376014)(23010399003)(11063799006)(3023799007)(56012099006)(18002099003)(22082099003)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	Es+E3oEykTIcyugVYczZ/sAHCJrulp1o4kpQG2gtRpuAzRSS2aMfwy5n8wsuIeYLTeRws35M3Z+NUlVffoCDEA4WjQiY+Ixi3DEX5nCubHMaevXwXT5Oq725EaiylNUidRqAsBSfVPSbg4PRHb4JbX7zhvDQCBP271h2QmxPHhW1MeX1eRlbIAbcFwN94FTLREuCOTL11Gdfsrdm5pW8ryjD+IFhKVkUwAQf9E40p9kMnjLZC0YIYhSNSTA0uHE2f4lJ0+OqUnLIeNLChz8xLi8QUiaRpzRu4ezMec8vThJRzx3YkAHooJx9knDPUREtxt5idxCsXdBeWhlVHH60L4cl3fpOsGpYbMu91Hb3+udMgA82GkcwouddQs88ZDse1wYMjBj0SD2EZEOY1Vs0nK+5yIRxZQ2aIUp4XVJ0RE6I2VwBmKs6SXoE4ABZu/GC
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Aug 2026 22:52:39.4606
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0f79af5f-6154-4d35-56b0-08def1b1eb7e
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DU2PEPF00028D09.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR08MB6028

SGkgQ3Jpc3RpYW4sDQoNCkEgY291cGxlIG9mIG5vdGlmaWVyIGxpZmV0aW1lIGlzc3VlcyBpbmxp
bmUuDQoNCj4gCXNjb3BlZF9ndWFyZChtdXRleCwgJmluZm8tPnByb3RvY29sc19tdHgpIHsNCj4g
CQlwaSA9IGlkcl9maW5kKCZpbmZvLT5wcm90b2NvbHMsIHByb3RvY29sX2lkKTsNCj4gCQlpZiAo
V0FSTl9PTighcGkpKQ0KPiAJCQlyZXR1cm47DQo+DQo+IAkJcHJvdG9fbm90aWZpZXJfbmIgPSBw
aS0+cG5vLm5iOw0KPiAJCS8qIEVuc3VyZSBOVUxMIGlzIHZpc2libGUgKi8NCj4gCQlzbXBfc3Rv
cmVfbWIocGktPnBuby5uYiwgTlVMTCk7DQo+IAl9DQo+DQo+IAlpZiAocHJvdG9fbm90aWZpZXJf
bmIpIHsNCj4gCQlpbnQgcmV0Ow0KPg0KPiAJCXJldCA9IHNjbWlfcHJvdG9jb2xfbm90aWZpZXJf
dW5yZWdpc3RlcihwaS0+aGFuZGxlLA0KPiAJCQkJCQkJJnBpLT5wbm8pOw0KPiAJCWlmIChyZXQp
DQo+IAkJCWRldl9lcnIoaGFuZGxlLT5kZXYsDQo+IAkJCQkiRmFpbGVkIHRvIHJlbGVhc2UgcHJv
dG9jb2wgbm90aWZpZXJcbiIpOw0KPiAJfQ0KPg0KPiAJZ3VhcmQobXV0ZXgpKCZpbmZvLT5wcm90
b2NvbHNfbXR4KTsNCj4gCWlmIChyZWZjb3VudF9kZWNfYW5kX3Rlc3QoJnBpLT51c2VycykpIHsN
Cg0KVGhlIG5vdGlmaWVyIGlzIGNsZWFyZWQgYW5kIHVucmVnaXN0ZXJlZCBiZWZvcmUgZGVjcmVt
ZW50aW5nIHRoZSBwcm90b2NvbA0KdXNlcnMgcmVmY291bnQuIElmIHRoZSBwcm90b2NvbCBpbnN0
YW5jZSBoYXMgbXVsdGlwbGUgdXNlcnMsIHRoZSBmaXJzdA0KdXNlciB0aGF0IHJlbGVhc2VzIGl0
IHJlbW92ZXMgdGhlIHByb3RvY29sIGltcGxlbWVudGF0aW9uJ3Mgbm90aWZpZXIgZXZlbg0KdGhv
dWdoIHRoZSBpbnN0YW5jZSByZW1haW5zIGFjdGl2ZSBmb3IgdGhlIHJlbWFpbmluZyB1c2Vycy4N
Cg0KU2hvdWxkIG5vdGlmaWVyIHJlbW92YWwgaGFwcGVuIG9ubHkgd2hlbiB0aGUgZmluYWwgcHJv
dG9jb2wgcmVmZXJlbmNlIGlzDQpyZWxlYXNlZD8NCg0KVGhlIG9yZGVyaW5nIG1heSBuZWVkIHRv
IGJlIHJld29ya2VkIHNvIHRoZSBmaW5hbC1yZWZlcmVuY2UgZGVjaXNpb24gYW5kDQpjbGVhcmlu
ZyBvZiBwbm8gYXJlIG1hZGUgdW5kZXIgcHJvdG9jb2xzX210eCwgd2hpbGUgdGhlIHBvdGVudGlh
bGx5DQpibG9ja2luZyBub3RpZmllciB1bnJlZ2lzdGVyIG9wZXJhdGlvbiBpcyBwZXJmb3JtZWQg
d2l0aG91dCBmcmVlaW5nIHRoZQ0KcHJvdG9jb2wgaW5zdGFuY2UgdW5kZXJuZWF0aCBpdC4NCg0K
PiAJaWYgKHByb3RvX25vdGlmaWVyX25iKSB7DQo+IAkJaW50IHJldDsNCj4NCj4gCQlyZXQgPSBz
Y21pX3Byb3RvY29sX25vdGlmaWVyX3JlZ2lzdGVyKHBpLT5oYW5kbGUsICZwaS0+cG5vKTsNCj4g
CQlpZiAocmV0KQ0KPiAJCQlkZXZfd2FybihoYW5kbGUtPmRldiwNCj4gCQkJCSAiRmFpbGVkIHRv
IHJlZ2lzdGVyIHByb3RvY29sIG5vdGlmaWVyXG4iKTsNCj4gCX0NCg0KSWYgcmVnaXN0cmF0aW9u
IGZhaWxzLCBwaS0+cG5vLm5iIHJlbWFpbnMgcG9wdWxhdGVkLiBGdXR1cmUgYWNxdWlzaXRpb25z
DQpvZiB0aGUgZXhpc3RpbmcgcHJvdG9jb2wgaW5zdGFuY2UgZG8gbm90IHJldHJ5IHJlZ2lzdHJh
dGlvbiwgd2hpbGUgcmVsZWFzZQ0KbGF0ZXIgYXR0ZW1wdHMgdG8gdW5yZWdpc3RlciB0aGUgbm90
aWZpZXIgZXZlbiB0aG91Z2ggcmVnaXN0cmF0aW9uIG5ldmVyDQpzdWNjZWVkZWQuDQoNClBsZWFz
ZSBlaXRoZXIgY2xlYXIgdGhlIHN0b3JlZCBub3RpZmllciBvbiByZWdpc3RyYXRpb24gZmFpbHVy
ZSBvciB0cmFjaw0KcmVnaXN0cmF0aW9uIHN0YXRlIHNlcGFyYXRlbHkgYW5kIHByb3ZpZGUgYSBk
ZWZpbmVkIHJldHJ5L2Vycm9yIHBhdGguDQoNClRoYW5rcywNCkZhecOnYWwNCg0K

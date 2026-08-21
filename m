Received: from PA4PR04CU001.outbound.protection.outlook.com (mail-francecentralazon11013060.outbound.protection.outlook.com [40.107.162.60])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3148E4D8D96;
	Fri, 21 Aug 2026 15:26:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.162.60
ARC-Seal:i=3; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787325986; cv=fail; b=poaDtUJuR28Xsn+a5E0OtSh3AngFe+bsNGF1R07wWimjV+qUn+tvattb2W6w5+tOtwgdQeepVCRDt7h51ear+WHB1vHEMlVlDWXRDLtkQAhM8X3GBZypccQis5n/mmjJ3rU2e9coNtBw9RiPfxaXa7xcrlQEF2BPtAPKhcal1yc=
ARC-Message-Signature:i=3; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787325986; c=relaxed/simple;
	bh=vv4HsPzB31NtoahxxATxvOWEafvg87t6rYK32Z1YNWE=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:Content-Type:
	 MIME-Version; b=Sj0MHhYoeWfirDk/GBt/IZF4Yd9WTjENu4IAGWn+S2LYxUUUdtUlfSpwlzYpZqogvFoS1UwIrtMvzLIHAvEJ5TX99ePVErTwjPtg7zCtG6Mj+04QapRuJP+2Fc+0Tv08NGB3mbIeecynQqD7/MTrK70ZE34DPUe4GsITHiGBRlA=
ARC-Authentication-Results:i=3; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=DXeAxHyI; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=DXeAxHyI; arc=fail smtp.client-ip=40.107.162.60
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="DXeAxHyI";
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="DXeAxHyI"
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=rGsg/IzdOMWisDqmlpdCZMBsVaEHItciV13qMPQzyBzFJpcW9uMJlFNkWBhgP4H59xcEnahWeVr0D8P4bNKnHoKJBjOMlwzBRGMGn5NrFZtrRdj95YvmrRjo0KFVmkdq9yvAuB5buO2e/uUFSm6XMlw8dehMVc144JIgaKygV2x0l0PIY9KcdM9eow/L5dTfxZCqqUnPDun1PLyN+HEWDlA1QmFSSUx/LVjyFSDocrTQPNmZ2NmeEmFzF9CXWLLstdOnw2XN5sE0UjDJRfIZSWxX/W2oUE7besmzwVYGIqmy4gYgxx5U9S+BVgGLh0Eg7+Wy6xM15oymzTyLKCrQDA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vv4HsPzB31NtoahxxATxvOWEafvg87t6rYK32Z1YNWE=;
 b=O+Im+Ig+ukkBGT2bVZfItrOUYBsyEWxaUhYwWEDoanAZ8mVwA5EDXyBM/IaIuxbCmMJLNip61WIUzkFUC0PGqg3yiGpm7U8KBP49jJSVP5ifMMYQZbuy5tf5VsxdFllcHaVEio+Y7oFLLHg+R6RhYgp0eMyFX8czgBRe+XXDjiNwHki7VWnGQBqWivwWitFcs0zGykraXZP9cM6nJuGXDK3eZORQ5gOOX3zcBcKhETtFxUcluZ/j2sXnxUBQAYABlLbM53LLHDcueEWbh7iPw6aPm79gxhzttPGbTI6+b4d/lmcZb5ySHMRPgt63mgyUWSOJwK/+X7cuS1lSD0oNyQ==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vv4HsPzB31NtoahxxATxvOWEafvg87t6rYK32Z1YNWE=;
 b=DXeAxHyIHhP24JxVTJJaX1nLmUbQxtXPZAhsRW7wUf/+apmV3lcbHnQ40+n2FACsHY8qm0aLloz0IkSTK87KnRRn2P1bvCWblCLkU4OT6AhNemUEF1dRtqZiGjS7MKn2oDwtwXrA3/3JLWcGDxboCUpZWJXbYjo70e+7Hi5iO1k=
Received: from AS9PR06CA0718.eurprd06.prod.outlook.com (2603:10a6:20b:49f::33)
 by AMZPR08MB140321.eurprd08.prod.outlook.com (2603:10a6:20b:7cb::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.10; Fri, 21 Aug
 2026 15:26:20 +0000
Received: from DB5PEPF00014B8F.eurprd02.prod.outlook.com
 (2603:10a6:20b:49f:cafe::9a) by AS9PR06CA0718.outlook.office365.com
 (2603:10a6:20b:49f::33) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.339.11 via Frontend Transport; Fri,
 21 Aug 2026 15:26:20 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 DB5PEPF00014B8F.mail.protection.outlook.com (10.167.8.203) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.360.3
 via Frontend Transport; Fri, 21 Aug 2026 15:26:19 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BSSoFaU5kC0G7nUoWJEz8k+7Zo+GSq6aL4JdwGJ58Tzuh9tPKzqDr58ali2NBy5DakoF4CMMEnL1JL1aO4bSxVRXNdrNK5PC8bFfLhugQUNK3IOZmO3pp8fir8FuR9a9otFG+APCwRMAUET0HM1zcCuF6AUbzp4vMuB8DB3cYdjYOWnezYLGHruiOBFlU72wqI96zA3HsM6fGJPcOwUK8qRu7grJdP4JtTsdgeCK2mXG1gy1a7Wp8hUjR0HmsKjXHKaCRxU+lYWEXnUJiBe+eJ6MkHVrX7QeG7XV74nPlP/x6FFVsaqRcqv8QBIlGLjLpof8MnN3ZnCAvhCdYSvuAg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vv4HsPzB31NtoahxxATxvOWEafvg87t6rYK32Z1YNWE=;
 b=V8SW+CZ5Ay3ojPkMnuproy5RWErKAieMBg4l8yPTy33Cw8DZM9LtWJeiZ92lVlOCqaeHnvtyiB5TMp1/2/vynooIOGGVYvdAFzisgO3iFIgd1z+YnURDr8yvaIDcrZT16cfZ8elgYfIi5LKO9AZ0uJ6gUJuPE90bZ/uC94Ndw1s35BEMC9dyOBt368nKG0Oq4cKmfie66zzzVZW1shHaUk5RVsofMyxJa4o5T9P+xvc0TRQOFVPlEN/aAjA95uCaMAgcoV32bxYM5r4dWnxcODCVGmqJnBfhvT36kf3rQephr+TTmenmTU2esz2sXmiIkdX1ZDS5ukClaEqwrPQdtA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vv4HsPzB31NtoahxxATxvOWEafvg87t6rYK32Z1YNWE=;
 b=DXeAxHyIHhP24JxVTJJaX1nLmUbQxtXPZAhsRW7wUf/+apmV3lcbHnQ40+n2FACsHY8qm0aLloz0IkSTK87KnRRn2P1bvCWblCLkU4OT6AhNemUEF1dRtqZiGjS7MKn2oDwtwXrA3/3JLWcGDxboCUpZWJXbYjo70e+7Hi5iO1k=
Received: from DB9PR08MB8651.eurprd08.prod.outlook.com (2603:10a6:10:3d1::9)
 by DB9PR08MB6553.eurprd08.prod.outlook.com (2603:10a6:10:25b::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.10; Fri, 21 Aug
 2026 15:22:03 +0000
Received: from DB9PR08MB8651.eurprd08.prod.outlook.com
 ([fe80::8fb8:7cf9:49c4:6f90]) by DB9PR08MB8651.eurprd08.prod.outlook.com
 ([fe80::8fb8:7cf9:49c4:6f90%4]) with mapi id 15.21.0339.008; Fri, 21 Aug 2026
 15:22:03 +0000
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
Subject: Re: [PATCH v10 16/24] firmware: arm_scmi: Add Telemetry debugfs SHMTI
 dump support
Thread-Topic: [PATCH v10 16/24] firmware: arm_scmi: Add Telemetry debugfs
 SHMTI dump support
Thread-Index: AQHdMYDRGTa94cKS1kiesvyjirk0/w==
Date: Fri, 21 Aug 2026 15:22:03 +0000
Message-ID: <E24DC6AD-01E4-4F8E-B564-CAA3A0A032D2@contoso.com>
In-Reply-To: <<20260815232604.3730754-17-cristian.marussi@arm.com>>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	DB9PR08MB8651:EE_|DB9PR08MB6553:EE_|DB5PEPF00014B8F:EE_|AMZPR08MB140321:EE_
X-MS-Office365-Filtering-Correlation-Id: 65e3fc4f-8b83-44e4-baed-08deff988d08
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|366016|7416014|376014|23010399003|1800799024|38070700021|10067099003|11063799006|56012099006|18002099003|22082099003|3023799007;
X-Microsoft-Antispam-Message-Info-Original:
 eSITPvUMAwjngPVz38Hz/Efn5BvnhqJoJZQ5K6/Wxud8eIDBnIie0A8SJkxCPnoG3PdkI0IH4aTqmIpSRDZbUlRdqcb5Y0+q7Gz0kyKM6DkvuVSZiE4Snxd92nXFQLUNkLiUT5ixhrlXKy5rq5F1ublMKbQFHHzv+dtzzmvDapxJnAxxypWgCC90wzbRRV08G5rcJQqeIFHj96imkF4pncsNagfbjo8makQrJ5S8c6Xe4ZQl3P+PsoYPaHOm1lsL0ZCzxkbvMJVsZvJSNgjqIJYQVr65L429fqH/+35uOjtI4D2vwiETK0UFTr/9ywAnqXOntd6dn/a2XFMuUlggVl7MroN/XH5WT90T2XyBWE7dEna4CPBqXMqjAJiuqH6zXGtaDMLqY6vmBVNmNFlImj3cnkLvlw5XgmpeNl0F1KKtX2DDBPbpzJaXe3Buz+VRUhiFSvQq4iBxi3pJbNmworfxc4A59ONV+7mXwy33sxd31AvJrE8E52/g9+lps1/wfKboXbf4y3blbbbEpcLqMKLuTWqz/vno6qrY0DcpyLPPPLOme4dUDqSASkKptdgoBuUUwZw1frKqMX4UyhlrGmDp0f7zMSFEn4ufEAO1y3XbcKtDsSX/P9GpBhnDb2BCcf+dv11oB+curXrmSC8epxEBVxEQxpKLRIT2ZQocOYfccMTtoF7uyEHr3eyFhM/vi8axpvGDwAh+MJgAE74cSs9mVMLDMlllO+/Qw+bFqu8=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR08MB8651.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(376014)(23010399003)(1800799024)(38070700021)(10067099003)(11063799006)(56012099006)(18002099003)(22082099003)(3023799007);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <5D6DC12E895D064B9B5B4F18AAF9831D@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: arm-scmi@vger.kernel.org
List-Id: <arm-scmi.vger.kernel.org>
List-Subscribe: <mailto:arm-scmi+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:arm-scmi+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked:
 JDkEHvsQw8XvcTFMvQg1gkT4UiOTYJ8XMxbRv20sfWFZpkrwEU1igOdE5kEqiKJAPFU7Hb2iKPKfvn2Kq1+MqfSHk1xvuLuGP5DFjgbHsyu5ukxbgwZsYhLn2ePTomZvEbL7vJ7N2Nx1m7za+YlH13RbPC0cYODdse+Ph2YHRTo3+TX2WW5T9j2iy7isUvh1sEJpdY9S0vzyuB101aOuH43KUIRTRy7XqfGx1N7i0zj+YXUc7unNPZK6VbgBYvIUHA3UrlaWhzTa2c0hjnPb9Mps+CYBIeCXF+/lL5ZmSJEBPS0aJJK6x0WS9Ip3Whacbo8feGgpf8yleBzvcoj++A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR08MB6553
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DB5PEPF00014B8F.eurprd02.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	10125146-5968-4d38-9309-08deff97f3ea
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|36860700016|14060799003|7416014|376014|35042699022|1800799024|82310400026|56012099006|3023799007|10067099003|11063799006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	/yO1J6ZNILAVMW5cuXl2FU9L1A62OSJvfwkSCm7rIxEykJtyrEsevOpKViJa12VdTvMv1I8NBobgNgRi/328NZMkJial/KuXh0u3aTR+UBzsbHhPQ4IJ3MqChegfZxBfpIVw8b6664jqALmZ5H+NuNYi3fgIOtBj1jHesmUP7wTPINptM1K14jbMAIUKWbNo0UXWII2YVfqpchvb0lNUFnCoeg4eWxBS1ovcLcUMn/AefRQEpzGtcq3uOjZtdbxlBnD6L5Ka9QdfLgCVpJTcAGMbclVdM+AfbpjTLcv1/MvyGWHxjHG6SWPaIFDKggTmm5a6tUtqPND18Kl2l8YEFQ2q7JzH/1LFwgSgb8/485qhCwm2Ai0YLtjWnCOxmITiuhncU4UWGtkS8ruVAiS/nIFYMLs3BRY+Q+qSRynHjzlKkCokPzoPrIQ0ogMT+e2Uav6i6sZlLsDUehPIU7jTMRwNqGEEyW+90aZbwHsGKJmL1pQXBeawXOuE3IwdFDbpv7pRRxukbgc3X12B9kUonIHaLLWecUZ8qYC41o71JPvsi7Rsa7WP3o8c8IJiyltwQ62b9WtSe45zVdSFKs5uEYo3GNPNbheUtZDONie7ImGefK6ZuK1B2vVJdy4hC3FE0kwH618ZgTwl33UKRr512neUftUVbNEdd/9J+A1elGaGu/wMhMGNb8NdifDPtX2t5Ure/YHG5Xuea7s31gTLIw==
X-Forefront-Antispam-Report:
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(36860700016)(14060799003)(7416014)(376014)(35042699022)(1800799024)(82310400026)(56012099006)(3023799007)(10067099003)(11063799006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	tu3YTfjZVRHGc+j553QgPcp5GnVG9QwxcS9LjE1TKrwETDDwBiaBD9yYq7yKP59ghO2rM+3+AyWi6f/lNKwhO1kERl3poRDXpfOPMK8C67Uo0tKJSfYiNT2qAAENF6tTNbuwCpiHkZrVNR2MfQaQ28ilfdEP5XxS7KQs4Nm1IygadJ5zQRHHNHZMpqMTW6v4V93m9NOCWa8kojziKpAlAIjDipIRToPXgLzbBZdcDlDck1hfEC9qCrKJ3sWyA4iCQv2K8W35UrlmXebtl8v/JJXAb81x+Tn1/eKR6CyGmM2lX9PrielEU77Tg7RHad94Ni/Q/3DefmUiCnCrmDEtny9baQUiPuvTWGwUdEnWWl6iqRQzfIs+3SUMAAIHkjSyVCmYM4u7Dxah/UTlMF937s5WqqpmeW4kuG6el894UyMmazQsjkX/4cwCH0r2M3WX
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Aug 2026 15:26:19.8479
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 65e3fc4f-8b83-44e4-baed-08deff988d08
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB5PEPF00014B8F.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AMZPR08MB140321

SGkgQ3Jpc3RpYW4sDQoNClRoZSB0d28gVjcgZGVidWdmcyBpc3N1ZXMgYXBwZWFyIHRvIHJlbWFp
bi4NCg0KRmlyc3QsIHNjbWlfdGVsZW1ldHJ5X2RiZ19zaG10aV9vcGVuKCkgc3RvcmVzIGEgcG9p
bnRlciB0byB0aGUgZGV2bS1vd25lZA0KdGVsZW1ldHJ5X3NobXRpIGRlc2NyaXB0b3IgYW5kIGl0
cyBkZXZtIG1hcHBpbmcuIEFuIG9wZW4gZGVidWdmcyBmZCBjYW4NCm91dGxpdmUgZGVidWdmcyBy
ZW1vdmFsIGFuZCBwcm90b2NvbCB0ZWFyZG93biwgYnV0IHRoZSBvcGVuL3JlbGVhc2UgcGF0aA0K
ZG9lcyBub3QgcGluIHRoZSBTQ01JIGRldmljZSBvciBwcm90b2NvbC4NCg0KVGhlIGZpbGVfb3Bl
cmF0aW9ucyBvd25lciBwaW5zIHRoZSBtb2R1bGUsIG5vdCB0aGUgcHJvdG9jb2wgaW5zdGFuY2Ug
b3INCnRoZSBkZXZtLW1hbmFnZWQgU0hNVEkgc3RhdGUuIEEgbGF0ZXIgcmVhZCBmcm9tIGFuIGFs
cmVhZHkgb3BlbiBmZCBjYW4NCnRoZXJlZm9yZSBhY2Nlc3MgcmVsZWFzZWQgc3RhdGUuDQoNClBs
ZWFzZSB1c2UgdGhlIGRlYnVnZnMgZmlsZS1saWZldGltZSBoZWxwZXJzIG9yIGV4cGxpY2l0bHkg
cGluIHRoZSBvd25pbmcNClNDTUkgaW5zdGFuY2UgZnJvbSBvcGVuIHVudGlsIHJlbGVhc2UsIGFu
ZCByZWplY3QgcmVhZHMgYWZ0ZXIgdGVhcmRvd24gaGFzDQpzdGFydGVkLg0KDQpTZWNvbmQsIGZp
bGVzIGFyZSBzdGlsbCBuYW1lZCB1c2luZyB0aGUgZW51bWVyYXRpb24gaW5kZXg6DQoNCiAgICAg
ICAgc25wcmludGYoaWQsIDE2LCAiJXUiLCBpKTsNCg0Kd2hpbGUgdGhlIEFCSSBkb2N1bWVudGF0
aW9uIHNheXMgdGhleSBhcmUgbmFtZWQgdXNpbmcgdGhlIGZpcm13YXJlIFNITVRJDQpJRC4gUGxl
YXNlIHVzZSB0aS0+c2htdGlbaV0uaW5mby5zaWQsIG9yIGNoYW5nZSB0aGUgQUJJIGRvY3VtZW50
YXRpb24gdG8NCmRlZmluZSB0aGUgZmlsZW5hbWUgYXMgYW4gZW51bWVyYXRpb24gaW5kZXguDQoN
ClRoYW5rcywNCkZhecOnYWwNCg0KDQo=

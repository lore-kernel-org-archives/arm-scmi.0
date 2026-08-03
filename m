Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11012061.outbound.protection.outlook.com [52.101.66.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E66903947B0;
	Mon,  3 Aug 2026 23:20:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.66.61
ARC-Seal:i=3; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785799246; cv=fail; b=l2WxjlcJ9KLta4CepWNlG1FRWpyEdGyK0drfOU7dHZZKjLR6xFfGCQ88Z6P35JZ65q99EIVd26C6EXZuKQetpGNvMW4ag/iwsqREjwZnWmKDYIu12fUMYWG1uxuEIe/OwBB6CX1tHd6ULR0TVbNvBGem7+MnP8NF7kLzvAcnEZo=
ARC-Message-Signature:i=3; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785799246; c=relaxed/simple;
	bh=H4wa1AR87bNSV//ARMbTlg7Zao4//mukAcLawHBSI90=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:Content-Type:
	 MIME-Version; b=f6DGXvqPkB2YZjWWfn9YamHwFT5lwN6ltAEE/OvEWk9KX9GQtVXfb43F7UwcLarrBXPSoxb2vxFqCKWVrm0uOvqdKcwuPkgOawMDBHILaJZyBrJndRyXxhUSkRNyCTFT2355JH7MYhJE3ol/VMI3zt7ZF4OBqO5IaLl1omkt3jA=
ARC-Authentication-Results:i=3; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=OCAmvzdQ; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=OCAmvzdQ; arc=fail smtp.client-ip=52.101.66.61
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="OCAmvzdQ";
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="OCAmvzdQ"
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=RLaAUGZmjiiTGXAMZhNSp2lW2b18XIqrpJwI9z87yMxKrspaXj3WfhReGAm3xWDXbtEfhtMpAo5DXSA63n/lBUyWcZIdgbrpgK6YrcSoAOlrJrLv4/sGiCUonsKmnx4hlMSutogvSXDtw5pTo9ci4DbYZe7wDP9BwPojFriGVNVGs6Fep3z2xky2qr7v1WcMhD7oSTKN79vLjjCdl2Zn5uVjqw/EIxjS6xDmm2kLTi95+bzbruIaPBx8WvxHGZfLUfBDD0pQHAhWezzYOOjFBdWUPZ8vWnqRUZmRHQVL1pKn1JRp6ZaEy08lu64z5gKX4K2huQhlT8+G1w0L1PQX9g==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=H4wa1AR87bNSV//ARMbTlg7Zao4//mukAcLawHBSI90=;
 b=dWE3GdXW40AqFAnbMXaraIIG2hrCR1SOnvFeJ0LTrOYGr7/SeJIkIqn1C24RxINAP0q89LT5XIi17q8qqFCZjKjFn3lwiz9pz6zNJ/c4wXOgw30pUnYTYomYGQ5behbnW2eCUYE3o/ADIsnlDMj/4BhHnQpXR8d8ZnpMwo+7MJoelJWpj7oqOUHYPt+dOER6hOl4HkpUNB7ZxgGXVoN/bUTKjmSbtyHl387YEIkDmJhUZoQJLGFHm8XROydRN9O7pyxDndza5E/ZcQv3jvI0voR03gXWKy/X5/I+TJueDTlYJ0EKaybCovq1+D4X8fp5ob02sJD4NTGdR1lfNTqztw==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=H4wa1AR87bNSV//ARMbTlg7Zao4//mukAcLawHBSI90=;
 b=OCAmvzdQ5FRoU0OstmdzHI+N/JXsDO0kmnTMVqhWF3TupvCIFIMY93wjrKq3tlQC1vNaBFoxqwIAeGYnl/zYAADCsobLNd0es+oTKy7EPRJiM+fApuW8cL+G5r7AGjBE/dzsMtPVAfdyFogoHucoO3yusE/Zbw6mkWKzG5WxZpQ=
Received: from DB8P191CA0027.EURP191.PROD.OUTLOOK.COM (2603:10a6:10:130::37)
 by PA4PR08MB6174.eurprd08.prod.outlook.com (2603:10a6:102:e6::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.18; Mon, 3 Aug
 2026 23:20:38 +0000
Received: from DB1PEPF00039231.eurprd03.prod.outlook.com
 (2603:10a6:10:130:cafe::e) by DB8P191CA0027.outlook.office365.com
 (2603:10a6:10:130::37) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.270.18 via Frontend Transport; Mon, 3
 Aug 2026 23:20:38 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 DB1PEPF00039231.mail.protection.outlook.com (10.167.8.104) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.270.5
 via Frontend Transport; Mon, 3 Aug 2026 23:20:38 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EmP7b1hjFfqFL35CW/jTz/MVAOVtbDd8xopXWEhD7Hyb33iz9mZku/mE1yxQRnruBetJaD+rSZYkaKuoHK76KbuiIADauvP/OFznCtBqefZkFIHLtYORY5JlipXTS+KNvrNLDR9i4XvYpPIS7bpr2OmXMX7Bt1fb2i2rLdfLmOkb+7glQMLz0qm0XqProiex4zBQPjaD9Nunn7aB2st9jy4eQ8xW8gkkRa9DuTpUYak62NAZxcuNh79pJou8oV6CzVAfL7owD8EN/YtdiLLGelMMPZd3CEt+O0d2JWTtPwzi9kVbMp7z+0ROkw9Ea4a3KmPsl9DWG9nkzmmzMr0RNQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=H4wa1AR87bNSV//ARMbTlg7Zao4//mukAcLawHBSI90=;
 b=acHkWxyV2J0w5XDZ28rT40WJMdIhOGFd/WTt9h9BFo0/qPqOrykbRf9XjKhKAbra9NPEyRkXI5ehhNLIAFWSXjJrvw0ulG/e4fheuSLvUdyN8EI6eEw2YIPxkZpWsm+9QX8gECV+3pfedIuSZDM6TBCZxL8ax4Nkx5HtfJTpmSH5JmHb4qN7HT1NKsjG2fRNZqKT0Idb1f9fgomjqvCD9VuB9e53mRQTqwi+ESZ2FzmqPwyRfOPXXXhSns6wMjK+mDx9A6omPV7gyoBhaSH8DhfquHOdQPu6AMIJpQZBn5/LKfxmu2YuCaUu0e5bs676gWNJsrqcZes0Ibg46DPgyg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=H4wa1AR87bNSV//ARMbTlg7Zao4//mukAcLawHBSI90=;
 b=OCAmvzdQ5FRoU0OstmdzHI+N/JXsDO0kmnTMVqhWF3TupvCIFIMY93wjrKq3tlQC1vNaBFoxqwIAeGYnl/zYAADCsobLNd0es+oTKy7EPRJiM+fApuW8cL+G5r7AGjBE/dzsMtPVAfdyFogoHucoO3yusE/Zbw6mkWKzG5WxZpQ=
Received: from DB9PR08MB8651.eurprd08.prod.outlook.com (2603:10a6:10:3d1::9)
 by AM7PR08MB5333.eurprd08.prod.outlook.com (2603:10a6:20b:104::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.17; Mon, 3 Aug
 2026 23:20:06 +0000
Received: from DB9PR08MB8651.eurprd08.prod.outlook.com
 ([fe80::8fb8:7cf9:49c4:6f90]) by DB9PR08MB8651.eurprd08.prod.outlook.com
 ([fe80::8fb8:7cf9:49c4:6f90%4]) with mapi id 15.21.0270.016; Mon, 3 Aug 2026
 23:20:05 +0000
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
Subject: Re: [PATCH v7 00/23] Introduce SCMI Telemetry support
Thread-Topic: [PATCH v7 00/23] Introduce SCMI Telemetry support
Thread-Index: AQHdI56e7wy4VV/XO0GmqlX00CXDNA==
Date: Mon, 3 Aug 2026 23:20:05 +0000
Message-ID: <C836876E-7F4D-46B9-A818-B4A8532471E8@contoso.com>
In-Reply-To: <<20260802145618.1952804-1-cristian.marussi@arm.com>>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	DB9PR08MB8651:EE_|AM7PR08MB5333:EE_|DB1PEPF00039231:EE_|PA4PR08MB6174:EE_
X-MS-Office365-Filtering-Correlation-Id: 532ea395-06f4-48d4-92ed-08def1b5d43f
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|7416014|376014|1800799024|23010399003|366016|11063799006|56012099006|10067099003|6133799003|3023799007|22082099003|18002099003|38070700021;
X-Microsoft-Antispam-Message-Info-Original:
 NO4NKwERsY5S1efRRdivz4dGlyhy2sB8cN5EqaQ5zfW/cph2aazkm4dm766CNlkzSwDXN9+7JFJAzUZJw6HBcXyXLnyV2GkmgNY/V1eg7o7gE5gTU4UXL0L83v8KK1f8/hHfAB1bbF7L8t/foHzzo9etbDZAK+wxVeusysnQK0wzK4XKkLrbSChv6HL8Jrrm8GPavRZ4ltNzLYYPGWmWrrdZYadjHUAp3Uy3jmtwS4iA1O4qrSFHeb6XC2s2bcWtGfRhoR7mhB6PSEDXuxZfJ0nErNkmYRcMebI60pn3DwKmw5B3VPA7g0yB556E2/87c6HK2WkjWLbrNOK1ybOly3BcOhT65pdBf0CId0mRS8ptbEL/ynKaiQ/9gLGfUTIRFgEKovp3dmC/OiMDWvi0Yepu8OStivO/Km2ZBsV2EfECANQ61FKOlp/MLcMFpTyDN/FTMJNMah266KD37DLj3poqBuweiYIx0afR2evrRpHHksiRpGCoyp2rF69EbujSDUEjd0gTJfa4p1U83ICxEwJrmHBgovg87vEAKG0CquGm66jEydyqllVgh3Oaq+/RuKoYgUGPozkezMzWyuzYpz2J2btqQKt1BV7qrDOV4by88nhYCSlr+3viJrKQoAT+Jo6A+IqluFRJyBVloiM58YetIRQETy1vN0YD+hQPLY41ITqyVQtyxUBhSA5v6J324bWB7HPdDe8ia4dx6X9UzouTamqr5D9gQzox0/0Xolw=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR08MB8651.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(1800799024)(23010399003)(366016)(11063799006)(56012099006)(10067099003)(6133799003)(3023799007)(22082099003)(18002099003)(38070700021);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <889F0A63A270BE41BC554FBACD7F510D@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: arm-scmi@vger.kernel.org
List-Id: <arm-scmi.vger.kernel.org>
List-Subscribe: <mailto:arm-scmi+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:arm-scmi+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked:
 D4IKasWASYhZb+8yY+heRVHmd7is5IhrzlJiuhaT89DhSvEav1zQRE/KwHP9//sF5JJP0oJXIeyfm3KxSN1oD9i3fR+l7hrIGaSHwYCHNnHGdxaG/1tahFlHrUkzCqhPp9mW+SEw2iti6MRpcQi0Cfu7alaW+vHNc0TVPo0WS/MtPEDHRm34eWbgWKjDJGUaEOFAqYq9Dql4ZChEos0AncUMlraHyYyJNLAT+IZVSCZR9UHkeMkVt71TVxJSgJlPPqMHX1bjNb8T4joGh1nhtZjyYfrpTMx5D3Gru78nOhuutXdYVhgB5GdnqnUNaF0uXukelt9PfcVS/PefR1VkSQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR08MB5333
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DB1PEPF00039231.eurprd03.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	9803fca3-fd89-4a0f-6398-08def1b5c0be
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|14060799003|23010399003|36860700016|35042699022|82310400026|1800799024|6133799003|10067099003|11063799006|56012099006|22082099003|18002099003|3023799007;
X-Microsoft-Antispam-Message-Info:
	EUWt/VLezFEa1nYJbCdj+d/RT+WFo59Cj3ITE2PwkFtYW/zWqMyXZsCvapJQgTyof2ara66MGKkM/flkPVkXUZF0pkGnAMbd0DgYCY0kuNHUdBnPpWZNNIl8/kwwkB4m0Hp+RDkJXpY5j/MlRTV0ptLYMw5mrVdvwMVwPRfcvIKpEYiXfGtyT6noVwI0XtN3sXM2dZzQPhyqy19kNGtMobSnZCtcaiCHo7cQObHPFYi0wdz0Cdcql/fCf1XGE1Qmt11hfl1tUc2yarr5Ue+fhOQknO10mPC8b0atLzX/rf4P0iLgXc6Kmp2aJSLADuqfT6HQe9OLI6WhRSceLZcu+UEGQOHfmPhfpLXZBnjrt20GC/gpKGaSvWWswXQxNiN1veFKcCSTNgKXP4xL2vagq4ezLUc6cXf3HZpIlk6R70LZZc9bqBN/6ziJk891qrDpU+z6l1SkW+v0OL59wNyaPLoiYlCHKDK6GFqM+kJ5XECBH8D7SOvfZG3PnQ+Y1923pdoCTyI0ruv+QGdnH79iqfKUCbhq+gEnY2hlX2Ma9huoeriBrmsS0oPf3Nzgv+gwV3mm/xz7oiaEzjsHgbKAQtvXGvwh0BH9qMh4jAckdezipOYxnzqI9d9rRqknomz//LzboJJ4Aimww5MfSDLvmRhOYqAEV1XDRdgEYIIW3gHFLIN9lgZ3TLvD9jWzGvss1h/mVkhy4xStJcVH57gQng==
X-Forefront-Antispam-Report:
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(7416014)(14060799003)(23010399003)(36860700016)(35042699022)(82310400026)(1800799024)(6133799003)(10067099003)(11063799006)(56012099006)(22082099003)(18002099003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	VATCca6BDGYEi/RMSltW8zULAPvTyq/TBpZUFz+/k9BnWr5QCVj5iD06dU20SycniPmFIw4OnMC6m+c9v5d7weq+GSihsQbn1I2Pigj3OeNs+SU5irC4h3YGSSLmVGmcCTfu1il9ojDf8Fs+k73uXWEus19v+2iZ0u/mX/pTgJXL/kvrzGc9VR64BOGM11IOJZPRgcW8GATkT1BxYmyYq8Xqh1Nb2LcSNQ/ta9kbl4fvHQIK9tCfcDQxT96wBMaZJL64BdcxvPmkzXSrWuE37uUhIhBiaPJ5H9Cm+cogh3B9D9zmeDr+0qNR7T5PzwYhMOySowxWw/InulhUvVbWtQSaPwTbalzICFDJvXz//6XpWJ69bQFMGaPzunXpQdA9UX8tlM5/snBQBbQ4u/KfSRXUI6fcGokTJDDGdWnM5KgHqnis3DZTLRTUs0IkxZaB
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Aug 2026 23:20:38.4520
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 532ea395-06f4-48d4-92ed-08def1b5d43f
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB1PEPF00039231.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR08MB6174

SGkgQ3Jpc3RpYW4sDQoNClRoYW5rcyBmb3IgcG9zdGluZyBWNy4NCg0KQXMgeW91IGFyZSBhbHJl
YWR5IGF3YXJlIHBlciB5b3VyIHBsYW5zIGZvciBWOCwgdGhlIGlvY3RsIGludGVyZmFjZSBpcyBu
b3QNCnJlYWR5IHRvIGJlIGFjY2VwdGVkIGZvciB1cHN0cmVhbSB5ZXQuIFRoZXJlIGFyZSBzdGls
bCBzZXZlcmFsIFVBUEkgDQpjb3JyZWN0bmVzcywgdmFsaWRhdGlvbiwgY29uY3VycmVuY3ksIGFu
ZCBsaWZldGltZSBpc3N1ZXMgdGhhdCBzaG91bGQNCmJlIHJlc29sdmVkIGJlZm9yZSB0aGlzIEFC
SSBpcyBleHBvc2VkIHRvIHVzZXJzcGFjZSBhbmQgYmVjb21lcw0KZGlmZmljdWx0IHRvIGNoYW5n
ZS4NCg0KSW4gcGFydGljdWxhciwgdGhlIGJhdGNoIGlvY3RsIGVuY29kaW5nIGRvZXMgbm90IG1h
dGNoIHRoZSBzdHJ1Y3R1cmUNCmFjdHVhbGx5IGNvcGllZCBieSB0aGUgZHJpdmVyLCB1c2VyLWNv
bnRyb2xsZWQgYWxsb2NhdGlvbiBhbmQgbW1hcA0KcGFyYW1ldGVycyBhcmUgbm90IHN1ZmZpY2ll
bnRseSBib3VuZGVkLCBzZXZlcmFsIGNvbmZpZ3VyYXRpb24NCm9wZXJhdGlvbnMgY2FuIGxlYXZl
IHBhcnRpYWxseSB1cGRhdGVkIHN0YXRlLCBhbmQgdGhlIGxpZmV0aW1lIG9mIG9wZW4NCmZpbGUg
ZGVzY3JpcHRvcnMgYW5kIG1hcHBpbmdzIGRvZXMgbm90IGFwcGVhciB0byBiZSB0aWVkIHNhZmVs
eSB0byB0aGUNCnVuZGVybHlpbmcgU0NNSSBvYmplY3RzLiBFdmVudCBzdWJzY3JpcHRpb25zIGFs
c28gbmVlZCBwZXItb3Blbg0Kb3duZXJzaGlwIGFuZCBjbGVhbnVwLg0KDQpJIGhhdmUgcHJvdmlk
ZWQgdGhlIGluZGl2aWR1YWwgZGV0YWlscyBhcyBpbmxpbmUgY29tbWVudHMgb24gdGhlDQpyZWxl
dmFudCBwYXRjaGVzLiBQbGVhc2UgYWRkcmVzcyB0aG9zZSBpc3N1ZXMsIHVwZGF0ZSB0aGUgZG9j
dW1lbnRhdGlvbg0KYW5kIHRlc3QgdG9vbCB0byBtYXRjaCB0aGUgZmluYWwgQUJJLCBhbmQgcG9z
dCBhbm90aGVyIHJldmlzaW9uIGZvciByZXZpZXcNCmluIFY4Lg0KDQpUaGFua3MsDQpGYXnDp2Fs
DQoNCg==

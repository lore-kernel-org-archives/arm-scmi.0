Received: from PA4PR04CU001.outbound.protection.outlook.com (mail-francecentralazon11013006.outbound.protection.outlook.com [40.107.162.6])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7769421238;
	Fri, 21 Aug 2026 15:25:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.162.6
ARC-Seal:i=3; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787325918; cv=fail; b=akQWLuUb4+JgoAgzRvYU4jT/JhBSognLsDk/B5cfapnI1Ruouu7FzP72qF3UciFzqtbt1RREiN7AMtKwT5n/TlqgvGGjTcQeR0BsPOQxSeyR572OJVNOATctaonVQw/R4UO2i6ayC6MYHOCFL9TE5TtOnPe4JuJa/EB+E5Mg890=
ARC-Message-Signature:i=3; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787325918; c=relaxed/simple;
	bh=pTwzDYZtC3bb3GWYNk5dLDYNNEmyTP4+E7aX1ZHnq20=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:Content-Type:
	 MIME-Version; b=IW1g/Dc1fWp2qR8tkAxeCXHfF02bTmyuQ1fDAC/xaxmKwJYzRrQQuFqWWxtDhFPF1md8VTW6EZt9lUXlJStNuMhy8XEgoxdYtsuNCcEa+CN1Ds06n5P4wrLqluSmUX/B1KfmEJdvxu+1mD+3OXQ9eEK/w3/zr/7bDJUm7NKSJf4=
ARC-Authentication-Results:i=3; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=PzqyCHcR; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=PzqyCHcR; arc=fail smtp.client-ip=40.107.162.6
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="PzqyCHcR";
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="PzqyCHcR"
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=QbmBlXbDYm3svw1tKSU73tB2TFcK771gDYJipPFkqqhYZJhOF7zrGn9bPFfSnD1Qk3i/lfMetEBneW3m71zPcnyq63BiVq1mbhjZQVir2vzs/EGEYRByE9UZlEGs2cy+fkxXwXeunOJCaRAY+Tn5uJqyImriZDMbKY8VIL56LwvLWX2T0C4mqj9IaqlCC9yLLCi9dJ07cZFYk512IAqp/+b2Y9VlIqbUDExKv29GoaVMH295We9rndWt2n+nVMVkO26xC9SEN708RdZTmIPL5CG+0lyAGjTJMT+NRIcq32VDYzAg6oZUMp0gStiixqz4YT14utfvAlLLFR+kosShHg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pTwzDYZtC3bb3GWYNk5dLDYNNEmyTP4+E7aX1ZHnq20=;
 b=m9ph+aLSQJZbuD2Q90hWkJIbDLpXSAMW/cQ79WTQ332I4hsHFqsIsGeE4R6ZrbAsIAFOCMg/hkQg0DU/UE+7oFm10kUEvhTA6p9eg4bXBlfxegyuGT3DVe/xCoRKMtbDqhG36wog1s5k+UhVF7zgLmkISE6RqbSAxprhNro+v1JEzYMSNTDb/cg04xE3B95Q+Ms8lBx7ok2yWVmLe2UicMtuF4K8dSsjwqZ2nQfhaKCz7iZdr6wyOOg16FaqCj1LhKG5nBIqUEg47fw4odGjunPJKZgzYbqgmJhqx1pKI68YOj5L/YM3y0pHQazEKaTCp/4oz1mUXwxBZPRYd1wG9Q==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pTwzDYZtC3bb3GWYNk5dLDYNNEmyTP4+E7aX1ZHnq20=;
 b=PzqyCHcRhjtXNzXzCg1mnbOlL3yrLoc9OXRiMO4iAa0CvtuKGxbYHSN06joQMmrP0uEkQQ6zQ5vhU/CajgGlrI6VTOO5Ct//9lG4ymlqLFUXOo00UJ7S+HPBr21ad/10hPmkAo73j9PNSRqBtex5YUN28OQalijBajoy3h8XsWc=
Received: from DU7P191CA0009.EURP191.PROD.OUTLOOK.COM (2603:10a6:10:54e::13)
 by GV2PR08MB8392.eurprd08.prod.outlook.com (2603:10a6:150:b4::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.10; Fri, 21 Aug
 2026 15:25:05 +0000
Received: from DU6PEPF00009529.eurprd02.prod.outlook.com
 (2603:10a6:10:54e:cafe::92) by DU7P191CA0009.outlook.office365.com
 (2603:10a6:10:54e::13) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.339.11 via Frontend Transport; Fri,
 21 Aug 2026 15:25:04 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 DU6PEPF00009529.mail.protection.outlook.com (10.167.8.10) with Microsoft SMTP
 Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.360.3 via
 Frontend Transport; Fri, 21 Aug 2026 15:25:04 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fqrHFzTNCJOSnWOblEQo7qBNWr4SM8k/MKP8+/VMvwLQQLEaWu8pw6JOyPDmM0BTZtCtLK8023mmLLv+TZAqAPyoF3neKoPd/nvfLaMqszv83qNuDScZnRcmdVK+HIpBX2fdkclyNrdoBz0JyeXRy/w5bwFl05zalftgD7h6Jh7R6fYzDZ//NJ7IAegW/jQ0KMzEP4Y5POIbmqCrv6wrDv5AdP/2eushdPz9t/edoXXnBTWhn/upLAx0djQ6NpqWnQyOzEn7XKN0R2S2UOqOOMiaNXnVbspadgYBnPDhbq6hGAPxoPpy1+7N6K/Yn6NXX5yqPuTv9awz6HjcJkDlAg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pTwzDYZtC3bb3GWYNk5dLDYNNEmyTP4+E7aX1ZHnq20=;
 b=qM1mPDXA/7YgUjldy2ViCJ63/NXSZPH7DQzTVeAVZT6qsBJtHqer9Hce8rRzwVmCQ4mSJQ0uDav0CRaipP9hBXtFPguEcmyx350UMpTqfDk22O0r7mscA7NQ5ckvhHZZW+wpj/L2EjF7rYEO6+cFv3KTbjEeqel1J0GcXdI+WBeh0BUEI2JmxTnYiHkM8HXLKU4+/U1W4YgWlUF3pZUIqbYl9N9IYhRlVn3MlTA55Cz4zbEktOW5AxMfUpN0SfSpW2+/q9+Tk5HlzMTSNZWiqpG+UiiFr/+WSzdG+JyT+5HlBIbRNIqty0e35YeiYB3S3KdVFawGL2Tk8KO+KGygHA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pTwzDYZtC3bb3GWYNk5dLDYNNEmyTP4+E7aX1ZHnq20=;
 b=PzqyCHcRhjtXNzXzCg1mnbOlL3yrLoc9OXRiMO4iAa0CvtuKGxbYHSN06joQMmrP0uEkQQ6zQ5vhU/CajgGlrI6VTOO5Ct//9lG4ymlqLFUXOo00UJ7S+HPBr21ad/10hPmkAo73j9PNSRqBtex5YUN28OQalijBajoy3h8XsWc=
Received: from DB9PR08MB8651.eurprd08.prod.outlook.com (2603:10a6:10:3d1::9)
 by DU0PR08MB9052.eurprd08.prod.outlook.com (2603:10a6:10:474::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.8; Fri, 21 Aug
 2026 15:24:30 +0000
Received: from DB9PR08MB8651.eurprd08.prod.outlook.com
 ([fe80::8fb8:7cf9:49c4:6f90]) by DB9PR08MB8651.eurprd08.prod.outlook.com
 ([fe80::8fb8:7cf9:49c4:6f90%4]) with mapi id 15.21.0339.008; Fri, 21 Aug 2026
 15:24:30 +0000
From: Fayssal Benmlih <Fayssal.Benmlih@arm.com>
To: Cristian Marussi <Cristian.Marussi@arm.com>
CC: "arm-scmi@vger.kernel.org" <arm-scmi@vger.kernel.org>, "corbet@lwn.net"
	<corbet@lwn.net>, "d-gole@ti.com" <d-gole@ti.com>, "david@kernel.org"
	<david@kernel.org>, Elif Topuz <Elif.Topuz@arm.com>,
	"etienne.carriere@st.com" <etienne.carriere@st.com>, "f.fainelli@gmail.com"
	<f.fainelli@gmail.com>, "james.quinlan@broadcom.com"
	<james.quinlan@broadcom.com>, "jic23@kernel.org" <jic23@kernel.org>,
	"kas@kernel.org" <kas@kernel.org>, "kernel-team@meta.com"
	<kernel-team@meta.com>, "leitao@kernel.org" <leitao@kernel.org>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-doc@vger.kernel.org"
	<linux-doc@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, Lukasz Luba <Lukasz.Luba@arm.com>,
	"michal.simek@amd.com" <michal.simek@amd.com>, "peng.fan@oss.nxp.com"
	<peng.fan@oss.nxp.com>, Philip Radford <Philip.Radford@arm.com>,
	"puranjay@kernel.org" <puranjay@kernel.org>, "skhan@linuxfoundation.org"
	<skhan@linuxfoundation.org>, Souvik Chakravarty <Souvik.Chakravarty@arm.com>,
	"sudeep.holla@kernel.org" <sudeep.holla@kernel.org>, "usama.arif@linux.dev"
	<usama.arif@linux.dev>, "vincent.guittot@linaro.org"
	<vincent.guittot@linaro.org>
Subject: Re: [PATCH v10 23/24] [RFC] Documentation: Add SCMI System Telemetry
 documentation
Thread-Topic: [PATCH v10 23/24] [RFC] Documentation: Add SCMI System Telemetry
 documentation
Thread-Index: AQHdMYEpnbrultzX7ka0YywXZ94Vyg==
Date: Fri, 21 Aug 2026 15:24:30 +0000
Message-ID: <678A6AA8-C6D6-4513-B414-CF9B4FC4A2DD@contoso.com>
In-Reply-To: <<20260815232604.3730754-24-cristian.marussi@arm.com>>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	DB9PR08MB8651:EE_|DU0PR08MB9052:EE_|DU6PEPF00009529:EE_|GV2PR08MB8392:EE_
X-MS-Office365-Filtering-Correlation-Id: 01d0ef9e-5c49-42b2-2139-08deff986017
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|7416014|376014|1800799024|23010399003|366016|38070700021|6133799003|56012099006|10067099003|11063799006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info-Original:
 mO+DRWBAFrdA2alg7w6i3V0yqsTQD233S/EFe9Lcixloi1KTPOISYJGAc47mItCtJdvxwJvV38BUMHSljOpSPJrXlV/PtqrQuoyLxSYk4LfRCPnB2//3+z8lcbareL4+JrgPFncCXp2M4kELqRkaKXJT89/6RzhiCtvg44vG4fz4286YDpOhW65h9Ccw/JjMOABr6w4Vce6ZZJZM+NuGplGJTxy/nWXk/uxVZS5fyUkn25lAqZlfl4Ics2da/BZRQ+DkbxxVzHdfEqterEpxJKxn9mpCf1zMzRylfK6G9Fti9orPkq9t3HnEoyYFWpSR7M6dUbEsSo0WxZcOo9/5zfl5Q7/6faJhWGlr2D8CfM+qM4l19MeJ3MOw3pigG+1oo3uYFzkA4OhMYjtCFZynUomk6qR3f2MnM67ZEKmaHxpJCObxQa/sZJPS9DRy2td8bRWwATxDNiMFNGAofJNZdwWO+1uvGfvsVHSLCd4V6ZXA145U4dgRzOKbh2CXZOxlugO7ZbkeZFkskeYy9QkbYqwRetbyrcESnRN+ZStYCDXa2uiladf3CGULEHPIPsQZ2t6tHXPKfCA7zpZ7GsikquSQP+Fle91P8x2MxhTPhMepQBY/kWHytP/iJP6qIeZP5MTNX1KdELi4sBkTLVw6+muMSXSe+gyH33fmIrclUvx7AGWwxGtHQfU7PW3/JGggivK8QOldAilVJiFjzp6WIuYFHJeITTEIzJU0RlSF1IA=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR08MB8651.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(1800799024)(23010399003)(366016)(38070700021)(6133799003)(56012099006)(10067099003)(11063799006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <C0644DDAD4D8EB4081633829F94E56F2@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: arm-scmi@vger.kernel.org
List-Id: <arm-scmi.vger.kernel.org>
List-Subscribe: <mailto:arm-scmi+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:arm-scmi+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked:
 bDCbjARGywibM7hltlBIdOTqMWDRf6MACxYRLWO3+hsiIpSdtnEKkZCDdWPMmTj0jXx9nMyNiUAjFd6bU1QRHy9womfMpz87R2xKzW2vzR/rdbvfaYdqHCTDSRgK43UjgyET3aj5dKdCanrb1W6HhRFcX+vkwVtJV6YP0OIdOJce10Nxk1oOgk97ou5QaOEA7hIFFKbXunhvvwF0bLu4SGJjQNjvRJVEOP9EFtzPVqJilWTIvVnqLCNcAtpJauidbayAU1SBx8SKwwhD+ptjGxmQbtwK1tRTn9DO4fDfQiUHCIHtCD+Yp+kYRh9rN4/otZRoJaKZTOrUBOY2WZHabA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR08MB9052
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DU6PEPF00009529.eurprd02.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	88eeafe7-87cb-4e25-7950-08deff984bdf
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|23010399003|376014|7416014|1800799024|36860700016|14060799003|35042699022|6133799003|10067099003|56012099006|11063799006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	iptUlZPZL2Ubp/oKvq0dg0luHhjfFFR78NiXWNpn55hUgvp4VjU6LcPFN8r9fWgZDwleru8IfXS5UTfQhMHoIKBRJiVsyt2FV6+ht7eeDjutezJh7cnntda9vI7iBMOKg73jzXaMR1JtQ3p+F2+mwgfa4dFJs6Wn9wDPR2CC46h1m0qePwNyhZske+/S6s0Mv0TyWPPzXJ6Pu4asC1symK6VEH+8K7DV+M0s1pkQW8Y2Yl0Shd5h4Od2Sdltz6c778x41huUngbQWFfyWjaXj9KJubEU1kqQkrRT1aIVgiQTXfP4Tf778M/6VNXA7Twqtimb2szcMRGR/Ju1q0OtiyuZVXoySTChdBBLWyyUQWXOCE3JPc5m9kk60i+zZLICHDysxkSQ8LzHj9re9qGLxnCx7bnodrdqnElTTVXVye+Sllsv2L9Tl6JKaEdDJ5HQzpaaBCGjMv65a6beZHwNVJSsZ8N+NaSHR4iTjz67gV8ZEbLIyAdSJhBueO0dIkehl9lGkvMBXLrWXaRoEtDGF2oliQx9HNODwhqM8ZfBGa1VHn4rEd1LSeJLfcO1vOHR++VzviY8KXs9MGcrwA7o+E4L9shlZ9CFiwIOwVeLIarlRnq8+Il7/TVgF9DnF5S7J5QWfBD1lDQCKMFWJNT92ib9QYlsyr3BTYpxdOzXar6geSXwDohEE38EREV/8gHU0rMMW2anxjkaRozt3EXbJA==
X-Forefront-Antispam-Report:
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(23010399003)(376014)(7416014)(1800799024)(36860700016)(14060799003)(35042699022)(6133799003)(10067099003)(56012099006)(11063799006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	hvMoJcnaq+b7N3l7ANkHCqueauGtKMG/7So6UZgwFrm9hcmUUOU1CuWmiGHS9WPIdulmKitpRPU1uSGdPOf8KcJrkJoNpEy+bmgZwzIKFSs9v73+h9ElYUnwPGPoW8Vc8sW6qeO9HBrWFhQEJF1RyON5k2d3Ai337tsSsbX+J/VWTs2oJiM/sWSXfiCOw+zkzBUOGqR8cvbiBExDaDp5ULnBnsiaIkzclmlBi3QLhCehKd7gEzHg0kYdFSt9/UK+29gbFcYbEzp0YMHdKpF2lVc/FR+rvteug5oQyMTbm8TCiZXajCGj5Y+CHKPlW4cy+bn1YnlFxVjAnlD53r6j8bGiw1dTdnlFAio8QXQ/GjEUlot5DvnnVPe5Qf0iQqfn3kCgYZiXSL1UwPLL44BeNEGnwYTDBa8Rk+RARNbMg0X4tyaph6RQCJ75rs0StrLm
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Aug 2026 15:25:04.4452
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 01d0ef9e-5c49-42b2-2139-08deff986017
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DU6PEPF00009529.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR08MB8392

SGkgQ3Jpc3RpYW4sDQoNCk1vc3Qgb2YgdGhlIGRvY3VtZW50YXRpb24gZGV0YWlscyByZXBvcnRl
ZCBvbiBWNyBzdGlsbCBhcHBlYXIgdG8gYmUNCm91dHN0YW5kaW5nLg0KDQpQbGVhc2UgZXhwbGFp
biB0aGUgZGlzdGluY3Rpb24gYmV0d2VlbiBhYmlfZmVhdHVyZXMgYW5kIHRoZSBTQ01JIGluc3Rh
bmNlDQpmZWF0dXJlcy4gRm9yIGV4YW1wbGUsIHJlc2V0IGlzIHVzYWJsZSBvbmx5IHdoZW4gYm90
aCB0aGUgQUJJIGFuZCBmaXJtd2FyZQ0KaW5zdGFuY2UgYWR2ZXJ0aXNlIHN1cHBvcnQuDQoNClRo
ZSBjb25maWd1cmF0aW9uIHNlY3Rpb24gc2hvdWxkIHN0YXRlIHRoYXQgY29uZmlndXJhdGlvbiBp
cyBnbG9iYWwgdG8gdGhlDQpTQ01JIGluc3RhbmNlIHJhdGhlciB0aGFuIHBlci1vcGVuLWZpbGUg
c3RhdGUuIEl0IHNob3VsZCBhbHNvIGRlZmluZToNCg0KLSBjb25jdXJyZW50LWNhbGxlciBiZWhh
dmlvcjsNCi0gcGFydGlhbCBmYWlsdXJlIG9mIFNFVF9DRkcsIFNFVF9BTExfQ0ZHIGFuZCBiYXRj
aGVkIG9wZXJhdGlvbnM7DQotIHdoaWNoIG9wZXJhdGlvbnMgcmVxdWlyZSBhIHdyaXRhYmxlIGZk
IG9yIHByaXZpbGVnZTsNCi0gd2hhdCB1c2Vyc3BhY2UgY2FuIHJlbHkgb24gYWZ0ZXIgYSBwYXJ0
aWFsbHkgc3VjY2Vzc2Z1bCByZXF1ZXN0Lg0KDQpUaGUgZXZlbnQgc2VjdGlvbiBzaG91bGQgZGVm
aW5lIHN1YnNjcmlwdGlvbiBvd25lcnNoaXAgYW5kIGxpZmV0aW1lLA0KaW5jbHVkaW5nIHdoYXQg
aGFwcGVucyB3aGVuIHRoZSB0ZWxlbWV0cnkgZmQgb3IgZXZlbnRmZCBpcyBjbG9zZWQsIHdobyBt
YXkNCmNhbmNlbCBhIGNvb2tpZSwgYW5kIHdoYXQgaGFwcGVucyBkdXJpbmcgZHJpdmVyIHJlbW92
YWwuDQoNClRoZSBTSE1USSBtbWFwIEFCSSBzdGlsbCBuZWVkcyB0byBzcGVjaWZ5Og0KDQotIHRo
ZSBleGFjdCBQQUdFX0FMSUdOKG9mZnNldCArIGxlbikgbWFwcGluZyBsZW5ndGg7DQotIHBlcm1p
dHRlZCB2bV9wZ29mZiwgcHJvdGVjdGlvbiBhbmQgc2hhcmluZyBmbGFnczsNCi0gdGhhdCByZXR1
cm5lZCBmZHMgYXJlIHJlYWQtb25seSBhbmQgY2xvc2Utb24tZXhlYzsNCi0gY2FjaGVhYmlsaXR5
IGFuZCBjb2hlcmVuY3kgZXhwZWN0YXRpb25zOw0KLSBmZCBhbmQgVk1BIGxpZmV0aW1lIGFjcm9z
cyByZW1vdmFsLCByZXNldCBhbmQgcmVjb25maWd1cmF0aW9uOw0KLSBjbGVhbnVwIHVzaW5nIG11
bm1hcCgpIGFuZCBjbG9zZSgpOw0KLSBzZWN1cml0eSByZXF1aXJlbWVudHMgZm9yIGJ5dGVzIHN1
cnJvdW5kaW5nIGFuIHVuYWxpZ25lZCBTSE1USS4NCg0KUGxlYXNlIGFsc28gZG9jdW1lbnQgdGhl
IHBlcm1pdHRlZCB1cGRhdGUtaW50ZXJ2YWwgc2Vjcy9leHAgcmFuZ2VzIGFuZCBob3cgYQ0KcmVx
dWVzdGVkIHZhbHVlIGlzIG1hdGNoZWQgYWdhaW5zdCBkaXNjcmV0ZSBvciBzZWdtZW50ZWQgaW50
ZXJ2YWxzLg0KDQpUaGUgZXhhbXBsZSBpcyBzdGlsbCB1c2luZyB0aGUgcHJlLWJhdGNoIHJlcXVl
c3QgdHlwZToNCg0KICAgICAgICBzdHJ1Y3Qgc2NtaV90bG1fZGF0YV9yZWFkIGRhdGEgPSB7fTsN
CiAgICAgICAgLi4uDQogICAgICAgIGlvY3RsKGZkLCBTQ01JX1RMTV9CQVRDSF9SRUFELCAmZGF0
YSk7DQoNClRoZSBWMTAgY29tbWFuZCBleHBlY3RzIHN0cnVjdCBzY21pX3RsbV9iYXRjaCwgaW5j
bHVkaW5nIGl0ZW1fc3osIGl0ZW1zIGFuZA0KdGhlIG9wdGlvbmFsIHN0YXRlcyBwb2ludGVyLiBQ
bGVhc2UgdXBkYXRlIHRoZSBleGFtcGxlIGFjY29yZGluZ2x5Lg0KDQpUaGUgdGltZXN0YW1wIGRv
bWFpbiwgY2xvY2stcmF0ZSBjb252ZXJzaW9uLCB3cmFwIGJlaGF2aW9yLCBhbmQgd2hldGhlciBh
DQp0aW1lc3RhbXAgY2FuIGJlIGNvcnJlbGF0ZWQgd2l0aCBhIExpbnV4IGNsb2NrIGFsc28gcmVt
YWluIHVuZG9jdW1lbnRlZC4NCg0KRmluYWxseSwgdGhlIGV4YW1wbGUgbGVha3MgZmQgb24gc3Vj
Y2Vzc2Z1bCBhbmQgbW9zdCBlcnJvciBleGl0cy4gUGxlYXNlDQp1c2Ugb25lIGNsZWFudXAgcGF0
aCBhbmQgZGVtb25zdHJhdGUgY2xvc2luZyB0aGUgZGV2aWNlIGFuZCBhbm9ueW1vdXMgZmRzLA0K
dW5tYXBwaW5nIFNITVRJcywgYW5kIGZyZWVpbmcgYmF0Y2ggYXJyYXlzLg0KDQpUaGFua3MsDQpG
YXnDp2FsDQoNCg0K

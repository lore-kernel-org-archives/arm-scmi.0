Received: from GVXPR05CU001.outbound.protection.outlook.com (mail-swedencentralazon11013042.outbound.protection.outlook.com [52.101.83.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D97E243B3F5;
	Fri, 21 Aug 2026 15:18:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.83.42
ARC-Seal:i=3; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787325537; cv=fail; b=SbrN7TRwJ0bx5P6nspMa8WDnLxc8iZFpWuJ1p3GYCua8k2/drWqDF6v8wKKpiYDlgPehdUoSDsMxUQdkqXqA2tSCa9KuLo/idnHkLRNWrb5EU+47hv9F0WqSgdC8izteSTdLBLpvhuCPOu7yj43H/Fx121FfOx8QJE0GK34B6SY=
ARC-Message-Signature:i=3; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787325537; c=relaxed/simple;
	bh=/E2oGiQaVc6YGfMJ5ylCNCDfBVJADnTt9fSssl3iZvs=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:Content-Type:
	 MIME-Version; b=hf5VfI35TNacXihjtLY1zaeXQm2Newrr2sGzz1aDNR2bs43lerEmh4+E6qlTZXIvo58Y44dFeSTg+L2d/MvmvjFiNKWfP+4+iO5d5/FBq3iDFeRxy9XUNlzVfUP3rkEQHbYmMusuEGqz9AyPWp60DX7kamTl6KxAtgDHJRYwiqg=
ARC-Authentication-Results:i=3; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=ZWniZjqc; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=ZWniZjqc; arc=fail smtp.client-ip=52.101.83.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="ZWniZjqc";
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="ZWniZjqc"
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=C31+rxApVZEXJ6eM/BimjQ8/cLxRch7F+6qHHSZRaf8Y8wPpqdz8tXU+XLSuW/LWZQndgmag4KlJ/p/pKvHKblB5JwrELbAcGR/jwjG8cLZLe7bpdKN0uRJSx8KuB5cTx3kssz/I6iPngz2gscBYFNSw+Pdj4Xz/jjzDFNWktAxeYT0KiBotOfyO6bpIZlVhn9EIlj+LP58S4NqrK+TPktz8pVicR4oRo+NRmTpiTFhJFLAIEYFFF6hYCS2NPQhYrNZL1Y7ueASeHvQyp92T8qgp8aIjj4v1Y42vItwiLJDdtqq7JEWXJMFH5Hk7pL4/Aadoxmhkrs2zXh+QgIuFJw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/E2oGiQaVc6YGfMJ5ylCNCDfBVJADnTt9fSssl3iZvs=;
 b=js9pyk1ktTUtdS2IDRcAcL0JU+8B0zMKDKkJ85rPOO/cUyBoQiFMH/7dn7ak2yUZTwFuJ9h2hrKjCmWWlv071+Kj2m4m+oWEXUUh4yMfOVWTe/naPkDRYUJXivYqegC870MU2EF7QXhGf/lU7gv1R2uK+aQ1qIsJA0appqQiSKWx5wP6zZuP+M3b3E9QBsFfZX0wfJ7gKW3OrktgLWH5NLbaDj3dWp+n53CD6kFJ/1X2bNsYyHh5x+vjlWzN+RzPc5YCJh8yRsx/jkN9DIdWcpMeEdDU7UI05JEVpm+GE4Ozrn9RWACEu8MQ/HjStj2paqp4YhbmqFjtUyW3SRXxJA==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/E2oGiQaVc6YGfMJ5ylCNCDfBVJADnTt9fSssl3iZvs=;
 b=ZWniZjqcX2JaPwbio3IC/Roe3VQXSmupX1g+H8IsfVoUlrE8rUT4hYdhXfCHG37Wkcsqp7NRA/QNNeXLbK4z8sm/oQqlKbNseSevCjTm/5GLDxD7ZzJ6PlEG8VDjbjXAJ+T/4/eRPVrcPaupOnPuLEQhf+CYiv6FU4qArFNNr7E=
Received: from AS8PR04CA0144.eurprd04.prod.outlook.com (2603:10a6:20b:127::29)
 by DB9PR08MB7533.eurprd08.prod.outlook.com (2603:10a6:10:301::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.10; Fri, 21 Aug
 2026 15:18:49 +0000
Received: from AMS1EPF00000041.eurprd04.prod.outlook.com
 (2603:10a6:20b:127:cafe::12) by AS8PR04CA0144.outlook.office365.com
 (2603:10a6:20b:127::29) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.339.11 via Frontend Transport; Fri,
 21 Aug 2026 15:18:49 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 AMS1EPF00000041.mail.protection.outlook.com (10.167.16.38) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.360.3
 via Frontend Transport; Fri, 21 Aug 2026 15:18:48 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=okHuEqTBTQdEzREjXNekoxEECeMRwaGCZSzQV/mI44hXaTXYyYw9Z5+WZr17TqbX+hU2zkSwZIxcLLdL0ZMtQ5L42docylPCDkhmQLzTDwDi0Bui9ftmeFEJP3vtxFJ6vPnpCvm7yIBFvWpcmAQjoi6xVCJ2tIV105N6Fo1x0nTVsAmwItnS4XmnKCJm1Vt7T2ghA6bsgr7MeUAU2MDS0+e+R0ebVwOCTHib5TOkp1CvSUYdA+NNCMchmJNddaj+JYaht3XCrpUyhd4Vr/ngECPUjhvjOHJKtih8insjMxp8Fyo7iK35upnDLMP73jLWsVwqxkerRxdqnN19mXDlVw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/E2oGiQaVc6YGfMJ5ylCNCDfBVJADnTt9fSssl3iZvs=;
 b=m0/qMVgbBYVJCGbRl8Rrq6N1aoABwSK+JiiQV9dmfMmJVQ/DHC7SqCHD86ZmagvcVqOMHUAu/72nVYFh4gLsUCvwVrAvehjWigB3zZ+5GwdsPURD6sK/z58WQgo0WUjiqt7HvEmhIikZ0nY/Zb2Z/HWU0l0sBa3hfaRQu5qPoye+dSxr5ASPqtEhbbql660P0pLeAQQzVqVXCPlqgxKqb5KmSpJ6HVg4b5H+LAX2jW+kq0Yo0CkMXMe/V3cyfiQODe99UGa3hgY0G/0WRYECUZsP5bL0lf29meqwvpmoABrEZNW305UL0oLDL6nv2ghAU6VgFCIzHDpcxyXg4tTN9g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/E2oGiQaVc6YGfMJ5ylCNCDfBVJADnTt9fSssl3iZvs=;
 b=ZWniZjqcX2JaPwbio3IC/Roe3VQXSmupX1g+H8IsfVoUlrE8rUT4hYdhXfCHG37Wkcsqp7NRA/QNNeXLbK4z8sm/oQqlKbNseSevCjTm/5GLDxD7ZzJ6PlEG8VDjbjXAJ+T/4/eRPVrcPaupOnPuLEQhf+CYiv6FU4qArFNNr7E=
Received: from DB9PR08MB8651.eurprd08.prod.outlook.com (2603:10a6:10:3d1::9)
 by PA4PR08MB5920.eurprd08.prod.outlook.com (2603:10a6:102:ea::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.10; Fri, 21 Aug
 2026 15:18:14 +0000
Received: from DB9PR08MB8651.eurprd08.prod.outlook.com
 ([fe80::8fb8:7cf9:49c4:6f90]) by DB9PR08MB8651.eurprd08.prod.outlook.com
 ([fe80::8fb8:7cf9:49c4:6f90%4]) with mapi id 15.21.0339.008; Fri, 21 Aug 2026
 15:18:14 +0000
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
Subject: Re: [PATCH v10 06/24] firmware: arm_scmi: Add basic Telemetry support
Thread-Topic: [PATCH v10 06/24] firmware: arm_scmi: Add basic Telemetry
 support
Thread-Index: AQHdMYBJghR4LFfueEuVracCDz1Xgw==
Date: Fri, 21 Aug 2026 15:18:14 +0000
Message-ID: <ECA88F9C-7B46-4506-9AA4-7512BA4E8A72@contoso.com>
In-Reply-To: <<20260815232604.3730754-7-cristian.marussi@arm.com>>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	DB9PR08MB8651:EE_|PA4PR08MB5920:EE_|AMS1EPF00000041:EE_|DB9PR08MB7533:EE_
X-MS-Office365-Filtering-Correlation-Id: a40ae126-46f5-4109-a0a0-08deff978039
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|7416014|23010399003|376014|366016|1800799024|18002099003|22082099003|56012099006|38070700021|11063799006|10067099003;
X-Microsoft-Antispam-Message-Info-Original:
 bHpGwAjugy1jzj4LvlDq2Ev8DdGqzNFRTbL+kziLPqFqhmcOXiZU7oQdME1ym3ph6HX/4JIKJRH4XrHW58m4LKk92sVuFjmxkO9nScy1wSb5Fos1f6I3NRBgbZepe9EsmSopLoUJSJLBMmcKzMEzI82CvwQ/frMnLNxSgu50vhEOFtwfP+cQhhfRfldmyG9F273lpCkGO24LFMpq3SMypi7Q6eFELL7mOJ4nNO9VMKOZGM6Q0wOaOf1k4qHEuY8wW6gyjQMul9MeKQr7Gw13K8WpMJWWl9FGC50uQaCiblGL5pkL8jT7zgp+BO8oTGtn2xvBNtJzNQ95AhJT/3ilYJtn1GQQLV4LY1bc8O6SX4V3w3WT4g346M4CzoK4sDDlzJ58+yPqhn3mh2ZfLba6YEV/iqiWM5OqWj9WC9Gy+2xOkoKZgHJ0g/qtCfZph8p/2cQXp/24rLG8rl5ZC1jCFu8XmzgqVIg6wCluPMdTVJJecAu33J8siq8mDOhG5EXUpED/OW3QW/pIskCD2GKFDFbNzccxZsSd9n7NmjPr3ZWkM8flAuv/io2xwUIvTcc25G+twcKf9fNSVN1lKI+oKwvnJVPCpy0pMHEAS5rewiOHwHpOk1BSMtKg1Ivke85MkiQpouKPr7SaTmdTSnAG4jBdPru6NQoGJ1uCYh9eK66KXvFpE+SgjxsWxRZaO2T6du7kKcskB3rC+v5JzNSlArpAJ+/64RXKadIb9Jv/ZTQ=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR08MB8651.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(23010399003)(376014)(366016)(1800799024)(18002099003)(22082099003)(56012099006)(38070700021)(11063799006)(10067099003);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <6BF458F718A7A1458A40A295474C037F@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: arm-scmi@vger.kernel.org
List-Id: <arm-scmi.vger.kernel.org>
List-Subscribe: <mailto:arm-scmi+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:arm-scmi+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked:
 emOnw8Sq3UIix8kODwt+d1zcIMd53oxNvhhy44bkyJh0YcJQvWbeRUdWjfe2rtYosDZUCMrzkgmsD5Bhe9hEL81isOG0pYBQI3Cy+Kb3WLVif8ENHOPLGYQGmKLedkYzidH3t9NfiQOkXqS7ZrMfi46cDDnMQgircHljs8WYvr9nGSkAZ0BQFUEIW+GRRoSbMs7kLKUyquQKj1A5olLf11ZMSOBiwBU2JlSlEhdOhPGG0+mSklZhtCIOygefjpTbdVwhcVS7rNqe+DmXsZMunFLzlBmGH5PAZyvOTz6CXiQYw02mMjt2Yw9az5h4+tkBDHRp2IiCpNMIoIljeWNd/Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR08MB5920
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AMS1EPF00000041.eurprd04.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	a3b0a114-2f23-4500-488a-08deff976bbd
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|14060799003|82310400026|1800799024|23010399003|35042699022|376014|7416014|18002099003|22082099003|56012099006|11063799006|10067099003;
X-Microsoft-Antispam-Message-Info:
	/qCwtELigryPuh9ABEhnDRnmuF8HiOCt0HToi6+Ivew5zcQR9Fx3iIGs0GCgEYNzZ8jyzGbsYvqoO1yQLarxQp29FM2RghPNajF5qLhjCwxbTeN/1VRReu7mktmiPHe6S25gyS/JFfWzQwQnJ+OAzf+1WglOQFdDIcEFdaPHwkMCXVgYbVqt2FPzNB3oXgiea/bZnBHlICTTU1wP8hMyPMEkkp+6cFdaN127D+tXA3Bn2f39/sL42swACHsIQSDhJG0PttnfyPTJF+07WMY+Cs6BOlI4L1O912Q4PvmZhRlKy0hXbChuMG2vYTCtgzNDW6VSXzCgexgP8psWpOY6G3uPDE7lhWJ5lVfvMm51Bhc9Uz3ULCGxbg+XdwYVvdUbFrEJnldlu3Q/QVw/DpKOzMiqSE0oAUxb3YDu4pPuRvTldqNW5t/2szoeZwc0OGI8f+CkRxQ7Usn1MdzPUa6puCAi6BvoB/w8kP+HJjzlLFwC9FUYwjvBvNtd1mZh+xjJ9PPoHdhaV9bCzRCQhDC0uhl7jp/ZJBfkn/4865SDL+YxnvxqbEc2LwFu0TLRNvIw02AgbstCYG9iTBrR6Vw/atSm1Mhxrii5YH2Xl5C6fXWyKEM8C6qLSavvonxcDIfyL/pcmnXONHU7iUyU5/AEW/wv41ofjsBs4MDlzaum7AIRaoojbTpgc9f0NNemdrBi9hDKyn3vPD8Vj/255HYTjw==
X-Forefront-Antispam-Report:
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(14060799003)(82310400026)(1800799024)(23010399003)(35042699022)(376014)(7416014)(18002099003)(22082099003)(56012099006)(11063799006)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	nzuofmvLi3J/CofhM1SiMN20Bu9sOLt8dF380aRPKxMP05peAVJQAcniVxqWS0J1od/gUM4BS45Z81tVFxqxy+9gBIkhYRIRj+by12rMDX7kWuSjpTt64MdlmapFgE3ZrGi6lxatRp9nF94IH8cx7RXbYSUlLgzEo7TAqupKp+Mez7OeiAb9+BqexQlQo8pgqrJQXa7e4jO9JOtSw7X4Lyw6MohPgCovAGTWz21yJWcr72XEhs7pmZQC8zdnZi0l4+ab0RdCrFr8y1y95v9C1TftDvXOoQW2rFCH4Bkbm8a1oTghYW0mucqODHg/JMjA+SNN2Ep5PEZ2i67BG7h3IFr3+4CEvDnAfOKjIuHQYNty9iz8fD/u3FV25FwF6CD9SpOWjm4JYPOvZVwZm1WX/QROV79guwm3qPnAOryq4B0aXzIAPcvZP5fkIXqcZIiZ
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Aug 2026 15:18:48.8726
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a40ae126-46f5-4109-a0a0-08deff978039
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AMS1EPF00000041.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR08MB7533

DQpTdWJqZWN0OiBSZTogW1BBVENIIHYxMCAwNi8yNF0gZmlybXdhcmU6IGFybV9zY21pOiBBZGQg
YmFzaWMgVGVsZW1ldHJ5IHN1cHBvcnQNCg0KSGkgQ3Jpc3RpYW4sDQoNClRoYW5rcyBmb3IgdGhl
IFYxMCBjbGVhbnVwLiBSZXNldHRpbmcgYSBuZXdseSBhbGxvY2F0ZWQgREUgYmVmb3JlIHJldHVy
bmluZw0KaXQgdG8gdGhlIGZyZWUgbGlzdCBhbmQgdW53aW5kaW5nIHBhcnRpYWxseSBpbml0aWFs
aXplZCBncm91cHMgYWRkcmVzcyB0d28NCm9mIG15IFY3IGNvbW1lbnRzLg0KDQpPbmUgcmVzb3Vy
Y2UtYWNjb3VudGluZyBpc3N1ZSBhcHBlYXJzIHRvIHJlbWFpbi4NCg0Kc2NtaV90ZWxlbWV0cnlf
ZGVfZGVzY3JpcHRvcl9wYXJzZSgpIGluY3JlbWVudHMgbnVtX2Rlc190c3RhbXAgYWZ0ZXIgcGFy
c2luZw0KdGhlIGRlc2NyaXB0b3IsIGJ1dCBpdGVyX2RlX2Rlc2NyX3Byb2Nlc3NfcmVzcG9uc2Uo
KSByZWdpc3RlcnMgYSBuZXdseQ0KZGlzY292ZXJlZCBERSBhZnRlcndhcmQuDQoNCklmIHNjbWlf
dGVsZW1ldHJ5X3RkZV9yZWdpc3RlcigpIGZhaWxzLCBmb3IgZXhhbXBsZSBiZWNhdXNlIHhhX2lu
c2VydCgpDQpmYWlscywgdGhlIERFIGlzIHJldHVybmVkIHRvIHRoZSBmcmVlIGxpc3QgYnV0IG51
bV9kZXNfdHN0YW1wIGlzIG5vdA0KZGVjcmVtZW50ZWQuIFRoZSBjdW11bGF0aXZlIHRpbWVzdGFt
cC1lbmFibGVkIHN0YXRlIGNhbiB0aGVuIGJlIGNvbXBhcmVkDQphZ2FpbnN0IGFuIGluZmxhdGVk
IGNvdW50Lg0KDQpQbGVhc2UgbW92ZSB0aGUgaW5jcmVtZW50IGFmdGVyIHN1Y2Nlc3NmdWwgcmVn
aXN0cmF0aW9uLCBvciByb2xsIGl0IGJhY2sNCm9uIGV2ZXJ5IHN1YnNlcXVlbnQgZmFpbHVyZSBw
YXRoLg0KDQpUaGFua3MsDQpGYXnDp2FsDQoNCg==

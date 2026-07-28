Received: from PA4PR04CU001.outbound.protection.outlook.com (mail-francecentralazon11013054.outbound.protection.outlook.com [40.107.162.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B5A241DEE7;
	Tue, 28 Jul 2026 09:54:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.162.54
ARC-Seal:i=3; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785232493; cv=fail; b=AZI1mAVJCvx/BCk11I8V5DYsSDx8kwXVmleGkpb4gk5JhZRuvve20WpTb4VFsAJF0x/yAkh5oHf/BgMBpZhBT0vZPHqPLNPMkW8msAcY8GkVX3jNErHD9HpqKwAFIubZEXdbgACMtdNzA+EXQP3D0nO9E61OfygW183vKcNjWdA=
ARC-Message-Signature:i=3; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785232493; c=relaxed/simple;
	bh=RJVFdjE7ZKFkH08iAXwbKGm6Zx1rMwKW7b64IVRQliQ=;
	h=Message-ID:Date:From:Subject:To:Cc:Content-Type:MIME-Version; b=BZ4OjU8ym2D0mr7ytFCLEIKyjT/WkclG61hEKv+bRV99IXOaXDRb2WfoVOkpO/03HSuDWqDEpPJAIxIsV/ibMrq0ITVR5vPoVAo3h8SOY0W0TMofw8SL19CrlUu7OtIkEpAe6sNhUTr4HWAsh7eztB9ETQfGae7/fVK/xi/7FZ4=
ARC-Authentication-Results:i=3; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=fJdA9YQ2; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=fJdA9YQ2; arc=fail smtp.client-ip=40.107.162.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="fJdA9YQ2";
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="fJdA9YQ2"
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=NgRy+l26EQnZAfBkgbA65wS9zJviA/xclsLo33gwiJ6kzQ6wrWYdSUKcuROVAq4PyaVEZboWpz/Bi3UVLRrqpDcfCOl2JIt8QcSTGtdll3KqU3GCSG0XyXbE5Os6T5URpdSlAtpYJpddlr1PRPIiWtlh8XQnyWRMxWKpIpAplRHVArMApQx6gVt7rwKkKXQUk8JKSP6xwbcCxTXfpcyDkcCd1orjSrnHkjLo8/xYfFHISr5iGp2rfom3tls3hMMTemiVnEEZVVAllgdJqVv2/0Nak3rWQxNJLTCLdS1Q7MZ5Z7aiDbF6pJyr8QfkA3RVrYn3gC1nJVJj7sP96MZf/A==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5UAX16jx//0WXKRQFkKl3BSONN5jvNz2hlo8N3brsww=;
 b=c7kDxsq53s0s5GUtY3KC5nVydclOMzB9RK0lLfVMqdQBkhQ29aQkEAWd5DuZmS4Oq4QfpkXXhV1C841Jqm6gOL9ElgzrS+NP9t2AXW9j7Yyy8rsM0eFTK9Xbml+UXdw++FzK39bmNkGjv+fXUfhpTmvxcxqGGeQwsq8cmv+WJMKGTtPRtRSDlbr8wJL2bXSM67rSbjjIQnmL88Mxj94GGrb6jNVF2YjPD1TUr+OzsTg8bE9ReFodYLl5n8Y6XbPnPjk1ooDwbywZ97//YTRDosWS9HVgb2EiRQN+js79y+DEMno01Hoe7tORxRmcmzewBaoFXgSxXVtnPWL/0zdPwA==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=kernel.org smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5UAX16jx//0WXKRQFkKl3BSONN5jvNz2hlo8N3brsww=;
 b=fJdA9YQ2B6IUwcbyul8/LxK21dQ+8veEY1sipqdZymcLfivZlJ5t+XAF6Uy8PDRG9VrUCcm0oVRXtSzO5d9jkPYZaof9G0OoDrdhLiyMafQGzQFu623tYtsWar0O7rmAiOXFFMPxbVlUzgvR8gUaPsNZaGI6c1UB0oK1BFO6CEU=
Received: from DUZPR01CA0303.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4b7::27) by DBBPR08MB6057.eurprd08.prod.outlook.com
 (2603:10a6:10:1f5::23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.13; Tue, 28 Jul
 2026 09:54:47 +0000
Received: from DB1PEPF000509FB.eurprd03.prod.outlook.com
 (2603:10a6:10:4b7:cafe::78) by DUZPR01CA0303.outlook.office365.com
 (2603:10a6:10:4b7::27) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.245.13 via Frontend Transport; Tue,
 28 Jul 2026 09:54:47 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 DB1PEPF000509FB.mail.protection.outlook.com (10.167.242.37) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.245.5
 via Frontend Transport; Tue, 28 Jul 2026 09:54:47 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tz8jNAtW4JvBDaFxHq3nX+DRb3N39yjMlMr9OyYqAXJLJBmUPC2QK/7+CWmcW6RjQXP+2CLzyndgRPV2RDQ+agNvQm9lMBs/gJfFIP9g+JSKVGWp1CCAFyiCfxUqwGZZdpeGfuCKIDE92ghftFcT4wfjLq+To+N2YsdFhTMd2zPRfbLbk1z+MYiwucPizgCt0BUygnbWbpK2KxMLrmz4az2hsnWn3+4Z3KX+lKxL5HrqJXp+OjLu21LkWD0gLT1fuw4JL45t1q8qYfE7F6+ulKXqlGRaVkOc+dcGLMJYH54S/001+MQoRX9Gm8pCPy/eYbpPhYJFHPmK9piJUFh8RA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5UAX16jx//0WXKRQFkKl3BSONN5jvNz2hlo8N3brsww=;
 b=EE7PLBtEQ4F4WB1j4THusvGx6jRrB7Imh64y3HiCotHov7Wr1k+J7NUBg2Mc5VFMLJvf7YShhIzO5oqTHRZ8Q8lDzxsvftTQDWB7QAl9WSYvDiA/BmiwD9eh+0Y2kJCkB+40+iw78kMuCzJ4A31OeDRHbuW+J9XCTrP/ZIJTbDeK0d6vfZaBRm8PRMa6hcsxylpu1WKCa4OnlP7qTlG4YNDpX/l9uvcNc+9CFW/gY/wVU1HVZ1Hck025IaeIwGmLHEol/O/kotCDV0Tw5I8lxj9dVre6yf9swr+acQNC/5tp4mWqBZFE16GAPT8ad/IptpnchLpCNlfqouivTkpZzw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5UAX16jx//0WXKRQFkKl3BSONN5jvNz2hlo8N3brsww=;
 b=fJdA9YQ2B6IUwcbyul8/LxK21dQ+8veEY1sipqdZymcLfivZlJ5t+XAF6Uy8PDRG9VrUCcm0oVRXtSzO5d9jkPYZaof9G0OoDrdhLiyMafQGzQFu623tYtsWar0O7rmAiOXFFMPxbVlUzgvR8gUaPsNZaGI6c1UB0oK1BFO6CEU=
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
Received: from AS8PR08MB6792.eurprd08.prod.outlook.com (2603:10a6:20b:39b::13)
 by AMBPR08MB11938.eurprd08.prod.outlook.com (2603:10a6:20b:760::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.13; Tue, 28 Jul
 2026 09:53:44 +0000
Received: from AS8PR08MB6792.eurprd08.prod.outlook.com
 ([fe80::fdd2:5644:d408:b3a7]) by AS8PR08MB6792.eurprd08.prod.outlook.com
 ([fe80::fdd2:5644:d408:b3a7%3]) with mapi id 15.21.0270.009; Tue, 28 Jul 2026
 09:53:43 +0000
Message-ID: <32d8c83d-7e70-4b1c-8d6d-12920f6c67ce@arm.com>
Date: Tue, 28 Jul 2026 11:53:41 +0200
User-Agent: Mozilla Thunderbird
From: Laszlo Ersek <laszlo.ersek@arm.com>
Subject: #thermal-sensor-cells under protocol@15
To: Sudeep Holla <sudeep.holla@kernel.org>,
 Cristian Marussi <cristian.marussi@arm.com>
Cc: arm-scmi@vger.kernel.org, devicetree@vger.kernel.org
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: LO4P123CA0605.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:314::7) To AS8PR08MB6792.eurprd08.prod.outlook.com
 (2603:10a6:20b:39b::13)
Precedence: bulk
X-Mailing-List: arm-scmi@vger.kernel.org
List-Id: <arm-scmi.vger.kernel.org>
List-Subscribe: <mailto:arm-scmi+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:arm-scmi+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic:
	AS8PR08MB6792:EE_|AMBPR08MB11938:EE_|DB1PEPF000509FB:EE_|DBBPR08MB6057:EE_
X-MS-Office365-Filtering-Correlation-Id: 5474576d-ebed-4a4e-ed12-08deec8e4243
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|23010399003|366016|1800799024|376014|10067099003|56012099006|11063799006|6133799003|3023799007|18002099003;
X-Microsoft-Antispam-Message-Info-Original:
 YmR8qNDR8qbrOWuMS3cV/gX77kEXLbY1I1iPXHeWWYOPC4y3S59gnSv9qX6sSP+Ospuwe3cuKPBfWGJXAoZR0tX7Z/cEr/Hj7SPQsxyCEE87gWvc8GgElMijOrWKb1grWv/seGJ5lDXPm711K4CFG2rxHRqfUOnuoI1Qh5l4wSEdkmV4OWZtWPJityPjQhMcWA9L1BbrWnpAWQzsrghDAvua6zeOHjQj1umZZkUGFVN2TTPQoYnCw1YctYo0XAGE1KQ+Mk7cJw3Lr5SPYQDrAJwms/G6dEIBTL/RJhx3D3s2QiECekQn/4jFxIx1sTHtj8Wq1wdVBYteamIUNG35QWqK/vOBBpgI5qqECPEugQ1KfehpMEN1LB52TmXX0lDK5qZuEMsuv2L5fqlv/00QPWfZN2a5AD2lTFjHHFGpueTsRr30Y7g50HaEYELn9RcvIvuYDjJ3/LTjGqgGN2Bg+eNBXfF3lafOG2kk4fWpEORmBVjbVMpR5W536tsHK13hDi14AnyOi1VDFddcmj2t80ucB3/oRjwM1/GNaVF869mPMkE6nOCF/oWxwOODFJZIZh8BX7CV68WkHrdIqsdk0cQCn0v3K//Gvj91ALN4GSEG9fOqLxlKAMLKMk65k8NbgNLY3BCirylBxcTsUU4mG8EkexaPOinuwQCgWjksX88=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR08MB6792.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(1800799024)(376014)(10067099003)(56012099006)(11063799006)(6133799003)(3023799007)(18002099003);DIR:OUT;SFP:1101;
X-Exchange-RoutingPolicyChecked:
 ZEMpfT7Vw5RCRMyzWpkFAaRPY4AhHtoYXgzo+2W7dwRy1rtE5sM6eQB+xFvXZjCT4rSy7eyrs7n0+NJQMvlLxD662Xur5Cr8J35V+pP6QoNwlhVSKloUHIy/SVm8+BgF4s4bBMHo0RV373aG9zN0aAlv5JGfQRoE8zDfZSL3SNE8HjKsbu4Uv8A3HaMpGF7XptmW1uAEdlHpIr203ZCQwCJM9IYzBP1eSaB50mT6CXnDlYb2vPqSRJiqmVLwScs/xwAdBZk3KJt/4V7SEYnfHnLrkoU69TNK8hxVO2txhJ7HUpi++ipCZCp4Buh28/37J1BnfTz0eiCBMrBUh//kHw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AMBPR08MB11938
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DB1PEPF000509FB.eurprd03.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	c231fe01-8691-4228-11c7-08deec8e1c29
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|35042699022|14060799003|36860700016|82310400026|376014|1800799024|23010399003|56012099006|10067099003|6133799003|11063799006|18002099003|3023799007;
X-Microsoft-Antispam-Message-Info:
	a84v1DtD0W9HSmo54mkup04sp5rCeQHF+Uk9VmdwuS9fzPIoWwY0IW55wrAlZ/KF1zf1VeNIecYWsfWiXV+VWWVn1jlKLoGPYGpTHE8yz/z8oBJm4yBy3KMGoW8gNRu1INO2Mhu2EESgbY5qWLuKjd8JecySaKQEq/sUB7EemBZ9Ucn6QYyQfO3ZASTSIwJwEAD/m69MS/qsFCcNb/z+wqLhcvH5Y9FMsihInQcFIJ0YGaccH8AMOKYZzKnxdXP2AqWenmDP5jkL9ioE47JUKTGakk01PW1AjXhGDbRmZ7wknyc3tL2DoyqOkKldR/irA2d0/OPrPBKyGs3Lddj62ayCURMRy9U8i1NPlq41+j70N2hR5HG84aNCihCuoM95ZnW6/cRaibjVucjtxdQUVFlmo9NcMRD1FZJJ7+C0bDJtoWGjcS1jqjtOzl+6L4GS7cwK3Lc2BKD2+dTTR6YdYCzw7ruu4FQJQpDbBJbojT+lt6yv3qb+4WigEX4g9ol3lZCkt8DKCAzJZJyUFvCW6rAmEEMnA6Bc3/NjLx1yxh1b6C5ZVJnvudYGaSK/zxaVXX7dHrbmdr+jW6NgMCBhiiwSfjbfMcOHJgotzj0arf+hBA9LI69edjPEnUk3Tq2xa5l9dRaxr7MtYcKfpQc05ZQ31DhJJvEw8UdiThJ7uy5ggP1e9CxpJV1U/O/uPncy6x0P930gELIaFdIGmbkjzQ==
X-Forefront-Antispam-Report:
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(35042699022)(14060799003)(36860700016)(82310400026)(376014)(1800799024)(23010399003)(56012099006)(10067099003)(6133799003)(11063799006)(18002099003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	Htu1q99GASzTfqgw6ETZil6+0CsRd6J/w3JNDlpRhEg0joa5vdSIAC9Z0As18ZEoHP6ZOY1y+pa0yL8KlStxYBtMn4t7DIHxQdKbCNZO22yITj+t+lHLOeQJ9+gnyFXe5Nq8XaMIOZylH+CQcJLONDfRN+MpDzHCYtQrOYjuaUUO009Fi5YPi8iMy04MPMSN5mC0hYP5PGfBt/43fvm5S4MGLxqMwKkv+cbl3He7AWuZYmYz7y8k7XPMP+mcPfBq0/+eGcLS+L0WGkHuM3v91T9Iab8OsspbmklrTYRfXMgXbHEd0KzAgKnU3ko9HIsg9ViA2U20ZDlQq4Jc8r0GjAwj6EIlBmWzqbzmUfzTH29hY1AqpzttCdMG3uuMOtGE5UkY8uySKAbHKh8azTlkAl4s5jv8DXMerw3c8dEpeYRVorNSK+0Brxon2mGx0Lmh
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jul 2026 09:54:47.3489
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5474576d-ebed-4a4e-ed12-08deec8e4243
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB1PEPF000509FB.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR08MB6057

Hello,

as of commit 62cc90241548 (=C2=ABMerge tag
'mm-hotfixes-stable-2026-07-27-14-18' of
git://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm=C2=BB, 2026-07-27):

"Documentation/devicetree/bindings/firmware/arm,scmi.yaml" specifies
that for protocol@15 -- the SCMI Sensor management protocol --, property
#thermal-sensor-cells is required (with value 1).

I don't understand this requirement. According to now-historical commit
fe7be8b297b2 (=C2=ABdt-bindings: arm: add support for ARM System Control an=
d
Management Interface(SCMI) protocol=C2=BB, 2018-02-28), #thermal-sensor-cel=
ls
specifies the width of SCMI "Sensor ID"s used in sensor references made
by "thermal-sensors".

But a platform's complete set of sensors may not contain a single
thermal sensor (only other sensor types). In that case, the driver file

   drivers/thermal/thermal_of.c

has no business connecting to SCMI (=3D no business referring to Sensor
IDs; consequently, the width of a Sensor ID is irrelevant), while the
driver file

   drivers/hwmon/scmi-hwmon.c

may still justifiedly want to consume protocol@15 (SCMI_PROTOCOL_SENSOR)
from the device tree (i.e., to expose SCMI-provided sensors -- *not*
thermal sensors -- via the hwmon interface, to usespace).

And so describing protocol@15 in the Device Tree, without a
#thermal-sensor-cells property, looks like a valid use case.

Am I wrong?

Thanks!
Laszlo
IMPORTANT NOTICE: The contents of this email and any attachments are confid=
ential and may also be privileged. If you are not the intended recipient, p=
lease notify the sender immediately and do not disclose the contents to any=
 other person, use it for any purpose, or store or copy the information in =
any medium. Thank you.

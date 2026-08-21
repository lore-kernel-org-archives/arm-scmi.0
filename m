Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11012040.outbound.protection.outlook.com [52.101.66.40])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3243429CD4;
	Fri, 21 Aug 2026 15:23:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.66.40
ARC-Seal:i=3; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787325829; cv=fail; b=rOeeKkhuDlFIOblWGBiqK/MMSkO2Z1eV3VNXj4e6IbGJKsg7oA/kjAHBYtjPIw/aE22czDJ1M6NzlBm0NgxTclQkoHsSREbgGl+tFYYJxiIX+AnmdCJq8GK1WiNB4bhUHgQyz6Xt63gjsSZeMH+bUNA8dUJlHWeB8XwRhUB0Tbw=
ARC-Message-Signature:i=3; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787325829; c=relaxed/simple;
	bh=d/GXT0s/XxpMMGmnpU/jrrdeRvWQV4DDPnR+i2GxwhE=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:Content-Type:
	 MIME-Version; b=sgkTvOmz9cTV5zolkA1L7UVnoERhbM1ppfDPoKYRMBHDgWWHqm8V6teuy/xc2uHBpD813QPAO2RyuRP3z4TENp5WK08WvEkbiwZX823kOhBCuVwjUPGT06WXtRnWwlNqQqJPU3eq0Xr+mpkNPxV9OyWRTi9a1N2Vw+gcQZEPJ3U=
ARC-Authentication-Results:i=3; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=YTMHW3Jw; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=YTMHW3Jw; arc=fail smtp.client-ip=52.101.66.40
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="YTMHW3Jw";
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="YTMHW3Jw"
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=t6mc9QTViTegLfR5ax0L7bHKqxCco3JJpJMFdgmqkx+DpCte7EAYTdWA8lI9nSlrQnCevRGTYp5Y6rzxbc/mG041JnFjdJ707hpqr4pThrJgerdIRLFO5Tkigy1lG5UOoIoEITI4lMPb5VToCb3SJSU89Tqs9Pd38WTAkr2oMgk7mXthrrQmMltHfReelXORaqNDY5XRC85q2cFCRDhfw6IKm3mgmhYb2FrHZOBtrs0Dca25r9R9WI0VSq/qDrYC+G+9fjBIJ8gcTuawPIjl/6vkmIvgpe5WSp+T5rqMNphBKiPR9yBLq4YPFCZtOv5CqgphrpGKvBmmmu0gAjRD/Q==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=d/GXT0s/XxpMMGmnpU/jrrdeRvWQV4DDPnR+i2GxwhE=;
 b=ukwdApmRZjBRD2J58HbvuC6Y9ifOd3WYt+2AOaFCAmwl7zmoaUgc3nlijpldPp3DZYTbZAQ7DgHUWisGnR1TDWD/3EnbQoRxhrZjKVbV1odZcMUOEW3DZLlcz1EbVu4gSRcEjlaMeIbWZ5wRdwk5ujRa8stsTIIQMVuDx4f9GfadAszdKkEAoADpjrTrxEARPcrs4J5NuYt9ccPIo8RFrR2fUVDJr3sUsTUVxREwdrfQZgJ1W3uwOUDuTWBet2Hep1/+Duu+PlbnPU66BzezSIApmu5oKtuXS220HcKLTQ6mD6mvJvBpR4A/gnKEMuBJgd9RueTNvX4hwBhJA9Tn2Q==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=d/GXT0s/XxpMMGmnpU/jrrdeRvWQV4DDPnR+i2GxwhE=;
 b=YTMHW3Jw+V63cmHknHrWe4mbAl8tm4+mKHF/ti8gJP7iQmieAamLTLPIWNV3kdwuZWYkKjeT677F5RKPxsbVDhZ5ttgF/5ESFE3bMou1FZ5l4Ap7PrKuVVQnZ7yEifIU4mRaGG5HvzJM0Cid+ocVqhbnNTswRN92dgbyJPY3ZlI=
Received: from DU7P250CA0011.EURP250.PROD.OUTLOOK.COM (2603:10a6:10:54f::26)
 by VI0PR08MB11514.eurprd08.prod.outlook.com (2603:10a6:800:2fd::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.10; Fri, 21 Aug
 2026 15:23:43 +0000
Received: from DU2PEPF0001E9C3.eurprd03.prod.outlook.com
 (2603:10a6:10:54f:cafe::2a) by DU7P250CA0011.outlook.office365.com
 (2603:10a6:10:54f::26) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.339.10 via Frontend Transport; Fri,
 21 Aug 2026 15:23:43 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 DU2PEPF0001E9C3.mail.protection.outlook.com (10.167.8.72) with Microsoft SMTP
 Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.360.3 via
 Frontend Transport; Fri, 21 Aug 2026 15:23:42 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XKblGM5UF42/oz3stUo96JPpxRNLX9WJDt3gcy2QToyJYHOJ6mAtjZwJqicERALExfe4OGLPxX8OJperHnYPVhEU6+rj+icP7upU2iMDWX5R0Kuu8Res4aMjOfaQbKQsC34FOxLLTCo09PKFJjFMwrzQQFvmYcH1SbGrr/Ww3C49FSPjA+y5xQrkbpuQEw93UWug87rH4ABw8hmVGGiJwXAFHD1T2WLASZLiwzyX4YWluPEzJpVa1jqoDJTdcQpgHaoZp8r2u6cub0eZgZgKzsKa3TVk+KDhaPNPd52bUnyDDZVS3WOAjjqKNfTUgb7b6GSo7cI6t6F+aLzfrn5wkg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=d/GXT0s/XxpMMGmnpU/jrrdeRvWQV4DDPnR+i2GxwhE=;
 b=O2N9XYv8wQQgdF8p6aKfysEdWcJao9AM0B4DIDdlsoqCQAlblgg4Jql/OWwzI/bKIdQCWyCXv18tI+a/L39EhH0OIDchLOzmVy1Ay8rVAvOck6BD5pH4Z3/MhOrjMKUbCqyZwTzzx0KZ7qEz0vxokuPE87XrBSEhYuytidkvSxw1fnZuoWFog5gAxqVN7SXikrllgdWLlzIXqjP0vxxmAd+10hZAxLDj/+BCyne21TQCZ6t3KQdaQddsEIj7pT0Jgzg2zGkvGD76P8+JcVbV/lncV9EkgCsAtyPM7sJ839cH43FxvARCgaTWFAxVCfawV5FkPmRhcbF3p4RyAhY2mg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=d/GXT0s/XxpMMGmnpU/jrrdeRvWQV4DDPnR+i2GxwhE=;
 b=YTMHW3Jw+V63cmHknHrWe4mbAl8tm4+mKHF/ti8gJP7iQmieAamLTLPIWNV3kdwuZWYkKjeT677F5RKPxsbVDhZ5ttgF/5ESFE3bMou1FZ5l4Ap7PrKuVVQnZ7yEifIU4mRaGG5HvzJM0Cid+ocVqhbnNTswRN92dgbyJPY3ZlI=
Received: from DB9PR08MB8651.eurprd08.prod.outlook.com (2603:10a6:10:3d1::9)
 by DU0PR08MB9052.eurprd08.prod.outlook.com (2603:10a6:10:474::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.8; Fri, 21 Aug
 2026 15:23:09 +0000
Received: from DB9PR08MB8651.eurprd08.prod.outlook.com
 ([fe80::8fb8:7cf9:49c4:6f90]) by DB9PR08MB8651.eurprd08.prod.outlook.com
 ([fe80::8fb8:7cf9:49c4:6f90%4]) with mapi id 15.21.0339.008; Fri, 21 Aug 2026
 15:23:09 +0000
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
Subject: Re: [PATCH v10 20/24] uapi: Add ARM SCMI Telemetry definitions
Thread-Topic: [PATCH v10 20/24] uapi: Add ARM SCMI Telemetry definitions
Thread-Index: AQHdMYD45hH+am88gkezsV8IJlk9RQ==
Date: Fri, 21 Aug 2026 15:23:08 +0000
Message-ID: <F461EAD1-E5F0-4B21-BB6E-3BD3750F3BBE@contoso.com>
In-Reply-To: <<20260815232604.3730754-21-cristian.marussi@arm.com>>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	DB9PR08MB8651:EE_|DU0PR08MB9052:EE_|DU2PEPF0001E9C3:EE_|VI0PR08MB11514:EE_
X-MS-Office365-Filtering-Correlation-Id: e1c8bf8f-6d15-484e-5a3d-08deff982f85
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|7416014|376014|1800799024|23010399003|366016|38070700021|3023799007|56012099006|10067099003|11063799006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info-Original:
 6OOKJAuo89T6UyKlx6/bqxlcq9Sus9ouUh5L//V/CZTZYcaEgMB1DsZkGCeS1XQpqu/dan+HOOCM2xq9MOI8W+PgA3jrbTHFTwFSqRwHHquZ8MEJzbz4X02xX99WEnIpy2YYmmvI0ccRjtO2R6PEDmSvrNWzr4u6QDSpuO95Gd45uuvWIOAxO2YtZbs04zJUyzjfSttQ2VP/jQTllYnxpE3McxngQ2SkjkL5oE8GhaywlIzZteVchGTFsAL+apD0iKF7CNgriTIyqxVL7JLU+H/iIIR4HJGM81UdeY0408cWjFmlVtsZou6p3t2kJylR8AbvP4GpfShOHl/L3wsfQXLNeETpetAKKGl+FA6ANHO1uXqsSvlNDmZk0IUeLLeDm9kZRhs5GxBJZMm03hVLDSt0wAlgWkidYLd8I+Tiab1P6GUv/fTLDAJ9sSrZtlQ+VN7zt+bmxVmPT0ndSC7yxSE927aU99YFLgskZ6ynGVeP4t0GiXr5nF8hrC8rMptkKgNX/q52zYTnK6mUVvzppMCR3vA2nFG8toWmsUF82SscAJrNgQR2r4AJ5ETn9Z+1DMcSP2hX6GFUysKbCZN04+4cJjP1+7dKpBsRxxbfCcph+lf67eJy7YEDKwfoiMPVhZU3nDRKAZTL1AJVYa11tjDVeUeHwwHGfHR8wOPreFMZHeqkN8WGC2VFS6+Q/R/VnerhFoSU6Zjyxpo/bi3r150XF2zq1X+laRKxUHguGtU=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR08MB8651.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(1800799024)(23010399003)(366016)(38070700021)(3023799007)(56012099006)(10067099003)(11063799006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <8EC2A2905C0A384E88B506BCCCD2ED78@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: arm-scmi@vger.kernel.org
List-Id: <arm-scmi.vger.kernel.org>
List-Subscribe: <mailto:arm-scmi+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:arm-scmi+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked:
 B6opGaw0wWjz2bD6h6YBtP9fFZmZelqw0H6Pb+rcuQoV/puVBOZF3/UjJYzQY8Ch4WwwGyjN0ggHTAAyOOqTgfH/E8BIR4DwHGE6yIWhlb8h7DfVYl8/8WCcTI5AwrAS6/L1KRxtrxa1VOqN78Blkaoa79wQKedRvDgJf5T2GvdUn0XAkT69cIfx4JLPRrc/i44KgClUKPFY+gt62t5S/NSv/xYjg8cD13/w/Ed3D0IYnDbsNChZw4QO09AyzsiXs6er1aiY1tZy7bbh8Zskoux+gikHuJXGwhswRQnCRNQD/Yw6x9bn7hju60paEB+qtW4ovuxatCm7z+F1zNI2Fg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR08MB9052
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DU2PEPF0001E9C3.eurprd03.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	be7f11f7-592a-4bdc-070e-08deff981b42
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|35042699022|7416014|376014|14060799003|1800799024|23010399003|36860700016|11063799006|3023799007|56012099006|18002099003|10067099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	6g7zP1/6tXpqKOIZ2UpqPl81gzH01nH89qCQE3Y0dw4bdvrmCRONDAVwHyyHtY9do8Zcn0ZJjtpdplAKigrKb+nlxQbYJJBjdCcMERaOhEQPu8iEFXn5CgGTEHiFuZwc8cP3CPlgsCTRJ37SATpL6zHk7iejAPMgswelIZDkM8p0KshUwn8egIhemP8qdzBs0Te8UAMXh1TMiIH6DsYBFQChbvXeC1dFbNgMt489GDL1fUqedSR6iNS4jUJ5aBW6YBW+VN3gCFFde1HU83KNZbA8Hl2426Umv8sN9Y4fWxHdU2kcHcgjRjMDlAVNU1oaAdfFf+z3grcQRec1QG7Ux+/FOQzkYE1ImyxMD/Sp7eRgOI5tgti94jwAvnuUpevm5qvrCmlagqzVN3P78+ETBAlmW6fhhql0CAU2OjAvGd23vDlMPh8c063+e8zS7F/NVPtw+aoCCEZjzDrZAxa4BtHZW9kXrgEdMQr5F6hf0bURkRIlNE3SvyU1L3yAVdWOEp0PpUz+4nIt7chQz8hR2HO09mXTc4ekTR318W8KBSTK+pGf2MbYu0ldzaTddG+zkjjAVVN4RLvTE8T94ht5bYuhreyxzvyKv2jQbxLvGbEXctqkWej6DlKDSf8VXpQDP24tYUmxWZmiepVMUeRX0cI5FK59OQjiH7OqhLoijwe1FOteB9fqb0btR9kAfeIi8wxoceGUwkuUe0cdQXJppQ==
X-Forefront-Antispam-Report:
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(35042699022)(7416014)(376014)(14060799003)(1800799024)(23010399003)(36860700016)(11063799006)(3023799007)(56012099006)(18002099003)(10067099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	tv643KBq57ByFhRY8mZcq25JapApp03E/M12+2SxvuFUsDt2z7YIxsSH52bq1Y+AyweIpoTYNrsgA6URdZlUjCymrWtqpVpf3kwtEubXkg6idN4RpMHuNImcRBTIkiBsz4Nc84AaPEPA69FMWTcv0DRabJ+265Y4dTM6pvozhAFz790hndWGgLwEyPu58gy+4BEpmcn2XSjSp67cA49uk1VXjivfGCAhVyKOFdobQibiA8Ht9uT9Q1t0wsYHxF5ALeHd22owMk3mUA3+xXN4EJwp9Y5hQ4+Ha3IDa4Zdqm81g3qumxxPT6gQdq2x87LoKkZXXg8mjGky07E77b5oeO+N1CKNMKK+9bInPRGWb9lwmF9jAT24GHFZ7Sjt6Rt6xk4oo7y7rxwdQPWM+CNG41bH/TYekren7G+MAifIBgk73jbEY7BF+WUHJQfooWUh
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Aug 2026 15:23:42.9535
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e1c8bf8f-6d15-484e-5a3d-08deff982f85
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DU2PEPF0001E9C3.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR08MB11514

SGkgQ3Jpc3RpYW4sDQoNClRoZSBpb2N0bCBkaXJlY3Rpb25zLCBCQVRDSF9SRUFEIGVuY29kaW5n
LCBzaWduZWQgc3RhdHVzIGRlc2NyaXB0aW9uIGFuZA0KYmF0Y2ggcGFydGlhbC1mYWlsdXJlIHRl
eHQgYWRkcmVzcyBzZXZlcmFsIG9mIG15IFY3IGNvbW1lbnRzLg0KDQpBIGZldyBVQVBJIGNvbnRy
YWN0IGRldGFpbHMgcmVtYWluIHVuY2xlYXIuDQoNClRoZSBzY21pX3RsbV9iYXRjaCBkb2N1bWVu
dGF0aW9uIG5vdyBzYXlzIHRoYXQgZWFjaCBpb2N0bCBlbmZvcmNlcyBhbg0KYXBwcm9wcmlhdGUg
dXBwZXIgYm91bmQsIGJ1dCBuZWl0aGVyIGEgY29tbW9uIEFCSSBsaW1pdCBub3IgdGhlIGV4YWN0
DQpwZXItY29tbWFuZCBsaW1pdHMgYXJlIGRlZmluZWQuIFVzZXJzcGFjZSBzdGlsbCBjYW5ub3Qg
ZGV0ZXJtaW5lIHdoaWNoDQpub256ZXJvIGJhdGNoIHNpemVzIGFyZSBndWFyYW50ZWVkIHRvIGJl
IGFjY2VwdGVkLg0KDQpQbGVhc2UgZGVmaW5lIGFuIEFCSSBsaW1pdCBvciBkb2N1bWVudCB0aGUg
bGltaXQgZm9yIGV2ZXJ5IGNvbW1hbmQsIGZvcg0KZXhhbXBsZSB3aGV0aGVyIGl0IGlzIHRoZSBl
bnVtZXJhdGVkIG51bWJlciBvZiBERXMsIGdyb3VwcywgU0hNVElzIG9yIFVVSURzLg0KDQpUaGUg
Y2FwYWNpdHkgc2VtYW50aWNzIG9mIGxpc3Qgb3BlcmF0aW9ucyBhbHNvIG5lZWQgdG8gYmUgZXhw
bGljaXQuIFRoZQ0KemVyby1pdGVtIHF1ZXJ5IGlzIG5vdyBkb2N1bWVudGVkLCBidXQgdGhlIFVB
UEkgZG9lcyBub3Qgc2F5IHdoYXQgaGFwcGVucw0Kd2hlbiBhIG5vbnplcm8gbnVtX2l0ZW1zIGlz
IHNtYWxsZXIgb3IgbGFyZ2VyIHRoYW4gdGhlIGF2YWlsYWJsZSByZXNvdXJjZQ0KY291bnQsIG9y
IHdoZXRoZXIgbnVtX2l0ZW1zIHJlcG9ydHMgdGhlIHJlcXVpcmVkIGNvdW50IG9uIC1FTk9TUEMu
DQoNClBsZWFzZSBkZWZpbmUgb25lIGNvbnNpc3RlbnQgY2FwYWNpdHkvcmVzdWx0LWNvdW50IGNv
bnRyYWN0IGZvciBhbGwgbGlzdA0Kb3BlcmF0aW9ucy4NCg0KVGhlIGV2ZW50IHN0cnVjdHVyZSBz
dGlsbCBkb2VzIG5vdCBkb2N1bWVudCBzdWJzY3JpcHRpb24gb3duZXJzaGlwIGFuZA0KbGlmZXRp
bWU6IHdoZXRoZXIgdGhlIHN1YnNjcmlwdGlvbiBiZWxvbmdzIHRvIHRoZSBvcGVuIHRlbGVtZXRy
eSBmZCwgd2hldGhlcg0KaXQgc3Vydml2ZXMgY2xvc2luZyB0aGF0IGZkIG9yIHRoZSBldmVudGZk
LCBhbmQgd2hvIGlzIGFsbG93ZWQgdG8gY2FuY2VsIGENCmNvb2tpZS4NCg0KTGlrZXdpc2UsIHNj
bWlfdGxtX3NobXRpX2luZm8gZGVzY3JpYmVzIGxlbiBhcyB0aGUgc2l6ZSB1c2VkIHdpdGggbW1h
cCgpLA0KYnV0IGRvZXMgbm90IGRlZmluZSB3aGV0aGVyIHRoZSByZXF1aXJlZCBsZW5ndGggaXMN
ClBBR0VfQUxJR04ob2Zmc2V0ICsgbGVuKSwgb3IgdGhlIHBlcm1pdHRlZCBvZmZzZXQsIHByb3Rl
Y3Rpb24gYW5kIHNoYXJpbmcNCm1vZGVzLg0KDQpUaGVzZSBkZXRhaWxzIGJlY29tZSBwZXJtYW5l
bnQgQUJJIG9uY2UgdGhlIGludGVyZmFjZSBpcyBtZXJnZWQsIHNvIHRoZXkNCnNob3VsZCBiZSBk
ZWZpbmVkIGluIHRoZSBVQVBJIHJhdGhlciB0aGFuIGxlZnQgdG8gdGhlIGN1cnJlbnQgaW1wbGVt
ZW50YXRpb24uDQoNClRoYW5rcywNCkZhecOnYWwNCg0KDQo=

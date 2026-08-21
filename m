Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazon11011044.outbound.protection.outlook.com [52.101.65.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA988278161;
	Fri, 21 Aug 2026 15:25:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.65.44
ARC-Seal:i=3; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787325944; cv=fail; b=DEgBVlvaiJg8honeb6svi6D7LIPnp7JinELBV6ZTU3ysqOXqh6rowPHJYnc5we0Cd4cb0PIXZvUsmUrI+Tyn5hbg5p8hMXV0WcXQYesXN6Ufr9FAzjY8Kq1TeYjmz2ZqPzassOrlO+Ih1DfXwSEFtLKW/vCox6ea5tj57LMQ6tU=
ARC-Message-Signature:i=3; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787325944; c=relaxed/simple;
	bh=AliO1ZmIJ/UDXf23Xdcho/ljLVcCGRrsGx7RVpFTn5Y=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:Content-Type:
	 MIME-Version; b=rseuKtPW7xSKJr+Dp5weNkGyKcP/a6cQsjJbOLtHrWtejHKi/Avc3Dyig+xTQY9pM4KxYhAqPACVGBD/V3IC+MwJBBBbqoda3Oo5D6m0ExlJ1pWJBnPE2qu4aDDiM0xUyamSzruNynJ0xrmfGGIYSqxBwJ5UA8SfJclVytc2B8I=
ARC-Authentication-Results:i=3; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=FeHkF5rO; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=FeHkF5rO; arc=fail smtp.client-ip=52.101.65.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="FeHkF5rO";
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="FeHkF5rO"
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=DuA7S+fMsuzKv99P+sP2ud1EhrfdDznMZB8ffx7jwiS8boNDCrq0CSqpE8smf2qvX4bVYf7UDO5eva4C2C7GSQE750aoFVURhKxifq5JYZ16B+hlrJx2IM262fK6Xk8JdcGL3MNmpn1RnK65u9WG2BParAuUGyMkkAJcA6GmbLkyRgRwLK+SerVtrT/a4KN8xDuD+jrNOofZRqTncWBCXTXLDspA/Axoq82MEkmiqiJOeTng1asZJSbnByyKjgyGY2P8aNa3Mtlf+NBRwvDTBA8CvoDpkxyl5tJ25kQvwFl9kNRmGiP7YjV6p/gMgYdXattVyzSi0owzqBcK6l67XA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AliO1ZmIJ/UDXf23Xdcho/ljLVcCGRrsGx7RVpFTn5Y=;
 b=gTGcKgTEWp4OLd7ykpmCZUxA0W1ODHZoiGz2N4HTJaALGtbteYg0Xy87XzePguiwaJ9xmGThnCL6BZjo9bfomDq8vBbG6AKPEiMlh10MCE7S6qrHqkJWGtH0iR2rZkMNqJYMBm+/GRbXhy9Cii22aDYN/2G1CcFDa/fCEtWHQ3xTYUIVe7QjEyvnWBCwOl6HdF7TofVNwx27OqGRgJBCfxJK5GAUffy0sHjQie5fa5wgtYE+xmj77Fu31kOEIZ5Ki7N1Ql0OHDw5Q1URzs6RvbDbbY3NZE/okOclhfFoHfHdmqvP7gscTLCJT4Ji4ps1R/EZYJMXkCyGVewxMW7hNA==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AliO1ZmIJ/UDXf23Xdcho/ljLVcCGRrsGx7RVpFTn5Y=;
 b=FeHkF5rO7EQYAqxKzwo7sgax2CU/7NA4qGREaLHRdLCDrUeK2lUKm2Q0GNrT05g+oVIfpVFbpHG/KA55xZ9Z8Vt/gQM+z1IZA5WaJ0qcpK74jvNsDaLukUIjSpxtap+fL2NxObmnbBb1xNZaTWxDNJwyCMdYd1PxVuudSITUYdI=
Received: from DU6P191CA0028.EURP191.PROD.OUTLOOK.COM (2603:10a6:10:53f::14)
 by GV1PR08MB7897.eurprd08.prod.outlook.com (2603:10a6:150:5c::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.8; Fri, 21 Aug
 2026 15:25:32 +0000
Received: from DU6PEPF0000A7DD.eurprd02.prod.outlook.com
 (2603:10a6:10:53f:cafe::5e) by DU6P191CA0028.outlook.office365.com
 (2603:10a6:10:53f::14) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.339.11 via Frontend Transport; Fri,
 21 Aug 2026 15:25:32 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 DU6PEPF0000A7DD.mail.protection.outlook.com (10.167.8.37) with Microsoft SMTP
 Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.360.3 via
 Frontend Transport; Fri, 21 Aug 2026 15:25:31 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nCCesaZNhI81ETW2X7MaHEN1qC8mYLII6XiuQN91lX29h+DJXMdz2d3brApe5TVU95I9FA6AoUBg8g2uCPOu4aajjaAXzUXFTXpooOGFzpq4Mtn3mXkDmjQUA0SCRviKu8fAnHB7zgn9aaFmMMKK7L3jBmJxhhQ/DJ4W7SDLyLofpU7/x27VZjyJMVwGLDBmxuEWvNKvqjBj1LP2q+LwSOeAs9jgzTHvNZ39k4vm9j1dhWEG92EevLZkG9JPHIOFTVK7Kd5IE/VuRhofOONq1SuwOLA7j4glIUJH5BUHGwaPYPyIK31sflQzCdcnUbBfYQWgNXhWGS3HnBhTBYI6MA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AliO1ZmIJ/UDXf23Xdcho/ljLVcCGRrsGx7RVpFTn5Y=;
 b=ROYjCgTzzSNi0Z8C6AGVvSDJ5/MRw/Cy1muYQ38er6bJA7hMwLouOz8kt1EoiTLOW6X8+4t5LlVrzn732D/+oK/3izkj5r9liVJnn/yssBtRvnK+HR46F5TpiotmIP7kGCrQ3dfa2MKHOdZZwAExf5SRRBKiBZ4TiOeUNT0DaP3C4uEM6XfZdygW5wCIwS19udE1ZY7f6juVzY58tuCwOFXACw1dwnQgOvedsAhJ3HFE7cZ6/Qf078ORMd5oLwL3rwbc19G5el9uEAF+i1DouvNc2wosCrzFEv5X/BR1/r9z4eF2v2LQMn+tblbttjCRDA6V0PAXKXlCQ7dlqFIz5w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AliO1ZmIJ/UDXf23Xdcho/ljLVcCGRrsGx7RVpFTn5Y=;
 b=FeHkF5rO7EQYAqxKzwo7sgax2CU/7NA4qGREaLHRdLCDrUeK2lUKm2Q0GNrT05g+oVIfpVFbpHG/KA55xZ9Z8Vt/gQM+z1IZA5WaJ0qcpK74jvNsDaLukUIjSpxtap+fL2NxObmnbBb1xNZaTWxDNJwyCMdYd1PxVuudSITUYdI=
Received: from DB9PR08MB8651.eurprd08.prod.outlook.com (2603:10a6:10:3d1::9)
 by DU0PR08MB9052.eurprd08.prod.outlook.com (2603:10a6:10:474::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.8; Fri, 21 Aug
 2026 15:24:57 +0000
Received: from DB9PR08MB8651.eurprd08.prod.outlook.com
 ([fe80::8fb8:7cf9:49c4:6f90]) by DB9PR08MB8651.eurprd08.prod.outlook.com
 ([fe80::8fb8:7cf9:49c4:6f90%4]) with mapi id 15.21.0339.008; Fri, 21 Aug 2026
 15:24:57 +0000
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
Subject: Re: [PATCH v10 24/24] [RFC] tools/scmi: Add SCMI Telemetry testing
 tool
Thread-Topic: [PATCH v10 24/24] [RFC] tools/scmi: Add SCMI Telemetry testing
 tool
Thread-Index: AQHdMYE5gTifccAclkqnosXzxiD4OQ==
Date: Fri, 21 Aug 2026 15:24:57 +0000
Message-ID: <CFAC3196-972C-4AC2-A08E-EC8DEC125610@contoso.com>
In-Reply-To: <<20260815232604.3730754-25-cristian.marussi@arm.com>>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	DB9PR08MB8651:EE_|DU0PR08MB9052:EE_|DU6PEPF0000A7DD:EE_|GV1PR08MB7897:EE_
X-MS-Office365-Filtering-Correlation-Id: fb667cb2-834c-41c1-405c-08deff987083
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|7416014|376014|1800799024|23010399003|366016|38070700021|3023799007|6133799003|56012099006|10067099003|11063799006|18002099003|22082099003|5023799004;
X-Microsoft-Antispam-Message-Info-Original:
 v4KFpX4qt1XbWdT/YaQp2i+Mnsb50wMztankj3cxn7AiSV1V0SrGiZBVF40bgHGxBSgWZrKec3PEc7aN4lSP0PVAa4sRn0LpPLGNKrTYAHafNXnlGb6RuyDj07H+h36wXqqs3v8TjSTb7/C6msL8tR6uIptv9s6hi/RfRO9mcMGoHU+MWHe0ll+ndqKiJU0uvh5JnfTlR60keSIO14HdmLUSrGsKCGwEa1WpMw3axirOz4AMCotajZYleAM9xEfiOWqh7dxcPIoociIVQQOUz0ahM8o06aU457QFz9NgvEbOI14pM2jQcz2NwDjLJMw9e0sqhAzoawO/sIh4SonMswBhDIU85hys+JuJ6ekIQc8oa6ji5VF3IpetEo0e5I+tlJ1yGDMDR4Jm0ac+OX2otgPa3dNEs0z7E82Og1PkUX6FL8DsTKiztwzWXf344uFHrZsnODTYQxq13pzlX21UVMIPqKq4vdzUZCtEmEbjG7QjPLblOYD5R41vFG5pvTUOyKq6krI58tdmO2Lby6ZI8XKV1iOvG/akMK4SDvkopYkufOcxEhnEM41sLNo7s/JzJyK88XMVs1VBZ6GyeN60QDGRZSPn8ho644SCTlCDNjmeFvi9K/fICZrbkGf+FAoLfG5KeeDXik/FANua4YW8mf7U/uHyoqWd+CuGWtpvXN6TdgG1Gr+YXo378wlyCSKozJXhHzrztrseBk0A+UkqK4bk1ClHOoq+wns42RfX18s=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR08MB8651.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(1800799024)(23010399003)(366016)(38070700021)(3023799007)(6133799003)(56012099006)(10067099003)(11063799006)(18002099003)(22082099003)(5023799004);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <A62CE7515E1AD343A59EFE6161504363@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: arm-scmi@vger.kernel.org
List-Id: <arm-scmi.vger.kernel.org>
List-Subscribe: <mailto:arm-scmi+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:arm-scmi+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked:
 Bh9ECAuAQSDNpFNTgNGGIu824ROnaoLR7heqWDcCxOPXs/Qq8NUI2WQJNswh3CQ2SNTuNDkfMgTEo3427dYO82GGqAg9PWQF6OJDDVI4PiRmaZErJNG/vIrAGKKYDEjG3t2xtSsRG1PAyE3XptaMYxamgsOPYTGcNWAAzeYjAVEbc8Q6/Kt+Rh8pJJ9iWFV96CJlEhiMDYzRJd/NDJYhbuVTkEYM3eIkM1DEtAJ+m+OxAnuHnboCvz1UcEvR65b0If0uwXUvUIXOOr0i314R9PMK0IB1KxUDF+e7cBRlS8+Yf4snUNK7eVyjY6oCXx5DCmaw9r/KmHWuQk8AwukXwQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR08MB9052
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DU6PEPF0000A7DD.eurprd02.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	5633a9d2-01c1-4b40-4958-08deff985bce
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|35042699022|14060799003|7416014|376014|36860700016|82310400026|1800799024|23010399003|6133799003|18002099003|22082099003|56012099006|3023799007|11063799006|10067099003|5023799004;
X-Microsoft-Antispam-Message-Info:
	g7Bwvyvgnw1EKr/HneA7JPP1E6kP/6o66rd0mNPko+XtxIHUzhKo4GVN53SJ8kZKnt7BFgd3zBO+4aJQ6DSlOAF6UAthAkYObBU4NQAYhLqgoO/u4/Q9OiLvJXEJVk3faq9cY8M32eRo4JL8XtJfKoYbtqC6hMNtWNtvmW9lCXxRCCHb4VYafQ5hhJQvUkiTyciEp7Oz+YDwREhrVhLNPQW/JBagL8T2crXLNnHcvxbE6L3TlmhA0mWM6bQzL9rR+CKUEpUZqb/YZ/EqZVL2ir/SrdRJH66uRZCKlUZE9Wvu6yxeQOtEf/FNUpOEJiFdJwDJFI8flrUU3jl/0Yav3L5sr1vbnXeII5ao40V1mHbV5nJScL2odQendpzsPX2SaFriJ436jZGAI5YTfnydLiMo9fCMStBWf9u0InyxA8SqM/LigeHyvUoWCuJns4L2+aG+NivG4VmAZxOCikEO4+unbeO4ZOFOJ2clcfAaZvKQzNEHPcgvS18cAFM71fUR+c6g8xR6TNOU/KFjVyvsXZZgKRaldnHEuDr3IYDnIpexgdB5CB9XJI1ZK27aKzZdW74qZYka4rRESYBexm1gGNWm+LdpNan4wuPRWqsjYUTWb7DD1IX7edyWTw/nc1gwBP80n07GrZh9kXWQ+Z9Qb4dE+LSBHGvrPblWqHeHI0Zzfc9szln9oavGQ2xeSHZfZEi+WKcUZVx3C+7e0+PxVg==
X-Forefront-Antispam-Report:
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(35042699022)(14060799003)(7416014)(376014)(36860700016)(82310400026)(1800799024)(23010399003)(6133799003)(18002099003)(22082099003)(56012099006)(3023799007)(11063799006)(10067099003)(5023799004);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	59SNpq0cb/BVZsrcbSdD2gKyRTyZYaMlY01sPTUSQCxrHqqhr+/GHr958KSYa116Viw6R5O69cnopU05yK8RBAUf5eHfueaFdeFJ47t3yPEuHX1ryeMtKL3f9dzYzSi6DEXB444WlbE8ZgliVeduxDn4YAaeU3j7yu0lf4Wap72rjcL/Wgu/eN/MdU+F/V0P1Ey8w7T00IPsaKAHqxaOqhKg6IwsZX9ngQs6/EW6TvEG0GsxaPxHwP+k8gx9OxDZ1q73dhctEktbgAPP7cTUuqAVis8Y7kVPFM5t5KIrr88KMrNkUPiG8q8VbCgB4zR08FQwehypyVnWZVaDMunJJfSpIDPYYga+TFa8IodVvKFhphAsAoJSNs4t6FstQLAn9je/y5bpp3tdTW8ugnv3BJv20UdzwRXKZzfSnuKaAtyxeB+2bXC3qtgl7pyfJ0c3
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Aug 2026 15:25:31.9936
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: fb667cb2-834c-41c1-405c-08deff987083
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DU6PEPF0000A7DD.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR08MB7897

SGkgQ3Jpc3RpYW4sDQoNClRoZSBtYWluIHRlc3QtdG9vbCBpc3N1ZXMgcmVwb3J0ZWQgb24gVjcg
c3RpbGwgYXBwZWFyIHByZXNlbnQgaW4gVjEwLg0KDQpvcGVuX3Nlc3Npb24oKSBhbGxvY2F0ZXMg
c3RydWN0IHRsbV9zdGF0ZSB1c2luZyBtYWxsb2MoKSB3aXRob3V0DQppbml0aWFsaXppbmcgaXQu
IE9wdGlvbmFsIG1lbWJlcnMgc3VjaCBhcyBncnBzIGFuZCBzaG10aXMgY2FuIHRoZXJlZm9yZQ0K
Y29udGFpbiBhcmJpdHJhcnkgcG9pbnRlcnMgd2hlbiB0aGUgY29ycmVzcG9uZGluZyByZXNvdXJj
ZSBjb3VudCBpcyB6ZXJvLg0KUGxlYXNlIHVzZSBjYWxsb2MoKSBvciBpbml0aWFsaXplIHRoZSBj
b21wbGV0ZSBvYmplY3QuDQoNClplcm8tcmVzb3VyY2UgaGFuZGxpbmcgaXMgc3RpbGwgaW5jb21w
bGV0ZS4gZ2F0aGVyX3RsbV9zdGF0ZSgpIGFsd2F5cyBjYWxscw0KZW51bWVyYXRlX2ludGVydmFs
cygpIGZvciB0aGUgaW5zdGFuY2UsIGFuZCBlbnVtZXJhdGVfZ3JvdXBzKCkgY2FsbHMgaXQgZXZl
bg0Kd2hlbiBhIGdyb3VwIHJlcG9ydHMgemVybyBpbnRlcnZhbHMuIERpc3BsYXkgYW5kIFNITVRJ
IGNvbW1hbmQgcGF0aHMgYWxzbw0KZGVyZWZlcmVuY2Ugb3B0aW9uYWwgcG9pbnRlcnMgd2l0aG91
dCBjb25zaXN0ZW50bHkgY2hlY2tpbmcgYm90aCB0aGUgY291bnQNCmFuZCBwb2ludGVyLg0KDQpQ
bGVhc2UgYXZvaWQgemVyby1zaXplZCBlbnVtZXJhdGlvbnMgYW5kIG1ha2UgZXZlcnkgY29uc3Vt
ZXIgdG9sZXJhdGUgYSBOVUxMDQpvcHRpb25hbCByZXNvdXJjZS4NCg0KZHVtcF9zaG10aSgpIGFu
ZCBzaG10aV9jaGVjaygpIHN0aWxsIG1hcCBvbmx5IHNobXRpLT5sZW4gYnl0ZXMgYmVmb3JlIGFk
ZGluZw0Kc2htdGktPm9mZnNldC4gVGhlIG1hcHBpbmcgbmVlZHMgdG8gY292ZXIgUEFHRV9BTElH
TihvZmZzZXQgKyBsZW4pLCBhbmQgaXRzDQpvcmlnaW5hbCBiYXNlIGFuZCBjb21wbGV0ZSBsZW5n
dGggbXVzdCBiZSByZXRhaW5lZCBmb3IgbXVubWFwKCkuDQoNClRoZSB3cml0ZSBsb29wIGFsc28g
c3RpbGwgYWRkcyB3cml0ZSgpIGRpcmVjdGx5IHRvIHRoZSBjdW11bGF0aXZlIGJ5dGUNCmNvdW50
Og0KDQogICAgICAgIGJ5dGVzICs9IHdyaXRlKC4uLik7DQoNCkEgLTEgcmVzdWx0IGFmdGVyIGFu
IGVhcmxpZXIgc3VjY2Vzc2Z1bCB3cml0ZSBjYW4gbGVhdmUgYnl0ZXMgbm9ubmVnYXRpdmUsDQph
bmQgYSB6ZXJvIHJlc3VsdCBjYW4gbG9vcCBpbmRlZmluaXRlbHkuIFBsZWFzZSBzdG9yZSB0aGUg
cmVzdWx0IHNlcGFyYXRlbHksDQpoYW5kbGUgdmFsdWVzIGxlc3MgdGhhbiBvciBlcXVhbCB0byB6
ZXJvLCBhbmQgdW5tYXAgb24gZXZlcnkgZXhpdC4NCg0KYmF0Y2hfcmVhZCgpIGFsbG9jYXRlcyBz
cGFjZSBmb3Igc3QtPmluZm8ubnVtX2RlcyBlbnRyaWVzIGFuZCB0aGVuIHJlcGxhY2VzDQpiYXRj
aC0+bnVtX2l0ZW1zIHdpdGggYXJncy0+Y250IGJlZm9yZSB3cml0aW5nIHRoYXQgbWFueSBzYW1w
bGVzLiBNb3JlDQpjb21tYW5kLWxpbmUgSURzIHRoYW4gcGxhdGZvcm0gREVzIHRoZXJlZm9yZSB3
cml0ZSBwYXN0IHRoZSBhbGxvY2F0aW9uLg0KUGxlYXNlIGFsbG9jYXRlIHVzaW5nIHRoZSB2YWxp
ZGF0ZWQgYXJndW1lbnQgY291bnQgb3IgcmVqZWN0IGV4Y2Vzc2l2ZQ0KYXJndW1lbnRzIGJlZm9y
ZSBwb3B1bGF0aW5nIHRoZSBhcnJheS4NCg0KYmF0Y2hfYnVmZmVyX2FsbG9jKCkgc3RpbGwgdXNl
cyB1bmNoZWNrZWQgbXVsdGlwbGljYXRpb25zLiBJZiBzdGF0dXMNCmFsbG9jYXRpb24gZmFpbHMs
IHRoZSBwcmV2aW91c2x5IGFsbG9jYXRlZCBpdGVtIGFycmF5IGFuZCB3cmFwcGVyIGFyZSBhbHNv
DQpsZWFrZWQuIFBsZWFzZSB1c2UgY2hlY2tlZCBzaXplIGFyaXRobWV0aWMgYW5kIG9uZSB1bndp
bmQgcGF0aC4NCg0KTW9yZSBnZW5lcmFsbHksIHRoZSB0b29sIHN0aWxsIGhhcyBubyBjb21wbGV0
ZSBzZXNzaW9uIGNsZWFudXAuIFRoZSBtYWluDQpkZXZpY2UgZmQsIHJldHVybmVkIFNITVRJIGZk
cywgbWFwcGluZ3MsIGludGVydmFsIGFycmF5cywgREUvZ3JvdXANCmRlc2NyaXB0b3JzLCBiYXRj
aCBidWZmZXJzIGFuZCBuZXN0ZWQgYWxsb2NhdGlvbnMgcmVtYWluIG9wZW4gb3IgYWxsb2NhdGVk
DQpvbiBub3JtYWwgYW5kIGVycm9yIGV4aXRzLg0KDQpQbGVhc2UgYWRkIGEgc2Vzc2lvbiBjbGVh
bnVwIGZ1bmN0aW9uIGFuZCByb3V0ZSBhbGwgZXhpdHMgdGhyb3VnaCBpdC4gQXBhcnQNCmZyb20g
Zml4aW5nIHRoZSBsZWFrcywgdGhhdCB3aWxsIHByb3ZpZGUgYSB1c2VmdWwgZXhlY3V0YWJsZSBl
eGFtcGxlIG9mIHRoZQ0KaW50ZW5kZWQgVUFQSSBsaWZldGltZSBydWxlcy4NCg0KVGhhbmtzLA0K
RmF5w6dhbA0KDQoNCg==

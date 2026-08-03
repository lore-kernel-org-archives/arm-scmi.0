Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11010039.outbound.protection.outlook.com [52.101.69.39])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 422D7345EA7;
	Mon,  3 Aug 2026 22:58:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.69.39
ARC-Seal:i=3; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785797915; cv=fail; b=AzvGp4PJLvCqM/CpWxMZdVYkFyMIDZqRL9T3cBjo/1Z2VBkQuxLvA4eCn/wYAYEKqaq0rI8KUU31EdaaYIHVsxO3Xk8qREaPXu3pOEbiPHsKHsK1raIx6l7bL1P/r62fOGU69IBbocPgHgNR10Sm4LsRnRGUHfYdOemfkBRqpGI=
ARC-Message-Signature:i=3; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785797915; c=relaxed/simple;
	bh=pc8rLz4kl/NOz5HaMRTLeyOsj3IQLZTB+4EthriF4iw=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:Content-Type:
	 MIME-Version; b=fRqt8HOYR83QDvK1kghXlKv0Ae0vwE3LvJWKYzYCqkVptXzWWBdI63k2R5+SZ8DDEDFeID4GBpzvSuQLxroHnjIo8zLEVX4AZr2JetJO/GSTgR19wSHOM6prVIVmLOnunr4Dzns/Yga/wcxmAEi12SvIdKCXxcXujdczLZpzjYk=
ARC-Authentication-Results:i=3; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=DkeTdh7L; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=DkeTdh7L; arc=fail smtp.client-ip=52.101.69.39
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="DkeTdh7L";
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="DkeTdh7L"
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=srk0LlYaH8NAxl8NNXuwJLwZkZSgqF+YD5/BSb1gknu1sJ+GhkgN8akxLoaknfTuCAu31yaRPcRLkghqTx78/dJYeUjzeDIboiaFtFQwU9SgicV/fC+ArsrgJcIunOErBmIiTw8kKCRmatrbTNQc3GcxGCq4HQO2RQEKULwrUJYcVpAsldXuOivEfdopLXGNNR5asJzO7z1evQHphP9gfj0wXfHzsmrtfFZ2wzcjm+afUmKf5asb7kfD2UN1mzl1/A/6pStnesVsblW4jGp0/yoVvK/M91zz5p+NIbFZmeIE+4Pq54STsNIHYDTaVHQTfBFcTmEYHEkwvuRI/57JMQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pc8rLz4kl/NOz5HaMRTLeyOsj3IQLZTB+4EthriF4iw=;
 b=jtELMW5aFh8hYITOo54xbwU+B86tGYr+A2pqNMNl/FbEoyon5Z3rfVRhvP/7yCzQ5m0asbrM4Sg6bR92/1UAxFfhhtTAP8DXYJe7cN3i4MgWTyee1fwGWAT7yV1eaib6W7bo2LAzbYcVj9LIrUNVzkoDyKGCnRsfengEmtsRU4dbUWedEmFh6BsAlsPo3nDYGLUNQuwAOuXG85/ugxmg91AUSOwrK+yC5S2pcNtEOXovq8AQahreqVzURPwj4/aG3vcw7nt+276+DbqWtv8HDohD7X6rrR0CeUB3JaGyisTRI9mbGF8taSLsC8n/Fmu0+z4TZN1XdGsIXfyEVQ3pUQ==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pc8rLz4kl/NOz5HaMRTLeyOsj3IQLZTB+4EthriF4iw=;
 b=DkeTdh7Le8ZBDw83FSig3TTBrXrBm16RyK8BCz6IlqZXkAHDFg6GUSlEHw6Qbmn7Hs5esgabhyBSU9Mfq+CRrc3UWS9fwiqGhoZ0LpMEa0A2xEePtSVMgCv4HkLJmaCEPV8khVmC6dijRVBsoNB26QirHnFLVlteephjQ9tgPwc=
Received: from AS4P191CA0007.EURP191.PROD.OUTLOOK.COM (2603:10a6:20b:5d5::7)
 by AM9PR08MB5985.eurprd08.prod.outlook.com (2603:10a6:20b:286::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.18; Mon, 3 Aug
 2026 22:58:30 +0000
Received: from AM4PEPF00027A6B.eurprd04.prod.outlook.com
 (2603:10a6:20b:5d5:cafe::29) by AS4P191CA0007.outlook.office365.com
 (2603:10a6:20b:5d5::7) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.270.18 via Frontend Transport; Mon, 3
 Aug 2026 22:58:30 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 AM4PEPF00027A6B.mail.protection.outlook.com (10.167.16.89) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.292.8
 via Frontend Transport; Mon, 3 Aug 2026 22:58:30 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=y6natuMuoyKnXsjAdyqfUry03iSG+/NuQDeGH5HgJXfumfh9c6U/G4Fki6OOeK7rViATkKzVJ16UnIUlN1nW+7nzoetuXfpd3Tl89e7WDs4Pia8+4KdThalxXvQa0t9tz8vN50zXuuPE/IZYifnN44QHSVkNiw9eqCaB4ljq+Q0fnEy5nC4tNrVyJjia0pbWTfH6fYZhyZ900bilSDV9Y+BZ9icBy9jerLEoM9un+tl3hEspdduoVt0MkVUR1VlOqc1FRfmpBNW/uXmqEtdHdvMSLLcgQA2Q9vmh/YivvuMCgTi/mo7QUQktHhR4Tb/sHYPxzKqOUGl7mYed6SLytA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pc8rLz4kl/NOz5HaMRTLeyOsj3IQLZTB+4EthriF4iw=;
 b=aCNXtTxYYDXzKx5UWmfaRYcwV+pONJ/x2l5J7R0g1KpCCVJNGkGPFWFFUYYtODtz+dJoGLMWwkgfquoIDjMQNBm9JRu471aoMi2VJGsh/E/Bb0ByUphM7lGN795X7/P/V0S8STpybSv2aSs/tRP9JWIq067Vd6+vGUSnZzokIskV2475Ql21Yf45tigRTxg/YEf5wz8W/n2XKShWgwHKKQ9sH3FdP1e7q2D9L4iXlbrjFpFwtkA45yhF4rQBuqqAtR1CiCaBzf0Vb5hvN1fleMgsDHCCvI3cegdTFNnECRWvyx/mUWGIAgLYmg3pTU89/tceCTN0UHFoLAfpl7yGvQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pc8rLz4kl/NOz5HaMRTLeyOsj3IQLZTB+4EthriF4iw=;
 b=DkeTdh7Le8ZBDw83FSig3TTBrXrBm16RyK8BCz6IlqZXkAHDFg6GUSlEHw6Qbmn7Hs5esgabhyBSU9Mfq+CRrc3UWS9fwiqGhoZ0LpMEa0A2xEePtSVMgCv4HkLJmaCEPV8khVmC6dijRVBsoNB26QirHnFLVlteephjQ9tgPwc=
Received: from DB9PR08MB8651.eurprd08.prod.outlook.com (2603:10a6:10:3d1::9)
 by AS4PR08MB7503.eurprd08.prod.outlook.com (2603:10a6:20b:4e7::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.18; Mon, 3 Aug
 2026 22:57:57 +0000
Received: from DB9PR08MB8651.eurprd08.prod.outlook.com
 ([fe80::8fb8:7cf9:49c4:6f90]) by DB9PR08MB8651.eurprd08.prod.outlook.com
 ([fe80::8fb8:7cf9:49c4:6f90%4]) with mapi id 15.21.0270.016; Mon, 3 Aug 2026
 22:57:57 +0000
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
Subject: Re: [PATCH v7 18/23] firmware: arm_scmi: Expose per-instance
 identifier
Thread-Topic: [PATCH v7 18/23] firmware: arm_scmi: Expose per-instance
 identifier
Thread-Index: AQHdI5uGNddmvlgt4Eudk3BfffCsIQ==
Date: Mon, 3 Aug 2026 22:57:57 +0000
Message-ID: <92C2825B-A0F5-4124-9AED-7C07AF99AFA7@contoso.com>
In-Reply-To: <<20260802145618.1952804-19-cristian.marussi@arm.com>>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	DB9PR08MB8651:EE_|AS4PR08MB7503:EE_|AM4PEPF00027A6B:EE_|AM9PR08MB5985:EE_
X-MS-Office365-Filtering-Correlation-Id: 3a5c5ea9-852b-4d6a-736d-08def1b2bc77
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|1800799024|366016|376014|7416014|23010399003|6133799003|38070700021|18002099003|22082099003|56012099006|10067099003|11063799006;
X-Microsoft-Antispam-Message-Info-Original:
 B1IGZWGr5mHxbGD56Ld4hfvLWZrT3UxHeuShsct7GeWmkxRKDCCIFrNW2GfAKGl+XdAsN+mmDJ1cOATr5ZZNG3J5IywGTbVXiPPF5xhN2+Gmi0JsU8DtOCFRFXxj9IjHSWP79JIaCDnTJN+NdsLl0JUWqnU+J7AHW2kG7iQhIaObeEqZbKwikwYksdQ4hH+uW5Garv6MebCxiJQqzCpeIqaelp+RKmVCD7NN60GfloYpIL+z/9Fr9mwzKWaLkt+fo+l41vJqa0sg4t5KTJBqmuLfmU56bgbF9+DCw0z/FLWt8eAEGIG9W0gS3OkAJkqSmmh1xCiLUiRgraiOJcn9IO4vaSJkzAQRB356gGexiWQ+m+9hoZbKD4H7af8xIwJiGJy9mIZKhyzSmXVW5NsOl+uJq9BHq/T0WrdoFLn8Ebmj066uLC1zxZupO7sm9ZRjdJEweKvBjEyCeTQCAuZEmESvUGq2j2f9m0Q72UfDlZBABQLIuM98J691QqeLfXb8QdTOjnSoFPzJ5xM6r/eoQ+MFzcpOm5kMwJmsiYPMXbLDoXi4lOS3j/DFoSYvngisa+pnt7fYEsKFq0H6ayDGGhoA1PEGMRYLM5VBNk9tN5MJ0THubaMNilOQQ/02JBnc+hRK5oQFZJbndMP6F29vr7N5EESTg6fs5yCc8DJ+/hsz3VwKkSSkufMmhr8iuwjD3fUXKOhvtpn/F9iii4jyxbI/9ed4oyUleWrq3Ktwfpw=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR08MB8651.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7416014)(23010399003)(6133799003)(38070700021)(18002099003)(22082099003)(56012099006)(10067099003)(11063799006);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <E3BB0D9455C6214EBAD9F5062CDBCD2F@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: arm-scmi@vger.kernel.org
List-Id: <arm-scmi.vger.kernel.org>
List-Subscribe: <mailto:arm-scmi+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:arm-scmi+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked:
 MOt+NMBrEzN2srs6g68vcGi7k63zgrYUXJPEUMJtJSHa+m2mCDh99k2WW7hfTLQfK0XRO8+KuW9cHbbsdoaHD2F8Ngbr1zsb3uUDX4fmgbB7MS6dDIfx2BCHgzgssndhoyhOfetQLT+BSriN6m/uA8OVf6LGtNcC+jsgEZ8sXedtHCNKiQcxKQdzQhVmdyl/Tw+GvE1/+JSILbAfrw28/pUvSw0JQ50dedyGnW1Tp87NQmKzEPaSIuOnavh663ORtCKCoCI1OwRyA1JSriT+f9/yh7L+rNxsU4VPdCKyKBWc5xJV5VPjYg8behKWvw1mZ07CyI35hSc0vpMF+oIG8g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS4PR08MB7503
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM4PEPF00027A6B.eurprd04.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	82a3bcac-9250-4f80-76c3-08def1b2a8df
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|14060799003|376014|7416014|35042699022|82310400026|1800799024|36860700016|23010399003|6133799003|10067099003|56012099006|11063799006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	JAH6ZALFoNgV05u71GiYxn31NX5hu2ljw30rLTTLvT9YbY8XL75TO5Mxh9XiO9TjTfdt8VNGA1EIFE/XoM7FxRZjaVlQ3tCyV6Hi2j4Y/wnr0zGsNSBe7gM9MeNzptVseLyUrLSw+gZnr3Ak3vZzCNVUS6tGJYdPLmgnhJeI2g0ON1g7hoK9v/yDcPCSz3Y1ypgBg/6TiAYl2qpp9HnSNW20eUaV7rFv76ffbErtb/Wl3s7CAwxglm00zqZzNNbysDzzf8RRXnvVVlVL8XWKDT/Geg7XHJVuxauAIgmsuZgGdZkGDIHjnKVKxnOmpkGQ3lI8WIaO0V/xvkcwbAR5jF2mjKzK3FDQk3it+XnhhpWS2vpIt4KJTA/5feaDbueGUXQrC3T+5RajxxRJAgVY5GkO1iQYGqDYODYkDVfrOmmwJ48EXPQ797KyV5pybrzFYuw9B/qL4WqKPxOM8FnCn0DGnUnGph/L0paO0YhTetWi6nfK9HuTDOZRHVAfHKcQGRtBf9K5v9hdGEs95eJbjLP4pBwrtZeKdsm4N7oxkQyShAdEqkHflTyccFeCvteXdYmfK37Immxcz/eLcdRTeg9gAUZVlxiz84WtsssNp+iIVq3UlOI/2WY+4VnWB8S1Zcp88jx06FYvXoViBVaq2l+X5jhzWxD2oD7yaxAjbeUZktRONH1JclH+T+yPkr6271S+xRAlBbtGG+UOg6SuwQ==
X-Forefront-Antispam-Report:
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(14060799003)(376014)(7416014)(35042699022)(82310400026)(1800799024)(36860700016)(23010399003)(6133799003)(10067099003)(56012099006)(11063799006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	SGQqsx6hPafj6LWvzGmmw9aks6spSZS+FZni0zjdXL/sWwNOvlKjwBl/ovseZtzzpTVH5fZIvu4XlxfkLDFRiurKpiMgVZ9UO4WoTyr+fYZaFgm+Vyv9E6YWjMC8DwXAmsep4djV4SwiNnHat7mKHA0vrkygp+oHuuVDweR59jevbChvHvEc391FKoKGwOQ22/4PNWFNP3IBdyb4vjM8bkAC5zlG6Vs8fQPBLF6LLAv5r872kH46d5vWp3s0t2v+Mh8uKAXgyOoOLwBlgTHLFeDYMNoC3nVGr7NPK3x7GfGcGex2VRtEMQM4hxLkxd6594qX7/WBYKYQ4VwQ8V2gq0uIQOiVS80v3pWknh1RdVOjm0unjjym1wLHY1EIkFyb/aWhMXRsi8Xai0XlAIMAa53oT4AHguWUhN/1eH1enu4Sa0P4nytTy6jqsXyISxnX
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Aug 2026 22:58:30.0779
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3a5c5ea9-852b-4d6a-736d-08def1b2bc77
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM4PEPF00027A6B.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR08MB5985

SGkgQ3Jpc3RpYW4sDQoNCk9uZSBrZXJuZWxkb2Mgbml0IGlubGluZS4NCg0KPiAgKiBAaWQ6IEEg
dW5pcXVlIHBvc2l0aXZlIG5hdHVyYWwgaW50ZWdlciBpZGVudGlmeWluZyB0aGUgU0NNSSBJbnN0
YW5jZQ0KPiAgKglhc3NvY2lhdGVkIHdpdGggdGhpcyBoYW5kbGUgdG8gYmUgdXNlZCBhY3Jvc3Mg
YWxsIGRyaXZlcnMgZm9yDQo+ICAqCW5hbWluZyBwdXJwb3Nlczogc2FtZSBpZGVudGlmaWVyIHVz
ZWQgaW50ZXJuYWxseSBhcyB0aGUgcm9vdCBmb3INCj4gICoJdGhlIGRlYnVnZnMgcGVyLWluc3Rh
bmNlIHRyZWUuDQoNClNDTUkgaW5zdGFuY2UgbnVtYmVyaW5nIGluY2x1ZGVzIHplcm87IHRoZSBm
aXJzdCBpbnN0YW5jZSBpcyBleHBvc2VkIGFzDQp0bG1fMCBhbmQgdW5kZXIgZGVidWdmcyBpbnN0
YW5jZSAwLg0KDQpDb3VsZCB0aGlzIHNheSAidW5pcXVlIG5vbi1uZWdhdGl2ZSBpbnRlZ2VyIiBv
ciBzaW1wbHkgInVuaXF1ZSBpbnN0YW5jZQ0KaWRlbnRpZmllciIgcmF0aGVyIHRoYW4gInBvc2l0
aXZlIG5hdHVyYWwgaW50ZWdlciI/DQoNClRoYW5rcywNCkZhecOnYWwNCg0KDQo=

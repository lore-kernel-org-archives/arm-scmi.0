Received: from EUR05-AM6-obe.outbound.protection.outlook.com (mail-am6eur05on2075.outbound.protection.outlook.com [40.107.22.75])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 655BE1D5CE3;
	Mon,  6 Jan 2025 06:58:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.22.75
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736146702; cv=fail; b=eDWfgmq72qHcH8MW+WssYACl4MqUgPMd4Xq9cIT4Y/d5r5KK9V/1j6NiH3i/pH5ze55ZcSifAADVNqpVmN6QkfaiiTNZfdD5RabrlzePG+ZWrQyAfRY2VVnO+jeY3Nts/hldzETAUhRbQI0SwIgoWC7ObvnftfELrLU/0/gadYE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736146702; c=relaxed/simple;
	bh=P8/qKk0luymewTLDx/yfUAc0l/w2loxo1UUkY3Fe/uY=;
	h=From:To:Cc:Subject:Date:Message-Id:Content-Type:MIME-Version; b=KfFs9Bns0RQMCC3GfzWlVh0KfMaPRYQcxerdFHnE8mlekBQHYT084j+cdipCBWjL8RU1gTfKj+dtGTjE1+1HZp2fI0ZkOVWEaS/hvuL5LGBbf80uPmz6XcqiTssHLJGuf2NODvRnu1eS3MJJ8H+AkOktBwhJHcouHCbMxWOwm+w=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=iWAhvQ1p; arc=fail smtp.client-ip=40.107.22.75
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="iWAhvQ1p"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cbhvdqZk9c2FBXAHNzsCaLrztmi+/fOMlU9BV/hT9F93C+wfiTAix8/5wMrIX90NnVtxQuPyfdnFe8NtQqOn0ljCGJTjYp4BP1P4p2Ax4/uo9q0qsaP5mL4G9B8UX9FbK3XP28PieBSf1eNcpr8Cx/hpfO8zZINY8adt5m9RMezZqdODZLRNLPUXRAW2uLhPYPC05W1MA6ubSmEAvuSK7Uk0Duu+0dORVnm2Dp2KRPiB9UDLpBPtNKrLbMkgQv1OfPCv//mX5GXCir7XGHf3x1hCqDJseURH6a+/7gIUoXRYXDnAYOJ1ZcG0ATeJmUKGm+k/0fVhZt6ccE86nrU3CA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=INbJLJsuc3xFHElQ+aC9VMxfD4R97lalwjUCUWwPRY4=;
 b=b32yWKYGvbV+GR3O3gZ7vvVocd5/ufMmHiCPa+TxJVwcrqQgQid4JNfrHzR996J6CwyICTRzWKQJ1PDbFfKYwAggFX3lwTY38g2m0lxHr0Bw3MYF78s2fZ4iQBDNgQRw6tHFRRuz1l/QxXhkogURlQthKh1BWa1573V8b9DsLLXWqqotQuDmTaq0ahPNml91FfzJFaTuTziatFnoyLW6F4rRZeLTTCTXQs4LGCohFK2r6Lh5xPgxJttgmuVpTwU8cko/+bsLRN4kuH7PREkLN27nuBXDHRn0kFhn0JlLK1t0rtDs8jNUWnXpk1eWoBNxOJrEegbsB3vX3NID2JICJA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=INbJLJsuc3xFHElQ+aC9VMxfD4R97lalwjUCUWwPRY4=;
 b=iWAhvQ1pMGFyT5B9hv0KxYHqP2wss7DwMDUd2QtRg9i/Ey31PfINAoZXbfCK5L0lc0c9pgLO+YD+v6UfRPDMJbk6ayQikG3/gO8bL2+b3a6pJpF3XtI6frPCBr9dfYbIDnep6TccSaDJ5DpYIBL3LcZQNjndnkGccq3Ri5hvahHF0uJEwslHi44N6kuRiK6ulUettsOa46dbRYFMJ3EuM43jZJDpfJyzT93zLkhtq72hMRXfPikmkbHH7zVwjA6S2TJoTXNDPr5IrqzmGTvUwAaZdUFyLrNqCa6hXNCT2ny4CSiaxvBGIP9UfOxZty5lewV6+t/IjrVd3Kr+uTkz8g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by AM9PR04MB8537.eurprd04.prod.outlook.com (2603:10a6:20b:434::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8314.12; Mon, 6 Jan
 2025 06:58:12 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630%5]) with mapi id 15.20.8314.015; Mon, 6 Jan 2025
 06:58:11 +0000
From: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
To: sudeep.holla@arm.com,
	cristian.marussi@arm.com,
	arm-scmi@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Peng Fan <peng.fan@nxp.com>
Subject: [RFC] firmware: arm_scmi: Optimize the iteration of scmi_requested_devices
Date: Mon,  6 Jan 2025 14:57:24 +0800
Message-Id: <20250106065724.3674510-1-peng.fan@oss.nxp.com>
X-Mailer: git-send-email 2.37.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2P153CA0029.APCP153.PROD.OUTLOOK.COM
 (2603:1096:4:190::16) To PAXPR04MB8459.eurprd04.prod.outlook.com
 (2603:10a6:102:1da::15)
Precedence: bulk
X-Mailing-List: arm-scmi@vger.kernel.org
List-Id: <arm-scmi.vger.kernel.org>
List-Subscribe: <mailto:arm-scmi+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:arm-scmi+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8459:EE_|AM9PR04MB8537:EE_
X-MS-Office365-Filtering-Correlation-Id: 1346fab3-9311-45bc-740b-08dd2e1f7bea
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|52116014|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?K6ItUenyY/TpBHqg8UKbOanhszFCdw2CK9SqGKMsbQZhkKtdq/b0AgZddxJn?=
 =?us-ascii?Q?6SqEDC1iR1UrcI95vVZdjhRg8x/2RyLICYvZkrtmuZAR5rCBqbrpQCmD0EVR?=
 =?us-ascii?Q?q4F19eVwXGJEAqOrRcv3ypZQVuLqLFp7K6FwBGnhth7DBdJWD+E0gdy+1+k+?=
 =?us-ascii?Q?30SwmOyoAmah4De5MVW6dhux/SlERY4RAU/q2BFvB0cqVQQh1a2xRS0VMMIH?=
 =?us-ascii?Q?80ckxKt1ev6nJ0INIlCgd/FBa6WfFtMCUi2ks3rLZr7y4lmGRn9xYCFfCGHp?=
 =?us-ascii?Q?qZV0lTX0wVTAzLJinBwUC7U4vN0gDYo3UrU2ZzX25Szt5tvIB9dl6jMJ1njC?=
 =?us-ascii?Q?G/2AewmRvQGtpufYZkTlsSIGXPL8FSuz284/jEmKMuiSFCwEDcbi9vp+YtK5?=
 =?us-ascii?Q?1Q75Kwwq668aJL64U0S9WW751b/nKZsl3OX7MfeUAV+nifuYY5lFIuaEpGJP?=
 =?us-ascii?Q?vFMGZg+5L5cLm3h2aaRK6G5pjeOCPSHQrv5kNe4XHgokcGtMMs82r/xeuhpP?=
 =?us-ascii?Q?U21t+TDJfxdSkMH/FEUFgkUoNFSev7wF/qYFc5Yt+itAN07KqgHJG5uugaP0?=
 =?us-ascii?Q?QGOEA4NFTR6ymOX5iMrSFVvjmpRUXJyiyvm53q7qtPuXWC8dQGFrZEuU62ub?=
 =?us-ascii?Q?yFpHrIW90CKfftl3lRFHcjNUeYTHuMet+pniN8S7psFS1lRmxTGkjgVtmRH8?=
 =?us-ascii?Q?aqjg8LUtrc7537BwV2wVA6v1bfCvgD1AICc/285qU6iofo/qt598FKuAxkao?=
 =?us-ascii?Q?7ChmQuMYAWpsE2I46Gi9iOMTrfNYy6FCF2w0psTJr5lBZHgdvjeMrVb6FPnH?=
 =?us-ascii?Q?yeglPj1C7Hv5UiE4bHjR6Gl1pDh9Pe/gNmvQKt/aHwfeb0GsObqQJUV6SHag?=
 =?us-ascii?Q?rxEddLuLAXnaKEgp185kjNsJ1rIuCdpAP2FGgUHHERMkwt49adQaEBurkNYq?=
 =?us-ascii?Q?/IdZVcMWJ/5GfE26n34Ik4pDM5i9gRAL7TTyzbgRQOF2be8eayc3zs2JgMP6?=
 =?us-ascii?Q?LS7qqHxOYlHZa/IqyuL5XWYjXmrKJ/MxQpxee2TKSvJssNgZa4v01aaS0Z7P?=
 =?us-ascii?Q?+qD9I/ZlFN1YuKVBCSd9+EMiRLNSvNoePZycUJuk+exNTm5XM6v0m27eteku?=
 =?us-ascii?Q?25u/gI9XneTJ6+IMLRKnTos9C+Oqa2dEiMPC8XdC80UKP3cp8Yi/IgkYESva?=
 =?us-ascii?Q?AsT1EPjlmMhRRHX1VI0dJvqHUal+p3VGbAqNR4yYpHUPOZ/A0N7AKSfK6Op+?=
 =?us-ascii?Q?1Snnbe9NGsJMcxJ/VuHTcyqZtDxnPeOpiI81fytCjFQITpEDw7vzvMHHUksa?=
 =?us-ascii?Q?MuXLr6QvHLoO3vsthL2ff4VDHrzOZns6DBoWPA5D9yW6K33RShQEN7N7TgO1?=
 =?us-ascii?Q?lEWJyVnjy85CQWXIyFfYhZC+ZDNtn8VpA76aTNZCx3yS9RBPAdNhsAdRkuu6?=
 =?us-ascii?Q?+pdyllD0vjbyNNFLvHtNYWhYlyNhJsR/?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(52116014)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?pjZv8zB4DFYICu97IjeLwuIDvlkLtYfXBfLt3kx8IEjWJR11v+Fw0vAboHSH?=
 =?us-ascii?Q?SLYYuAOehnMTDr/GbAT4ZbGFj8eUBThv4/FJ4Lgn1M3U8j36Kv9mJcbyB4FV?=
 =?us-ascii?Q?3ir2868OYYA1FQREyfAn4Ds3ZxSSiWr1nXO0RINUnSn5Ut7W0BKNfj9DwEGp?=
 =?us-ascii?Q?p5BNg3b5Ox0w0sIjJQH6k7yk2M4BhQ4kHkueVZWS9Q+a0h4FtJviaDVgWoQQ?=
 =?us-ascii?Q?1w/OqJJ113KYumRt+6ZpC4c0pVKCrr00fHkDJD7XMkymoIvcwb5ltbBbVxQB?=
 =?us-ascii?Q?WFC7854cpQrzKN/mW81/2Bm9nxsDR7QHAOUoag08ru9fenGrDHm+L/+fhjh9?=
 =?us-ascii?Q?MWUZRFB2hUSQTd6zT7Si3A1BaSNpfkZ07IWzDYPBOyzaXiT2z2b9janzIfJ5?=
 =?us-ascii?Q?RyHe5Yx4e4YvShAp0k1n6HLKUFYEnhud5WB8twN49ITdPlCkjp4z3XW67Ao+?=
 =?us-ascii?Q?o1WFYF92Mmh+FX60epYXJKTsUAL8bLZY8wQ96Ud4jeKIGBncmIMj7MiTY4Xt?=
 =?us-ascii?Q?ZX2NRcEbQy2ATfeTr5AoSgeoKf0KHmseHClnwfjO3sf/Cul+dcG520VCWQM3?=
 =?us-ascii?Q?I6bFPrHIZbpjeEXFrt0sCJIxKGwBxFTqvznWj5/Pb6wEuPliU1II3VEXSUTp?=
 =?us-ascii?Q?SdJBdYCKkIcYCNQrwBZ4gUYwCtb/EntIqoWz8lhdcCs/WLZI3/gvN6CBVKaS?=
 =?us-ascii?Q?VJRKDWJGVKG66oDOt+7cJNtdgXkcz7QV0+C863lVE8bO/XPZ88Aed4TXWHWX?=
 =?us-ascii?Q?Rqfw3X9t3BU4kq4McTveJNdFOvc/1GFRRIAzWzh3nVhV7rRjFx8GthiW/BQm?=
 =?us-ascii?Q?oBOWUWhqXUGAtrdZIWUcjhKbm4RfwPO3Zy1vJG2XRJntJR/qyXDZQ7PZla26?=
 =?us-ascii?Q?DriidGVNiVkod+Yrg82ZhTQgNHsZ83lMdNhoAeMneGjHP/dC8HMTkriF96xU?=
 =?us-ascii?Q?bncbyyIL95A+lP7yEHgKWj85gBkGMQqcuhNeu0lpNGbirdinbgS4atOSgL50?=
 =?us-ascii?Q?CW07XMfIY7fxta0LvfQozG4og1MIGjnObkhEAHOz3r+eD+m/no5cN75YajdM?=
 =?us-ascii?Q?0xbqy3YmSoxn6VxUAOfpOMo3U4uOwlXoxqlFYTgasp9VwBA7GhGgyy7n+kRz?=
 =?us-ascii?Q?9oNVk8Z3RW6/qARB4pSB5oV56IfhKvbLNiqwi4QoGqB0mb4dR0RatU5iU66F?=
 =?us-ascii?Q?9E23AsYB230Uc2q5ZhM4sRttXJ+38YMSGMArCBuFSxUZNTPEtA4M7fO1w37o?=
 =?us-ascii?Q?4OKIQUUaDHqEPjHS/fwQYfieV2j2r20gCM0R4nZBg5/J1UYl7bZ6OQ88mGdH?=
 =?us-ascii?Q?YxNO/vVJn+5omn7kk99BxZ5bFpde5K3moL7yaN9NaVema1UstthNKjN7ggAg?=
 =?us-ascii?Q?qxuqpdSe6HLzHFS9jMMpvEI9Al9vR3hR3emyJ1fU4ZcgmKcF0+z7uol+iYUi?=
 =?us-ascii?Q?YUoiN+Si2AVHRVPHrQxR9osnXsH6X6sHcwGn0wfV48FTLgq7hjKQJOFL1XIW?=
 =?us-ascii?Q?VcWFYAphZbuqo9VERX+iyZ+m7ABieT7RhuW1ZCC3/29ON+7s8Hll7mr7Cm4A?=
 =?us-ascii?Q?KKJOa734We/eJqdXmxtUpbZvf7wd/HurweRehMxZ?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1346fab3-9311-45bc-740b-08dd2e1f7bea
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jan 2025 06:58:11.8474
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BR9D23U3V7+iILh1rye+/xa4fp9Buypx6GIl7SMiKxzQ75+dXEoJqss/6dD8lVHcSh2bCoS5iU/vljwa+IQj5Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8537

From: Peng Fan <peng.fan@nxp.com>

scmi_requested_devices is organized in IDR based link lists, so only
need to search the link lists when there is a match protocol_id.

Back to search the next id with 'continue' to save cpu cycles, if
protocol_id does not match.

Signed-off-by: Peng Fan <peng.fan@nxp.com>
---

RFC:
 Tested on i.MX95.

 drivers/firmware/arm_scmi/bus.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/firmware/arm_scmi/bus.c b/drivers/firmware/arm_scmi/bus.c
index 157172a5f2b5..42deab5903fb 100644
--- a/drivers/firmware/arm_scmi/bus.c
+++ b/drivers/firmware/arm_scmi/bus.c
@@ -79,6 +79,8 @@ static int scmi_protocol_device_request(const struct scmi_device_id *id_table)
 			if (rdev->id_table->protocol_id ==
 			    id_table->protocol_id)
 				phead = head;
+			else
+				continue;
 		}
 		list_for_each_entry(rdev, head, node) {
 			if (!strcmp(rdev->id_table->name, id_table->name)) {
@@ -89,6 +91,7 @@ static int scmi_protocol_device_request(const struct scmi_device_id *id_table)
 				goto out;
 			}
 		}
+		break;
 	}
 
 	/*
-- 
2.37.1


Received: from GVXPR05CU001.outbound.protection.outlook.com (mail-swedencentralazon11013000.outbound.protection.outlook.com [52.101.83.0])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7940D34D382;
	Thu, 26 Feb 2026 08:54:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.83.0
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772096083; cv=fail; b=RcqNvwhpJ6kHJXyuH9KufaHwk9JLjz+NBoRKseeQ13QcYacutDlyHuCxx3YLB9Gl4MTVsVrPUB9x7tEqYjupLkAIsxBjW8VNS/RWmoCFoUAX5GxiONwRUShriIFxbQFIDZpnV57lhVe3yN4sb/bkb2BNd6jxCnXOsMxuhbkTTNc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772096083; c=relaxed/simple;
	bh=iwYrB6kehxw3OVCTFecLZ9hmTrCZ+SW6AOM6/B57jTs=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=EzkHUj8MSv3GK3SBH/VjMtuZl8SglshhZwwNATjvRyVX0w/xAy6fZQXKq40EQGEBkRCQgci7JBBeAQX5nalTDqxJsQezyd71kPIF0Rl7uoH6GaEKpR2byG+7YZMfE9HdxuKabecae2l1Kv857uQl8oHhTIE4lUGuA8OICiIUr+c=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com; spf=pass smtp.mailfrom=foss.st.com; dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b=HHFK12Dx; arc=fail smtp.client-ip=52.101.83.0
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b="HHFK12Dx"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Rdzd1lhZEG5+5Vug2rpzQjMi4NR7KaW0pFXasRg8mNcUxGcsz9BPh7pAg5LJqdiMxhOJwiNJx2k17t6qe4pXoIUp33DxEjbJ9CtJxIw5UyTVBiHLvwMCPsZb+Og1ft1SrweJiBOvsLGguEiIUwV/5VEhNDqb2hvp4V05r+YLRjngOBYcQq3qkrpcgPD135rmMjLT7oLpW+OM8edQjrptkrtPblvzvC2GKy2gbTBEQyAZig8irrH10eFwmKs18vhrKKaLvHp1hemcdsPl0DnCL+mmwkAZte+s100ZC3998b7S2abaB/0Nt2JA0fokOZKxJPW2Cz9DajF/H/19n87P1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Lsh2hKzG/1TRvJTPITa+60YqJlYuYeacZ/CbhuZQsts=;
 b=sB95KItD+m0ZlM5n/eBTjHJtGvt0oqFAfxemtKzYb3JFn/GB0+uJmUeS/xFoDvjBmMnnBZ3oB5ccacQjGUglmIi27Q5Cq7WSrHhx6kD5ArVmwWOil3p2HNXWz5TvzJfb7uDSoDQgAUTSesM6OQ6oOR2NT8MuZMBoolBkOcKtHbXVnjx7gzVmIPB9CQd1E4Ty0gFa4uGHCjvcznrSoLrA1uYbakB2uZI4kdirW4BNnDfY+g8zjuS+eYdWjHf44Lb2JvzrU2qC+R4FaxyCDPW1yYUHa7sI5lXcpFw+qmb2QuPoaH1Ow+Zi3bOsZA0uNT//n+AySBo/5KKnzfJWV8bUFg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.59) smtp.rcpttodomain=kernel.org smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Lsh2hKzG/1TRvJTPITa+60YqJlYuYeacZ/CbhuZQsts=;
 b=HHFK12Dxqbr8l6X4Knxq9t+0ZnLPb/T4N1uAqbjHVW9A0LGPf420vDT6VqCUrz3fEHKYP9wNmugzKDilbad3Y2N783TN1WLFFFUWOcU9OVJnOONU+CasoElX1a3vZq6jtTtNhYVIh5lItXhKFgGVGu8WzSkzv0JwBRIbDEgc2Wf99XRRml93rMrbfKDoVyGlGrlyu9EjkllCrsybtrtOjndEQdE+414Gho7Pq18zixaKg2VG+gwnydpOPpWUU1qgn9Xf4/0Pgc1MRtq1HSdAPKtem7AC+uT1Q4n07u6P9lKbT8Vn+D9VmMK8yaGMFCkzYFdGPzX6N/81MqbpMDBxKg==
Received: from DUZPR01CA0198.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4b6::29) by PA2PR10MB8364.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:102:414::5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.13; Thu, 26 Feb
 2026 08:54:38 +0000
Received: from DB5PEPF00014B8D.eurprd02.prod.outlook.com
 (2603:10a6:10:4b6:cafe::94) by DUZPR01CA0198.outlook.office365.com
 (2603:10a6:10:4b6::29) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9632.26 via Frontend Transport; Thu,
 26 Feb 2026 08:54:42 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.59)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.59 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.59; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.59) by
 DB5PEPF00014B8D.mail.protection.outlook.com (10.167.8.201) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9632.12 via Frontend Transport; Thu, 26 Feb 2026 08:54:37 +0000
Received: from STKDAG1NODE2.st.com (10.75.128.133) by smtpo365.st.com
 (10.250.44.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.29; Thu, 26 Feb
 2026 09:56:55 +0100
Received: from [10.48.86.212] (10.48.86.212) by STKDAG1NODE2.st.com
 (10.75.128.133) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.29; Thu, 26 Feb
 2026 09:54:36 +0100
Message-ID: <5a291dbe-de59-4603-a712-40d4edc19aa3@foss.st.com>
Date: Thu, 26 Feb 2026 09:54:32 +0100
Precedence: bulk
X-Mailing-List: arm-scmi@vger.kernel.org
List-Id: <arm-scmi.vger.kernel.org>
List-Subscribe: <mailto:arm-scmi+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:arm-scmi+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5] driver core: enforce device_lock for
 driver_match_device()
To: Danilo Krummrich <dakr@kernel.org>, Cristian Marussi
	<cristian.marussi@arm.com>
CC: Gui-Dong Han <hanguidong02@gmail.com>, <gregkh@linuxfoundation.org>,
	<rafael@kernel.org>, <linux-kernel@vger.kernel.org>,
	<baijiaju1990@gmail.com>, Qiu-ji Chen <chenqiuji666@gmail.com>,
	<sudeep.holla@kernel.org>, <arm-scmi@vger.kernel.org>
References: <20260113162843.12712-1-hanguidong02@gmail.com>
 <aZ9ZN7H1thCmkPEQ@pluto> <DGOBYS4LNHWW.2JTHJHGQA37C@kernel.org>
Content-Language: en-US
From: Gatien CHEVALLIER <gatien.chevallier@foss.st.com>
In-Reply-To: <DGOBYS4LNHWW.2JTHJHGQA37C@kernel.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: STKCAS1NODE1.st.com (10.75.128.134) To STKDAG1NODE2.st.com
 (10.75.128.133)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB5PEPF00014B8D:EE_|PA2PR10MB8364:EE_
X-MS-Office365-Filtering-Correlation-Id: 422f5fab-b389-4552-ad92-08de7514ac05
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|1800799024|376014|7416014|82310400026|7053199007;
X-Microsoft-Antispam-Message-Info:
	2H4smOZHyOvHvACWfxSZZ7rHCv6y9h+x3XpKWWCZ1CHEWvWvw/SAJlsFMn373r+cEndwI42c+XrDTGim3kBCG7ylN54nqnw4EqGWXYxc9Mvm289RwnE/cvEcVyemMMmj5kVw6Ue8XDd19SCE7XK9+9sNoOqAGuaN78Z4pzluNg+DWebHlR/xfAtn7wZ/+Lbpt15Qn+s0G1kFvG7fxcQ+F5AOWNQd6EXuKvJK6/pAodky/jSSGwqZvZHf791vixM3BAJesfe9f2fKt3EJHmgoZB6GP+cpNNwzHkACK5klw+sbfxzbFXTAwYjB4PoOSOZ08rWe1ksNe4grjOZgo5FRBjXKv/MJ67TdW9q8GcVOsb7ex2a2eNGSrFV4yZZh/O8O+85tW7EuMqb3d/EoAJJde3g9UcwlU9QUuwFd9OW7kG3GhVrklI1+s8OzfdZiqdmKuDvRoVz0Cgsv0dlSX24VPOQiUmMUTzRbDDPJZcdizMSPBAOckOJCV3G1va5qWzdnLIhVJLSRunqn7oHz6wl59DiM5if4URO8OFdiVDiDxA75t9aw1TG+TT/wD4qGwwmAOuh9djtEv3EzICYA+Gc3t0Y6S0eqnzHawRGKbWk1ohxYP4KQP7LUOOjpqhJ9Ae9PR8sp0lsyKZDAOepro6TbkV4ZbBn+/cERwtVotY5KBShGNyfGZhFUQgs4iQSS4/2/g0WxBB1IFuwbWb7wNrxWZJcpwMoAwLlIEh74gt9wfctkGwaaDtfHlsxcVG/rOlkCSWDieBSlU1Ap9e6ve3jeso/vaoMpZY6IXwvx5tBjiTL9FjOor/dnwB6dGEBZZ14j0qxtLk/AcccGoNOI/SLNX48e/XchTZBldvoSFql9OlQ=
X-Forefront-Antispam-Report:
	CIP:164.130.1.59;CTRY:IT;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:smtpO365.st.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(1800799024)(376014)(7416014)(82310400026)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	KC8cL7Fxk8ghY2PaeXKzfWQsKUeJwXi6/L1NAB0oZWgx317QDtpukLBI8jb+NkQru3uMtwf4U9YUJzUh1d6wD4jBfqYmkWowGsJUDvulPLlJa4wy/RwP/8MJRCyBFKSBPg9zpQDl8PlSy9bc0fucsyd8YCrRKQYFE81hTtA3+Mr0YafLm5SRibp+z3GQ8XwtdRFJRbib04JotG1cUbG+FsbYJnPCQyZNHvy42+g1Jv79PCFGYdzE/0+2D0XeLnUNlJS1kMG8wYQvga5N8xNfr9MvGIifO24pxD/NT8xl3zmWAk8DeEC4ejHGJZCYDX9t9BFxiSluTV9uVOYaDoIG7ClJunbQlJfDDFYI7Qm+j0nfPL8y2Ggs2Qa+MSxQW8MoZswS4VOGHEuEi2r2zcC0UMNoYXyzIgQejAcrCq/jWvZi9plwsgDQJmcQjJV0/jMa
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Feb 2026 08:54:37.7919
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 422f5fab-b389-4552-ad92-08de7514ac05
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f;Ip=[164.130.1.59];Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB5PEPF00014B8D.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA2PR10MB8364



On 2/25/26 21:38, Danilo Krummrich wrote:
> On Wed Feb 25, 2026 at 9:19 PM CET, Cristian Marussi wrote:
>> it has been reported by Gatien (in CC) that this break the SCMI OPTEE
>> transport.
>>
>> Moreover I still have to verify, BUT I think this also breaks SCMI
>> Virtio transport since both call platform_driver_register() during their
>> probe, since a few years ago the SCMI transports have been reworked to be
>> standalone full-fledged drivers.
> 
> I've had a quick look and I'm pretty sure that both transports/virtio.c and
> transports/optee.c are broken.
> 
> Both cases look identical and I think the fix should be as trivial as moving
> platform_driver_register() into module_init().
> 

Hello,

(Regarding OP-TEE SCMI transport)

It may not be that trivial because unconditionally moving it to
module_init() would not guarantee that the TEE bus driver probes
before the platform device driver. I think there's a bit more to it.

The platform device driver, as is, is not functional whilst the
TEE services are not available. Therefore, it could falsely fail to
probe if probed before. We may consider some sort of API to know if
the services are available?

Gatien

>> I'll have a look in the next days if we can cope with this.
> 
> I already fixed those three [1,2,3]. If you can provide a patch for both of
> them, that'd be great. Otherwise, please let me know if you want me to send
> something.
> 
> Thanks,
> Danilo
> 
> [1] https://lore.kernel.org/driver-core/20260121141215.29658-1-dakr@kernel.org/
> [2] https://lore.kernel.org/driver-core/20260123133614.72586-1-dakr@kernel.org/
> [3] https://lore.kernel.org/driver-core/20260212235842.85934-1-dakr@kernel.org/


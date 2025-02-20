Received: from EUR05-AM6-obe.outbound.protection.outlook.com (mail-am6eur05on2059.outbound.protection.outlook.com [40.107.22.59])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21BCCB676
	for <arm-scmi@vger.kernel.org>; Thu, 20 Feb 2025 02:54:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.22.59
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740020053; cv=fail; b=PLjkmRukhKpumBJuEPRbjEM2TVF+KmlVvTnweyW6D+XBRgURhCODVzQKh/lsxSqPFUrW95wx77eA7Q0mLOKRX1I+M/XcfYIOiKnvrg++z7xfvxSXB7xkN9dTU+rz/UmR1+Y8BRx4GBy0jhYFnWGk2KcA7WGAhsC2wz6FDuK9Ra4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740020053; c=relaxed/simple;
	bh=mcsm8m/h35Pk8/C3DdCDAHU3qJ/1VjfVNWI74IUzkn4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=clhw6tWF7uVoIkrB+xNSt+4PupoCLkUQcC+WZMh0zmrIMUAbk25cRzACm1eFTkdlE6sirsE0upmv7Vf+hxHoNdByo8QIcaioZIG5amDRATEB6r+pYKTnBCZq7yDmfN+7w/4CQQntheXOa4Ap+2+q/DAvfPTPfSHW7/ZiPYmoURA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=PHM24a7a; arc=fail smtp.client-ip=40.107.22.59
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="PHM24a7a"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ww7gPin1yMU6H7J3/iwRBCl9o4nGS60LmiijzKWtL7fLB2jibW0XB08HdTQI7Vs2B91zTw2PspvBoMcrOUb9Eeoamd34lWUR33l5yTQxSdK/N8Cw+NGne/N+N9BOM71JH9bToUlXWwaTZlRc6n8MO4upgZuWbcnM9sdGahC87Cv6Yke9L4fT+CCbSfAYOcZkPsx5Lly+izv0WllVGnujfhYLuOP9yo4RO5meQQ1cepBB5rZa+FbHr0XeZTA9x+0OM0HrVFvTQDrg9KvmIvvxkqdfACH5GNLG6mhkIL/JLdKm5yeej3E131aD6Fw4AVVmcu3/zImShkG040gDH99rKQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kw5/H4XrkqzEfdKN8fAXsyqaW5qByaYZhp/Rkm9ClOE=;
 b=iG1qc5DC0QaD5Fo/dEH3zVebDZ9OHQQaN4+WJTNCUZfXr4EZ66IzTXrFQgT6HywJD5SZV7wN/7Vk+JL5+yhD/JzwNaqo7hvEtMxXq6bD795mOsN1Om02HJGIUrsgTkEbNHejJ0uL113toe2naQEh1P4bsFSYu2VlYUjRZP0JWssg0DTD/E7m6doYwlnvkjUxAUz/6WzBxze+aOplMd+eE4Hcu/vPZ9Q4VgOCLI3TYDM6rtrGb3Md8uNtvq3wlXu4ly2mTkovzAF4LA/B+O1Dmz5dZoRQHeDY8H2n+qRpj0Mt0f8S+cNRi25TDaN1hiIzWaIZUkJBNyJv09pGkmOO8Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kw5/H4XrkqzEfdKN8fAXsyqaW5qByaYZhp/Rkm9ClOE=;
 b=PHM24a7au4NwVwAR6SJzrmi5eoSe+sXDU2c6Q1KsjeFtSW6QX5PvAq9mGh9Mt3aGdewfeHHiipuBOjZqveUBFISNW8reD/gtU7Cc4/lufUGXIw1N0NnUV2SdB44chOfEdKg58GzLYf5U2kMWageZ7qGP/y1klnXPQK5M/FqJYonNml03+4qjmsVBjmJXjfXerhXHe8KFT2oZIN44J29JOYvxzLXw3Sh3pRY5DNUeJv2h602h5NEg/RG8s73kdshgdGEi5bUw5KhAGtwi5E4D4tjdNus/ZxJtkqfdYkYbV7flDzBlprScN1Ch/2ZSsUq8/CYWrAOWs00EeGHALWLMrg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by GV1PR04MB10845.eurprd04.prod.outlook.com (2603:10a6:150:20d::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8445.20; Thu, 20 Feb
 2025 02:54:07 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630%4]) with mapi id 15.20.8466.013; Thu, 20 Feb 2025
 02:54:07 +0000
Date: Thu, 20 Feb 2025 10:53:50 +0800
From: Peng Fan <peng.fan@oss.nxp.com>
To: Ulf Hansson <ulf.hansson@linaro.org>,
	Vincent Guittot <vincent.guittot@linaro.org>
Cc: Vincent Guittot <vincent.guittot@linaro.org>,
	Sudeep Holla <sudeep.holla@arm.com>, Peng Fan <peng.fan@nxp.com>,
	"cristian.marussi@arm.com" <cristian.marussi@arm.com>,
	"souvik.chakravarty@arm.com" <souvik.chakravarty@arm.com>,
	Dan Carpenter <dan.carpenter@linaro.org>,
	"arm-scmi@vger.kernel.org" <arm-scmi@vger.kernel.org>,
	Chuck Cannon <chuck.cannon@nxp.com>
Subject: Re: POWER_DOMAIN_ATTRIBUTES in SCMI
Message-ID: <Z7aZPt5a0P53VL1N@NXL53680.wbi.nxp.com>
References: <PAXPR04MB8459E8D1A82DE43C08B6C26788FE2@PAXPR04MB8459.eurprd04.prod.outlook.com>
 <Z7Rjyy7_Jg66vqCf@bogus>
 <20250218130823.GA17099@nxa18884-linux>
 <CAKfTPtBd14wM2st62m3tnkQOZgBTUmxpjZXghMVff-Yg7wCVDg@mail.gmail.com>
 <CAPDyKFq9QHw==2WqcThC5mjMy8ALqmZ_hKxt2QsZJ1q-qixLfA@mail.gmail.com>
 <20250218163146.GB15753@nxa18884-linux>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250218163146.GB15753@nxa18884-linux>
X-ClientProxiedBy: TYCP286CA0269.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:455::20) To PAXPR04MB8459.eurprd04.prod.outlook.com
 (2603:10a6:102:1da::15)
Precedence: bulk
X-Mailing-List: arm-scmi@vger.kernel.org
List-Id: <arm-scmi.vger.kernel.org>
List-Subscribe: <mailto:arm-scmi+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:arm-scmi+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8459:EE_|GV1PR04MB10845:EE_
X-MS-Office365-Filtering-Correlation-Id: 35ca8184-d348-4e5a-2515-08dd5159d791
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|376014|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?ZSs1NFJnL24xcW9SV09IS0ZOV1Z0SXNQTFFCeFBPNC95R2ZYc25NaDl0ZFJo?=
 =?utf-8?B?MGdWUWFhUjIvSWhiQVJ3WkRYY2xjaGJ5MFExeC9HWGx1c0Npazk5c0NYODRz?=
 =?utf-8?B?L0JPWVpVTFJ5YmVCVk1Eb2JkL3M2c1VxOE1VUFJMbkgzajEzMTFuUUlZR1Nu?=
 =?utf-8?B?OXN1cGpKdTlKWUZTSUNPdEpOSEJ1OGtNZGhSRDZnOGI3bUp3SGV2RU4wUmxQ?=
 =?utf-8?B?akxsZWkvTFFla1FDdUJuVFlOTlRkeFZBbmIxQlRrK01oV2hDK3hJQ0Jxbmg0?=
 =?utf-8?B?WTBhKzg4V1JnUTMwbWFIenYwVHVianZFdUhUaTBVd0JzeHFaKzJKdXh0bVBM?=
 =?utf-8?B?T0NvNkE2cUFYaUZ6Ly9Eb2FBRWFSQ0t5dUNYRHFqUisyeTluODZNVGZ6NTlR?=
 =?utf-8?B?U0xNY0RTWU5hUkxGY3psbXZ3SlowUjNFMzJLNlQ5RXBuWEFnOVpwRXplamVW?=
 =?utf-8?B?cmtDa2x5djlhN3FQM0ZWSGZWdHpaQldOdlVLTmlLaWQvQzI0QUg0VnpzNk91?=
 =?utf-8?B?R2xoNzcrcWk0ZmNWa0srSEV5MkNtWC9kVUhHd1g3eEM1M1ZQZWpHQVllOUJU?=
 =?utf-8?B?TFVnNHoxenoxTUlxQ0orb0pwU3hQZzJWZ0hRblltbFNscDA1T2dKbGlUTGtX?=
 =?utf-8?B?S0czZExFN0lNV3d2QVVlQklWdU9TUnZ2WEU1RmYyZUd5UXFNNElZZ1U4TS81?=
 =?utf-8?B?eHdxdmxnRTcvZnNPOExHY0FQTmI3N0hISkREd3BLRnVGSTBBUkFndXJteURP?=
 =?utf-8?B?VHVWbDZRbjU1NXdwS2JjazJkZ3JuVmZucmY0WE9JckJHdFd3NmJBUkFoN1Ba?=
 =?utf-8?B?R2ZWbjZLOVlMb2ZORElUL2dIYlRhcWtuRkFRbEhIUWQwY05oT2g2VWlHQUk1?=
 =?utf-8?B?eWdlbXN4MHdWdG9Ib1V2WTVZL1ZpRHp0a3ZZbURyVndFVmVjTGQ2Z2tTTFM5?=
 =?utf-8?B?bTRtM2RacEVyLytiVHYvU3B2cEd1UHFnc1ZJeFErZ2d6Ymx3TlVyT0czWXJP?=
 =?utf-8?B?QlVJUlRLU2dPbEIyeFJLTG1kN21jakkxTXp1bWk4ZkRZY0hueHZDc1Z0b2sv?=
 =?utf-8?B?NExYVExyY3JXcUxXOWVXbUhIZzBuM3FFa3FlaklwVStXYkY3aGV0ZDlhOGhs?=
 =?utf-8?B?RjZyTG5PWnNEL1ZtRHprRnRpei9LVnJMa1FsaVhuL2tKOUUzQmp5Nm5GZ3Za?=
 =?utf-8?B?V1hEcmdzeVR6R3IyOGloS1U2QW0vLythUzVwemhxdFdrSGR5ZENhYzVZMmxZ?=
 =?utf-8?B?ZWlTWm9KT2ZDb2oxWHg3VStvS3Z5Mm9YU29CYzBWa0lLek5jaWRpNU5xd0k0?=
 =?utf-8?B?QXg3ZFl2QlMrUFhRRHY0b2RWQ2tBMXZ3RE9zYm14Z0VQaktkZnN0L3YxS0pF?=
 =?utf-8?B?dWg3UGJUcHVPN2VLTEIwNno1VVVySzZua3o4SzJJWjhCUjRoenNaVkxVbVh3?=
 =?utf-8?B?MlAySkJmYTA5VkZhdW5DQjB2aFpuQ0ZaTWZsYUdjU09wWDlRbFFKV1NrbU5q?=
 =?utf-8?B?NU51eUlQL2hSdy9QdE5uOThTZDNTV0hmZlNuZGtQd2YrSVN6Y2Y3RGtFYk9C?=
 =?utf-8?B?NUFwcm5rMGR3bXdNTUt2S1BOWXh3angrbCtoSW9WbkszYVZNQVc2eEVmUnNM?=
 =?utf-8?B?S0pvRGhLbWZIWVFoZ1Q4bnB0ZjVIR0JJSndnaW1GNmpubjJBY2xDODJFeVlY?=
 =?utf-8?B?OWpWYXZpMkEyblpRZjRGY1ZqMWpZTjB4MFJDaUt5Zzk0K0UydUNFTENaRkJa?=
 =?utf-8?B?clVLcWFlcVJ2Z3AwamFLRW8wWHpSMWNMNyswUWRNQnVxT09mOUhwSTQzWjNH?=
 =?utf-8?B?ODZLVVM5VVdjMC9CcFpLQlRnRGoxYndDWDQzNXBFbTdnekRJRUdXZ3FqT2Vy?=
 =?utf-8?B?dGpaZUZIWHp2eG0rTm96eTZubm01TkN1bmhPejFDL3FNSEVCUUJ0MUZoU2U4?=
 =?utf-8?Q?nE/7YEMfRmgqAn1K+kZBH+niRHBHydc9?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(1800799024)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dmNxVnQ3aTJpcmhPNnlBMnlDRFZ2TFpWdHY0ODhZd2NodkpjZkV2bHR6V3Mx?=
 =?utf-8?B?dml6V1E4NFRTWFlOQ2FqOTErcFlORko1bWpPcDIzdzdKK0xuZFFjUENDZlZT?=
 =?utf-8?B?RitZeE9FbDI5S0sra1RrV3pIMnlsRUw0MG9OSDVEcGFibE1wMlhWbW1pNE5U?=
 =?utf-8?B?TGdxeGJZOXp4NDFVVzlzZFVDWkJBQmtnOVl2QzNIRUNhUFAySi9NYnA2T3dB?=
 =?utf-8?B?NkpGZUdJNFN5ZjNCajdCR3h6Tk94WXhmR1c0bTU5QnFxOUhPakpBQmdoSW5K?=
 =?utf-8?B?V3NucTZGTDQ0MjdaZHJxaFpFMUE3aG1JYlJ2aEY1WS9QQytaNFVjRU81Q205?=
 =?utf-8?B?WEIvTjA3TXlDWXFWamV4aUMzV3FtWk9oS2Qxa2FjbFMvMlV5bE10Nm1qOU5s?=
 =?utf-8?B?b3Y0L3JpZTZ0bWZtaG1ySUxuT0VRUEMwTWJzSytUZk1XMnZTQ3QraStsUnB5?=
 =?utf-8?B?VXk1S3RqdnB3bVFNQktQcExmaWZ3VE1KUFBCd2dVODNETmNqUnNSV2tFUnZl?=
 =?utf-8?B?a2RqTmxtODRQMkR5cHU0VFd1MXJuT0ZDNjROZjFPeXpnOGJtQXdDUGVCVzhN?=
 =?utf-8?B?VGJHYjlQSmhCa3FtWkpvc0U1UEJIbm1vb1QzRmFjUUVhV1h0Skp3Y2YwWmhn?=
 =?utf-8?B?VG45aVFuTVV1THNpS1BOdFlqTEhoelpZa2t5SkU2V0szakY4aEtNbWRGdkVu?=
 =?utf-8?B?bDFSUW5Sc2V2Qjg5TlNkcVBJd05GOHd4aXk1Zld0QjdFcFY3V2g4STlBWE4r?=
 =?utf-8?B?UENWNDVNcXFvcXBaZllxSHB5OWNScENyUmZvWU9QTlZlYnB1WHpEL0w4SVN6?=
 =?utf-8?B?enFrblpXcUNVN3hHeXozaWR4NllzT2pURENWT0o0VWlaQmlOYUIzSmdaNkxw?=
 =?utf-8?B?a3JvZ0VmRG5sRmlBM3VweUdDcXlnUEQ0endnSFU5OTRnaUt3ZnBJWktlQ1Iy?=
 =?utf-8?B?dVc4bXdlY0ZLU0ErbHdOMkpSQ2liaitjeTBMMlkxOURJZnE5WnMrYTRGamlE?=
 =?utf-8?B?Rm01bWdyaFhmaXJ0MmpSOTlLZWhWdmNBdXpuK3lUalBiVnNkWGlOQzN4NEM2?=
 =?utf-8?B?R3NHbXZVZlhhVnMrV0JHWWZJVmRsVitKK29wSzZhUGdRVThTbms2OGxXWGZm?=
 =?utf-8?B?TTh6aTNwTXFlbzZBaHZiMWljQmtPUHZqQkhpbkZZYjZpQjlPV0MvSEJTUFZH?=
 =?utf-8?B?V3R1V2UvR3h6bDZVbFlCS3dnZUdSL3g1VEg0aWU3VWxaYTdVZW1MTGF6ZDdq?=
 =?utf-8?B?bTNkTDY1VkJFaFY2V1U3NkE2U3ZuYlhacGd3WDJpLzgydEJPd2ZOQkx0S0dn?=
 =?utf-8?B?RmF6NVFJK3o3bjNleDJpajdPV1gzUzhMR0VZSEltM3IzWUErd1ZLaEgwL1hV?=
 =?utf-8?B?Q0F5Q0JCTWR4cTNuV2lIQzcvUCtkRHRjV0RsWWQwTmZJcUl2dkI1VWJ3Y212?=
 =?utf-8?B?Rmx0T2VYcHdnMWdTL3AvZ2YwYktidG1sR2VicWQ0bVpvTEFZVVh2eEVyTDhE?=
 =?utf-8?B?VWlvTUI3d0lHNXgwbGh6QlAxQWZXZlR0cGkzb0pFalhjUmFqRENFaXJGR0t3?=
 =?utf-8?B?T0oydnhyNHgrcnBnMGU4MGRMaHJLNE9TSFFPMnFweHBkeGZoV3ZhbFVjZS9l?=
 =?utf-8?B?TWMzVXZleHJrN0NGYlFUcG9CUmlwdE1xTi9UZ2kzK1NKNit1V2Z3SWt5MEF3?=
 =?utf-8?B?NTJraWNkVGMvYTZNbmxuYVhWS3RPa0RpOHFWVUdUMzEwb2lNazVaODl4QzQ4?=
 =?utf-8?B?Zzk3eElFLzR0WmFoYjRDbkQ5TjdSdFVpU0pzT3dJTEZGZU9LazM4RDUyQ0t1?=
 =?utf-8?B?RlVmZTY2ak5rYXJBVkQ5U1BlM1ZFam9WcFZmNGJyMVY5VnhvdFVDYStDSldZ?=
 =?utf-8?B?UjFONkhaQ0MvMzJYY09DWitEWTZ2M0NDaVo5Q2lyTW01U2cxeGxPcExUK3NJ?=
 =?utf-8?B?OW9sZTJENkd5dVFTY3JNZU11amhYRFFNTERKTTdpL1hxMm1qbU9FdXlVTm1w?=
 =?utf-8?B?d01OWUFFU2pvTmdiaVF6S05QMDlYUW9MeXlTK0hNTlIyMlp1d1pGbDdzN0gz?=
 =?utf-8?B?eHBKR08vNUg5M0Vxd3NEeVdiUDA5dGNDM1JhSE9rdWNXdWpKSVBmMG5tL3VG?=
 =?utf-8?Q?9ewwyi2nwv2AKOLbol41zgTKS?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 35ca8184-d348-4e5a-2515-08dd5159d791
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Feb 2025 02:54:07.1368
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nfkq6C0ibqoSzX82Y6lqrimmeTBo6OdAt1p68ZkaWbfr9q0X45s06BaOmDeoBVmrQszDqpSJZ3MZ9qAnOeP8Rw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR04MB10845

Hi Ulf, Vincent

On Wed, Feb 19, 2025 at 12:31:46AM +0800, Peng Fan wrote:
>On Tue, Feb 18, 2025 at 04:02:58PM +0100, Ulf Hansson wrote:
>>On Tue, 18 Feb 2025 at 14:57, Vincent Guittot
>><vincent.guittot@linaro.org> wrote:
>>>
>>> On Tue, 18 Feb 2025 at 13:03, Peng Fan <peng.fan@oss.nxp.com> wrote:
>>> >
>>> > On Tue, Feb 18, 2025 at 10:41:15AM +0000, Sudeep Holla wrote:
>>> > >On Fri, Feb 14, 2025 at 09:20:27AM +0000, Peng Fan wrote:
>>> > >> All,
>>> > >>
>>> > >> Previously I posted a patch to linux to set all power domains
>>> > >> with "GENPD_FLAG_ACTIVE_WAKEUP" set in
>>> > >> drivers/pmdomain/arm/scmi_pm_domain.c
>>> > >
>>> > >Yes, I remember ACK-ing that and now I am thinking why 😄.
>>> > >The description of the flag GENPD_FLAG_ACTIVE_WAKEUP says:
>>> > >"Instructs genpd to keep the PM domain powered on, in case any of its
>>> > >attached devices is used in the wakeup path to serve system wakeups."
>>> > >
>>> > >Does that mean all the SCMI power domains remain powered on with this
>>> > >flag ? If so, that sounds wrong to me. I hope it is not the case and it
>>> > >is effective only if the device attached is wakeup source.
>>> >
>>> > Only when the device is setup wakeup source, the genpd framework
>>> > will take this flag as keeping power domain on.
>>> >
>>> > Without this flag, even if the device setup as wakeup source, the
>>> > device's power domain will still be powered off.
>>> >
>>> > >
>>> > >> But in the end we find that some power domains
>>> > >> could be in off state while it still could wakeup
>>> > >> the system. And we have a downstream patch
>>> > >> +               if (!strcmp(scmi_pd->name, "hsio_top"))
>>> > >> +                       scmi_pd->genpd.flags = 0;
>>> > >>
>>> > >
>>> > >There you go, so you simply rushed some solution upstream to carry less
>>> > >patches downstream but this time you got bitten again. Sorry, but I am
>>> > >seeing a pattern from you here and I don't really like that.
>>> >
>>> > I not wanna to argue here.
>>> > I DO care reputation. If I do something wrong, I will improve.
>>> >
>>> > >
>>> > >> So I am wondering to extend the attributes of SCMI spec,
>>> > >> Saying In SCMI spec(DEN0056E)
>>> > >> 4.3.2.5 POWER_DOMAIN_ATTRIBUTES
>>> > >> Page 44 of 210:
>>> > >>
>>> > >> Bit[26]: If set to 1, the power domain could
>>> > >> wakeup the system with power state
>>> > >> set as off.
>>> > >>
>>> > >
>>> > >This is not what the above flag is all about. It just instructs genpd
>>> > >to keep the power domain ON as the device attached to it could be a wakeup
>>> > >source. They are not one and the same. If the device is marked wakeup in
>>> > >the DT and it is both wakeup capable and is enabled, it shouldn't request
>>> > >the power domain to be powered off when suspending. Why is that not
>>> > >sufficient here ? What am I missing ? I am interested in knowing it as
>>> > >it is important to fix the issue you are trying to address here.
>>> >
>>> > The flag must be set if the power domain needs to keep power on to have
>>> > the wakeup capability.
>>> >
>>> > But in some case, a power domain no need to keep power on and it still
>>> > have wakeup capability from hardware perspective.
>>> >
>>> > For example usb phy in i.MX95, its power domain is off, but it could still
>>> > wakeup the SoC. But with the GENPD_FLAG_ACTIVE_WAKEUP set, the power domain
>>> > will not be powered off, so more power consumption in suspended state.
>>>
>>> This probably means that the wakeup mechanism is not in the same power
>>> domain but in another one that is kept on while the device is
>>> suspended and the main power domain is off. Do you have more details
>>> about this wakeup source that works with powerdomain being off ?
>>> I vaguely remember some old discussions about inband/outband wakeup
>>> source settings for devices which enable drivers to specify if the
>>> wakeup source is in or out of the power domain and if we should keep
>>> it on or not. But I can't remember the details; Ulf should have more
>>> details
>>
>>Vincent, you have a great memory! :-)
>>
>>Indeed I tried to post a series (I can dig it up, if you want?) that
>>allowed the driver to instruct upper layers, such as buses and PM
>>domains whether the wakeup is managed in-band or out-band.
>>
>>An example could be an SDIO irq, being re-routed from a regular DATA
>>line that is managed by the SDIO/MMC controller to a GPIO pin during
>>system suspend. Another similar use-case with a potential similar
>>wake-up configuration, is waking up from a UART console.
>>
>>My point is, the SDIO/MMC controller could be configured as a wakeup
>>source, while it's actually the GPIO pin that is managing the wakeup.
>>In this case, typically the GPIO irq can be managed from an always-on
>>logic/PMIC, which means there is no reason to keep the PM domain
>>powered-on for the SDIO/MMC controller during system suspend.
>>
>>At the moment we don't have any way to express this kind of
>>configuration, I think.
>
>Thanks for sharing detailed example.
>
>typec chips using gpio to wakeup system should also be the same.
>
>>
>>>
>>> >
>>> > So I am requesting extending spec to give agents the information whether
>>> > the power domain could wakeup HW system in powered off state.
>>>
>>> I tend to agree with Sudeep that it doesn't make sense to say that a
>>> power domain can be off but the powered devices can still wakeup the
>>> system. It usually means that the wakeup is not powered by the main
>>> power domain
>>
>>I tend to agree. In general, I think we should always use
>>GENPD_FLAG_ACTIVE_WAKEUP, but we are lacking a way to inform genpd
>>(and other upper layers) that the wakeup-irq is managed out-band,
>>which means genpd can still be powered-off.
>
>ok. Would you plan to work on the feature? If you not have time,
>I could do this, but need your guidance on the design. 

Not sure whether you have time to work on this or not.

More info for i.MX case:
The i.MX95 usb wakeup logic is in an always on power domain. So when
usb controller is powered down, usb could still do remote wakeup.
There is no dedicated out band wakeup-irq in my case.

I draft a prototype. Would you please give a look whether this is feasible?
1. Add a new API device_set/get_out_band_wakeup with a new bool out_band_wakeup
   defined in dev_pm_info
2. Drivers could use device_set_out_band_wakeup to set the bool
3. pm core suspend/resume will check the bool to decide continue do
   power operation or bypass.

Thanks,
Peng.

Draft code below:

diff --git a/drivers/pmdomain/core.c b/drivers/pmdomain/core.c
index 9b2f28b34bb5..fa0d93c9078e 100644
--- a/drivers/pmdomain/core.c
+++ b/drivers/pmdomain/core.c
@@ -1450,7 +1450,8 @@ static int genpd_finish_suspend(struct device *dev,
        if (ret)
                return ret;
			 
-       if (device_wakeup_path(dev) && genpd_is_active_wakeup(genpd))
+       if (device_wakeup_path(dev) && genpd_is_active_wakeup(genpd) &&
+           !device_get_out_band_wakeup(dev))
                return 0;
					  
         if (genpd->dev_ops.stop && genpd->dev_ops.start &&
@@ -1505,7 +1506,8 @@ static int genpd_finish_resume(struct device *dev,
	 if (IS_ERR(genpd))
	        return -EINVAL;
				   
-       if (device_wakeup_path(dev) && genpd_is_active_wakeup(genpd))
+       if (device_wakeup_path(dev) && genpd_is_active_wakeup(genpd) &&
+           !device_get_out_band_wakeup(dev))
               return resume_noirq(dev);

In include/linux/pm_wakeup.h

+static inline void device_set_out_band_wakeup(struct device *dev, bool capable)
+{
+       dev->power.out_band_wakeup = capable;
+}
+
+static inline bool device_get_out_band_wakeup(struct device *dev)
+{
+       return dev->power.out_band_wakeup;
+}

>
>Thanks,
>Peng.
>
>>
>>>
>>> >
>>> > >
>>> > >> This is just an idea in my mind, I not
>>> > >> write code to verify, just wanna to see
>>> > >> any comments from your side.
>>> > >>
>>> > >
>>> > >I wonder if we need to revert GENPD_FLAG_ACTIVE_WAKEUP flag enabling on
>>> > >all SCMI power domains if that is not solving the problem you thought it
>>> > >would.
>>> >
>>> > Revert the flag will cause a power domain not able to wakeup SoC if the
>>> > power domain needs power state on to have wakeup capability.
>>> >
>>> > I am not sure other vendor's SoC design. To i.MX95, without this flag set,
>>> > the NETC will lose wakeup on LAN capability.
>>> >
>>> > Regards,
>>> > Peng.
>>> >
>>> > >
>>> > >--
>>> > >Regards,
>>> > >Sudeep
>>> > >
>>> >
>>
>>Kind regards
>>Uffe
>>

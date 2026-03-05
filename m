Received: from GVXPR05CU001.outbound.protection.outlook.com (mail-swedencentralazon11013058.outbound.protection.outlook.com [52.101.83.58])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E747330D4C;
	Thu,  5 Mar 2026 10:20:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.83.58
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772706022; cv=fail; b=L3EqOsa8KXQOZ4SUXrwDgzSLU72lhOuWOD7h3VUy0i47gYw4SZfxjTnbnTTiyUjWWNUutzI4NMBVZhK7OWYUpKZXSICX1O7U0+So34g3ocZ21HMdE9bRCpgpiGzn10cGCp8gOoX30SZBzOa2HMtmqPUoMY7efcNKzcCydyU+xUo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772706022; c=relaxed/simple;
	bh=NoGCaMoJc87Odic5Hm9Tqno2aFrWT9dd7QOZ/1RXdD4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=XdXf/FJyhdNxrjhz33fbb2bDHD8GDkihGQgqugT/JTQ0Gxw2LJarDRCGa2IqpVk+nMnYlNwGhjMYgBOliYsRaNw0utO6zTk1NIjBjROe70CaophMpgTUhJNSJom59rvwM1kFKlG/zXOL6hsT02Y5NO5+vJvo0FStxhBHau09dJw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=fail (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=wGt3+TkD reason="signature verification failed"; arc=fail smtp.client-ip=52.101.83.58
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="wGt3+TkD"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bSvPK53ckNPg6504P54fGIOwcZP+P23xSAqj1gvRv9BQOXARs9LDYinLdaPeZ/6Mvz/xEt48Vkua6pS4dNHaxgUH2giaqyfMTrF6AMYraGyvG6adccBzN51NwFhYtP5zHxXh2Ln1EmL6Jx/V53sMTwYHF3uQUhvi6OnQSjdCBgy7lgo1vFoaoQWBW0Hu4KkA5TCbweWiEBtJ0y8htqsc5ChJkCYCAcDADCx4FdHV8+lJzIYlymRtCNzuZXZ9qScFSmF5tsXzvVatwRpHTNcV2WQF73mXXhVGrdsgD91636gHJ6S5tgXRZm8Yot5Ti48Ju5XhzuSTlUz2lTjb4C3CwA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9spKMwsoH+hJJDfKeFGIuwFCX5Gyg96hyZSX5TXPCbw=;
 b=tWktjuuGNKyMqMLiECLw9rjd2Onu2COTUVpBnUspkk9DfusaQoY2BzpvWGFy3jQB4c5qkCt3oN/LVoKc4gQkYFMQQNr0PI5P36M/cApxTjnWzSnyOynR6pzsBvPUYFdCH0H5E4WJSIVtOpWzukBZINrDx9j1Taz1IrghDsuHKfkJZAxRuuCFg1geIO8iZW1uDR1i1mP9/gbTocbryGrodurhcorUcGfEopcSanhJeLWwkDExQHr2X9d7TJdejnG/QUT7aLQ6Dbs4M14ookT0JDpkBcdlfDNIy0LxcivnjhsmmFTLcX1N5iJHUUhoOVLR39o7lvSfcz7GZ+3y3Nw8RQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9spKMwsoH+hJJDfKeFGIuwFCX5Gyg96hyZSX5TXPCbw=;
 b=wGt3+TkD1fWlBnTS3BJLR3ZmTq+poaecUuwynsI2ljOrqwzfrWLr/s3bfbc70cZw1humPmT6cMLPxnBe1NyXV9EsEJv5dAHpX7V0Ywsvaf+xtMlbciW20AhkxgfnHluT8rqJxW3goylDrE06wukpl3lE08ulkc7KQlNOuS0nPiawpLOs5N5SpHHAD8U7bcOPZG603Rtb3mXOSteT7RTw2lsujvbyeSqVHwZ1FQwpdSd957FXvVB9SXo/NdDwb7fNDi/1mIEoqDWjTfDJso22Ktr5rR7ZP6jQyE2BMwtjWvvlR8wIFCIYL9AjCmgbaYWrcqSdovK1IZOSkevyZYRL9A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by GV1PR04MB9215.eurprd04.prod.outlook.com (2603:10a6:150:2a::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9678.18; Thu, 5 Mar
 2026 10:20:15 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::4972:7eaa:b9f6:7b5e]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::4972:7eaa:b9f6:7b5e%7]) with mapi id 15.20.9678.017; Thu, 5 Mar 2026
 10:20:15 +0000
Date: Thu, 5 Mar 2026 18:22:15 +0800
From: Peng Fan <peng.fan@oss.nxp.com>
To: Alexander Stein <alexander.stein@ew.tq-group.com>
Cc: Sudeep Holla <sudeep.holla@kernel.org>,
	Cristian Marussi <cristian.marussi@arm.com>,
	Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	linux-arm-kernel@lists.infradead.org, arm-scmi@vger.kernel.org,
	imx@lists.linux.dev, linux-kernel@vger.kernel.org,
	Peng Fan <peng.fan@nxp.com>
Subject: Re: [PATCH 2/2] firmware: imx: sm-misc: Print boot/shutdown reasons
Message-ID: <aalZV981HAneFWiC@shlinux89>
References: <20260305-scmi-imx-reset-v1-0-18de78978ba9@nxp.com>
 <20260305-scmi-imx-reset-v1-2-18de78978ba9@nxp.com>
 <24409695.EfDdHjke4D@steina-w>
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <24409695.EfDdHjke4D@steina-w>
X-ClientProxiedBy: SI1PR02CA0010.apcprd02.prod.outlook.com
 (2603:1096:4:1f7::17) To PAXPR04MB8459.eurprd04.prod.outlook.com
 (2603:10a6:102:1da::15)
Precedence: bulk
X-Mailing-List: arm-scmi@vger.kernel.org
List-Id: <arm-scmi.vger.kernel.org>
List-Subscribe: <mailto:arm-scmi+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:arm-scmi+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8459:EE_|GV1PR04MB9215:EE_
X-MS-Office365-Filtering-Correlation-Id: 73d90e51-f7c6-43f7-7812-08de7aa0cb1a
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|19092799006|366016|7416014|376014|52116014|38350700014;
X-Microsoft-Antispam-Message-Info:
	SK5dnfj7+K+4ibcaNzx8UvVOgcIdfOeaNioRUXC3OYAa/Q7VTvcQt1g2IA1tTtPQnci2iBKFztfPqicVp89uw+sHFejMKQJWcMsPX2S/wpFNtWbfnzo0lzf7iGUdSj6S3DWlqPcNeN7ISaInfOqsxI/4naCF6UcvsH3t5PTS6Ehsm4B36R+RYfYRzl5DFKVIJLMQDR3XlKmytsk0KRhONg55DpKO9TK8kx0TMuW0AUGFi5BvHTAh3S44wLsdUMz9ccMKsW6IPbm6JiVdU584I4ktnSSTO2Xq9tLdbH9lx4SBafBFLkVrQYvM8iSrCN/awB1gbEtGKhW+tYf7KMJ07b1x5yUoMFMDL4BwrUzq6i7P2RQiTji69glk+LaCWvy7V7YkbAD1wlrpUIsYy6X1J/EfRuIzmajEn3kFpzcSFS/MRyXTo3qHkfrl3QskNZgcIgA9TQlwV4MwGgXVST9ifJ5ZlICfnSe6LB6JlCsC6h2f4VkqzvE3DOQntiqZTzZBx3FKjfNJXOChZUJacdFkwzl/PGDY60LKba0TKWsfVasEpOide4K5FPVThLHa00Aa05k+fzFAoUxd6Fee3RX6JaNUO75CqCVmLCW7ZXYTTN/74Uo3cZczbzB8DZh2GN9p1ZLrfxw5KLNSAxAnMee+Jv3RkMWk7hZabHNMPv9Yx/ZFEZVWXYZOSA2EFc+T6xciPscM9DQV3Tj3SchiPqvYsXLZ2LdSZdM3WGOsii5VIvI=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(19092799006)(366016)(7416014)(376014)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?iso-8859-1?Q?EbdkwSy87ERUKef5yY26F5R1qqQEDKKaSSOHKxoTnObUGhv/+HpgfzxYST?=
 =?iso-8859-1?Q?9YSNL1QL1ByDwCtcr+qt087G+J20/cBr2K7tuc9crutRr71VUC+XbFdmqc?=
 =?iso-8859-1?Q?e2enf1yw9xAO9fx20qx65gkGPvSk84ISv/f4YcrxXRaDPU1K16MA6DsX5o?=
 =?iso-8859-1?Q?mk237mCcnuT5XnuekNELx0cqs+AXOQuoTLwoUqGt1LY56dtgLSvkHDT9IZ?=
 =?iso-8859-1?Q?S6IM8OhvSJszL8QqG5s8lGD39ZZKVm+ltRS6GeoyMGIN5gMBfmVqU19ETU?=
 =?iso-8859-1?Q?baXcjY4ScLN0oHJuIXgw/Mzq0P4NRgKiUzEfCl8gsNRbaZZluFo8YqF+MH?=
 =?iso-8859-1?Q?16uDbfbGpFzFKMn6zV9YGcObpOI5ozD9h81TOSE7A3z/c2p897LPvSrSsh?=
 =?iso-8859-1?Q?UTO2A+37TLAGPt7tzKOcC5Y5Nx0ff9/kvJwOIWYj3CpjVmiNgrAG9iDzS8?=
 =?iso-8859-1?Q?RsUY4Ma4DcxCJqiMHgADNw0D3opknnR7loRfWWeKEKjCi5/luMQVefazQi?=
 =?iso-8859-1?Q?WOPi1LWoAkydAIG0lCAs+45ntzY614IFGH8Crrq5xAqSON5gmFgQMIG57Y?=
 =?iso-8859-1?Q?CFYYVhK5WOFv+wH7MvXuVbVuyUdceaPv3Rc19Ta+jtwm3l3NzlZ6EodOKW?=
 =?iso-8859-1?Q?0OWiuxoZtyvDp/wuHSk82tdsJiBJhAp5aKmACOGDeh2zpgX9n/w79I6J7U?=
 =?iso-8859-1?Q?RaPSSghVPR4EfMUcsTXAxLVqMeFZL1faai98F6BCuOpJVRrHmltcvzJtEb?=
 =?iso-8859-1?Q?d9SL3RCqdTEP0AJKbTq0q/uZDWh1im/BQOIZa+CSSUF3unEgV5fbddRZv3?=
 =?iso-8859-1?Q?/P1VxKV4ZLLy318d9ins6SGdoIqVziYv8664iAucLEnwIyyBYfd/gJD+eA?=
 =?iso-8859-1?Q?fueoE9ED0DchzgfUYgzDi/pAu/IOBY9EZg6LR3T09b75QdqJC/5C4v9K9f?=
 =?iso-8859-1?Q?FYdd42zdowiQtv5xUZMkE59qqgIFzIDrgfKAsz8a1mntMvwMGl5nv3pUOm?=
 =?iso-8859-1?Q?peWu0O5svgEP3XpJgQnlQ9nAOp8CXPfID2wVBiYr47q8lp9LG73GbwOv2C?=
 =?iso-8859-1?Q?QkzJ8Wb1DW19lI4YZDdZgHt6gtlXWxndoHOq7OqI77gDu6vAp1sDiZyFoF?=
 =?iso-8859-1?Q?9U/QqUrfkNDe319OUZooQbf51jJ3rgdmyAhk6B6R4MB+lbCrm6mYFjhbfp?=
 =?iso-8859-1?Q?vS2hkQuLaJOoT6xu957L9/sPa3RDAFgrKk6l5JoiXvwjhBiZEhArRHl8pc?=
 =?iso-8859-1?Q?8hFaHSesqYL+2hjZu5BTlvBhxVqA8igs7w77gCxTfBFmCMiyZuK3UOkJFV?=
 =?iso-8859-1?Q?aNBUUYPjRlawEqjkadIzuineCar1ukFDGzT9YQqDSZXD+cwm4o5nqLqbBh?=
 =?iso-8859-1?Q?15dGxkKm+kIwUXD6AXZ8gUZRh917g/ihSJAN6sfgCi3p7gnuK7llFfRvHi?=
 =?iso-8859-1?Q?65+0Tc85BqdMy/1OBx2xQfFv+Ki8HDh4IWAOksbY1tT/CHrhmD6tzNnGil?=
 =?iso-8859-1?Q?UOINXSM/0ycjs85Dq+cdgDmilBv8GFmTbmeZ/PPNOsmhUoUtFVbI8qugQY?=
 =?iso-8859-1?Q?z0r8UE3m5thz/DbX+PCBtkeJL3u2wdvGIJhitg3BQmqqdFTDCxTIQ2zF9c?=
 =?iso-8859-1?Q?t2kYxTEkBgj6zCjEDUUvFNBRH+A5eiCzR09tB6/3Oy+4U7yZNinGIsgPvT?=
 =?iso-8859-1?Q?Q+RqlPIKZnj9Uggd2SEe8YdrM9QqtXjwTQZb4KIQ3WE18SmRkNzVk0/uhV?=
 =?iso-8859-1?Q?8s035mHi4kV2/RnCFOotdC10zC2hr6aK7ElEBYS4cPR7HAnLAHed7sLxcX?=
 =?iso-8859-1?Q?5XmJr47e5Q=3D=3D?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 73d90e51-f7c6-43f7-7812-08de7aa0cb1a
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Mar 2026 10:20:15.6906
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MXIZJj7jQu2NOA+bwi60MrDEadxhtHxg2fxEoV4KEauMKTK8AXsMozSrtn+ZKbw+be1S356ndxPkOeOtw2PkuA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR04MB9215

Hi Alexander,

Thanks for giving a look.

On Thu, Mar 05, 2026 at 08:44:26AM +0100, Alexander Stein wrote:
>Hi,
>
>Am Donnerstag, 5. März 2026, 02:56:45 CET schrieb Peng Fan (OSS):
>> From: Peng Fan <peng.fan@nxp.com>
>> 
>> Add reset reason string table for i.MX95 and introduce a helper
>> (scmi_imx_misc_get_reason) to query and print both system and LM
>> (Logical Machine) reset reasons via the SCMI MISC protocol.
>> 
>> Signed-off-by: Peng Fan <peng.fan@nxp.com>
>> ---
[...]
>> +		if (boot.valid)
>> +			dev_info(&sdev->dev, "%s Boot reason: %s, origin: %d, errid: %d\n",
>> +				 system ? "SYS" : "LM", rst[boot.reason],
>> +				 boot.orig_valid ? boot.origin : -1,
>> +				 boot.err_valid ? boot.errid : -1);
>> +		if (shutdown.valid)
>> +			dev_info(&sdev->dev, "%s shutdown reason: %s, origin: %d, errid: %d\n",
>> +				 system ? "SYS" : "LM", rst[shutdown.reason],
>> +				 shutdown.orig_valid ? shutdown.origin : -1,
>> +				 shutdown.err_valid ? shutdown.errid : -1);
>
>Is there a way to query this from userspace programs instead of printing into kernel log?

I not add sysfs or debugfs to get the information in this patchset, since our
customer only want the information could be shown in kernel boot log.

But I could add also sysfs interface to allow userspace get the information if
you need this feature.

Regards,
Peng

>
>Best regards,
>Alexander
>
>> +	} else {
>> +		dev_err(&sdev->dev, "Failed to get lm reset reason: %d\n", ret);
>> +	}
>> +
>> +	return 0;
>> +}
>> +
>>  static int scmi_imx_misc_ctrl_probe(struct scmi_device *sdev)
>>  {
>>  	const struct scmi_handle *handle = sdev->handle;
>> @@ -133,6 +204,8 @@ static int scmi_imx_misc_ctrl_probe(struct scmi_device *sdev)
>>  	scmi_imx_dentry = debugfs_create_dir("scmi_imx", NULL);
>>  	debugfs_create_file("syslog", 0444, scmi_imx_dentry, &sdev->dev, &syslog_fops);
>>  
>> +	scmi_imx_misc_get_reason(sdev);
>> +
>>  	return devm_add_action_or_reset(&sdev->dev, scmi_imx_misc_put, scmi_imx_dentry);
>>  }
>>  
>> 
>> 
>
>
>-- 
>TQ-Systems GmbH | Mühlstraße 2, Gut Delling | 82229 Seefeld, Germany
>Amtsgericht München, HRB 105018
>Geschäftsführer: Detlef Schneider, Rüdiger Stahl, Stefan Schneider
>http://www.tq-group.com/
>
>

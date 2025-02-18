Received: from EUR03-DBA-obe.outbound.protection.outlook.com (mail-dbaeur03on2078.outbound.protection.outlook.com [40.107.104.78])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25F3C26B2A9
	for <arm-scmi@vger.kernel.org>; Tue, 18 Feb 2025 15:13:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.104.78
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739891636; cv=fail; b=QVFM54h4aj3gtmiQ39o2WVAPbrbg1A5y5jOj2jlLRsfLUQeMfYme7/6qtlF2aJrfvo7Y3LRZfp8jBVZgKLevrbsE0DHSdiPBCdONzR4t5ShMxM2xqK1wlf+pTxhLnA1Rdmv4vKw9diQ/2x/qfxWWtKQuhaGtHmXGPwdlHlGFQII=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739891636; c=relaxed/simple;
	bh=iHhMCS1jDcL0ZiFcZV8DWimcRpOIczN8UfHJD5sy0dY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=jjEgiBYdUiCZKP0aOfNvSAjaBihhqpHtoqjNuCKFq7fJ4x54BBbQR6AVG4/vccjyy+2lk7mcZf+3GS7RQSoN5uUrv3epVK5Z0X3/fh6ZDFds8Glqsv2/yjQST+VzlgfSeB3i0qIc2FFB+iXbcyGk9SLORVf7NY8ZwrjLCidMuxs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=fFXc11UR; arc=fail smtp.client-ip=40.107.104.78
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="fFXc11UR"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nJolWY3vfPlPuPWp2ZW8ydLBKpLxqIfbI/ZCtf+2k64SUCNCXCk5mCxanL7dWnPF4N92aaOp5WIK0gxjpr0GpCqgmNMDjyPIXP6Bmziw/Y8N/tlLZNfbq885U4sani5XSgpiD9TbzIglKBx7pQESv2pTCpx3Fb2WU2sXKTV/qJV+z5litr6AaTgEi2hnmK4i1WGXbn8LI8mU31Vyi2R/g40T/W7hM8WrejlvX85HRcImN2JD8vPZ8lIzD2RpM7LrEf8/OB03jkbSrqPHBGCUcCKYzPU6saCGwMaTRibOpcyo5L/VzGETRnqkQ9QeiTFbMbsAnE90MqQ111tQP1v4xw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=g7UVHViLnMm30l5fNWDH07vXLwf9v7bdqigWH716NMs=;
 b=SI0XEAFGsOiaekImn6JAblsieuoby3FfwkCOEnZrA1CF47puazJ443IIHcKKIMj6HEPPYozLwNWVcGcq0eIH/QVBjzVrYYWbMY4qiLG9dlc/oKgT5ro73aLAPQOzyY5Ef1ila/aZ3wRBzTbXTcDnRHg7hJB14GJXKNlORaIoA0gE1NXol3xb/IaYvrFXLMDBJWy6TROwddrqUgmrtjwOq0PUjtX05eeaO6c2whl1pS0eK2VUuFD2hziAZR+l7YS2BnUVMqNmt3Iumg2Tp+dMy0HtwWA4jZa6YbSdpyAGQw3WbmLslktE3v+xO0UczKqgU9SzBuDOXR7RN+ysK+/TUw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=g7UVHViLnMm30l5fNWDH07vXLwf9v7bdqigWH716NMs=;
 b=fFXc11URvj6YKNeguo7NAT1X+XaNtZIOXjsLK5kQvWT7UiIlWRmIek+kYU3+zlufPc5knM+7LIurDptvETfbVq2lEGgLqe7TH8FaUIvcbbwPasVlhVS/Ekj3p3si3Q922m+FISbfGWnZT0hnC6pHOdax3Xlkse1sI++vdec9S7BU4njEMxOrvG0PzhOpg3caYEGKdheKpVtehac9Wkd/0X6IT4Fw/4srA4ZbJD8AcH6VCLfKjgefb9hDswn2c6qfL/2SD055V2FB/Xhl0yIcT2D34JCW53RpM9uRYSYYX8X1iDfsdQjZfNNr87ZhNyRsmOxE5yZNQSEd49Q1nNBISg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from DB9PR04MB8461.eurprd04.prod.outlook.com (2603:10a6:10:2cf::20)
 by DB9PR04MB8331.eurprd04.prod.outlook.com (2603:10a6:10:244::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8445.19; Tue, 18 Feb
 2025 15:13:49 +0000
Received: from DB9PR04MB8461.eurprd04.prod.outlook.com
 ([fe80::b1b9:faa9:901b:c197]) by DB9PR04MB8461.eurprd04.prod.outlook.com
 ([fe80::b1b9:faa9:901b:c197%4]) with mapi id 15.20.8445.017; Tue, 18 Feb 2025
 15:13:48 +0000
Date: Wed, 19 Feb 2025 00:20:45 +0800
From: Peng Fan <peng.fan@oss.nxp.com>
To: Vincent Guittot <vincent.guittot@linaro.org>
Cc: Sudeep Holla <sudeep.holla@arm.com>, Peng Fan <peng.fan@nxp.com>,
	"cristian.marussi@arm.com" <cristian.marussi@arm.com>,
	"souvik.chakravarty@arm.com" <souvik.chakravarty@arm.com>,
	Ulf Hansson <ulf.hansson@linaro.org>,
	Dan Carpenter <dan.carpenter@linaro.org>,
	"arm-scmi@vger.kernel.org" <arm-scmi@vger.kernel.org>,
	Chuck Cannon <chuck.cannon@nxp.com>
Subject: Re: POWER_DOMAIN_ATTRIBUTES in SCMI
Message-ID: <20250218162045.GA15753@nxa18884-linux>
References: <PAXPR04MB8459E8D1A82DE43C08B6C26788FE2@PAXPR04MB8459.eurprd04.prod.outlook.com>
 <Z7Rjyy7_Jg66vqCf@bogus>
 <20250218130823.GA17099@nxa18884-linux>
 <CAKfTPtBd14wM2st62m3tnkQOZgBTUmxpjZXghMVff-Yg7wCVDg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAKfTPtBd14wM2st62m3tnkQOZgBTUmxpjZXghMVff-Yg7wCVDg@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-ClientProxiedBy: SI2PR02CA0024.apcprd02.prod.outlook.com
 (2603:1096:4:195::18) To DB9PR04MB8461.eurprd04.prod.outlook.com
 (2603:10a6:10:2cf::20)
Precedence: bulk
X-Mailing-List: arm-scmi@vger.kernel.org
List-Id: <arm-scmi.vger.kernel.org>
List-Subscribe: <mailto:arm-scmi+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:arm-scmi+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB9PR04MB8461:EE_|DB9PR04MB8331:EE_
X-MS-Office365-Filtering-Correlation-Id: 436aa628-4a59-4576-753c-08dd502ed817
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|52116014|366016|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?a2lFVUFGQWFVQXBNbEpTcmxGMDlQcWhKQ0h5THlFT3hlc2k4VnAyY01sbmkz?=
 =?utf-8?B?dzlHYkd5ekcwVlNOSENwWDFKWjErVVAxM1RnN2Y2a0U4TE5nbXBVT1VPd1dM?=
 =?utf-8?B?RXNQVzRYQ0lpZjNaK1VicmkzQ2ZQNTVya1FIb3M1clkyYitvNS94RlpoTms3?=
 =?utf-8?B?NmhKM1RiaFkrQUtPNmhGaE1HTjJHVUdRYzBPUVY1ajhwaUJXQVVEdzNXR2Uz?=
 =?utf-8?B?TmRtbmVPRDEvdGdycnFlMVRNYnMxM0NWaDlVYlM1dXNUeTkxRFhkWCt2enBq?=
 =?utf-8?B?T2tVaXFqQlR6ZWtUM3BxdjZUOGtyb29GdkJWRGkrRCtoNVdpcUYwcDRTdXdT?=
 =?utf-8?B?TVZuWGg1TS9qa1RjMkszVDI5L3ZpdUMvZForM2xUSk1TUG5Kd3VUMWZjUFZD?=
 =?utf-8?B?ZjZsUGVUdm9rTkR6OE5md2UyMloxYmV5R1JvQ2dBd3k3cTZTS3NjQmtGUzR1?=
 =?utf-8?B?WmJ3dVUyck5tUUVnbHNzd2FkK3BKVXk3alBGTG5ncEVnRW5EeW9BTHQxa0VO?=
 =?utf-8?B?T2VSek9xYlRrMVJrWUNBemZzUll0R0NhS0NRZzRtcWdtaDlqaHd1VjhBZGJB?=
 =?utf-8?B?SHg5cE5nLzMzeGxsR3paQWlKbThIWEFoaUx0U09WejF3ZXpXc1pxSXc2QS9a?=
 =?utf-8?B?MzhUQzBuTnZncm1CMk9ya28zREkzYzFNWDVhNjhueFBIcGlsZ1dUOFZ2dDdM?=
 =?utf-8?B?dzNaWVA0VUFEUDdhZzhtek9vdWhFT1MrWnpsck9SRmFURXlHVFk0eGJKVkxG?=
 =?utf-8?B?UFd2UFpSbisxNXgvY2ZMN0JUSU10aUFBMnkxUS9JTmZMVWFWNUx0Tm51M242?=
 =?utf-8?B?S0ZTdWJHSFIzbDFYNStaNHpGd0xWd2MrelQyTkpzanY1UHpnei9oeWJNaFcy?=
 =?utf-8?B?N3gyd3BMbmY3bWpsK1c0NVFLb2kvOU52eStPakk5bjQ3QmNSTCtaNlljMTlS?=
 =?utf-8?B?cFRWRTl3bHlqZXgwZHh6WHpXYnd0S1ZLZlFnLy9oSE14dkMveWp1OHg1T1Nj?=
 =?utf-8?B?eW84VjBPSlUvZlplbmVGa0l5UWk4NTFTbXM5aG05QnF2N2x3b1ppRDNZdnJs?=
 =?utf-8?B?TFMxaDhqOTFkb2xPaVJkMzhNckwrYzZQWFlEU0JRZVVMKzVqWmtyZVJJa0tI?=
 =?utf-8?B?NzdYN05IQkdEY2V4V1BXSXArZEN1SDI5eWpoVHZVMVpIM25SdVJ3WFlrOHVu?=
 =?utf-8?B?SUdBL0hHdlNPQk1IcHFCM2tOMi9PK1lpVUI5UjBaNmR4aDArd2M2MWJsTEh1?=
 =?utf-8?B?ZHphM01pa1hoZjlHNmx1QU05TVBYT2lQaXV3TzF2VWtMM09VNVdwZ0JEMHhF?=
 =?utf-8?B?T1VuNXQ0a050cUtpT29jeTBMaVpFOWNNZDZEYXpNV3orQXluTTIreldUUHU5?=
 =?utf-8?B?NVdDQzJqMVM4UHVPTVgrc2VGOEMrZGU4V25lT1JuNWsrQ1JoRjg2aFpJaTMx?=
 =?utf-8?B?STN0YzdYZVJlV2hlVlloSmlzOG1aMi9od2xTZEppcmlBN3FEK2hHRTNFVElx?=
 =?utf-8?B?MW5uSmNZaXdtajRYZnF5TXRueEYxVjJibENUWFhLTXN4SXVLWWltbkxnSTlt?=
 =?utf-8?B?L1luUkxvNXdzYjRsU3VHNUd4QlBIK2UxWE83ZE1aSG1FVkpRMkpacTFBOGg2?=
 =?utf-8?B?aCtId2o5eFcwaHlZVFhyNWd1S0dYcFRyVnAvSll6RU5TempjZFU5STNaTDB5?=
 =?utf-8?B?R2pJUlVSWDUvcWM3MGYvQ3M4QVQwR3hDaG8zSkR2REZHOVVhT2xQdnFuUlFm?=
 =?utf-8?B?MC9QMVVNemRCaFFqaWhUVGp5RXo3RGV2RUJzMCtEUUNIM0NlZlppSE5wdlVw?=
 =?utf-8?B?RUdzVTB6QU5DdnVubUgrSmo2Z3dSRnhEOFAyelpBQThWUTBHWmQ0WFE3eFB3?=
 =?utf-8?B?WjFDYThTb1lvcmJsNVhxOTNJSGJSWUs0VjFmT3UxaWpnd29QeTEwV3I2ZDdh?=
 =?utf-8?Q?mTBD6j/ejkdFpWGBvWgHTY4kTM74oQtk?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR04MB8461.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(366016)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?STZXeFdDYzBqdXUzeU9MelhPSmE4dW5pYXlDNnllUGV5UWlWZHJPZVNSb24v?=
 =?utf-8?B?K3RZUWNtV3lMQmJwUjdxeWZmUjhyNFdwa0pWQUhWMG5uMGlrMGJnaU1YWE5w?=
 =?utf-8?B?WE5HYzZMZDY4bUJUNW9pMWtqRVczZVdteWI5R05LeXlDQlhTVUpUTXh6RGRp?=
 =?utf-8?B?OENHK3FqUmVDZmpxZCsybElmUjdZSkNYQUFKbzVxRTRRWVhLOGx0MjhhMDBZ?=
 =?utf-8?B?ZXRsN1FSVGVHOGN3VkpnUEtmdVdFb0NabnNNVzU0T3kza2VmVXVMbFNYQzZQ?=
 =?utf-8?B?VU9Jazd3dDZIUnhLR0FxQjhZdXVNQmhId2YwMWw0Nm5OWHJJWjhWNGJXTHJ2?=
 =?utf-8?B?UnQ1Q2pJVEZabTNkcWFJcXg4c1R6VkpZaTFZMGh5ZnNRUkdPVGJ2azdXb2Zz?=
 =?utf-8?B?NVduY2RJQjVLWk1rU1NlQ1hvaFRFU3R1cjRIaEtHTEdmaHRBYXVGaERHdGpU?=
 =?utf-8?B?NEY3MDdqUzRySlUwNHVKZHdKS3AzdndscFUyUk1NOElqcStJSGxMcDRjK0pJ?=
 =?utf-8?B?dzMrSjA2VG9yU1dhdk9DcS90OWRTRkF1d2N2NjJ1MWtMZWg5WFdOT2dqYmdI?=
 =?utf-8?B?Um5acmxtWGpLelBxZytna21WdXA0WDMyZjdmY2t3ZUVzNUxDNCs0TDJEalo5?=
 =?utf-8?B?QTVhQWZLMUgrUGU2V3Jpc3YvMTRGSDlqL3hiNy9CVUpVN2VrLzlLaHNyM0o5?=
 =?utf-8?B?dmU1U2pHdFVndzlwc3VuWVJWUm1yaVgxUytneVR6aU9YOUgwK2N3QmRrV2VM?=
 =?utf-8?B?YWlJZGJ1NGR1SWJVQlkxS0lxR1dScTJhUXlVTm11OEtoVXgxcmtNMDRYckdt?=
 =?utf-8?B?c2xLVHhXMXVxUjZHUjBEcyttNEF4OHpTMEhKRXJrUytub25UVTBZU0RGZGYw?=
 =?utf-8?B?aGFJbHZCSU1JZ3BNQis2ckVvUTNRY1dqSTlib3o4NWhFUEpzTDFKaDBDcVlv?=
 =?utf-8?B?WW1WbnBVMmFSSEJYUjRDUHVtWEFCS0t4OXdhTGZLZ0k3U1VpUUVkR2w2clFz?=
 =?utf-8?B?djZmQ3lTTUxvaWN3UEFLeVBHZERsUTFBQ2l6QTNrU1REZm5yeHJ4RGJkQytO?=
 =?utf-8?B?UnJ0NkQ2aHo2YVBLbHByckdodnJVYmJFNjhSNUNuUzh0Q0tDNStmVnJRQnlu?=
 =?utf-8?B?d1ZzVmlMWURVdVdiTVNqUDVGVW4rTVd6d09XbGRtMHRMWDdFbWxvKzhCL3J1?=
 =?utf-8?B?R3RBZTlOZ21xM2d0NEVDU1NMRTZjMExsOGxYelB0clJDNkJsNTRNN3NkM0hy?=
 =?utf-8?B?WWxYZWhDS25yeCtJMml3eTZpVS9HdXRTekcyV2NaK1ptanpSalRtY0wwVzZZ?=
 =?utf-8?B?bU4xdlhqWlFvdVdKNVMzWE8ydkZZRG9iU2FaZWRWbVFUTkdQVnZ5VDZhTllm?=
 =?utf-8?B?cC9tZy9mMWRHemtHVDFLdFhOdnFVeTltckgxNURydkl4cnRDdHhRR1A2Wk5P?=
 =?utf-8?B?OFllVHhJajNrdlNhbjkrd2lqWGlYOHE2dU5rclNlNUZ3T0NyL0FCdVNWMGZx?=
 =?utf-8?B?enY5ZFRHMTcwT21NM1lQZXh2dFNJZEJ0Ti9PNDdZRU9HUCthL3F5ekNTY09k?=
 =?utf-8?B?L0hMZnJ3ZjNyY3djVUROUFpXUUNBVG5VYWFIdkJOS3dDTVdBbE4vd3kvSm5r?=
 =?utf-8?B?a3Q5bHpoWXNrTHhaSFZvS21kcGdTU2IzQVBhM3AyMG1WdmVpYW94REl1N3RK?=
 =?utf-8?B?RzgzSVVYMzhNSDJZV0l0RUZqc2tOcEcrT01WNVE3ZmNpYjVkT09aYWlvdDVS?=
 =?utf-8?B?bCtMdWpPeC8zb2JVTjczbmR5cEYzSWZzSkxIRUZjUTBvWnlTdzZlaVJZNXNt?=
 =?utf-8?B?U0tLUjhuUitoZEdPNmJKbFJoTEV2VXBlWXg0WUJWWExwYUpLQ1FTZDZkbGhl?=
 =?utf-8?B?aHFrMmt6WjdQY1FwcjNVVm8vaXcxV1c3Z3paUlBPMG5PSXRlMjVydG52Y3J0?=
 =?utf-8?B?UkU2NW40L1hLVjlGNlhTNk41eVE5RWhMRm1QZm02QmRQaEt0dzlBcGJzMFhP?=
 =?utf-8?B?S2g5Uks1Zms4N0o0RzBFZnpDdTBYaVJJc2YrNlg3dzdWOHpsMENQM0ROdENZ?=
 =?utf-8?B?am1KRmFoRUFVVDc1ejg4eC9WWjBWdDdkZWNJYnJWb0lzRnRsVEl5Q0RNbzh3?=
 =?utf-8?Q?+laPZwWYxglmup10fUeAr7UK2?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 436aa628-4a59-4576-753c-08dd502ed817
X-MS-Exchange-CrossTenant-AuthSource: DB9PR04MB8461.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Feb 2025 15:13:48.2993
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GDHG0+0u/sYHEI6nuBZcJpq0Qwohby1Ut/DbnXxYR8wM1gI1V411p/L8j0j/3mNp/27Ho8Do8VLaMJEgWcYLbQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB8331

On Tue, Feb 18, 2025 at 02:57:10PM +0100, Vincent Guittot wrote:
>On Tue, 18 Feb 2025 at 13:03, Peng Fan <peng.fan@oss.nxp.com> wrote:
>>
>> On Tue, Feb 18, 2025 at 10:41:15AM +0000, Sudeep Holla wrote:
>> >On Fri, Feb 14, 2025 at 09:20:27AM +0000, Peng Fan wrote:
>> >> All,
>> >>
>> >> Previously I posted a patch to linux to set all power domains
>> >> with "GENPD_FLAG_ACTIVE_WAKEUP" set in
>> >> drivers/pmdomain/arm/scmi_pm_domain.c
>> >
>> >Yes, I remember ACK-ing that and now I am thinking why 😄.
>> >The description of the flag GENPD_FLAG_ACTIVE_WAKEUP says:
>> >"Instructs genpd to keep the PM domain powered on, in case any of its
>> >attached devices is used in the wakeup path to serve system wakeups."
>> >
>> >Does that mean all the SCMI power domains remain powered on with this
>> >flag ? If so, that sounds wrong to me. I hope it is not the case and it
>> >is effective only if the device attached is wakeup source.
>>
>> Only when the device is setup wakeup source, the genpd framework
>> will take this flag as keeping power domain on.
>>
>> Without this flag, even if the device setup as wakeup source, the
>> device's power domain will still be powered off.
>>
>> >
>> >> But in the end we find that some power domains
>> >> could be in off state while it still could wakeup
>> >> the system. And we have a downstream patch
>> >> +               if (!strcmp(scmi_pd->name, "hsio_top"))
>> >> +                       scmi_pd->genpd.flags = 0;
>> >>
>> >
>> >There you go, so you simply rushed some solution upstream to carry less
>> >patches downstream but this time you got bitten again. Sorry, but I am
>> >seeing a pattern from you here and I don't really like that.
>>
>> I not wanna to argue here.
>> I DO care reputation. If I do something wrong, I will improve.
>>
>> >
>> >> So I am wondering to extend the attributes of SCMI spec,
>> >> Saying In SCMI spec(DEN0056E)
>> >> 4.3.2.5 POWER_DOMAIN_ATTRIBUTES
>> >> Page 44 of 210:
>> >>
>> >> Bit[26]: If set to 1, the power domain could
>> >> wakeup the system with power state
>> >> set as off.
>> >>
>> >
>> >This is not what the above flag is all about. It just instructs genpd
>> >to keep the power domain ON as the device attached to it could be a wakeup
>> >source. They are not one and the same. If the device is marked wakeup in
>> >the DT and it is both wakeup capable and is enabled, it shouldn't request
>> >the power domain to be powered off when suspending. Why is that not
>> >sufficient here ? What am I missing ? I am interested in knowing it as
>> >it is important to fix the issue you are trying to address here.
>>
>> The flag must be set if the power domain needs to keep power on to have
>> the wakeup capability.
>>
>> But in some case, a power domain no need to keep power on and it still
>> have wakeup capability from hardware perspective.
>>
>> For example usb phy in i.MX95, its power domain is off, but it could still
>> wakeup the SoC. But with the GENPD_FLAG_ACTIVE_WAKEUP set, the power domain
>> will not be powered off, so more power consumption in suspended state.
>
>This probably means that the wakeup mechanism is not in the same power
>domain but in another one that is kept on while the device is
>suspended and the main power domain is off. Do you have more details
>about this wakeup source that works with powerdomain being off ?

When power domain is off, some internal registers are retained and
not lost. And there is external always on power rail for always
on hardware logic.

Regards,
Peng

>I vaguely remember some old discussions about inband/outband wakeup
>source settings for devices which enable drivers to specify if the
>wakeup source is in or out of the power domain and if we should keep
>it on or not. But I can't remember the details; Ulf should have more
>details
>
>>
>> So I am requesting extending spec to give agents the information whether
>> the power domain could wakeup HW system in powered off state.
>
>I tend to agree with Sudeep that it doesn't make sense to say that a
>power domain can be off but the powered devices can still wakeup the
>system. It usually means that the wakeup is not powered by the main
>power domain
>
>>
>> >
>> >> This is just an idea in my mind, I not
>> >> write code to verify, just wanna to see
>> >> any comments from your side.
>> >>
>> >
>> >I wonder if we need to revert GENPD_FLAG_ACTIVE_WAKEUP flag enabling on
>> >all SCMI power domains if that is not solving the problem you thought it
>> >would.
>>
>> Revert the flag will cause a power domain not able to wakeup SoC if the
>> power domain needs power state on to have wakeup capability.
>>
>> I am not sure other vendor's SoC design. To i.MX95, without this flag set,
>> the NETC will lose wakeup on LAN capability.
>>
>> Regards,
>> Peng.
>>
>> >
>> >--
>> >Regards,
>> >Sudeep
>> >
>>

Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazon11011025.outbound.protection.outlook.com [52.101.65.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E81221D5BA
	for <arm-scmi@vger.kernel.org>; Thu,  9 Jan 2025 15:21:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.65.25
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736436070; cv=fail; b=a7SHi9U/Q2wNOAE+H87+MtzT7yDuIpL9DgpEDLEBbQx6DbOzisseB81qIapyjmY3AjWTXSF+V1D1M8EPVuoXz9Vup51sbmjJAxbvONU0y3MQT5dpZQo2DpAzieksNrx9AIt9ZVsrIYEtdf+e0cLPaZmimon2yoIivhAOpdfnxqw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736436070; c=relaxed/simple;
	bh=hF4nwDC4AsX5i42oVzDKa9A3ihrMsqsHitvNt5u3Yso=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=dP+8Qmo8mm4Y6PiST2vJFn0B4L598jwzm6ml+fDUV93CB5riozzWLyoPjmpt7X0bGvmAqD7CzICKjhE1aF6HoC1w50hcuiY0JSU/mOvACZkooQ24/olgvYFvydrVQdLInDxFMLpAkzC9Jp6tMxjfj3zTzLejUCsmbUhEDnMGOa4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=T9rg0OUq; arc=fail smtp.client-ip=52.101.65.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="T9rg0OUq"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jOfjivCLGakVH+WRfTk9rFneKodfmhtr2R3OPp8KCnSlRWHvbsIQFvzFPMFe2nxolXRNroMsW+9WRfPYpz++Te5p6LE+WciGwlKveuqgktv5YU2eB61DQSEp1FCoojJ+JLp/voTnaGDSeyYcEPdm366VUQgKf4XZF5D9KvyChlchXgXqk2xwTRqzL1DUjuJXfCWZScuohqMOpbs31G+jGP0T+OEu4VsryYAVFEMcnKr5U61hhfBPQgcQhoDgmGB8wtksAhxicj0FOSnwHSSZF+NHDJ5Er6jLOutb6iR7F5iM7vKMKl0nZMELlmcUVXY7E/o8pZIPzTnPDCD0qMw70Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2OFb3a35eAi98w0Tf/ZvQiKr+8j4XlU7VNjgRJuS6Tg=;
 b=xKqGYQ/w4m7ftqUmVRh1pCQEG4Y3WROjc3IybrgzWusVK2FaAw1Vj+vn6SMvBlGQ5EAIp580zgRVm9cHaXWeNZC2pqkcviFzViIePcyraAkwIVeuZI8L/mRZG/rYDe2Mc7esWqoTHg5vMMCZooqGeDYh0VaAgLo+zkxT0yoXaqQVvDn5rPY0sGoU4BbsyahpQus6wVe75dMazDitLcvQRyiyFHtGMc64jU25UZTHLiMxcuzBaJN/JNdSkIUIgDuifezTz71xqY8eiKZTND7ttmdBtECz+uTIKyYvIX8WUmEozyBjGuauR5XDcrbvzK4TCUzWs/0fYKAuQ/hSfzuTsg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2OFb3a35eAi98w0Tf/ZvQiKr+8j4XlU7VNjgRJuS6Tg=;
 b=T9rg0OUqpPhbRhD/nX84Zd1afiCwABPtVUZIxI3gav1TqBss8tKf4lZICW4eEU2SGYlQdU39Wo4N+PfmoHgQg2EH3fp9V4xiRpWl5NWI603YWTmQ4tIdzb46tR8td1YxZJAdZ7uIEoDh/My+7HmfLp/7SZ5xx6lI21dQGL5RJGo=
Received: from GV2PR08MB7955.eurprd08.prod.outlook.com (2603:10a6:150:7f::21)
 by AS2PR08MB9870.eurprd08.prod.outlook.com (2603:10a6:20b:595::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8335.11; Thu, 9 Jan
 2025 15:21:02 +0000
Received: from GV2PR08MB7955.eurprd08.prod.outlook.com
 ([fe80::360d:c6b4:e158:bc33]) by GV2PR08MB7955.eurprd08.prod.outlook.com
 ([fe80::360d:c6b4:e158:bc33%5]) with mapi id 15.20.8335.010; Thu, 9 Jan 2025
 15:21:02 +0000
From: Khaled Ali Ahmed <Khaled.AliAhmed@arm.com>
To: Dan Carpenter <dan.carpenter@linaro.org>
CC: "arm-scmi@vger.kernel.org" <arm-scmi@vger.kernel.org>, Girish Pathak
	<Girish.Pathak@arm.com>, Linus Walleij <linus.walleij@linaro.org>
Subject: Re: Question about pin control configs
Thread-Topic: Question about pin control configs
Thread-Index: AQHbS9Yj3DZYVKWYUUmpb6BiBhU8erLipEq2gABMVgCAK8mqmg==
Date: Thu, 9 Jan 2025 15:21:02 +0000
Message-ID:
 <GV2PR08MB7955A67686463662094632BFEB132@GV2PR08MB7955.eurprd08.prod.outlook.com>
References: <c9dfcf30-6557-4c52-b3bf-629b16be326c@stanley.mountain>
 <GV2PR08MB7955B51D624D6B65DF27E2B5EB3F2@GV2PR08MB7955.eurprd08.prod.outlook.com>
 <f69d0439-01cb-4e43-8853-f1400be38e89@stanley.mountain>
In-Reply-To: <f69d0439-01cb-4e43-8853-f1400be38e89@stanley.mountain>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: GV2PR08MB7955:EE_|AS2PR08MB9870:EE_
x-ms-office365-filtering-correlation-id: c08d3fd6-9adc-443c-3527-08dd30c13a59
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|376014|1800799024|38070700018;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?VfmrKM6QvYy1kA4SA7SiaIjUgCtJRgJyebbqjOUlsUD12CL56ukfia9oXP?=
 =?iso-8859-1?Q?DOfJv8j0QYMho3yTgAGTaynQtnDKXWgx0h6YZZ7zXUZUxtizMWrfQz5x/Z?=
 =?iso-8859-1?Q?1CEOkap3cNj42ocSGtXnnCGmSAFkTVwLgk5r5jb9V+JixyjndNOH95++xn?=
 =?iso-8859-1?Q?LAt3UV7EbAmhwBUTwJCpHtWrLGbrDTtIL/QZZEr0RYFqXSwD+REtMe5Krc?=
 =?iso-8859-1?Q?KmstHdO/tPdN40pCtHB55QgcVSLibfejE2oW7whwx4oKb7zMkvyhTilhDw?=
 =?iso-8859-1?Q?Af0yqDhQl6sseGk0jpzRHgWXVuIvyGf0GVZ2yGm/p2ALd9w4a8Qn3f0MpZ?=
 =?iso-8859-1?Q?//xkHWKySdbWpgqiOTWdS2HZ0Jm9m9A5hriXeWNyTTcBUhsK3Krh4n99Jv?=
 =?iso-8859-1?Q?+OMl7NZToRJlBwt+9mdCMnuLDfkwQroBeCrH8r2LF1b4xjx5c+XgDUqEey?=
 =?iso-8859-1?Q?79k1aOCr7t4v8VDLBfjileWwsrxdbwwF0SWDSJ7Dc0ZDcl8lCZyLlpAN4m?=
 =?iso-8859-1?Q?ROLH7cuI84LPPTtOwNVFtuLP1A/RHdvu9pxPGS98d0eYMwih3HafYFUSIk?=
 =?iso-8859-1?Q?Kh8PG6yZ+khhpMxtupbj56XfsBVjZ4/isTZ/u0rGHe19/IQ7gg5xLnFxDc?=
 =?iso-8859-1?Q?r/AELLb3QjMwqIX4zOXsErjlXSk0QIb3OecyfieqWd2RKYl94JVwLgGNKU?=
 =?iso-8859-1?Q?cLrmUaUW7djognAdrZY4W0sMDTF4LTsP412Zh1eCOIe0SjtHq6TUp9pTMg?=
 =?iso-8859-1?Q?mw/DfJCantQBxArkoEfdBPmK/Gm6Ww+BtXIjObsQHp3j4hgG4OjdrIf7yq?=
 =?iso-8859-1?Q?T9nz+3tx+5qZqhIXOH9geuZsvCYUiASq9Rt4lLMWE9Q9OGFDy4cZVzl/oi?=
 =?iso-8859-1?Q?fj75zDpL5obt9rKIVQ3k5lf97MgFUzSJ5olOhcXjEl49Q0UuEu2Nr6jnqW?=
 =?iso-8859-1?Q?C//oTyiPGPGNEs9Ln0V+YUgCusbY8tdVZLDEiSiWxM/68dI6OCkODhUpjo?=
 =?iso-8859-1?Q?ASC0L/yNOmsPEPIDfCbyStd+urQKeqKGqC0lbPH+hd615rzQMaQQY2H8DK?=
 =?iso-8859-1?Q?KWX5BKOIvwb5UvDtQg+si+nagnfv4mwOpPXbYEvPppEsKR+iKkA0QS2T6k?=
 =?iso-8859-1?Q?/P3gdCWeNRFt4D46wI3T8mdVPqdT5QedMxrvwctnkrSVTYtQL/1srJYV0E?=
 =?iso-8859-1?Q?0WJAaD/Dqi3KAUEBE3WYCK49NVVvupW1J1KINWL1q2PJhDKr1CIRaBclLD?=
 =?iso-8859-1?Q?fwKPRSo+ThHbF6bPs6CrqjzGYn1RM5kJU+P0CPHPgztrFyp1FcHEaNvL5a?=
 =?iso-8859-1?Q?G2qVgn5W1OIlXP5+QHYL2tzBkmDG7WQrWCUZXNWlcW/NBDGln9zcLCn5cX?=
 =?iso-8859-1?Q?+yNgn8zAluB2Sng3uuO8u2SU4lM8Gp0kfTZJyOitm1p8+sqazAeJIjAcpm?=
 =?iso-8859-1?Q?pb8CWid+tclNdDQbG73hi4jrmo1pgUlIwCGhfFUjvnzqc9+5cJGpGKbykT?=
 =?iso-8859-1?Q?6EDPMM5zpSlD5Ut+adi3mP?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR08MB7955.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?dhALkj8HRZjpOunOanOk9L98pnDzdND3pXiPb47T6TiXASMc+FDfBIwBZI?=
 =?iso-8859-1?Q?ynaXB2KuRGxmn6zuAV7fV85MlPUokBZ1FmxQrJhQc2gDHUoRQV3qgaHY+L?=
 =?iso-8859-1?Q?ESly6ZfLYtTs+o6qer+PfiXKkUwgMplh6SvD7CamemE7sLckhcvrDQnnAs?=
 =?iso-8859-1?Q?WfxkjTotiGjO7wt1bqAoSPFwRj7vQTjD3TmErMyPZ6qQTqd6paHdLigImb?=
 =?iso-8859-1?Q?J8KJW+QBSXyJfBN6lUcVR7JOVv0ft4o4nxSgBIyyHjXSGgfv+slZ/w78q0?=
 =?iso-8859-1?Q?eWEwL2i6JmWR4LsOSE/R+2RI7xzto56pif6g8YDYJbljCA6OoBJfjaFHro?=
 =?iso-8859-1?Q?iuAZVZCBx3Y7drW2kiiTv9lqnNNONIx1XAkU2umJVCx892wBXyZTC8KWoO?=
 =?iso-8859-1?Q?oQvnlDcf1oWcT/xEEG1T31C/imoQ6bQUjuXHZynMbPd5fXFQ+FNEJa8Gmq?=
 =?iso-8859-1?Q?mYJhYbnHAHyDA8AkIg5hs6oAmf/CL7W1gtFUF1M8UUWaZ1GdWtS2aXa0LG?=
 =?iso-8859-1?Q?sa2o+OepP9vOeMvM+Nub4/RA8SViQ8rQsDYrmnXmN/9/itTSM/2gceFIg0?=
 =?iso-8859-1?Q?KQ5WCYXjBffJZqbl/9VRwlxkNRwwFSV+ZUMr1fRlUY8WBOiNK07qDltDHN?=
 =?iso-8859-1?Q?M8BSpQQBWf2jLqkJhStka4PlLltezRKKRAsAhqDRjWYEiJTh6iwgaID529?=
 =?iso-8859-1?Q?Qo7Jfq/nV1sJWk7e4IOWwN2oHz6ipBt9L5vJmBy6vB7tqD7aHEYO+EEk5D?=
 =?iso-8859-1?Q?VYbZDjM6IclLQX3OPu5XZPDFLZVdtTQi6/IFCylHKhgGq7JwJaHGu1V6+8?=
 =?iso-8859-1?Q?qcrp5Ffmk6pQWW3/3DFTFeWiSNIYTVXv2/cUvfzw1cpFgHQ8sapzRVAEDM?=
 =?iso-8859-1?Q?SQnAL4bmYCjSQb9hYen/XFe8Qcp5G0K5RQuP/6UtOZ7VckbyoclxRA7daJ?=
 =?iso-8859-1?Q?CF3QOVFMWzAyKeMKkABWpz/HARFWrso1e5DreoATd9HlJ8ZQin5J6vuWq+?=
 =?iso-8859-1?Q?hqaRSiK5umFw83tK/K5sv6A5mrLYbhlQ5cj1ScWNz3B5ipTfI4vksxXpQC?=
 =?iso-8859-1?Q?vHQWDOs8vj3TwfVHmcjYiHIplv/RgiwV0AW/G32G1qFQXc+QcISrRbMVxF?=
 =?iso-8859-1?Q?EVSF/5g8Bn3O3sLiYQW9X2kDTsgwNp/eub1SEXDkKp6oh7LD6+61pHjePL?=
 =?iso-8859-1?Q?FB89fqRfJOvr/OSyOWJQtQBoGn5kNyDrOLhiX/YPjYhvfpLnADG+LfWkb4?=
 =?iso-8859-1?Q?EoZEwgqfXXQ9ZYwjcdxUiu4qyrV9sDPJdRiLFxADUS6S56lf8FqrebagO1?=
 =?iso-8859-1?Q?fNR/2y42sDmpVrK6V1ZPFmPrFYTAAmTrbxHrnwtAIm5OPfL6MDhyA0mh7T?=
 =?iso-8859-1?Q?5gOo0jAvGWJ4jFMqt/NmiiKN2QhDhRQ4WWr77NTpy4wJDw7CfLZOmHGZgp?=
 =?iso-8859-1?Q?W4dngytR7HIgkiTWHmrPxL2+4bQSxMfReh2vxUtCvWzZSf7P6NLUircA4O?=
 =?iso-8859-1?Q?2sdoEapH6mTpQ6US2DFtEBDpgMMbp3Xp+JLbqb3s0ZsFbl6LYZiJ+weAUR?=
 =?iso-8859-1?Q?2r2DSYG5/eSW0sFQXl/0NRmjk9TYNOgoWdz+jj9HMAmq7l+2aI0/ZXcZL2?=
 =?iso-8859-1?Q?ZrB9Fzs2gFVBWtY332jKt3dBfZkMIdGISJ?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: arm-scmi@vger.kernel.org
List-Id: <arm-scmi.vger.kernel.org>
List-Subscribe: <mailto:arm-scmi+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:arm-scmi+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: GV2PR08MB7955.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c08d3fd6-9adc-443c-3527-08dd30c13a59
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Jan 2025 15:21:02.2170
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: wgDhBDYCWyVIEuWyxBJZXbWJILgUetxMOS70VTvP40dlPWDuof1r/5ISaHHyel098XPqKQddrLKVdbxjIxg6Ug==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR08MB9870


Hello Dan,
Answer to Question 1:
when we configure the pins in the pinctrl module what we have currently are=
 the allowed configurations, functions, and read-only configs without any v=
alue, which means the value of config_set/get is something related to the H=
W itself which means that for scmi_pinctrl and pinctrl we don't have any va=
lue values are only the responsibility of HW drivers so whatever the HW def=
ault configuration we should stick to it.

Answer to Question 2:
We have no choice here once we receive the request even if we have the same=
 values for different configurations.

Answer to Question 3:
what I understood here is that if the group is a GPIO or a single-pin group=
 it means that pinctrl shall respond with the group config which in this ca=
se has the same configuration for all contained pins, otherwise, it should =
return NOT_SUPPORTED where we are not sure if the whole pins in this group =
have the same configurations.

thanks, Dan so much.



________________________________________
From: Dan Carpenter <dan.carpenter@linaro.org>
Sent: Thursday, December 12, 2024 6:32 PM
To: Khaled Ali Ahmed <Khaled.AliAhmed@arm.com>
Cc: arm-scmi@vger.kernel.org <arm-scmi@vger.kernel.org>; Girish Pathak <Gir=
ish.Pathak@arm.com>; Linus Walleij <linus.walleij@linaro.org>
Subject: Re: Question about pin control configs

On Thu, Dec 12, 2024 at 02:53:20PM +0000, Khaled Ali Ahmed wrote:
> Hello Dan,
>
> Thank you so much for your Questions and here are the answers from my per=
spective:
>
> Answer 1:
> the pin controller is highly related to HW so the initial values given to=
 pin configurations should match this HW status.
> For Example, let's say we have the following configs for PIN_6 as a "pin_=
id"
> configs =3D {{PULL_MODE, 1}, {POWER_SOURCE, 3}}
> so it means it is the same default configuration from HW side.
>
> Answer 2:
> solved by Answer 1

You're only setting 2 configs.  If you read all the configs do you return
18 zeroes just for the two non-zero values?

>
> Answer 3:
> you are right, all pin configurations in the group are unified which mean=
s it has the same config so if I receive PINCTRL_SETTINGS_GET for the group=
, I will reply with the configs of the first pin in the group.
>

What about for INPUT_VALUE which is the value of the pin?

I haven't yet figured out how this works in the kernel but I feel like
it would be nice to read all the pins in a group at once.

regards,
dan carpenter
IMPORTANT NOTICE: The contents of this email and any attachments are confid=
ential and may also be privileged. If you are not the intended recipient, p=
lease notify the sender immediately and do not disclose the contents to any=
 other person, use it for any purpose, or store or copy the information in =
any medium. Thank you.

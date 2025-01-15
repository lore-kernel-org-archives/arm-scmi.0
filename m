Received: from EUR05-AM6-obe.outbound.protection.outlook.com (mail-am6eur05on2055.outbound.protection.outlook.com [40.107.22.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6B132475EC
	for <arm-scmi@vger.kernel.org>; Wed, 15 Jan 2025 12:31:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.22.55
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736944273; cv=fail; b=M4DGRQ/nKUdO6SrNgvxzN9zf5ym8GixwGz+MxDbYQuOqWOp8can5Ef8gZOX2HDHwZsr4WIsE0tqLFrPLcUqUfg15pgufkPiTyH7WxyxnrIGygM1OHuBukNI/A5R3GFQtZHE1JcKUfufXpSIYqJxHtJjyCOE9viI3Q90FG9Wenkg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736944273; c=relaxed/simple;
	bh=/qG3nJkzp80IXmrvKKpXS5JCy1/qkvsxwev+N9c8wNE=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=RE92uDOLL4HPSn2yTmE6Obwkxh5eTj0hmcO6D1H7aE7CNdStn8RuUXAgjEtJqnCYBOmkvn7iyKIPifj0EIeVnJw06ZWbPPmY0uY/qaEsDyMskYw/rp39POTFyBfS9Gt7FGoY0Rwp+WQAMKOGeaz4vwZxlajb9gHOtXDUvoNE1BI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=X9GbN8bn; arc=fail smtp.client-ip=40.107.22.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="X9GbN8bn"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EDo8p6d+J/arT/FgYr+yA7x68pD6We5oSTmH52d0a+qgJgTw1kxGhIIP/72X+IUn8E93vd8wnvPhPr/2m8cVTBW/V57wO8UGlIbJd/EIDHkZ0KQ7XKcUPA29qEdP1uY+4U4vKorV9EKoxyEI/xMLoJLJi24SUEtlcPC/P6CxKLbXP+xMpzP960JDQxfpDXx1aUq99loji3rgyPRTB2FW0BkygOw65orMQ+j4e+2mfN3w0XempQYIqT5Q7g+SXCZB6egyGh3IW1ffX2RgLIA56nDXWJ+gVvs0/1QLIER4PQj5sxSTyi43MBohdVK+gGGpY/YCEU/JeaqveLO6ea3MOA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=grnkv4fspu4soBcdFSG7OryjtQxO3TJDYTSv1rfc6ZQ=;
 b=QxBZv5u2sxxI5CUvuyKlOV+dOUl0eKLVevwOWfZaF7NX4q44nAEbrp67dhRpNxXkAdeF7mTnDuNP+5ejRnSJRYrCZrmW+EWkr5P0q0EaYnmVKBGtkqANYjDVeKIrJ8ZjSunpXm87mEkcS0JYEngvi1MLRJGxQiQVCex/eNJa/BVsGeNFZ6vn0eD4FeUNFtfMXsfQ4BbOHEcW24Kw4mksNH1/awLH2jPoDqoSdwL3qCLXFQK8vQW/T9GBf7b5N3OaXUFjf3gJrjXvb9Je7T2nbaOD6277VjVOoh3OD9mHt089KClMBAxtRfZmSFkuz5Z73fLkHm8fOtJ4Oalp3I+8hg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=grnkv4fspu4soBcdFSG7OryjtQxO3TJDYTSv1rfc6ZQ=;
 b=X9GbN8bns33WPyKNerNt+njcXeE2904+StpoQUNdQ3c8ePtRe7AIlnx71AWBwP/AIw8p29sahvHyoAQJp9PRKUsG4Jgueyhr+dlrGBW+GK9tkUansAKBW4MAsiFVLMBIHnbf1SMu/3K0HlsN3SucQ36/xyy397cFirPZdjs3RNo=
Received: from GV2PR08MB7955.eurprd08.prod.outlook.com (2603:10a6:150:7f::21)
 by PAWPR08MB10923.eurprd08.prod.outlook.com (2603:10a6:102:470::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8356.13; Wed, 15 Jan
 2025 12:31:05 +0000
Received: from GV2PR08MB7955.eurprd08.prod.outlook.com
 ([fe80::360d:c6b4:e158:bc33]) by GV2PR08MB7955.eurprd08.prod.outlook.com
 ([fe80::360d:c6b4:e158:bc33%5]) with mapi id 15.20.8356.010; Wed, 15 Jan 2025
 12:31:05 +0000
From: Khaled Ali Ahmed <Khaled.AliAhmed@arm.com>
To: Dan Carpenter <dan.carpenter@linaro.org>
CC: "arm-scmi@vger.kernel.org" <arm-scmi@vger.kernel.org>
Subject: Re: [bug report] SCP: memory corruption in
 scmi_pin_control_list_associations_handler()
Thread-Topic: [bug report] SCP: memory corruption in
 scmi_pin_control_list_associations_handler()
Thread-Index: AQHbZzeV+CDngrTrbUCYNR9U12+rHLMXpDaPgAAbeICAAAHc0Q==
Date: Wed, 15 Jan 2025 12:31:04 +0000
Message-ID:
 <GV2PR08MB7955D7A98C34CF18520E691BEB192@GV2PR08MB7955.eurprd08.prod.outlook.com>
References: <Z4eMsp1jo4zlNmpb@stanley.mountain>
 <GV2PR08MB795595222CD06A1F5B60CD0FEB192@GV2PR08MB7955.eurprd08.prod.outlook.com>
 <3b098d5e-5978-4160-9cb0-16cfccbd9bb1@stanley.mountain>
In-Reply-To: <3b098d5e-5978-4160-9cb0-16cfccbd9bb1@stanley.mountain>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: GV2PR08MB7955:EE_|PAWPR08MB10923:EE_
x-ms-office365-filtering-correlation-id: 48cd43dc-e7e8-491a-78fc-08dd35607acc
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|1800799024|366016|38070700018;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?Qb9h+FMwa7hyrTTyNAcLhIvVjU6eABQ2NV5lzqjLLWAUaOgVLVx0J3Rgnt?=
 =?iso-8859-1?Q?RsBCXsu7lPLHsEUQ0xHsttCTSGxHu8/7CpXNo6d0IQp6Yo8rqRenB2vYaG?=
 =?iso-8859-1?Q?KeVPfA5mRX4AlZnrxzo6DCBdY4/x/mDKeqwXLr8NlUpO3DOPZnJCzJf0Jl?=
 =?iso-8859-1?Q?uJOQSpZwgkqYcboMi3l5aqwSsJl6TPhOHz5u9yTkPC3Odw930guxW3lMok?=
 =?iso-8859-1?Q?IVT+HV5TETbAYcrrdQX3Gq+jCC0/ignmVSMWvrQ2DH+aT3kYWdwR8Z6dVp?=
 =?iso-8859-1?Q?9vw6PmGjVQU7acg5GRNBCskpz4Flny6kfSHG097Olyr2f+4STH6ApPQKE0?=
 =?iso-8859-1?Q?NykOW7pLXqBEohYSSlUUrtl2PmZzpzGoiZgVaBuUZt0wEB0YJvVGKulxoD?=
 =?iso-8859-1?Q?hNVAO7gzcRHXYrNPDncGisqh1Ei6P3gcY3YV9WVULPz+X7N+R0yz+ccGm1?=
 =?iso-8859-1?Q?xaQGux9ntnb477yfz1ypOZ1aA63n0HsrJvopK4KqFnD5PRnrIfoWVIQgmT?=
 =?iso-8859-1?Q?2taJHYZPmuqTCSO/tZDVG0fXUlyNYfaL8P7WGpDdhzJpVsfOXuJEciwh6C?=
 =?iso-8859-1?Q?CDFHwAksywAEidUH5Sy7rtMr2qYjOJAfqYfIEVNKgz883DQx34bYUqKJ8q?=
 =?iso-8859-1?Q?KPFGDVwRkuv6xL1NIcltmsszknpNhfDybdqY19hdfhNnwhuYwGgZWzqMhj?=
 =?iso-8859-1?Q?HxRPigR3NS1XPg1vr2WU9qtKuOavOcaK3ULsO+qmqZDvOh/fGKwH+sI2Ar?=
 =?iso-8859-1?Q?aApWMqPBCtkWz64iAppl3QjvSO+q/IjxpFC8Pk175BfN1CJY3MntuxDaGe?=
 =?iso-8859-1?Q?p5WWkbaN1NVd7TIcAlOISLqp/YpaNDiauXHeA7Cu65mBHRR5GfwLbvSVj0?=
 =?iso-8859-1?Q?b4y6QY/oBxSJn5fM/wmSYU5e7yJzc9ATqp8QAeXWizkirOWa9Hlzrj72S1?=
 =?iso-8859-1?Q?wgy60fU5J160wszsile8OhKj8IiuPeyNUJ5o8lJYzjOKAUxHnqaOch/bCG?=
 =?iso-8859-1?Q?iDqDG5alLkz1MDTBmWBqbl4La3JT2Pty63DVeteHe+27vYW8g0xJc9wdJg?=
 =?iso-8859-1?Q?emTmZobcl3wwuELNFZWtD3hPVAAVJCSTKTIwCDKzsaIN6KibGMQJnW+8a4?=
 =?iso-8859-1?Q?3A59Ehp3fNasCPhbdZMUpM2kp97ogoyt7f1E+PIpjSDzHuXYJ+VOvlJcbO?=
 =?iso-8859-1?Q?/W9Bf3YN9+Iw1c/RBO2Q8ZjCjH1pd+WSqtpHS+DnFlGZJPa/6+lzaCNp5a?=
 =?iso-8859-1?Q?XNSRm60hYaepR16k1FKKsApJbQUDBqtwio5094I0MBSckj5xtvRse0M5Oe?=
 =?iso-8859-1?Q?eAg8tynIiZ2NABxCWZgXaQBq4kwRUlaYvVppi0Kej5OSh9TrHlnyAInlS+?=
 =?iso-8859-1?Q?gWooRQQAK7IKW1MdWrteMS3JY6f3jwaShZTCInx32asa1Fr74UttlADVua?=
 =?iso-8859-1?Q?vV4eIFnMnBusGDljMEHmq6pwwcb2K9i87dfEkPu49Li2xuiHdL/skWo9sT?=
 =?iso-8859-1?Q?GHa5ICYysBvKx39NCcUuq8?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR08MB7955.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?ve2ZBXmU7lgR6MH7rTdX7maTyg0tvY65zMVaM0TsGidsokTTgxthws7sYa?=
 =?iso-8859-1?Q?jV4ds4XzrGQcdYgn1eBnoG/ErQsFMZFagaHwQgfmAovZINJecxsoqY3nYS?=
 =?iso-8859-1?Q?RhquGZZWhbmgF/Wpag6qojyZKuPsbtChIXwoST9NW5MyHCrmunPvOzH8+/?=
 =?iso-8859-1?Q?ZYubZzxTGV1h1rH50MB9YSET6TUZ5a3Zk1Z9g56F1xIj0Y96yEGI6IlwdH?=
 =?iso-8859-1?Q?3eJrmkVhTewZ8DRLt4D9RldmkPhO5/nE/X6QgXlVpE3iYDOoWC+tT2HHUy?=
 =?iso-8859-1?Q?0PERFFO5vUIou3JqrTh3qW6hg23ZLcEM+kJQ226BIcuyre5oR98JszgM2b?=
 =?iso-8859-1?Q?dYnQ3nhTAhdC3AAJ1H838xQLiJL4oN/b3soF8zP9Zjv410z1kcA/YFJ4wS?=
 =?iso-8859-1?Q?M9ofDKY9DcGS4K3mF1pvRHjWeCi2D3bwK5sj3WK9WeKPpbMustL6IAMOvX?=
 =?iso-8859-1?Q?S1wZC5ReSR28vDdgjvu5VCXaBBiXYYWLIh6K1BuPOnlo1SAKF0WmeaN2/z?=
 =?iso-8859-1?Q?KGZcmCg9IotGGJKitjEI0DNGFvrVTV2A8lDPQwyDVOGm7YrmHRCD3kAR3U?=
 =?iso-8859-1?Q?kMWPI2WrX1urXPVRcmvjPoqLJIFhAr+RsoZUl4JGUni7j34ftpanZ2z7VT?=
 =?iso-8859-1?Q?hQWHB1Q1iptNZHUr/U8laRD1LVW4OMAG9z0WtbfnopCSlFB6H0pVIrO7SO?=
 =?iso-8859-1?Q?LcXLm1H2CwQA9h9NdJbWj3SIfOzAGhTBo0UTILWb7c6rVuOu942NrBP9RX?=
 =?iso-8859-1?Q?EQz7ySLsYegv92Y7R0iJfqtKo9ArnGnPBPmNgJRrneskAWcpBfQVqr25ko?=
 =?iso-8859-1?Q?Fpy9Neo3bvnwg6iosRI4Yzp057XTExr0xt5jh058wQ/ddxZs6BnPSXqI8N?=
 =?iso-8859-1?Q?MdRCsJW2WJlUGghnn7B74193EQGi/g+xYdFiuR0WyDY66YyHYxR7Qw2mha?=
 =?iso-8859-1?Q?4NYByab76JqkaF0W+XtzpDF80fvQpTdxU/V328L69tO4kqxqTRB5C5FfsO?=
 =?iso-8859-1?Q?6/hZLnqbGJZJsOz0zJp+NrXv1PBWWKfHJBj4ruN/17QZYlu2M8NqKmA2h2?=
 =?iso-8859-1?Q?hddtaSKKCyWOuyB8LG3UsQ/0ph8Y3JoxlTTUYfuaZXvfm+YulTNBvXnjiB?=
 =?iso-8859-1?Q?DOQI71kZBs/6mBVbWPvHpJN7noFzN+ZmSE3Ae6MgDb6YYbJgg3/jFEC9/X?=
 =?iso-8859-1?Q?obcbtZ/Cg45AYux3Olu2fXPn5U7HSGpi8g7Njq1FIcgA36PsgYkLbVHj4c?=
 =?iso-8859-1?Q?ZatutC3DOenrk0vJ9hF7h0jutJZZPrL6KUkRg+pZHdAdiB4xxJLjg9/XTm?=
 =?iso-8859-1?Q?uKeOnGb6IhyU8MWRjJO+FNBNo+x3klGIK+llTaupMhM+FzLO3JcJX/NTiD?=
 =?iso-8859-1?Q?66wox/PJ6sw/mWDvIfkmt4vGL7u5C1fmlMVyxVFM5yaCNG9mprUFp9DC85?=
 =?iso-8859-1?Q?1NOP2Quw4FM7VlWu+98vQTYKzu0UnuE6z0S+81ZnpRXEm8Sg4Lk6IU5poi?=
 =?iso-8859-1?Q?K3UvkuhkNffk+Vav4sP9PgwD/4PzvVi1VvkrHEeEE5d0EWh39FS8AV5Gf3?=
 =?iso-8859-1?Q?BWvQwB2JucTWAf1ppdl4GmDT2XLJehDmYAxMzoVvH4jXPB8sRsY2TDUoL1?=
 =?iso-8859-1?Q?W/gwy0Lr5xxbwZbcLuJQr7eH3TzEFY7Och?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 48cd43dc-e7e8-491a-78fc-08dd35607acc
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Jan 2025 12:31:04.6470
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: aid8KOVPTLZnvr0PXt1coTQww6oHyrXdrKyOSmUUjkqMG61zkUDHSMmT5cluMPS/3x2oGBGSqqWxLtHcmf+OWg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWPR08MB10923

Hello Dan,

the name of the variable may be tricky. I agree its current name is payload=
_size but it would be better to change its name into payload_offset or some=
thing else.
the write_payload function using  fwk_str_memcpy which is implementing memo=
ry copy. it makes a copy of the payload into payload address + offset.

> Ideally this code would write sizeof(return_values) bytes to the start
> of the buffer and do the transfer.  But we're not passing
> sizeof(return_values) as a parameter.
this means that the actual response size will depend on the status of the r=
esponse if it is successful we will send the whole buffer, otherwise we wil=
l send just the error code as a return value.

I am not sure if it is clear for you otherwise let's plan a meeting and let=
 me clarify more.

regards,
khaled Ahmed

________________________________________
From: Dan Carpenter <dan.carpenter@linaro.org>
Sent: Wednesday, January 15, 2025 12:14 PM
To: Khaled Ali Ahmed <Khaled.AliAhmed@arm.com>
Cc: arm-scmi@vger.kernel.org <arm-scmi@vger.kernel.org>
Subject: Re: [bug report] SCP: memory corruption in scmi_pin_control_list_a=
ssociations_handler()

On Wed, Jan 15, 2025 at 11:15:25AM +0000, Khaled Ali Ahmed wrote:
> Hi Dan,
>
> write_payload API is a helpful function and can lead to easier and
> more effective implementation, while we ask the Transport to set an
> object into a certain offset in a service_id buffer, the main reason
> for that is that we don't know if we will continue the loop
> successfully or not.
>
> after that, we should call respond which will trigger the Transport
> that the buffer now is completed and please respond whenever you are
> ready.
>
> regarding the previous description, I encourage you to use write_payload
> whenever you can.
>

I get how it could be nice, but it doesn't work.  I am looking
at transport_write_payload() in particular.

>    385          status =3D scmi_pin_control_ctx.scmi_api->write_payload(
>    386              service_id, payload_size, &object_id, sizeof(object_i=
d));

In this code we're writing sizeof(object_id) bytes to the middle of the
buffer.  Nothing in transport_write_payload() is saving the "size" so we
don't record which bytes have been written to.

>    397      return scmi_pin_control_ctx.scmi_api->respond(
>    398          service_id,
>    399          (return_values.status =3D=3D SCMI_SUCCESS) ? (void *)&ret=
urn_values :
>    400                                                   (void *)&return_=
values.status,
>    401          (return_values.status =3D=3D SCMI_SUCCESS) ? payload_size=
 :
>    402                                                   sizeof(return_va=
lues.status));

Ideally this code would write sizeof(return_values) bytes to the start
of the buffer and do the transfer.  But we're not passing
sizeof(return_values) as a parameter.

Instead, in this code we're passing "payload_size", which is the total
number of bytes.  So it does the equivalent to
memcpy(channel_ctx->out->buffer, &return_values, payload_size).  That is
a read overflow of the return_values struct and it scribbles over the
data that we copied earlier with the transport_write_payload().

regards,
dan carpenter
IMPORTANT NOTICE: The contents of this email and any attachments are confid=
ential and may also be privileged. If you are not the intended recipient, p=
lease notify the sender immediately and do not disclose the contents to any=
 other person, use it for any purpose, or store or copy the information in =
any medium. Thank you.

Received: from mout.web.de (mout.web.de [212.227.15.3])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 805033546C1;
	Thu, 11 Jun 2026 08:35:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.3
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781166931; cv=none; b=d2raYicHa1lTpn6xPPvSmRZD0gO+Lk4qR5iT6ub8FW2lUbIe50vc+BtgqdnWjqHd2B3fIKiCPfTVnOX+slqwkkLUU3su5K6Dxya+Wf81gZPpAx/FsgO99VIK4pvWZTOSVqh3YqqjVCMzGOb5cKfwzJmt0wO65gZi1M/ysW9LETQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781166931; c=relaxed/simple;
	bh=PGFeVErpMsYi5KV5lNHs2WmR9wbrO3Jo7c6AVk+VWLQ=;
	h=Message-ID:Date:MIME-Version:To:Cc:From:Subject:Content-Type; b=lyrJ2dI0spz9nf6PwF1J7uyWXoKcsjO5sMnOj8y4+/dLJZdnmEDqp2XfL7eoVfMCgVf26d14vm0UOHuWklcf9hY37Ufegvg86GAZSrWTIY0bJ44W1Ma1xund24HU5Y8o3XbFte5RzuBTyjTmZkzk40pHCc895hI8cacKEUvc8g0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de; spf=pass smtp.mailfrom=web.de; dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b=HxZyBtfY; arc=none smtp.client-ip=212.227.15.3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=web.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b="HxZyBtfY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1781166912; x=1781771712; i=markus.elfring@web.de;
	bh=BM5P5c0M/96P75EgWvyd8Kadj1Lm1e9d5367kbU4Bxc=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:To:Cc:From:
	 Subject:Content-Type:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=HxZyBtfY+9eVrygruY0g1qKBKlajKU0lPB2RjCRohJ59aESutmKjG7eZ3XZkm6+2
	 vkih0TMys4y6CoOllcaGK5aQij1o4nV4K9c1WGWM2t2JloEmdbd5UdYMC+tEiSBgr
	 hsXb8KcLyVwQBZJrlxjaDf1YZVVnLYLM+ycfuYDTVvWhrTqtTzjt2No0kqXPmrnpE
	 ktoHk7o7CvKrNarnpJ3i80K8W3jWvRq7ywNGunds+kY5jL2lRW4FozE+IoOtmupYy
	 e9F6ZODC6Djc5FACMMguJyVIIuUWmj6+Igsa/nfUv40uvknobC1zdqX+WlDf73W4n
	 Gh0k6xMG3svtKBqIQg==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from client.hidden.invalid by smtp.web.de (mrweb006
 [213.165.67.108]) with ESMTPSA (Nemesis) id 1MLijs-1wp7jM3VBo-00OyV0; Thu, 11
 Jun 2026 10:35:12 +0200
Message-ID: <545ffb86-55f5-46b2-83ca-285cd8d540d7@web.de>
Date: Thu, 11 Jun 2026 10:34:52 +0200
Precedence: bulk
X-Mailing-List: arm-scmi@vger.kernel.org
List-Id: <arm-scmi.vger.kernel.org>
List-Subscribe: <mailto:arm-scmi+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:arm-scmi+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Cristian Marussi <cristian.marussi@arm.com>,
 Sudeep Holla <sudeep.holla@kernel.org>
Content-Language: en-GB, de-DE
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org
From: Markus Elfring <Markus.Elfring@web.de>
Subject: [PATCH] firmware: arm_scmi: Use common error handling code in
 __scmi_device_create()
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:QeOQ0w58tevLe+xFDxBMk4vsOY+ebJLEDNT/3sNnKeFbfyuOLZj
 MQQ4o1+ql9KvSS2roHdVSOzeaNkJP3cyFX+yt9xiSa+9v2cU3r2VzLL/QVq6ruwufGVXFld
 9lVarQg6CGULLrGHIRkSsgVsI1VFOd4IdFaoebUu+QxidDdYnk7D0jVw++kmQQJUBgLj9vO
 VFOf0F2vhMC0CCn3lqDfQ==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:gdcUorziIYQ=;6YQMbpsxWChylJNGqMEYRCXMM1g
 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
 9RfpyoUPwfCAf8vz2A=

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Thu, 11 Jun 2026 10:27:45 +0200

Use an additional label so that a bit of exception handling can be better
reused at the end of an if branch.

This issue was detected by using the Coccinelle software.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
=2D--
 drivers/firmware/arm_scmi/bus.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/drivers/firmware/arm_scmi/bus.c b/drivers/firmware/arm_scmi/b=
us.c
index 793be9eabaed..8c20ed1a8243 100644
=2D-- a/drivers/firmware/arm_scmi/bus.c
+++ b/drivers/firmware/arm_scmi/bus.c
@@ -450,14 +450,13 @@ __scmi_device_create(struct device_node *np, struct =
device *parent,
 		return NULL;
=20
 	scmi_dev->name =3D kstrdup_const(name ?: "unknown", GFP_KERNEL);
-	if (!scmi_dev->name) {
-		kfree(scmi_dev);
-		return NULL;
-	}
+	if (!scmi_dev->name)
+		goto free_scmi_dev;
=20
 	id =3D ida_alloc_min(&scmi_bus_id, 1, GFP_KERNEL);
 	if (id < 0) {
 		kfree_const(scmi_dev->name);
+free_scmi_dev:
 		kfree(scmi_dev);
 		return NULL;
 	}
=2D-=20
2.54.0


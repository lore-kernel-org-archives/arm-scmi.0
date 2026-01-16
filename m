Received: from mout.web.de (mout.web.de [212.227.17.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF32B281376;
	Fri, 16 Jan 2026 16:13:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768579986; cv=none; b=AVdOctR2ALJmMPq7H99fqiKshpZbdBxL10VDoUOMx7Y8vvNhWA9/WUeMOrtu2JaHkusU3ArGIX+Kz+345f3j1SmpbhPJslKjMNmwH4Tm87XJr8JG46GpEbM6me8f6Gpq7f9gJsaDFLtqZxmjyjUAmZPaDfByYpA9FoG1nzCHFmo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768579986; c=relaxed/simple;
	bh=0mtJwfWQwQe0LqK1E8HXSJ9uPs2A6qOKazMuFJhjKTk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=qG9Xa92WnJfgkMNO5GwVd76LQPOtKnRYidmYJ6D5o13wDTzkboJa3osYE+dFMSPJdMON50Zz1YcvQKwnnE7zrN6OZla693/E61rmNzF6/UAQ/ORZ4ws4p4TPOHF8nTEiFXkz5Jf5ums8Q9gKg8Rc8SHxz4zintriiuHvBzVv/zY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de; spf=pass smtp.mailfrom=web.de; dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b=qJpUaTD8; arc=none smtp.client-ip=212.227.17.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=web.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b="qJpUaTD8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1768579983; x=1769184783; i=markus.elfring@web.de;
	bh=0mtJwfWQwQe0LqK1E8HXSJ9uPs2A6qOKazMuFJhjKTk=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=qJpUaTD8ONvEQ6bNbK7j9Mojy0zObPbvh+q02b92d3Blmsef/yc1Sarl08UYTmjl
	 R9fMC+DzP1S0SRWrnxzv1ZsraRQo8SD6EyYjRAWgY7CQw3VVnqI3VxBLXJg5wsGhm
	 x+1xWGG+SrbyE1JW76HkYgNcueMM/Yw/njAGA0Sr8r3B2TXZDvC60j3Id7IZhPAhi
	 CJwvDNE5jtpmr+VAGlIXjeDyfN1JLPl1F/zASHTESRZW8OikIeFavBYczbRKpYYoz
	 rxN7iWALpiHWtI1hWQmhIKGDF/lcg01NLXRdm0dM8Vad/cywWE5MIWcyCCV0btmaX
	 bKVOAlvWGiWlLSYogg==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.29] ([94.31.69.218]) by smtp.web.de (mrweb106
 [213.165.67.124]) with ESMTPSA (Nemesis) id 1Mr7eu-1wCFaa3YYA-00bgOe; Fri, 16
 Jan 2026 17:13:02 +0100
Message-ID: <9438c328-c5be-42c3-b7b0-17dae62fac98@web.de>
Date: Fri, 16 Jan 2026 17:13:01 +0100
Precedence: bulk
X-Mailing-List: arm-scmi@vger.kernel.org
List-Id: <arm-scmi.vger.kernel.org>
List-Subscribe: <mailto:arm-scmi+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:arm-scmi+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: firmware: arm_scpi: Fix a reference leak on device node
To: Sudeep Holla <sudeep.holla@arm.com>, arm-scmi@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Cc: Felix Gu <gu_0233@qq.com>, Cristian Marussi <cristian.marussi@arm.com>,
 LKML <linux-kernel@vger.kernel.org>
References: <tencent_A3E20C513BBE7D268B863A5CE473FBA10B06@qq.com>
 <9d44f5c6-9197-44ec-b7fe-50c2a686a751@web.de> <aWpaOYy6M_wNiMJU@bogus>
Content-Language: en-GB, de-DE
From: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <aWpaOYy6M_wNiMJU@bogus>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:TNAMiKUDVe9FKzizud+MZ8C/qbqQATeE08SKvE7qlN3n1H5L1Ja
 9C+GjnEx5bQeIrioHciurlqwk+WJuOAAKK34cGsLAkwCH7Q5gGZ1fJ1s2WIwLdGeodc07ju
 0UOT+VU+TP6emcmtYEXvb3VVRlexSX66J9UxjLSDwq4Z3boBzzpf5taLzocCcrZeQIQRK7S
 Z136NS+C8gGLe8AlLgT1A==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:pUwbf+FSnIc=;iPx1dkKZriWDr+nvEYLa2jjqJKq
 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
 HxMx6Kgv7ntftHde7TjC7eR4XpeKM

>> =E2=80=A6
>>> In scpi_dev_domain_id, it does not release the reference.
>>
>> See also once more:
>> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree=
/Documentation/process/submitting-patches.rst?h=3Dv6.19-rc5#n94
>>
>=20
> This is useless

Do you really disagree here to the usage of imperative mood in change desc=
riptions?


> and looks like coming from the bot.

I hope that views can become more constructive again.


> Note to the author:
> ignore this and no need to act on this.

Will other contributors get more positive attention for recurring patch re=
view concerns?

Regards,
Markus

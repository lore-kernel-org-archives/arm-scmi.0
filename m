Received: from out162-62-57-252.mail.qq.com (out162-62-57-252.mail.qq.com [162.62.57.252])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FC9F23C8AE;
	Mon, 19 Jan 2026 18:03:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=162.62.57.252
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768845784; cv=none; b=Lrb8CwrrYeDQ8DJGCQoyyqMtPDeYPH48zd0txFrfvbrk/O3exA5TArr4teOdq3T22oWacLjMdTeCTuQ5OLvixtPIItoeMEtBQJZjBf1lIShdr4QiauPyjJvti3Xh0O4qs9WBIrHgDdiIYfkpuLr0S3JeH6Ken7MUz4kKU0uxt2w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768845784; c=relaxed/simple;
	bh=49J2lJnlPwcCk7N6j+DeetdjisQMY9H/78bYAbZMLbg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=UU0S+IdY7ZSqLoHAKvvFoJIbN6HEyW1pfoauZ2u4ALX1fePM1MMpq7+NXOSpYfNWU/wkPKm12E6TIJJM4Z8HddNPdgtEYDAU2GwnKsXJpwoNVSL+cJlgUrQwBLstEfH/Sknf9n5LIHkQ/iJXNe9C7vxm/Ujl0GKkjERyDfllrcI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com; spf=pass smtp.mailfrom=qq.com; dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b=QAuNGiqv; arc=none smtp.client-ip=162.62.57.252
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qq.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b="QAuNGiqv"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1768845771; bh=gyt7EEhoh5NwywEG1rYGsyZMG2+eh5CF/4sT3e6waB8=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=QAuNGiqvYyoIkVrlSkRs7NfUNOWhF8HpaYb8bApWNabh9Sf4oYMrI+zpylK9E8wwZ
	 31QoGnkvzmKUassEkXpjuLdXz/YnfdzCP/m9COA+YQIIvn4QTQmdChim3e0ZE4mPgs
	 0BDId/wJjiqmC+CMu7kjeGL0bApHM8hBLpOKF4gw=
Received: from [198.18.0.1] ([2408:820c:9008:ba52:1551:afdc:1b7d:4912])
	by newxmesmtplogicsvrszc41-0.qq.com (NewEsmtp) with SMTP
	id DD43F682; Tue, 20 Jan 2026 01:55:20 +0800
X-QQ-mid: xmsmtpt1768845320teerxm2ak
Message-ID: <tencent_C06105A21611283E4866B846091CE7B3CF06@qq.com>
X-QQ-XMAILINFO: MFA3rFz8fXqr/mX5GUxKxvLf+e1/bhLKl7TDMrAZaAVlbNzk6Fr12ePNH3N6I5
	 wTHlHYFAoiCkBjOt/FVboZGsnUblYZM1EALPwQKlnlITHynGPfuxPV92AqKWs94/r4fUiZ4fX2M7
	 OReeKjkkU+aBkocSzJJcyEzVR/bfhDMSr/Y0If2+kH7+IyZpjzbUWgnj5ouuAPdWIlIr/hjviXIb
	 bDUmrIEkgvaWKUJeguZAhT+/3LG/WEfdIJ0xhviKTTJRHBGvaWXoMElHlj53CwCAefYQZfog+iNJ
	 UExe7kGCh0wERvt/EcVif3fxM7fBc+3NQoSgu8uG/jxsJeYk1r2x/sifw9LEMiRJo+FjR5H9BoSK
	 g9WEYxLv5vZmdZZ2Oy1m+bIavE4gF/iKXT+oIvNtTNBXQeJ9wPQdmvKtWogTozpkNoIlbVp8ENYq
	 dFkMDJwMsVYjnOXjCW7OCmJnSRF/EijUEPpvOErK0NJ5Cz0om/GGsRy6OkICEInX4N+t42Xe49t2
	 js46zUp4JLen2Eb5KhDwDZNYXfmrfg5AseV82YazUXnCGJRezGms9g1t4kQiwegpaiHcGXcqg/3k
	 thvxyZZNQ+ZcGukRW+epUEFqmAGF/dygt3RwEgGmQidrZcT7WJT+HgXSyDjqyRagIq2CDCxtpkos
	 P2XNXLJduo3SDwQQivhqexLe1TRFxYZDRH2MtA5khZghw0hyo8qBmMhQPYwq6LiOIZGerDeC4EdO
	 al+6c0rImhqw/Xuw5uRF0ckjCiGOVJHQm4Xdb1RWDC6Ux8daYVUSNachvifQTDN80JJXGACo6929
	 UBfx49qN+UGuG9Cy21auKqwdsFRMkFnIKrvInG1e8lzEWHWqTdku+QF/ChuIxnyEyHkaMVV9nMlj
	 DhqbFr2Qk7pZwFAReIqVdo+sWKeC4hzwTy7fnGCxKCZG1ykMzJR40AN6+aEBg4W2NOVowYlFAnkC
	 oLWc8uL7Mxcbm/P+oWRhqI+DHvazqGvXDuyOiLx+lOX/++28ebuDMCDH0LtpGkaZDypUcnU3qjnT
	 gr9gvpr6NCdg94qSzn/wZ1qumlx9bYZrdWiNJU6aWzxg0gkllaecX2pW5X+hLJjDyUKSynGwqJx1
	 wMc7icUWXBVJxkZGZ6sMaGuWJ7h0Vkk5r52XMb
X-QQ-XMRINFO: Mp0Kj//9VHAxdQrPcxjHCuGmF+tfZ5sAWg==
X-OQ-MSGID: <4ff968a4-a71e-42b3-af44-6365e37a5afa@qq.com>
Date: Tue, 20 Jan 2026 01:55:19 +0800
Precedence: bulk
X-Mailing-List: arm-scmi@vger.kernel.org
List-Id: <arm-scmi.vger.kernel.org>
List-Subscribe: <mailto:arm-scmi+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:arm-scmi+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] firmware: arm_scpi: Fix a reference leak on device node
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: Sudeep Holla <sudeep.holla@arm.com>,
 Cristian Marussi <cristian.marussi@arm.com>, arm-scmi@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <tencent_A3E20C513BBE7D268B863A5CE473FBA10B06@qq.com>
 <aW0xWZ-KylipPF7M@stanley.mountain>
From: Felix Gu <gu_0233@qq.com>
In-Reply-To: <aW0xWZ-KylipPF7M@stanley.mountain>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Dan,

Thanks for the review.

I found this issue through code review.

 From the comments and implementation, I believe this is a problem.

The caller often misses calling of_node_put(), and I have found a lot of

similar issues in the driver code.


Best regards,

Felix Gu

在 2026/1/19 3:15, Dan Carpenter 写道:
> On Fri, Jan 16, 2026 at 08:54:39PM +0800, Felix Gu wrote:
>> When calling of_parse_phandle_with_args(), the caller is responsible
>> to call of_node_put() to release the reference of device node.
>> In scpi_dev_domain_id, it does not release the reference.
>>
>> Fixes: 45ca7df7c345 ("firmware: arm_scpi: add support to populate OPPs and get transition latency")
>>
> nit: delete the blank line after the Fixes tag.
>
>> Signed-off-by: Felix Gu <gu_0233@qq.com>
> Did you find this issue just by reviewing the code?  I read the comments
> and then looked at a sample of four other callers and none of them
> called of_node_put().  So it's a weird thing.  If this is really the rule
> then we should have a static checker heuristic to enforce it.
>
> regards,
> dan carpenter


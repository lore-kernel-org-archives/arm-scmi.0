Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 925F01531C1
	for <arm-scmi@vger.kernel.org>; Mon, 15 Dec 2025 12:19:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765801175; cv=none; b=QrLWxENyLm6Ldl2dqXto8RMEH2MJfyNn+YMYPKLT+GvLoEYaXduLNFJrv9J78IhkIbKT6GNHZq37n1ksWcMRVvl3w0z8DQgyNhccqRJcaFl1SONZt8wktzR5i7e835+CZsBt44Y9Zta/4s7YAKUHiFLqmS0O/KypUSIZ9NeIdho=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765801175; c=relaxed/simple;
	bh=NuzPzNkhUHyQvMReM3aVzVIBKpZZc53fXHQYTDwti+0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CKxVMgHt1//pgLeqeduVnmcyrsqftA8ZZk5Fensb3HrtOZc2+d5E2FZoD7oLDLtQvAuYLbn/+wGlXn5noZUghUrFi403uI7/6wC8V1icjGl5NZdLJh6NAHLiQs/UlcWaQDQ9VBHl1PuwCmzPtgNhAxkEv/FshZ11GdH7UwCNwAw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NZtTQHri; arc=none smtp.client-ip=209.85.218.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NZtTQHri"
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-b7eff205947so199221666b.1
        for <arm-scmi@vger.kernel.org>; Mon, 15 Dec 2025 04:19:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765801172; x=1766405972; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=8EIVisoz06lDNXjmaiCVZEizu/HjA2+TywVOjB9TcLY=;
        b=NZtTQHriz/rBp04ovQ2pGgrlFQsen9KeHBhRqw1vWP6mC7giBCFa+/yIwf6iglwWDL
         s7BP+Ol1SFXy0ioafNwWXSEV9grYGrnndN6zz1sBwUulzaEMGzUYZ6xYw1+L34KLgPuH
         JCTpBsmKXWLoXmHn2HexgFJlZYiX38QJlKZYxW2obltcpb9qIkCbzHVyd6i+PT5zrL18
         1MnNATqTEY3emFlVeLnClOMyYX1I76PdmnAqUkLdapYMdjINT/tg7/k9teGcxHzBXEAz
         JlfpA5sBoO2bsDrFlrnWQVkE1NaShG5jsYkky71504D0K1erBTIy3JLvJnBmTI0Vo4WP
         Jq1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765801172; x=1766405972;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8EIVisoz06lDNXjmaiCVZEizu/HjA2+TywVOjB9TcLY=;
        b=TqxlF9ZDZC/kgbge7vGtgecocrl7+/cU+ThFIAKqlN6DpFw9P2mNY0R46GX645tPvF
         A0cBc53f4Q8u3QFwoCRCEY6RlxmnQS/gtw1UI2lasHdHbLK8LGKoLPwUfmd5u90YDvbj
         peRb82GbZcuMH+REb2+LGqjyk/G36d/79IPnsbe9YvN3VgnNKC9f2sMs2v7TRbljw991
         p2QOFv5Rm0NmSh4GRxkwsmGkxwjoTDF7TFjjI0UpIGQvAbDQ2fJ6mmY03o+9slG4DKeT
         2znY6YyIYbCuroFFObM7SX8eAEvjUNiFVz2NdGKMKABy1NIp6zUonOs7SIYwwcdWHC8j
         aeAQ==
X-Gm-Message-State: AOJu0YzR29jMXD85E9ED/iZX4cGLwHYU4bOBHmPA5hH9QDNUlR1f27J6
	NmFTrNkApiFNh41ekbxU3NNBBmAS068RovxWWOlGc8J2lBz2RVN8a6HvOzqfNA==
X-Gm-Gg: AY/fxX5BRaFoLrem04m5a8qQGoJ1Cou5HUF7F4TBiuqM0EFbqxdbP0fhQwKWldGxY2h
	abjDcjb1sU0Pnf4/eTQl8kHDvM8dW5JvVq9Apc58dkmN1FQup/YtFwCtHGXnxMTVj4abDuNjl3E
	ncQZjo4c1gcI7huchCN5ThZUa+VfXcFBbjrx+TXgSKwGJLFVd5zGdYaaF2O8iLSllM+wFZNm7fq
	wLBYL+Z2TPLSvaRr8IM52Z7IFLKt6tJzaaGp/Xhzak/BhGFHv4Zw6dkKjf2540+TdcqG0wKHyJA
	gij0hIeXnxa+Sq9f/XO24yUzQ3GjuWFai0R3TEA6cX1VuLn5kIy+uMwTZ97YFUTIvfiBshT/NRf
	4JoMraWUJE7aYIhSHv5oPxkBBwUbsE7EdmYlD5a/2KOtPOHbl4XlvM0ah8mhLWQQupxQSN3vzy9
	i3JnjvaoXfOP8nVFikeKtke1GiOIRodg5kMOBRHRlvVhlzLZhvKN3YrqHDRQ==
X-Google-Smtp-Source: AGHT+IG+WUfkxbbaVC1nQxtoqEXbfPMkeMKQEW0INgw7Itg/QrxQghFoFN1QAlRW6k1fNz0/GnCXmg==
X-Received: by 2002:a17:907:2d29:b0:b7a:1bde:1222 with SMTP id a640c23a62f3a-b7d23ac9760mr1168078566b.63.1765801171186;
        Mon, 15 Dec 2025 04:19:31 -0800 (PST)
Received: from localhost (ODAP-199-203-33-160.bb.netvision.net.il. [199.203.33.160])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b7cfa2e6dc1sm1371841866b.17.2025.12.15.04.19.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Dec 2025 04:19:30 -0800 (PST)
Date: Mon, 15 Dec 2025 14:19:29 +0200
From: "amitaigottlieb@gmail.com" <amitaigottlieb@gmail.com>
To: arm-scmi@vger.kernel.org
Cc: amitaig@hailo.ai
Subject: Re: Fw: [PATCH] firmware: arm_scmi: Fix unused notifier-block in
 unregister
Message-ID: <20251215121929.uaauv3ikjgv6zuit@hlil-521-lap.qb.hailotech>
References: <20251211114926.709004-1-amitaig@hailo.ai>
 <aTq2IA6V1nTE-XSC@pluto>
 <aTq-0QAUONrNERGA@stanley.mountain>
 <DB9P194MB13560B1BBAD2A8A8E6260719C1ADA@DB9P194MB1356.EURP194.PROD.OUTLOOK.COM>
Precedence: bulk
X-Mailing-List: arm-scmi@vger.kernel.org
List-Id: <arm-scmi.vger.kernel.org>
List-Subscribe: <mailto:arm-scmi+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:arm-scmi+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <DB9P194MB13560B1BBAD2A8A8E6260719C1ADA@DB9P194MB1356.EURP194.PROD.OUTLOOK.COM>

On 25/12/15 11:27AM, Amitai Gottlieb wrote:
> 
> ________________________________
> From: Dan Carpenter <dan.carpenter@linaro.org>
> Sent: Thursday, December 11, 2025 14:53
> To: Cristian Marussi <cristian.marussi@arm.com>
> Cc: Amitai Gottlieb <amitaig@hailo.ai>; arm-scmi@vger.kernel.org <arm-scmi@vger.kernel.org>; sudeep.holla@arm.com <sudeep.holla@arm.com>
> Subject: Re: [PATCH] firmware: arm_scmi: Fix unused notifier-block in unregister
> 
> On Thu, Dec 11, 2025 at 12:17:01PM +0000, Cristian Marussi wrote:
> > On Thu, Dec 11, 2025 at 01:49:27PM +0200, Amitai Gottlieb wrote:
> > > In function `scmi_devm_notifier_unregister` the notifier-block parameter
> > > was unused and therefore never passed to `devres_release`. This causes
> > > the function to always return -ENOENT and fail to unregister the
> > > notifier.
> >
> > [ CC-ing also Sudeep ]
> >
> > Hi,
> >
> > thanks for this.
> >
> > LGTM.
> >
> > Reviewed-by: Cristian Marussi <cristian.marussi@arm.com>
> >
> > >
> > > In drivers that rely on this function for cleanup this causes
> > > unexpected failures including kernel-panic.
> > >
> > > Fixes: 5ad3d1cf7d34 ("firmware: arm_scmi: Introduce new devres
> > > notification ops")
> 
> This Fixes tag needs to be all on one line.
> Fixes: 5ad3d1cf7d34 ("firmware: arm_scmi: Introduce new devres notification ops")
> 
> > > Signed-off-by: Amitai Gottlieb <amitaig@hailo.ai>
> > > ---
> > >
> > > This is not needed upstream becaues the bug was fixed
> > > in a refactor by commit 264a2c520628 ("firmware: arm_scmi: Simplify
> > > scmi_devm_notifier_unregister").  It is needed for the 5.15, 6.1 and
> > > 6.6 kernels.
> >
> > I think there is some sort of syntax to refer to the applicable Kernel
> > versions in the tag line....not sure it can be easily followed here...so
> > maybe the above comment is enough...
> >
> > More details here...
> >
> > https://eur02.safelinks.protection.outlook.com/?url=https%3A%2F%2Fdocs.kernel.org%2Fprocess%2Fstable-kernel-rules.html&data=05%7C02%7Camitaig%40hailo.ai%7C6aec4657c2364f78663408de38b45031%7C6ae4a5f7546741898f6af2928ed536de%7C0%7C0%7C639010544284877259%7CUnknown%7CTWFpbGZsb3d8eyJFbXB0eU1hcGkiOnRydWUsIlYiOiIwLjAuMDAwMCIsIlAiOiJXaW4zMiIsIkFOIjoiTWFpbCIsIldUIjoyfQ%3D%3D%7C0%7C%7C%7C&sdata=Kxmnl4F4KpZgBjzGakndjp9EK9A2GfrXFj04F5%2FPIxE%3D&reserved=0<https://docs.kernel.org/process/stable-kernel-rules.html>
> 
> I'm pretty sure those little comments aren't parsed automatically...
> It feels duplicative.  I don't love those little notes because it feels
> like the Fixes tag should normally be sufficient otherwise I want a full
> explanation.  There was an embarrassing bug where the notes were wrong
> and the patch was missing a Fixes tag so it wasn't backported far enough
> in distro kernels.
> 
> It can't hurt to add them to the tag section, I suppose.
> 
> Cc: <stable@vger.kernel.org> # 5.15.x, 6.1.x, and 6.6.x
> 
> Leaving them out is also fine, really.
> 
> We definitely still need the note.  I said before that note about
> "This is not needed upstream becaues the bug was fixed
> in a refactor by commit 264a2c520628 ("firmware: arm_scmi: Simplify
> scmi_devm_notifier_unregister")" should go under the --- cut off line,
> but actually I think now that it should go into the actual commit
> message itself.  Otherwise people who work on distro kernels, for
> example, will wonder why the commit doesn't have an upstream hash.
> 
> Reviewed-by: Dan Carpenter <dan.carpenter@linaro.org>
> 
> Wait until Sudeep has responded, and then resend the patch to
> stable@vger.kernel.org with all the Reviewed-by tags.
> 
> regards,
> dan carpenter

I switched to my personal mail as my work was making my life difficult
while using an external mail client.

I've waited a few days and Sudeep hasn't responded, is it fine with you
if I send it off as is?

thanks,
Amitai
> 

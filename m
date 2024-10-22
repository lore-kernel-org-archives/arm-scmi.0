Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 854571BCA11
	for <arm-scmi@vger.kernel.org>; Tue, 22 Oct 2024 16:13:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729613635; cv=none; b=o9wkayM1M1tVvByEgjUeSam7jYUfCxlIgux9fuiTFgoxTnaNyXo9Nh1K3wQy/5/S1faUgLGP21LLyCuoHAbYo0wMmDlNms1eRGYHLlNlgvF5ROD+jbZWUA3krur1LpCb0LchuR7AckbIyDc+Amk7/kpI+3JGLpnuYW4fhL4UK1Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729613635; c=relaxed/simple;
	bh=MKma/UwCMV6JOUPD+vFM8aQU6nU7Rm/roXtnw3CwQ3E=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=MLl/Zs0TjDXNS4B6uAQbIUm0ZCxf7vnU9BMQmtHxoOD2dg5YAFsIZj5JNP9nNFWFAg1xZHGTivNeDYUQUQs/34ZhHJYpGAMsw3OCJFmVrkMl2gFK65h/VFgEaaX8uBCyQd9GbqkexRs7xXl7JR0AnIkkK49Dwkw5Zv3kGudMJ+U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=WR97K5ey; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=wCOyDFcr; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=WR97K5ey; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=wCOyDFcr; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="WR97K5ey";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="wCOyDFcr";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="WR97K5ey";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="wCOyDFcr"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id A49231FD36;
	Tue, 22 Oct 2024 16:13:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1729613631; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=no6hYSbUUYPRI235uFuMgVK2M+JVCxR2sL+EwPfnriU=;
	b=WR97K5ey7yNujoJFGOOP0S+gVfjgXEmJL+OhW5OwN9L+J90M2udvh9Jac0KLPuRm7vrwKl
	1YhXDr7U6oR5SLs0mP2JBbzkjZzgXAJFFsmLFSURQHMG8VirSmICCoSRpdF2zC+PpMU+gw
	x5Fz3vAPuKMyosjReYdKwCfuJlPgjVw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1729613631;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=no6hYSbUUYPRI235uFuMgVK2M+JVCxR2sL+EwPfnriU=;
	b=wCOyDFcrcVDcGSdiKjfM8lkHfKfKiXzogrQSY3Z2bKqdcaONh7cauN388CyCw6A/wgsws6
	MSXGMQYYPXeU+mDA==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=WR97K5ey;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=wCOyDFcr
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1729613631; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=no6hYSbUUYPRI235uFuMgVK2M+JVCxR2sL+EwPfnriU=;
	b=WR97K5ey7yNujoJFGOOP0S+gVfjgXEmJL+OhW5OwN9L+J90M2udvh9Jac0KLPuRm7vrwKl
	1YhXDr7U6oR5SLs0mP2JBbzkjZzgXAJFFsmLFSURQHMG8VirSmICCoSRpdF2zC+PpMU+gw
	x5Fz3vAPuKMyosjReYdKwCfuJlPgjVw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1729613631;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=no6hYSbUUYPRI235uFuMgVK2M+JVCxR2sL+EwPfnriU=;
	b=wCOyDFcrcVDcGSdiKjfM8lkHfKfKiXzogrQSY3Z2bKqdcaONh7cauN388CyCw6A/wgsws6
	MSXGMQYYPXeU+mDA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 536D313894;
	Tue, 22 Oct 2024 16:13:51 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id 7D/aET/PF2dOFAAAD6G6ig
	(envelope-from <jdelvare@suse.de>); Tue, 22 Oct 2024 16:13:51 +0000
Date: Tue, 22 Oct 2024 18:13:49 +0200
From: Jean Delvare <jdelvare@suse.de>
To: Sudeep Holla <sudeep.holla@arm.com>
Cc: Cristian Marussi <cristian.marussi@arm.com>, arm-scmi@vger.kernel.org,
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam
 <festevam@gmail.com>
Subject: Re: Odd dependency on ARM_SCMI_PROTOCOL
Message-ID: <20241022181349.19be62b9@endymion.delvare>
In-Reply-To: <Zxe-SBfVUEiYBkes@bogus>
References: <20241022135537.4a93c5cc@endymion.delvare>
	<ZxeY9VhAOLp8qSkF@pluto>
	<Zxe-SBfVUEiYBkes@bogus>
Organization: SUSE Linux
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.34; x86_64-suse-linux-gnu)
Precedence: bulk
X-Mailing-List: arm-scmi@vger.kernel.org
List-Id: <arm-scmi.vger.kernel.org>
List-Subscribe: <mailto:arm-scmi+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:arm-scmi+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Rspamd-Queue-Id: A49231FD36
X-Spam-Score: -4.51
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-4.51 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	HAS_ORG_HEADER(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[arm.com,vger.kernel.org,kernel.org,pengutronix.de,gmail.com];
	TO_DN_SOME(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DKIM_TRACE(0.00)[suse.de:+]
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spam-Flag: NO
X-Spam-Level: 

Hi Sudeep and Christian,

On Tue, 22 Oct 2024 16:01:28 +0100, Sudeep Holla wrote:
> On Tue, Oct 22, 2024 at 01:22:13PM +0100, Cristian Marussi wrote:
> > On Tue, Oct 22, 2024 at 01:55:37PM +0200, Jean Delvare wrote:  
> > > Hi all,
> >
> > this pre-dates me, so take this with a grain of salt, and Sudeep may
> > have a better explanation...  
> 
> Indeed, I had to dig a bit and found a patch from 2016.
> 
> > > I noticed that the following dependency construct is used several times
> > > throughout the kernel tree:
> > >
> > > depends on ARM_SCMI_PROTOCOL || (COMPILE_TEST && OF)
> > >
> > > Maybe I'm just missing something as I'm not familiar with SCMI, but I
> > > can't really make sense of this. Considering that ARM_SCMI_PROTOCOL
> > > does not depend on OF, I do not understand why it would be OK to build
> > > these drivers under ARM_SCMI_PROTOCOL without OF, but if test-building
> > > under COMPILE_TEST instead, then OF would suddenly be needed. Can
> > > anyone explain the logic?
> > >
> > > Considering that ARM_SCMI_PROTOCOL can be enabled through COMPILE_TEST,
> > > and OF is now available on architectures, I think this dependency is
> > > needlessly complex and these drivers could simply use:  
> >
> > ... my guess is that ARM_SCMI_PROTOCOL does NOT explicitly depends on OF
> > simply because it depends on ARM|ARM64 which have an implicit OF dependency...
> > ....indeed in order to use the SCMI stack you need OF...
> >
> > ...not saying that this is right....just trying to interpret here...
> > ...on the other side for these reasons, if you dont have OF implicitly from
> > the arch, you cannot COMPILE_TEST the SCMI stack without OF, so the
> > complex dependency
> >
> > Probably this should be done better in Kconfig...but lets see if Sudeep
> > can correct me...
> 
> Commit e517dfe67480 ("firmware: scpi: add CONFIG_OF dependency") is the
> one that I copied to SCMI as well as we wanted  COMPILE_TEST coverage on
> SCMI as well. As per the commit, !OF will give some warnings for COMPILE_TEST
> which the above commit addresses. It is just copy of that you see in SCMI
> as SCMI replaced the old SCPI and is used more widely and had more framework
> support, hence you will find it at more places than SCPI.
> 
> Hope that explains, happy to take a deeper look if you have or find issues
> with the way it exists today.

Thanks for the explanations. It makes sense now. That being said, I
believe that the same dependencies would be better expressed as:

depends on OF
depends on ARM_SCMI_PROTOCOL || COMPILE_TEST

because 1* the code technically needs OF to build, and 2* these
drivers are only useful on kernels which have ARM_SCMI_PROTOCOL, unless
build-testing. The result would be the same as what we have now, but
the intentions would be clearer and the correctness more obvious IMHO.

-- 
Jean Delvare
SUSE L3 Support

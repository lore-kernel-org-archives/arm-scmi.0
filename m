Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD15F3E716F;
	Wed, 27 May 2026 09:20:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779873652; cv=none; b=WgLQhd1+FLABCQz9Bu78YSynXgBY1yX2cFMl+BsxwE8idVuThyysf3Pssk0Cs198Jj5fwO2N5BmffEumFr69Cctsj/CvFpjloDT7cth8fMQcAVihHSNSU/Hp1CmPL7hwl/umZ4H2i2MVsGb4gPvn2yKi13MzzC7WABpky8IUxjk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779873652; c=relaxed/simple;
	bh=94a9pze74GW4P0TRuIGSfkQOwWRewb8Bo4Va+6E+0gQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OkHVQGN/7O3d37+CwuuRkL6QGhQOpJWXbYl6YeRVq8pPsENjl8yk5RQZ6S5O8LGcPYmfYbLpQOIPyflpwKju8HG6dgVDxL896+1ddn+JE5cPhLcz86h0270s3C772m5UIBr8Kvg5bvB5K8vEpk1c0OlbzfUVKb/EQ+dt21zKpnQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BDwEATUA; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BDwEATUA"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B6BF11F000E9;
	Wed, 27 May 2026 09:20:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779873648;
	bh=BT9+oU/cNR1uwwYCBK9wtqRUevMJmNyMkvw+gKM/JZs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=BDwEATUAsKocB0ms53S782vGeKroChaJ1jHdkqySX/Uo5vdtFWtMMU19H23sKaRBy
	 kD+A5qJzoxFUwjDycnF4CZYiBZORXP20dR7q8CAQ530mJpWO4rbhv3RClhXpjXnBS6
	 h0ACYHhi2XXHf9NOOb9kkYBfDrwAHI/JDLYERGMQeF5l61jYXTVo0eUcYs7gXDbV2A
	 wzwIE/w8ZA5tJF8hpitKFSpn5+Jx7pejKyAr4Uu2/ApcvnqWG8HAfFHl/CKRaKer9Q
	 WYOSfNHgjg/iWn5oFWoj9dqt/dioVr9F73aKFzr14/12Ggvy4D3hJkFpSeAxvHOkQv
	 D7vr256TQE2nA==
Date: Wed, 27 May 2026 10:20:45 +0100
From: Sudeep Holla <sudeep.holla@kernel.org>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Cristian Marussi <cristian.marussi@arm.com>, arm-scmi@vger.kernel.org,
	Sudeep Holla <sudeep.holla@kernel.org>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] firmware: arm_scmi: Fix OOB in scmi_power_name_get()
Message-ID: <20260527-invaluable-crystal-hamster-eedfc1@sudeepholla>
References: <75caae28bdffb55199a0bc6cac5df112a966c608.1778838987.git.geert+renesas@glider.be>
 <20260521-loutish-lurking-koel-229bd9@sudeepholla>
 <CAMuHMdWA1UpZSiN26fd71LUMYatVOwJos6bGb4zR0bnPUqBF8w@mail.gmail.com>
Precedence: bulk
X-Mailing-List: arm-scmi@vger.kernel.org
List-Id: <arm-scmi.vger.kernel.org>
List-Subscribe: <mailto:arm-scmi+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:arm-scmi+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMuHMdWA1UpZSiN26fd71LUMYatVOwJos6bGb4zR0bnPUqBF8w@mail.gmail.com>

On Fri, May 22, 2026 at 09:56:32AM +0200, Geert Uytterhoeven wrote:
> Hi Sudeep,
> 
> On Thu, 21 May 2026 at 18:26, Sudeep Holla <sudeep.holla@kernel.org> wrote:
> > On Fri, May 15, 2026 at 11:59:15AM +0200, Geert Uytterhoeven wrote:
> > > scmi_power_name_get() does not validate the domain number passed by the
> > > external caller, which may lead to an out-of-bounds access.
> > >
> > > Fix this by returning "unknown" for invalid domains, like
> > > scmi_reset_name_get() does.
> > >
> > > Fixes: 76a6550990e296a7 ("firmware: arm_scmi: add initial support for power protocol")
> > > Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> > > ---
> > >  drivers/firmware/arm_scmi/power.c | 6 +++++-
> > >  1 file changed, 5 insertions(+), 1 deletion(-)
> > >
> > > diff --git a/drivers/firmware/arm_scmi/power.c b/drivers/firmware/arm_scmi/power.c
> > > index 3aa84ceb6d2bab68..4a7215e02dec035d 100644
> > > --- a/drivers/firmware/arm_scmi/power.c
> > > +++ b/drivers/firmware/arm_scmi/power.c
> > > @@ -204,8 +204,12 @@ scmi_power_name_get(const struct scmi_protocol_handle *ph,
> > >                   u32 domain)
> > >  {
> > >       struct scmi_power_info *pi = ph->get_priv(ph);
> > > -     struct power_dom_info *dom = pi->dom_info + domain;
> > > +     struct power_dom_info *dom;
> > > +
> > > +     if (domain >= pi->num_domains)
> > > +             return "unknown";
> >
> > The only user of this function must not call it for domain >= pi->num_domains.
> > However, I am thinking if it is bit inconsistent within SCMI core now. I like
> > the way pinmux/ctl handles this as I don't like the alternative for this
> > (i.e. ERRPTR(-EINVAL or something)). Worst case if this ever causes issue
> > we can change the signature of the scmi_{power,reset}_name_get to follow
> > something like pinmux and update the users. Thoughts ? Happy to apply this
> > for now.
> 
> You mean returning an int error code using return statements, and
> returning the objects using passed function pointers?
> 

Yes I was thinking so, scmi pinmux seem to follow that.

> Depends on the number of returned objects: if it's just one (e.g. a
> name or info pointer), then the valid pointer/error pointer idiom is
> very common in Linux.
> 

Makes sense, I have applied it now. Thanks!

-- 
Regards,
Sudeep

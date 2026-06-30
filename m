Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 466E53655CB
	for <arm-scmi@vger.kernel.org>; Tue, 30 Jun 2026 09:01:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782810065; cv=none; b=PX2NMeODkWNwxY+fF4a0I6ggve+JgrvFZy1Opg0n7jHdABlY/GX+h1+nL4m0uagFr+LvOpMKMqSbsbNst56fZXprGmbe8DisHyN0GYzkuMAzi4yuszb4jlx642Nh1Dnl8YWWCfQfeIzrdw8WgfKACHZSFk+/J57RO6sT6i8KpwQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782810065; c=relaxed/simple;
	bh=hw28kXQDQilWmpLf09HfqOUYvSkgwfivLUeqL+CF6rU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jCKzy3/SYKcf02R26ffUE/IFCZ9w9ykw6wC7csGEu+jD5JN0tl1N1MeLKKdf7SePrKj9Q0Nk3MlXyn0X2ANvuBNE7CxMT7HbyNIBOWT0OR5vO7aCHZzxfGgHTXOBeAsvx9Qu0JAuEx4nfPcf2YcKCszyGC1pSdpxW87RiYhtxyI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VwFJwTcp; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VwFJwTcp"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7E63F1F000E9;
	Tue, 30 Jun 2026 09:01:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782810064;
	bh=naG5PlxLVgPyS7rLLqwJp+yuZaF+Q0JszciOx0a6t28=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=VwFJwTcpeaux1KvyfCkxoK5/xyitkXeG9wGRwAL5dYvUinkNNU7OD6TCg1COyxH9l
	 5RaKR4EAMtc8Tjltn0EVY/+0YAa3zs1joyylj0WCganhlktJpHRBtoNOnKorc8MILD
	 41lL/Yi4uRTpzTWVQVWinUdXsc2vePEYrTACwJ+G3TDndZLarfIPNyNB3jg9HlU7M9
	 45vZYW2xqamIE3A26ctmYm5gfqrKl9QkL2i05mCD9zTPH413QwuEobSMKVQbK5Pclj
	 yD7iN74Kg+h7RJrioqkOI+Oovvz6gsiHP93wvo7p7yzLuqWB9tQhAmLNXclNDpX7cK
	 o6pGt8OS3J2+w==
Date: Tue, 30 Jun 2026 10:01:01 +0100
From: Sudeep Holla <sudeep.holla@kernel.org>
To: Rosen Penev <rosenp@gmail.com>
Cc: arm-scmi@vger.kernel.org, Sudeep Holla <sudeep.holla@kernel.org>
Subject: Re: [PATCH] firmware: arm_scmi: simplify some allocations
Message-ID: <20260630-pillbug-of-major-brotherhood-ca55f7@sudeepholla>
References: <20260608050724.6358-1-rosenp@gmail.com>
Precedence: bulk
X-Mailing-List: arm-scmi@vger.kernel.org
List-Id: <arm-scmi.vger.kernel.org>
List-Subscribe: <mailto:arm-scmi+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:arm-scmi+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260608050724.6358-1-rosenp@gmail.com>

On Sun, Jun 07, 2026 at 10:07:24PM -0700, Rosen Penev wrote:
> Use flexible array members to combine allocations and remove kcalloc
> usage.
> 
> Add __counted_by where appropriate for extra runtime analysis. Move
> counting variable assignment after allocation before any potential array
> access.
> 
> Signed-off-by: Rosen Penev <rosenp@gmail.com>
> ---
>  drivers/firmware/arm_scmi/notify.c | 42 ++++++++++++------------------
>  1 file changed, 16 insertions(+), 26 deletions(-)
> 
> diff --git a/drivers/firmware/arm_scmi/notify.c b/drivers/firmware/arm_scmi/notify.c
> index 40ec184eedae..45cbb3d2d684 100644
> --- a/drivers/firmware/arm_scmi/notify.c
> +++ b/drivers/firmware/arm_scmi/notify.c

[...]

> @@ -722,12 +725,6 @@ scmi_allocate_registered_events_desc(struct scmi_notify_instance *ni,
>  		return ERR_PTR(-ENOMEM);
>  	pd->eh_sz = eh_sz;
> 
> -	pd->registered_events = devm_kcalloc(ni->handle->dev, num_events,
> -					     sizeof(char *), GFP_KERNEL);
> -	if (!pd->registered_events)
> -		return ERR_PTR(-ENOMEM);
> -	pd->num_events = num_events;
> -
>  	/* Initialize per protocol handlers table */
>  	mutex_init(&pd->registered_mtx);
>  	hash_init(pd->registered_events_handlers);
> @@ -800,14 +797,11 @@ int scmi_register_protocol_events(const struct scmi_handle *handle, u8 proto_id,
>  				     GFP_KERNEL);
>  		if (!r_evt)
>  			return -ENOMEM;

Look at Sashiko's report[1].

  |  Does this allocation leave enough room for the flexible array?
  |  Now that sources has been converted to a flexible array member in
  |  struct scmi_registered_event, sizeof(*r_evt) will not include space
  |  for it. Should this be updated to use struct_size(r_evt, sources,
  |  num_sources)?
  |  Without allocating space for the flexible array, the later call to
  |  refcount_set(&r_evt->sources[id], NOTIF_UNSUPP) in this function
  |  will result in an out-of-bounds heap write.

I think you need the below diff as well.

Regards,
Sudeep


[1] https://sashiko.dev/#/patchset/20260608050724.6358-1-rosenp@gmail.com

-->8
diff --git i/drivers/firmware/arm_scmi/notify.c w/drivers/firmware/arm_scmi/notify.c
index 45cbb3d2d684..3abf7a28ff7e 100644
--- i/drivers/firmware/arm_scmi/notify.c
+++ w/drivers/firmware/arm_scmi/notify.c
@@ -793,7 +793,8 @@ int scmi_register_protocol_events(const struct scmi_handle *handle, u8 proto_id,
                int id;
                struct scmi_registered_event *r_evt;

-               r_evt = devm_kzalloc(ni->handle->dev, sizeof(*r_evt),
+               r_evt = devm_kzalloc(ni->handle->dev,
+                                    struct_size(r_evt, sources, num_sources),
                                     GFP_KERNEL);
                if (!r_evt)
                        return -ENOMEM;


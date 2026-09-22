Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72E0D3F6C4D;
	Tue, 22 Sep 2026 13:44:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790084700; cv=none; b=DOXQ4rpekhcawl/t8E22CvSu7iBzsB+A64B28VFiQxMcD1ytJtIAebDYkufDCS4k4rIRh1d+XTgz9BTTOjq+x+JFFyOXt7XNECkK/incndoX+6QR2qFPegUV9y+MOI0JZYH9UNNbIp00K6OpqhVuhLLaEvZpzJQPdimaVowI+sw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790084700; c=relaxed/simple;
	bh=Isi/XSz2XLB9elZLIuiT8+/gbeZBkYKpUNwCABDOIL8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=S4pZJoMXIyZ+mEbOnnPQNi3Xj9dSXmusNWnmKgG4VWQZTbj3/IdTzQZwj6GoRS190NPXJRmPcllmDqPvLrT17UT2Ge54uecO+6ENVKXbEGFAsZ9LyGA8+WAOEilIQNS/pNhE8m8r/WNMnrsTr96KSLFVYldRi0tOaodq7mG55hw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=A6by66Bt; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="A6by66Bt"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4D71F1F00893;
	Tue, 22 Sep 2026 13:44:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790084699;
	bh=tqTKHOB40XcCnMBIfF1XOtz8msytKJ8dl2VlRBxSVUo=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=A6by66Btcq0oxxz6XeUnbBptKL6e7P+vKxTSRd8BiR1vXllfVIL1v8yZ/52/UBbbY
	 eAeuXgtI67QiZjmag3TyE6JzFmm1WtUJkI3YZDtBbo0+V8tEOaPK5+Y8peTNt3kKhn
	 TDdNcW/gaZUQ8qZIviAfUdAVZ3OdT27z+5hPOts2aH/KSViaGseor1uECKJvjYAeTf
	 Sel3yL7Z+cX6B+iQf31Cn/yYU+7u3hvoeQ2z0MXaQS8i5RxA9x3xq+dsfhWdVoCIat
	 t321ThOK0x8hwvJ6weWtwpF0M/tMmQBWLDVzFcdub4xhDOyM7K5ICt0TKlC1n8oZy+
	 Bm9WFvk5XK+xA==
Message-ID: <c80354c7-0153-4a82-a9a1-9e2fd2929449@kernel.org>
Date: Tue, 22 Sep 2026 15:44:48 +0200
Precedence: bulk
X-Mailing-List: arm-scmi@vger.kernel.org
List-Id: <arm-scmi.vger.kernel.org>
List-Subscribe: <mailto:arm-scmi+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:arm-scmi+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v12 03/25] firmware: arm_scmi: Introduce protocol instance
 notifiers
To: Cristian Marussi <cristian.marussi@arm.com>,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 arm-scmi@vger.kernel.org, linux-doc@vger.kernel.org
Cc: sudeep.holla@kernel.org, james.quinlan@broadcom.com,
 f.fainelli@gmail.com, vincent.guittot@linaro.org, etienne.carriere@st.com,
 peng.fan@oss.nxp.com, michal.simek@amd.com, d-gole@ti.com, jic23@kernel.org,
 elif.topuz@arm.com, lukasz.luba@arm.com, philip.radford@arm.com,
 souvik.chakravarty@arm.com, leitao@kernel.org, kas@kernel.org,
 puranjay@kernel.org, usama.arif@linux.dev, kernel-team@meta.com,
 Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>
References: <20260920091928.2014972-1-cristian.marussi@arm.com>
 <20260920091928.2014972-4-cristian.marussi@arm.com>
From: "David Hildenbrand (Arm)" <david@kernel.org>
Content-Language: en-US
Autocrypt: addr=david@kernel.org; keydata=
 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
 qIws/H2t
In-Reply-To: <20260920091928.2014972-4-cristian.marussi@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 9/20/26 11:19, Cristian Marussi wrote:
> SCMI Protocol notifications are typically used by SCMI drivers to detect
> and react to particular conditions: this was the assumption and the classic
> usage scenario upon which the SCMI notification framework was built.

Was the paragraph supposed to start with "SCMI notifications" ? Because later
you describe how some protocols might want to reuse the "existing SCMI
Notifications machinery", and here you talk about the traditional usage.

> -	mutex_lock(&info->protocols_mtx);
> -	pi = idr_find(&info->protocols, protocol_id);
> +	scoped_guard(mutex, &info->protocols_mtx) {
> +		pi = idr_find(&info->protocols, protocol_id);
> +		if (pi) {
> +			refcount_inc(&pi->users);
> +		} else {
> +			const struct scmi_protocol *proto;
>  
> -	if (pi) {
> -		refcount_inc(&pi->users);
> -	} else {
> -		const struct scmi_protocol *proto;
> +			/* Fails if protocol not registered on bus */
> +			proto = scmi_protocol_get(protocol_id, &info->version);
> +			if (!proto)
> +				return ERR_PTR(-EPROBE_DEFER);
>  
> -		/* Fails if protocol not registered on bus */
> -		proto = scmi_protocol_get(protocol_id, &info->version);
> -		if (proto)
>  			pi = scmi_alloc_init_protocol_instance(info, proto);
> -		else
> -			pi = ERR_PTR(-EPROBE_DEFER);
> +			if (IS_ERR(pi))
> +				return pi;
> +
> +			proto_notifier_nb = READ_ONCE(pi->pno.nb);
> +		}
> +	}
> +
> +	if (proto_notifier_nb) {
> +		if (scmi_protocol_notifier_register(pi->handle, &pi->pno))
> +			dev_warn(handle->dev,
> +				 "Failed to register protocol notifier\n");


	if (proto_notifier_nb &&
	    scmi_protocol_notifier_register(pi->handle, &pi->pno))
		dev_warn(handle->dev, ...)

As we dropped the mutex, I assume somebody else could move ahead and
refcount_inc(&pi->users) + return before the notifier was registered? Is that
expected?


>  	}
> -	mutex_unlock(&info->protocols_mtx);
>  
>  	return pi;
>  }
> @@ -2366,13 +2398,35 @@ int scmi_protocol_acquire(const struct scmi_handle *handle, u8 protocol_id)
>  void scmi_protocol_release(const struct scmi_handle *handle, u8 protocol_id)
>  {
>  	struct scmi_info *info = handle_to_scmi_info(handle);
> +	struct notifier_block *proto_notifier_nb = NULL;
>  	struct scmi_protocol_instance *pi;
>  
> -	mutex_lock(&info->protocols_mtx);
> -	pi = idr_find(&info->protocols, protocol_id);
> -	if (WARN_ON(!pi))
> -		goto out;
> +	scoped_guard(mutex, &info->protocols_mtx) {
> +		pi = idr_find(&info->protocols, protocol_id);
> +		if (WARN_ON(!pi))
> +			return;
>  
> +		/*
> +		 * If a protocol notifier was registered and this is the
> +		 * last istance releasing the protocol, mark the notifier

s/istance/instance/

> +		 * for un-registration: note that the notifier itself counts
> +		 * as one user, as for any other regular notification, so if a
> +		 * protocol notifier is registered and there are only 2 users
> +		 * active we can derive that this is the last protocol
> +		 * instance de-registering.
> +		 */
> +		if (scmi_protocol_notifier_registered(&pi->pno) &&
> +		    refcount_read(&pi->users) == 2)
> +			proto_notifier_nb = READ_ONCE(pi->pno.nb);
> +	}
> +

We drop the mutex now temporarily. What happens if another instance gets
registered (incrementing &pi->users) just after we dropped the lock and
unregister the notifier?

Shouldn't we care about that or why is it ok?

-- 
Cheers,

David

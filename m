Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05535558207;
	Tue, 22 Sep 2026 13:16:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790082968; cv=none; b=od0vjX5mt6Jvumi+DdtD3GLaOYI4nxw8ajaUR8royW2euwVhG4uE5v+ZUfjeopS02abNP3IJ4K+DnzTOVVeoMnJFINmMsAGQtcWWCh86DaAPTQi/VvVyeE0hu9OC613eYw7RXkNKk3B+cCecBoz/z1Dtv32QNAvNkOoqekyI1HY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790082968; c=relaxed/simple;
	bh=rf2jxPL/tOIqv6yozLftHFt6g3h6WjQ39OaZrMek0iY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=k79R0X6Vtf5Fofr7omP8p+OY0+1xzg/HCc8zXXKIKtN9ume595drlG2crUKtyZyXZpKoCPCoCkl0qWAPF2Zzn+ei5ibb+sBPkkHPYLWkKvryVSSCQJATBPIPC99DomHjsqsb07CVcgAC+VTkuZ3CQLUvn8d0VBFjP2dA5hsRwCY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Q/dBf3NT; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Q/dBf3NT"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CDD861F000FF;
	Tue, 22 Sep 2026 13:16:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790082966;
	bh=CpoW39srNxONPYDDUz/TIq2+ZKIxJUqkkB951WdQmPQ=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=Q/dBf3NT/Ww+wRcc5uIHgrhtruBIFGlacnFvR7ih8VMAa7hijobiF9dvVF7dhvzZl
	 n39/4D1yuLsOy1Ul9HczA19TRaq0OArc3EocFRog4HWjQg46B93Jsnz1nVFzMJ4zNN
	 ELWifKxNMlpGjDhfVWJ2HyvpFVRg3yFsj+h+VfwlDBPTFcnhF6kPqgwDXAO3WkEeG1
	 ei10QNgeiD1sj5fFTk7IO75osGIsVO0jTCdukJ30XsTym+1VUSNjAnyy3B+RJKXhm9
	 b3/iN7ikP8P4ZLatk5n9VpJzC1lCEd6+fobw95uX8hsZbBZ38q4WTrUu+zjnYXqIbz
	 TLzAQpbyGxjlQ==
Message-ID: <2135509e-2689-4258-ab00-011d47f4b172@kernel.org>
Date: Tue, 22 Sep 2026 15:15:55 +0200
Precedence: bulk
X-Mailing-List: arm-scmi@vger.kernel.org
List-Id: <arm-scmi.vger.kernel.org>
List-Subscribe: <mailto:arm-scmi+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:arm-scmi+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v12 02/25] firmware: arm_scmi: Allow registration of
 unknown-size events/reports
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
 <20260920091928.2014972-3-cristian.marussi@arm.com>
From: "David Hildenbrand (Arm)" <david@kernel.org>
Content-Language: en-US
Autocrypt: addr=david@kernel.org; keydata=
 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
 qIws/H2t
In-Reply-To: <20260920091928.2014972-3-cristian.marussi@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 9/20/26 11:19, Cristian Marussi wrote:
> Allow protocols to register events with build-time unknown sizes: such
> events can be declared zero-sized and let the core SCMI stack perform the
> needed safe-net boundary checks based on the configured transport size.

ok, so we have a maximum message size defined by the transport. We'll use that
as payload size, and the report size just gets the additional ktime_t.


>  	pd = scmi_allocate_registered_events_desc(ni, proto_id, ee->queue_sz,
> @@ -807,7 +821,8 @@ int scmi_register_protocol_events(const struct scmi_handle *handle, u8 proto_id,
>  		mutex_init(&r_evt->sources_mtx);
>  
>  		r_evt->report = devm_kzalloc(ni->handle->dev,
> -					     evt->max_report_sz, GFP_KERNEL);
> +					     evt->max_report_sz ?: max_report_sz,

Having two similarly named variables is a bit confusing. I wonder if you can
somehow make it clearer in the latter case that it is the max_report_sz
according to the transport.

> +					     GFP_KERNEL);
>  		if (!r_evt->report)
>  			return -ENOMEM;
>  
> diff --git a/drivers/firmware/arm_scmi/notify.h b/drivers/firmware/arm_scmi/notify.h
> index f18f98c5ab3b..c2eb4844c7db 100644
> --- a/drivers/firmware/arm_scmi/notify.h
> +++ b/drivers/firmware/arm_scmi/notify.h
> @@ -18,8 +18,12 @@
>  /**
>   * struct scmi_event  - Describes an event to be supported
>   * @id: Event ID
> - * @max_payld_sz: Max possible size for the payload of a notification message
> - * @max_report_sz: Max possible size for the report of a notification message
> + * @max_payld_sz: Max possible size for the payload of a notification message.
> + *		  Set to zero to use the maximum payload size allowed by the
> + *		  transport.

"maximum payload size" is ph->hops->get_max_msg_size(ph) ? Should we call this
"maximum message size" then?

> + * @max_report_sz: Max possible size for the report of a notification message.
> + *		   Set to zero to use the maximum payload size allowed by the
> + *		   transport plus the additional ktime_t timestamp.

Same here.

-- 
Cheers,

David

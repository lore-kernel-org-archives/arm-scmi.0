Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A25F3019C9
	for <arm-scmi@vger.kernel.org>; Fri, 15 Aug 2025 13:14:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755263644; cv=none; b=mT0W9kCC4VOh505iZ+uIKEwg/F3wbDLsJ0zSb9w2Q+Lq8X0+lxm6KEycmbJ7YvBIO7X8PjTbXP6zY6p49p0KtlWBMl9YfR8DT+a7nGe31hcpLJTrThLRNvKaP1iQiFUpDEiVJDsZV7Pn5xZExIma6l+OqMAaY9f+w+z7CEkHQVo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755263644; c=relaxed/simple;
	bh=aDTuk3M3dnlTn+CYUcvmx4uCcGqPjuQSOHcwS0mGbYU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=l/YRXedkzFbvJqh9NwQ/omiE5zkuXFpWCX5Z9FQzgDjCPllFOfQqqzwosI+u/mrikIvTOliO+zFFGl1t0x+um+UvkJ1rYs7mZ0omrSArrSTgQS6/mCFiHb/uNNnHjY5yp5Q7PDFx8SZin0E6l5qy48KMhBNcBPp2OvCo5e+PNfw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=VFRTSx5v; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="VFRTSx5v"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-45a15fd04d9so19396355e9.1
        for <arm-scmi@vger.kernel.org>; Fri, 15 Aug 2025 06:14:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1755263641; x=1755868441; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=aWVd3a6QjlDIBu/GZcAsaGjfMi/nlIyITb4lz5jcIMk=;
        b=VFRTSx5vOjyiiu/sX3teVTJsO96X0avxm0h1/PiV6emeK31o9GKq3EJtJqURzYNkl4
         qOqUWT1og4tF9Q+XeKtvzBBT+kgQz/78/pFNDrSZvgNUQT7XuQib6zd76mKGE1Cck0IB
         /C42bIk6GyrE2Y54193qvnmbAc79hcHv+9GGBZUB4KQZrE9vIA+mCtHj9GoO+6gt2MRn
         adsHHQXl9h2xFuSsa3qv4WKoNEAJLAAdpk4xmiBmxQfamJLvImdwOUaDXE1Y60XYm0v9
         e329cM8Azc2gEqZVKzW+73gTKZ9J/IrcpdOOxyidAfFX3W02MSZLLHx3avUy1XKoKB4t
         brgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755263641; x=1755868441;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aWVd3a6QjlDIBu/GZcAsaGjfMi/nlIyITb4lz5jcIMk=;
        b=jni7VOzXJaiAa7ogbb7WJrmZKzTkLuEr6f434tAiNxKFQg1u1CxFYXM9BPaMjg4rIO
         5553h1VI4EkpBBG4T/0rutr5KVLlulebICgxkDgIXxI+eFyj+sYO+4WI2s98GrYdTHTY
         zNBkadRfjJ3t0pu4RqZtpc61n2tehoruuxvqxGpuORGiTt87AgPsF91WzguO+Ek9DmVt
         ZaJQb73BzwJHHbezdEIsdubSkgC7lATcwI/13cZPHitQsf0Y5G2EwvKd9zgiiTRsr7yB
         T+dn5mF9ZMR+JAyObwA4VDFMVL+mjW7HDBPt22CLA9WgMyOam1RcJ5gSFJyysNvV3wH8
         eTjQ==
X-Forwarded-Encrypted: i=1; AJvYcCWph/wAi1TrhQisPmF9Mh3+dAGLv12MNEdNWzuuUx5go5KzkcJpnV155zUzy/j7nyLBY1QHhGdy7Q==@vger.kernel.org
X-Gm-Message-State: AOJu0YxKZT+dkK3M2FqCN5xv3bAt+v9ArgE4Ij1x4rYeSqjWLuiAYlIO
	CCub6As5Or7+zBslbwqjM0xCDyrhp5D5+68y04B3OflyMfMwOtVxeVrzZnUEYwVQKTY=
X-Gm-Gg: ASbGncsDRUEUBIQTT9oeU0w8IbhYIMjSQDj+mp6PLGzMouv+Af2hBSmzXZSjFl5xSNQ
	XHpiKsPoN9EOlW7652MqIeqCOW21VcsizH6J3VVmu6jhYwtRqc+T/4Hh5RxPlV89Y+wOwXh9DNY
	OYaNMeczDhGmJQ4VRM8WSXVWdA9Rum70boRkReWXYixhyku6XCrIMI70FeVWsVJUx3hwsvVZFWa
	bTjfsriASCsgLntw4fyvv6Fr6UXeuvX9peeoR1g6ZeRxbiy9L4V33PQydD0i0ybs6J+h9TqhI6A
	iALdJJtb/cJXuEu+Ok6sxGYPiXbGkwpx0jotZzsQ4jS0mDGhPXSlh2eyY8T53czc1zlzrrx21dk
	VKypk3UOBtXMO+qNcfkWX5dUpoH4=
X-Google-Smtp-Source: AGHT+IEGkzA5H/8XCgBmKZzZLui8cTS/0lu1L381PDJX0bf2RM2IKP9iCXo6EURHpv4ew13E3k7NJA==
X-Received: by 2002:a05:600c:3502:b0:459:443e:b18a with SMTP id 5b1f17b1804b1-45a21859687mr19402065e9.14.1755263641313;
        Fri, 15 Aug 2025 06:14:01 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-45a1b1d4212sm37507125e9.0.2025.08.15.06.14.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 Aug 2025 06:14:00 -0700 (PDT)
Date: Fri, 15 Aug 2025 16:13:57 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Cristian Marussi <cristian.marussi@arm.com>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	arm-scmi@vger.kernel.org, linux-pm@vger.kernel.org,
	sudeep.holla@arm.com, james.quinlan@broadcom.com,
	f.fainelli@gmail.com, vincent.guittot@linaro.org,
	etienne.carriere@st.com, peng.fan@oss.nxp.com, michal.simek@amd.com,
	quic_sibis@quicinc.com, d-gole@ti.com, souvik.chakravarty@arm.com
Subject: Re: [PATCH 3/8] firmware: arm_scmi: Refactor powercap domain layout
Message-ID: <aJ8ylY6jjS70z8lL@stanley.mountain>
References: <20250813114609.1305571-1-cristian.marussi@arm.com>
 <20250813114609.1305571-4-cristian.marussi@arm.com>
Precedence: bulk
X-Mailing-List: arm-scmi@vger.kernel.org
List-Id: <arm-scmi.vger.kernel.org>
List-Subscribe: <mailto:arm-scmi+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:arm-scmi+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250813114609.1305571-4-cristian.marussi@arm.com>

On Wed, Aug 13, 2025 at 12:46:04PM +0100, Cristian Marussi wrote:
> @@ -486,7 +514,7 @@ static int scmi_powercap_xfer_pai_get(const struct scmi_protocol_handle *ph,
>  }
>  
>  static int scmi_powercap_pai_get(const struct scmi_protocol_handle *ph,
> -				 u32 domain_id, u32 *pai)
> +				 u32 domain_id, u32 cpl_id, u32 *pai)
>  {
>  	struct scmi_powercap_info *dom;
>  	struct powercap_info *pi = ph->get_priv(ph);
> @@ -495,8 +523,11 @@ static int scmi_powercap_pai_get(const struct scmi_protocol_handle *ph,
>  		return -EINVAL;
>  
>  	dom = pi->powercaps + domain_id;
> -	if (dom->fc_info && dom->fc_info[POWERCAP_FC_PAI].get_addr) {
> -		*pai = ioread32(dom->fc_info[POWERCAP_FC_PAI].get_addr);
> +	if (cpl_id > dom->num_cpli)

This gets fixed later in the series but it should be >=.

regards,
dan carpenter

> +		return -EINVAL;
> +
> +	if (dom->cpli[cpl_id].fc_info && dom->cpli[cpl_id].fc_info[POWERCAP_FC_PAI].get_addr) {
> +		*pai = ioread32(dom->cpli[cpl_id].fc_info[POWERCAP_FC_PAI].get_addr);
>  		trace_scmi_fc_call(SCMI_PROTOCOL_POWERCAP, POWERCAP_PAI_GET,
>  				   domain_id, *pai, 0);
>  		return 0;


Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B68AF212B25
	for <arm-scmi@vger.kernel.org>; Wed, 22 Jan 2025 12:41:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737549708; cv=none; b=pvWWXFmT+7JHrSniPNQS1aDoJy5O49HmolQQNcK9E9zWeB/QmwQZTkMK0uYyueiWWi1PZPPtEBH4/hhVGxsJkYGWqnRxLKlZW35EukkKNWJPuSt8IfuVSJDfmuYhOl0kLsY3Subzt7SuQbZmEOAMdJRXsirH7UNf5W3N4XRwbFM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737549708; c=relaxed/simple;
	bh=gvmqpricEpcg0Aj9+/F7NuMM8j4Q1897JU9gOAgFPL8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QSngEjMwrW45kp73rAZYmSaPiQQLMDwiLQxpt8k8+FG2ma4Nl2NGVRu7pibacNWOKKs7sTxy2THzbD6pcdgSPl/dPcVHF/Da8mTUIFXZI/OYEc1X3baD96yxbY00Ngro9bWHZw8LD5dbvrwE0QpewdGfg2SIUzBOBalEoUSl2jA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=h24IWfox; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="h24IWfox"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-436249df846so47032365e9.3
        for <arm-scmi@vger.kernel.org>; Wed, 22 Jan 2025 04:41:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1737549705; x=1738154505; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=pqkiUxCJwEipzWMbLEZbrYeDUBAJLus2EzOeMcJUspI=;
        b=h24IWfox3GdaHriYYXetYiyXgPcldy5B5T2EoOyDtwVCMSSqDDhHmwlneVd1jNJHTg
         zqZYZWGUV4U/CSaR3xiMSMcbGuQHxPx38rNy0+DB2q6ZkxFpzvQYwH+EuY85mcFlzPH7
         Vo6H7w8sQe1xa8G1RTTmVf77QN4WeCTL/QUQOrSGUcjkt5f6as/1vU8tNTg2NxuAbw6p
         P/oP1vpUMLsHw+S+VHeG50Mf6mNubnVFZBxwdAoS1HNLvKM3jvVwIDflnX/N3KYS83Gg
         E92LwxyMuAqzSN70niH91yY1WJiuZGhiuJmep0Jb2U9hij6pQFZ6TSnwCq8rGgzWZMjw
         cOfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737549705; x=1738154505;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pqkiUxCJwEipzWMbLEZbrYeDUBAJLus2EzOeMcJUspI=;
        b=vNed51+p8wSVXfsNZhjpLhnFllu+s6GzE4FKDoKxMgDcrYVD9htwg3B+i03YWqoH6V
         hoHfz6jN+LoKAZW/kB45DHsKfW4kmaMHlN+85CWyzw8D3w/+o0INZPAaj4l3Am4D+Yf/
         lyeFCC3IGfjT97XoKmNZ2BN5WFnjMTusW0WgT+W/iPkvr7R2H8rB0leGUrGRVSKRKpw2
         /5EFZ33aqHzQOuN/hNIY3NElWDekmKyGy2Iw8akhkoE/i1dQbgRo336bEh7+sOEEIHmo
         UPiVV6Hnbu3rPUD0yYMijjrrLMskrtnC57uj2cQZDAonguBMu49si7V5VP2m6MI1C0d2
         U7FQ==
X-Forwarded-Encrypted: i=1; AJvYcCU36B3j3Tl5DjthDdeWhURF+GskAYwUHtBHM44ib+MQlFpN/xHrn45lqAB42ONTpX6AuIYR4a2Xdw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw2wONkeovKJqeB8zzqrNf9Au7psWAPQ7oNwAdAMdhasLoK1Wsv
	fsubSrDS4qlekPMaMbf1HSNYSeUhWCuzTsysG3DcIFzDhKjNQGtoD/a+Ul6ivI4=
X-Gm-Gg: ASbGnctr9tQp3WTYG6pmfRozcRBoGe49VXEGcHMmKl8ra4QoUCwYnlWDprh3+3oRfyF
	zBb8mpG0ulZOn8pIc4b2TVZIcYyrwgm//VvmQPGsaU0yXFhcJKBobnFpmjDWeZ+P96SwNi31Egh
	j6/txk/KLAkb/YiqUKzZvoEmXOHeM2IRxACMeT/1+yKtH0vXc198qmRvdP6bZhyuBGpoTZuGwa3
	2Vx00uC4VJayL1i6PUKHCc/PaNFb0JId9SMn4fq8VYkFqf6RIhfxOP3c4DN6VFXANsfT+wBurs=
X-Google-Smtp-Source: AGHT+IEA2+PefGbBDd9kf5Ode3Is1wr6+YVdf3H9X/PUUkYizot9mKm50rI9cF5I9tp7GaNN+guivw==
X-Received: by 2002:a05:600c:1d28:b0:434:9f81:76d5 with SMTP id 5b1f17b1804b1-43891434081mr186013305e9.22.1737549705023;
        Wed, 22 Jan 2025 04:41:45 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-438b3124a14sm23456405e9.0.2025.01.22.04.41.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Jan 2025 04:41:44 -0800 (PST)
Date: Wed, 22 Jan 2025 15:41:41 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Cristian Marussi <cristian.marussi@arm.com>
Cc: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>,
	Sudeep Holla <sudeep.holla@arm.com>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, linux-kernel@vger.kernel.org,
	arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	imx@lists.linux.dev, Peng Fan <peng.fan@nxp.com>
Subject: Re: [PATCH 2/5] firmware: arm_scmi: imx: Add i.MX95 CPU Protocol
Message-ID: <ac1a1ebe-ef97-42a2-a2be-529a656a7706@stanley.mountain>
References: <20250121-imx-lmm-cpu-v1-0-0eab7e073e4e@nxp.com>
 <20250121-imx-lmm-cpu-v1-2-0eab7e073e4e@nxp.com>
 <3b9a7392-8ebe-4d43-a111-68bb6d2f93b6@stanley.mountain>
 <Z5Di-uU52aejU-U8@pluto>
Precedence: bulk
X-Mailing-List: arm-scmi@vger.kernel.org
List-Id: <arm-scmi.vger.kernel.org>
List-Subscribe: <mailto:arm-scmi+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:arm-scmi+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z5Di-uU52aejU-U8@pluto>

On Wed, Jan 22, 2025 at 12:22:18PM +0000, Cristian Marussi wrote:
> > > +struct scmi_msg_imx_cpu_attributes_out {
> > > +	__le32 attributes;
> > > +#define	CPU_MAX_NAME	16
> > > +	u8 name[CPU_MAX_NAME];
> > 
> > char is always unsigned in the kernel these days but strings should
> > still always be char.  Same thing in patch 1, there were a couple u8
> > names.
> > 
> 
> While it is certainly true that char is the way to go for strings and, as
> such, it is used elsewhere to hold the resource names across all SCMI
> protocols, in this context it is a field of structure representing
> exactly the layout of message reply coming from the server, and defined
> in the SCMI spec as a uint8 array, so, we have generally preferred to
> used u8 to represent such fixed size array all across the SCMI stack
> protocols implementation....
> 
> .... not saying that it is necessarily completelt right, but that is the
> reason we are guilty :D

Fine.  I don't have intense emotions about this.

It does slightly bother me when we assume that the SCMI server NUL
terminates these when we do things like:

	dev_info(ph->dev, "i.MX CPU: name: %s\n", out->name);

But from a practical perspective we have to trust the SCMI server.

regards,
dan carpenter


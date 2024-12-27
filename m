Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B2D31F37A3
	for <arm-scmi@vger.kernel.org>; Fri, 27 Dec 2024 17:06:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735319199; cv=none; b=A/KyltqOBjTsA3PluyW2n2YDhifTFgp1lQ007tppJLLz2DDj1/w/5iLso3B/BfHKjUb2VOrZKsEzDptvT5Y5kdIZOzeJ0uj8JSkGUHmFTsNLFG+AC180t2p+BSnBJnToXwZIFZmfphipTKHSyUUzvNUYFP/9KCR9CpJE57Hh9rE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735319199; c=relaxed/simple;
	bh=84EOIOtj+jrmLyO5mM61/2Lu4h9xRAKSN1hU4eGSdMU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Gb0HvTFJRNnTVSKtmgshuWpfvYJ1UXZVdD4Sg9oe+xZNvhGqQCnw/Dl+PfDm+6GuP1j4HpdUCo/Y1k6lRLJCTvgZzlWoHvTEUzBWNAatSd1sUVxlC2MUSgX0+pQ8buKggyZZ8iZDAaINM/e/uEeAn0mJqCEEPP9vKl40lU0vMuM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=JRtP0dwr; arc=none smtp.client-ip=209.85.167.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="JRtP0dwr"
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-54024aa9febso8248933e87.1
        for <arm-scmi@vger.kernel.org>; Fri, 27 Dec 2024 09:06:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1735319195; x=1735923995; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=84EOIOtj+jrmLyO5mM61/2Lu4h9xRAKSN1hU4eGSdMU=;
        b=JRtP0dwrzXtKV1p8C7ZMwMXVv0XqQ6G86dNwoxsAReyFxA/K3XITue6WlLouLDnXDc
         LRRKYkbiCRpnob7QAsIdyZ3sx8G0nfNku1m2KjvEbrtf3Jd/7EJBD/PMHDE3TdnmQISL
         TQSDyYhilknqwqsDdjqedeCAQFhdrD7ZiQOpAJoDgSvZd5ZjXx/JqEUQTOS6T1dVAj6f
         3efv7I0Su/rhcU5ed6VU7EaS72ttPuadERXj62jgGTNdgfuImIjhCDblBuIniF0Q1jv+
         /XLnZYehGoSqlZPCgTsB5aej3xasfqW2xj14nGTEDjEp/6R0Ff3lZeI5MmOzfchCxNbx
         f6mQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735319195; x=1735923995;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=84EOIOtj+jrmLyO5mM61/2Lu4h9xRAKSN1hU4eGSdMU=;
        b=YP/hn+TirSHd0MucdcMkDcYl3UNQlCvUThcuRug8/3S3SxJcqzkP65imrY4IM30LYS
         iUdwkTsSRJIUfZK9t/Ms0jABeQ1Ru4rGHlut47jb5jefyOkm/LUeHUsUbnaTAkfU9zvX
         bmV2Ir8thRAaHzvloWBMkkAxgHGzlvexeSkEg2bnwQNif7qiDSdVxjHOseyOm4pkUH7W
         v5t4CLQ419ue7QxUDXLIJz9Nd0k01/6wEYWWkCVnp8/UhM5f0Seg5W1q6MaVhChsUpAv
         Vwydn96kTxgVYSYtArFjwsJ/hQWoIkzwOpbJveIQ3LgmVhTbrvZCl5ru1Dk88q26C8YC
         bmJA==
X-Forwarded-Encrypted: i=1; AJvYcCXbCBHG/vZRNS4Om7BWoE6pqNq7fJPab7C+wrQWKMTdh62NIVY8FvhqWkHv5MSG+8SA7ZArj/Jdow==@vger.kernel.org
X-Gm-Message-State: AOJu0YyYxOv6+MZy0t3ia/vhSaDYblg03M3AIczJWvAJum1oB3OsIrww
	6dkXGCiXDte2l2/ySBVKpU10d4Z/mNastxo3epocyy5XlEzpbRCKZMRSBDzsdh4bx8VSV2MaaW0
	H1BMcDTRmLqu596SN72AaUl0Wn5eLfVOHVNcPWg==
X-Gm-Gg: ASbGncvZPIDTiC1oOYcDh33mcn1z4oWfDBjYoJgjMN5pGkuCb37F5eDCq/TqMfa7cyg
	zQDxU1mAO3ix9GulfBgt2yZn8tk2JcR97zNbu
X-Google-Smtp-Source: AGHT+IEAF5Jp/QDipLuJyJQRV1ZFYVHjt8w4LULM8IF+C9aJBkOnwrc7elyqOWcRa+AO2vKIjyJhQ/+3xwflHVTRNdg=
X-Received: by 2002:a05:6512:4385:b0:542:2972:4deb with SMTP id
 2adb3069b0e04-54229724e47mr8311291e87.18.1735319195404; Fri, 27 Dec 2024
 09:06:35 -0800 (PST)
Precedence: bulk
X-Mailing-List: arm-scmi@vger.kernel.org
List-Id: <arm-scmi.vger.kernel.org>
List-Subscribe: <mailto:arm-scmi+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:arm-scmi+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241225-scmi-fwdevlink-v1-0-e9a3a5341362@nxp.com>
In-Reply-To: <20241225-scmi-fwdevlink-v1-0-e9a3a5341362@nxp.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Fri, 27 Dec 2024 18:06:24 +0100
Message-ID: <CACRpkdZFQDiLax1QtPDr5zWbhAqwWuXdC=+VtBLD-S2c1FLpAg@mail.gmail.com>
Subject: Re: [PATCH 0/4] scmi: Bypass set fwnode to address devlink issue
To: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>, Saravana Kannan <saravanak@google.com>
Cc: Sudeep Holla <sudeep.holla@arm.com>, Cristian Marussi <cristian.marussi@arm.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Dong Aisheng <aisheng.dong@nxp.com>, 
	Fabio Estevam <festevam@gmail.com>, Shawn Guo <shawnguo@kernel.org>, Jacky Bai <ping.bai@nxp.com>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Sascha Hauer <s.hauer@pengutronix.de>, arm-scmi@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-gpio@vger.kernel.org, imx@lists.linux.dev, Peng Fan <peng.fan@nxp.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Dec 25, 2024 at 9:21=E2=80=AFAM Peng Fan (OSS) <peng.fan@oss.nxp.co=
m> wrote:

> Current scmi drivers not work well with devlink. This patchset is a
> retry to address the issue in [1] which was a few months ago.
>
> Current scmi devices are not created from device tree, they are created
> from a scmi_device_id entry of each driver with the protocol matches
> with the fwnode reg value, this means there could be multiple devices cre=
ated
> for one fwnode, but the fwnode only has one device pointer.
>
> This patchset is to do more checking before setting the device fwnode.
>
> This may looks like hack, but seems no better way to make scmi works
> well with devlink.
>
> [1]: https://lore.kernel.org/arm-scmi/CAGETcx8m48cy-EzP6_uoGN7KWsQw=3DCfZ=
WQ-hNUzz_7LZ0voG8A@mail.gmail.com/

Please drive any devlink-related patches by Saravana Kannan, he's pretty
much the only person I trust to know how to do devlinks right.

Yours,
Linus Walleij

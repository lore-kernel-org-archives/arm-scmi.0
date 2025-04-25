Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53B2728A1F3
	for <arm-scmi@vger.kernel.org>; Fri, 25 Apr 2025 15:30:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745595020; cv=none; b=eDyZC+2inKHAB9dU9/kGH45c61W4XVN0D+hWwFck6ESIYO4saacMVn8Op3XatoVvVo8Cg0RAOinouMvJdV+/kvwiYz5hLc+ccKDrtF+nG2D0cSZzb0OsYVxh+lvDRlvctA9KQ2ePaluvkKFdW0hHByXVrPkL1/Y8+mlzeBXsBT0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745595020; c=relaxed/simple;
	bh=ahFIwcIRMsxGsYw7Ro1znBHhQb9IRWhbo25rb6BKN1s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=K7mYoUyAIbRLIHgIHOn7HL/nfbMWeQkBdN6T/v2l9DkD0QAUivVAR4xEvhsK3EyYKPCM+lbWPlmKeHedIYjstKBsJuwFVtU3acLB/eSGx9t6Q9I+HCl2JfX61ZfzofP+MQEsC0qarlKAzQycCBi9I3azwMkFUDjigKHLSR+yZ0s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=vIY7oGRd; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="vIY7oGRd"
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-39c1efbefc6so1733192f8f.1
        for <arm-scmi@vger.kernel.org>; Fri, 25 Apr 2025 08:30:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745595014; x=1746199814; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=XYX9LNywUVjZ5MKIhmplUJhVT60qSNh9kSQfKfBdFKY=;
        b=vIY7oGRd8jYvnGLP4tQWZxxx6C8AFthUwW6eEVVbdrkJLWUf1be9CY84oNfaJ1Ynwt
         OUoth6j+G8ubGm8ByBCLEEfbsyXOA6cbPDZn0DAnRtXkPENRnVTcEfrl7+Fps/gdzad7
         xwZQnnLEbhGFn03LsCYZNpEkZPynC8+30FV4Kw6oOyrAa+h62XHI2+UKncKY21yZeZj3
         JEaF8XG6RKy0hAnrNhi6chSpxfBlx8uB+UGJoAGcVad4AS+53VlNDGjFfv/07B0zmBkj
         vlBTOW4vs5zETlF/4dDAqXMRACkfjMtD3af4nrzBZH/m1fUcCn8bpATx7RXfysVecQFf
         KM5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745595014; x=1746199814;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XYX9LNywUVjZ5MKIhmplUJhVT60qSNh9kSQfKfBdFKY=;
        b=q3k7WAXT6OZcNDuzWqCNgOPTgbxyNpfbnA5YweFpegfRhg4ioj/d0M/p7Oya0Vftfk
         MCBSJVxefC3F++fBlcYOLdY5HDSjmaZ6P8aMEK7lpzVf0oQL6x5z4L/C8fbytBcBW46m
         tN1wUgwi0MsHdIG4rg5B/gPbVjgmgD2+pKgkPr+OEBeB/AYsWiv+9lyNO0XhfGael3cz
         O5Jf4ymdjppWah0A27NLFnO4G3YcGYBMfSsO+eVB3FwCY/TiA8wwPF5UQBPypT+tixeZ
         s7GE3QrpdkCOdN2mt49dYPJCS1jFdt2t9OgAHB/nDXHU8cXPcxWnleKQ7Xs7l6sJQsK2
         fEgA==
X-Forwarded-Encrypted: i=1; AJvYcCWPDwncOm4Vg2K6+6MgaYHlZmBo32BCAvzN6+9WIuLo5/MjYPwZfo7/vHc0h4x4VhroKBmvE08Xww==@vger.kernel.org
X-Gm-Message-State: AOJu0YyIThksMXZZubdlBuSPgtTR6fipVD8oBPKbfRWM4cRpqmNKOv2p
	fv8EZyRRlKLW8Ctm328imIw199jRJLUrWJZ0tBu79wx5aI8m4evTzfiqhY5xGnw=
X-Gm-Gg: ASbGncuD4Ew0Lthpv0ipkWP/O9TodVETPQQAcsbL4cW615EP2tqUp0Cacp+mS9n80K0
	AVWaDO+uRD3c1x2th4M4H2L7uGh1H5KiyKpNsZ4USBJ0lMy3TfYd/tVXRHhupGkPE6HPOXeyzFg
	xXVd2VGshra9gk4oQO0uDoO8GQTRd7lUMYJDrMf4J1K9YjB1qnr6u/79mh1JRHlpyJnEOXYAfy4
	DzpMMSFapVYCt0UJazVBTwDBeSwYK0QkyoqCmnBTik7E3FR+XSxth8+f0YuBsKdYQbdv1A4Dv3i
	QcqSjuRLZABPztJnrmRf7aIXlsYLA/aDmQUuBhStmXUYmIwzB49FgtaT
X-Google-Smtp-Source: AGHT+IGyQoffBkkjn9GdlBOynB35D8e4ETPc01tgM75yAlc1oqBxq4rXGz8GsC/XanHp8nvcBgQZNw==
X-Received: by 2002:a5d:6489:0:b0:39c:1f02:449f with SMTP id ffacd0b85a97d-3a074e0e059mr2152557f8f.2.1745595014541;
        Fri, 25 Apr 2025 08:30:14 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-3a073e6daa0sm2592945f8f.101.2025.04.25.08.30.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Apr 2025 08:30:14 -0700 (PDT)
Date: Fri, 25 Apr 2025 18:30:10 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: "zhangzekun (A)" <zhangzekun11@huawei.com>,
	Oleksij Rempel <o.rempel@pengutronix.de>, robh@kernel.org,
	saravanak@google.com, justin.chen@broadcom.com,
	florian.fainelli@broadcom.com, andrew+netdev@lunn.ch,
	kuba@kernel.org, kory.maincent@bootlin.com,
	jacopo+renesas@jmondi.org, kieran.bingham+renesas@ideasonboard.com,
	maddy@linux.ibm.com, mpe@ellerman.id.au, npiggin@gmail.com,
	olteanv@gmail.com, davem@davemloft.net, taras.chornyi@plvision.eu,
	edumazet@google.com, pabeni@redhat.com, sudeep.holla@arm.com,
	cristian.marussi@arm.com, arm-scmi@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org, linux-media@vger.kernel.org,
	netdev@vger.kernel.org, devicetree@vger.kernel.org,
	chenjun102@huawei.com, Joe Hattori <joe@pf.is.s.u-tokyo.ac.jp>,
	Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH 1/9] of: Add warpper function
 of_find_node_by_name_balanced()
Message-ID: <aAuqgiSxrh24-L-D@stanley.mountain>
References: <20250207013117.104205-1-zhangzekun11@huawei.com>
 <20250207013117.104205-2-zhangzekun11@huawei.com>
 <Z6XDKi_V0BZSdCeL@pengutronix.de>
 <80b1c21c-096b-4a11-b9d7-069c972b146a@huawei.com>
 <20250207153722.GA24886@pendragon.ideasonboard.com>
 <be93486b-91bb-4fdd-9f6c-ec295c448476@stanley.mountain>
Precedence: bulk
X-Mailing-List: arm-scmi@vger.kernel.org
List-Id: <arm-scmi.vger.kernel.org>
List-Subscribe: <mailto:arm-scmi+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:arm-scmi+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <be93486b-91bb-4fdd-9f6c-ec295c448476@stanley.mountain>

Whatever happened with this thread from Feb.
https://lore.kernel.org/all/20250207013117.104205-1-zhangzekun11@huawei.com/

The issue was that people weren't expecting of_find_node_by_name() to
drop the reference on the of_node.  The patchset introduced a wrapper
which basically worked as expected except no liked the naming.  Krzysztof
suggested that maybe the callers should be using of_get_child_by_name()
instead.

I created a Smatch warning for this and here are the four issues it
found.  The line numbers are from linux-next.

drivers/net/ethernet/broadcom/asp2/bcmasp.c:1370 bcmasp_probe() warn: 'dev->of_node' was not incremented
drivers/net/pse-pd/tps23881.c:505 tps23881_get_of_channels() warn: 'priv->np' was not incremented
drivers/media/platform/qcom/venus/core.c:301 venus_add_video_core() warn: 'dev->of_node' was not incremented
drivers/regulator/tps6594-regulator.c:618 tps6594_regulator_probe() warn: 'tps->dev->of_node' was not incremented

regards,
dan carpenter


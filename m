Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFA4F23691C
	for <arm-scmi@vger.kernel.org>; Wed, 11 Dec 2024 14:08:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733926103; cv=none; b=SFYuBYyGXAfeSHARbePDKSgbrZQBDFnEzU5YoPYkXarNMOy4+BfoCJJBTtpx1+H7TXXgTHsam20FdkxVpf7jBSDkFXpVHI5OfcgUDombAV7VyQ5dRmH5epEaEVVaIyKB8G+V3rCBIdWAVxAE/Bkry2c+KqcnAH1Jw8Y/p8booBE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733926103; c=relaxed/simple;
	bh=gwoAWAMn2qaasotoKXIvUH6oyP8qretl7pKOQtXlQJg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Ge8J8e6xI9/OmXHQAkj5Go9vpIQrlgqK5l06Dzyr2tRoYiQXj3mYWd1VL3a+cKrWt9iaF7OtraVSRpL87/tZkS+fWl1DHraBlooJ3+JlD4PG1Sv6hT//aGuhOIoOwWYuV+eMYHqxyzM9pINJoPEtf2FiAXYinZBBx1HNRXAWSp8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=E9qXtE6A; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="E9qXtE6A"
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-385ef8b64b3so5457862f8f.0
        for <arm-scmi@vger.kernel.org>; Wed, 11 Dec 2024 06:08:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1733926099; x=1734530899; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=sK9rpuIcoGf+Ibbpo2Si8dbBSeQV+4UsrGEB61KSQAs=;
        b=E9qXtE6Az3/a1ZC/pDIYqPqBokXJvDNu9rVsLArUjuY4+vcORJpu4Wx5pX0u5LfW10
         amxpzdWLxmYEiR0mzEwHswgPwcyfqA5+g7RlHNF7blybPy5CCrB4Ro5lYT9wauUFHqE0
         VCjWLQgl0fhZBYtOcwvG9r4Rm6yEVoewfZo1KS70P1fmM2/MVhioNt3Uloct1IFybr15
         v8zcjc8gBMazqGkcx9MTN5zL6/FiiPEJSq7+ycQEGr1nHSbiBoq0ucJN19RvCaV8MQ53
         zs4IOyctDVSprkA2ozhSenJlksE6r4SLw9K6NNCG5d4BnWdUuzxDTtJKvxk2bmYn9N1V
         TtEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733926099; x=1734530899;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=sK9rpuIcoGf+Ibbpo2Si8dbBSeQV+4UsrGEB61KSQAs=;
        b=eHZee1UbXmus6T6jr0f9BZIt0w9NG+EX8p29BlA5QttRR440cOXG9uDslluhrJjv6M
         5eJgUeapX63oBm535TCw1mkzM9+jc4qpucAaXvIxKll8FP34selC8MEB5TYTQIqR4ek9
         baiHUtgiwDL3BMw5R+aa2qWhnIshJKQoaaJxyIkMQBSL1E3JC+oiAbUKLNB65sdv89lk
         9dXV6k66mIPmhBBUgu2Rro6ijSlw9ncUYkyrOJj4RNtyCMgc1bJupIrPhSBM3QVv9492
         xS61oRq9rjBdEGINbxZyGljxapDK5ZCZjXhBzmzXPPWBzcj2LSrZcevnwomw4d5E4OUp
         AOLw==
X-Gm-Message-State: AOJu0YwOpxPHVOoIcZpo34QICQFdB3GuWdU9squxtFbVE4tHCkSPzGbA
	/7UCbpy4hptdU45xuj7r2PXA5cLRVgjRydaXkCLc//C8KWXIUjL95e2kJrEa27xs4IMsFQppgiQ
	Z
X-Gm-Gg: ASbGncuPtRQT4D96BjO26Mk6dAwunC6Hm37O9iioio4bGx4xAsZJiFPgNkoRXg9530d
	3tZsMQklkTCWgNKsoHNjSSp0QVQ5+vw0bBwGltc5ePME5MLSWNI+fmfus4xDxthX0uEQEsrUIFv
	eIR9vAWQqpKnGNaO61bbGhUv+a7PmEx6L7lRRnOciTAqXJUkIzWq3eWNIBUOtgWg6ZZMtu1tt6w
	xB623SKXtH5ejPX2Te9LvLUtozGGwQK63gFcYV19mAgxiGRjqkRQSE9U2U=
X-Google-Smtp-Source: AGHT+IFX2rBxzjANBhZOwImYoedmc0cAVIGsFErsm+LacdNzCPJTMUe23y3fEVoeKHJCI6n3EbiEbA==
X-Received: by 2002:a05:6000:1acf:b0:386:3918:16b1 with SMTP id ffacd0b85a97d-3864cec5781mr2653783f8f.39.1733926098816;
        Wed, 11 Dec 2024 06:08:18 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3878251c6f6sm1347219f8f.93.2024.12.11.06.08.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Dec 2024 06:08:18 -0800 (PST)
Date: Wed, 11 Dec 2024 17:08:14 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: arm-scmi@vger.kernel.org
Cc: Khaled Ali Ahmed <Khaled.AliAhmed@arm.com>,
	Girish Pathak <Girish.Pathak@arm.com>,
	Linus Walleij <linus.walleij@linaro.org>
Subject: Question about pin control configs
Message-ID: <c9dfcf30-6557-4c52-b3bf-629b16be326c@stanley.mountain>
Precedence: bulk
X-Mailing-List: arm-scmi@vger.kernel.org
List-Id: <arm-scmi.vger.kernel.org>
List-Subscribe: <mailto:arm-scmi+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:arm-scmi+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

I've implemented a mock pin controller in SCP.  I just want to make sure
I'm doing it correctly.

Each pin can have a bunch of config options set which are described in
"Table 24 Pin Configuration Type and Enumerations".  It's stuff like
Bias-high-impedance and Low-power-mode etc.

Question 1:  Should configs default to zero?

In my mock pin controller, the options default to zero.  So each pin has
an array with (SLEW_RATE + 1) configs.  I had thought to default to an
"unset" value and then if you tried to read the config you would get an
error.  But I think it should default to zero.  There isn't a way "unset"
a config, you can only set it to zero, one or the number of Microamperes
etc.  But there isn't a way to clear the settings.

Question 2: Getting all the configs

The operating system can either query the configs with PINCTRL_SETTINGS_SET/GET
and you can read either all the configs or a specific config.
If I default to zero, and we read all the configs then most of them are
going to be zero.  That's fine?

Question 3: PINCTRL_SETTINGS_GET doesn't work for groups.

To me, it doesn't really make sense for groups to have configs like
Bias-bus-hold.  That should be associated with the pin.  If you call
PINCTRL_SETTINGS_SET with a group argument then you set the configs for
each pin.

But if you get the settings for a group, the protocol doesn't have a way
to associate a response with a specific pin.  So PINCTRL_SETTINGS_GET
doesn't really work for a group.

It might have been nice to read all the pins in a group in one command
but there isn't really a way to do that.

regards,
dan carpenter


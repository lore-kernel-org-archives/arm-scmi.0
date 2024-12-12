Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78A302210C2
	for <arm-scmi@vger.kernel.org>; Thu, 12 Dec 2024 18:32:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734028335; cv=none; b=aG+p56WRbwqpcvioza5QxkupDwXijRT8Z5fkRF73mGLN3Gcy57YDH7+3KGpSTpgSnl5yiQ1t7Jber2LtVu1JlfRvEkIhNplv8QRfqcjCeXRgu8UujiS0qk/l51ZIxsl+jDC7W3Wq6Qph55MyEZ0A/s3iOz3HzEsS/ciF4uFAKUQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734028335; c=relaxed/simple;
	bh=0T7mVDtAM8B3iGET6aa3z6/QZ7i31TS5G7lVlm+hCrI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fIUSo+wn4jQu1I8dJsv5laLdGxzwA8N1qjYAY5wpRnanZ9SbTb3Mo7EXQDM8Lj4hMcFPcFImV2nMnaNU7uCi7liHt4ubIYWQCXb+7CM9YysxvQjXbjs6xO+Y/5W6gf8oQ6iD4WovmB+aL5wz3qKI3mdecS4bsaQSWQsSLo4kvIg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=r0zOk6lN; arc=none smtp.client-ip=209.85.218.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="r0zOk6lN"
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-aa689a37dd4so170401366b.3
        for <arm-scmi@vger.kernel.org>; Thu, 12 Dec 2024 10:32:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1734028332; x=1734633132; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=i6+r/5v0EpoWOzkFzpqyfkzVQfvGxJH56xHRrf1xQpM=;
        b=r0zOk6lNaFwjNRKB4FTS4k95f2OG0LCsEH7I+JwAwSJBSGxDEn1q3NgOK/mjbxXaAI
         HdJ1lfE9vqzMxvVMqO4lHk5vtbmV+7UHMbMYXkKU2YIhF6jVZoJCzI+GH+lP17oiGDUJ
         WVZLNVQadTh8Y6wTYjIErKb5/mHBBDBC8gdTVe4MNcErTrOvpxLpQ4CaSFgw+pvIbszX
         LCQeohRQGYcNjGGOJ342ZNTJ0uOYoIkhtKr5/91+B+XBi+6gdlRNWHtIIYzANvcRg9fx
         N2H3VnPY0hSi/KacB2y3AFrEkip22iKeVQU7GWBBxz6LpoC0Mj6aGqGN+JGau+ADqlMm
         DdnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734028332; x=1734633132;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=i6+r/5v0EpoWOzkFzpqyfkzVQfvGxJH56xHRrf1xQpM=;
        b=WMLIiMl7oNUPpCN4JyJWyeJvERGDylugEnu0+/4VIilTlj+r7LEnes03j+7u5TXnx4
         /ZmQXRZXh53w818gYqITx1YXhWU0HzIA9lW/u5xFjbrZv+9jMAAyeKNBYpT8UTaIgTpt
         gSfijnm6vBb5Kjr+GQ6WX3ZYgQEsaX1EspwEvTjT2rSewjXOqRVGUrfHdWSsC4AT3eIb
         F4nK0BJL638NBwKDrb4due3/TTOQfwEFqUaEOKvMsltgnKYEYuBj2PrnmW1+a/PWiOoJ
         SYLi66vOsh6NfaVn6M23rqGPnJKc2dD/kP4k8xc+RMVoAuoEILRo6MthaC3CVs1cqPVW
         77wA==
X-Gm-Message-State: AOJu0YwW0KQOtY1dZsQelRtDZaFa+l2ns+1CbfFW9vtL8VqQSTjm8BQ0
	WFuUboOHaAl1DBHxn0k1YeE3bYKe8P/ko7lqBPS9AAbN3hhm+tI3trPnbEsYVyniiySjwmbk4FW
	+
X-Gm-Gg: ASbGncvk7eFxNgLh1rlRPDbf21H6VjcPzRFPO2jxoGqm5ZHb0b9CkV0MGD3HpaffXsk
	qsmDZDqhHvftR4WufbzrzQSNhjewWQA0JYZNlTK2YA6qmtdgRSJFlYpacfBrvwPT47kjR04ibAn
	KApLzid59TvDCyJLaA/g5V8KllZoSfvbxlKYAN29JhtwxcS7iioemri33dcQVjBjhCqimkiGjry
	elU10TgIRd54FLhQ5QIv3ixnbvJaHdnd9OVw7STeDDM7sZZ6VrH1Y431WKB+A==
X-Google-Smtp-Source: AGHT+IE/Nx5I0WjRAmkaqTi70appQ89rtO3wMXV9Kd+Zr5BK8DKccuFAlyA6H8paMJWzpTmsAUCxSQ==
X-Received: by 2002:a17:907:781a:b0:aa6:71dc:3123 with SMTP id a640c23a62f3a-aa916935ed5mr333233766b.8.1734028331750;
        Thu, 12 Dec 2024 10:32:11 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aa6a3dcbcc2sm400731866b.117.2024.12.12.10.32.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Dec 2024 10:32:11 -0800 (PST)
Date: Thu, 12 Dec 2024 21:32:08 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Khaled Ali Ahmed <Khaled.AliAhmed@arm.com>
Cc: "arm-scmi@vger.kernel.org" <arm-scmi@vger.kernel.org>,
	Girish Pathak <Girish.Pathak@arm.com>,
	Linus Walleij <linus.walleij@linaro.org>
Subject: Re: Question about pin control configs
Message-ID: <f69d0439-01cb-4e43-8853-f1400be38e89@stanley.mountain>
References: <c9dfcf30-6557-4c52-b3bf-629b16be326c@stanley.mountain>
 <GV2PR08MB7955B51D624D6B65DF27E2B5EB3F2@GV2PR08MB7955.eurprd08.prod.outlook.com>
Precedence: bulk
X-Mailing-List: arm-scmi@vger.kernel.org
List-Id: <arm-scmi.vger.kernel.org>
List-Subscribe: <mailto:arm-scmi+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:arm-scmi+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <GV2PR08MB7955B51D624D6B65DF27E2B5EB3F2@GV2PR08MB7955.eurprd08.prod.outlook.com>

On Thu, Dec 12, 2024 at 02:53:20PM +0000, Khaled Ali Ahmed wrote:
> Hello Dan,
> 
> Thank you so much for your Questions and here are the answers from my perspective:
> 
> Answer 1:
> the pin controller is highly related to HW so the initial values given to pin configurations should match this HW status.
> For Example, let's say we have the following configs for PIN_6 as a "pin_id"
> configs = {{PULL_MODE, 1}, {POWER_SOURCE, 3}}
> so it means it is the same default configuration from HW side.
> 
> Answer 2:
> solved by Answer 1

You're only setting 2 configs.  If you read all the configs do you return
18 zeroes just for the two non-zero values?

> 
> Answer 3:
> you are right, all pin configurations in the group are unified which means it has the same config so if I receive PINCTRL_SETTINGS_GET for the group, I will reply with the configs of the first pin in the group.
> 

What about for INPUT_VALUE which is the value of the pin?

I haven't yet figured out how this works in the kernel but I feel like
it would be nice to read all the pins in a group at once.

regards,
dan carpenter


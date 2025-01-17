Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2C201F63DB
	for <arm-scmi@vger.kernel.org>; Fri, 17 Jan 2025 05:13:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737090824; cv=none; b=Js1U9TDwbOYiapSaYWXYScRIeShIyjSyx0iM0dMOhBhjqtJdK/Xq3hCI7D14vfraEjHS6Zlnbxg72IjkBu52VfGs2NzgO1Jg2pDKqAeU5Y/+pRP69AFSEKASPixtZxWjgs7w60GzJccg7s4Elm2zQP8o9h/E4uz3ASB7oBDNMO8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737090824; c=relaxed/simple;
	bh=eA2hfEiZiI/7JkZCjO5oD8P9s9LvCtYLtekjekYfD9s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=R/PIxkmeiwnCpSqHckqRwMDjrlbJUb4HEQpjf4v0HFn61n2fx0Ub0/daew+yohiJIy+DsseXul6k8FBQ6RIYQAjSMcdoqM+KrpPqC3spyq6AolP1QFUbTRp6YkSAqOwRdxxx+iVz4iM703uXSQ38NBRXglQRtytkuDDlsdx+QFQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=oqjN89j5; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="oqjN89j5"
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-385d7b4da2bso1504879f8f.1
        for <arm-scmi@vger.kernel.org>; Thu, 16 Jan 2025 21:13:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1737090821; x=1737695621; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=eA2hfEiZiI/7JkZCjO5oD8P9s9LvCtYLtekjekYfD9s=;
        b=oqjN89j5yDRtkk7mcet496/p5kCrRIlh5qIE7ogq2pBpxFuu3e6oVAZWaHeEk8bikU
         /K94fmatO2n3yNVsMWI7I9qMOw3VKTbUhlq/BKt0jEeqU2+UhsO025a2+zaz86gQ46Wy
         priud3THz3kWcW0lgJ2RhTn4euPIaDum+OLJLD8fkdSUJsoinxsyNKyPezoiHaYqLMhZ
         87hwcrU6KNtp3p7F/s2k8n1jKuLRMIaiaqRb+LvkoMx7zMo2CsFe3fEPDeecFmNZPGe7
         6rsvagM+U8aBgoyaf3lO0df0slLiKHC64HaI9gn7MwUBNO2x7xvxz4SiQkOTtxxhMwWs
         a4JQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737090821; x=1737695621;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eA2hfEiZiI/7JkZCjO5oD8P9s9LvCtYLtekjekYfD9s=;
        b=acZ99xS3to0jRm6bT6CnyWBkyIc+Um4E6lpnMLnl51Zc/sMnmqW+R9ZpYZ34zTrYVi
         R7SG5ncGhsLW3aa5yK+khG2efpsJlvOY+kW0qzbqplDB2L/fFJXlyl0QpCUVyj+mgNVq
         UTRsTzXHIP9ruIH0caNYKxLvXBIS8aAGJusPCoUJ8/swdJlg3XTKNRxXEpctvaa8hoix
         7L8AkOesverRRm/lqXW3+NViIKjuvVtikaXtYCRha73C2ySFZ+dM0UYZfWepWIN758Ua
         kOOt9vwI+vHs6H9IoyXjv4D9wT9yIPLH0Ca+qQeMQU1lTIlmBGVQbckEfO2CVNcHCFIC
         BMGA==
X-Forwarded-Encrypted: i=1; AJvYcCXzUAGtD90jnRtiQRuTZNiUgh2y51c/FakodNC3eEmNtOZJgFLjgDqVwlD8Y0cB9UIzBmZHDmxORg==@vger.kernel.org
X-Gm-Message-State: AOJu0YwG9dUx0PBNzSJOjMJrECp7riwdd6VDCpnlrYNBwrkfy1Ea3tEP
	kZnYGL13u0jrMSnLh3fGGmb5QstN8Wv+DXk+iAS16k0p349FK8JMgWI6xqOwNpU=
X-Gm-Gg: ASbGncuhB0fwdDIDLuWfyVe9ZwiDYj+xnRJXEN1ihHFbNYnLZWOcp+NFXvlRmKSJhhd
	jcIn6G083dXr1XbA8V21rahpxR/OJleH8fkRKNBHnwGH5JZO7M3/9ZDnpQ57uLjY9Hd6i0Ggryd
	Kq2xqxrm+pj6t6p4ET+PnhiH2KelS1q9ffYTS4jDFdVK0sjVh1PQL9T5YV6IY6yl9q6TKFMMje2
	aXCSCEiV9JyfnyvOdCeP9twenBzBq2BAs6Z+ChUeWpEjijGKvKkYkxgAU+0ZA==
X-Google-Smtp-Source: AGHT+IGGVebus2uYIGuuLFBd4qUm10d1iM3tfiYX430p/eyvedP+1HKhhDpD5iwKxIXhksPpV3KmRw==
X-Received: by 2002:a5d:588a:0:b0:38a:88f8:aadd with SMTP id ffacd0b85a97d-38bf57bea5emr694186f8f.53.1737090821304;
        Thu, 16 Jan 2025 21:13:41 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-437c74c4751sm79637735e9.19.2025.01.16.21.13.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Jan 2025 21:13:40 -0800 (PST)
Date: Fri, 17 Jan 2025 08:13:37 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Ranjani Vaidyanathan <ranjani.vaidyanathan@nxp.com>
Cc: Cristian Marussi <cristian.marussi@arm.com>,
	Sudeep Holla <sudeep.holla@arm.com>, Peng Fan <peng.fan@nxp.com>,
	"Peng Fan (OSS)" <peng.fan@oss.nxp.com>,
	"ulf.hansson@linaro.org" <ulf.hansson@linaro.org>,
	"arm-scmi@vger.kernel.org" <arm-scmi@vger.kernel.org>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	"linux-pm@vger.kernel.org" <linux-pm@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [EXT] Re: [PATCH] pmdomain: arm: scmi_pm_domain: Initialize
 state as off
Message-ID: <345b6d8f-e5bb-4443-b385-a6b87630933d@stanley.mountain>
References: <Z4TreQ5bA9qiMTgC@bogus>
 <PAXPR04MB8459F33BCC84CCA8F49F3B60881F2@PAXPR04MB8459.eurprd04.prod.outlook.com>
 <Z4UZ2Au7KSFMibDW@bogus>
 <PA4PR04MB94855052830C8F4874237BA6921F2@PA4PR04MB9485.eurprd04.prod.outlook.com>
 <Z4VLZgAWR7ugDl7W@bogus>
 <PA4PR04MB9485E9C126E48A088D7E399B921F2@PA4PR04MB9485.eurprd04.prod.outlook.com>
 <Z4aBkezSWOPCXcUh@bogus>
 <PA4PR04MB9485507CCC21354B5ED55C3792182@PA4PR04MB9485.eurprd04.prod.outlook.com>
 <Z4d8nrJy-h9EwzsJ@pluto>
 <PA4PR04MB9485CC9D9925BB5D23EA629092192@PA4PR04MB9485.eurprd04.prod.outlook.com>
Precedence: bulk
X-Mailing-List: arm-scmi@vger.kernel.org
List-Id: <arm-scmi.vger.kernel.org>
List-Subscribe: <mailto:arm-scmi+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:arm-scmi+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <PA4PR04MB9485CC9D9925BB5D23EA629092192@PA4PR04MB9485.eurprd04.prod.outlook.com>

Hi Ranjani,

Your email is pretty hard to read when we're looking at the email
archive or on email clients like mutt also.
https://lore.kernel.org/all/PA4PR04MB9485CC9D9925BB5D23EA629092192@PA4PR04MB9485.eurprd04.prod.outlook.com/

regards,
dan carpenter


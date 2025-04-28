Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2788328F92E
	for <arm-scmi@vger.kernel.org>; Mon, 28 Apr 2025 17:32:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745861561; cv=none; b=SQSvA9HXvN4KpsCOIxAvU48S4Pi0J1Zm6jjlsDf7FMeWgKGg4yjEt1JqZuigWPrcB8boq+P/mZkcQqq+rcmE9lt7m4Yc0cLsAyX53yUKcmpoP8JuKT7nNu5ZErlohd1lkd7gu1cYnarQJMcQsNNX/2AKXZAJT5VIhMnz2vkt4e0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745861561; c=relaxed/simple;
	bh=YWKei5UilD/MZ7Md8VG0OndC25G0DeF/bTfMy3IlYgY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=N4lreU7QpNVBWN91bC5anf5L3D7x1mvPROuretY/jZM2o6fl3WANxDMFALucfR1a2j1cy+2E6AS9sPKFm9UANW5rkN7c/VtloSWy147I0ZekBfeAjU8+RtbyudpI3HhGwWAEm7zdo/e4w1WIFLhFhiNj6yan4AAsHEGSPBzH3Mk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=hEqALu+a; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="hEqALu+a"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-43cebe06e9eso34822375e9.3
        for <arm-scmi@vger.kernel.org>; Mon, 28 Apr 2025 10:32:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745861557; x=1746466357; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=n1d+GNS5QppDn6qf79EVl79zCi4VMyWGMbLpnCtAoAE=;
        b=hEqALu+abJHrJ+ETrEAsMPJcreqr3kpy6rnfJQKzv/hMfaP7sNJvfnSemBSCUVMHiH
         1TjFtDPgcp1aDoHXnnQ0l/0A3682gtQG/sX1PiRB+PKwa+d2JBBRMbTvR3aNbls2N0yc
         9W8aRw7M/g4MRmYaseItKkaQAd3d2+o7HWvxhFrlcTC4mXMnQdhch5ySB8DyCgppubyx
         MxrSadZEoOx/5u3idJczfXHXEnYhRqTsG0ihvAyC6IhcVc6e4vceBNzIik9XbSZ61MAB
         Gmsqy58zDxZGa0iqEP6SycEwpu/TzLlMRjM0tamuZ/i4oHgikYRhnBTAqWDvLbvgkL70
         hoaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745861557; x=1746466357;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=n1d+GNS5QppDn6qf79EVl79zCi4VMyWGMbLpnCtAoAE=;
        b=Ffd7S+IZ4Es5G6MUCNOEl5oUBX3aRVJ13ABu8iye46sIKp6iHJ18DKeceAdLxQAFGD
         9NElzKG3Xu0jqgYDcIHlCh/Std4BpVA5i6ylCHVLVQdrlg02jKldUpO+UU442RV47s75
         iZiziwIWsxbLKsZHZOMRDe+iSj/JNFCK5AX2F39iP3m5HZQfF8AtWdBlW1Qttx6+W1lB
         OuCnCsf1S9PPfhKEDYgO4JAJnEPJXFeMAGMgQFSLm34SuEzrl0y6e2rvT9U8dp0FTD4E
         PuFAMkzhGJu8sChQZifH50OADLXGa4MakdW41Z2Hjl8gEc4VsZRnnKl6aIH4fZ/X8U7a
         8alg==
X-Gm-Message-State: AOJu0YxQEaDUe01bSvpO89EbJs4sHj1RGVR8flfYVBX1rUnj2XbCoFtK
	3m5gqQPDD0Tis8s+y1MGbmA88ybypT+ZqR8NXesIBbVSPV820UhanBAVN6rtEFE=
X-Gm-Gg: ASbGnctESDBl14cWMqagu3KPbKCieUsgCHWGKHzO1GlVORmrTlthRuhLbndX0OFbqMk
	plBbgVtkPNrQPnKtQRzXXU8R1hxx0HZ0qlGIL6poPjiiFr+jdbATawFjHfHsqaZgt/BDwrMITED
	0B8A3jmG9jToG7YBF1BLtDZslmN10WMIvOtqzwfo1zkvnk0kmYCfHZEn8QyGnfAheID9qqRmFe3
	2mmAPhFbRHT3sEn2ktueGkhHks1RMC//aj6db8N7QSA2JvWWD6FpaJeNyjXmkRlQVYavG6KwQOH
	M8zTvTJzWBLKYD/nEQMH1R9m8udIEHDd3j7i677glEUlFA==
X-Google-Smtp-Source: AGHT+IGPcPze3BJgsFwqrGMm+Smx8uPSffEgIgWWvVHHNDjp5pcv4cHbbza32l8daxo3FExNvgDwyg==
X-Received: by 2002:a05:600c:46cf:b0:43d:b3:f95 with SMTP id 5b1f17b1804b1-440ab8722d8mr62713685e9.28.1745861557319;
        Mon, 28 Apr 2025 10:32:37 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-4409d2ac26dsm163754705e9.21.2025.04.28.10.32.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Apr 2025 10:32:36 -0700 (PDT)
Date: Mon, 28 Apr 2025 20:32:33 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Khaled Ali Ahmed <Khaled.AliAhmed@arm.com>
Cc: "arm-scmi@vger.kernel.org" <arm-scmi@vger.kernel.org>,
	Girish Pathak <Girish.Pathak@arm.com>
Subject: Re: [PATCH SCP] module/scmi_pin_control: allow variable length
 responses
Message-ID: <23d664b1-b816-46a0-bd0c-fd7c518d2a41@stanley.mountain>
References: <aA9KGTuVXZotPEMF@stanley.mountain>
 <GV2PR08MB7955196626745F65BF74E90DEB812@GV2PR08MB7955.eurprd08.prod.outlook.com>
Precedence: bulk
X-Mailing-List: arm-scmi@vger.kernel.org
List-Id: <arm-scmi.vger.kernel.org>
List-Subscribe: <mailto:arm-scmi+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:arm-scmi+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <GV2PR08MB7955196626745F65BF74E90DEB812@GV2PR08MB7955.eurprd08.prod.outlook.com>

On Mon, Apr 28, 2025 at 10:30:33AM +0000, Khaled Ali Ahmed wrote:
> Good morning Dan,
> I am sending this email to add the whole attached group in the CC, also
> to list more details about the implementation of the Dynamic length
>  setting configuration.
> This takes into account the current code base, also the
> "scmi_message_validation" scmi API has been updated, and a new macro has
> been introduced in the mod_scmi.h "MOD_SCMI_PROTOCOL_DAYNAMIC_PAYLOAD_SIZE".
> 
> Thanks, Dan, in advance

Great thanks.  That works.

I'm getting some sort of crash in scmi_clock_init().  The "data" pointer is
not a valid pointer.  Apparently, it's 0x133a80.  I don't know if that's a
known issue or if it's from a mistake I made forward porting my patches.
I've disabled that for now because I only need pinctrl.

regards,
dan carpenter


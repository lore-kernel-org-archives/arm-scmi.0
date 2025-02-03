Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1FB1205AC4
	for <arm-scmi@vger.kernel.org>; Mon,  3 Feb 2025 06:23:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738563815; cv=none; b=HRP7QvclCpTmlrrpcgWLPNk1p87UYLDy4mOOt3JweNi2QSzPowvsw3GetCd0jMBOEbCRQE2Mg2JpZLBbC5/kFvRJZ6LMPnbiK9dzzvilSl+TDkfvSqHd1rFw5YGmmDibFdWKLUJeZgVfqIkNmoL8ClCMRjzkVyiDJHpFagui/Mc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738563815; c=relaxed/simple;
	bh=o2qVFJi6NQt81POOdOar2ljhaccX5zF9zjd15e7Dq8c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nRo1TKM9IduuRPJEexibAJwjd20mf+M40JDAGzcmOXHnQwultaMXHKzHmcLrqzuuocS6UEEjQzcJW8as9u3kerqo72JL953JiFME/iJgqjbZ3XjMmE6BmBeZp0gGpSuVykzg2iz1xcnObT5rqCJD9/LhXsHAFcN2wWbXqH/50j0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=gfHMxZjX; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="gfHMxZjX"
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-385e1fcb0e1so1962215f8f.2
        for <arm-scmi@vger.kernel.org>; Sun, 02 Feb 2025 22:23:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1738563812; x=1739168612; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=t/aO680dqH+THo8vhdajuvrTe7hkrqAVqWlgHCGF+TQ=;
        b=gfHMxZjXnQb6QvzUPWvLEfXarAkEEHBXb49obSpNftjrBqliQB4RiLIsxjsc67vvJ7
         OTFXpL18H+66ajWowmJbzuxgGgKtUUd7uVg2OHlCR+xgDtelxkSuFfwjgQNrFqwc5cKJ
         SUXSkszF1pONwKPpzWDfk6xWb1ZCccu6RenV+Xie1ku3/1dXSbXhg4ThFFw060Z5/KqC
         35KbWcCFIlyr7YSlZtdXbDePcVZebmZ/vgIm62H/BSbKoCk2MzqPOezS3VkSphsg/99Z
         LRxFYEoZKYaBIe72SCD7uARyMgvPJAx94lV3E6y8iCUAgl0v2QUs1tWVQ47flP0zDpEt
         HLjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738563812; x=1739168612;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=t/aO680dqH+THo8vhdajuvrTe7hkrqAVqWlgHCGF+TQ=;
        b=QlHkOh2LCJfioRJ+EdlYN0jSXhi+bcG6XP/ESS2mKDMGwT5DmRqrFTsliIJIE78Gyy
         1b4P5tiznx2B2mXdbr5Eb9qk+TH46K3DcAXY5MpAjGeLlYcEEjSRHQ4N27xO8NkzjqLO
         wTDDH+aBXJVdqKKiJpoI/7TnWHDtarZoMJFNmljuQgjx/g+XRjqJifALsgf1KVkvA7iU
         sY8xo+s2qpvkoA1kXZVqhGdCbMNM2B27qckjqg1ucJKWFtVMwNhmKLGCXZGPU7QIb5Xn
         2o6Z12Ts2t6lAsMl7zUUaGVtiNxqlb8bp5A2sU40MDmHjjUxAck8tbvobsQFLFyBVbms
         n3Pw==
X-Gm-Message-State: AOJu0YzAvPzjqoP1+hXRN4o2Xp6b/RJUo3BCK2TPXMzWTalWaQ1WXb7f
	LEXF5ti/gUm1VYzFO6k4sRooi+lV8AU88NJjjAA9gz2WRT//SE8QSUnlbrbO51bSUIZC0Y/Ga7d
	A
X-Gm-Gg: ASbGncsVqUsSItaOO0wsez0vQ/saGCLfpGSdzdaUEobcVXOlKLFAk6uaIIaAQPwhcoo
	2+47b768TccMACQJliH8Sj3wdpXGmp4+2xHcwc468HFbOY8QZ5jUgUmBwMBg+hrChOJ3ErxM7fU
	FONBptcy6ljLyI13LaDnrvLxlAMMvSarC56xdWPfdIj5aF55hqqueuAbfJ5Uz6wbNckpvEjIdn7
	ReodoF8w3gVAK+tfSnlfZa/qnVF61dLIJG6JRUYxoV3ISEK+al3grrvFhGgvL5+gmm8zd2ez5Q6
	uRYxpihXTBfDj6DoGEwO
X-Google-Smtp-Source: AGHT+IE4Aw8hd5mIWQonwOAs79dnF/E6PvSYtVJx81g0bozZ8W28l9pS08dysWRDGDprFBeK9Zlx0A==
X-Received: by 2002:a5d:498a:0:b0:38b:f4dc:44a9 with SMTP id ffacd0b85a97d-38c5208fff5mr12920288f8f.41.1738563812008;
        Sun, 02 Feb 2025 22:23:32 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-438e23d443esm147500595e9.1.2025.02.02.22.23.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 02 Feb 2025 22:23:31 -0800 (PST)
Date: Mon, 3 Feb 2025 09:23:28 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Khaled Ali Ahmed <Khaled.AliAhmed@arm.com>
Cc: "arm-scmi@vger.kernel.org" <arm-scmi@vger.kernel.org>,
	Girish Pathak <Girish.Pathak@arm.com>
Subject: Re: smci: how do reboots work in scmi?
Message-ID: <5b4e131e-8060-401a-b272-9e05c694d58c@stanley.mountain>
References: <a72847fb-afa7-412d-baaf-52da8b0e6fcc@stanley.mountain>
 <GV2PR08MB795555EB6766B147C5420371EBEA2@GV2PR08MB7955.eurprd08.prod.outlook.com>
Precedence: bulk
X-Mailing-List: arm-scmi@vger.kernel.org
List-Id: <arm-scmi.vger.kernel.org>
List-Subscribe: <mailto:arm-scmi+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:arm-scmi+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <GV2PR08MB795555EB6766B147C5420371EBEA2@GV2PR08MB7955.eurprd08.prod.outlook.com>

On Sun, Feb 02, 2025 at 10:12:17PM +0000, Khaled Ali Ahmed wrote:
> Hello Dan,
> the following message still has not been implemented yet:
> - PINCTRL_REQUEST.
> - PINCTRL_RELEASE.
> - PINCTRL_SET_PERMISSIONS.
> - NEGOTIATE_PROTOCOL_VERSION.
> 
> thank you so much for your attention and participation.
> 

Ah right, I was thinking of PINCTRL_SETTINGS_CONFIGURE.

When the system reboots, it would be nice to have a hook in SCP to just
reset everything.

regards,
dan carpenter



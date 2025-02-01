Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74D1B1BBBE5
	for <arm-scmi@vger.kernel.org>; Sat,  1 Feb 2025 13:57:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738418240; cv=none; b=ozt2AacIMBMZY60A7J398JTGb6NZYUriQcAAUMuzxp+DVzuzgKndzawZFLz0ABSiOr6V6cf+uMh/rzwUL/4K5riWfSdn65/Ay4ltnlKX5sW8OX/4UWiA0MqezcKw5+OO41W4hKOiAkuN8gjC0/tgTqO97LMCw5N+8fJbxuqyHEc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738418240; c=relaxed/simple;
	bh=UTA36h3tWIFroPFJO2PlKdaVwkazBF+6IKdnuVt9CVI=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=S+eQ2kXNQ4s+cStr1TqBMd0plAnHI77fRRiKiuo4LmPjjlqY51GdABRg1IofD/QNfE8I3HOptFqF/Xc9Vrzx6uNxaE6sGfbVPsZuS1M96u7ljykM0Gx1t4pznAhtZfBqyArWJ2IaOU9kzDUP5U2F3Q/rsuCyqPjvY6T27ElLsTg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=APda+3JU; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="APda+3JU"
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-385ef8b64b3so2667643f8f.0
        for <arm-scmi@vger.kernel.org>; Sat, 01 Feb 2025 05:57:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1738418236; x=1739023036; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=qGcN+azYeGInLCfpPuhpgtpfMlZPyQSChd2r4jo5GwU=;
        b=APda+3JUudWueygn9MFBvCL5XsVmkm36EfPs9trTH93Jn5c3zqwV+RFlcmFjSmPjzP
         PqcX7mCwCVwmqqbqutc4X1GX6xo78VirYVfERpWu/VTbWAkMtNzLRMFJgAG+uId9iUkJ
         vY0f3WGwWI6S7JZupWk6Tc6X7KJ9E4tR41aTYTmdEXKrn9mL9FYt2eY9ffjxpw1RDkNm
         ThdMUb/oWoGP6LGlAISM5YNVuQ6NKTbz6xxzogVuwUmojkqJ0/+Io5F+AJIGb21lv8O6
         pVUnnjlbTwzPqNJBpR9jt3Xywdtu1TPgmcytzyDZRQx42aqutdtg2SHJ4OTid3G/70yV
         R7vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738418236; x=1739023036;
        h=content-disposition:mime-version:message-id:subject:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=qGcN+azYeGInLCfpPuhpgtpfMlZPyQSChd2r4jo5GwU=;
        b=IzGKWCBD5NRvFZb/2915NRwD/LLeet0xM4Jq2x8upnBX9FNIS/5Q7NWQtaQ8nvPkPH
         aIy0iJcl7zXPQv/ZHoqCjwlaX4R99okZRXUj2nZ2EKrIAoM6M1/S3zgvmBuQnJZqy/y3
         n0ZRAvI7LyHdUQ/wUjRkIkUW/1lnJ6qjTr6AwUOEAzqDSIu9bK7LJPXcT+997LRv/Kdr
         TdodO/6uJuRR4fbwuarFtUQ4Pe7qA+OSyY6TPq+05piNhLk/sB3aR3ISPWmnqNO45/Uk
         86TzOTBWrB1af+jXtqbAp5vJh+52RJXt9bU8cfS6FihXVtq9qLPkiITHJIyVijfL9gAG
         W3Gg==
X-Gm-Message-State: AOJu0YwmIZBHqKNdDGPRKVO8E42XqpyKb8MLndVt/+JkoXSHhX+ihSVO
	tJeYpd7jSzpiHQZtei0Dx3/bLMwgt3+R/CEtqkXBCFF2JjiBOGifDrwfU2GnbUo3UtF5tlGVtYf
	K
X-Gm-Gg: ASbGnctZQLZld6iWSDo7pcfUEDiXhGaVBheV8KniQPa67BEl+te/pqk4jEBucqg581L
	YlTBTPVpoNZJi6g3y/xbzOiwikjVxoud4SVjK1+y6GA/yqrTdfBvIfxTTanm4QXlmr++Rns8nV4
	JI8TOe5uOogKGV3nBAobOz8gUp/g2EGIYyZoFAxIbKGioIjYpkVrAmiDLI4zILJ7mJvjyxPr2N/
	B2sB5gfFtDPLmrlqsr0IZLk4bllqs/oNfC513FbPFnb+Cv4xwZw0o9U6tOWKNjcvuTG45LDtO1S
	9v3qEvw+aHzPw6LmzRwx
X-Google-Smtp-Source: AGHT+IEpGwwZaASl5E+Bude1GvVYkBUPDBe/EVvZ2t6aqusWVHSV7/crZAwInDwxvJKckckGrRCjnA==
X-Received: by 2002:a05:6000:4023:b0:385:fa26:f0d9 with SMTP id ffacd0b85a97d-38c516583aamr12956820f8f.0.1738418236078;
        Sat, 01 Feb 2025 05:57:16 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-438e245f5a5sm89926895e9.40.2025.02.01.05.57.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 01 Feb 2025 05:57:15 -0800 (PST)
Date: Sat, 1 Feb 2025 16:57:12 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: arm-scmi@vger.kernel.org, Khaled Ali Ahmed <Khaled.AliAhmed@arm.com>,
	Girish Pathak <Girish.Pathak@arm.com>
Subject: smci: how do reboots work in scmi?
Message-ID: <a72847fb-afa7-412d-baaf-52da8b0e6fcc@stanley.mountain>
Precedence: bulk
X-Mailing-List: arm-scmi@vger.kernel.org
List-Id: <arm-scmi.vger.kernel.org>
List-Subscribe: <mailto:arm-scmi+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:arm-scmi+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

In scmi with pinctrl then we do a PINCTRL_REQUEST to claim the pins,
but then if we reboot without restarting the scmi server the the pins
are still claimed.  Is there some way to hook into VHOST_USER_NONE to
release all the pins?

regards,
dan carpenter

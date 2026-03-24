Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2C3338A704
	for <arm-scmi@vger.kernel.org>; Tue, 24 Mar 2026 08:44:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774341893; cv=none; b=Do7m1ZdPGf5Zp97N7kUIQ4VotN/zJxwpVhcsVuhat7gwuDfFDJkgfq6iTfW1IKi6J/U3QRNLVqx+bW/8E0V/TN386BEWUBOHZZSdcnW1cfA8UasPIcZZYHvOggoemAvoT3CF68Y1h0eA9Kc4Zp0I3ly4olF0QsYhRAyKt1mnu9U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774341893; c=relaxed/simple;
	bh=udPrt/KAxsrJYRa8C59qXClcTqavIwLcvvnP9zDDsMs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XYsdmpc7vPyAXDbMl7Ks+hq1Qv4YerC5j3j9wpNkvygY4v/594cv6QIMJqFOWs+ShWzWA3EyBOl95xF7YCMn57e1XY5Oa0ZpM3my4EmI8i1RBZ4CsJRBzgUrvPJBTTO5g1ENg5tc5/i0KPuxSn2ztHltoXDYxyCQnuAmBObv6x0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=hppCAceL; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="hppCAceL"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-486fc4725f0so43119485e9.1
        for <arm-scmi@vger.kernel.org>; Tue, 24 Mar 2026 01:44:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1774341885; x=1774946685; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=U83+x6wkw+25P6UMyxbBBiZbmuWAuI7CckONNyqN5Mo=;
        b=hppCAceLg6S5aBHm0LB1/WaDPMo6muAvVe/BY7YauQsHvOFPZACElI8n73TfjVu1DB
         rNZtZE0P32KsD32X/ghZZEwI8bHMrA7QZyJSjP1W4DFR5R7ejkY8DmK6r6nztBs8ZZPU
         ofE5FxTVXL4OK+qIQii8iA5XNgorA6IEDFiz09ZxvXDoVKRSsePjqEYUfphpa8TMmWqu
         qw0y2mulwwY8MhFL/QAv3hBJ1XccYjleXvkE4N/ltubaHs6rFSmlen1KYxgtMYWtzzjQ
         2G7BeGZIfw74KoiHfSp43w+yY300+NZ/47aN6JR/qMJ+7hUpLodYdNAf205qg+eZTEOM
         EOOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774341885; x=1774946685;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=U83+x6wkw+25P6UMyxbBBiZbmuWAuI7CckONNyqN5Mo=;
        b=gwXCGG2A12mNQS6gZAKHGBuksPG5fsJuhiw7CJ6Oa6Y82E85GxrFGHARgIfX+j2XqI
         FJbRKtJTFZu9h6MfnhpeveBKHbf9PdeRZ51CGd8uqlvyGjPH8zjyLViYppC984N8mz1H
         BybvnzDatqFGxQTyJj3r2m2tpQwPJnry0/KrcEqMvN/mU3Tb070rjwvrHKVCaZex4uXI
         kE7fMd8GE8RTtBGjWcO9kX/W7WPrwemc+Qet6gpXQ0eDNrzkszON5IDloVwK2qF/LhiD
         gC8mHFJH24pmA6cg0ZsKbjUmiCVyXuHN6zWpmrGBkzcJnfpNZiEe/IMv073WFbEhOTR3
         NO0w==
X-Forwarded-Encrypted: i=1; AJvYcCUW4EkGvU6uTB4vm3H+JqDdAQ0YrCun8Q/k9sBsSaYo4kvSE8S5LXWQrIna8ecF/A82KoM6N5C40Q==@vger.kernel.org
X-Gm-Message-State: AOJu0YxmEClGadKl0wrRFdrHsKqLd4fVe0wyDdukzeBVilTXpy59EaGf
	CbunBXHnbYNM0UdK00vLd73p9Wi6whytGi43Zl1Zo24hgx4yiRe+lghcJwNSaPoDmG8=
X-Gm-Gg: ATEYQzy2SXsARMr91M17cwi5+422q2fUR5Bwff0PaW3Mzk73FngnfmmK4ZRC9WKfhb2
	VrGwK4R8RKEkp+/mrCIrVjXetilPEuGTdJlo4VqbhihBxgKrNL3BCZxEJ2ajHOFJp7GLhwkbTeD
	0dLZRjPinV471P6ksirO7cl8Wp3gqiUUDwwPDdQRV36OdeseG8+PL/sMJw3VNORTMQUgsMKd9XB
	Vx2rqkQmxBYQO/+gjc7IDs5WxdRIDvn6srGmOHBsgwaCdJ60G8Qyuabqmdhm9NmkD5DfCYR8IW1
	PIkOIvTMqkeaJZbO47RC4FAL8qMxKcNbYmDOaveFX+/BKRlyD2405cq15ks8cq7pbnbcJEXb+bu
	H11PgyV5DP7hWKfWGkVNdhuR9XKWy7lmkTsCigDQfUGrg75OnKikOWPjIKMhmKSpawWJ6CygPGT
	tIQ3+99FgCpACeYnEEr3z5hfh3yReR
X-Received: by 2002:a05:600c:4ed2:b0:47e:e48f:43b5 with SMTP id 5b1f17b1804b1-4870f23d28dmr43386555e9.18.1774341884540;
        Tue, 24 Mar 2026 01:44:44 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43b644ae048sm36111394f8f.1.2026.03.24.01.44.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Mar 2026 01:44:44 -0700 (PDT)
Date: Tue, 24 Mar 2026 11:44:41 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Khaled Ali Ahmed <Khaled.AliAhmed@arm.com>
Cc: Jens Wiklander <jens.wiklander@linaro.org>,
	"arm-scmi@vger.kernel.org" <arm-scmi@vger.kernel.org>,
	"op-tee@lists.trustedfirmware.org" <op-tee@lists.trustedfirmware.org>,
	Mohamed Omar Asaker <Mohamed.OmarAsaker@arm.com>,
	James King <James.King@arm.com>
Subject: Re: OP-TEE: memory corruption in
 scmi_pin_control_list_associations_handler()
Message-ID: <acJO-etj8Xu7Nssb@stanley.mountain>
References: <aXyVSfxbrff_GX8A@stanley.mountain>
 <GV2PR08MB79551A173F9B2762E6860FD5EB65A@GV2PR08MB7955.eurprd08.prod.outlook.com>
Precedence: bulk
X-Mailing-List: arm-scmi@vger.kernel.org
List-Id: <arm-scmi.vger.kernel.org>
List-Subscribe: <mailto:arm-scmi+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:arm-scmi+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <GV2PR08MB79551A173F9B2762E6860FD5EB65A@GV2PR08MB7955.eurprd08.prod.outlook.com>

On Mon, Feb 09, 2026 at 02:57:17PM +0000, Khaled Ali Ahmed wrote:
> Hi Dan,
> Thank you for sharing the proposal. We are happy to accept this solution once
> it has been pushed to a public repository so we can review and track it
> properly.

Thanks Khaled,

I've pushed this to:
https://github.com/error27/SCP-firmware.git optee-fix

I had a mistake in my original patch that I sent because I accidentally
sent the wrong version which still had parameters as const so it didn't
compile...  :/  Fixed now in the commit on github.

regards,
dan carpenter


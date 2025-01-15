Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D51D229A5
	for <arm-scmi@vger.kernel.org>; Wed, 15 Jan 2025 12:14:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736943290; cv=none; b=ezglKuA1ijOzAWX/dH7WmwnI+FN9Q5FH6MKaUFRSoCXBwK0bWAFVMNaFTPy/7ACScd9K/3yps5mmpfE4YVYyHCI6LnZs16pWvuMhYMUYknxHZahQAIfPtWjag+3P70rP6ebLW0V+60xdkwSrVC+vBCMMqyQ9B/SOCOWOmPn1SbQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736943290; c=relaxed/simple;
	bh=GGBi3dQpAlZWyQyPb1N312ERdMLTRtLjiRyGTQVUtVA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AaLET5dqWLyeVZWkaG1C84XFZ/P+iIikuzagoyw+2+cgyIUuEIJRoFfyBBII3BgJd6kNkk8IV2rkgmPZOZV+9ULUM58A8DrLuByaPLvWHnx5KQNT3PW1WJg1N9IKjfOlDBC2n/6tjDZ3Hzz21usaUyRjmD1+nl1PR4syZ/cYLvE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=utdrxezD; arc=none smtp.client-ip=209.85.218.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="utdrxezD"
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-aa66c1345caso180242366b.3
        for <arm-scmi@vger.kernel.org>; Wed, 15 Jan 2025 04:14:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1736943287; x=1737548087; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=w5TTCaUa0LAPxlj+dDgnj3DEeFReNEc3gkBFPCAg3tg=;
        b=utdrxezDSwn8VDsSJMB+/oYHQLk751J5iY2ALlLBxlLgixymETiqscRAtdGp7mZgkU
         iHmvudu8d2IUx0zc87lnTlkMvfnTlEAQZnwwWf0Jh2c2Ku+BPktwsb7g3FNWwYvYsxyl
         L7F3JLqLDPSV21gn6FezJiB2MchE+1jZ9srC9u2bXH+dFiQOAhbIBF1zPN2nUAZHgVvK
         b3i02NzwEerLSNXya09fKAnEhhWdBp2/1aRtA1hdnzia3YZ2UtPXpWqNcqUps2g5E700
         VHsiSzYrxluUA9fy1AcZyphZhCYH3EsUlLHUxWu4fMtSu27VaTA4yd9JKXHnFxtrjwrU
         UmbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736943287; x=1737548087;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=w5TTCaUa0LAPxlj+dDgnj3DEeFReNEc3gkBFPCAg3tg=;
        b=HHxa9u2qGJ5qo2WSlyWY1Z9VcG4U/PL/omunlNb+RWMgLmBNvPHO27LVSTrM/yedsf
         Mfwj+Zhefp+HhD26grqftZQJzC7+VTVc2R7gBF9dg1YRuWwB6MthmwLqJ53isCvd4geC
         cyBpElkjmnQXvCl7kjeGWRCmUp4a+vcPLcKZG6wPmrKQNxjRgbvGy29NM6vl1eFkP1yn
         IjFWHEX47SVM/fYqVR5QC5MMk8v5WqtCguqBIlS4/Kap2nJtzqk8rhmusEg3ml2nFW1e
         HBMFNoTmGD5aXkNOqebTPKVhXWkrQEV/89pHsiW8l32rWk7jd9Wy3EX46Hh4MSrx6DT6
         xCpw==
X-Gm-Message-State: AOJu0YzwkofMWEzj4UtWvMgvaaxjPJTKUMozfKZTfAGSwwHskh2QY1kK
	OLHNIGFYdGV0QIjfjjC96kMLkYR7jw6iCEwjPqJhFg/tpXtH5ES/ci6wrb0UJJJtvAYsQrlmxgG
	L
X-Gm-Gg: ASbGnct8y3nyurRgVAezbCjT2ux99Pvc6zlzZUcRa4fGBgx9s//QXjCgoBoX9SVMVQg
	rM7BlsjIccU+tadZelK5z6PIvYfWY6nLk4F1xvgtsX/fQ84Lkfs6mHBZ1+nh0TkIAUvjvBNdo7A
	LYiJ1Nyq3fxcdCNdXCqaBxL0rxFymqZ3VQhVHEudpbKdAzaPvrlRtuUv56n8VddVgM/lmH+0axn
	k8MMyXZno5Lh7WDGoYEVMhmO5PlnaZFtmZluxDMrGdmnleOnuSebZNg5Hgn1A==
X-Google-Smtp-Source: AGHT+IELmNPBRZF/QBmUQiDZ99fWBsqMUVWC97bSL7c9jzotcNUv/RJPDbb/Mc9VJ5aJl81MG9mnpA==
X-Received: by 2002:a17:907:2d24:b0:aa6:90f1:a9bb with SMTP id a640c23a62f3a-ab2ab6c6738mr2910599866b.24.1736943286972;
        Wed, 15 Jan 2025 04:14:46 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ab2c95b09b2sm755465366b.146.2025.01.15.04.14.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jan 2025 04:14:46 -0800 (PST)
Date: Wed, 15 Jan 2025 15:14:43 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Khaled Ali Ahmed <Khaled.AliAhmed@arm.com>
Cc: "arm-scmi@vger.kernel.org" <arm-scmi@vger.kernel.org>
Subject: Re: [bug report] SCP: memory corruption in
 scmi_pin_control_list_associations_handler()
Message-ID: <3b098d5e-5978-4160-9cb0-16cfccbd9bb1@stanley.mountain>
References: <Z4eMsp1jo4zlNmpb@stanley.mountain>
 <GV2PR08MB795595222CD06A1F5B60CD0FEB192@GV2PR08MB7955.eurprd08.prod.outlook.com>
Precedence: bulk
X-Mailing-List: arm-scmi@vger.kernel.org
List-Id: <arm-scmi.vger.kernel.org>
List-Subscribe: <mailto:arm-scmi+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:arm-scmi+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <GV2PR08MB795595222CD06A1F5B60CD0FEB192@GV2PR08MB7955.eurprd08.prod.outlook.com>

On Wed, Jan 15, 2025 at 11:15:25AM +0000, Khaled Ali Ahmed wrote:
> Hi Dan,
> 
> write_payload API is a helpful function and can lead to easier and
> more effective implementation, while we ask the Transport to set an
> object into a certain offset in a service_id buffer, the main reason
> for that is that we don't know if we will continue the loop
> successfully or not.
>
> after that, we should call respond which will trigger the Transport
> that the buffer now is completed and please respond whenever you are
> ready.
> 
> regarding the previous description, I encourage you to use write_payload
> whenever you can.
> 

I get how it could be nice, but it doesn't work.  I am looking
at transport_write_payload() in particular.

>    385          status = scmi_pin_control_ctx.scmi_api->write_payload(
>    386              service_id, payload_size, &object_id, sizeof(object_id));

In this code we're writing sizeof(object_id) bytes to the middle of the
buffer.  Nothing in transport_write_payload() is saving the "size" so we
don't record which bytes have been written to.

>    397      return scmi_pin_control_ctx.scmi_api->respond(
>    398          service_id,
>    399          (return_values.status == SCMI_SUCCESS) ? (void *)&return_values :
>    400                                                   (void *)&return_values.status,
>    401          (return_values.status == SCMI_SUCCESS) ? payload_size :
>    402                                                   sizeof(return_values.status));

Ideally this code would write sizeof(return_values) bytes to the start
of the buffer and do the transfer.  But we're not passing
sizeof(return_values) as a parameter.

Instead, in this code we're passing "payload_size", which is the total
number of bytes.  So it does the equivalent to
memcpy(channel_ctx->out->buffer, &return_values, payload_size).  That is
a read overflow of the return_values struct and it scribbles over the
data that we copied earlier with the transport_write_payload().

regards,
dan carpenter


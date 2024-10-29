Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64486839E4
	for <arm-scmi@vger.kernel.org>; Tue, 29 Oct 2024 10:21:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730197268; cv=none; b=N7JAS3s9h/71na4kPWK4hJmvPFBVrjXV6AnLtG1SEB8Cthhom/jIqt04lyCpg41tCVjmRTMFooD+3Q9g7MLyMuuFiTxb/0mSIAf7WVJOjaaS/mrzJSYrKgFrXLc/InVywlz4wsaJNlVJdjXoEIJv2WTV5idbjXt16u6F+MgraEM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730197268; c=relaxed/simple;
	bh=+zkeeFWZJ1cZV1gDPDLnpFMddY1t5CgemI2Z5BProAk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ujE7pjR2L2FGLq7qY6ewzaw06jm40P347Vq9LL4TsJ2MNrAAH1zE9GRIpg5Z7C6NiRr/kIQHMTBP3ParimjJMAu4HSZ3yxJ/1DTLbdSOZOXjDYJmg15c5VDOart+C+/Ykf09/C45GdJjYqvIcwWhzW9QVeENBpOp73RV6uX56Co=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=k6Yaq2Ln; arc=none smtp.client-ip=209.85.208.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="k6Yaq2Ln"
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-5c97c7852e8so7499579a12.1
        for <arm-scmi@vger.kernel.org>; Tue, 29 Oct 2024 03:21:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1730197263; x=1730802063; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=hbcZhUKsn2Os4QAM6MBjT5dIiGHw95eCh38DFQ9VwQY=;
        b=k6Yaq2LnxKM+pN/NDgghMcA7M56zMjBtcjVVI6VeYMx96ciy/xCSOygF1iMxT6SLng
         KjJG9HpdtdQbAtmLRi83c/UJ+Jr1S4UMJkfQISH20DFQBP6UUjkbzxoairQ4nQX+1BCq
         pCkuyeHhkbfs5crVz0kE0SxArBJFi3DOflDUWVfadYiWmv/HDv8WxMFXSHCJE4eJOdfI
         3L89dqOdf7YPLfT0D3ZRMIaoJhEbuLurPcmEA4eUOeF0qfJGp0bbYIEsHBjLRXeSZshc
         HpcheEnHctUO8up7l4vSbOBYFy06Jsqa7bWodqTavwQNl/kvgOUtHhgfNDFkYymk+5Ic
         E4SQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730197264; x=1730802064;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=hbcZhUKsn2Os4QAM6MBjT5dIiGHw95eCh38DFQ9VwQY=;
        b=E1LhvplexxSAKjncarUfUdU3gSR4QwVxme/MUOs8uWqoGokWKmuhTP5ohO/XQHdL9g
         KJBfKbfMA1vJW41YZsfTWl0REI+vSOiJ/3hidgyZhxteBPIpc3dqxPz+Wa3MzCt52ObS
         6tvj89kTqHOnvg4D6Ln5/XO+ZOUP3gAAPhViZB4GDPc19QR0T/2CK97Jcbo4UBmErJWy
         59sISk7Cni2zjR+xWp8sNnELs4m3cBpBfa8QLD6c5Mh0rp29tp/ZVnRbSb+0L6Fq1ydL
         TeVbTevTIP9BY/NseEFh9oDmrjPN0HC2XcCv1aNKmNvgEniL0M4vTt4byOlByvn96Fpk
         PDZQ==
X-Forwarded-Encrypted: i=1; AJvYcCWGTFcjZq2i7Q/RRF4ubeU19Ti2eyTUBViQCSn+rzruqvJ4B5jMBdu8lN8o8djy0lfCy343jCFPMQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx9lHk7nmV0tdY9Kpqegyn0yYB5syws89uL3jfXmHzQoOTSmnz8
	z8g9mXMZUGtPC0XEuVEncWJzwhPvevDDEuvR3EZKkNqirjsxBq2a8Pnbki3skLM=
X-Google-Smtp-Source: AGHT+IHDlm034VqmDRFfZs23nWT+KvNVLcNT+Jgz9gLdGce2GexmDgN0eXFqpAfs8C7MqjvWYhZVzQ==
X-Received: by 2002:a17:907:742:b0:a9a:ea4:2834 with SMTP id a640c23a62f3a-a9de5d93138mr1002091266b.33.1730197263645;
        Tue, 29 Oct 2024 03:21:03 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a9b3a0834a6sm458571066b.191.2024.10.29.03.21.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Oct 2024 03:21:03 -0700 (PDT)
Date: Tue, 29 Oct 2024 13:20:58 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Cristian Marussi <cristian.marussi@arm.com>
Cc: girish.pathak@arm.com, arm-scmi@vger.kernel.org,
	vincent.guittot@linaro.org,
	Linus Walleij <linus.walleij@linaro.org>,
	Souvik.Chakravarty@arm.com
Subject: Re: Question about identifiers
Message-ID: <f305d661-71e8-48c0-a6a5-4271c0436bc1@stanley.mountain>
References: <c5fdc171-0dc7-4c38-88e7-fcf9de7cbec2@stanley.mountain>
 <ZyCuAKfqRnuFdAwC@pluto>
Precedence: bulk
X-Mailing-List: arm-scmi@vger.kernel.org
List-Id: <arm-scmi.vger.kernel.org>
List-Subscribe: <mailto:arm-scmi+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:arm-scmi+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ZyCuAKfqRnuFdAwC@pluto>

On Tue, Oct 29, 2024 at 09:42:24AM +0000, Cristian Marussi wrote:
> On Mon, Oct 28, 2024 at 06:09:50PM +0300, Dan Carpenter wrote:
> > Two questions:
> 
> [CC: Souvik]
> 
> Hi Dan,
> 
> > 
> > 1) In SCMI pinctrl protocol each pin, group or function has an identifier.
> >    uint32 identifier
> > 	Identifiers are limited to 16 bits, and the upper 16 bits of this
> > 	field are ignored by the platform.
> > The linux-kernel assumes that the identifiers are basically, 0 to nr_pins,
> > 0 to nr_groups and 0 to nr_funcs.  Is that a fair assumption to make?
> 
> It's not an assumption really, any SCMI resource on the system, across
> all of the protocols, is identified by a number in the *contiguos* range
> (0... TOT_RESOURCE - 1) where TOT_RESOURCE is usually gathered with some
> discovery initial command...looking at Pinctrl specifically in 4.11:
> 
> "Protocol commands take integer identifiers to describe a pin, group, or function.
> The identifiers are sequential and start from 0."
> 
> Pinctrl deviates a bit from this since you have 3 different kind of
> resources, so you have 3 different TOT_RESOURCES values to query.
> 
> ...maybe adding "sequential and contiguos" would have been clearer...or
> maybe it is just that I am used to SCMI spec parlance/world so I
> implictly interepret like this...
> 
> IOW, for any protocol, in general, the platform is expected to expose
> to the agent a contiguos set of IDs numbered from zero...i.e. without
> holes due to reason like 'resource X is not present on platform Y so
> we'll leave a hole in the set of IDs returned at discovery time because
> is easier than remap the physical resources to the set of IDs exposed to
> the agent'
> 

Alright.  Good.  Thanks.

> > 
> > 2)  In the spec 4.11.2.7 PINCTRL_SETTINGS_GET and 4.11.2.8
> > PINCTRL_SETTINGS_CONFIGURE it only allows for pins and groups, not functions.
> > Meanwhile gpio functions are functions.  That's just a mistake, right?  I've
> > been working under the assumtion that it is.
> > 
> 
> Mmm, there were a lot of discussions around functions and GPIOs (which I
> dont recall now) and a last minute rework to some commands in that
> regards, so that now you can use those 2 commands to (optionally) get/set
> the selected function for a pin or group specified in the command.
> All the other configurations are, indeed, only pertaining to pin and groups:
> what do you think is missing around functions ?
> 
> Moreover, are you sure that you have the latest v3.2 spec from developer.arm.com ?
> 
> Since there were a lot of betaS for v3.2 cycle...with changes especially
> around functions/gpios...so many betaS that, till last month, AFAICS, even
> the ACS SCMI compliance suite on the tip of master (still not an official
> release, though) was broken, since it was really implementing Pinctrl
> testcases against an old obsolete v3.2-beta (i.e. testing non-existent/older
> pinctrl commands...and I have fixes to upstream for this...once I'll have a
> bit of time...)
> 

I am using the 3.2 Spec.

In PINCTRL_ATTRIBUTES it says that GPIOs are a function resource, not a group
resource.  See the last line especially.

  Bit[17] GPIO function descriptor

      Set to 0 if Bits[1:0] of the flags field in the command is set to 2, and
      the function does not support GPIO functionality.

      Set to 1 if Bits[1:0] of the flags field in the command is set to 2, and
      the function supports GPIO functionality.  The agent should ignore the
      value of this bit if Bits[1:0] of flags field in the command is set to 0
      or 1.

      This value of bit must not be 1 for more than one function associated with
      a pin or a group.

Either way, he PINCTRL_SETTINGS_GET/PINCTRL_SETTINGS_CONFIGURE need to add
functions.  Here is how that reads now:

  uint32 attributes
  Bits[17:16]
      Selector: Whether the identifier field refers to a
      pin or a group.
      0 – Pin
      1 – Group
      All other values are reserved for future use

regards,
dan carpenter

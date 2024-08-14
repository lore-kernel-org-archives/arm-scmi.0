Received: from mail-ua1-f46.google.com (mail-ua1-f46.google.com [209.85.222.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76061142911
	for <arm-scmi@vger.kernel.org>; Wed, 14 Aug 2024 06:53:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723618387; cv=none; b=lPWSj4JHfO5UZIl9VPEF/xEN6kiGAv6SFN7KUjkV1/tnr7VPKUDlEJh9vqunsLLRGkoRIG8eIBxlZFjpT8FycJPJcZucE9Pw5D55XXlHC66dNJw7qdRg0J+ya+U/B+CD008ofkzOP8XRqY6uAlgZhgmD1W2gi49GJS5/whnZckM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723618387; c=relaxed/simple;
	bh=ixxzo+N108Z5EX3s8hcaxHPeH+YdBW0idXNB08wrhog=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=I/bhr9cPlxgFS53X8DNf3exkbwSqBFCTTghCtlOnds3MHqNBHpGw05rAs+MEGMSKdFJxUdahl4nOz+oiQsTRFhzovRpQJZ70XbGxZiZIcrbrS6O94uN6rtAQtRfsB4YliRCJQxhERDcRN86HhP0q/6mUAvPn80WxA0lRe2EUYRA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=yKChJImY; arc=none smtp.client-ip=209.85.222.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="yKChJImY"
Received: by mail-ua1-f46.google.com with SMTP id a1e0cc1a2514c-842eee4ad03so86561241.0
        for <arm-scmi@vger.kernel.org>; Tue, 13 Aug 2024 23:53:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1723618385; x=1724223185; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ixxzo+N108Z5EX3s8hcaxHPeH+YdBW0idXNB08wrhog=;
        b=yKChJImYUK7gclKJNIBZbACYsaiktJuOrdoHmgkJgQ7lJkiG8yTEUFkskVyD07NRld
         zT2Up3me8iCPYUDuDkJ1e7wIiqtirQugfbIStnUTAs9O2EVcJz5NB6Pl/YsLBQ0u+/Cu
         gIAF1Oo3dVyhj/H2eVwZ/26hCl5AYBdMVJ9I90e/73A09TGnjfqI48nJd+/2HdtKKykZ
         OSbEVd09TH9TRherWiad2estcW+MEV/NTIiCmJZzsyuopYkFvKo7qx+KWE7nR8GloG2v
         3QtWL8WkVtVztuIRxxoujmL9Wbvg7mX1g7o2u4HeQmBF1JACa1eXo/8rQjLLdGlLEr3T
         z0YQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723618385; x=1724223185;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ixxzo+N108Z5EX3s8hcaxHPeH+YdBW0idXNB08wrhog=;
        b=vf/2RkHvMWbmBsPjKvgqgAhX+favmi2cysxFRZQ1TP34Or25E62BxgPwPEnihrza+E
         8gjutO9OfveKsxU0VIBF+bQ2a6Oxj4gKLrQuuI+R47nBvXJGSFxYgfQvS/IaEXQB5jPa
         gwzT8ERx/S+Q7VWbP4RZD3MLc7zC+m5kEXbZgY5Oh+plHRrWnYjAyu/YdlgzLKM4DqWe
         vigPlVQNwvXBhKgOnE/2r2OHk8uek9twBPJUUuyqN1+CGmUiwV/MzmNhnzBkCw7+l2T6
         eboEOI7n0DId3rMhr6OvDU/9r6lDt6q5fiWE6mZgbNhDpM2dwI7RREQttymuCRWlF8j9
         jgzA==
X-Forwarded-Encrypted: i=1; AJvYcCWZFo1NiWksrPWAfUbC1W4qRCgI7/sEFSs4vVhu77gmavZEi/pa3F43Xgcj/LyrpK9cIzVk6+LAJMuGopdVvYLJ03+LxSQ1Jx0=
X-Gm-Message-State: AOJu0Yzkfm4olbnPF4RQfkJklZZEg35YojbttDZipdnJYSXbtgGcwbd4
	Ch/wjkXctsEVoJYVWFIyK9cnMvlXwkMKz6dFdCumxc4qE7q0QS5HCbXyIDkwB0XtuyqLnyoEnzm
	QMefrb0jm5PlX7PIKctGlij+Ki90dAGuHSHOy
X-Google-Smtp-Source: AGHT+IE0DkAjCweX/wvCQVml9QIIkd/RSYNzJgyY7wB8WK4kkMp0tvziRgUQ6R5yFu7dxxZhM7seem3AsM1Geia+xqs=
X-Received: by 2002:a05:6102:1625:b0:48f:463c:2fbd with SMTP id
 ada2fe7eead31-497598ab30dmr1906131137.2.1723618385170; Tue, 13 Aug 2024
 23:53:05 -0700 (PDT)
Precedence: bulk
X-Mailing-List: arm-scmi@vger.kernel.org
List-Id: <arm-scmi.vger.kernel.org>
List-Subscribe: <mailto:arm-scmi+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:arm-scmi+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <PAXPR04MB8459FDF32FAD5EFD3D14509C88872@PAXPR04MB8459.eurprd04.prod.outlook.com>
In-Reply-To: <PAXPR04MB8459FDF32FAD5EFD3D14509C88872@PAXPR04MB8459.eurprd04.prod.outlook.com>
From: Saravana Kannan <saravanak@google.com>
Date: Tue, 13 Aug 2024 23:52:29 -0700
Message-ID: <CAGETcx-cewZyTz7oGdji_KDcrx3PJeeiVF8+C8A0t5OOWHHvKg@mail.gmail.com>
Subject: Re: fw_devlink for arm scmi
To: Peng Fan <peng.fan@nxp.com>
Cc: "cristian.marussi@arm.com" <cristian.marussi@arm.com>, Sudeep Holla <sudeep.holla@arm.com>, 
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, 
	"arm-scmi@vger.kernel.org" <arm-scmi@vger.kernel.org>, Rob Herring <robh@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 13, 2024 at 7:52=E2=80=AFPM Peng Fan <peng.fan@nxp.com> wrote:
>
> Hi Saravana,
>
> Hope you are doing well. We are facing an issue with
> fw_devlink for arm scmi drivers. Per my understanding,
> the current fw_devlink only supports one device for
> one fwnode. However current arm_scmi bus driver
> could create multiple supplier devices for one fwnode.
> But the fw_devlink only use the first assigned fwnode->dev
> as supplier or consumer, see device_add.
>
> Do you have any suggestions on how to support multiple
> devices created for one fwnode?

I replied to the patch that triggered this email. Let's continue the
discussion there. I don't want to have the same discussion in multiple
threads.

-Saravana

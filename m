Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com [209.85.208.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63A5F30507B
	for <arm-scmi@vger.kernel.org>; Mon, 29 Sep 2025 13:59:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759154376; cv=none; b=ZUAvfTVt9ox+fTxIXHWUXEgjfZuKmp62AmYSmP1LFWfeGdC6VPxuc2ZxJpQV2FB058lYQLk4R19LmVq88ehjm2rJ9Q8v9fJ6AeILOkpbY+RAAlF9RIxSpGywQi6p281p5SVXuePxcMsoJIXu6U6f8WARgJmjOTiEQE7eVVccsVs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759154376; c=relaxed/simple;
	bh=cHo/5Uw/EA4lLPvDE2kQ5v4olHi85t62eQxfHrF8wg4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=NuUB6goLJWDdCkLXBcwcfQjXr437oXvw3x1YisCFO5kxNSFYB8MfGGhQ3WgZP5dx1dL8bLOAYxOBRojA3IaBLRzQ/aCJSL62/IG4nXTDf68KaGzZSidJfIuYaLdIl5eFiOf51s3PgrJ632J7xPVutunsZOoylA3DaHJSWBGbgjw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=V0Zgc2IF; arc=none smtp.client-ip=209.85.208.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="V0Zgc2IF"
Received: by mail-lj1-f171.google.com with SMTP id 38308e7fff4ca-36d77de259bso41875081fa.3
        for <arm-scmi@vger.kernel.org>; Mon, 29 Sep 2025 06:59:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759154372; x=1759759172; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Tn3Avk5AvmztUGNnWXF/nJAfWJJ1CXyUYLany5OsKJs=;
        b=V0Zgc2IFUDvjLFtfH7X7mlQBd4meDOlNtFqu7zk/WFIQ2ztOuHzXaJYD13DJwrx/mQ
         rexu366Cr8ICWDI9i8yvYtHB7NJLWrLGBgSYo+KkRpL/3AZm7jzze0FTdtg2VkfGo/Po
         UXjSxZs60bdF27r8Gcj3Z6zY33MVBRKlk2rutWsrp1tX11C+bE89V3tcnDLI3r4JpZj0
         KEX5TxRgZO1EDvtfgVbh2Ra4dWzATrcnGS7djiCq/HILp5uMdeaLDXnag6EqiQzrrIG/
         1fuQjEc3gd7atf5rrPRLio/RcDcK6dFeogbP5K5q3uSuegROlYqmh3BMvgGikYVNnHU/
         Axzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759154372; x=1759759172;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Tn3Avk5AvmztUGNnWXF/nJAfWJJ1CXyUYLany5OsKJs=;
        b=SutBb46mIu8TYsMOpdcZSYpeeTtUd/2Y/aXU4nYBUkzyLE2n69RhV924gTm07PzjhG
         Sc6YYPRsQBJuor23C4+qtvUl30fSHYlpfhUJXrCfRP9R5wPXadYxTRTNkZmnUCumUQvH
         p6Y/BcZjqvbbtbLpkaqOfa97T6klK737kMIeUg6pPk+B7BPJ9QyMaBxLrQsxdOMxOrsY
         KXBdpcCVBHwwaXbwWrlOo2MUfH5jtESkFcce0UqL3p9bX85UlrhshpmPea5llt7UM/by
         hGmGFGGB0VkZMJNOTWy+u4/lbOWUXvvnHdds623d6rDssEGySYHl4Re0rVl2Cc04RkQo
         oFgQ==
X-Forwarded-Encrypted: i=1; AJvYcCWKEwwCRb6RaWu3Bpo6pQGTmqcyxNDi5Kx3WjnYfcD4OrW7cgiA31hy07FSEiaOgVbO1Ny2LZJoqg==@vger.kernel.org
X-Gm-Message-State: AOJu0YwD9kAUyac3kghV0qAi0EmOBuhX2pqo/XMCFEvhTNn5DTr0q1bC
	nilWQg6FtYvb0znopvrPVTADsfmDmYy9y4LTZKRAaJrdNN3ylZOTxMLQ0jL3BHogY23mC/af0N1
	bNMKHTbAn8f5E4ld8as9zzP2fTgKEebc=
X-Gm-Gg: ASbGncvXfeqTLMnCE8DGu4Rx+upk+O+PE2a2QFAMQrG3KNlHKYHrfEyOBJrn2fihafN
	Xjo7SUsFpG5iCx7BqlQfVYRHvzRwRyd0TCYZ57YOWegVCwjAPIQyDNC7VmCWzbU24Mua4S8pRV4
	hHaWroFr2VgKcXH+E6Y5b6a4eJudfUsQ30+jEViPB/U4zSo9LDM3WM1/kLdvFZ0C5PtKvK04rAn
	+f4KeaX
X-Google-Smtp-Source: AGHT+IFQMc2ZhC+qB5qBNTFzlSmGZTbZSbdvhysvapOami6uME9wqlRM7n01iOstIURuUcWOOB3dn1XgG0MQDMDVEy8=
X-Received: by 2002:a2e:be8b:0:b0:36e:9e8f:ba4d with SMTP id
 38308e7fff4ca-36f7dda318cmr45418311fa.14.1759154371959; Mon, 29 Sep 2025
 06:59:31 -0700 (PDT)
Precedence: bulk
X-Mailing-List: arm-scmi@vger.kernel.org
List-Id: <arm-scmi.vger.kernel.org>
List-Subscribe: <mailto:arm-scmi+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:arm-scmi+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250929131422.525315-1-a.shimko.dev@gmail.com> <20250929131422.525315-2-a.shimko.dev@gmail.com>
In-Reply-To: <20250929131422.525315-2-a.shimko.dev@gmail.com>
From: Artem Shimko <a.shimko.dev@gmail.com>
Date: Mon, 29 Sep 2025 16:59:20 +0300
X-Gm-Features: AS18NWCKpFCfKaruIKOnLjxXbmRphQr18T_eSaDDwQi8eODN-NG1hz7yNExfCRg
Message-ID: <CAOPX744ZGubWevHs53xT_WrbUGVbmSDU4-zuPebqJ9tpng+C0A@mail.gmail.com>
Subject: Re: [PATCH 1/1] rivers: scmi: Add completion timeout handling for raw
 mode transfers
To: Artem Shimko <artyom.shimko@gmail.com>
Cc: Sudeep Holla <sudeep.holla@arm.com>, Cristian Marussi <cristian.marussi@arm.com>, 
	arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello maintainers and reviewers,

Sorry, these patches were sent in error. Please disregard them.

Thank you for your consideration.
Best regards,
Artem Shimko


On Mon, Sep 29, 2025 at 4:14=E2=80=AFPM Artem Shimko <artyom.shimko@gmail.c=
om> wrote:
>
> Fix race conditions in SCMI raw mode implementation by adding proper
> completion timeout handling. Multiple tests in the SCMI test suite
> were failing due to early clearing of SCMI_XFER_FLAG_IS_RAW flag in
> scmi_xfer_raw_put() function.
>
> The root cause:
> Tests were failing on poll() system calls with this condition:
>     if (!raw || (idx =3D=3D SCMI_RAW_REPLY_QUEUE && !SCMI_XFER_IS_RAW(xfe=
r)))
>         return;
>
> The SCMI_XFER_FLAG_IS_RAW flag was being cleared prematurely before
> the transfer completion was properly acknowledged, causing the poll
> to return on timeout and tests to fail.
>
> =D0=A1hanges implemented:
> 1. Add completion wait with timeout in  scmi_xfer_raw_worker()
> 2. Signal completion in scmi_raw_message_report()
>
> This ensures:
> - Proper synchronization between transfer completion and flag clearing
> - Prevention of indefinite blocking with timeout safety mechanism
> - Stable test execution by maintaining correct flag states
>
> arm scmi tests: https://gitlab.arm.com/tests/scmi-tests/-/releases
>
> Signed-off-by: Artem Shimko <a.shimko.dev@gmail.com>
> ---
>  drivers/firmware/arm_scmi/raw_mode.c | 8 ++++++++
>  1 file changed, 8 insertions(+)
>
> diff --git a/drivers/firmware/arm_scmi/raw_mode.c b/drivers/firmware/arm_=
scmi/raw_mode.c
> index 73db5492ab44..fb83beb42e7b 100644
> --- a/drivers/firmware/arm_scmi/raw_mode.c
> +++ b/drivers/firmware/arm_scmi/raw_mode.c
> @@ -468,6 +468,12 @@ static void scmi_xfer_raw_worker(struct work_struct =
*work)
>
>                 ret =3D scmi_xfer_raw_wait_for_message_response(cinfo, xf=
er,
>                                                               timeout_ms)=
;
> +               if (!ret)
> +                       if (!wait_for_completion_timeout(&xfer->done, tim=
eout_ms))
> +                               dev_err(dev,
> +                                       "timed out in RAW resp - HDR:%08X=
\n",
> +                                       pack_scmi_header(&xfer->hdr));
> +
>                 if (!ret && xfer->hdr.status)
>                         ret =3D scmi_to_linux_errno(xfer->hdr.status);
>
> @@ -1381,6 +1387,8 @@ void scmi_raw_message_report(void *r, struct scmi_x=
fer *xfer,
>         if (!raw || (idx =3D=3D SCMI_RAW_REPLY_QUEUE && !SCMI_XFER_IS_RAW=
(xfer)))
>                 return;
>
> +       complete(&xfer->done);
> +
>         dev =3D raw->handle->dev;
>         q =3D scmi_raw_queue_select(raw, idx,
>                                   SCMI_XFER_IS_CHAN_SET(xfer) ? chan_id :=
 0);
> --
> 2.43.0
>

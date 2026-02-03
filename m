Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF70A1F583D
	for <arm-scmi@vger.kernel.org>; Tue,  3 Feb 2026 12:45:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770122742; cv=pass; b=P28JOBiHlANjB5WnPPaSw98mhGwcvZr0ynIC9Ot9BgF75/nujMi89+RtDmgqSAx7NKgKejqVbZYpoP/fXPTZEwUMdZSBCdIpvOa43FiwJ17yeR7ydLlItyDi3+vkFN+6M8WZqUdmeKRvm9pb6E88rz0DfjWI3uhWrfdVEYyOnh0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770122742; c=relaxed/simple;
	bh=KoyfT3Os4pQtUDlujEebg6EiOL0R82EtKNerfIW+df4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=CHIReaQ3IQ01r0vl9jLk6g773JgYIkFvpwsPVIJIgqkY3pWdcpUwXkmfK4sSvP5SSlyRjz9s0GWlq6RkunjPgYr3L6fs5qK3XZ8em8BvqW1sK34YqWcbvFRrMjx9/F1dLEvDTOKbAc77Oa5e/zdCiaU+BWfg/Y0Fl/d2EgkOxGk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GZE4HQ9Z; arc=pass smtp.client-ip=209.85.208.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GZE4HQ9Z"
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-64b92abe63aso10305906a12.0
        for <arm-scmi@vger.kernel.org>; Tue, 03 Feb 2026 04:45:40 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1770122739; cv=none;
        d=google.com; s=arc-20240605;
        b=W0VS6X6r1aTMUz39ZUpSEvvtDPDazjsEZs2DcBsdSAXrZtbVEZEGlta0KOUOfkqoTh
         2vDSBayV2/9eHyd0WgKTGl373rYR6lulGcF5DYizriY1i0FItOIedYGr/UtxGfgNstrw
         Ax+5Ng87GBIiNDecZDVkPiEdisjCmsTl7lbp75Mk+LX+zoNJ71CVRBqWzj/3X5jlBqHO
         DJFVjapKYFFMJu3kkWheuHiJxoopkT5uCG3YXavQkZIBBO7Gx0Ood9hva57hDfbFfFIn
         Vth/5h8pdGjBifEnXNCXSKCeLKspQ7lpbnV58F8vVr8+/D5E4MkNcTI+5M2/iSpynUjh
         ybUA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=KoyfT3Os4pQtUDlujEebg6EiOL0R82EtKNerfIW+df4=;
        fh=ba+6l0bSNTuncXuNCC2reHfgQX8l5/kG6zNScXdi2+I=;
        b=S35E5StZL5nh0Bj3E0C3u9CQmUWkxm9tjFF9OZqD2mUZlkMEnpekxm+oNKifdflnLY
         j1adwk9/svHHdOkT9VOyaXVYAaRtvufxEEOu1qI8mQT4sunjyNcSdR0VN2hPIJXbVh+S
         Q6UDQeNiBeq5jYUgGHsLOJJzzeVBwySj1ktsQ0r4RWWh748IiJyWHtg8tj9LAVTyT5KJ
         iQ1tvIhAMdg+by7TnzrZOv2PT6jRs9/SvVo3rfNTjBDlkE3BQrxLufRzNAqxaN8J5N13
         objwNw4u8L5JWif4bxhk+BUTB3Xqt7Q/ziP69OSR617p4C8Orc46ATMV22Vnf8hFXSoT
         SYWQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770122739; x=1770727539; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KoyfT3Os4pQtUDlujEebg6EiOL0R82EtKNerfIW+df4=;
        b=GZE4HQ9Zcp1tbSLj0F3vD4/VO0lXFar4zcwna10QzA4sGhfG04mRi8qRaUU2MHKil4
         WL7BzxU4ju+wn7x6+wKJAlKsv1BYqA2PM2ava5XUs9r6r/pDgHxU6mWQFj4RB/rtnz/B
         B9keAstsuQZ3cU39KuQrHSOkut1WZqHbeYs95HaQMPHVZUtnS4p74mHs38biti0X8F7i
         GMCkZa32YYFSYKW+FrHPVoL08r21yHTkpylXGSAO0jgKSu+EYFna+LpuTw6bj+fR1051
         oVBcWvtIJO5R0EtSw5Ri54x7fLITWBiyKzpXCq6KsL2bWb7CKtfjgMznLXgqJxaNJtgP
         p9xQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770122739; x=1770727539;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=KoyfT3Os4pQtUDlujEebg6EiOL0R82EtKNerfIW+df4=;
        b=c60arY52KZDOvCmbxj343atpMPQp+ODWeYGZR0d+3EFMmltP76t+8yXUANiok3L9Rr
         LFDzXjwkWTvX4zfeCmWcVwj3OBBUnNuj3R0Wz3lZFJlNYMc0HlS4Jk/3RAhR/t5+ghrd
         eOD35jwOTNeFgd+zHc3JBBczi8DfxE9aWodPUl5uDmja2gdk16Zjd9b2jCCOuOJy3MlM
         X1YspoDoiG37dCG4UMCq1VHfHI0RSKw/Ylohz72q/GzGPDI5y2Oxdp89EI232uuYDA9a
         54XsX61h2zyKkzAR4YYFD9I51tG4WE3ReKhaWR3pvTcTIRDB+RzfKSgp3F22N/0s/BQh
         PWEQ==
X-Forwarded-Encrypted: i=1; AJvYcCWeXqdaqD7YJx24t4UK1e/crBpkKBEyPvU/NVmk/RjgLIexMZ1mQ6J3NuqLDS92w+E3CzxteAL5tw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwTBvcOQiRvxcXTSTRzjMXh+y2u15AjQw59y11f/X/s9SHLo8MR
	WIqW2QmI2H9uFgjaYTBZZT6ORwzPSiy6RmibO1fId+3svg1Q3oKEor8DEcNjHtB3a0DL7gw3oOk
	9Ru8L99C/Umu4+GH4eyAgdRJ6ekhh/ws=
X-Gm-Gg: AZuq6aJWpJ6sz3ifbYp3S7UD4kInZbtAcjKhXtdbbg2hJ5IgWIjSuOCUY80XBz0a+7S
	khsjCECXI4xZ2cQm5Wjfd12jbkk7OtjstklU1C4m13JXjjhA7P0e0RIT702ws2cwDk2FOJNRDry
	jMEwHkCkEbWFI3NYs1nrVSUkDtWPd3uzVHTcVLX+oHQ8BHRVqTGm49VElPimxDkLugp9HcH36mM
	w93K5RZeCQmyIDfkl75PDFqCtZ6qCoZLIP3W9TgYdbZ6HwJa2yWdQCpC9V3cHbACW51OKpaG5Fm
	G2BrkckynavGCpKx
X-Received: by 2002:a05:6402:2742:b0:658:17fb:4890 with SMTP id
 4fb4d7f45d1cf-658de557b0dmr7582231a12.9.1770122739020; Tue, 03 Feb 2026
 04:45:39 -0800 (PST)
Precedence: bulk
X-Mailing-List: arm-scmi@vger.kernel.org
List-Id: <arm-scmi.vger.kernel.org>
List-Subscribe: <mailto:arm-scmi+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:arm-scmi+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251021165212.749372-1-a.shimko.dev@gmail.com> <20251022-rugged-archetypal-wallaby-ecbecf@sudeepholla>
In-Reply-To: <20251022-rugged-archetypal-wallaby-ecbecf@sudeepholla>
From: Artem Shimko <a.shimko.dev@gmail.com>
Date: Tue, 3 Feb 2026 15:45:28 +0300
X-Gm-Features: AZwV_Qj6FEE6eaVt-7p5On-NoVPJ3F-fwGw9PBBGPKesyT86MTTFVEHHqRcyLok
Message-ID: <CAOPX744bwwZHEODktumJbE1MUyfDgYj3vrexT7GRBZ6BTrECXw@mail.gmail.com>
Subject: Re: [PATCH] firmware: arm_scmi: Add new sensor unit types
To: Sudeep Holla <sudeep.holla@arm.com>
Cc: Cristian Marussi <cristian.marussi@arm.com>, arm-scmi@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 22, 2025 at 12:22=E2=80=AFPM Sudeep Holla <sudeep.holla@arm.com=
> wrote:
> It is still alpha, we don't add anything into the kernel unless it is
> of beta quality.

Hi Sudeep,

Just a polite ping.

Is it still too early for 4.0 bet0?

Thank you!

Regards,
Artem

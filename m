Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 386C8368955
	for <arm-scmi@vger.kernel.org>; Thu, 26 Feb 2026 22:05:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772143530; cv=none; b=ozwrMUuU8gW6UcA4mm9F36tTQFqcD556SNuV+XF/Z7I285ZqXNNK5bbFOZlZSEcPs/RdRTGevXZoI+Zdg60ltgy2aj3aWrLAj+3EjNWb07Ek77F4R7SOt/b7HkL40yaO5GZnywkzrMhsURmaxKje6KIOR40ynFW2eSoPu87h7ZA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772143530; c=relaxed/simple;
	bh=3ZbTNTpqwWK+vYDoLKERNgiG+SUF841jTBKF67BW68w=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=cs/DFOdKUWnPIW3aSecR3kbQWz66WkRfqXV2fCQsdxS/C16LaTCAm1ZzbjAqZY7+1YWaIJ/P7KtyOoP3LZBiE5QU4A3JNf9XEy62U9acn6PaSG4FzjYZTCdq7pHJAEeOx75WU7+xW0EcdCmquXaL8ynQAGqKkFQRrPIxGOYyM8Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WmFkxkWj; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WmFkxkWj"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DAFE8C2BC86
	for <arm-scmi@vger.kernel.org>; Thu, 26 Feb 2026 22:05:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772143529;
	bh=3ZbTNTpqwWK+vYDoLKERNgiG+SUF841jTBKF67BW68w=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=WmFkxkWjqDO1Zp9phJ66hkbVEWfhSwDv3B0ZpTxFb8WyOkqM8sMz7JAKqege/xEQW
	 qIsNBfipZuQXB0b+velm6u+BlgWs7SNO7QAqSGw/QT/wRZhKtAAbpAXL+mP96/dgZB
	 8jpPTjDsxD687TvaHMqyJMjIuG0pav7wO72qOHxSYnD6KDHRFzbSE3FzfBf083Rtan
	 RsYmGvV77mozF6UEQBLBKhGlqItXsOYxWPm1GUO1CtZ4gwFlhr6JWup8hB/dhyNCMw
	 JIRHyyahqxMakeHbLNEdou1JSpxx+6CVzVdnv7EHRozHhL2Rv1kY01vHSBtg84+Gwk
	 DU4cbvOuxWHHA==
Received: by mail-yw1-f175.google.com with SMTP id 00721157ae682-79868cde1eeso15148247b3.2
        for <arm-scmi@vger.kernel.org>; Thu, 26 Feb 2026 14:05:29 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXVTBsXkJqKx6dwPoyEJWK0NnocFkZMueUFynZmL6INVvNA+B4Q4vwDTVw6yL3POKAw4b4bSU6Jeg==@vger.kernel.org
X-Gm-Message-State: AOJu0YweajooO30QIal0ASvalRE/C6Dq+tcf1DuQaWiKGIWwsCCY8ww0
	o6mBleMc+CJa4Eer+Vi6WXIbsrjWyg+6R+qzm7NjS5pNc8uyaCA85AKEp1BeO5uSsTTQYuhnhmG
	lo9iUPTG488ipQgAmkrmvM441iyVmSHA=
X-Received: by 2002:a05:690c:e34a:b0:798:6a6b:5b0f with SMTP id
 00721157ae682-798855a6876mr8033777b3.32.1772143529230; Thu, 26 Feb 2026
 14:05:29 -0800 (PST)
Precedence: bulk
X-Mailing-List: arm-scmi@vger.kernel.org
List-Id: <arm-scmi.vger.kernel.org>
List-Subscribe: <mailto:arm-scmi+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:arm-scmi+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1771856828.git.dan.carpenter@linaro.org> <62727b8bc822e07ad546d9e9fe4373a372a3f1b9.1771856828.git.dan.carpenter@linaro.org>
In-Reply-To: <62727b8bc822e07ad546d9e9fe4373a372a3f1b9.1771856828.git.dan.carpenter@linaro.org>
From: Linus Walleij <linusw@kernel.org>
Date: Thu, 26 Feb 2026 23:05:18 +0100
X-Gmail-Original-Message-ID: <CAD++jLkw0A8ZUXFCQYiPHHwA8o4nspT+GsEHfNdsNZjwU94Qig@mail.gmail.com>
X-Gm-Features: AaiRm51tIPbcMQ8UIJZoGNzHAPEjgsLBBnwJnn2zxY5dF7yiLyuzWJc6fbcv4fI
Message-ID: <CAD++jLkw0A8ZUXFCQYiPHHwA8o4nspT+GsEHfNdsNZjwU94Qig@mail.gmail.com>
Subject: Re: [PATCH 1/4] scmi: pinctrl: add pinctrl message IDs
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: Peng Fan <peng.fan@nxp.com>, Tom Rini <trini@konsulko.com>, Alice Guo <alice.guo@nxp.com>, 
	Ye Li <ye.li@nxp.com>, Jacky Bai <ping.bai@nxp.com>, 
	Marek Vasut <marek.vasut+renesas@mailbox.org>, Vinh Nguyen <vinh.nguyen.xz@renesas.com>, 
	Valentin Caron <valentin.caron@foss.st.com>, u-boot@lists.denx.de, 
	Vincent Guittot <vincent.guittot@linaro.org>, Khaled Ali Ahmed <Khaled.AliAhmed@arm.com>, 
	Michal Simek <michal.simek@amd.com>, arm-scmi@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 23, 2026 at 3:33=E2=80=AFPM Dan Carpenter <dan.carpenter@linaro=
.org> wrote:

> Add all the pinctrl message IDs.  I renamed SCMI_MSG_PINCTRL_CONFIG_SET
> to SCMI_PINCTRL_SETTINGS_CONFIGURE so the naming matches the spec better.
>
> Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>

Reviewed-by: Linus Walleij <linusw@kernel.org>

Yours,
Linus Walleij

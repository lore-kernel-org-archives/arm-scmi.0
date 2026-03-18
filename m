Received: from mail-dl1-f49.google.com (mail-dl1-f49.google.com [74.125.82.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 021FD3ED127
	for <arm-scmi@vger.kernel.org>; Wed, 18 Mar 2026 16:06:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773850010; cv=pass; b=cX3Yl6tVMmprM1uEWi9WdN+NxZE/AeIfrSxVQBoRZQDhf9FRvnfCbIBpyLIB4vq4HwWVi5Csxa4PAd0Z13gNuBKrNPVjwk614DGkrK2ePX9cI8pWnBq5NypnOo6avV8w+q9hgHf3KRwKtrJSismAIgQIgFfWld/MC7njzhpQi5U=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773850010; c=relaxed/simple;
	bh=aPJNEHqr9HCYGUb6/HYe7QV50yFPw4glgAjAlyGnrgg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=NWvMaTykIAA8HvwCgu21XVBpKFidM60GZcWWa9J9CLa0+25ravvPYFsZAfr64GGziajgAYge7N8Wm66fIrqSdhChq1G3jtsKdbPUZ3kiXk78qVMq9+Qdi0eRdAZ70k5wD0iMsNJhhZsRW2YilG5RXwN5y0avDfCp0p+pOAwPgko=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cdwUWuZ3; arc=pass smtp.client-ip=74.125.82.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cdwUWuZ3"
Received: by mail-dl1-f49.google.com with SMTP id a92af1059eb24-1279eced0b9so69912c88.0
        for <arm-scmi@vger.kernel.org>; Wed, 18 Mar 2026 09:06:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773850004; cv=none;
        d=google.com; s=arc-20240605;
        b=k6MEYRrxaIwVh2MlWaXCYvP6lOIyIgFz9nQoHnzb2WfBv0JZM0w1Gw82DAHAAUV4EP
         JpfVp6EKRAXBVEogwsMoEdTYcVXh7hZbYdXk4aTPcfWo+n4C/l9ebAon8NePnfmSj6JH
         5Xxv7cKrOQBXnjC6wwJkWzf+mVKeUy/+LiWreUiWBEFF2a6ZvKqYUyERCWmEqR/WmWa1
         vAdHs36n/iVITUT9YAfO6ETclV3H4MFlCpM8tmaV4scTYMRcZFFdbGOrLfyfvd1iFVm0
         VrC0x1nad1uaxHVf/9/FKEDrQhu89/r7j74lhYkq2NUaeWES73Y4zPxrON3Y1VsVrD82
         WVCA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=aPJNEHqr9HCYGUb6/HYe7QV50yFPw4glgAjAlyGnrgg=;
        fh=AR8apVF04Qwa++RBtDzxo8UvGZS1nEDG3uxRxG7rLK8=;
        b=GHqu4HpQ0gCB17rEBLsLG8Xee9S5sL7mcVbXyfHHuPlxbIFYeE3Ne/4bM8mMHAMARd
         kaEBdDhDXoq2eMqiw4bCeo6fbDci59nfnu2ntvpvEn2FApcC6EIgesqVf9zxrutrtNLU
         KO4I/oPeMMzMeZZA3lXLGHHv6q/8C2GveHebW7cXZJ0u+RJW/cZK9NRwE8h3CelCEL1q
         gg4xA8KcSL9vt128pU++0yOsxEaaAIEsXeTugx5pZWrH1CdiCpiHzJc2ldgyrEyI/C0s
         2kYie5/nD3ptG5lso7iU1o5RtwBS6BP7ZaR9crI1J+GwNMdaaG4uDveDFOcfFi3EvQoY
         1fFg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773850004; x=1774454804; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aPJNEHqr9HCYGUb6/HYe7QV50yFPw4glgAjAlyGnrgg=;
        b=cdwUWuZ3JoLVjJl+MVOV9RfRM7dz4/1a39DkK8L5yCvKM6crrttOwax6+z/jtUld6r
         xlgwsPRduU983AQvXVB3HjcVpw7ft2Wgcfb6I1mPY+PRWAUVWWE0g8k+QGK2DtBD+QTr
         C63g4vHaLKl13GRC883CVVn5TEHajW3FbKRweG0UJinb2nXX37QxeCoKlJBe93Zsi5xm
         1jO8KhcdgXu61s25T1u52GN/smEdUJYADMuvZUtgUyUTvefR/HRkh1n78effjf3cwszo
         I+V5prK8TLoX3zV+aWyguFdR69uXCQFUf7p6vptD/+Ni0gDAmOzYhAFRN8W3OfzQ3Qaf
         ASjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773850004; x=1774454804;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=aPJNEHqr9HCYGUb6/HYe7QV50yFPw4glgAjAlyGnrgg=;
        b=G91+0kvxR4z5KjsnYG9X97n0A0S6PB7X0QTPITnLqDm5ffK/Q/gG5pmU0WOJP99DUp
         ehg7VvthYXYxrfn5Qrgw6aUzcEi1RJEoOd5HoHmNeiTcB01zsYCAg5W/8vjl2oQOyCnz
         LxgD1/rT4EORoymtmGvxpEwuowe+YG1cJRtWVb3BT6k25GIUnVZ9G0KwbrYIpGvAIVPj
         nqJJGuprluIcX84mT5b1Mu2I9lBI5meQb0aW0uj4Vwu91IrMTQ+NJpkEgQlvxTg1Rz+w
         f6aeWpPSEFcqq/sLV+yfOM7yxEDajyoj41jLgHeKbmI1NMQ9GOicv+RB+bpUP1RHejZT
         3o2A==
X-Forwarded-Encrypted: i=1; AJvYcCXNpjD4jR3spGiByksGndcOh8gpQG5/7FJVf9I2hVApdkeq0UaepbcFCfH4aw2Ic9MnGZxEhsRE5Q==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz5AO9xQDzdN9o6OH0eipDS+X7IGdEKYVfHW3DnjDkEj070Aso0
	8hRmOzphesugdjiw08lzinZQ5I76sZz73UNBNIESCd7X6kL8mNyVtEbrP89jZSuDZ2ll3tK2UFF
	RFUvA3fUm/zOkxiG84CZT86lSHZyrfD1+mg==
X-Gm-Gg: ATEYQzycSoQxVxKHmzjMLNdGR2PoMQhUu4kL2gN5z5+1JU09U2Os1xEY+UbhF3ukO9J
	GuCir2nXJSp173zoYHEAyzgQ+Db1bwUVLRNWU77KerHRuZaO1Brnr5It+uzjFrYbuOQmYLf/iU5
	lPyifwA6sNur+wXWlutbX37kDIYcLixbKq2/oP5a/JuhpTVg+OOxdav318IXu+D+PMhOJn+CTY/
	tlZ3WSqcNEWqf7jyCuJwsW/mXBTCG9RzIlHcA0UObM/jUFxCBFzGKtnXY3GuhXioqbwB/4AVIm+
	iYLIFAKnV81ssrzMDsYheXt6s+Zrl7GpUB9WNAF1Qs6QLDzliy7yo7S1iuHM/u3jO7Dei/tKNej
	6lS8FpP4BosAhrrhWQHSSQQ==
X-Received: by 2002:a05:7022:421:b0:128:cc34:3617 with SMTP id
 a92af1059eb24-129a714811bmr1918564c88.21.1773850003615; Wed, 18 Mar 2026
 09:06:43 -0700 (PDT)
Precedence: bulk
X-Mailing-List: arm-scmi@vger.kernel.org
List-Id: <arm-scmi.vger.kernel.org>
List-Subscribe: <mailto:arm-scmi+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:arm-scmi+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260305-scmi-imx-reset-v1-0-18de78978ba9@nxp.com> <20260305-scmi-imx-reset-v1-1-18de78978ba9@nxp.com>
In-Reply-To: <20260305-scmi-imx-reset-v1-1-18de78978ba9@nxp.com>
From: Daniel Baluta <daniel.baluta@gmail.com>
Date: Wed, 18 Mar 2026 18:09:31 +0200
X-Gm-Features: AaiRm5289taSx1eb7TjHchZuhRz0bSwV54-QwJD6-l7mMGU5Fnso3LBqXAa9jCw
Message-ID: <CAEnQRZB6L7asKXq4rjPr+a1ai-jonBF_bTsT=Sk3ZJuNtUPS9w@mail.gmail.com>
Subject: Re: [PATCH 1/2] firmware: arm_scmi: imx: Support getting reset reason
 of MISC protocol
To: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Cc: Sudeep Holla <sudeep.holla@kernel.org>, Cristian Marussi <cristian.marussi@arm.com>, 
	Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, arm-scmi@vger.kernel.org, 
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Peng Fan <peng.fan@nxp.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 5, 2026 at 3:55=E2=80=AFAM Peng Fan (OSS) <peng.fan@oss.nxp.com=
> wrote:
>
> From: Peng Fan <peng.fan@nxp.com>
>
> MISC protocol supports getting reset reason per Logical Machine or
> System. Add the API for user to retrieve the information from System
> Manager.
>
> Signed-off-by: Peng Fan <peng.fan@nxp.com>

Reviewed-by: Daniel Baluta <daniel.baluta@nxp.com>

Thanks Peng for your explanations!

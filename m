Received: from mail-dl1-f47.google.com (mail-dl1-f47.google.com [74.125.82.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 671C92F12AE
	for <arm-scmi@vger.kernel.org>; Thu,  5 Mar 2026 06:49:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772693393; cv=pass; b=kKUb9RXxyzWtCvmNI6BW7JSMRN5GBZDn/UzH/Uovt4NBZ0zvgS1S9Cl1pBXL3sRvdyrlfPm7y4drCgsJx+E3/VbJwUXvT38uCo6UrP3nhLxNTcmNxWBrhirhn2nNjvvja7sJR5Da+DL5kpfVFFJMsuZ4JpjtoGhSm49C07bgHp4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772693393; c=relaxed/simple;
	bh=q2c4mZ9tdn7OtEMIDnKeERn7b/4c+OrCVLP6qmXta9o=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=lOoKQfG9e9/n2IkAnZuTgeOjdLAMQQLM/3tfk9KtwqpRtcwWo6/nNFRyqqmIaFnaKEfWD4xLXLKJn5yzh87UXW6NtdDzhTsTpIA6ZJOS5aPWFlWwjqtB19KXgZbV5e7np5cqP+OCCYrpxhp2F9FG97qZmyWhyACoY6+gS6Mnt6E=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kSi0k/Ue; arc=pass smtp.client-ip=74.125.82.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kSi0k/Ue"
Received: by mail-dl1-f47.google.com with SMTP id a92af1059eb24-1270adc5121so9631203c88.0
        for <arm-scmi@vger.kernel.org>; Wed, 04 Mar 2026 22:49:52 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1772693391; cv=none;
        d=google.com; s=arc-20240605;
        b=Nr+Y46Uf2wtqnAsXPiZn6+ctsNYc13RXr5luKQCzsPGhyV8WIZl/65IOEaW5j1q4pq
         SsgxUc06DlSefx68k1p9jZgI6EPAuL2H4C4ovc5jj/zQ6F/3//EVWVfsfmd3UPpVDSHB
         rWWmKpxhCOwsvV0Eba20Bpx6B9rJI2Tojeepfa/ry2C49nQWZ/tCewxpztwZGlmdH9WO
         ufr8AS/5/6+OA3r2qtg5n100h99/PWhCtn8U1Ur+s4j3tAos/0t3GxuKM3wp6t4/6C3t
         pjnBvUdjRcZoZmbVbEcJNu+5QvR48fzNBldg7fxzYfRvwqNqc7Mjp2O1THvLUVVYbKIO
         l2vw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=SJnKoH2k8aUsMnHN9s6q8EPoGOgHGpVja0sh8tMg5Zs=;
        fh=cOC+xLHcAi5m5TTFMBxnKxCezOK+OWxzhAqZCGVNEk4=;
        b=B5PZ8Z6CO+PXv853yKFl99tgbT7/KSNwrVmYiicXp8rWlSXS+YUFwwHswYo19vIq84
         vKwX8doG1FKMhIX8jWlI0Nb+cO3qvmlehyFTKh1Ia4KHt1Ru9g+IAqcle2MTSPZV8mcy
         mwGYz5hXqYeklqf9AsKAnKlfTO1fUAel8ddrSuXbO3KFw0urEOi5XQg89Br/3xkQmzwU
         /ONdwL++RMlPGJG9z/EJnfiwkqZF5G9WtXlG9jjGNF6WM1gCleyNyvVn4oR/gBuBSVmO
         k5BjFkxkPUR0wV1yOJSpzeSUbzsn0ZMTItmSAyR5ALX/jeFEqldHXHOr+HSRq54bWY0R
         9KHg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772693391; x=1773298191; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SJnKoH2k8aUsMnHN9s6q8EPoGOgHGpVja0sh8tMg5Zs=;
        b=kSi0k/UeFta6IrQUzvra3FE4rjQt8lbROXg/R2/S52DdXsnJGrIgPKlJFuG9hGtIaQ
         4LEsE7tWIkstqPPRWGBtzMog6z032YFkcqouTJsCTpgglr3Bdlb60hRhBLJkCk7gjx0C
         EPsOckUCuLQW1GeusX8C3KTZHKZL6e//WZjkwn0GUOswDABPpnlpaBaEW5Rj6DKjedYP
         TYobFbn998MF4tWgmO1dUt7D0BI+lZCLxbNGuv98c/5mL1cDu5NnKtW/bjb2ROFa4DNJ
         uS8zSW9y1w/CuF16SQHHYuf0+nMmE4ttXZRBMsxT8GzQaR2anXv69eg/9cY8PlWIltlU
         3/Yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772693391; x=1773298191;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=SJnKoH2k8aUsMnHN9s6q8EPoGOgHGpVja0sh8tMg5Zs=;
        b=Xj03wLKIMzT72W4zXTNGt7ShW66OihDalEXhwh+knyYf23duL5xVf0GmjX7EzyTe7u
         H7Mn1emA3yoFGs+k2KE8zMHVH/BC1QTsCv+rtRJDWXZ6TkR2msBOdzD/qZPoVwVpjd4y
         mFXBzl13GVLT/J+1Nzqdz+WhuYiwbwJnO27RCHwxC+xQbV3HU9QQROIdBrUDN56c+HSC
         wxVEa4spji3yvZ3bDBeugDd2yIggJXnHD23vQxYYRKvgyuZSVpCpZmRg/LX3174fv7fC
         UDM7KL14JKALGe+LZF8OyqFg6VcHOt5L/cIGY/VcPTx7QC4tkw0aqJ5p+sFOdx+NC54x
         OtyQ==
X-Forwarded-Encrypted: i=1; AJvYcCWyhjG40bKEbaOU33yiPijdhjdgsZSkXrTGib3EmvFWoaVAWXepnrGJyxThUsYfGQOD/I7SdFaLFw==@vger.kernel.org
X-Gm-Message-State: AOJu0YydOOr9oGYxi6xDxjpEKT1ZGBPBs2+g4unOQ8P36GKbP9UAaxxw
	hsJHOi/r0Zwt9cyJEAJ/K7Ix/xiI/Q1LS0Nxtt9dzrtkBEnb/FPaJYDtZPC7YXgMstRtmS/RqwV
	g+Z4K8HwubafxM6GIyh6ZXaUN9S+w87I=
X-Gm-Gg: ATEYQzyLydDxZfbQ7V007x4zuq6c1oZpg5NWqkJfLnx7PL01xsQCoyKqe/BmGI8dY9O
	41ARvf377lVBvtkEyujfnSjxyFqeVtRZRljP3JSLDpyOB1xzrhz2Tr0KsIC5i3mGQHfjRIdwjn8
	UJrgvmOv67Heh8OXL0kIwDPVkUuQbQU3mYvgHDebJhcBR0VzSm80o96zfp/fOlzbZv9TwlJSS8k
	9eysHau6yqdq1ebRgoMYSRVwqbYNgkEHLOJYalP/MivY07xMDDdH7rely047I9ELj42tT6iXj3Q
	Oc/HQjLw1S2PctBnom6VG2YO5R8NSkFSn07vKBidG4ewo4JN1kcwEIU0oS2gUxiVqFqB+kBdL21
	2yTZGqF3luiIngxmQ+nA1Pg==
X-Received: by 2002:a05:7022:324:b0:127:3b1d:f593 with SMTP id
 a92af1059eb24-128b7086624mr1846052c88.9.1772693391456; Wed, 04 Mar 2026
 22:49:51 -0800 (PST)
Precedence: bulk
X-Mailing-List: arm-scmi@vger.kernel.org
List-Id: <arm-scmi.vger.kernel.org>
List-Subscribe: <mailto:arm-scmi+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:arm-scmi+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260305-scmi-imx-reset-v1-0-18de78978ba9@nxp.com> <20260305-scmi-imx-reset-v1-1-18de78978ba9@nxp.com>
In-Reply-To: <20260305-scmi-imx-reset-v1-1-18de78978ba9@nxp.com>
From: Daniel Baluta <daniel.baluta@gmail.com>
Date: Thu, 5 Mar 2026 08:52:41 +0200
X-Gm-Features: AaiRm505xBxL2PxE2YKJ3MTVjZe8kemHLRhSvtWvM-ybN_ZTK85FYION66BVMA4
Message-ID: <CAEnQRZC4w3qNOJgth=8N-Ri3wFeKc-=VnQXWzr4WR0j6yt7WMQ@mail.gmail.com>
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

[..]

> +struct scmi_imx_misc_reset_reason_in {
> +#define MISC_REASON_FLAG_SYSTEM        BIT(0)
> +       __le32 flags;
> +};
> +
> +struct scmi_imx_misc_reset_reason_out {
> +       /* Boot reason flags */
> +#define MISC_BOOT_FLAG_VLD             BIT(31)
> +#define MISC_BOOT_FLAG_ORG_VLD         BIT(28)
> +#define MISC_BOOT_FLAG_ORIGIN          GENMASK(27, 24)
> +#define MISC_BOOT_FLAG_O_SHIFT         24
> +#define MISC_BOOT_FLAG_ERR_VLD         BIT(23)
> +#define MISC_BOOT_FLAG_ERR_ID          GENMASK(22, 8)
> +#define MISC_BOOT_FLAG_E_SHIFT         8
> +#define MISC_BOOT_FLAG_REASON          GENMASK(7, 0)

I would move this macros outside of the struct. Although the intention
is good it makes everything hard to read.

Just do:

struct scmi_imx_misc_reset_reason_out {
__le32 b_flags; /* MISC_BOOT_FLAG_* flags */
__le32 s_flags; /* MISC_SHUTDOWN_FLAG_* flags */
      /* Array of extended info words */
       __le32 extinfo[MISC_EXT_INFO_LEN_MAX];
}

[...]

> +static int scmi_imx_misc_reset_reason(const struct scmi_protocol_handle =
*ph, bool system,
> +                                     struct scmi_imx_misc_reset_reason *=
boot_r,
> +                                     struct scmi_imx_misc_reset_reason *=
shut_r,
> +                                     u32 *extinfo)
> +{
> +       struct scmi_imx_misc_reset_reason_in *in;
> +       struct scmi_imx_misc_reset_reason_out *out;
> +       struct scmi_xfer *t;
> +       int ret;
> +
> +       ret =3D ph->xops->xfer_get_init(ph, SCMI_IMX_MISC_RESET_REASON_GE=
T, sizeof(*in),
> +                                     sizeof(*out), &t);
> +       if (ret)
> +               return ret;
> +
> +       in =3D t->tx.buf;
> +       if (system)
> +               in->flags =3D le32_encode_bits(1, MISC_REASON_FLAG_SYSTEM=
);
> +       else
> +               in->flags =3D cpu_to_le32(0);

What does system =3D 0 mean? can you directly do in->flags =3D 0?


> +
> +       ret =3D ph->xops->do_xfer(ph, t);

Is it mandatory to call  ph->xops->xfer_put(ph, t); even if ret ! =3D 0?
Because we can get rid of one level of indentation with:

 ret =3D ph->xops->do_xfer(ph, t);
 if (ret)
    return ret;

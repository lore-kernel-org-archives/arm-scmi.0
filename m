Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.176
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795164223;
	b=oGubjZd5+xqzlqEickNDtjocsu5j/kKSAslU178o7Khes+6459dsSVbNkQsMVoKchFF1
	 IY8HgeoOCmj/hjIhsuB610sHcNDpp6rHGzbFtdqWOi3Tleylg2cvdYeBOWlvwlF1mT2oK
	 67w0bQlf0tlH5hFXgqeK6Y+vTpYa/3gzWZp3M2AAONDGB1Uavmt6EAr2i4uFLhj4H+sIp
	 MC7r6ThbelkhTTrLhUeGCQRB4LquYgOb1eXbPsJxqwX39vp6K1IP0d1zeWs/G1tTqoxHo
	 7BqX9J3jd/4ofo3cq6ycjSBFoyM3z1lB1szZKbLyWNILihyOWrpv2MpGRNEDQLlaGvA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795164223;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=an9c/AwHDCpMgy31fhAcNA3Rgkyae//mKDjGvqRP4jw=;
	b=XSyrBfqjdBYyKc5DaQ3wimAv3jySXT3UBthBXkEW/56KTOyYgKhGVB0va0Xf2zMGTbkF
	 NKP6r9IgzyW6Cq7pIYGr031ep4b+e+zDJca63J4HdP7S396jg5zLUT7WxfCjo9AIJP2I0
	 ssqH64r/4QgWnpIG14E3HzwmKvGzSnG9lDV1eWRu6s5uY6M9WqVK5y6AQ8a+8a4ntcBnN
	 zMx9wtwkhyqpWtR4t8H83TjkeiV3k+f48IIDDH4HoV2SRsj8O7TdnaJ3ME7Tija0Mc5vN
	 oRps3v4+CYtzNCCa87jw9yJ7T6tyL8ZFRg6NaOcoYJaB2pqnVM4y0ys2b/3xdqLE0+Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=MJr9NmRc;
	arc=none smtp.remote-ip=209.85.210.176
Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD328606A320
	for <arm-scmi@vger.kernel.org>; Fri, 20 Nov 2026 08:43:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AD328606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=MJr9NmRc
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-8c20d68c83fso1139271b3a.0
        for <arm-scmi@vger.kernel.org>; Fri, 20 Nov 2026 00:43:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795164222; x=1795769022; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=an9c/AwHDCpMgy31fhAcNA3Rgkyae//mKDjGvqRP4jw=;
        b=MJr9NmRcBq9CNM82yR1kqIG9ac5QZPSSDghjUod3oyQsEpX6fnUUnwPByqiXhrKhFE
         xtWEqJo+Apvs5Ywa2gCp9vtyszK7nxJHleaxw+D5hA0T7UvbmzWC52exvqu6DYVaTG5M
         jslEUCXj/UttQbtulnB6VM7+KEa1ywlV68USklHzDLrrBxPRdtJtb6sbSADnSa476/VU
         qHdzpDQX0KdibBJjr+Ijx668XWMGOmxKikg6+G5DoAhLmciHI1KQuAeXnsTl2gQAQ0DJ
         FxcKNo5PhX5170z5l0tO05vgmtRmO3olL/Oc4sBW+A2t2D/Y/HThP2RNgeNhpgjRkpr1
         jxtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795164222; x=1795769022;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=an9c/AwHDCpMgy31fhAcNA3Rgkyae//mKDjGvqRP4jw=;
        b=AxaOVD8e4Mrtj8sGElHRHWV82oNeiHp93Ffl95k1AAzt2dGfGFoB3b0Gv/wcg/NInH
         925OjH8wBjw8MVDHtuEzr+lFV/wCQ7AZGzRbe+z/01P7QIbLU/icBm5b/iAT3uzHV3n9
         6QqLnZ2rtg40ighrxUhpAhIVY4XRj2C697r6SnhRv6f2wTpqwpctMYW67YAQSQolEjqe
         WIO+g7UnUZjRa2aSsAbkSbCGcyr+UB/sYauWq0zSjKqd/fBs41959/f/WxHiT3fd9/pC
         YH1G51clSa1PYahgSzeGTanS7VJDVBY2ifSr5PNm4VQGD8Jg6+bXG2IOGGYPYdX2Hsq+
         ZQIQ==
X-Forwarded-Encrypted: i=1; AL+hErGpET9/9SSP3Lvznjys1E7YmrG9UcOrjn8pa5BnVXoftojTcx1BnCRFR5K4hmK11Hys49GY/hSmVg==@vger.kernel.org
X-Gm-Message-State: APuU4Z++GBdCe4Ep+qmq/RTU6fyQf/Oriykf8Yz09G0jd/myt824axM+
	L3RviZrK4hGdPGvztVXptOY6FcQV0z99IbxwV+/lzLULC8Wu1ih5Wn5d
X-Gm-Gg: AYBFou2+zQINfqFydMLXvrb0Kzovgt/aFJjLcfdc5xhDIXQmN7YnsmkyFCP4lOPLHJ8
	htrKL+emKQwodXSE6SfmLfmz5VhJa4q/11WFc7zVKAES320yv1O39VT86b8Fw8Tyq6xmT96YIqn
	BhZypHkI4+sGAPzvV7b/E5se6RXOeNIEpYHsPDiOTAQWY0MOeiQbG/iW1IizIY/vq1Dk8nifNtA
	bZ5gLlmCKPPGv4KSALzK4N/jk3BRnkit3LpD0V9jWzU4lZso5MUndo4xBQOkWpFKrVa2WQhFAAK
	Im6EPww+selFewT8ZBeWiHeD69p07kwx14AC39MwhZZupCRbGRsE74QKVniRD2gjrxZqkN/jQSv
	/nYJz+vu3LnB5C1XP+mVFZriVPb0ud0Bg7JUtqcLXhYOHUVhGK4bQ5+W/qCknreDFM3o0apsnKe
	oiE7axtqunUR+gKyh42sJmV/PEV4NNofX9o/26Yc/idKGiUsX/UHyMUTL1nrwO7ual6aqNcKrK0
	YUdUzUT8quB1Mb6Vw30yQEorCDc7IHipLHfQzDFjmi54qQ3zVvKFqB2fXOURGmFG/aCdgwZM+5l
	JfOzzG8poAbR1imp6KdiHsCwdBcrfC5B4AZ0o8ajLoHpKEeFDnUsiIuZeyM=
X-Received: by 2002:a05:6a00:2eaa:b0:8b5:fbd0:cb49 with SMTP id d2e1a72fcca58-8c7dd9d6a22mr2795672b3a.21.1795164221763;
        Fri, 20 Nov 2026 00:43:41 -0800 (PST)
Received: from localhost ([2.27.148.107])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8c87343f83dsm1163978b3a.39.2026.11.20.00.43.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 00:43:41 -0800 (PST)
From: Han Gao <rabenda.cn@gmail.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Han Gao <rabenda.cn@gmail.com>,
	gaohan@iscas.ac.cn,
	Sudeep Holla <sudeep.holla@kernel.org>,
	Cristian Marussi <cristian.marussi@arm.com>,
	Michal Simek <michal.simek@amd.com>,
	arm-scmi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] firmware: arm_scmi: Drop the ARM architecture dependency
Date: Fri, 20 Nov 2026 16:43:31 +0800
Message-ID: <20261120084335.3492524-1-rabenda.cn@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <CAMuHMdUov1u3kXzBX3ZM8rRkBdLq_M8LwQ2VtxSEOH9w68Rr2g@mail.gmail.com>
References: 
X-Mailing-List: arm-scmi@vger.kernel.org
List-Id: <arm-scmi.vger.kernel.org>
List-Post: <mailto:arm-scmi@vger.kernel.org>
List-Help: <mailto:arm-scmi+help@vger.kernel.org>
List-Subscribe: <mailto:arm-scmi+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:arm-scmi+unsubscribe@vger.kernel.org>
List-Owner: <mailto:arm-scmi+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Fri, 20 Nov 2026 09:26:47 +0100 Geert Uytterhoeven <geert@linux-m68k.org> wrote:

> Hi Han,
> 
> On Fri, 6 Nov 2026 at 20:40, Han Gao via B4 Relay
> <devnull+gaohan.iscas.ac.cn@kernel.org> wrote:
> > From: Han Gao <gaohan@iscas.ac.cn>
> >
> > The SCMI core and the mailbox and shared memory transports only use
> > generic kernel interfaces. Transports that need architecture support,
> > such as SMC, already carry their own dependencies.
> >
> > Drop the ARM and ARM64 dependency so that other architectures can use
> > SCMI. Depend on HAS_IOMEM instead, for devm_ioremap().
> >
> > Suggested-by: Michal Simek <michal.simek@amd.com>
> > Signed-off-by: Han Gao <gaohan@iscas.ac.cn>
> 
> Thanks for your patch, which is now commit fe87ede443a15969 ("firmware:
> arm: scmi: Drop the ARM architecture dependency") in scmi/for-linux-next.
> 
> > ---
> > This was patch 1 of the Zhihe A210 SoC series [1]. As Michal asked, it
> > now goes on its own through the SCMI tree.
> >
> > Since [1], it depends on HAS_IOMEM: Sashiko found that UML, which has
> > no HAS_IOMEM, failed to link devm_ioremap().
> >
> > Build tested on x86_64 without OF, i386, loongarch64, ppc64le, riscv64
> > and arm64. On UML, SCMI can no longer be selected.
> >
> > [1] https://patch.msgid.link/20261103-a210-scmi-v3-0-ee6b31580808@iscas.ac.cn
> 
> > --- a/drivers/firmware/arm_scmi/Kconfig
> > +++ b/drivers/firmware/arm_scmi/Kconfig
> > @@ -3,7 +3,7 @@ menu "ARM System Control and Management Interface Protocol"
> >
> >  config ARM_SCMI_PROTOCOL
> >         tristate "ARM System Control and Management Interface (SCMI) Message Protocol"
> > -       depends on ARM || ARM64 || COMPILE_TEST
> > +       depends on HAS_IOMEM || COMPILE_TEST
> 
> Please extend the dependencies to RISCV (from the link above, I assume
> you are targeting riscv?) instead.  There is no point in showing this
> option on architectures that have no users of SCMI; one already has
> too many relevant symbols to configure.
> People who want to build test on x86_64 without OF, i386, loongarch64,
> ppc64le, ... can just enable COMPILE_TEST.

Following Michal's suggestion[1], I'm dropping ARM/ARM64.

[1] https://lore.kernel.org/all/3d38c4a5-1a12-4af1-ac2e-413a457ce4c5@amd.com/

> 
> >         help
> >           ARM System Control and Management Interface (SCMI) protocol is a
> >           set of operating system-independent software interfaces that are
> 
> Gr{oetje,eeting}s,
> 
>                         Geert
> 
> -- 
> Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org
> 
> In personal conversations with technical people, I call myself a hacker. But
> when I'm talking to journalists I just say "programmer" or something like that.
>                                 -- Linus Torvalds

Sent using hkml (https://github.com/sjp38/hackermail)

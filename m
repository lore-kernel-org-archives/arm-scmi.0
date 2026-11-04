Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793800838;
	b=ItH43FWuL8JgFjP2T/pjznlmkjZf4eg79viDZ/pNWDugZsiA2GTWq+c6+GPsO11uFM6x
	 tNrtdYk86jTDgWEwKjtNjJhIX1HfLSce89fYCyeNEZcAsSiOy/SSq5J7lF3E0ruiy80lL
	 DB7Oh2t9BexYQ3bZ0g2cos4+AUUX1iiaEyAycCEMlofODApLmY8sJuf+49VU46ZTrM9xW
	 cFSV6+PbPFLn1NS6WpZ8uH75e33aomeoT95U98HtPwrHC0Fl6TSGHVj2XM9hDYEQ7fCq8
	 6r4RLWKh6znVKyv/Ycf3W2xeE/CwWDh52RtE8kgGuk0aVZSTz/GckM9FvsVHDrQSHTA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793800838;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=EK0JUgp8OCD/gxw0LjPEg0NrLddUOwjtQqQrgH4Zeuo=;
	b=08CVis7uawwL7A4Qw9dNsA1Fq1eEGOoUc4tvw02gpP3ZvyGvEKJ2Vy7EpUHGoN0PJkLK
	 xxEnMOsd/5OuV41XgiCWChWO/uOBjjxwyJ4j2leAI6HwyHG1/bXD6FJAoPFVJdaQk0G0y
	 2RxF3SWhVbEa3V4B0OQGXVO7m43FW5rSO8rTJysQSjHT45TcAr6DHUYGQwsFdQFsglQBP
	 5j9/wtMBAGlZPfiDbKSR+vi1aMEo1CEA8rwTOUEcRX/ka9RnulwftS2HtX+T5+QH2Ccbz
	 PpoN+MyruJ1X9Xtc7o0JC0gmRCKFJdX7jwr3dpPk5aiqN1FGsn/iqp3mhEBf1J/NDcQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=lVAYG9Bm;
	arc=none smtp.remote-ip=74.125.82.49
Received: from mail-dl1-f49.google.com (mail-dl1-f49.google.com [74.125.82.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8082B606A329
	for <arm-scmi@vger.kernel.org>; Wed,  4 Nov 2026 14:00:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8082B606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=lVAYG9Bm
Received: by mail-dl1-f49.google.com with SMTP id a92af1059eb24-1ae18eb9ad0so721206c88.1
        for <arm-scmi@vger.kernel.org>; Wed, 04 Nov 2026 06:00:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793800838; x=1794405638; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=EK0JUgp8OCD/gxw0LjPEg0NrLddUOwjtQqQrgH4Zeuo=;
        b=lVAYG9Bmc2hoKTJuJzSrH6J+IhryAyiDTSMdo0aYG9mfqjPS/ga8+3YK2Ad//sbXE2
         HHofzfmuuJ/nJx0kE/6IytFncp6WqXb39RvQM+YnlJNPVlx4UDFXx8nAXhQykpg/r9dU
         TTw9D3mrL7B/AtTF/tGzwS4DWBrit2U6UIDoeAg8Au1ygMhfLw7GRk8WtuLYUaZkwSTF
         aYRfMnD7tWD2+C7sh5TWr6OTrCzca5srbXzkmLr+/5fdNnNFJYIheqB8xKYVa8MXmxFB
         4bAPEVWyyZRmC6vgyn2/OYmqQ8nZ9BmRTU8WOS8FvaydjpnVOWQKGf91yFtKwUSqhNCh
         RSlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793800838; x=1794405638;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=EK0JUgp8OCD/gxw0LjPEg0NrLddUOwjtQqQrgH4Zeuo=;
        b=YbcGXn2NeA+uIWt/MaOjmBlob3Ciay41QifiACzz3Zhwy+Ab4GvS1ZS4dQP3tVwYCS
         tgMhCi1UZ5sE5sWMU8L8Uu84EnX1+Niip9yMcgtemETDUdDiNdPpE8WzL+ZtVTqp3R0A
         niBhXAksapZ646LLKmp4ies53GxihOroGMeJC7v0OFz+CuoZPOwqXs+IXkjpksiYr+Pl
         SDmEIU+ZTgYVYSieyCunFvVUrbTrfPhzRvaycIZoem5igZblRkO0AV4FNn5zByhjvDsB
         LIe0IpmQ4RCiwDhXlh8y8f6E73SCjZ/4F38Y9mFFRRKWGA6jkNkbVm9k+rq7sqDNZbsQ
         kIgA==
X-Forwarded-Encrypted: i=1; AKwUvBwVIUPirbJK+V+tq63Fx98xRVbsFz/SOxzUQ21Ok4XC9i7K0m73pJBFV7FguX45ctmPSsQmozE/bw==@vger.kernel.org
X-Gm-Message-State: APuU4Z+RXgQ9eAUb7rxEkGzDoy5a/5hAuw7QEZK/EtjKvjAk9a6GN3gb
	QN5dfglMh5kWsPnCBN6yjZ7nMFlecBg9ts4xGh2/K2JzZSFwaRilBgyj
X-Gm-Gg: AYBFou1Bh2ecn2OTwXYlvcqa7DwX87dCyl7iJsYX1mcwu6glLeEIT8FD99hs5Ks8Y4E
	tmsDHaD5zCkyeeSz+qMCtEzET8kuLMS9out66qPIS7MAT0jbmjJm92tFccSDjrhG/nX90EwaoMo
	NRdvLP2ffwa40z09w9rGxEEQZAXNgXdWsbGTDUVLuBojjX8Ay9WQ48HbscXhY+43YBrckH+G2kw
	bPiLVwIFjYcAwwWlIkgvvF0G4ighNANPxTHJ6oa6zQyTDXyJU5FdQuUCZF38GNh53YSCd5JIKD3
	2vOsWa7u1i3xhKGpuizOXppb6vEtR/oAPbsn5fsh5NMIPWtavPHqnq7voMsNxzXFgc05xosih+8
	PNNJ0BrnbR3F/HKlqNndAOhPVIvphgbn54LHUwHpYmjfW2mcU5BjRAD1dx0sFJ1d63leHCaMHTk
	ChVN9bkvdPc27JjX1zI78j9hrMmwbeO0OKR83PfNLXM2ZKiNP6tf4hYvVU7p+99WUByEnejZx25
	afEIY9BuyxdSd1IOT+J6QrslnRdkwBl2Fu0GY01L4QeAnLrUB/UDlT+CUX+KCTZ33GFJ4353dyb
	OVKPp2HnMlCoSOMrIEdHDkVlwkeCz8XQAiNlKAWhpz97mmKLAolYOl++g3IrFylEj9gXqhiwHqN
	+LiM=
X-Received: by 2002:a05:7023:a89:b0:1a8:9857:2102 with SMTP id a92af1059eb24-1ac5f183841mr25563977c88.30.1793800837135;
        Wed, 04 Nov 2026 06:00:37 -0800 (PST)
Received: from localhost ([2.27.148.106])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b245c30521sm8553620c88.13.2026.11.04.06.00.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 06:00:36 -0800 (PST)
From: Han Gao <rabenda.cn@gmail.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Han Gao <rabenda.cn@gmail.com>,
	Sudeep Holla <sudeep.holla@kernel.org>,
	Cristian Marussi <cristian.marussi@arm.com>,
	Michal Simek <michal.simek@amd.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Zhiguo Zhu <zhiguo.zhu@linux.alibaba.com>,
	Jassi Brar <jassisinghbrar@gmail.com>,
	Linus Walleij <linusw@kernel.org>,
	=?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Thomas Gleixner <tglx@kernel.org>,
	Radu Rendec <radu@rendec.net>,
	Samuel Holland <samuel.holland@sifive.com>,
	Daniel Lezcano <daniel.lezcano@kernel.org>,
	Anup Patel <anup@brainfault.org>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>,
	Drew Fustini <fustini@kernel.org>,
	Icenowy Zheng <uwu@icenowy.me>,
	Inochi Amaoto <inochiama@gmail.com>,
	Vivian Wang <wangruikang@iscas.ac.cn>,
	Yao Zi <me@ziyao.cc>,
	Jiaxun Yang <jiaxun.yang@flygoat.com>,
	arm-scmi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-gpio@vger.kernel.org,
	Paul Walmsley <paul.walmsley@sifive.com>,
	linux-clk@vger.kernel.org,
	linux-serial@vger.kernel.org,
	Conor Dooley <conor.dooley@microchip.com>
Subject: Re: [PATCH RFC v3 00/17] riscv: add initial Zhihe A210 support using SCMI clocks and resets
Date: Wed,  4 Nov 2026 22:00:30 +0800
Message-ID: <20261104140031.1172491-1-rabenda.cn@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <9b99c531-1977-4bc1-8105-bd9c3e129951@kernel.org>
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

Hi, Krzysztof

On Wed, 4 Nov 2026 09:24:15 +0100 Krzysztof Kozlowski <krzk@kernel.org> wrote:

> On 02/11/2026 20:45, Han Gao wrote:
> > This adds initial support for the Zhihe A210 SoC and the Melon Pi V1
> > and V2 boards.
> > 
> > The A210 has four C908V and four C920V2 cores, plus an E902 management
> > core. The E902 firmware handles clocks, resets, power, the PMIC and
> > CPU DVFS, so Linux uses SCMI for clocks and resets. The only new SCMI
> > piece is the mailbox to the E902. [2] explains why I picked SCMI over
> > RPMI.
> > 
> Considering how vulab@iscas.ac.cn is ignoring reviews/comments and spams
> with a lot of unthreaded emails, completely disregarding any tries of
> contact over last 1.5 months, shall we ignore all contributions from
> @iscas.ac.cn?
> 
> Maybe this will be the only way to actually be heard?

Apologies, I am unable to communicate directly with the team at vulab,
but I have passed the relevant information on to them;
I trust they will handle the matter appropriately.

Thanks,
Han

> 
> Best regards,
> Krzysztof
> 
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv

Sent using hkml (https://github.com/sjp38/hackermail)

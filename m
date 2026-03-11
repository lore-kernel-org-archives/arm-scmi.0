Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 501BE27B327
	for <arm-scmi@vger.kernel.org>; Wed, 11 Mar 2026 13:01:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773234080; cv=none; b=OPKEMFmp9joJ5NVWtYhujn/FvqwH66ZV1En3TXoB7Zuo9+8TmBkfbLVXtdjOXrByhIG6Mo2ubwwOVYPKF45VPNv0oF4zHUTGA8Z3yxW0qrlue9jLgpLJRRWj0PyHQPcdrjeUWMKfzXY0JlL/MizCffAfY4ck4q1EgJs6eWBImmM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773234080; c=relaxed/simple;
	bh=5omYf3UBejq4qWG7tPFgWTcjtBLBdAAToujIJ2lCAvg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=rWjQFAf9KzYWi0BE+neAZQUjc+55q2RLKBJb+aPZlTOVe4qEXmgeNqZHAX/ApraBecSUgoIt8+jPHCzf8vTC80ynvYVDN7ZcMYK8vgezutVpNzHQI9YZjikTErWhjTOLPsdEgsUPl3TsWK6HkPytHhH3uAP87IA8GwRUo9jmCVo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=V2ltN/R5; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="V2ltN/R5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1773234078;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=5omYf3UBejq4qWG7tPFgWTcjtBLBdAAToujIJ2lCAvg=;
	b=V2ltN/R5DomoiTVJscPK02zhS8zVD1jO+xN+BF/5f7/6fWVEZZacZIgx2/RChHWiN3t8/Y
	otilyztiyKbUMd8OULoMwrhcl+1GglOu/mHhosW3VNuzlRH7fRNSGRiX8K3id9o4tg4x11
	ynr22KBPn7uE+liaDIi/YPmVqL6auu8=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-634-jDRj6UA-NyGwNgS4JYIvJA-1; Wed, 11 Mar 2026 09:01:16 -0400
X-MC-Unique: jDRj6UA-NyGwNgS4JYIvJA-1
X-Mimecast-MFC-AGG-ID: jDRj6UA-NyGwNgS4JYIvJA_1773234075
Received: by mail-ej1-f71.google.com with SMTP id a640c23a62f3a-b94062e85f9so677185566b.2
        for <arm-scmi@vger.kernel.org>; Wed, 11 Mar 2026 06:01:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773234075; x=1773838875;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=5omYf3UBejq4qWG7tPFgWTcjtBLBdAAToujIJ2lCAvg=;
        b=PVQdJS3/F+kSbTHXenMii6uX86uDGQg+i136iSk9XYFwv6eyQQzzC0VWlLScDeadm3
         rXnSU5kY9tQOOoKWyhlLxP/AMJWmqoin9k8ctCxNH6pjaY6qAmKyXU7joKTYP+pyQRGA
         I4sXhsJ8swlf+cQM9GTjOYf5uGSDkBD9GbHt/Ec85cDhR5v+8F5QM4OGGhZwp+K1gdeg
         qth0hMaD2d7+hW5hEl1XwEkO9DM3EYTY6OoChFcCnuKNVTGp18EF33qe6yLmjm8OqFwT
         pT5iOqZqaejmOPfktwkrjEat2Ea93R1tpcO+oDzDdzJswPPK9GgjdC458OCz7js851a5
         wHqg==
X-Forwarded-Encrypted: i=1; AJvYcCXp0cQz5gwRDqoaW/79gAXHxPH3pTUpuRc8UNAHSrQ43cjwFvrxOKELF5rZ/JBY4hMDWcNXhKecAw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yxpx7653NW/6MPNBVvzWB0YDwo5rG3nOne5/UbSz1syRictrjvR
	CdFZzlhftcrRZeR23k28DrtFysX25MJqGQo6w64w/3ZK72FzMgYMBYeJDOZBWr54ffd6f37u9Zf
	KS/gRd3t+TrFMNAhkyuao/zBINrp7rSf87figElUc/tGN+S3YOK2ED9KdX4kLeU7Xo+UR1q1uPY
	Pw4ZeD9XiI40Z/t1R1MWjemRCoBa8xWErVi6g=
X-Gm-Gg: ATEYQzyZ+O0/jJ3BbOqzk7yd8yOXOVAMzevWrB95Cn8XkkNHmNmbntkBCoYElRv0uuZ
	AY3JHxMXQOfSp6/ajMWiXwi20MRhRXFGBFaDhU2f+GAS3y1ULFxiCAHbad28inZ8WOUqUAqU81I
	NHVdNyZA2/Q7bkcE9qfNtyAwPKbgXNwMSTnAIiNRxyZom2s8RiT/Zyo2gbfAvlpTlG0sQp0aR4X
	yg+uw==
X-Received: by 2002:a17:906:7314:b0:b93:edc0:e2e8 with SMTP id a640c23a62f3a-b972e6069a2mr143086166b.48.1773234075186;
        Wed, 11 Mar 2026 06:01:15 -0700 (PDT)
X-Received: by 2002:a17:906:7314:b0:b93:edc0:e2e8 with SMTP id
 a640c23a62f3a-b972e6069a2mr143080266b.48.1773234074508; Wed, 11 Mar 2026
 06:01:14 -0700 (PDT)
Precedence: bulk
X-Mailing-List: arm-scmi@vger.kernel.org
List-Id: <arm-scmi.vger.kernel.org>
List-Subscribe: <mailto:arm-scmi+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:arm-scmi+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260309-clk-det-rate-fw-managed-v2-0-c48ef5a3100a@redhat.com> <c7d47b6d-caf7-426b-944e-7debb7d69045@linaro.org>
In-Reply-To: <c7d47b6d-caf7-426b-944e-7debb7d69045@linaro.org>
From: Brian Masney <bmasney@redhat.com>
Date: Wed, 11 Mar 2026 09:01:02 -0400
X-Gm-Features: AaiRm52EdqmkwN8CGi7SEvZrCO9M1f6Y7hYTKKNfjOzM3D3aXhP9MAnWBZaRjqI
Message-ID: <CABx5tqKC_KocCp+_uJ-t7AhJNa9MZOG=5Dry4UoZXzUvSryiFQ@mail.gmail.com>
Subject: Re: [PATCH v2 00/12] clk: add new flag CLK_ROUNDING_NOOP
To: Tudor Ambarus <tudor.ambarus@linaro.org>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, linux-clk@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Sudeep Holla <sudeep.holla@kernel.org>, 
	Abel Vesa <abelvesa@kernel.org>, Andrea della Porta <andrea.porta@suse.com>, 
	Baolin Wang <baolin.wang@linux.alibaba.com>, Bjorn Andersson <andersson@kernel.org>, 
	Chanwoo Choi <cw00.choi@samsung.com>, Frank Li <Frank.Li@nxp.com>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Krzysztof Kozlowski <krzk@kernel.org>, 
	Orson Zhai <orsonzhai@gmail.com>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Sylwester Nawrocki <s.nawrocki@samsung.com>, Alim Akhtar <alim.akhtar@samsung.com>, 
	arm-scmi@vger.kernel.org, Chunyan Zhang <zhang.lyra@gmail.com>, 
	Cristian Marussi <cristian.marussi@arm.com>, Fabio Estevam <festevam@gmail.com>, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, linux-samsung-soc@vger.kernel.org, 
	Peng Fan <peng.fan@nxp.com>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: jwJZ_nFZh7ymOlJammQaYBEPdqVyvrBIyBTG0v8Kobs_1773234075
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 11, 2026 at 7:51=E2=80=AFAM Tudor Ambarus <tudor.ambarus@linaro=
.org> wrote:
> On 3/9/26 4:38 PM, Brian Masney wrote:
> > Note this series depends on 3 previously-posted patches in this git pul=
l
> > to Stephen for v7.1.
> > https://lore.kernel.org/linux-clk/aZuK4-QJCXUeSxtL@redhat.com/
>
> There's no tags/clk-remove-deprecated-apis-v7.1 on
> https://github.com/masneyb/linux

It is here, unless I am missing something?

https://github.com/masneyb/linux/releases/tag/clk-remove-deprecated-apis-v7=
.1

Brian


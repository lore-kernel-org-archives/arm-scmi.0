Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 899DC430CCA;
	Tue, 15 Sep 2026 17:26:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789493197; cv=none; b=PTy4ZbSpR3rJd+R6/2Nkr7fH4bWvEofpDFx2wE2NDMp62+ZtQBkB3wyPhTctNSUYH+eRSctUziC0cNqiP98B9O+17JBJlB0WVp8TyZ3GPbkyv2o5g0aCqBwe1bP4ESTeCzABrLnBYwyUHjhTeqh8VikzsCRWhFQPT4SwdmMWrbE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789493197; c=relaxed/simple;
	bh=8sG2IH30UnaHnti26ZbSq1ISOhiS9P171n9TsuqN4QY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=C8jQTD+KI349qG3smTZp0Tf3j4dAD+nLrUT3pLsevdPh6JA2FD+p2cZuVDnWZiJ/Q7ff3TMUcmvvjTocwjRbP5Sh6qjBCjIcrT7QXA7XrXQnAZX2Y8yMPVg2im9ZzypWdZEMNX9DRj3H+PWC1/rc+4ZDyItgXYOQiaIdkHPQ17o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WbAQjhBA; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WbAQjhBA"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1533D1F000FF;
	Tue, 15 Sep 2026 17:26:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789493196;
	bh=r83DxMbDAEAKhqhbmZSFk82WIQMOPTBJgIG0U6gX9Vg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=WbAQjhBAJeeAWV6UJesDnUIjjtMSV4izl+KG7RPOn+Uyw3te6quUyqbH4GIKmp2ll
	 h/cA74emvDlSZhWnJUl+EqHQsa/nEkVcTDYz5iW9+gBlrJKrbAsSQlKZdqx3H8vrXB
	 aFN3mIVIM/PcgR2PwyXOCM4cX2CtgAeVPPB2zdzXdGeNDBe8RAx8OoAyy40DaC8b0b
	 fZD2UjeNToh2QJeBb9bcnORYd3qgEDrpZk4JLTm032hoI8uJN5+N0JdZXLmgmiJjI2
	 moAsX0H9waeloU8u4a870kjyw7I1ytNdiL2UELE2XlgliHJqBLp1o1uwZTG6QFN02B
	 G6FYr1KKlAU2A==
From: Sudeep Holla <sudeep.holla@kernel.org>
To: Cristian Marussi <cristian.marussi@arm.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Sudeep Holla <sudeep.holla@kernel.org>,
	arm-scmi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] firmware: arm_scmi: Merge scmi_reset_proto_ops.name_get() and .latency_get()
Date: Tue, 15 Sep 2026 18:26:31 +0100
Message-ID: <178949312736.3922933.11444388869328950630.b4-ty@b4>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <77c9651a11715013c0eaa8a56dbbc7dc3d9ddeec.1788429130.git.geert+renesas@glider.be>
References: <77c9651a11715013c0eaa8a56dbbc7dc3d9ddeec.1788429130.git.geert+renesas@glider.be>
Precedence: bulk
X-Mailing-List: arm-scmi@vger.kernel.org
List-Id: <arm-scmi.vger.kernel.org>
List-Subscribe: <mailto:arm-scmi+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:arm-scmi+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

On Thu, 03 Sep 2026 11:54:25 +0200, Geert Uytterhoeven wrote:
> The SCMI reset domain protocol operations structure does not provide a
> .info_get() method, unlike most other protocols.  Instead, it provides
> two separate methods to get a domain's name and reset latency.
> 
> Merge the .name_get() and .latency_get() methods into a single
> .info_get() method, to increase uniformity.
> 
> [...]

Applied to sudeep.holla/linux (for-next/scmi/updates), thanks!

[1/1] firmware: arm_scmi: Merge scmi_reset_proto_ops.name_get() and .latency_get()
      https://git.kernel.org/sudeep.holla/c/2911930bfbdf
-- 
Regards,
Sudeep


Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 870803603F2;
	Sun,  8 Mar 2026 12:56:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772974565; cv=none; b=graj+mtqoqCtRn+dtOnU0QlZwwld4cEsw79IZXGwgCDkDqDx8gdz6/Li2KAy/ONZ1JnSQOH5j0b3C/qsx0BNWkHleSaRzPKnw82l2WEGm7HeF+ZJ8MxSp8ajwy5pQTEm9eFOGyLP1fY49ZR6TiHL1nL8Eb5k8eyFmIbUvRjIVC4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772974565; c=relaxed/simple;
	bh=zheaREXa3/SztyapPG2qTsQZeAzWrb9Y+f1J2mfH5R4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=dmP5gjJ0VeUccsCWbB1Vs1x7N/yW1dsZnaxjUFH5TnkbFW9Qgl+dWMO50xfdufvYcVb8m1W9fwjF/kV3Kveq8V90Q/jt1Vsf8jy4B+g45q8C0g30V8qvjr1mWug1wA+c60ixsuBaVj9gyBhxuNSicJoZuQfuHBtAs+e0f3AiObo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Wv+JoF12; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Wv+JoF12"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2A229C19423;
	Sun,  8 Mar 2026 12:56:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772974565;
	bh=zheaREXa3/SztyapPG2qTsQZeAzWrb9Y+f1J2mfH5R4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Wv+JoF12V4+ZpX4kaj9qRE3tnJzmO4cGX9WRCSC22GF8W9dm92C6Xsgk/5XDx99q+
	 Ya8DQpg24UcdrUVCAtY7gyBWmpEDA2fDMqd4la0QcJRzozACorIP4HqaeVPQw4woJG
	 25Fdwzmvk+9gmbffeODZwMV8iRCBNZvW5x1CGx56VTzF6Xq+P9KKJlqJQH2eYVrfLp
	 vclU7ijfwwFnsBXut4sVOqPxhPY8q33AqE1OejEAmJDBDSbjp4fC26jpWHym8rBotu
	 UxBlIcjDt3jHQEcQoDcK7qh8K6oNiefwftUAPXZIizgCTssuE0MS/CAHw50ThzO8WN
	 vxfRu6WmteKfA==
From: Sudeep Holla <sudeep.holla@kernel.org>
To: linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	arm-scmi@vger.kernel.org,
	Cristian Marussi <cristian.marussi@arm.com>
Cc: Sudeep Holla <sudeep.holla@kernel.org>,
	philip.radford@arm.com
Subject: Re: [PATCH] firmware: arm_scmi: Fix NULL dereference on notify error path
Date: Sun,  8 Mar 2026 12:55:59 +0000
Message-ID: <177297451748.1087321.15158816110689424363.b4-ty@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260305131011.541444-1-cristian.marussi@arm.com>
References: <20260305131011.541444-1-cristian.marussi@arm.com>
Precedence: bulk
X-Mailing-List: arm-scmi@vger.kernel.org
List-Id: <arm-scmi.vger.kernel.org>
List-Subscribe: <mailto:arm-scmi+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:arm-scmi+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

On Thu, 05 Mar 2026 13:10:11 +0000, Cristian Marussi wrote:
> Since commit b5daf93b809d1 ("firmware: arm_scmi: Avoid notifier
> registration for unsupported events") the call chains leading to the helper
> __scmi_event_handler_get_ops expect an ERR_PTR to be returned on failure to
> get an handler for the requested event key, while the current helper can
> still return a NULL when no handler could be found or created.
> 
> Fix by forcing an ERR_PTR return value when the handler reference is NULL.
> 
> [...]

Applied to sudeep.holla/linux (for-next/scmi/fixes), thanks!

[1/1] firmware: arm_scmi: Fix NULL dereference on notify error path
      https://git.kernel.org/sudeep.holla/c/555317d61001
--
Regards,
Sudeep


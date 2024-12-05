Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AC021194C6E;
	Thu,  5 Dec 2024 10:32:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733394757; cv=none; b=odTw/cSxVTm5hG+eAWWLsOaAQEXZZi1zH0tDBhiXEEQAJO0Ize0CS0oRebyXplcmqICQGn9OafiuZ2bGoDRUruZjZ9KR48y1dQc0G0qu/c5tLJLuqR7VIR1bGIetdMaUYveJEW71KPKVXiw8It7VwPbkMNptQFIv14tZKK36f7M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733394757; c=relaxed/simple;
	bh=NwnPXq6beLuD7Kx9NedivA1VklXLvPKXPufN9V5jeCA=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=GNR4v699Rc5slXhT8jfxAHvahi0d7eTjTObM34EEAHIPls3EdiDvwtW1puLZJwCRlRiyScgSNA1QEnBYVpmfphPE/Y3jh9xjm/r538fTa5H0f8AyEebFh/sMevYIME7/ioFHYc7LBiBhrJjEMEvyLELx1H4xoWDSmAqL09ZF95k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 23C70FEC;
	Thu,  5 Dec 2024 02:33:00 -0800 (PST)
Received: from usa.arm.com (e133711.arm.com [10.1.196.55])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 3152F3F5A1;
	Thu,  5 Dec 2024 02:32:29 -0800 (PST)
From: Sudeep Holla <sudeep.holla@arm.com>
To: Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Mark Brown <broonie@kernel.org>,
	Arnd Bergmann <arnd@kernel.org>
Cc: Sudeep Holla <sudeep.holla@arm.com>,
	Arnd Bergmann <arnd@arndb.de>,
	Cristian Marussi <cristian.marussi@arm.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Peng Fan <peng.fan@nxp.com>,
	arm-scmi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	imx@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-sound@vger.kernel.org
Subject: Re: [PATCH] firmware: arm_scmi: fix i.MX build dependency
Date: Thu,  5 Dec 2024 10:32:25 +0000
Message-Id: <173339471403.691669.17537976195919564595.b4-ty@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241115230555.2435004-1-arnd@kernel.org>
References: <20241115230555.2435004-1-arnd@kernel.org>
Precedence: bulk
X-Mailing-List: arm-scmi@vger.kernel.org
List-Id: <arm-scmi.vger.kernel.org>
List-Subscribe: <mailto:arm-scmi+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:arm-scmi+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

On Sat, 16 Nov 2024 00:05:18 +0100, Arnd Bergmann wrote:
> The newly added SCMI vendor driver references functions in the
> protocol driver but needs a Kconfig dependency to ensure it can link,
> essentially the Kconfig dependency needs to be reversed to match the
> link time dependency:
> 
> arm-linux-gnueabi-ld: sound/soc/fsl/fsl_mqs.o: in function `fsl_mqs_sm_write':
> fsl_mqs.c:(.text+0x1aa): undefined reference to `scmi_imx_misc_ctrl_set'
> arm-linux-gnueabi-ld: sound/soc/fsl/fsl_mqs.o: in function `fsl_mqs_sm_read':
> fsl_mqs.c:(.text+0x1ee): undefined reference to `scmi_imx_misc_ctrl_get'
> 
> [...]

Applied to sudeep.holla/linux (for-next/scmi/fixes), thanks!

[1/1] firmware: arm_scmi: fix i.MX build dependency
      https://git.kernel.org/sudeep.holla/c/514b2262ade4
--
Regards,
Sudeep


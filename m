Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2AE6239D6FA;
	Tue,  5 May 2026 15:36:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777995410; cv=none; b=uu8jjY+zLpr6jgfAdzxEP1m1JXXZrUnI+B53cQ4F9sH1XZcGvn9QUgOhl9fqslN+GlFE/ugck4ByLmUZJ03f7+cdrKyZnPMh/NFC9KJAvsslqLiXUgVamK0F2iHTyIt76ojWMXBGy0HLCXQyTfpu8ccPRG4bhWmg/dLOwT22wlw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777995410; c=relaxed/simple;
	bh=mVMJa3FLlsFImoqLFsKRghlowG3fcTKy8cBNX44JwE4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ccWBZgbWLdamsJ/TsmHxrG0rE+pSdfU3bttdEYyoSF5soavMvAtddtFbLxVHv9xUA48PyQsWVm7j1inWeSQqj+VeDmTKjPvE//MdNiWxL/15xk2OvhQRRR9c7RJGpHUPuuU7EsIhIkn3TzFfg+o8h6V8gfBL74XP3FCSYoyYWIA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DOTgxvSu; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DOTgxvSu"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 63397C2BCB4;
	Tue,  5 May 2026 15:36:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777995409;
	bh=mVMJa3FLlsFImoqLFsKRghlowG3fcTKy8cBNX44JwE4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=DOTgxvSuiaHiwxHSak7ZubAjvxzhZsqxOIk2zvQJfzVyylb38J/g9x0875+LymX28
	 SRUJO2zMmT5FszOHM62GFA09vPcm8X+/LlSg3Knz9YrxA3rPJ2D8DPKWIXeYTC4WBv
	 2eEAt9h1XsiFEePaYn13rGxi0P6b5tq/xIh6ttcb1MJka/PKgct06s+884/GMENBt8
	 qYx+XR9MSLfN0/lJvQizsS35OXzEfMuz4Sq6F/VQFg3+hw5HLWPJyK/6HQ9WRbxW1J
	 KrvxMkElEsWhdPnur9OEa6d5URNyYgF/2aH/0tAF03A7jZLR99fgjzaW62edyBtWNP
	 xoPfMXHONlLCw==
From: Sudeep Holla <sudeep.holla@kernel.org>
To: Cristian Marussi <cristian.marussi@arm.com>,
	Marek Vasut <marek.vasut@mailbox.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Sudeep Holla <sudeep.holla@kernel.org>,
	arm-scmi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH 0/3] firmware: arm_scmi: Miscellaneous improvements
Date: Tue,  5 May 2026 16:36:38 +0100
Message-ID: <177799538519.2896858.17495611577680479278.b4-ty@b4>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1775205358.git.geert+renesas@glider.be>
References: <cover.1775205358.git.geert+renesas@glider.be>
Precedence: bulk
X-Mailing-List: arm-scmi@vger.kernel.org
List-Id: <arm-scmi.vger.kernel.org>
List-Subscribe: <mailto:arm-scmi+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:arm-scmi+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

On Fri, 03 Apr 2026 10:41:28 +0200, Geert Uytterhoeven wrote:
> 	Hi all,
> 
> This patch series contains miscellaneous improvements for SCMI quirk
> handling and SCMI instance iteration.
> 
> Thanks for your comments!
> 
> [...]

Applied to sudeep.holla/linux (for-next/scmi/updates), thanks!

[1/3] firmware: arm_scmi: quirk: Improve quirk range parsing
      https://git.kernel.org/sudeep.holla/c/6991e5de9709
[2/3] firmware: arm_scmi: quirk: Simplify quirk table iteration
      https://git.kernel.org/sudeep.holla/c/5be6732f820c
[3/3] firmware: arm_scmi: Convert to list_for_each_entry()
      https://git.kernel.org/sudeep.holla/c/145728fb616a

--
Regards,
Sudeep


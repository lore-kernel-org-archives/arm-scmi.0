Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5241536A03A;
	Mon,  9 Mar 2026 09:12:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773047552; cv=none; b=ENvT2CUMiqK5SXMyQpdpBlf/ZzxehaUaq4KlpcWxJBYugTw4LvHcopPlot9RpoUr6tbbzc3Nu+H+BY68iGuxL+Ta6nKTrXIwzE73zs22L6RbIM9WiA8Pf/08S0r3172Y8oRPMsJ+JcHDtk4AILkT9Kiet2qQ39jM1QuMbXxVRLU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773047552; c=relaxed/simple;
	bh=HK8Ldfq8Pz6rymjol0HQgiezb+xF7m+IWcWEVqkrwPo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=bfiBcPqjCcJLlc+ZkyHTWPwtBk9OsY4Gm+GBkm98XstNVbklCj7trtz1wgqfXBpntV0uNiiZRPYCgSMtFtFVrtiHB8o3mJ9azrEwSydsb8I2525bRQX5Gg19dlz1ivR9+4YbWmbH61GXGLdaTCK2rGtRjKEe8tRVrsLUbdj7Aps=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=osAjhPxE; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="osAjhPxE"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8036CC4CEF7;
	Mon,  9 Mar 2026 09:12:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773047551;
	bh=HK8Ldfq8Pz6rymjol0HQgiezb+xF7m+IWcWEVqkrwPo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=osAjhPxEJia2EOi8ZPOlx4CD9iddFzLdOTdYOFApXBcBA4zWxXG46mX46XiHqeBPW
	 HMr1NN7+10CMdg02MExioESsxczW9QRZNNHWHnx28AsqCSCT83zxV1RcVVYoMhPhhs
	 QJKq99CNjiB4RIdf/Icg/+6r2g6pLOp5Gaz04GC/Fl9bXjP/CtjsEts8nZjKJEdBXX
	 XX5f6pNZ+8fNhjCApJ7fz+5mLdYryEozXv2XPoL3f1pJVR92CLhDYg6+3G0HF0c5Q/
	 Zkwk1lJQggJ7EFKejdpplPIYwm1Q+8DEeOM2x+yvons8TzZNo1ylUPt62mXvuZa87I
	 5j34UViKs423Q==
From: Sudeep Holla <sudeep.holla@kernel.org>
To: Cristian Marussi <cristian.marussi@arm.com>,
	"Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Cc: Sudeep Holla <sudeep.holla@kernel.org>,
	arm-scmi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Peng Fan <peng.fan@nxp.com>
Subject: Re: [PATCH] firmware: arm_scmi: base: Simplify protocol list size calculation
Date: Mon,  9 Mar 2026 09:12:26 +0000
Message-ID: <177304751104.1268411.8740611706535429825.b4-ty@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260228-scmi-check-v1-1-4935b58bb2db@nxp.com>
References: <20260228-scmi-check-v1-1-4935b58bb2db@nxp.com>
Precedence: bulk
X-Mailing-List: arm-scmi@vger.kernel.org
List-Id: <arm-scmi.vger.kernel.org>
List-Subscribe: <mailto:arm-scmi+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:arm-scmi+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

On Sat, 28 Feb 2026 11:37:33 +0800, Peng Fan (OSS) wrote:
> Replace the open-coded round-up calculation with the kernel's round_up()
> helper function for better readability.
> 
> The original expression:
>   (1 + (loop_num_ret - 1) / sizeof(u32)) * sizeof(u32)
> 
> is equivalent to rounding up loop_num_ret to the nearest multiple of
> sizeof(u32), which is exactly what round_up() does.
> 
> [...]

Applied to sudeep.holla/linux (for-next/scmi/updates), thanks!

[1/1] firmware: arm_scmi: base: Simplify protocol list size calculation
      https://git.kernel.org/sudeep.holla/c/09bb95d63ade
--
Regards,
Sudeep


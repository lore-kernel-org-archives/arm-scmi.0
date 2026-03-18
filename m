Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 380A82D94A3;
	Wed, 18 Mar 2026 16:28:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773851285; cv=none; b=u4o8H05mq2qSHWJOEI9HM3GiEe8uyh2RRYT3zPCJ6YSs5gLf4nxgSR0VadgzUvV26hlIRdbmQYGiPmkxIcHFsGp8OS6jVzMQypaEa4mY3KHELGsD8zE+Q+tn5akcaYUln5IEtR4oX+vIeh6Jr+N7FriBpgJ9M77rrJG+nUvrkOI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773851285; c=relaxed/simple;
	bh=JRpRMOihLhniYpAAT2t+NPGuGJBBL5PuCSnuu2HqvrY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=DTHSlFHAYf2pt9dxG0Mz+5/7sZLxk5XYPopiaNmfRtMOsLfz9wiO0S8LQ/ysEzZPjEckbzg6gIJ9KVtLLoFgNOkoanDqdy7paOOUrMRdofPVfR1pGh4mrloCjYdMYPS/sPaTE9CysMHcfCxpD/QJEXg10+gq7oHAIeLP2xKmOIQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Alwo8cBJ; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Alwo8cBJ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 67090C19421;
	Wed, 18 Mar 2026 16:28:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773851284;
	bh=JRpRMOihLhniYpAAT2t+NPGuGJBBL5PuCSnuu2HqvrY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Alwo8cBJC9XI+zxiSJ9bNsPB4D1V9ohSDm+WArR/gLZqW7lOYrVRPNqiHb+PDKUWP
	 AHpBZnGY0TdK0KGRPhfm4yDAO0kxFJc7ZfN+mGIFMwose6GkhVv1duRMyWvq7iw/4H
	 JMsJEEYUBzMgXSjALVi9mLW2+BJgUYCKnt65osCJ2e8okdDDxXNg+8NLJP4NEOQ0pQ
	 /0o8l0Dl7J6pluh38yrd1rPoNIAwLnBH2yI12Btptxm/u3V7Aj26SIKnr27dHWTXwd
	 INx18uEbjNjJvX3WQkPefTwdd63EYvrslNdwX0dNDtV67Vunft5fa2IkoGtJfLFKR3
	 AwLD9rEBnIxIA==
From: Sudeep Holla <sudeep.holla@kernel.org>
To: Cristian Marussi <cristian.marussi@arm.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Sudeep Holla <sudeep.holla@kernel.org>,
	arm-scmi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH] firmware: arm_scmi: Support loop control in quirk code snippets
Date: Wed, 18 Mar 2026 16:27:58 +0000
Message-ID: <177385122249.117565.12887395986436607561.b4-ty@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <51de914cddef8fa86c2e7dd5397e5df759c45464.1773675224.git.geert+renesas@glider.be>
References: <51de914cddef8fa86c2e7dd5397e5df759c45464.1773675224.git.geert+renesas@glider.be>
Precedence: bulk
X-Mailing-List: arm-scmi@vger.kernel.org
List-Id: <arm-scmi.vger.kernel.org>
List-Subscribe: <mailto:arm-scmi+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:arm-scmi+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

On Mon, 16 Mar 2026 16:34:40 +0100, Geert Uytterhoeven wrote:
> Each SCMI firmware quirk contains a code snippet, which handles the
> quirk, and has full access to the surrounding context.  When this
> context is (part of) a loop body, the code snippet may want to use loop
> control statements like "break" and "continue".  Unfortunately the
> SCMI_QUIRK() macro implementation contains a dummy loop, taking
> precedence over any outer loops.  Hence quirk code cannot use loop
> control statements, but has to resort to polluting the surrounding
> context with a label, and use goto.
> 
> [...]

Applied to sudeep.holla/linux (for-next/scmi/updates), thanks!

[1/1] firmware: arm_scmi: Support loop control in quirk code snippets
      https://git.kernel.org/sudeep.holla/c/0a7ec808abec
--
Regards,
Sudeep


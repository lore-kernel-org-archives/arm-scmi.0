Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 149033E869A;
	Wed, 27 May 2026 09:18:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779873516; cv=none; b=bENCEX4MN+nBkog/oTJQz25878Rk5oUlMY9L6ecT/liNpycCLh3ucLnMpPFBKBFIbxMJYQMae1PPo8Bu12PATzvnGwdLRqGyi1Lj3iqN5SzL5nn+uy/36G/8tO9Lg1AoQSxmAwfpjjD5rd3ELyLgYyz/HiAzijCeZ+sTVFl8WG8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779873516; c=relaxed/simple;
	bh=ctAiWUC3CJc45qNLlit76VvF8d9biaqpsVoDgaQPc/E=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=hJb7kCYHOq5JirUVEpCtUTDR8nnwCM33LWtcsA/Ikp9XXbH4RFs0BBv9PCb64Gi2BqLwXBZz611g8W70MQNibAYkBfX92zASJsfFq8Tg4V8ZLZHbmQbOoB8Sc5grG7RfmdLb19JmkURmPwo/exnJX4Ee6X88/+q5E7Mdc1j7VXk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hsyNFnaD; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hsyNFnaD"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 05DF21F000E9;
	Wed, 27 May 2026 09:18:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779873514;
	bh=6Gqf4LVVsH4MVlU3r0iwi+Zk+hze6DeDRnMheAGpRTM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=hsyNFnaDjsOoibfotuhtAinNYCgowpiwXrngbRJXOBE/9MUkXMrHhDSBLMN9U9gUD
	 OF3mjpy+EhEzrO9EVwxQrgm8uxr11TBDG+q4CmXzdrB40KpL1PsPedkZ1Uvx4xpbwY
	 K/8+0jdq+xuxSReJ6yE6zhu7/buIWE+tiIqAoGeOB+LMA8QGZQnIhfYLWnWlnSi3pf
	 YsiCRW1li7iUlpQRENoeEyOzBdMWZWKysZcbzDp/ECZrUlnCut4PS1m6KL5olAopmu
	 oNlq5xOlQ733B9necCcniSLKQrFskJsPDyr9pmUq1VU2vLtsePBLK7Si5DVqoHIuhA
	 +vK7pzsuN8BOg==
From: Sudeep Holla <sudeep.holla@kernel.org>
To: Cristian Marussi <cristian.marussi@arm.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Sudeep Holla <sudeep.holla@kernel.org>,
	arm-scmi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] firmware: arm_scmi: Fix OOB in scmi_power_name_get()
Date: Wed, 27 May 2026 10:18:29 +0100
Message-ID: <177987346786.277758.12058496226844072630.b4-ty@b4>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <75caae28bdffb55199a0bc6cac5df112a966c608.1778838987.git.geert+renesas@glider.be>
References: <75caae28bdffb55199a0bc6cac5df112a966c608.1778838987.git.geert+renesas@glider.be>
Precedence: bulk
X-Mailing-List: arm-scmi@vger.kernel.org
List-Id: <arm-scmi.vger.kernel.org>
List-Subscribe: <mailto:arm-scmi+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:arm-scmi+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

On Fri, 15 May 2026 11:59:15 +0200, Geert Uytterhoeven wrote:
> scmi_power_name_get() does not validate the domain number passed by the
> external caller, which may lead to an out-of-bounds access.
> 
> Fix this by returning "unknown" for invalid domains, like
> scmi_reset_name_get() does.
> 
> 
> [...]

Applied to sudeep.holla/linux (for-next/scmi/updates), thanks!

[1/1] firmware: arm_scmi: Fix OOB in scmi_power_name_get()
      https://git.kernel.org/sudeep.holla/c/f9ef3f66f4b1

--
Regards,
Sudeep


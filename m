Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C7F34398F1;
	Tue, 15 Sep 2026 17:24:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789493063; cv=none; b=J+zWTgsKsXzKpwrGfoOns1hPmjeYLILuzX/ml4j4BaarIem8482ITBC+NxCAiLICi7c3EzugkyOL6w5UElcSCpWI8CMdkPukO5SaQB0OZII86hoDFcTD/fVmYtDoS6t3YNJhITCDgBEdvlBDzJ/mSpkSwh5Q0iRwFauQmy6/eEw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789493063; c=relaxed/simple;
	bh=Jy8EqbOVlm7qxUBMXKgKXzr3aEb1Af+CfF9hUbGTL8s=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=jwDJFeFjgZ2zTnbXGRTo3lyddEfDasEGMUyo1t0KzbqBuzi4pnj9r5SAfar0ptSehm2YHkBQChNEqbIzHT8H17u5YlKLgffubSxhWhgsQ5B5GdA1fKUImHBPV4En2NuwXl8odtOLet00q0F5iBk0fnXkYgJMoN6sZGbq9lwyr/0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=V3P22c+I; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="V3P22c+I"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ACC361F000FF;
	Tue, 15 Sep 2026 17:24:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789493061;
	bh=DY+0xgImxoBM8p82Er4Yx6/Hyx1wI9449SZ2ErT8t0U=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=V3P22c+ID8sVAMDYNLQZJD1aeOEcJ6JM5EE7a7bhVmk61qAA7SDs0qDGW3AfxfHrW
	 eI5IsTro9Fy+K6/KIVp1n0rwcTd/4r/tHcNHFQv5v3F6Mtmwye+pM7WLe75MgqSgW2
	 hNh6zMQaz6ExQZLrpHD9b8/rjfTR9BgyfBsuguBUVaOBQ1G9whUrpoXXu6ViOVGTQ0
	 ElN2sX6s4HDRjwxYYCHSLWfUyIoyJH/STNk9pHWK8mbs00PawOz1YTX2S2o5dDjGBr
	 DC9Vwo9vhlNQSQQbMA3TkbmjAvk0QV/Bcxb7QDFL2rIgugarV1ZX3ftFfnhWRDO4ld
	 nzxSpntNHddhg==
From: Sudeep Holla <sudeep.holla@kernel.org>
To: Cristian Marussi <cristian.marussi@arm.com>,
	Roland Dreier <rolanddreier@rivian.com>
Cc: Sudeep Holla <sudeep.holla@kernel.org>,
	arm-scmi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 0/2] Couple of SCMI race fixes
Date: Tue, 15 Sep 2026 18:24:17 +0100
Message-ID: <178949301698.3922074.1009067435042757840.b4-ty@b4>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260909-scmi-async-done-race-v2-0-cc5dec25c6be@rivian.com>
References: <20260909-scmi-async-done-race-v2-0-cc5dec25c6be@rivian.com>
Precedence: bulk
X-Mailing-List: arm-scmi@vger.kernel.org
List-Id: <arm-scmi.vger.kernel.org>
List-Subscribe: <mailto:arm-scmi+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:arm-scmi+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

On Wed, 09 Sep 2026 04:32:26 +0000, Roland Dreier wrote:
> Noticed a couple of races in SCMI code around delayed responses that
> time out. These are probably nearly impossible to hit in practice but
> the fixes are pretty straightforward and it seems worth having the
> code be sound.
> 
> The v1 fixes were correct as posted, despite Sashiko warning that the
> new "delayed_response_dropped" debug counter might never increment.
> However, that review made me think that a new debug counter for a
> one-in-a-gazillion race condition is probably less useful than a
> kernel error message. So the change in v2 is having the first patch
> log an error for a delayed response that arrives in the race window it
> closes (matching the existing "Delayed Response not expected" error in
> scmi_msg_response_validate()). The new error is expected to be
> extremely rare but it makes sure there is no path where a delayed
> response gets matched and then discarded without any logging.
> 
> [...]

Applied to sudeep.holla/linux (for-next/scmi/updates), thanks!

[1/2] firmware: arm_scmi: Protect xfer->async_done with xfer->lock
      https://git.kernel.org/sudeep.holla/c/49fc5bc04eec
[2/2] firmware: arm_scmi: Don't reuse raw xfers with async_done still armed
      https://git.kernel.org/sudeep.holla/c/0543fc1443de
-- 
Regards,
Sudeep


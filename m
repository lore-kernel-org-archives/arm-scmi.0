Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A605836C5B2
	for <arm-scmi@vger.kernel.org>; Fri, 16 Oct 2026 08:49:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792140564; cv=none; b=G0Jo2Frkd/d75oO2Ha5cWpuI+/ft4tVn7ceIS+9M5GPors2o6M4n1Ip8M9SENmCv7bACJGHcV2C6z96CnY6Rlt9zRqfFeEx36llfxRL3u0lBLfk1MJjIYCsy9HYT0u13i9MqJT06CfTPxj4WBiojpDamX3tuMOyZlZatAFEIECs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792140564; c=relaxed/simple;
	bh=2rQACyAmQ/52YfRbm1DOClFQxyy95lJf1f5qkWDCN44=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=q9sq8WZ5DeuYl97U0p7oPejif7IsRR3ON9eAFkW8G82JeN0dF8Sf4jVgxntCYIm469eWUDnLSwBdfcyvRG2ceIDPeD0kCiG7zI0LhEJb6XK3H1Ke14q6HeAcCbyi56L4yAi5DYHHqFlzIk/71Zf/P5BLHLAzTTIdDfTOwoF6zDo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=akIDcMki; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="akIDcMki"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 47EA41F000C4;
	Fri, 16 Oct 2026 08:49:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792140563;
	bh=/GMg5kz65ccKVHX/a+K+NBL1Pp+ZE1LkwLEZuPO0SOM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=akIDcMki/a1I5poNoyypeGbCXhvRvwN1XlH+yL+WF0P3kCYiPOL88fLa0uVBCRL7J
	 CZzXe7Qlu+x1ZRK9yhO2OkD8g3MTb0rUIQB4sPNLGz32k/hHFStGJuE5LfcKf+b/cX
	 PRw6irLM42ybL6TMDLoI1MrojR9VvD6bPLNAStWj07tuRJQDSYqU/qCEdkmm2xoA6g
	 qx48BgW6aa/gYkit/STZHK0SUVSnlPXfQhBZmVE9+BNJ7i45cDUBQumOzjla6U5WdB
	 3K7ePv+VMvVOZUfpasK1KSnoB/Ja8CYIoi5nkjAgciYWivR0z3L7tIw2zNesnAG69b
	 GTbJAB6Zh1GaA==
From: Sudeep Holla <sudeep.holla@kernel.org>
To: Cristian Marussi <cristian.marussi@arm.com>,
	arm-scmi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Sudeep Holla <sudeep.holla@kernel.org>
Subject: Re: [PATCH] firmware: arm_scmi: Grammar s/thing/things/
Date: Fri, 16 Oct 2026 09:49:16 +0100
Message-ID: <179214049480.148762.14846907069636180971.b4-ty@b4>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <5128072dc75dbf239dff6c967a88060a4d64b3c0.1792137751.git.geert+renesas@glider.be>
References: <5128072dc75dbf239dff6c967a88060a4d64b3c0.1792137751.git.geert+renesas@glider.be>
Precedence: bulk
X-Mailing-List: arm-scmi@vger.kernel.org
List-Id: <arm-scmi.vger.kernel.org>
List-Subscribe: <mailto:arm-scmi+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:arm-scmi+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

On Fri, 16 Oct 2026 10:03:54 +0200, Geert Uytterhoeven wrote:
> Fix grammar in the help text for the ARM_SCMI_RAW_MODE_SUPPORT_COEX
> symbol.

Applied to sudeep.holla/linux (for-next/scmi/fixes), thanks!

[1/1] firmware: arm_scmi: Grammar s/thing/things/
      https://git.kernel.org/sudeep.holla/c/16ca2aea66b1
-- 
Regards,
Sudeep


Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E366018E025;
	Wed,  7 Oct 2026 14:45:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791384326; cv=none; b=tyl5KXHJ3yfR+w/HsXTtJx0/kPiSawING/W3rB8mP/PXbWyUtzAM5NlMZCTytLh5eWDU6qq4hz2wb7IpSWUKYOO/luE8YEyvwqR/RGdGA44AtMu9nw+C9C75UPnkG4+DuffP+jtALTUaMLVX5qaCdWOsD4PNRCkHfRHKovq6QQs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791384326; c=relaxed/simple;
	bh=PQsXqIiSd17qFuASBeOoruzUDnEDi6aWqdXtZPw3OPo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=LbPV0XqL11tjtrfsJh1Be80rX10hhHIvmskDzwSfxQQ9wUbutJTYhW8rCcdszTKUHgjf3yfD8Y8Gh+NZRy17bqehTtWtbXCZZ49UBn2GfXQPE6jTarug4xTv7eSclfX6srU+Om2Nc+M42aKciu6Itslj1k5xyxu6Z/0KHpSuoFE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DKTOx/Fk; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DKTOx/Fk"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2D53C1F00898;
	Wed,  7 Oct 2026 14:45:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791384321;
	bh=OFHWy0Xgz31BempumzZXo1smkzslk7H7S6NadQM7fMk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=DKTOx/FkMlY45v+uipdMcRrUJRiiMiBhF+UJqoxmxrL5/1zVKTT9cASGcqS4Ox6sY
	 Kw0EsxKruDUbTSELWF2UFSkyd6MDKsXFznAEIrpyrXmzQbhNGBA6pM/2/+IsoJ456S
	 WIsJ0qhF1OOtzHbycsdz0hHPbiCYkQeLrmcNxXG7Mln2aYYBxL039iFUPNBlXujJ2I
	 hxT+KJO+l9ZRZ9mS0Rr2AyOEpIQmLImsIOPpI414tLNlyG9AJEMmNLeS5Ls5/Q/U6K
	 CqtJ/hokvw40ij1SZ5xGhNV0t0MqRqlWstDS4S6L1BzQ4MlQ+WlcEwZUXUJzieTfcE
	 CFvmHKSOoiliA==
From: Sudeep Holla <sudeep.holla@kernel.org>
To: Cristian Marussi <cristian.marussi@arm.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Sudeep Holla <sudeep.holla@kernel.org>,
	arm-scmi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] firmware: arm_scmi: Update ARM_SCMI_HAVE_TRANSPORT rationale
Date: Wed,  7 Oct 2026 15:45:15 +0100
Message-ID: <179138427395.614377.18097611083155706293.b4-ty@b4>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <48c4bed8036dcb55f554f513ce2ae61807c5677d.1790684637.git.geert+renesas@glider.be>
References: <48c4bed8036dcb55f554f513ce2ae61807c5677d.1790684637.git.geert+renesas@glider.be>
Precedence: bulk
X-Mailing-List: arm-scmi@vger.kernel.org
List-Id: <arm-scmi.vger.kernel.org>
List-Subscribe: <mailto:arm-scmi+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:arm-scmi+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

On Tue, 29 Sep 2026 14:25:56 +0200, Geert Uytterhoeven wrote:
> Not enabling any transports no longer breaks the build.

Applied to sudeep.holla/linux (for-next/scmi/fixes), thanks!

[1/1] firmware: arm_scmi: Update ARM_SCMI_HAVE_TRANSPORT rationale
      https://git.kernel.org/sudeep.holla/c/e637b7744167
-- 
Regards,
Sudeep


Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5866751B162
	for <arm-scmi@vger.kernel.org>; Fri, 18 Sep 2026 16:53:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789750394; cv=none; b=GK0WjTb0GwVNjxv+Sfi55xSlP3TTYR7ErTkWsxOzwT5wT6Rx11g7ghCjo830ndfIVwlpn+dtfDhvIujoSe+DZOpi+kUgMiRJC3iSe3+Hco3bQTJaNm8/KQuHOM078VKBfdlXdm8W0cfyB4YgQZWH8CVFnQ5EUQ5x8YGajJiPGnI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789750394; c=relaxed/simple;
	bh=AWg2rPj0iUbkYnVkD+5Vp8WevBbFF6X6bh9ZnqKj2l8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=pD1DsSBBpGn7ZWe2RfRRitBDrNdHgK6497XDsSW6j6D8z4UZWw6yJiKks30CNuqHYVmoIwEp3pEhmeQt64C83KflkREEh10q8urxJ8VnMf5ibZ9I8g5mrcPjySNOKLbZ+ly+oG7yTMoLiVLZZCRTl+RhAgQPuLSpqWJw/x/I00E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=oCmOzlMa; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="oCmOzlMa"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 07F0F1F00898;
	Fri, 18 Sep 2026 16:53:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789750391;
	bh=CO8Oyn7IYG3ALHbSi2USsgfJ+x51TV4uRFx8m850/a0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=oCmOzlMaU9LSgu7TIKoQ2y7qM1hLwOxCnq9YWg2zNeO0TnU9K+w+1VutCGeJu0Pxg
	 z02M3v1d5f7J7usx/Gc4e8BBxkOBZRSzXO9hCA8GwikMrL3yyE/QrJDgODf29z0ye0
	 aSvVEM1o/DGn8rGUJBR72LF+e5mx48MZjNqWOiqsx6IGfnLmVnkwVTz+3Vgl/+TZcK
	 MYEaqUdRR0tvr7MzAOnY3ou5vB6/o5pZjBvUxeW/siNUaTPJKmdPSuUYn64gVa8YNT
	 BRlCTsUAmZgqa04TmSzMjWHjXLUAwRzqFvfQ4Y0NXjs5f+UpyiAv8RCo6VbDNi9Pig
	 MxwJm2DK7gmMQ==
From: Sudeep Holla <sudeep.holla@kernel.org>
To: arm-scmi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	kernel-team@meta.com,
	Sudeep Holla <sudeep.holla@kernel.org>
Cc: Cristian Marussi <cristian.marussi@arm.com>,
	Breno Leitao <leitao@debian.org>,
	Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>
Subject: Re: [PATCH v5 0/9] firmware: arm_scmi: Refactoring and enablement of ACPI PCC transport
Date: Fri, 18 Sep 2026 17:53:06 +0100
Message-ID: <178975035598.1810996.12105754539479601199.b4-ty@b4>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260915-acpi_scmi_pcc-v5-0-298579e9f359@kernel.org>
References: <20260915-acpi_scmi_pcc-v5-0-298579e9f359@kernel.org>
Precedence: bulk
X-Mailing-List: arm-scmi@vger.kernel.org
List-Id: <arm-scmi.vger.kernel.org>
List-Subscribe: <mailto:arm-scmi+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:arm-scmi+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

On Tue, 15 Sep 2026 18:03:34 +0100, Sudeep Holla wrote:
> The SCMI can be utilized in systems using either the FDT or ACPI specification.
> While FDT-based systems can natively use SCMI, ACPI-based systems often
> need to abstract the functionality provided by SCMI under ASL methods.
> So far, there has been no need to support SCMI natively on ACPI systems.
> 
> However, with the addition of a few new protocols such as Powercap and Telemetry,
> which lack abstractions in the ACPI specification, there is now a need to
> run SCMI natively for those use cases. ACPI for System Control and Management
> Interface document[1] provides a mechanism which allows ACPI-based systems to
> discover whether a platform supports SCMI and to natively use SCMI for
> selected/limited subset of SCMI protocols.
> 
> [...]

Applied to sudeep.holla/linux (for-next/scmi/updates), thanks!

[1/9] firmware: arm_scmi: Set generated device fwnode with platform helpers
      https://git.kernel.org/sudeep.holla/c/146af926951d
[2/9] firmware: arm_scmi: Extend transport driver macro to support ACPI
      https://git.kernel.org/sudeep.holla/c/8bac2642a97a
[3/9] firmware: arm_scmi: Convert OF-only paths to generic fwnode in SCMI core
      https://git.kernel.org/sudeep.holla/c/16276ab69678
[4/9] firmware: arm_scmi: Fall back to ACPI HID when "compatible" is absent
      https://git.kernel.org/sudeep.holla/c/17b3cdaa7ab4
[5/9] firmware: arm_scmi: Pass protocol ID to transport chan_available()
      https://git.kernel.org/sudeep.holla/c/f35ee1a26795
[6/9] firmware: arm_scmi: Refactor protocol device creation logic
      https://git.kernel.org/sudeep.holla/c/48339595cbd3
[7/9] firmware: arm_scmi: Add ACPI PCC transport
      https://git.kernel.org/sudeep.holla/c/b42e73fa118f
[8/9] firmware: arm_scmi: Initialise known ACPI protocol devices and channels
      https://git.kernel.org/sudeep.holla/c/4f5f291a5704
[9/9] firmware: arm_scmi: Validate PCC shared memory signature
      https://git.kernel.org/sudeep.holla/c/60a89ec8d8f5
-- 
Regards,
Sudeep


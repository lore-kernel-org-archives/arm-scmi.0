Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1014722128F
	for <arm-scmi@vger.kernel.org>; Thu, 24 Apr 2025 09:44:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745487873; cv=none; b=D5+1YH0AEAXZGbi3Z9+QNO3WmH7oPqDB9XW6i61/2a5x4xKmi39SbYw5j2BgfMOhxHWo0Tx1vbrwxctWzUJ2O5nf060qsbJwuET+vWtP/DzBy2lT+o4dkGm/G75Q6GVcWlv09Jmei+fmgCb0zEUWRiputh1JLBG3VUJ/bojqrBM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745487873; c=relaxed/simple;
	bh=ip7IHR8yK6pCnbytHCR7Ubx54r0SgM3KaHy7ks3iPXI=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=VfmuSQA1cVzo3849LJOS09hHzMnO/CZqyhf2xsQcZZRziSPVpcZoVmcJ0uv3pYOD3JUDlZYhBLGw+2FGB9ZVzttIB68W9YbirVm8Cnmj56LhKP531ZaNf9vdqYCNgg3CWrbUTq8kylukkL56QYPJVlBhqzVR9Jqot5bpk6chvtY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=arm.com; spf=none smtp.mailfrom=foss.arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=foss.arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 789FD1063;
	Thu, 24 Apr 2025 02:44:26 -0700 (PDT)
Received: from usa.arm.com (e133711.arm.com [10.1.196.55])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 820FE3F66E;
	Thu, 24 Apr 2025 02:44:30 -0700 (PDT)
From: Sudeep Holla <sudeep.holla@arm.com>
To: arm-scmi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Sudeep Holla <sudeep.holla@arm.com>
Cc: Cristian Marussi <cristian.marussi@arm.com>
Subject: Re: [PATCH v2 0/5] firmware: arm_scmi: Minor cleanups in the scmi bus layer
Date: Thu, 24 Apr 2025 10:44:25 +0100
Message-Id: <174548781195.775370.18358240370266528264.b4-ty@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250317-b4-scmi_minor_cleanup-v2-0-f4be99bd9864@arm.com>
References: <20250317-b4-scmi_minor_cleanup-v2-0-f4be99bd9864@arm.com>
Precedence: bulk
X-Mailing-List: arm-scmi@vger.kernel.org
List-Id: <arm-scmi.vger.kernel.org>
List-Subscribe: <mailto:arm-scmi+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:arm-scmi+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

On Mon, 17 Mar 2025 10:31:20 +0000, Sudeep Holla wrote:
> These cleanup centralizes error logging for SCMI device creation into a
> single helper function, _scmi_device_create(), consolidates the device
> matching logic into a single function, and ensures that devices must
> have a name for registration, removing support for unnamed devices while
> matching the devices and drivers for probing. It ensures the transport
> devices are excluded from the bus matching and the correct assignment
> of parent device for the arm-scmi platform device created in the
> transport drivers.
>
> [...]

Applied to sudeep.holla/linux (for-next/scmi/updates), thanks!

[1/5] firmware: arm_scmi: Ensure scmi_devices are always matched by name as well
      https://git.kernel.org/sudeep.holla/c/db28d02c4017
[2/5] firmware: arm_scmi: Refactor device matching logic to eliminate duplication
      https://git.kernel.org/sudeep.holla/c/3da2859ee5c9
[3/5] firmware: arm_scmi: Refactor error logging from SCMI device creation to single helper
      https://git.kernel.org/sudeep.holla/c/c69a31c1ad74
[4/5] firmware: arm_scmi: Assign correct parent to arm-scmi platform device
      https://git.kernel.org/sudeep.holla/c/953f4ce0a8d3
[5/5] firmware: arm_scmi: Exclude transport devices from bus matching
      https://git.kernel.org/sudeep.holla/c/9593804c44c2
--
Regards,
Sudeep


Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8312028D8E4;
	Wed,  9 Jul 2025 11:11:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752059520; cv=none; b=ZlsqhO1wntr0O4zkm/UGnMci/EQWOlCzaRYrQcOK5RDlMa+9JZdYkldQYanIXPW6/QXPl6KjrOkcnbg95fp/w/d+3URFQ0s1VnJpdv+IKUKKxji1JDHnXK1DnYVjp2ezm2DN3SGlT+O00BudMsgBOCkhRjWdmoVwEeGEzEZ3PmU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752059520; c=relaxed/simple;
	bh=RwcN6riHDmceRJhECePZDt6wYgfeqs2x/dB73Rlhg7Q=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=j6Q72hwJFY5zkIamT5isd867lQy5tkagDOZjtXLqrLbzmp2SRQdMG6CWOqGSxFurZzak6CfeO1MVAkstojLxhAzAiMCln92GtWMuRgthJJ/cjyyIQL0G2WWkcpV0fT/KPxPlO3vozppkySWg44N5A7QW35CDAZYCugSAYRPyOpY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=arm.com; spf=none smtp.mailfrom=foss.arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=foss.arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 655091516;
	Wed,  9 Jul 2025 04:11:47 -0700 (PDT)
Received: from usa.arm.com (e133711.arm.com [10.1.196.55])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 812AE3F738;
	Wed,  9 Jul 2025 04:11:57 -0700 (PDT)
From: Sudeep Holla <sudeep.holla@arm.com>
To: Peng Fan <peng.fan@nxp.com>,
	Arnd Bergmann <arnd@kernel.org>
Cc: Sudeep Holla <sudeep.holla@arm.com>,
	Arnd Bergmann <arnd@arndb.de>,
	Cristian Marussi <cristian.marussi@arm.com>,
	arm-scmi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] firmware: arm_scmi: convert to SYSTEM_SLEEP_PM_OPS
Date: Wed,  9 Jul 2025 12:11:53 +0100
Message-Id: <175205948920.1157216.306966807698770237.b4-ty@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250709070107.1388512-1-arnd@kernel.org>
References: <20250709070107.1388512-1-arnd@kernel.org>
Precedence: bulk
X-Mailing-List: arm-scmi@vger.kernel.org
List-Id: <arm-scmi.vger.kernel.org>
List-Subscribe: <mailto:arm-scmi+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:arm-scmi+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

On Wed, 09 Jul 2025 09:01:01 +0200, Arnd Bergmann wrote:
> The old SET_SYSTEM_SLEEP_PM_OPS() macro leads to a warning about an
> unused function:
> 
> drivers/firmware/arm_scmi/scmi_power_control.c:363:12: error: 'scmi_system_power_resume' defined but not used [-Werror=unused-function]
>   363 | static int scmi_system_power_resume(struct device *dev)
> 
> The proper way to do this these days is to use SYSTEM_SLEEP_PM_OPS()
> and pm_sleep_ptr().
> 
> [...]

Applied to sudeep.holla/linux (for-next/scmi/updates), thanks!

[1/1] firmware: arm_scmi: convert to SYSTEM_SLEEP_PM_OPS
      https://git.kernel.org/sudeep.holla/c/62d6b81e8bd2
--
Regards,
Sudeep


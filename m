Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 14CF08BE5;
	Thu,  2 Jan 2025 15:36:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735832165; cv=none; b=ezz2/iAxA5ZepVZs4JuCqPbD7Cd6tpUByVSk0YgC1PHXuuc4WrSg1cY0I3Ot2uemV+xCrcRpUJHTDi73a8VVkXzQrlZBw9gLBobhzZf1wPPlsCC17qM8Ho+gfzHZxYT+mcjVFQXMClCQt2sdIS7b7gGFBXf0gcYfs/QbjUR7Iec=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735832165; c=relaxed/simple;
	bh=ilfPsjWmhFnYOfoT0nGXyZh7QmOrhKVkTU38elYFJls=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=YaYIOczshy26ciWGS8qvp0EOXypwq4xzG4StX3h9+5gSQSJLkZdJZJIHLMUQQUtCjfvX2nSDCAEPXL0sZ/LBtfwIuD3SMzlr4pgo4Y5Kh0gHsgWk7bhIV02khZWJ9Mf4q6aDabouIua8da282ttlrpMkZRs/dTkkTWNe6tzrtuc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 84CBA11FB;
	Thu,  2 Jan 2025 07:36:30 -0800 (PST)
Received: from usa.arm.com (e133711.arm.com [10.1.196.55])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 6CC063F59E;
	Thu,  2 Jan 2025 07:36:01 -0800 (PST)
From: Sudeep Holla <sudeep.holla@arm.com>
To: linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	arm-scmi@vger.kernel.org,
	Cristian Marussi <cristian.marussi@arm.com>
Cc: Sudeep Holla <sudeep.holla@arm.com>
Subject: Re: [PATCH] firmware: arm_scmi: Allow transport properties for multiple instances
Date: Thu,  2 Jan 2025 15:35:45 +0000
Message-Id: <173583209672.2166569.10777451109101759232.b4-ty@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241203193544.3895173-1-cristian.marussi@arm.com>
References: <20241203193544.3895173-1-cristian.marussi@arm.com>
Precedence: bulk
X-Mailing-List: arm-scmi@vger.kernel.org
List-Id: <arm-scmi.vger.kernel.org>
List-Subscribe: <mailto:arm-scmi+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:arm-scmi+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

On Tue, 03 Dec 2024 19:35:44 +0000, Cristian Marussi wrote:
> Default SCMI transport properties values can be overridden with devicetree
> provided descriptors; in order to support multiple SCMI instances, make the
> properties-update happen on a per-instance copy of the original transport
> descriptor.

Applied to sudeep.holla/linux (for-next/scmi/updates), thanks!

[1/1] firmware: arm_scmi: Allow transport properties for multiple instances
      https://git.kernel.org/sudeep.holla/c/e501bfde6558
--
Regards,
Sudeep


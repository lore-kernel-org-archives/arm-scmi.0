Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B5206204C34
	for <arm-scmi@vger.kernel.org>; Fri, 21 Feb 2025 11:36:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740137817; cv=none; b=jV1PrW7eMV0NBe+fRor55OFHRejxvyLmycvvXre9zQG0mH7zH336BsvbzPUkhW7OS+ql4NHE6m0fH/kqHy9r09jFb/WxZ0xFWF30D1puIwhlY1tDpdIXEEBd6VeXT8JqS3V8lLX4Q1iH9b6wVwC22+196FZ/l0QzamoMrykduFg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740137817; c=relaxed/simple;
	bh=gakFPfz85QraKQfD0ADm0+IAwUa9i+cMf3fPPtGLJ68=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Ir/G51xlQBEx5aI7y1083TCgmd8piV88qOqHPK5ktE5KgFqg4RYVcGncBZEXwFsTTp17zGa2aydDvVngd6RZReeBRqUVkzvdK8If86TiMa6ZQzqxglSNqiwG+qF7f2SVERF+NN8B3JD5+f+njy64zlKekZ+MNijUHR9N+QEw/cw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 5B7B61516;
	Fri, 21 Feb 2025 03:37:11 -0800 (PST)
Received: from usa.arm.com (e133711.arm.com [10.1.196.55])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 3E96A3F59E;
	Fri, 21 Feb 2025 03:36:52 -0800 (PST)
From: Sudeep Holla <sudeep.holla@arm.com>
To: arm-scmi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Sudeep Holla <sudeep.holla@arm.com>
Cc: Cristian Marussi <cristian.marussi@arm.com>,
	Xinqi Zhang <quic_xinqzhan@quicinc.com>,
	Peng Fan <peng.fan@nxp.com>,
	Guomin Chen <guomin_chen@sina.com>
Subject: Re: [PATCH 1/3] firmware: arm_scmi: Relax duplicate name constraint across protocol ids
Date: Fri, 21 Feb 2025 11:36:41 +0000
Message-Id: <174013775144.527060.3854739090604222031.b4-ty@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250131141822.514342-1-sudeep.holla@arm.com>
References: <20250131141822.514342-1-sudeep.holla@arm.com>
Precedence: bulk
X-Mailing-List: arm-scmi@vger.kernel.org
List-Id: <arm-scmi.vger.kernel.org>
List-Subscribe: <mailto:arm-scmi+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:arm-scmi+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

On Fri, 31 Jan 2025 14:18:20 +0000, Sudeep Holla wrote:
> Currently in scmi_protocol_device_request(), no duplicate scmi device
> name is allowed across any protocol. However scmi_dev_match_id() first
> matches the protocol id and then the name. So, there is no strict
> requirement to keep this scmi device name unique across all the protocols.
>
> Relax the constraint on the duplicate name across the protocols and
> inhibit only within the same protocol id.
>
> [...]

Applied to sudeep.holla/linux (for-next/scmi/updates), thanks!

[1/3] firmware: arm_scmi: Relax duplicate name constraint across protocol ids
      https://git.kernel.org/sudeep.holla/c/21ee965267bc
[2/3] firmware: arm_scmi: Add name and protocol id attributes
      https://git.kernel.org/sudeep.holla/c/feaea74fd697
[3/3] firmware: arm_scmi: Emit modalias for SCMI devices
      https://git.kernel.org/sudeep.holla/c/d069c33f5ce2
--
Regards,
Sudeep


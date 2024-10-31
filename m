Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 81C31194C6B;
	Thu, 31 Oct 2024 17:16:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730394969; cv=none; b=rLF/i3VmqYQbZSL9o1pFQ6rwc8bONilNsjFi1TLInHztQbGWtmCi8PIcZpuN5yYf95Klgd8zDZw+MXQwHZRejuyCbLJZA9vYSbRMIpxZoOByrHzZSr6VzhQMCAloFZNN313cVgAB3BNLyK9bh0YbFdRv1WZOxFo/QubJe1vYRV0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730394969; c=relaxed/simple;
	bh=005xkjtnlU6oyk/+0nHfJS1oRRgb6Ml20SVYLTsG7yc=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=WsVzu1ThemlDdKsyipMAeL3Yw4mr2ZtqhUIF9ia8A93ghAjhfLlslob/CEnDO1IEYjrZX2sBRrgFoC6nFrFfs4Ys9VnsaLY9xir1eQ3SLkLY+iE4l5ZnYqvH44T27KFjtSnpt1AXyoPkQjHW4H7O4h92zTaYBB0IlBzeib6uvn4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 23D1A1063;
	Thu, 31 Oct 2024 10:16:35 -0700 (PDT)
Received: from usa.arm.com (e133711.arm.com [10.1.196.55])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 91A933F73B;
	Thu, 31 Oct 2024 10:16:04 -0700 (PDT)
From: Sudeep Holla <sudeep.holla@arm.com>
To: linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	arm-scmi@vger.kernel.org,
	Cristian Marussi <cristian.marussi@arm.com>
Cc: Sudeep Holla <sudeep.holla@arm.com>
Subject: Re: [PATCH] firmware: arm_scmi: Reject clear channel request on A2P
Date: Thu, 31 Oct 2024 17:16:02 +0000
Message-Id: <173039475222.3108069.291513539121527165.b4-ty@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241021171544.2579551-1-cristian.marussi@arm.com>
References: <20241021171544.2579551-1-cristian.marussi@arm.com>
Precedence: bulk
X-Mailing-List: arm-scmi@vger.kernel.org
List-Id: <arm-scmi.vger.kernel.org>
List-Subscribe: <mailto:arm-scmi+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:arm-scmi+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

On Mon, 21 Oct 2024 18:15:44 +0100, Cristian Marussi wrote:
> The clear channel transport operation is supposed to be called exclusively
> on the P2A channel from the agent, since it relinquishes the ownership of
> the channel to the platform, after this latter has initiated some sort of
> P2A communication.
> 
> Make sure that, if it is ever called on a A2P, is logged and ignored.
> 
> [...]

Applied to sudeep.holla/linux (for-next/scmi/fixes), thanks!

[1/1] firmware: arm_scmi: Reject clear channel request on A2P
      https://git.kernel.org/sudeep.holla/c/a0a18e91eb3a
--
Regards,
Sudeep


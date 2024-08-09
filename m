Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 64A831957F8;
	Fri,  9 Aug 2024 13:34:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723210475; cv=none; b=ZUQB6rShzD4z8SYPc5U+J62knROUabZj2f9pr0sNg+NzIHpQ6q4Dv1U+hTiC7HJSG5Oj4+lvS/MLHw96rCZHQu2375UAj/fTxAyaTzkpDHM23ZCzoPbO6HAn8HsfIW3796pvACze+2ouXyrhmkH9pQrf2E3trcS7WOspzw9jHrk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723210475; c=relaxed/simple;
	bh=eePWlSDssFkATF5FBCggmH1VDNMjhQvcckssOQR4ayc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=j96b1z2ouefvuHkJo0nI6mk3JmH1zmkDU/pM4KIebpheD3OwxKgFFjxIBDYNvfHed+umsS9Gwz7OeJfHTednGEmuz5G9I6h/smjNymsiK6ddNQPbv5t8LkiQqIGgBDp752odTXXCQrfILY5hdqSKJ63UqES45PYZnwgsmOOdySE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 875D713D5;
	Fri,  9 Aug 2024 06:34:58 -0700 (PDT)
Received: from usa.arm.com (e103737-lin.cambridge.arm.com [10.1.197.49])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 9EB5D3F6A8;
	Fri,  9 Aug 2024 06:34:31 -0700 (PDT)
From: Sudeep Holla <sudeep.holla@arm.com>
To: linux-kernel@vger.kernel.org,
	Etienne Carriere <etienne.carriere@foss.st.com>
Cc: Sudeep Holla <sudeep.holla@arm.com>,
	Cristian Marussi <cristian.marussi@arm.com>,
	arm-scmi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH] firmware: arm_scmi: fix voltage description in failure cases
Date: Fri,  9 Aug 2024 14:34:22 +0100
Message-ID: <172320999328.1571611.9059796413880230384.b4-ty@arm.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20240725065317.3758165-1-etienne.carriere@foss.st.com>
References: <20240725065317.3758165-1-etienne.carriere@foss.st.com>
Precedence: bulk
X-Mailing-List: arm-scmi@vger.kernel.org
List-Id: <arm-scmi.vger.kernel.org>
List-Subscribe: <mailto:arm-scmi+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:arm-scmi+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

On Thu, 25 Jul 2024 08:53:17 +0200, Etienne Carriere wrote:
> Reset the reception buffer max size when a voltage domain description
> request fails, for example when the voltage domain returns an access
> permission error (SCMI_ERR_ACCESS) unless what only a single 32bit
> word is read back for the remaining voltage description requests
> responses leading to invalid information. The side effect of this
> issue is that the voltage regulators registered from those remaining
> SCMI voltage domain were assigned a wrong regulator name.
>
> [...]

Applied to sudeep.holla/linux (for-next/scmi/updates), thanks!

[1/1] firmware: arm_scmi: fix voltage description in failure cases
      https://git.kernel.org/sudeep.holla/c/eedc060cff72
--
Regards,
Sudeep


Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4A390224B04;
	Thu,  1 Jan 2026 17:56:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767290173; cv=none; b=ejfM7VBO+esAtBs/YVDasRibg8lE6xa9WzhQicvSDxMa3478/DXWGaV4chbqKAcJ7zTYQzIc4+PZF/mcsheoYRhiAWVNGmtbhQD7qWlpGH8zEKz9kaLyp/TFuKcuUIQtapHXjdV0OG9nbDNyRVqICvcGO84OX15mp4d6PDssIt4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767290173; c=relaxed/simple;
	bh=jbvD/A8L2C5k5QY3e2J8kZeMNURfP6yZolDwL/OxUTU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=E4rwwPKzt0/Uv0V6uQ6yP4x7iEOjeNFjReynzgSsvjOrDdMapKPMzTtdi8LvvpFUgAM8wcRImMXCOEYqklzSxpsAxFqVqD3Ftlu8rw+cEz0NZgI8z9RHUrXNwnPn24V4Id8dZPz06VshLbStodXO8Axo5c+V7omduh2+A47YitE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=foss.arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id CA376497;
	Thu,  1 Jan 2026 09:56:04 -0800 (PST)
Received: from usa.arm.com (e133711.arm.com [10.1.197.51])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id AB3B53F63F;
	Thu,  1 Jan 2026 09:56:10 -0800 (PST)
From: Sudeep Holla <sudeep.holla@arm.com>
To: cristian.marussi@arm.com,
	Artem Shimko <a.shimko.dev@gmail.com>
Cc: Sudeep Holla <sudeep.holla@arm.com>,
	arm-scmi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4] firmware: arm_scmi: refactor reset domain handling
Date: Thu,  1 Jan 2026 17:56:07 +0000
Message-ID: <176729013834.117553.5174830744043719294.b4-ty@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251123163557.230530-1-a.shimko.dev@gmail.com>
References: <aRW4PpPjVw1-melm@pluto> <20251123163557.230530-1-a.shimko.dev@gmail.com>
Precedence: bulk
X-Mailing-List: arm-scmi@vger.kernel.org
List-Id: <arm-scmi.vger.kernel.org>
List-Subscribe: <mailto:arm-scmi+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:arm-scmi+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

On Sun, 23 Nov 2025 19:35:57 +0300, Artem Shimko wrote:
> Improve the SCMI reset protocol implementation by centralizing domain
> validation and enhancing error handling.
> 
> Add scmi_reset_domain_lookup() helper function to validate
> domain ids and return appropriate error codes. Refactor all
> domain-specific functions to use this helper, ensuring consistent
> error handling throughout the reset protocol.
> 
> [...]

Applied to sudeep.holla/linux (for-next/scmi/updates), thanks!

[1/1] firmware: arm_scmi: refactor reset domain handling
      https://git.kernel.org/sudeep.holla/c/f6753869a25e
--
Regards,
Sudeep


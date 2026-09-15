Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F22753DB311;
	Tue, 15 Sep 2026 17:25:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789493111; cv=none; b=FO2XGOj/pVmJZ5ARea4VssXGh7sDPctp1di0pbo0OvmarsOj5PvUClThamRbLkaaI8sKIgE1wb3YmVEqRuhGeRt64nzDO81Ff/U3FuMntHf6ZB5D8wN6xvkpdOjvJGYEv6QpQSUkV2Nc5Y0w+nHicgs7MAgvRLGzc1qwrPjD7AA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789493111; c=relaxed/simple;
	bh=0qbW67/T3T0bLtuIajnR8pJLWo1qjOYppBbaf8eZ7UM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Bcs+oHzLlSbr5RxUjn5NQAvuZv/o2p3ZcZz04xohlCOceZTEEGtLZAg1SWnpNB4vlIHcwGRwk0bJPm//L19Gak3bMZ3fz+LSg24btXFW6FXjqxzWgC//KWL+VHpRjb1seCTIPPLWO3zEHgmii1rxv0sUqjIjx7sqdjLRsgKsdKw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hO3gh8+v; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hO3gh8+v"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4CC2E1F000FF;
	Tue, 15 Sep 2026 17:25:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789493109;
	bh=580eTFP1NkimzWPNgS+9nYszud29IW8q8yHcoG0IgdQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=hO3gh8+vlntlL5nCY1tQn6k1zDAHMnNhEaIOgyPOt+/Rilu6mgphABwRqdxLGT02q
	 kxKsCXquKHhovd+PyJ1lRSgNLyF3HxG2F+azgQHm0L9+6W6efGDY90b10Z0yfvLAKY
	 7iUdzTEPvXEf771V4jmgSZ9RIdGJOx5aBB9asLDHzU+7/Pw2oz2jWnk87nm/p56xuy
	 iLjqMRI8MlZTEbzjYUkKjzWoG96JymXLDE1Z3MTe16gtXShIqci+kHpXXhwS1NTpse
	 yACYL2FyaMdW9eWTkXVUZMAP4ZyaLc9fSS2EHn3WcUYIhhfE+wTXq+wJAnvYQc1kxv
	 vXoS24MlOWtXw==
From: Sudeep Holla <sudeep.holla@kernel.org>
To: Cristian Marussi <cristian.marussi@arm.com>,
	Roland Dreier <rolanddreier@rivian.com>
Cc: Sudeep Holla <sudeep.holla@kernel.org>,
	arm-scmi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Sashiko <sashiko-bot@kernel.org>
Subject: Re: [PATCH] firmware: arm_scmi: Fix error path leak in scmi_raw_message_send()
Date: Tue, 15 Sep 2026 18:25:04 +0100
Message-ID: <178949307034.3922413.1605841752391153227.b4-ty@b4>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260909-scmi-raw-v1-1-de3fa75d2c6f@rivian.com>
References: <20260909-scmi-raw-v1-1-de3fa75d2c6f@rivian.com>
Precedence: bulk
X-Mailing-List: arm-scmi@vger.kernel.org
List-Id: <arm-scmi.vger.kernel.org>
List-Subscribe: <mailto:arm-scmi+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:arm-scmi+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

On Wed, 09 Sep 2026 17:58:59 +0000, Roland Dreier wrote:
> When the is_transport_polling_capable() check fails in scmi_raw_message_send(),
> it returns -EINVAL without doing scmi_xfer_raw_put(), which will leak a
> struct scmi_xfer.

Applied to sudeep.holla/linux (for-next/scmi/updates), thanks!

[1/1] firmware: arm_scmi: Fix error path leak in scmi_raw_message_send()
      https://git.kernel.org/sudeep.holla/c/1adabdce41b9
-- 
Regards,
Sudeep


Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4462737D135;
	Fri, 14 Aug 2026 20:16:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786738611; cv=none; b=rIMJeQD+nyyko2num67Tj82jtaek7rWK/ehG1hTs3PMAsRyHHt7S2NVKOl0J3Sq3+B43tYwUksHVIs0qlXiN7OH1bWRhdPoTIWr/ycsqb7/md3fjqS5YK6WoVVqTRnhIrhNR4mnu0QtTAVwElOTNuSPE0WJUNvnlZMmldZQTZtU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786738611; c=relaxed/simple;
	bh=kyXZxlfFjxRc8A1yzHEvXAwoUlJDSZwiNaHsfRS0PTc=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=G8zakbFfDSl6FJN1lctNjv0DwGhzLfAUR79Wip35PIYl7gstIzy2iYRCfHozapw3VZyofok+c5M/OHjbs+6nyCL4C2p7lT5T6XOWIDYFSfs4eVe+pT0gtxxubCRVhui5L0swDfOEH0AkVe9N8WY4NxTPk/H37vKLPojtW8MEDOM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hTId0bm5; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hTId0bm5"
Received: by smtp.kernel.org (Postfix) with ESMTPS id D1F8DC2BCB3;
	Fri, 14 Aug 2026 20:16:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1786738610;
	bh=kyXZxlfFjxRc8A1yzHEvXAwoUlJDSZwiNaHsfRS0PTc=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=hTId0bm5yrpJIEKoeZF8yV3C2li6Tl2yYGw0Wv/3HgWZ6htrDHX37PdyWHTGgsF70
	 2YjJ2W3FQ1iiSbxa9ziZDRehKKblQm1IvIEcYwY7ML5Ih7oJWHVOdrxukkzXED2PK1
	 em0S6LhCqygFDNC6HXrkOaJCi0KeRSOXYoK8/CS2Gv8aTZXZaMPN0rEJYivvTOBfFD
	 FVW19pSEH0YhjhohRbalqez5CUdLfzWtl25XnWzYnehTwILAN2DmLse1YvKGfYlmc+
	 nbnWjCS4xZvFVNEvtvgwdG1Q8Rvqe3cpNSLCQYXoscxeSpOMiid4+BzmW28s0oL7o3
	 Sq6Mfi84+vXfQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AD572C5CFCF;
	Fri, 14 Aug 2026 20:16:50 +0000 (UTC)
From: Roland Dreier via B4 Relay <devnull+rolanddreier.rivian.com@kernel.org>
Subject: [PATCH 0/2] Couple of SCMI race fixes
Date: Fri, 14 Aug 2026 20:15:32 +0000
Message-Id: <20260814-scmi-async-done-race-v1-0-335b163d77ee@rivian.com>
Precedence: bulk
X-Mailing-List: arm-scmi@vger.kernel.org
List-Id: <arm-scmi.vger.kernel.org>
List-Subscribe: <mailto:arm-scmi+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:arm-scmi+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAGV3f2oC/yXMSw7CMAxF0a1UHmOpjsqnbAUxCM4rGIkUxYCKq
 u6dAMMzuHcmRzE47ZuZCl7mNuYKWTWkl5jPYEvVFNqwaXfSsevNOPo7K6cxg0tUcOhFtkMS9HF
 NNb0XDDb9tofj3/48XaGP74uW5QPeOiOYeAAAAA==
X-Change-ID: 20260814-scmi-async-done-race-29117fd1e9a5
To: Sudeep Holla <sudeep.holla@kernel.org>, 
 Cristian Marussi <cristian.marussi@arm.com>
Cc: arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1786738610; l=965;
 i=rolanddreier@rivian.com; s=20260814; h=from:subject:message-id;
 bh=kyXZxlfFjxRc8A1yzHEvXAwoUlJDSZwiNaHsfRS0PTc=;
 b=fklnXBet195Xl7+9WUzlKKApBOJT/7ophRWBEu3jZJc8RCaHZJiU3N8XIGeV9zKyUoUWqu5zt
 o+iT2qg8zcMC8dp/gPXNdObtdLNh1NnL1yd21kGJdBVoC8JO/IhqaLP
X-Developer-Key: i=rolanddreier@rivian.com; a=ed25519;
 pk=C7SBXsDIlarq7BpINqyDL67XV/AGNqNt09NCCpFcExk=
X-Endpoint-Received: by B4 Relay for rolanddreier@rivian.com/20260814 with
 auth_id=952
X-Original-From: Roland Dreier <rolanddreier@rivian.com>
Reply-To: rolanddreier@rivian.com

Noticed a couple of races in SCMI code around delayed responses that
time out. These are probably nearly impossible to hit in practice but
the fixes are pretty straightforward and it seems worth having the
code be sound.

Signed-off-by: Roland Dreier <rolanddreier@rivian.com>
---
Roland Dreier (2):
      firmware: arm_scmi: Protect xfer->async_done with xfer->lock
      firmware: arm_scmi: Don't reuse raw xfers with async_done still armed

 drivers/firmware/arm_scmi/common.h    | 23 ++++++++++++++++++++++
 drivers/firmware/arm_scmi/driver.c    | 36 ++++++++++++++++++++++++++++++-----
 drivers/firmware/arm_scmi/protocols.h |  9 ++++++---
 drivers/firmware/arm_scmi/raw_mode.c  | 29 ++++++++++++++++++++++------
 4 files changed, 83 insertions(+), 14 deletions(-)
---
base-commit: a5161661ae99f497affa83a5b8654e457cda6267
change-id: 20260814-scmi-async-done-race-29117fd1e9a5

Best regards,
--  
Roland Dreier <rolanddreier@rivian.com>



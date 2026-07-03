Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F075D30AD0C
	for <arm-scmi@vger.kernel.org>; Fri,  3 Jul 2026 20:25:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783110334; cv=none; b=NJhDH8SnGKz7zR+qDmnSHLy7x9DLl+x+Jn0xMheY4UFTjxyQIkUe4iwpXnRHSu9aWu0Wd46pzow3U2kpy3aYfQHt9DYgPtKIlOkpV5qmQP7ECg41P/Zvp1Ph7n4O6kPGuC+UZH/NQYzXte2VJtMzRnc29/Ub04rFEYPsokB8bJs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783110334; c=relaxed/simple;
	bh=HBtfQ/U7iBOwsRbYqoYllme3eAUoqjVJ3OIbBCfti6g=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=EbPQ5cIA8e1Q0V3RWAaks3f4klzeAEHrs4XsWkDw3/YKWmwwIXPLoPBc4iTpwO2EF0oI3J+4q5srLBvo+ILYD02UIEEkPSOzLRksZnwaiFpzhhfR9Su+nL2Tr7dPRhiI+ETRBRB0zY6yI8mYH2RVqMNBnfUNDszd1bvINmKJur0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=oikmJylN; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="oikmJylN"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 54BB91F000E9;
	Fri,  3 Jul 2026 20:25:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783110332;
	bh=qJ0jOkL1ltEZQTlEuZlzOaSUuaAoYiJSzKQRTPeitxg=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=oikmJylNHZM9npSI/21eAwlIDSrN0vyCz+r9aBWUu34hOS/DKu4LB1Ofr9AYvhBtd
	 EHqJ6GbKTqAm3mg3hSauSStx9u5hKKq9A9cjESBRIFS6NgQrQ1+dOVLinL8KJjGKZi
	 dVi9IQxws1pHSyILHB+kUdyIJW29d64tEutDlrfaefrYsp45BjYSqcUel+0E9zlIzZ
	 C3L6PFeyTY8giPr+prxvfWWmeUol+Rsx5izIOLIpfAp+AYImoP5g/HNLACO3nczH5j
	 REgNvehPBB98jXAJzNyQ2HYUTdNEetXR+efsQ2rJVc/DGj4PhTmJMA3eTT8uEIp/PH
	 dBuCgTGgyVJZg==
From: Sudeep Holla <sudeep.holla@kernel.org>
Date: Fri, 03 Jul 2026 21:22:41 +0100
Subject: [PATCH v3 05/17] firmware: arm_scmi: Free transport channel on IDR
 failure
Precedence: bulk
X-Mailing-List: arm-scmi@vger.kernel.org
List-Id: <arm-scmi.vger.kernel.org>
List-Subscribe: <mailto:arm-scmi+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:arm-scmi+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260703-scmi_core_fixes-v3-5-5bae9766abfc@kernel.org>
References: <20260703-scmi_core_fixes-v3-0-5bae9766abfc@kernel.org>
In-Reply-To: <20260703-scmi_core_fixes-v3-0-5bae9766abfc@kernel.org>
To: arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc: Cristian Marussi <cristian.marussi@arm.com>
X-Mailer: b4 0.15.2

If transport channel setup succeeds but the following IDR insertion fails,
the error path destroys the transport device and frees the channel info
without invoking the transport cleanup callback.

Call chan_free() before destroying the device so transport specific
resources such as IRQs, mailbox channels and mapped shared memory are
released consistently with the normal teardown path.

Fixes: 05a2801d8b90 ("firmware: arm_scmi: Use dedicated devices to initialize channels")
Reported-by: Sashiko <sashiko-bot@kernel.org>
Signed-off-by: Sudeep Holla <sudeep.holla@kernel.org>
---
 drivers/firmware/arm_scmi/driver.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/firmware/arm_scmi/driver.c b/drivers/firmware/arm_scmi/driver.c
index 861087b2920e..4b369b003003 100644
--- a/drivers/firmware/arm_scmi/driver.c
+++ b/drivers/firmware/arm_scmi/driver.c
@@ -2808,6 +2808,7 @@ static int scmi_chan_setup(struct scmi_info *info, struct device_node *of_node,
 			"unable to allocate SCMI idr slot err %d\n", ret);
 		/* Destroy channel and device only if created by this call. */
 		if (tdev) {
+			info->desc->ops->chan_free(prot_id, cinfo, idr);
 			scmi_device_destroy(info->dev, prot_id, name);
 			devm_kfree(info->dev, cinfo);
 		}

-- 
2.43.0


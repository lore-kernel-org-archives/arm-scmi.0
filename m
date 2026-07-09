Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 410EF407CEB
	for <arm-scmi@vger.kernel.org>; Thu,  9 Jul 2026 08:53:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783587185; cv=none; b=R6kQk6BIRhYednCGw3nP4dEC0Xqq8lLweFa9sPR4j62ZY44JK2dRITqyXUwp+kqibCiBnRU5PDeU2TBUeGuXP3stKDqzaeICfNCZ6pBT8PF2To29vkdzFJYZiBOBBWZiFBpvXWwUHMXIoVJbJ5L7WbIO6InGfFLp6K/yPuFeP64=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783587185; c=relaxed/simple;
	bh=Yx+qFjb16exLLFBfrmWiMEIA7WPGYbrOZQEFXsaGYq0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=jtrw6nwFIq1siR0ytGWTRyfqP+pdbIOLpz0NLpmiDqJWEqmX0VNdZeUlf+O6n9gYguRpJ+7AcgUMaFfUgh8aPabICFqHesyPhpj6aDZOgtj2Jor7XqaPHxPtGuCbRuZMquQth7KYMPT2BDIkLZKK4td6tkEohJFAFC2MNvVktwo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=V89KoyTV; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="V89KoyTV"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7AAFB1F00AC4;
	Thu,  9 Jul 2026 08:53:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783587184;
	bh=NkqNnr0T3z7Jq2hW5XWOIGYqU/BxLx95+f4ctMovvEk=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=V89KoyTVOjn8yfXGh2bi/jAZRX2vebTJatg0elXgibCNyH102Rk4PGc+TjsU0VdOF
	 U3eqp2pEbyLhICO7AZ/0OUYFqHvGGfAqUlrTRVfGBIpxdUx15fXAsI+nvPnnbnnvYN
	 vFFER5n0/x5lqxNe05LpBLyT9926GVkaZMzX4qcnYS1cnB1l+le9Pyu38egcxTgNaT
	 CJu1zQ9GAU6pVxeHkaGLIrN+uP0JDApt3qTAqcWi3UumS5Au3WYYdMXkr6x81hEBrl
	 LJZLBtIH7kyhIuEO/RzMqE8U7G/+6vEfK4/scswN53GTYatoiPLyTcQ61mkKgRnNRB
	 ocNSjXAZhamGA==
From: Sudeep Holla <sudeep.holla@kernel.org>
Date: Thu, 09 Jul 2026 09:52:29 +0100
Subject: [PATCH v5 05/16] firmware: arm_scmi: Avoid IDR updates while
 cleaning channels
Precedence: bulk
X-Mailing-List: arm-scmi@vger.kernel.org
List-Id: <arm-scmi.vger.kernel.org>
List-Subscribe: <mailto:arm-scmi+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:arm-scmi+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260709-scmi_core_fixes-v5-5-bea6a3024f05@kernel.org>
References: <20260709-scmi_core_fixes-v5-0-bea6a3024f05@kernel.org>
In-Reply-To: <20260709-scmi_core_fixes-v5-0-bea6a3024f05@kernel.org>
To: arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc: Cristian Marussi <cristian.marussi@arm.com>
X-Mailer: b4 0.15.2

scmi_cleanup_channels() walks the TX/RX channel IDRs with
idr_for_each() to free transport resources and destroy the dedicated
transport devices before calling idr_destroy().

The destroy callback removed each entry from the same IDR being walked.
That is not needed for this cleanup path, and it is unsafe because
idr_for_each() has not advanced its radix-tree iterator while the
callback is running. Removing the current entry from the callback can
invalidate the iterator state. The callback also cannot be protected by
rcu_read_lock(), because scmi_device_destroy() may sleep.

Leave IDR teardown to the following idr_destroy() call and keep the
callback limited to device destruction.

Fixes: 05a2801d8b90 ("firmware: arm_scmi: Use dedicated devices to initialize channels")
Reported-by: Sashiko <sashiko-bot@kernel.org>
Signed-off-by: Sudeep Holla <sudeep.holla@kernel.org>
---
 drivers/firmware/arm_scmi/driver.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/firmware/arm_scmi/driver.c b/drivers/firmware/arm_scmi/driver.c
index 29c89aa4710b..ad4587d75a08 100644
--- a/drivers/firmware/arm_scmi/driver.c
+++ b/drivers/firmware/arm_scmi/driver.c
@@ -2885,7 +2885,7 @@ static int scmi_channels_setup(struct scmi_info *info)
 	return 0;
 }
 
-static int scmi_chan_destroy(int id, void *p, void *idr)
+static int scmi_chan_destroy(int id, void *p, void *data)
 {
 	struct scmi_chan_info *cinfo = p;
 
@@ -2898,8 +2898,6 @@ static int scmi_chan_destroy(int id, void *p, void *idr)
 		cinfo->dev = NULL;
 	}
 
-	idr_remove(idr, id);
-
 	return 0;
 }
 

-- 
2.43.0


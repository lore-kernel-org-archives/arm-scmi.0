Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4E6A3E63A4
	for <arm-scmi@vger.kernel.org>; Wed,  8 Jul 2026 09:00:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783501230; cv=none; b=nw7eY1Dw8+QVOxWH+IGdn3cEQEyssMsASbNp306YFLIrXDaVnZqTL6DhJ35IcCP1mEZjpMZMw7u9IzixKesfs60jwzbeVdOY6PLjNQ6LJFsQvGFK3Jz4cllSnlF0XMYG3Es0MSXoOi4XBEvKQFuvnIV3FynnxnwjStwjjjWr3KA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783501230; c=relaxed/simple;
	bh=TRdek0g7rhOliLe5IBYEdj5rbx4LGGwqH9lK6nE2T0o=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=lypdqaDXPBuAC6+/eMw+tHClvFyn4jzMwS6U0/n2zGcP8owXw9vRr9iTL8/JS5SY3aH08sIMEzUbJPGLTNLArvlaYOx0Z/5NR+NVzrIHa/S7br2hxjXdNr+t6nk3s3FRVN7OqRyXmHFjG2nuRbv/YKLTqYyqUDHQIy6syWvGfgU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fm96ya9L; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fm96ya9L"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 484021F00A3D;
	Wed,  8 Jul 2026 09:00:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783501229;
	bh=EFSMF/UUQ/jmj4LT03D5ukygscU0JNIQNzF2vvZDJ4k=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=fm96ya9Lx5ykmSLDc5Dq5mu/CNPVnbAUim/eDPtYdyc7gh+RRv4aLruwZzcXf6g60
	 r0b3R3jjv6ysiwddJGZd3vsjESEz3LmgjOohoHsvFpsGoqX+hjk6IC/WgwNPIUf+8h
	 g9UZcOTAnezryqMUAiQ/4hibQ5UjSJU2Y8xiDqMvQxd8v1Ow2TdBL8JlZU2Z49BSMi
	 4S2hXlmM86EbAZedfZWXxYazN3YRI8ehkFCsFp1PmGAjCH+YminAjLA8GRnF/shUWL
	 QV+uCiltELxIfbwZVTp92gZIJZrRveVWPhxRfsqM0ZEG8SBXxB0lwC0LM3G30RsfR7
	 yMYsA6rPf0Adw==
From: Sudeep Holla <sudeep.holla@kernel.org>
Date: Wed, 08 Jul 2026 10:00:01 +0100
Subject: [PATCH v4 05/16] firmware: arm_scmi: Avoid IDR updates while
 cleaning channels
Precedence: bulk
X-Mailing-List: arm-scmi@vger.kernel.org
List-Id: <arm-scmi.vger.kernel.org>
List-Subscribe: <mailto:arm-scmi+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:arm-scmi+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260708-scmi_core_fixes-v4-5-53142cd60b63@kernel.org>
References: <20260708-scmi_core_fixes-v4-0-53142cd60b63@kernel.org>
In-Reply-To: <20260708-scmi_core_fixes-v4-0-53142cd60b63@kernel.org>
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
index 9428c0777899..3b0c8b6087e6 100644
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


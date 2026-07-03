Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5638330AD0C
	for <arm-scmi@vger.kernel.org>; Fri,  3 Jul 2026 20:25:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783110343; cv=none; b=NeTfc3d9IDZ2FcYUdiFQtzMJWlRdms7QqZ/eMN2N1wD1ArMizzvy2iFZcPPImvJWjICaoKDvv2d47bmtKViFdakZf282+S35sujB/ee3bXHg5Q1VUJwKlvRmgkig962ll60CTdKnXwbGrEbMNIGkE2PqXXLMGqn0Mu2c07e9GAw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783110343; c=relaxed/simple;
	bh=7Cs5Bnt5d1sS+gt74KDxsQFMxPyVQ4mddGs1FBqOeg0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=XA92ANJIRIRX2LVstw5Ea05V1oMN6J1bZzrzNJhsuSzEtpoEHrNtBhhCysoTlycWP+zsEd5O06tYwEdKuh9lHLpXvFKEslLv9LqwfpOrAxPaNmEGq7wEV810XsSzyba/UAwwIMlkZsMetIwyHYMbFB5q7Rm/DoA7EKvqxrpDeTQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HJQMr2E1; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HJQMr2E1"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AE7F71F00A3A;
	Fri,  3 Jul 2026 20:25:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783110342;
	bh=d/7EUxOp1Rp5nNa6XSHuUC0PLSSoDYH2XwSQzLt6MQc=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=HJQMr2E1M+u9PGGay5bjx/kyp1vAgTs2MFwGi6yQM+vDYQYSPHmwDSYdbhNwFLgYw
	 ySLuB68TkxLZt/FYF3EV8pxDe8S3sLMgWmpdVWaSpJNwhCMp0Enyte80LPgIREHeSb
	 wFOeJTWyhCriAN2GhZvZUMIpj9V2KUKp8TZKKm9rt9ONayLiVveGu8juAAMs9HNJY9
	 44EeSJTdg1vDn8HMUF164uFgvg+2Nqyx6ueOdkojKZ+QDxNxiYGEjDvoaQI67iQAhk
	 A2Jb1fTEHBZrnE25qCv8ghKIkQB2XYvYqJDkfolA4YVSY4i/X8kZkkbfx+/bylwpwk
	 NuqljgsBPd2Cw==
From: Sudeep Holla <sudeep.holla@kernel.org>
Date: Fri, 03 Jul 2026 21:22:51 +0100
Subject: [PATCH v3 15/17] firmware: arm_scmi: Use channel ID for transport
 teardown
Precedence: bulk
X-Mailing-List: arm-scmi@vger.kernel.org
List-Id: <arm-scmi.vger.kernel.org>
List-Subscribe: <mailto:arm-scmi+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:arm-scmi+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260703-scmi_core_fixes-v3-15-5bae9766abfc@kernel.org>
References: <20260703-scmi_core_fixes-v3-0-5bae9766abfc@kernel.org>
In-Reply-To: <20260703-scmi_core_fixes-v3-0-5bae9766abfc@kernel.org>
To: arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc: Cristian Marussi <cristian.marussi@arm.com>
X-Mailer: b4 0.15.2

SCMI protocols can share the BASE transport channel when firmware does
not describe a dedicated channel for the protocol. In that case multiple
IDR entries can point at the same scmi_chan_info, whose owning transport
device was created with cinfo->id.

scmi_chan_destroy() used the IDR iterator key when destroying the
transport device. If an alias entry is visited before the owning channel
entry, the lookup can miss the device because the iterator key does not
match the protocol ID used when the transport device was created. The
code then clears cinfo->dev, so the later owning entry skips teardown and
leaks the transport device.

Destroy the transport device using cinfo->id, which is the protocol ID
that owns the channel and was used when creating the transport device.

Fixes: 05a2801d8b90 ("firmware: arm_scmi: Use dedicated devices to initialize channels")
Reported-by: Sashiko <sashiko-bot@kernel.org>
Signed-off-by: Sudeep Holla <sudeep.holla@kernel.org>
---
 drivers/firmware/arm_scmi/driver.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/firmware/arm_scmi/driver.c b/drivers/firmware/arm_scmi/driver.c
index df574961875c..12ebf32aa4da 100644
--- a/drivers/firmware/arm_scmi/driver.c
+++ b/drivers/firmware/arm_scmi/driver.c
@@ -2896,7 +2896,7 @@ static int scmi_chan_destroy(int id, void *p, void *data)
 		struct scmi_info *info = handle_to_scmi_info(cinfo->handle);
 		struct scmi_device *sdev = to_scmi_dev(cinfo->dev);
 
-		scmi_device_destroy(info->dev, id, sdev->name);
+		scmi_device_destroy(info->dev, cinfo->id, sdev->name);
 		cinfo->dev = NULL;
 	}
 

-- 
2.43.0


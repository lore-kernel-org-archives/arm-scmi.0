Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B10021D63FF
	for <arm-scmi@vger.kernel.org>; Wed, 12 Mar 2025 11:40:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741779646; cv=none; b=IxmtUkztn2D04A6qGz45SU37mi54qjTwq7WiXHXaltMDJM5pxV1Yrndl8bTO6OZV2crudHviXbhJVrV+d9z3KRK6bGncaWxzxmEE3z9CqjpRW60tU5Lnhmrvnmm6XZ31Mvd5jFkbFltEHCoBOZjzQKDayrRF2d1sFa1A3nbhIjQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741779646; c=relaxed/simple;
	bh=VUNxvcijs9An1927oTqaVDUsqXThCsE8zDBbKNgPFgM=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=Ilrmie2QG9tMISv/uvHiCx2WOJitGybRUv25Xj80QwbqWab5cmxLyePGREdqOZh7HGeHutroMqdaqwOogFExhU8CYRYdqDoe1cxd4MFgRtIss5kIuz1CzkgKub8RkuDOjNgJstSKURTllWIyeIuBnTkuwnxkkskTiay+xJlyH+E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D05D6152B;
	Wed, 12 Mar 2025 04:40:53 -0700 (PDT)
Received: from e133711.arm.com (e133711.arm.com [10.1.196.55])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 5C24F3F694;
	Wed, 12 Mar 2025 04:40:42 -0700 (PDT)
From: Sudeep Holla <sudeep.holla@arm.com>
Subject: [PATCH 0/3] firmware: arm_scmi: Minor cleanups in the scmi bus
 layer
Date: Wed, 12 Mar 2025 11:40:23 +0000
Message-Id: <20250312-b4-scmi_minor_cleanup-v1-0-c62c6cb4111a@arm.com>
Precedence: bulk
X-Mailing-List: arm-scmi@vger.kernel.org
List-Id: <arm-scmi.vger.kernel.org>
List-Subscribe: <mailto:arm-scmi+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:arm-scmi+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAKhy0WcC/w3HwQqAIAwA0F+JnRN0KUg/I7VWDXKFUhfp3+vdX
 oPKRbjC2DUo/EiVU/+4vgPaJ93YyPIf0GKwg0Mze1MpS8qiZ0l08KT3ZeIaA2Jc/BAI3vcD8t8
 TpFcAAAA=
X-Change-ID: 20250312-b4-scmi_minor_cleanup-8f85228d435c
To: arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc: Sudeep Holla <sudeep.holla@arm.com>, 
 Cristian Marussi <cristian.marussi@arm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1011; i=sudeep.holla@arm.com;
 h=from:subject:message-id; bh=VUNxvcijs9An1927oTqaVDUsqXThCsE8zDBbKNgPFgM=;
 b=owEBbQKS/ZANAwAIAQBBurwxfuKYAcsmYgBn0XK5c2BTNGTOLzPFitGsESmr3eas1w0PoAFTS
 P2CaUUEA5qJAjMEAAEIAB0WIQS6ceUSBvMeskPdk+EAQbq8MX7imAUCZ9FyuQAKCRAAQbq8MX7i
 mPirEADMhHNWzclWqfmuECTJMpazKJaamjNSYgWYtIuDM+D5yLkZo1rWPPon5pNfEVB2jRI+3lP
 eQmmwPe0kOPXKZpOpzLDXvrNU4gwO9TOUhWWCSuPC8sU2qU3IVZ2OKi7zfJSciItezoEjY9PdSb
 p0IRf/wNNJPfBz5EF+7Lkdkw41nokJmsd2DUDZnKE3UyEhqNu/dg7xRRHtvh02yJnG1Bi+q3r+F
 zLzGlJfNuvHgpXPq/NAvTQzdYmQKXmR6MhN6Gm8u1TWIXkFCFlHlVObb/b5DA65jFZxdPGeVpJa
 cm8awJXBQYZEVN61Jrf6PhZSfx5svTbuTkhN/igaD6r47GQ1x+ebMIO66fOU1J8Vc9aE27zgR5o
 MbSRs0m42FHjVAfrUqSqVX66t+9/3mjd2B3hNsvVjbEjOhhplZJTJeNnSBgj3Ze0QwdIBD02Y2B
 SQHIQKDGyFh5zh6/xUoec1mBGNn0pm/1rqPQPNI6fyHwZlt/x1htFmRn6ZzqDvyPEaZwynUi9TI
 Yv5BsUNxKXbYxBqef6niiB95rCuXCFHSTMOj2RoI1E8imjPMXxxrZcWg3eoxo++21qXmeIvEXsL
 fp+G/HKpf2yjEjXmiA231T3dzx/bLK0OeNfIbEilkSokI+LkNSOy1RL5L+stN18O5o/kFO8Ikf6
 IvSKZEa/DPV3DwA==
X-Developer-Key: i=sudeep.holla@arm.com; a=openpgp;
 fpr=7360A21742ADF5A11767C1C139CFD4755FE2D5B4

These cleanup centralizes error logging for SCMI device creation into a
single helper function, _scmi_device_create(), consolidates the device
matching logic into a single function, and ensures that devices must
have a name for registration, removing support for unnamed devices while
matching the devices and drivers for probing.

Signed-off-by: Sudeep Holla <sudeep.holla@arm.com>
---
Sudeep Holla (3):
      firmware: arm_scmi: Ensure scmi_devices are always matched by name as well
      firmware: arm_scmi: Refactor device matching logic to eliminate duplication
      firmware: arm_scmi: Refactor error logging from SCMI device creation to single helper

 drivers/firmware/arm_scmi/bus.c    | 75 ++++++++++++++++++++------------------
 drivers/firmware/arm_scmi/driver.c |  8 +---
 2 files changed, 40 insertions(+), 43 deletions(-)
---
base-commit: 80e54e84911a923c40d7bee33a34c1b4be148d7a
change-id: 20250312-b4-scmi_minor_cleanup-8f85228d435c

Best regards,
-- 
Regards,
Sudeep


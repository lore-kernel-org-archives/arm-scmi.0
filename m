Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A726821C175
	for <arm-scmi@vger.kernel.org>; Mon, 17 Mar 2025 10:31:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742207515; cv=none; b=KCSaRbIsFIxQcVUPTIIsvBsP1BEzOQC1Ixs4zHJWqdtiMKA4F8lquOr4F7eJsSu1NaaPAP4NT/Jq3qShyfs99i16hXuqXRRScUKmI3V8HrXRbbLd2ermab0z7BI1j0+cWhuvYXFauNeKBAm8svu+6BFVQftzG5dO9+kjnUvJE1I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742207515; c=relaxed/simple;
	bh=IUn41wpwB6Ut021pQ0AAYrXTN0TJ/XChzgyacyEtQ34=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=RAlkhkCGUJsoWpstv5rJIrqSV6+sbL6+UxSzlkwDUXwuwRB7jnNgA5q2SvVM6JHjcE8Q1crDXTc0GheNk+6l4moelrTeJ+tnmclnvZ/6mV+wkCaDX6PVpXAAWBg/oANI4O+Qq90sG+Ohqq/MB/1qbMtgvM5YFn5Y5wRxexAxfDE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id CD36C13D5;
	Mon, 17 Mar 2025 03:32:01 -0700 (PDT)
Received: from e133711.arm.com (e133711.arm.com [10.1.196.55])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 2E7813F673;
	Mon, 17 Mar 2025 03:31:52 -0700 (PDT)
From: Sudeep Holla <sudeep.holla@arm.com>
Subject: [PATCH v2 0/5] firmware: arm_scmi: Minor cleanups in the scmi bus
 layer
Date: Mon, 17 Mar 2025 10:31:20 +0000
Message-Id: <20250317-b4-scmi_minor_cleanup-v2-0-f4be99bd9864@arm.com>
Precedence: bulk
X-Mailing-List: arm-scmi@vger.kernel.org
List-Id: <arm-scmi.vger.kernel.org>
List-Subscribe: <mailto:arm-scmi+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:arm-scmi+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAPn512cC/4WMQQrCMBAAv1L2bCTZJiV48h8iJd1Gu2ASSTQgJ
 X83+AFPwxxmdig+sy9wGnbIvnLhFLvgYQDaXLx7wWt3QIlGjgrFokWhwHPgmPJMD+/i+ynszRp
 Eu+rREPR24/JK+fPbVtVx+XeoSkhBE9JEi1ZKubPL4UgpwLW19gWkmlv0qAAAAA==
X-Change-ID: 20250312-b4-scmi_minor_cleanup-8f85228d435c
To: arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc: Sudeep Holla <sudeep.holla@arm.com>, 
 Cristian Marussi <cristian.marussi@arm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1616; i=sudeep.holla@arm.com;
 h=from:subject:message-id; bh=IUn41wpwB6Ut021pQ0AAYrXTN0TJ/XChzgyacyEtQ34=;
 b=owEBbQKS/ZANAwAIAQBBurwxfuKYAcsmYgBn1/oXaDGN0xKyCAakLAoBoWCVwZiExl6isfuWO
 OQjILk4GcKJAjMEAAEIAB0WIQS6ceUSBvMeskPdk+EAQbq8MX7imAUCZ9f6FwAKCRAAQbq8MX7i
 mClYEACvKqWTyVSt/b39v3moa7E010DqEePFSkO7uiDpd8PlKxTx6DglEENRaXtVBTVawTmx2ZA
 6bNaDfrnSyS1rplH/OPPkamMsGpKb5E8UkpcSkdTRnbXp+YhTJWEX5VJRw+IaGmpaaPI0Ax3F3J
 22ri1p1SIVCp9qPNhx+hdFBmbBVm2aEnGWioJaZqe1q39Mvev6hmWkkWkBBq0UQdHfcFCGsR/Y4
 iIai5nu9EduHuXLLtGiWOHFjqm3RU6fVdZy0GrP3xcrbcz8Dcn/0QwuUJ3ZSc6vWmu7xPXyWoL3
 YBR3xUtDZPrbgHLAmzkA2qPfnYvWhpa88WLbKQ9b+DOrbRQUSD5JXfM+MLK2eJz2zi9jAkEdO2v
 Pmg6ggORd5l9rTJgrsS6ST5M0nqOPGJnaIY6d/YrOnQMbV/aDY2C7cXd+Y6YkwTIeYDIm41QZj6
 K0jP+zxz6eRKlV+jY/oj2AGmJb16ockfUUFIxS3u+mZpUpkdyYBSaO5ugs12rDVW9/qTgqVWrVJ
 LrIlRZiaHYT8eTSn4ztoWwxy+paAJtNdJhozKkB26As5WXcE0bs3ixSkRh2EfCidaYwAGvrCNVH
 8UKFOfFDFiuDKx17KSDp/ki5S/HtO2xuJsoG1qaxZAGvhpbRG+oqr2SZEyyR5XLHr0g336eY793
 i8QxJFCuGMVz7tg==
X-Developer-Key: i=sudeep.holla@arm.com; a=openpgp;
 fpr=7360A21742ADF5A11767C1C139CFD4755FE2D5B4

These cleanup centralizes error logging for SCMI device creation into a
single helper function, _scmi_device_create(), consolidates the device
matching logic into a single function, and ensures that devices must
have a name for registration, removing support for unnamed devices while
matching the devices and drivers for probing. It ensures the transport
devices are excluded from the bus matching and the correct assignment
of parent device for the arm-scmi platform device created in the
transport drivers.

Signed-off-by: Sudeep Holla <sudeep.holla@arm.com>
---
Changes in v2:
- Added exclusion of transport devices from bus matching
- Added correct assignment of parent to arm-scmi platform device
- Link to v1: https://lore.kernel.org/r/20250312-b4-scmi_minor_cleanup-v1-0-c62c6cb4111a@arm.com

---
Sudeep Holla (5):
      firmware: arm_scmi: Ensure scmi_devices are always matched by name as well
      firmware: arm_scmi: Refactor device matching logic to eliminate duplication
      firmware: arm_scmi: Refactor error logging from SCMI device creation to single helper
      firmware: arm_scmi: Assign correct parent to arm-scmi platform device
      firmware: arm_scmi: Exclude transport devices from bus matching

 drivers/firmware/arm_scmi/bus.c    | 79 ++++++++++++++++++++------------------
 drivers/firmware/arm_scmi/common.h |  1 +
 drivers/firmware/arm_scmi/driver.c | 13 ++-----
 3 files changed, 46 insertions(+), 47 deletions(-)
---
base-commit: 80e54e84911a923c40d7bee33a34c1b4be148d7a
change-id: 20250312-b4-scmi_minor_cleanup-8f85228d435c
-- 
Regards,
Sudeep


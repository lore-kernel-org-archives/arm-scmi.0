Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 33E1439B4BF;
	Wed, 14 Jan 2026 11:48:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768391305; cv=none; b=GTQgdbbrB9V/q9HrDayYtHoxgczm06/5lOstcIkVxmI4A3lLaNzd32MJzkuO0CmE1SyIMa0uvdp8/tYGhtiUbjB5bS1EXGz8fjXs+6Jxjx7qcgoAmcFE5rOcSav1FGAnJRyyNcJ67Q7yTznrjkZ0E/fa9DmJwRBcx/3zGeggieI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768391305; c=relaxed/simple;
	bh=v0gSagoTXdNujHLEdHah6G5k++0JX3XNCNkmRI+Jlxo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=UfDsw6bw6/2sqnx9y97LzfiI4ZXs4jLFkhj5N7BBE6p3FqOQOG7dae547cjEv1L4uheUZRK/p2i3JbQoQtyv4pSA2pfjsjCkQKmrkru13EQflBQ9gPAOTIMN1cOMoxpGexpq7g2m0Lpjb25GMAY6GnKdasLEoqPamF4k0FzmMUc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 0E603497;
	Wed, 14 Jan 2026 03:48:16 -0800 (PST)
Received: from pluto.fritz.box (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 440073F59E;
	Wed, 14 Jan 2026 03:48:19 -0800 (PST)
From: Cristian Marussi <cristian.marussi@arm.com>
To: linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	arm-scmi@vger.kernel.org,
	linux-fsdevel@vger.kernel.org
Cc: sudeep.holla@arm.com,
	james.quinlan@broadcom.com,
	f.fainelli@gmail.com,
	vincent.guittot@linaro.org,
	etienne.carriere@st.com,
	peng.fan@oss.nxp.com,
	michal.simek@amd.com,
	dan.carpenter@linaro.org,
	d-gole@ti.com,
	jonathan.cameron@huawei.com,
	elif.topuz@arm.com,
	lukasz.luba@arm.com,
	philip.radford@arm.com,
	souvik.chakravarty@arm.com,
	Cristian Marussi <cristian.marussi@arm.com>
Subject: [PATCH v2 16/17] fs/stlmfs: Document lazy mode and related mount option
Date: Wed, 14 Jan 2026 11:46:20 +0000
Message-ID: <20260114114638.2290765-17-cristian.marussi@arm.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260114114638.2290765-1-cristian.marussi@arm.com>
References: <20260114114638.2290765-1-cristian.marussi@arm.com>
Precedence: bulk
X-Mailing-List: arm-scmi@vger.kernel.org
List-Id: <arm-scmi.vger.kernel.org>
List-Subscribe: <mailto:arm-scmi+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:arm-scmi+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Document optional lazy enumeration behaviour and related mount option.

Signed-off-by: Cristian Marussi <cristian.marussi@arm.com>
---
 Documentation/filesystems/stlmfs.rst | 21 +++++++++++++++++++--
 1 file changed, 19 insertions(+), 2 deletions(-)

diff --git a/Documentation/filesystems/stlmfs.rst b/Documentation/filesystems/stlmfs.rst
index cc9585f77ba5..79633cdc71b8 100644
--- a/Documentation/filesystems/stlmfs.rst
+++ b/Documentation/filesystems/stlmfs.rst
@@ -73,8 +73,12 @@ Design
 STLMFS is a pseudo filesystem used to expose ARM SCMI Telemetry data
 discovered dynamically at run-time via SCMI.
 
-Inodes are all dynamically created at mount-time from a dedicated
-kmem_cache based on the gathered available SCMI Telemetry information.
+Normally all of the top level file/inodes are dynamically created at
+mount-time from a dedicated kmem_cache based on the gathered available
+SCMI Telemetry information, but it is possible to enable a lazy enumeration
+and FS population mode that delays SCMI Telemetry resources enumerations
+and related FS population till the moment a user steps into the related FS
+subdirectories: *des/* *groups/* and *components/*.
 
 Since inodes represent the discovered Telemetry entities, which in turn are
 statically defined at the platform level and immutable throughout the same
@@ -104,6 +108,19 @@ The filesystem can be typically mounted with::
 
 	mount -t stlmfs none /sys/fs/arm_telemetry
 
+It is possible to mount it in lazy-mode by using the *lazy* mount option::
+
+	mount -t stlmfs -o lazy none /sys/fs/arm_telemetry
+
+In this latter case, the des/ groups/ and components/ directory will be
+created empty at mount-time and only filled later when 'walked in'.
+
+This allows a user to benefit from a lazy enumeration scheme of the SCMI
+Telemetry resources by delaying such, usually expensive, message exchanges
+to the last possible moment: ideally, even never, if using some of the
+other alternative binary interfaces that does not need any resource
+enumeration at all.
+
 It will proceed to create a top subdirectory for each of the discovered
 SCMI Telemetry instances named as 'tlm_<N>' under which it will create
 the following directory structure::
-- 
2.52.0


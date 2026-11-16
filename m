Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794832339;
	b=d736yDEqtj4iVNw0ihYiRa+7LpM08P4O1ccH+3yGTioNz+DBK8Fxs7uYRRD2wcSW+RH9
	 85wNun/Pl0B65zJhzfhktoAsHUoK4BDcGTirpq0ZN6OkrkoRg/Zh/eqKuH2eEdaNopnuy
	 ajdiDViVzLuYR47y9V71KnEGN4K/sQi4vFOwsKyTYVWLP5WzM273tYz3Ac+vYmZZNiHzm
	 5OBVwhzy36wtFqh44EZz7vfdwNh9AnXoGenswIiWBxr3yDb+WtWRNRL3Gljq9yMKblNEY
	 eE5wp1qlVCRljmdajP9c3dwiKxXcSXOa/6X3BMhtyCAaF8yS4BicjmZGk/182l6SufQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794832339;
	h=DMARC-Filter:Received:Received:DKIM-Signature:From:To:Cc:Subject:
	 Date:Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=mgbfeuq/xgidEkDD5o0IBk/6YCU6OhVBNmaVODqbeKc=;
	b=kfayW1xoypWgKQkjS8sTLVk1hFF7ARamj4/i+7q3DHdda8dnXT7ou8nL5lvy5q0uCFdP
	 3asDR5LlJDl5plfTK0n9no8RGulrwj0lhytGRozT4VVHim6u3+ebHYNvfR345dkwkc9RW
	 dbLfmcmuYFFt8BvFK9GLB7H/bjTh7E0BTZt79bZuBL0pI80X9SRNHVAKKrYp3rC4ka+MX
	 l1rbtjSQoea9BNdxhsofiS4B1CAhg95iG2zo3tRpb4fnrrIYZ830Efqv7VBruve0VV91M
	 e7gfbODiROgwa4TWwmrB28x8SmbTvt1p2y7RrGepOGQpNAiEzxMcl9NXQnHCG2xpWpw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=arm.com;
	spf=pass smtp.mailfrom=arm.com;
	dkim=pass header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=Op4H5TOV;
	arc=none smtp.remote-ip=217.140.110.172
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DBB3B606A330;
	Mon, 16 Nov 2026 12:32:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DBB3B606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=Op4H5TOV
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 89EF61A25;
	Mon, 16 Nov 2026 04:32:15 -0800 (PST)
Received: from e121740.manchester.arm.com (e121740.arm.com [10.33.8.69])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 9226C3F632;
	Mon, 16 Nov 2026 04:32:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1794832338; bh=41qx1n/Bz2MPufwYho2JV7zrCW9+nk5uF24gI+UcA9E=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Op4H5TOVJzUKY5+u4AQ+7Ks2uPMWoB3GcYlfQRuFnkUDrCgzZi8Tn7EafMIuZf9cG
	 odmMAprqTlc9dgiVKbLGIsY2NKatT8h4OcmwpVn4K3uTMOKTw8XD9Hr7bSFY/5gWv7
	 VirHqLb0eCHPRFC7vmXTgWbbty/49Q8DEsAHlERo=
From: Philip Radford <philip.radford@arm.com>
To: linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	arm-scmi@vger.kernel.org
Cc: sudeep.holla@arm.com,
	cristian.marussi@arm.com,
	philip.radford@arm.com,
	Sashiko <sashiko-bot@kernel.org>
Subject: [PATCH 1/2] firmware: arm_scmi: uninitialized reg_io_width in shmem_setup_iomap()
Date: Mon, 16 Nov 2026 12:31:52 +0000
Message-Id: <20261116123153.2672631-2-philip.radford@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261116123153.2672631-1-philip.radford@arm.com>
References: <20261116123153.2672631-1-philip.radford@arm.com>
X-Mailing-List: arm-scmi@vger.kernel.org
List-Id: <arm-scmi.vger.kernel.org>
List-Post: <mailto:arm-scmi@vger.kernel.org>
List-Help: <mailto:arm-scmi+help@vger.kernel.org>
List-Subscribe: <mailto:arm-scmi+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:arm-scmi+unsubscribe@vger.kernel.org>
List-Owner: <mailto:arm-scmi+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Replace switch by setting scmi_shmem_io_ops to use default and only
changing if reg-io-width read suceeds and has a width of 4.

Fixes: 2cd7f3db25fe ("firmware: arm_scmi: Support 'reg-io-width' property for shared memory")
Reported-by: Sashiko <sashiko-bot@kernel.org>
Closes: https://sashiko.dev/bug/linux-dd042f6f-0b76-40b8-9435-cbc53370cd08
Signed-off-by: Philip Radford <philip.radford@arm.com>
---
 drivers/firmware/arm_scmi/shmem.c | 11 +++--------
 1 file changed, 3 insertions(+), 8 deletions(-)

diff --git a/drivers/firmware/arm_scmi/shmem.c b/drivers/firmware/arm_scmi/shmem.c
index dadb37557f8a..8a4557a1e5c2 100644
--- a/drivers/firmware/arm_scmi/shmem.c
+++ b/drivers/firmware/arm_scmi/shmem.c
@@ -234,16 +234,11 @@ static void __iomem *shmem_setup_iomap(struct scmi_chan_info *cinfo,
 		dev_err(dev, "failed to ioremap SCMI %s shared memory\n", desc);
 		return IOMEM_ERR_PTR(-EADDRNOTAVAIL);
 	}
+	*ops = &shmem_io_ops_default;
 
-	of_property_read_u32(shmem, "reg-io-width", &reg_io_width);
-	switch (reg_io_width) {
-	case 4:
+	if (!of_property_read_u32(shmem, "reg-io-width", &reg_io_width) &&
+	    reg_io_width == 4)
 		*ops = &shmem_io_ops32;
-		break;
-	default:
-		*ops = &shmem_io_ops_default;
-		break;
-	}
 
 	return addr;
 }
-- 
2.34.1


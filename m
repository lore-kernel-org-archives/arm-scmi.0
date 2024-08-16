Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 404D41BD4E4
	for <arm-scmi@vger.kernel.org>; Fri, 16 Aug 2024 15:14:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723821253; cv=none; b=ec00x/dj5LbW4Ag0pJsPFr6SALD1RQRt4h/9ndOz2ZfLNLgiC4Bn2vC0Fy25dAfRyoWivot0PFx4AalJ5TGxHjY4ZSEetNOBy1svz4GZF6gk2N8+YoTqgLUBZdK8PSlTMP4AxmYN2AJi//0WnG1Xl9DUh41jVYDRui8jNrFS2KU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723821253; c=relaxed/simple;
	bh=MKKPiciZc0EYGi4JZ+9QBcLZh5/E8ocqiK1GNgucmQE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=gR3h9cKdaR+kXU7ozsMkpMSx0MMj8F9/TUJ0uqiVXbmH/jadq5epXkIjW+BVJT+65O5qdWPYCu8Fyhz/BbpXmdlN/mgrdABsT/QHuUXxESoaLB1xRsSikEnhk7e0HMmqWIzRfBEKxplazx0onOcduRuJfUOMbZfsgfCQI0/hJOQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=oV+JTADd; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="oV+JTADd"
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-371936541caso644107f8f.0
        for <arm-scmi@vger.kernel.org>; Fri, 16 Aug 2024 08:14:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1723821250; x=1724426050; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=fKhgYZGd6MhEpwJKETkIMp2KfUsUFptLQmP8VXkZ9Mw=;
        b=oV+JTADdJfZ8JgeJQsYrYUavhXiMJaq5mPSnz4nLHC8JYEJiiApKgPSg1fRWCnhZAv
         Hfoh9szASXHsGwVwX/clam270fbLbUma4QYC1Rfg1mgbeGDgVYfUhtBYxSlCbwY81BVV
         mc+6w/oD8NTdO8bcW1To/qYCG3Cbfzk//Cc5zfBm1/a0Imz7Fdj6CMmMtYn/IVwQpviY
         QcKTZ96x1oll2ONG65HBkbC9NTmK5ZF9YAVesVfQB+s2fBmH46moqrLhnC7/KRx5SxRX
         4F60zjijWnurO55mA3i8q6DbKDYj7Jk/nZPuHvnLDXR1xsV0jzQffCir/4jCY0xRRgoE
         3SKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723821250; x=1724426050;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fKhgYZGd6MhEpwJKETkIMp2KfUsUFptLQmP8VXkZ9Mw=;
        b=BJPbn88m+0mwGfHJjnXwGkDupQlfs3ReWIRg4+pMtFx9UxtF2lYmTNG4AQQ82RjIoq
         fVqxqonm78kDxTCB1nxyglRJC9eQ0CxlRZc7nPUKkD6NA5zh9asgV+PTSaH0/tpKkYkQ
         63Be5xZH5Gj3WUzyPbGLPE3Ln6hAf2jafDycGuHp6B9qxsf5owgfdgy3wugptiGXR6Mp
         ruzyMPcbfwPU3b3aMWU3xJ2taZGWu9DCUvjQQzZPO/iXlhQZnM0jKXno7fp7QMZORP3Q
         0OAeXiIuDgjIQknZhfRWlVPwCkv2iZVja3asE34MZvaDcNfZFknbP7aMYMWtrZXY2bnv
         lZ3Q==
X-Forwarded-Encrypted: i=1; AJvYcCWRUf8/WdUnTBllhCDSskNezjqFzm6jHRSoD+WGFIwKNLrQ/RVgiDjajglvcjWhGCC1Vz7H0z1pFiSafRpzE8aF0bRdrAlB/64=
X-Gm-Message-State: AOJu0YyXi6dYKElsqNMO4JbCtB/PlvdrO5m1X7n7x3J0YV8w9qa0K3jY
	o20TaPdTR7ugdJjnzLW3EYxrX+4Ko+oQEMmnrfj8yYo8J9tXTitWna/fsw+TFZs=
X-Google-Smtp-Source: AGHT+IHtuQXvmrhkkFiEnHekC/5NQfc0+553ULsBowWpY0clJhHJiTSDhMUI0CtNFYI+isWQOpUYYQ==
X-Received: by 2002:adf:f7c5:0:b0:367:8876:68e6 with SMTP id ffacd0b85a97d-371946a5175mr2178345f8f.48.1723821250458;
        Fri, 16 Aug 2024 08:14:10 -0700 (PDT)
Received: from krzk-bin.. ([178.197.215.209])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-371898ac2d1sm3854184f8f.109.2024.08.16.08.14.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Aug 2024 08:14:09 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Sudeep Holla <sudeep.holla@arm.com>,
	Cristian Marussi <cristian.marussi@arm.com>,
	arm-scmi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH] firmware: arm_scmi: Simplify with scoped for each OF child loop
Date: Fri, 16 Aug 2024 17:14:07 +0200
Message-ID: <20240816151407.155034-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: arm-scmi@vger.kernel.org
List-Id: <arm-scmi.vger.kernel.org>
List-Subscribe: <mailto:arm-scmi+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:arm-scmi+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Use scoped for_each_child_of_node_scoped() when iterating over device
nodes to make code a bit simpler.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/firmware/arm_scmi/driver.c | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/drivers/firmware/arm_scmi/driver.c b/drivers/firmware/arm_scmi/driver.c
index 33676b6ece95..2b9c38f55989 100644
--- a/drivers/firmware/arm_scmi/driver.c
+++ b/drivers/firmware/arm_scmi/driver.c
@@ -2726,14 +2726,14 @@ scmi_txrx_setup(struct scmi_info *info, struct device_node *of_node,
 static int scmi_channels_setup(struct scmi_info *info)
 {
 	int ret;
-	struct device_node *child, *top_np = info->dev->of_node;
+	struct device_node *top_np = info->dev->of_node;
 
 	/* Initialize a common generic channel at first */
 	ret = scmi_txrx_setup(info, top_np, SCMI_PROTOCOL_BASE);
 	if (ret)
 		return ret;
 
-	for_each_available_child_of_node(top_np, child) {
+	for_each_available_child_of_node_scoped(top_np, child) {
 		u32 prot_id;
 
 		if (of_property_read_u32(child, "reg", &prot_id))
@@ -2744,10 +2744,8 @@ static int scmi_channels_setup(struct scmi_info *info)
 				"Out of range protocol %d\n", prot_id);
 
 		ret = scmi_txrx_setup(info, child, prot_id);
-		if (ret) {
-			of_node_put(child);
+		if (ret)
 			return ret;
-		}
 	}
 
 	return 0;
-- 
2.43.0


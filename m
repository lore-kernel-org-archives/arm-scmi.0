Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 021E22BE7BE
	for <arm-scmi@vger.kernel.org>; Wed,  5 Nov 2025 14:08:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762351684; cv=none; b=QiRbDOUEK2XSqWzEaMs4oWB/aatu5z5p2ANAWEc8W+0dL1yc5BQe1QoJ87Vzlg+MYPKjjH1mbA+3EXTX3j0Qw5c16NAMHobSBKtSeM7JcZBUTE5UJz3pifzjisNs0+oYm7Ehl1hOaGeSEyxrvNTT1oogozlpLfmVYO4dFGlyVNU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762351684; c=relaxed/simple;
	bh=D1e3PqsDgSVg01Y56yPEgBksv7OMvfjXdZ87PsO9sg8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=doSv2kDnytIy1MFRlOW5Bqh8liHYcqzF9CoFjSkE+ijE6vM1D/qi6LSdI8fckqJ8GmBbwjVbXTBstmpE/CkKqeDyHjMvHCOVZisHiwbuEZhH5y2HNsY8liQ+hTHiNmpXEldVduIvJAg7Sj4PcBh/OQU/YzzPgPm/mQv6CedmRXs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=exJ196Dv; arc=none smtp.client-ip=209.85.216.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="exJ196Dv"
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-3402942e79cso9225916a91.2
        for <arm-scmi@vger.kernel.org>; Wed, 05 Nov 2025 06:08:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762351682; x=1762956482; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=e9k6YZPdseL2nMqrpcpE66trirUONOvdRAtp5r/05CA=;
        b=exJ196DvqhSwCvti0ZKN8EWMFmXfW4SNa8+XBRjzamlRwHzgbyRwKFv5sp6rNL76SQ
         PjIFH3M3gtt7ONsH46+fL3FNONRXaeyy7kj7lyv5nHkDNZaElt4Vh75GA5Xul3GZkatB
         3aHDgcWfgsdKT1c6BdSpJJ34JvUWBXg7DWxyeOCi1LHE/aSp7y3HdbqLgZXsLcYrvIu/
         hc+IvSRAW2/fwDg29fSnl+/uK5toNe9jt/+Iu6iaInMwX5VnDZijryUhLUWXUVxXgfxF
         0IGxPvMTaOiea6s5EQN0u/VVAI+iZr6rIbeGhnnb4eH1QK2DIotnEUlg/8CUQ8u+cGVo
         1BFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762351682; x=1762956482;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=e9k6YZPdseL2nMqrpcpE66trirUONOvdRAtp5r/05CA=;
        b=u+IPvVxek8QM/vyoVi7wE2crcb+jEsWBq8P8eODeTLTg+3MHmJn439xkpuvD512s1D
         o7J/mVmf5w+d2qsBSz/9FLBoPuAPGE1VFQOwAOzh01VMSsrEdLlZ/wCOBY89mNqIDb8B
         /5PO5qVCxyMGm1YJ2SC61CGgv6RsyLy2kLlUUdOYW942BVKfN4LXNYqv+KMWvoLzNf03
         iQmZFDqusxOrmgjcmAXyDGeWb6IvAfLQADJSrQes1GJFhVVaz5sYjIbxglpi1eVxicfP
         f+mowR8vQOh5RLFHqV04pIOS1zs720YuzoqQNxDn3lVr1C780jl6jMATVsun75+jJbYS
         Kfjg==
X-Gm-Message-State: AOJu0YxvYkyslU9KV6UVZogV+kNdjug/T2tRG6g7KFUHCeFoPwHRSQxt
	5S41DoIEihYRfE3FYOM1rK8hZjUcV7GNC1OaYDR3ognLxXZoNmtCqUfQTPTC9qNz
X-Gm-Gg: ASbGnctHhYFhLX5/3rO8OgG6N8KNLlPOnlXw3xRAC10Dkubh6slrfqmscGuVUtapor7
	bjGc3wIazoeEBBk2uEvEJen3BeNYpFYbYdO42Z5leZYDqIdfDe1Z3ETHrwUAimmsuXWagSgZohz
	5Re4sRi75j9Ded73rmOqKIWG1on5Ip12rBzPKjfZddE2a5EWfW8zhMVBvkxMMzp04C2S/xAjJKI
	lf09HaAA0TWcHOcLrkW1bMIjREtT/VyRdyTmqrQp2NQgzc8Rth7b1X8a9Ml4HhN5as/J9+knUTA
	3b78gYpCTTVxulViAdVAEI7tskQ7IXYzP5brG8PTNXX5Q7Db5itSFX/ocQXnz8HTeeKxstRlIqr
	g+GzgnDkLF5yWETzbngF9/hcsj1b8zHBPUH+n6i0h/QaNNZMOpHdKcea53fB1+z87JBzMHdcglx
	SO2czst6by2Q==
X-Google-Smtp-Source: AGHT+IGLooWGceuU3Xy6pREqs4jHf5ahAGLwUS3xj0A3y7lHHK9M4p0Qnju+mGSRH4RzUh8au2cYpA==
X-Received: by 2002:a17:90b:2751:b0:340:dd2c:a3f5 with SMTP id 98e67ed59e1d1-341a6c006bemr3407374a91.3.1762351682042;
        Wed, 05 Nov 2025 06:08:02 -0800 (PST)
Received: from aheev.home ([2401:4900:88f4:f6c4:1d39:8dd:58db:2cee])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-341a68bf37bsm3090217a91.7.2025.11.05.06.07.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Nov 2025 06:08:01 -0800 (PST)
From: Ally Heev <allyheev@gmail.com>
Date: Wed, 05 Nov 2025 19:37:52 +0530
Subject: [PATCH] arm: fix uninitialized pointers with free attr
Precedence: bulk
X-Mailing-List: arm-scmi@vger.kernel.org
List-Id: <arm-scmi.vger.kernel.org>
List-Subscribe: <mailto:arm-scmi+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:arm-scmi+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251105-aheev-uninitialized-free-attr-arm-v1-1-f7b6cb5d3361@gmail.com>
X-B4-Tracking: v=1; b=H4sIADdaC2kC/x3NQQrCQAxG4auUrA00lSnFq4iL2P5jA+0ombGIp
 Xd3cPlt3tspww2ZLs1Ojs2yPVOFnBoaZ00PsE3V1LVdEGkD6wxs/E6WrJgu9sXE0QHWUpzVVx7
 jOUh/V1EZqHZejmif/+N6O44f/b3z4XMAAAA=
X-Change-ID: 20251105-aheev-uninitialized-free-attr-arm-cf3516ba1a18
To: Sudeep Holla <sudeep.holla@arm.com>, 
 Cristian Marussi <cristian.marussi@arm.com>
Cc: arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Dan Carpenter <dan.carpenter@linaro.org>, 
 Ally Heev <allyheev@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1778; i=allyheev@gmail.com;
 h=from:subject:message-id; bh=D1e3PqsDgSVg01Y56yPEgBksv7OMvfjXdZ87PsO9sg8=;
 b=owGbwMvMwCU2zXbRFfvr1TKMp9WSGDK5o+xMm3Z0aui/S9/z7Ir3feess6XdV76fPH47JeTKk
 Wb9rT1FHaUsDGJcDLJiiiyMolJ+epukJsQdTvoGM4eVCWQIAxenAEzkeT8jwypbxilsfDmrTTov
 mQvry+3dZ9U8W08wLrL/EcOBaRvvVTEyNPfc3PBtS/uyvu1tH1Q8ZI4fOvtfYKrlwb7uO4U7dqu
 /ZwIA
X-Developer-Key: i=allyheev@gmail.com; a=openpgp;
 fpr=01151A4E2EB21A905EC362F6963DA2D43FD77B1C

Uninitialized pointers with `__free` attribute can cause undefined
behaviour as the memory assigned(randomly) to the pointer is freed
automatically when the pointer goes out of scope

arm doesn't have any bugs related to this as of now, but
it is better to initialize and assign pointers with `__free` attr
in one statement to ensure proper scope-based cleanup

Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
Closes: https://lore.kernel.org/all/aPiG_F5EBQUjZqsl@stanley.mountain/
Signed-off-by: Ally Heev <allyheev@gmail.com>
---
 drivers/firmware/arm_scmi/shmem.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/firmware/arm_scmi/shmem.c b/drivers/firmware/arm_scmi/shmem.c
index 11c347bff766763c61100f884432c2e4669e5918..dadb37557f8aee25465e1a423dfcb4a889852434 100644
--- a/drivers/firmware/arm_scmi/shmem.c
+++ b/drivers/firmware/arm_scmi/shmem.c
@@ -196,7 +196,6 @@ static void __iomem *shmem_setup_iomap(struct scmi_chan_info *cinfo,
 				       struct resource *res,
 				       struct scmi_shmem_io_ops **ops)
 {
-	struct device_node *shmem __free(device_node);
 	const char *desc = tx ? "Tx" : "Rx";
 	int ret, idx = tx ? 0 : 1;
 	struct device *cdev = cinfo->dev;
@@ -205,7 +204,9 @@ static void __iomem *shmem_setup_iomap(struct scmi_chan_info *cinfo,
 	void __iomem *addr;
 	u32 reg_io_width;
 
-	shmem = of_parse_phandle(cdev->of_node, "shmem", idx);
+	struct device_node *shmem __free(device_node) = of_parse_phandle(cdev->of_node,
+		"shmem", idx);
+
 	if (!shmem)
 		return IOMEM_ERR_PTR(-ENODEV);
 

---
base-commit: c9cfc122f03711a5124b4aafab3211cf4d35a2ac
change-id: 20251105-aheev-uninitialized-free-attr-arm-cf3516ba1a18

Best regards,
-- 
Ally Heev <allyheev@gmail.com>


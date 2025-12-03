Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3725A2EFD9C
	for <arm-scmi@vger.kernel.org>; Wed,  3 Dec 2025 15:22:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764775364; cv=none; b=WPAFvzCqtJ97mp7VfJIAdH0zvMNQUdeRNbAbrCKJu0wu7OJ4mzYw1jrMExzcm889LNL5xb6x/uorH883/mrZCXU2SIGYGIuBYMaa+fI4rdkXrV+AxApYG7XojgzdBTDOAfeIWU6r4L0gT+y7P4LxUd9V6F1Ey0OI/xXRskZwukI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764775364; c=relaxed/simple;
	bh=Qv9sJkWpgGEpPAGgYF93Xt7GisQr2dpOJAyb0wf7ork=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=R8inbUaToQCVteDNgv4tzf3lWfzBe2ArJXwgjkBokh621vrpc3krQVefiDmAxeqLQlYhGawbKhYzS0sSkmNmuHLJlPhnUfHM0fZpQHFcAOhbkuyc6UfQy4c90tlsJMyRwV6s9aw9boEEkNfI/fuCIZ65edHXeZi0X/Sy4Fjsbcs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=P0RGETS9; arc=none smtp.client-ip=209.85.210.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="P0RGETS9"
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-7ade456b6abso5550310b3a.3
        for <arm-scmi@vger.kernel.org>; Wed, 03 Dec 2025 07:22:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764775359; x=1765380159; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=NDEutrwYYSpAqMnjGTl0BgfQuhoL1ggOgrbvs9sYUR8=;
        b=P0RGETS9F9JlubkdpW3fSIzrpvxB3NEWQf6UQ+0+AFq0YeVGv8aswyacV7K7zQvNhU
         Dj83KCI6Rg0rSSqq7vUj3RfDuRhfNY+m7b9Uhq5NEorqzPMgO9iKCRH4t01Y3U1XsF6x
         pGuZhkdXVPR40CCWd2wRx0SkXFXFhuxeX49T8eSDN5PPjft0SVwZnB/Shs+FhpeODgsH
         LMBbS6E94jh3QS4nCBHprfswEH/1AMmEAzPU/sX6rXxkVUVuPWw2DVkbiii8RsQU/MzG
         +t2M/Kb7xtShCKk+ZJpEsx0qYVcGtLyKBnK7FDAYhU2jCKHXhwjrmq6OfLlgz4aJm0r+
         q5Jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764775359; x=1765380159;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NDEutrwYYSpAqMnjGTl0BgfQuhoL1ggOgrbvs9sYUR8=;
        b=n6EzZF4nu7ZZCbWeiZ3vHN6OOVBewpri95zev9G6OkVT9UYqZlxHepr6qmuo0etiP8
         QlQj80ubvIRjpLSjmC9CWHdZmTZm/UruKy8woe/JSedmKpj2T9TFBUaGfVdTXKO6yfKP
         icBxpmjGh6ShP1BLLIuYO4ij3H1l4B1fRzdVD5nJHodH6UcrqUDawvw5rox8TFXOqO12
         ezV9H76/WObC7t2MtPDbpaux5i4WhDEtCtL9xhDH9mbJMqcVch2ZTe/60RJQ2MHfDz+A
         i7EfNalVzTJR0HJLs4ePVN/K/a3AkvgdrNHv/Yi3t22KQIpSOd23fTQJTyZbXg7Pcg0f
         vu8A==
X-Gm-Message-State: AOJu0YyFrI0OOxMMxIGfIyBTaW8fE5stX6iKBPoOFTX4MfO6cN1/HpYx
	bDdE4F5Ty7fr/dXybZBgNqSRK7rFjbPV8+MQPHwWXoSSmDYhaGd91e4l47aEMg==
X-Gm-Gg: ASbGncuS+SV0xSPHz3cGxXiqOHsekfob5Fy73xGP/YLFDZT5mtSpBx/g+7BA7w9Pnri
	6PNrjMW/2/KhBduqhDnpmDTYHEaCWKGTB4elMGhXG4zFULkAERpw3AmF014+VYAFLYLsrttK/Yi
	64qWErgAjDzUz3qZItfnco1uvgtT+1yX0uP3OezFISiOzkXkAvclHpxqf1LypUTCNOuZtHYw2To
	qdCqH2OBJ0oflnzKoWEa45GPJhUFFywsrK+0e5OlJ38FmNHZMKMJ89IkMtUhbemmbCjaCqVw55H
	IzjWsrfs8r+yj0HJo6Nkh4mmRzVmwsDcPrBfhVxPFgAkWuXWd2s10TuSAxPo1uK26cvPgjsmJIm
	87qllUtH96a8L87BMhwSo6b0zeylTm/GShCm/xJrdlmGYRRzqzX1drddbtMZoEPnfPMVZTzDpBA
	W9PWkUaVsw
X-Google-Smtp-Source: AGHT+IEQUzaN10+PvCfrPIwTfI0EUNSjX0CDNB4HixfNpdOHIlbiZoepPnFatiDaFEfEdE27iJBqnA==
X-Received: by 2002:a05:6a20:12cf:b0:347:67b8:731e with SMTP id adf61e73a8af0-363f5d423efmr3848735637.14.1764775358570;
        Wed, 03 Dec 2025 07:22:38 -0800 (PST)
Received: from aheev.home ([106.215.171.188])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7d15e9c3dfcsm20590050b3a.40.2025.12.03.07.22.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Dec 2025 07:22:38 -0800 (PST)
From: Ally Heev <allyheev@gmail.com>
Date: Wed, 03 Dec 2025 20:52:34 +0530
Subject: [PATCH v2] arm: fix uninitialized pointers with free attr
Precedence: bulk
X-Mailing-List: arm-scmi@vger.kernel.org
List-Id: <arm-scmi.vger.kernel.org>
List-Subscribe: <mailto:arm-scmi+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:arm-scmi+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251203-aheev-uninitialized-free-attr-arm-v2-1-db52b2655ddf@gmail.com>
X-B4-Tracking: v=1; b=H4sIALlVMGkC/5WNQQ6CMBAAv0J6dg0LKRpP/oNwWMoWNoFi2tqoh
 L9b+YHHmcPMpgJ74aBuxaY8JwmyugzVqVBmIjcyyJBZVWWlEUsNNDEneDpxEoVm+fAA1jMDxei
 B/ALG1hqbnpDwqnLn4dnK63i0XeZJQlz9+1gm/Nl/6gkBwV76xvR6qOsG7+NCMp/Nuqhu3/cvK
 SfMrdIAAAA=
X-Change-ID: 20251105-aheev-uninitialized-free-attr-arm-cf3516ba1a18
To: Sudeep Holla <sudeep.holla@arm.com>, 
 Cristian Marussi <cristian.marussi@arm.com>
Cc: arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Dan Carpenter <dan.carpenter@linaro.org>, 
 Ally Heev <allyheev@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1998; i=allyheev@gmail.com;
 h=from:subject:message-id; bh=Qv9sJkWpgGEpPAGgYF93Xt7GisQr2dpOJAyb0wf7ork=;
 b=owGbwMvMwCU2zXbRFfvr1TKMp9WSGDINQnf3FL60rEo+t1dm3qX0Lfn/++1/B8sLL6m4fOpzx
 tWV2uebOkpZGMS4GGTFFFkYRaX89DZJTYg7nPQNZg4rE8gQBi5OAZiIWSEjw98TEgcOL471V83t
 i9h2Of6kRGny/Uedyzgdt2netOQyn8rwT6GHZY+j9GQlmfJ1Popveial3pRTbPpV6PnkxPtAT9F
 jbAA=
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
Reviewed-by: Cristian Marussi <cristian.marussi@arm.com>
---
Changes in v2:
- added Reviewed-by trailer
- Link to v1: https://lore.kernel.org/r/20251105-aheev-uninitialized-free-attr-arm-v1-1-f7b6cb5d3361@gmail.com
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


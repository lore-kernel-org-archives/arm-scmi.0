Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F6D136F916
	for <arm-scmi@vger.kernel.org>; Wed, 13 May 2026 09:09:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778663372; cv=none; b=Lll3lOxLpqooonxOxsbwpkWGjAPxWDooW922qwpwyu4UsDUCMgMwogdIY0lEXeYfrCUqtct8mhp+qcLwx11Gau9fLD5OaeSOCHGOVMewkLClpPVTwN/WoBlM+xCsm3Hc9m2AsYQXkLOrBXYdI2xd1vk4J18g1L/aUiegS9osdVE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778663372; c=relaxed/simple;
	bh=zXLDoiPitG4hQpATiZmFF2jKjG6+GncBlC6dn8b+3eI=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=GFhkM4QOBS2dp3mY4verPN3k7WRlYVhiNcveYpi/aUKBgk2ARmR9bK1bfyiI8NrvR+mWFcHA7jVtMHKydiD5FiSv2QBxUbHt8lktonK7VbnGKf4zvKRRyAQqKazNOn90y3lgC6RZgVHWCev7v2/7SR4bt9eaEd1sYfsGvcSzpl4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UZiSoFKp; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UZiSoFKp"
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-4462f8d2488so396865f8f.0
        for <arm-scmi@vger.kernel.org>; Wed, 13 May 2026 02:09:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778663367; x=1779268167; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=NoYnG+jVemCKfDia3hV2uX7KnTcLeGcvlho/J2VVvCM=;
        b=UZiSoFKpowS6SPGgwu28XKcwpr0lVnqiOC6BVnHlr4BGf53dWQvbZ1qGtC4NyRmLWn
         WflWwmUs4S2uiGLNSGMmjjlEANhbVRDiQ46+4ElsyYucSCPE9MJaUjOCftXkP+COfevF
         8Lvc2ygumPe5DTQ+rzLz96pnzUL/+P00EvBxWwa9iLTeCcjCpmCnK9UqxFo0jvWCc0fM
         igte+DIQL7UMkLhJVayJz2rueg5RTLEgnxHoOQXYwB1mrko62w36k40cZhUr/ck66n9A
         z4diKv4igZxtNI9SMU1BOof/7KcnxXyfIUhd+fR35UhwkQ3IRCMgCjTPWpJJFyxth0xV
         qXQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778663367; x=1779268167;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NoYnG+jVemCKfDia3hV2uX7KnTcLeGcvlho/J2VVvCM=;
        b=J4MrubG2my+B8gC+y/7TqNhOzxVJiw1sxg5TxxUY7EnWeUNRqFyzsJ+zOycPLbCiMg
         qyDB9JoVDhjkdEx/FWNoYscRfe/+3pHoFkuEUZzIeP8AHgRGqx4aMBFtXWqc36/gApF7
         gvzd/oE/ZPFpVNlC9F5KNWVaimKlnSzn1gZeFkX2mv6mHDFc4g1BDq6pB0AH+LsrPsGB
         kYKRCToD3210worI7//QMMtJGm9tzBFvcDpPwNXOKOUk59L6Xb9+xKC8oDZ/w0mfU9CL
         1PE89OjpiMVsw4ZVwda/u/ktjABrbue4UFR2NVIqGmNQTZvIeZ2HTTqigGp+gZcQMV26
         62hA==
X-Forwarded-Encrypted: i=1; AFNElJ/NRy4ZHOf/eLIHgdicXamfokETjd7U0i+jP+D/qeLU8SjnzuIg+pqp3S10OM4EKrAmdETJu3u8Ew==@vger.kernel.org
X-Gm-Message-State: AOJu0YyjZi4AMt+yjdm0pClZfQMLpMBZ/lfTTH9aT3SO3wTzmvEnJx7m
	/rfHevT7Fbpoafv4y76CvUYhHAMxid5BcdXkMRazBnsKtLTq2iNoDupm
X-Gm-Gg: Acq92OFCQkkikNdXolPsoOe/vkaxEu5x8MrAbluX2Fmj9oSpbNQByWlFjAIxUJuY56G
	UmaBjDkDKpDDzv6qdT/xN7VBtQSlmAcOwnkLhD40rlFtb3IDd2RezhEQtyZ4lbsPS7DBkyC3+2I
	Ku8vUs57kRCfI1RTG99mUnA9hEJdnJUuGNfCc0AyiWHso/21IsaDmlw41E7egSI6aRFfHWrjYR/
	UroZu+d4VU4Z13UZDtjaI32jAeN3QsgL/+/rEsESY2KS1t0zP0kmI9LGLIF+SeuhqPSgfQHtzHy
	kVB2L4Cx0LM5bZfXdPkKTbVredCyQOixy0ChCYNi6wNWQ39GU9Vjwix4Kgf3i9DljK3pIvQlM96
	XAwHKjYFCk41TI3o2aCXXNlYDqQnVI6GamlvlI84MxETC+27kGbfQKx/6sZRhHNjZynONZJqLbl
	RWaqj7It66BccT2g4aRHVwSbGybix/oB8EKp68IEVmYb8=
X-Received: by 2002:a05:600c:1910:b0:487:1fbb:5a28 with SMTP id 5b1f17b1804b1-48fc9a09523mr17069725e9.1.1778663367456;
        Wed, 13 May 2026 02:09:27 -0700 (PDT)
Received: from localhost.localdomain ([94.158.58.43])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48fce065732sm30871365e9.6.2026.05.13.02.09.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 May 2026 02:09:27 -0700 (PDT)
From: Stepan Ionichev <sozdayvek@gmail.com>
To: sudeep.holla@kernel.org
Cc: cristian.marussi@arm.com,
	mturquette@baylibre.com,
	sboyd@kernel.org,
	arm-scmi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	sozdayvek@gmail.com
Subject: [PATCH] clk: scpi: pass child node to of_clk_del_provider() in remove
Date: Wed, 13 May 2026 14:09:00 +0500
Message-Id: <20260513090900.5323-1-sozdayvek@gmail.com>
X-Mailer: git-send-email 2.33.0.windows.2
Precedence: bulk
X-Mailing-List: arm-scmi@vger.kernel.org
List-Id: <arm-scmi.vger.kernel.org>
List-Subscribe: <mailto:arm-scmi+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:arm-scmi+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

scpi_clocks_remove() iterates over the SCPI clock provider's child
device nodes, but passes the parent node to of_clk_del_provider()
on every iteration:

	for_each_available_child_of_node(np, child)
		of_clk_del_provider(np);

Providers are registered per-child in scpi_clk_add() (via
of_clk_add_hw_provider(np, ...) where the np argument is the
child node passed in from probe). of_clk_del_provider() looks up
the entry by node equality, so a call with the parent never
matches and silently does nothing.

This leaks the struct of_clk_provider allocations and the
of_node_get() references the helper takes for every registered
child, both on module unload and on the probe error path
(scpi_clk_add() failure for child N leaves children 0..N-1
registered).

Pass child to of_clk_del_provider() instead, matching the
pattern used by clk-stm32mp1.c:2350-2351.

Fixes: cd52c2a4b5c4 ("clk: add support for clocks provided by SCP(System Control Processor)")
Signed-off-by: Stepan Ionichev <sozdayvek@gmail.com>
---
 drivers/clk/clk-scpi.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/clk-scpi.c b/drivers/clk/clk-scpi.c
index 7806569cd..24cee7c9f 100644
--- a/drivers/clk/clk-scpi.c
+++ b/drivers/clk/clk-scpi.c
@@ -258,7 +258,7 @@ static void scpi_clocks_remove(struct platform_device *pdev)
 	}
 
 	for_each_available_child_of_node(np, child)
-		of_clk_del_provider(np);
+		of_clk_del_provider(child);
 }
 
 static int scpi_clocks_probe(struct platform_device *pdev)
-- 
2.43.0


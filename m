Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793994043;
	b=V3f3T6BxxCGlG9ezUyp6KqjCB8LQxOckhNlsrVFELfpp/lIntMVSlvRtIwPjVU7oJqH7
	 kdFFHEgOgRlnKv8cIinFtAeLIUgZ88ZpcrSN2qWAihbVi1YX4+88nmGnMcbqtFCAcn27w
	 R05ZekoiXdOR+IGptvlMcxK6jh0JrMnooRJ/XqUvKMewlPjz3M/uiUvF8RYRNSO3J6XHX
	 pStKl/z+8KiBQ2YrKn9NvErx7CWr6p96qn/FWhKzjr5J3F4ThUhkHQEh3aBF3G9f2eQRH
	 IJEC74Gi4D9SyET3QRBoCnhV+nj8XTBAnVSKl8911qivUL3u76RbWxayukrl1zZexDw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793994043;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=g1N9tbVOhbknui/KUnqnwvb5zZsgA7ui7noFKqFuo+w=;
	b=ZIaN3vhZIrz/KxEo8/Ro92aaTeIxEk3MFoKUc8I21podMfrWz3qtOCS7Ia3yVmoTFmQG
	 Emk2VneT29Wex8DKRH6ua5s00/VeyuIcMcMxdVG3o7ohppWXzlQKz6WqH5apPlhCGqUA+
	 y/Aarzels6RLWvWTfRZFcHbIRcdFga0BanwDSJRiX2MqTf81wWHgmSlWJLdtAdD82LhEJ
	 TrOfuyVoG3hz5OPxxKtYyo5ml7BoUHK6redwZlGzGE8a7JuLex5ahYMQvazmO/KrCnWdB
	 XGjYuA09731qHWD5u75xSAJo1ShBP9Qoyh+/dN7MHtZBgFYXFM9+0RX8lAj7yjGYxJA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=igg7+PbW;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1752606A329;
	Fri,  6 Nov 2026 19:40:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=igg7+PbW
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1793994042;
	b=xg+cbGiCv7xUY3vmJejN0xKYiV+A5OBxL633NmzuWWKWutGf15SSfyTTeRjspRYScIZ6
	 i5CDfkeEzk2514bmSfUS1WwK9jyQz8JuARhmkXVkdp/tSfspnePBcYfiCDzXZQodKwuMi
	 LRg8wJM87gA2Q/yJu5Ocydg1i0DrkFdu2oL11Ctv6f1CAwfuTkkv2R+FMfBxKMgdFtC82
	 cXbJCI3sM80UGMjzUPs2D7Hpdtu4poovJEwEjKFpMf6vso+KUbdvvZDkckiNU7TmkAS/P
	 aSlshnHRkFxUMxBcxlBypLty+T6r/KuNAiDHB5BuS/XdjUyd/uBs2G8HSp845arks3A==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1793994042;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=g1N9tbVOhbknui/KUnqnwvb5zZsgA7ui7noFKqFuo+w=;
	b=G7AoER38Ntud2RLGbhgOZTKi5Gkqvck3WlqgSk52A1rrEG8UVk9vkP9ABm/Yu1o8OJ0r
	 VuC0YAWdtHkrM0kZ75nHxZn8TQzdWrfJqCMv0fw19XHx0TI9aYJKBAL1n91x2dPmJ8vCX
	 Zz8zeP1Kp4jWtZ7BpkFfGIxc5BobA7MEsU3gnZG4L49cLB/sq/c8t93LGv5oa6V7eKeen
	 Erqri70ZAxSSYoZoZCiZUg7qliE524O+pj4Eg0ODwioy56niqGOlMS/FHPzXl84+Ew5os
	 3mxcg9rASY6gM0xpcbW5ZyU0EeSvZ3VTOf9xgMKAB7a0ickznSnf4G3S3VM4ka1718A==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 0A1C51F0089F;
	Fri,  6 Nov 2026 19:40:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793994042;
	bh=g1N9tbVOhbknui/KUnqnwvb5zZsgA7ui7noFKqFuo+w=;
	h=From:Date:Subject:To:Cc:Reply-To;
	b=igg7+PbWs84GnfXb6WersQMj21z0AZxPr+MjTWMQt4UbLQm0TUR3/a8NlcmOaunZ3
	 YHSe0rqCvXW2RsiYL6gV0hYYqfPHMNpke7cCIxhVYiuVD/K52B0UkM6Uylm+YcELmV
	 U3FaVmv6//DejJve94it59m64a1q/gXMn5mxs5rho7KpLbC8H9uZpzt3Q/r/uuLYWm
	 FuyebVrViz90RHkUb50C9on4G+Fw9p+7C2aOAXUWZr9HI4D8K5lbcPUcK6Wn4f6MRZ
	 5vosKX1KgwpEDJGbKGY8D2Cyd5h3GvBpwjAaWQDGcA51xv2Lbe8JgfXt975h3V6M5T
	 A7GMI+EjcSW0g==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 5E0794783A;
	Fri,  6 Nov 2026 19:40:41 +0000 (UTC)
From: Han Gao via B4 Relay <devnull+gaohan.iscas.ac.cn@kernel.org>
Date: Sat, 07 Nov 2026 03:40:33 +0800
Subject: [PATCH] firmware: arm_scmi: Drop the ARM architecture dependency
X-Mailing-List: arm-scmi@vger.kernel.org
List-Id: <arm-scmi.vger.kernel.org>
List-Post: <mailto:arm-scmi@vger.kernel.org>
List-Help: <mailto:arm-scmi+help@vger.kernel.org>
List-Subscribe: <mailto:arm-scmi+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:arm-scmi+unsubscribe@vger.kernel.org>
List-Owner: <mailto:arm-scmi+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Message-Id: <20261107-arm-scmi-arch-dep-v1-1-514872e8ede4@iscas.ac.cn>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMywqEMAyF4VeRrCdgKyj1VcRFGzMawQvNKIL47
 lZnd77F+U9QjsIKdXZC5F1UljnBfDKgwc89o3TJYHNbGpNX6OOESpOkQQN2vKIrvXOhsIHIQ/q
 tkb9yvM2m/Vu3MDL9nhBc1w1xJXeQdQAAAA==
X-Change-ID: 20261107-arm-scmi-arch-dep-96a99b32bcca
To: Sudeep Holla <sudeep.holla@kernel.org>, 
 Cristian Marussi <cristian.marussi@arm.com>, 
 Michal Simek <michal.simek@amd.com>
Cc: arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Han Gao <rabenda.cn@gmail.com>, 
 Han Gao <gaohan@iscas.ac.cn>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793994040; l=1758;
 i=gaohan@iscas.ac.cn; s=20261021; h=from:subject:message-id;
 bh=JFfyRaQjdRkhf1+nAyQftf8BDfEeha9RuqZH2ozDpeU=;
 b=WKv3qVktXvpY2424NiZPSFXWRZ5auD0LPYgNUC0J2hfBTaOLyfwe2GJj4c8PvAPyBOGi63/t8
 2LjLVo+kIR9B4DG1mGecFcC8TiJjdI9omLH+JM6pTdF38NzUBJGIIgh
X-Developer-Key: i=gaohan@iscas.ac.cn; a=ed25519;
 pk=J8WHEK3filS86QaCaIHDGafqhxKyQ4K7+vFgRirTIiY=
X-Endpoint-Received: by B4 Relay for gaohan@iscas.ac.cn/20261021 with
 auth_id=1262
X-Original-From: Han Gao <gaohan@iscas.ac.cn>
Reply-To: gaohan@iscas.ac.cn
Content-Transfer-Encoding: 7bit

From: Han Gao <gaohan@iscas.ac.cn>

The SCMI core and the mailbox and shared memory transports only use
generic kernel interfaces. Transports that need architecture support,
such as SMC, already carry their own dependencies.

Drop the ARM and ARM64 dependency so that other architectures can use
SCMI. Depend on HAS_IOMEM instead, for devm_ioremap().

Suggested-by: Michal Simek <michal.simek@amd.com>
Signed-off-by: Han Gao <gaohan@iscas.ac.cn>
---
This was patch 1 of the Zhihe A210 SoC series [1]. As Michal asked, it
now goes on its own through the SCMI tree.

Since [1], it depends on HAS_IOMEM: Sashiko found that UML, which has
no HAS_IOMEM, failed to link devm_ioremap().

Build tested on x86_64 without OF, i386, loongarch64, ppc64le, riscv64
and arm64. On UML, SCMI can no longer be selected.

[1] https://patch.msgid.link/20261103-a210-scmi-v3-0-ee6b31580808@iscas.ac.cn
---
 drivers/firmware/arm_scmi/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/firmware/arm_scmi/Kconfig b/drivers/firmware/arm_scmi/Kconfig
index 783c24a20e29..f403271c3d11 100644
--- a/drivers/firmware/arm_scmi/Kconfig
+++ b/drivers/firmware/arm_scmi/Kconfig
@@ -3,7 +3,7 @@ menu "ARM System Control and Management Interface Protocol"
 
 config ARM_SCMI_PROTOCOL
 	tristate "ARM System Control and Management Interface (SCMI) Message Protocol"
-	depends on ARM || ARM64 || COMPILE_TEST
+	depends on HAS_IOMEM || COMPILE_TEST
 	help
 	  ARM System Control and Management Interface (SCMI) protocol is a
 	  set of operating system-independent software interfaces that are

---
base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
change-id: 20261107-arm-scmi-arch-dep-96a99b32bcca

Best regards,
--  
Han Gao <gaohan@iscas.ac.cn>



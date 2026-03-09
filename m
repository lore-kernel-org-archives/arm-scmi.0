Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 752123D3319
	for <arm-scmi@vger.kernel.org>; Mon,  9 Mar 2026 14:39:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773067166; cv=none; b=lSrsJNbwLOGAeBq5iKazKt7y0/Ci7aK3XNKDOOzd4IElGF9pDGm4DoVccBY+O0nN5McfUqU5zECmuavVZn69bv3xRtKjCCpDZtqCcyfh9bjlJoR1JQLqBSbegQOuTtpQ739c9P+qfPKDitZ1z4jZ+z/2LvNYKYO/ql575gd5NLI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773067166; c=relaxed/simple;
	bh=RXu3NphZGUJJazeYHAThPbRn9NwLQx4SYJlxf+ZptIY=;
	h=From:Subject:Date:Message-Id:MIME-Version:To:Cc:Content-Type; b=Y0qnKGxf58XQ7WmmqKCv/d+w5+SdH82rNJjXcnCqmG6lLt+E5/djdUZfzodC68wV3PlOBYygZFxRqbh8ZtAPhHTwPTpGtfiHNyPBP//EB6Bc6on2fXeKYrwROLXF0oIZYXK/ptuW9jHF91tYNLzjOBXgKpLaNjd7/scSuDEO3lg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=iY8ynSGt; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="iY8ynSGt"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1773067164;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=SoS+3CWZlZnGbnfPaYdYtldz6vhvlQlhdk/Ns0DT5PM=;
	b=iY8ynSGtulG526u0fXhrVEwff19KullUe40XG+GlcPxnRRCJXcvPYg7dpiwDE21T/+7Wyk
	UcRh+WI+4WZPjq9LQCT4vVCSar0AE/0ArfzoFlafEPSFQ4yuHn1qJhL+tU1bX6usOi9Cq0
	2d+mD8TLB0VO2/H/N75Z32x/osdxmXY=
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-561-DeQhe8WbNROBdfWTa5fMrg-1; Mon, 09 Mar 2026 10:39:23 -0400
X-MC-Unique: DeQhe8WbNROBdfWTa5fMrg-1
X-Mimecast-MFC-AGG-ID: DeQhe8WbNROBdfWTa5fMrg_1773067163
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8cd820c6a4fso1218463785a.2
        for <arm-scmi@vger.kernel.org>; Mon, 09 Mar 2026 07:39:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773067162; x=1773671962;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SoS+3CWZlZnGbnfPaYdYtldz6vhvlQlhdk/Ns0DT5PM=;
        b=hf5pGmjwU+p7/B11nWGb3ujRf12ZetQ7tSozIuLrt4vrzOeaAWUId4jffssHEyO8a8
         1lrzTM9kA4R4PUr60lNGNaC/oZP/mSLI/q7jY0OqcbiLltgv0GemHKWXWepJ+JLySq4z
         3IFpBVtQBM9RPUGKTP6rPM2eT5Yzlcs1Pa5+QMdo8AjpapHME/vj/bSfh5+AvcdPj7bf
         dsdyTSTqgc3MJlnJItSLAXUbbkb0vRMVXTXW2h1xHCbaPMaF6lL10nGX39Chtz6ZXyFy
         cQYzgo7L2CCXuEuQpcbI1wizly55l7Apf48TaJk6sus3GXj133CCqZDp9nLkIHn8DQ63
         v1JQ==
X-Forwarded-Encrypted: i=1; AJvYcCWrQ5AvFwURcNsCQ6REayqLSQ7wQXoJhGwKaB5sqtBUH6g6Fc9syQ0PkhXH+KUIv+ec3s4tig5r1w==@vger.kernel.org
X-Gm-Message-State: AOJu0YykEy9IVblxAuNQyXZ5S8hWea34hVlt6ct9EE9fjZKHvgWi1Trv
	gW0/g1uGHKRElo+perUNA8Vh8yIbzdRkKaiOpVyYGaDRI08RePMMoUnJQA6Q8voMgLu/ImIiCKD
	+WXCDfD70PLGoaQaQJnCqdxYt7ZfKXrnHOdkwgLw00kIQFC2K4Dy+SapDeCrX
X-Gm-Gg: ATEYQzzv24ryGmw64+d5t7JDBeUwwzjdL5a3PVQ8eN9UafM2DzPmlGy0x1uRW+AIrD5
	zVL7sQz6h0sCoOLHE8uM7yozQPZUyVRNX3eLW6X21GsKF0q2lJNHW3mra4S0tVkfBb2mv2DIod9
	+d2uUp9tuFAjvLI3aAA6BKL7LeW3Y+wXzWnWsLgMlcGYmn2hW5EDkuspGMrNvw1V9Hyh8O9ZE+H
	kcEypU6WZxw9uBy1A9qTd88yMMRUaLfPrIlGLGREV2oSGiqZF8xeznhPOXCyWneV3sShxYFC+fl
	WG6znz6A5mcBu9ovWkx+mWyq7sdkLH1cOU5EksZPK4g/NWIwHVW3tkL8wTCcWNthvBEMII0O6w0
	PlwG7B6AwCXvOwXxbhHKdp5HxdRuvyEKwM7BEMdamvwmmRJc8JqQ7BzWD23sHig==
X-Received: by 2002:a05:620a:40c3:b0:8cd:8da1:d655 with SMTP id af79cd13be357-8cd8da1dd9fmr294099585a.66.1773067162501;
        Mon, 09 Mar 2026 07:39:22 -0700 (PDT)
X-Received: by 2002:a05:620a:40c3:b0:8cd:8da1:d655 with SMTP id af79cd13be357-8cd8da1dd9fmr294088585a.66.1773067161333;
        Mon, 09 Mar 2026 07:39:21 -0700 (PDT)
Received: from [192.168.1.15] (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8cd6f49fcafsm756064985a.16.2026.03.09.07.39.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Mar 2026 07:39:20 -0700 (PDT)
From: Brian Masney <bmasney@redhat.com>
Subject: [PATCH v2 00/12] clk: add new flag CLK_ROUNDING_NOOP
Date: Mon, 09 Mar 2026 10:38:39 -0400
Message-Id: <20260309-clk-det-rate-fw-managed-v2-0-c48ef5a3100a@redhat.com>
Precedence: bulk
X-Mailing-List: arm-scmi@vger.kernel.org
List-Id: <arm-scmi.vger.kernel.org>
List-Subscribe: <mailto:arm-scmi+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:arm-scmi+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/4WQy04DMQxFf6XKmqA4Lydd8R+oCyd2mBH0wcxQQ
 FX/nXQqIbFieW2fa19f1CzTKLPabi5qkvM4j8dDF/Zho+pAhxfRI3etrLHRWBt1fXvVLIueaBH
 dPvWeDvQirH1JbCI0B0VUp0+TtPFrdX7e3fUk7x99wXIvqhMtdej2203IkJNwzYEqJUs2O4vgk
 NhSS1YqOJtDiavvL5X6lACa6DMCMFIyNSAmb5wjh42IOUAuf6kMFQukADUwogTjq89VYmngi2u
 pJC/JRrpRhWbR9bjfj8t2gxxjhISuxRJ8xW4dMBnypjcKsWOfLKembmmHcV6O0/f61jOscf/94
 Bm00d5bYLYtco1Pk/BAy2O/QO2u1+sPBLaoPq0BAAA=
X-Change-ID: 20260226-clk-det-rate-fw-managed-4b8d061f31be
To: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>
Cc: linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Brian Masney <bmasney@redhat.com>, Sudeep Holla <sudeep.holla@kernel.org>, 
 Abel Vesa <abelvesa@kernel.org>, Andrea della Porta <andrea.porta@suse.com>, 
 Baolin Wang <baolin.wang@linux.alibaba.com>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Chanwoo Choi <cw00.choi@samsung.com>, Frank Li <Frank.Li@nxp.com>, 
 Geert Uytterhoeven <geert+renesas@glider.be>, 
 Krzysztof Kozlowski <krzk@kernel.org>, Orson Zhai <orsonzhai@gmail.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>, arm-scmi@vger.kernel.org, 
 Chunyan Zhang <zhang.lyra@gmail.com>, 
 Cristian Marussi <cristian.marussi@arm.com>, 
 Fabio Estevam <festevam@gmail.com>, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org, 
 linux-renesas-soc@vger.kernel.org, linux-samsung-soc@vger.kernel.org, 
 Peng Fan <peng.fan@nxp.com>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3788; i=bmasney@redhat.com;
 s=20250903; h=from:subject:message-id;
 bh=RXu3NphZGUJJazeYHAThPbRn9NwLQx4SYJlxf+ZptIY=;
 b=owGbwMvMwCW2/dJd9di6A+2Mp9WSGDLX3e66+SC7zE6hgIdj/dIW3U+zT8tcCfZ+eipU+4TX9
 wfSj6PNOkpZGMS4GGTFFFmW5BoVRKSusr13R5MFZg4rE8gQBi5OAZiIfBQjw7z3W7R3Wuxylu+4
 fiOxTkAphlfb8O7FuM6HpgnPH6TLJDD8FdY5/qVtl8YMod7Q58vbnVKPG0+PUTsjL7FQYcbZN08
 deAA=
X-Developer-Key: i=bmasney@redhat.com; a=openpgp;
 fpr=A46D32705865AA3DDEDC2904B7D2DD275D7EC087
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: Uvg9no1XCyt6-LnMdQ0-b5DUTNLW50e45cWXUZrZd1k_1773067163
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit

There are some clocks where the determine_rate clk op is just an empty
function that returns 0. This can be either because the rounding is
managed by the firmware, or the clock is capable of any rate. Add a
new flag for these type of clocks, and update the clk core so that the
determine_rate() clk op is not required when this flag is set.

Based on discussions with Stephen at Linux Plumbers Conference, he
suggested adding a flag for this particular case. So let's add a new
flag, and update the clk core so that the determine_rate() clk op is
not required when this flag is set.

This series adds the flag, some kunit tests, and updates all of the
relevant drivers under drivers/clk to use the new flag.

Once this is merged, and in Linus's tree, I can update the few remaining
clk drivers that are outside of drivers/clk via those subsystems at a
later time.

Merge Strategy
--------------
All of this needs to be directly merged by Stephen as one series into
his tree. Subsystem maintainers: please leave a Reviewed-by or Acked-by.
To reduce the noise, I am only CCing people on their respective drivers.

Note this series depends on 3 previously-posted patches in this git pull
to Stephen for v7.1.
https://lore.kernel.org/linux-clk/aZuK4-QJCXUeSxtL@redhat.com/

Signed-off-by: Brian Masney <bmasney@redhat.com>
---
Changes in v2:
- Renamed CLK_ROUNDING_FW_MANAGED to CLK_ROUNDING_NOOP
- In clk.c, give an error on probe if the clk implements a
  determine_rate() op and has CLK_ROUNDING_NOOP set.
- Dropped renesas/rzg2l-cpg change since they plan to fill out this
  driver's determine_rate op.
- Link to v1: https://lore.kernel.org/r/20260226-clk-det-rate-fw-managed-v1-0-4421dd2f6dc6@redhat.com

---
Brian Masney (12):
      clk: add new flag CLK_ROUNDING_NOOP
      clk: test: add test suite for CLK_ROUNDING_NOOP flag
      clk: rp1: drop determine_rate op and use CLK_ROUNDING_NOOP flag
      clk: scpi: drop determine_rate op and use CLK_ROUNDING_NOOP flag
      clk: hisilicon: hi3660-stub: drop determine_rate op and use CLK_ROUNDING_NOOP flag
      clk: imx: scu: drop redundant init.ops variable assignment
      clk: imx: scu: drop determine_rate op and use CLK_ROUNDING_NOOP flag
      clk: qcom: rpm: drop determine_rate op and use CLK_ROUNDING_NOOP flag
      clk: qcom: rpmh: drop determine_rate op and use CLK_ROUNDING_NOOP flag
      clk: qcom: smd-rpm: drop determine_rate op and use CLK_ROUNDING_NOOP flag
      clk: samsung: acpm: drop determine_rate op and use CLK_ROUNDING_NOOP flag
      clk: sprd: drop determine_rate op and use CLK_ROUNDING_NOOP flag

 drivers/clk/clk-rp1.c                   | 11 +----
 drivers/clk/clk-scpi.c                  | 14 +-----
 drivers/clk/clk.c                       | 31 ++++++++++--
 drivers/clk/clk_test.c                  | 85 +++++++++++++++++++++++++++++++++
 drivers/clk/hisilicon/clk-hi3660-stub.c | 14 +-----
 drivers/clk/imx/clk-scu.c               | 23 +--------
 drivers/clk/qcom/clk-rpm.c              | 16 ++-----
 drivers/clk/qcom/clk-rpmh.c             |  8 +---
 drivers/clk/qcom/clk-smd-rpm.c          | 15 +-----
 drivers/clk/samsung/clk-acpm.c          | 14 +-----
 drivers/clk/sprd/pll.c                  |  7 ---
 drivers/clk/sprd/pll.h                  |  2 +-
 include/linux/clk-provider.h            |  2 +
 13 files changed, 129 insertions(+), 113 deletions(-)
---
base-commit: 7d6661873f6b54c75195780a40d66bad3d482d8f
change-id: 20260226-clk-det-rate-fw-managed-4b8d061f31be
prerequisite-patch-id: 59198edc95aca82a29327137ad2af82ec13295b6
prerequisite-patch-id: 8932e170649711d7a80c57784033a37faadd519b
prerequisite-patch-id: 91c7b1851c5d77e504c49ce6bf14b3f8b84e826a

Best regards,
-- 
Brian Masney <bmasney@redhat.com>


Received: from mail-dl1-f53.google.com (mail-dl1-f53.google.com [74.125.82.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 004762857C7
	for <arm-scmi@vger.kernel.org>; Mon, 16 Feb 2026 18:11:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771265484; cv=none; b=inV7GFXe04H275SLeGOfW3SqUwlwxsiSWnkmKeO4WAicIQ3FoVVzDZM82w2LDGm8RxsEqgYFG56lS3e2sZXYePd9vfcc9euygy3SYE2OC9K9IarblEZhzRBTtw2R6c8wgWzDLsLcg1Q5BlrbTvZa6Kk+z8DkF9hoeZlrJb1JS8c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771265484; c=relaxed/simple;
	bh=cSCEF3PytEUhtrqx1ZL9yZAsXNXSd/VJdHuArUNHrik=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=HZ+qf8nAVTJZSnGk/Cj/BBhjQPeg0N44ZvG6tQcN/XO6hcEOdHMDqdQo1fXEy27DBhD3KCtvcT8W5EN2+6Kngp+hJwE4iJtdGTte0Tzz0lAUaibjvwcJIKgXZkmi9xqG7FxP4UhncM3tZwI7v4+7zBF67IQ5JwKflkF6TQdFRBc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=hb9r7TO9; arc=none smtp.client-ip=74.125.82.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="hb9r7TO9"
Received: by mail-dl1-f53.google.com with SMTP id a92af1059eb24-124afd03fd1so5024742c88.0
        for <arm-scmi@vger.kernel.org>; Mon, 16 Feb 2026 10:11:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1771265481; x=1771870281; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=7qPeoOZLMpDPHLvXRZ2UOWF72e8RnmNaQnfGaf4d8jU=;
        b=hb9r7TO94koSoC4Z2JHCT70nWqtWkl9i4vVEr/uEjeyLhmmT+tNRlyKSZLmYrvZHhu
         eDPKCqGVFhc3jrSCQkVj53fKUGEhSYivMP1qcHoBLVFhFAcxDLprPObeURgLzXlZKCNN
         cBABQhOU9KyeBJuBjHIShwIvLUb/R3zbNlsuQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771265481; x=1771870281;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7qPeoOZLMpDPHLvXRZ2UOWF72e8RnmNaQnfGaf4d8jU=;
        b=IwNmvFLr6H83JQmpI17fIo9beZYGbdheLetAcq8U54hWuylXpM+gX1ZYn/wJW3cKnH
         UWyyxWvR+Yi+VHwO6pkLNamOEJUUt/lGErZw58+yi9ucgSrop1XLEprgwRIDcmFPtFli
         FRTrGynYjJZbRxyBPM1aOGjGM2g1To0QtWzlBzDLSaQnsZ8kIbn2v3Bw7EGlJpHiZ+IN
         SEjQrJei7o2GxlfxuFRgJ2QfdgI1I+8GxtV0nEgPnRefXCwz4VQz32NV48kOmn/F+dB+
         IjXhJzipPBe1GpJWuaQkCb8vothAhPITNrnL0e5NoFk3oFpWGOGAgqaBbiusYphothj0
         Skpg==
X-Forwarded-Encrypted: i=1; AJvYcCWYBVUofyAnPlRmPF9X020DynALSAp3MFWcU4KZvPU5DLcMpwQfsCyQxP1Zr0M5Yrx0bJf3YdJfJw==@vger.kernel.org
X-Gm-Message-State: AOJu0YxqEuE4F6smx7jwbmYHOpTeAtXysNNv4+Y/BrHEFpQhEscjaqy0
	9yZTe9Ivfgm4N/su5ea5pfy+nh/Fc9v5EkZHQJSeJ41IFNHfx+sR32YgTGITJFMWjA==
X-Gm-Gg: AZuq6aI/R1qfqcSoa31HCCFSZg3UvY7+NOSKI2v3WBwCEncW/umEjDK0UF4H3z+Yp5Z
	x3yPuRh+zMO7vZ2E8PmeGVi+TLJm1gKrp4ZDObKSgrobDhbK2t/YYom4CydPCLPAEQZCgs09GH/
	PcYmEkxs24ySvHRN3BqJ4DNcNojD1c49KUj+XYk5u52F3yBGDvQ/DhG6T7C00vqO3hxr/ZNaxFD
	+YX4n5OIhU18XFxj0yUxQ1/G5NK4ZhMr1A0SG3Qmj88E0dnhori/x9Tuxqv7jRxpgunxBLw2KxK
	8jcZKNYVS935Dkt2nn69e2k3q1eaMf4yGNMeCu4sNZANaiZCOkdTacTGoEZ/KKEv0STifGI6omW
	cufRcCcAYWgzPQSW2z1fySlbVikpVtGCc9lW7LohhK1IT07EEDj7xldo1h3u3dLN5ioc1uq6qF0
	kkTpjjVXrjpp6hV477PBQ9CZPteUDA6iM0V4OH7EE5tbs+gXrKCMRqA1r9DjJCIny8H0ZcQzbuj
	64ywDBXsBk=
X-Received: by 2002:a05:7022:aa1:b0:119:e56b:91f6 with SMTP id a92af1059eb24-12741bd1202mr3136852c88.39.1771265481071;
        Mon, 16 Feb 2026 10:11:21 -0800 (PST)
Received: from dianders.sjc.corp.google.com ([2a00:79e0:2e7c:8:2953:dae1:1e39:73b3])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-12742c64282sm13724326c88.5.2026.02.16.10.11.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Feb 2026 10:11:20 -0800 (PST)
From: Douglas Anderson <dianders@chromium.org>
To: jassisinghbrar@gmail.com
Cc: Douglas Anderson <dianders@chromium.org>,
	Frank.Li@nxp.com,
	Santosh Shilimkar <ssantosh@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	andersson@kernel.org,
	arm-scmi@vger.kernel.org,
	cristian.marussi@arm.com,
	daniel.baluta@nxp.com,
	festevam@gmail.com,
	imx@lists.linux.dev,
	jay.buddhabhatti@amd.com,
	jonathanh@nvidia.com,
	kernel@pengutronix.de,
	konradybcio@kernel.org,
	krzk@kernel.org,
	lenb@kernel.org,
	linux-acpi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-remoteproc@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	lucaswei@google.com,
	marco.crivellari@suse.com,
	mathieu.poirier@linaro.org,
	michal.simek@amd.com,
	nm@ti.com,
	rafael@kernel.org,
	robh@kernel.org,
	shawn.guo@linaro.org,
	sudeep.holla@kernel.org,
	tglx@kernel.org,
	thierry.reding@gmail.com
Subject: [PATCH v3 00/15] mailbox: Stop sending NULL mailbox messages
Date: Mon, 16 Feb 2026 10:09:37 -0800
Message-ID: <20260216181002.3475421-1-dianders@chromium.org>
X-Mailer: git-send-email 2.53.0.273.g2a3d683680-goog
Precedence: bulk
X-Mailing-List: arm-scmi@vger.kernel.org
List-Id: <arm-scmi.vger.kernel.org>
List-Subscribe: <mailto:arm-scmi+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:arm-scmi+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

As talked about in the first patch in this series, passing NULL as the
'mssg' argument to mbox_send_message() ends up causing confusion and
quirky behavior inside the mailbox core. Despite this, there are a
number of drivers that pass NULL.

It is plausible that some of the drivers passing NULL may have been
taking advantage of the quirks of the mailbox core. Specifically, they
may have been taking advantage that calling "tx_done" wasn't truly
necessary for NULL messages (it was a noop) or that NULL messages were
passed onto the mailbox controller right away without queuing.

This series introduces a new API call: mbox_ring_doorbell(). The new
API call tries to mimic the specific quirks that were helpful in the
old behavior and it's expected to be a nearly drop-in replacement.

There are some subtle differences between the new call and the old
behavior, but it's expected that all of these differences are only for
cases where the old behavior made little sense. The description of the
first patch details these differences.

The series attempts to convert all in-tree users to stop passing NULL
for mssg. As per above, there are some slight differences in behavior.
If any of the patches are causing problems, they can safely be
reverted while debugging the problems. Eventually, all code should be
converted over to stop passing NULL mssg.

Changes in v3:
- Suggest mbox_ring_doorbell in the warning message
- Updated patch description based on Cristian's response.

Changes in v2:
- Instead of just documenting NULL, introduce a new function

Douglas Anderson (15):
  mailbox: Deprecate NULL mbox messages; Introduce mbox_ring_doorbell()
  ACPI: PCC: Use mbox_ring_doorbell() instead of NULL message
  firmware: arm_scmi: Use mbox_ring_doorbell() instead of NULL message
  firmware: imx-dsp: Use mbox_ring_doorbell() instead of NULL message
  firmware: tegra: bpmp: Use mbox_ring_doorbell() instead of NULL
    message
  irqchip/qcom-mpm: Use mbox_ring_doorbell() instead of NULL message
  remoteproc: xlnx: Use mbox_ring_doorbell() instead of NULL message
  rpmsg: qcom_glink_rpm: Use mbox_ring_doorbell() instead of NULL
    message
  rpmsg: glink: smem: Use mbox_ring_doorbell() instead of NULL message
  rpmsg: qcom_smd: Use mbox_ring_doorbell() instead of NULL message
  soc: qcom: aoss: Use mbox_ring_doorbell() instead of NULL message
  soc: qcom: smp2p: Use mbox_ring_doorbell() instead of NULL message
  soc: qcom: smsm: Use mbox_ring_doorbell() instead of NULL message
  soc: ti: wkup_m3_ipc: Use mbox_ring_doorbell() instead of NULL message
  drivers: firmware: xilinx: Use mbox_ring_doorbell() instead of NULL
    message

 drivers/acpi/acpi_pcc.c                       |  4 +-
 .../firmware/arm_scmi/transports/mailbox.c    |  8 +-
 drivers/firmware/imx/imx-dsp.c                |  2 +-
 drivers/firmware/tegra/bpmp-tegra186.c        |  4 +-
 drivers/irqchip/irq-qcom-mpm.c                |  2 +-
 drivers/mailbox/mailbox.c                     | 82 ++++++++++++++++++-
 drivers/remoteproc/xlnx_r5_remoteproc.c       |  2 +-
 drivers/rpmsg/qcom_glink_rpm.c                |  3 +-
 drivers/rpmsg/qcom_glink_smem.c               |  3 +-
 drivers/rpmsg/qcom_smd.c                      | 13 +--
 drivers/soc/qcom/qcom_aoss.c                  |  3 +-
 drivers/soc/qcom/smp2p.c                      |  8 +-
 drivers/soc/qcom/smsm.c                       |  8 +-
 drivers/soc/ti/wkup_m3_ipc.c                  | 10 +--
 drivers/soc/xilinx/zynqmp_power.c             |  2 +-
 include/linux/mailbox_client.h                |  1 +
 include/linux/mailbox_controller.h            |  4 +-
 17 files changed, 108 insertions(+), 51 deletions(-)

-- 
2.53.0.273.g2a3d683680-goog


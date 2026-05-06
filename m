Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A80B92264C7
	for <arm-scmi@vger.kernel.org>; Wed,  6 May 2026 00:50:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778028632; cv=none; b=akeED+AIxiHl3ucqLK5htnF5d05CWihXz6n3tlvpH6Kg5F+Th0MAbwcDMb+X4mTQ9lWVWWlf4nXqrojnmsjAfBMntVZ1awFtMOqNrzL51aIMqRWgK/bV7ngwimmSXHOFz3MIcN/VFkbV9x3UD75mHDslPkgBMbIqyPHliflSk0E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778028632; c=relaxed/simple;
	bh=zMeXAyyLpb1ycANNIw7NwRnIidpI1as921qDmQJS1JY=;
	h=From:Subject:Date:Message-Id:MIME-Version:To:Cc:Content-Type; b=D9Amhbc6KNL4q2KvL++N1PZNOGa9bhilZWH3AxHpWWN8IA0ABNARcAt9OuTBLjxWyqGfwCcLAXO1YPAm86Zuj2kL7ocLzbpTmJYduEB8vkwZKHGh/X68VG18RSi16ZVaRyqdfgAg27XHDmMGyGkeEyhwzeP/kqTuVoeBj3J27Fw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=ZohWz6HQ; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="ZohWz6HQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1778028629;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=b9H8cYKTCyIKnl9+d/AL5JHJT5IYmUArCaFMH4v5EuY=;
	b=ZohWz6HQUllvYrwQGEODoMsIiQ3IY3+ACIHrwjzLt7LaVHKXDKqcWHSTZ9lir9SiDQDZmB
	b/jQW6qFvbPBB9ikCFxjYhr3F9jnJHYhJOnjB+Pf4b1qIajGNB43tnpw7SCulgAZxRfgSG
	HBs1ZwsXGyfyjkAkxaeQKnTdtKN0eaw=
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-456-IomBexeNNYyQt8M46fv8Pg-1; Tue, 05 May 2026 20:50:28 -0400
X-MC-Unique: IomBexeNNYyQt8M46fv8Pg-1
X-Mimecast-MFC-AGG-ID: IomBexeNNYyQt8M46fv8Pg_1778028628
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8f4ef450191so1226615785a.2
        for <arm-scmi@vger.kernel.org>; Tue, 05 May 2026 17:50:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778028628; x=1778633428;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=b9H8cYKTCyIKnl9+d/AL5JHJT5IYmUArCaFMH4v5EuY=;
        b=MatVzy21o1/DnewUOZLX7GHcuIh6pnhWML6QupilnpU8QD3y8Vzx0eri5UkMmaGMd6
         EVW4mZDBhOUcBT+zsfWTZ4fvr7DTjQ7FSLfz29BFoldqBR35AN8Y2hSu+q+kD0jqRIYd
         UPIM2UOQoR1BMod0LK3n/GNG37vDD3D29zEo7NDQztOumdr+rp948fWJ3DkkDRbvOKj+
         xHn/oKsvkaGxn5HR56I3f61fjTrJAgE2ytozUiufKQk/Y84eFyMaNdiJ/WJjTEru+/6g
         ac4o+8/dMFCb6uFqra9tAhZdrhaw23+tpe9fCObWa8kNfMy7gP79xkGwAhYs+MaVYcwm
         bjwA==
X-Forwarded-Encrypted: i=1; AFNElJ+rkOmwnhLPgkkxNMcmb7raprd4XHP+9rmfyDfWzzS/mNxAVEr6FXMfqJpVkCu/C8oOI5kmpLvCzw==@vger.kernel.org
X-Gm-Message-State: AOJu0YyAZKIyp1mV/qooU8mQCjGV40KAjIAaGqPLd6+0WWVn0dt6tNwQ
	GtZGcr9sMsVdB/hmsez7xa6O7ZZVWFBAsPyrsmaGzWMHfTqPZ41OUq3N8CaClyDr2UgJgZVaknP
	yy7SRPrLLu1bbYgjt8MfudbDqAqyGcqqBzLCFWK5lPPyaw2dUXGnWogYP1bVj
X-Gm-Gg: AeBDievSEg/v7DiG8TOzb6HcaP34ZO54wa4DdKh629dJlyKY7Bsdrx77U5BE86Cwwyy
	pe4KAPsrSSprXuJJ7a1xk9YqLv3XswrZOf9W8DWnWmBi55wqyosSpeKLpgWUI702WJNK7mMUGhu
	QsuF1OPS9qY4744dQQ9ABn/J0adm287ZqUJKRPjwFhW7tyawU0mr97sKfNVubcOr/dUBKvHZyBd
	VZfdTvEcKZ7jOTwtG32YcyFzZrShO6JGnHJcoJdYiCGcDrWKHeTnKpFx0ObSzx1QfxTzbgrQYSo
	nuCxZhTtQcu5GHrO5Th1Af2Ium4S30gNNcQa1njX43VtJqMj6H61/n8hzfUCwlPQkQcL6ghmsyB
	/N1NixJPmuaajPuyD77UOlRVebJz55F3uaLJnXiIZSk+Ap8Bygm111U2vj5XtyXcScVE1MVTN
X-Received: by 2002:a05:620a:454d:b0:8cd:7952:d449 with SMTP id af79cd13be357-904d5f00d9emr231850985a.29.1778028627947;
        Tue, 05 May 2026 17:50:27 -0700 (PDT)
X-Received: by 2002:a05:620a:454d:b0:8cd:7952:d449 with SMTP id af79cd13be357-904d5f00d9emr231848285a.29.1778028627449;
        Tue, 05 May 2026 17:50:27 -0700 (PDT)
Received: from [192.168.1.15] (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8fc2c91fb3bsm1464933385a.41.2026.05.05.17.50.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 May 2026 17:50:26 -0700 (PDT)
From: Brian Masney <bmasney@redhat.com>
Subject: [PATCH v3 00/15] clk: introduce clk_determine_rate_noop() and
 update drivers to use it
Date: Tue, 05 May 2026 20:48:56 -0400
Message-Id: <20260505-clk-determine-rate-noop-v3-0-f3f829fbacdf@redhat.com>
Precedence: bulk
X-Mailing-List: arm-scmi@vger.kernel.org
List-Id: <arm-scmi.vger.kernel.org>
List-Subscribe: <mailto:arm-scmi+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:arm-scmi+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/x3MQQqDMBBG4avIrDsQNVHpVYqLoH90aJvIREpBv
 LvB5bd476AMFWR6VgcpfpIlxYL2UdG0+riAZS6mxjSdccbx9HnzjB36lQhWv4NjShvXvXfWhn4
 w9UCl3hRB/vf5NZ7nBVsAcIVpAAAA
X-Change-ID: 20260505-clk-determine-rate-noop-17a544f78018
To: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>
Cc: linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Peng Fan <peng.fan@nxp.com>, Abel Vesa <abelvesa@kernel.org>, 
 Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, Anson Huang <anson.huang@nxp.com>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Geert Uytterhoeven <geert+renesas@glider.be>, 
 Andrea della Porta <andrea.porta@suse.com>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Krzysztof Kozlowski <krzk@kernel.org>, 
 Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Chanwoo Choi <cw00.choi@samsung.com>, Alim Akhtar <alim.akhtar@samsung.com>, 
 Sudeep Holla <sudeep.holla@kernel.org>, 
 Cristian Marussi <cristian.marussi@arm.com>, 
 Orson Zhai <orsonzhai@gmail.com>, 
 Baolin Wang <baolin.wang@linux.alibaba.com>, 
 Chunyan Zhang <zhang.lyra@gmail.com>, 
 Chun-Kuang Hu <chunkuang.hu@kernel.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Chunfeng Yun <chunfeng.yun@mediatek.com>, Vinod Koul <vkoul@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Ulf Hansson <ulfh@kernel.org>, linux-arm-msm@vger.kernel.org, 
 linux-renesas-soc@vger.kernel.org, linux-samsung-soc@vger.kernel.org, 
 arm-scmi@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 linux-mediatek@lists.infradead.org, linux-phy@lists.infradead.org, 
 linux-pm@vger.kernel.org
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=3477; i=bmasney@redhat.com;
 s=20250903; h=from:subject:message-id;
 bh=zMeXAyyLpb1ycANNIw7NwRnIidpI1as921qDmQJS1JY=;
 b=owGbwMvMwCW2/dJd9di6A+2Mp9WSGDJ/TXBhDD/HJ+irfPCG5f8LBYvv8Dx9dmqr4NPkLyFFK
 ++kbGS41lHKwiDGxSArpsiyJNeoICJ1le29O5osMHNYmUCGMHBxCsBEFrEwMqxq53uRvrC91Ddt
 SpiPrVzUGZG/vn+yPrXy74upe2fVfJGRYcr2/5NeNj+qTdRbHh6S2B+gniyyo6Z0VsK7yHUStra
 VbAA=
X-Developer-Key: i=bmasney@redhat.com; a=openpgp;
 fpr=A46D32705865AA3DDEDC2904B7D2DD275D7EC087
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: Gg4ssSa_9iUro5KDmWtT9pT_vg8BfKuYvgPEvZXMi5U_1778028628
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit

There are some clocks where the determine_rate clk op is just an empty
function that returns 0. This can be either because the rounding is
managed by the firmware/hardware, or the clock is capable of any rate.
Let's add a new new shared function to clk.c named
clk_determine_rate_noop(), and update all of the drivers that have an
empty determine_rate() ops to use this new shared function.

The first patch in this series also includes a minor cleanup to
drivers/clk/imx/clk-scu.c. I included it as the first patch so it
doesn't get buried in the middle of this series. I change this same
driver later in the series to use clk_determine_rate_noop().

Changes since v2:
https://lore.kernel.org/all/20260309-clk-det-rate-fw-managed-v2-0-c48ef5a3100a@redhat.com/
- Dropped the NOOP flag and just use a dedicated noop function.

Merge Strategy
--------------
All of this needs to be directly merged by Stephen as one series into
his tree. Subsystem maintainers: please leave a Reviewed-by or Acked-by
for Stephen. To reduce the noise, I am only CCing people on their
respective drivers.

Since there's only 3 drivers outside of drivers/clk that need to be
updated, I included them in this same series for completeness. These
should go through Stephen's tree as well.

Signed-off-by: Brian Masney <bmasney@redhat.com>
---
Brian Masney (15):
      clk: imx: scu: drop redundant init.ops variable assignment
      clk: add clk_determine_rate_noop()
      clk: hisilicon: hi3660-stub: use clk_determine_rate_noop()
      clk: imx: scu: use clk_determine_rate_noop()
      clk: qcom: rpm: use clk_determine_rate_noop()
      clk: qcom: rpmh: use clk_determine_rate_noop()
      clk: qcom: smd-rpm: use clk_determine_rate_noop()
      clk: renesas: rzg2l-cpg: use clk_determine_rate_noop()
      clk: rp1: use clk_determine_rate_noop()
      clk: samsung: acpm: use clk_determine_rate_noop()
      clk: scpi: use clk_determine_rate_noop()
      clk: sprd: use clk_determine_rate_noop()
      phy: mediatek: phy-mtk-hdmi-mt2701: use clk_determine_rate_noop()
      pmdomain: mediatek: airoha: use clk_determine_rate_noop()
      pmdomain: mediatek: mtk-mfg: use clk_determine_rate_noop()

 drivers/clk/clk-rp1.c                           |  8 +-------
 drivers/clk/clk-scpi.c                          | 14 +-------------
 drivers/clk/clk.c                               | 18 ++++++++++++++++++
 drivers/clk/hisilicon/clk-hi3660-stub.c         | 12 +-----------
 drivers/clk/imx/clk-scu.c                       | 24 +++---------------------
 drivers/clk/qcom/clk-rpm.c                      | 15 ++-------------
 drivers/clk/qcom/clk-rpmh.c                     |  8 +-------
 drivers/clk/qcom/clk-smd-rpm.c                  | 13 +------------
 drivers/clk/renesas/rzg2l-cpg.c                 |  8 +-------
 drivers/clk/samsung/clk-acpm.c                  | 14 +-------------
 drivers/clk/sprd/pll.c                          |  8 +-------
 drivers/phy/mediatek/phy-mtk-hdmi-mt2701.c      |  8 +-------
 drivers/pmdomain/mediatek/airoha-cpu-pmdomain.c |  8 +-------
 drivers/pmdomain/mediatek/mtk-mfg-pmdomain.c    | 23 ++---------------------
 include/linux/clk-provider.h                    |  1 +
 15 files changed, 36 insertions(+), 146 deletions(-)
---
base-commit: 4cd074ae20bbcc293bbbce9163abe99d68ae6ae0
change-id: 20260505-clk-determine-rate-noop-17a544f78018

Best regards,
-- 
Brian Masney <bmasney@redhat.com>


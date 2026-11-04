Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793788586;
	b=s+60CGVfXNdWvKkjp1L4y76z1Nq9nQjfdXSMgZ4eCL9ifVGIR1U+kt2kAlOzunwEpOHC
	 NySmT1Y8Os1dpMQhRX7ah6rm8rO6I1FxS+2+w+qjkD5w9d+TLOVG46/+NKBDn2mq4+xZy
	 dqBcY1nTiLlYG96C5nrFCygX6LpCKwpswcbnuQlDd1p1Y5Hjbkgq/d9E8ZkeAfYvfUfCD
	 AW9Czisj5C7uZHTXIA61cf+Ep6tsffBY3jYdVmeSvpfHJ3EHY4dWHJJIMVtfiBzoHnmIq
	 VVuDLTSadTGi+cZg940c7Xlq36OYrWxoQtkK4Gaq7MDUYuQXzMtf+tVV96/8PxDV5Vw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793788586;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=IT2ld2hEUrh1U4ufhHP01T3lVawATcj2VlDSAq4lmcU=;
	b=H3+nppRohT11fE5NoC3JVeuou38ifeiWyZxpko68TF8tBn6LFRpGxS6aDNK9Jc/tNXVH
	 C/TY3gNkcy+8Bv/Gt+Be1KJKrzWFHANR6WtCy3vSziAKyBI9uLUy+Hhzmbl+tLqWk3U1i
	 jdxpLjixne+JX6dRtdCkKsgnadaorXt37o8K5OWT7BADzwsN4MfSukrK9QKDbFtJgO2O5
	 ACGkKa5nYZddoJeVgQSolGjcuVN4exLmd4S9TCK0CBxXpNDFbwl8OosV3H5pzLOss7xMm
	 Vfrb80q5ELuEkSCLXqqGGmYTh9cI93s6FAj9Byme6GQzAmRRjrhs5aOPzmwzG28wMgQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amarulasolutions.com;
	spf=pass smtp.mailfrom=amarulasolutions.com;
	dkim=pass header.d=amarulasolutions.com header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google header.b=U0y8BBhP;
	arc=none smtp.remote-ip=209.85.128.52
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09382606A333
	for <arm-scmi@vger.kernel.org>; Wed,  4 Nov 2026 10:36:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 09382606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google header.b=U0y8BBhP
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4a210470b49so3611425e9.2
        for <arm-scmi@vger.kernel.org>; Wed, 04 Nov 2026 02:36:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1793788584; x=1794393384; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=IT2ld2hEUrh1U4ufhHP01T3lVawATcj2VlDSAq4lmcU=;
        b=U0y8BBhP4gGZQTY455sX/GrgiSG6QsvOmloXZR7Epotwvm4hNK4TwD5Drm6fEhBFvy
         I0HE+XDKnPf7bF7O+FgzmYvogMME7v1ZH+UAi6WUMS9HfRka+zUBJNCbheK/cibGrrDT
         q8OHm2MyVmrGVG8U6+77/pI0tvqCHr7Err45Y=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793788584; x=1794393384;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=IT2ld2hEUrh1U4ufhHP01T3lVawATcj2VlDSAq4lmcU=;
        b=jZAE8JWahH/MArxoP6hETldefRBfeKQpdNw2WTpo2Bx1i0yMwSnf67TEAm6F4ZJqSh
         P5l6P5Ou+LjHRFQR5vOqHaunt5Gkhkmhy9HJdnNGt5BlTMIGUr/oLjE3KWKWYHByK9Jb
         5x+AhiX6/uOKbQlKq+uYjcg4h1W6yyNpjLqcJhkJkCf7fdgyohSLdO2fZLnDK7qUbNYS
         3wcFcmw6cqi4qKOa05/WGNW4zr592fJX0tja5GjLpMjxJC/9cT3laxm7yITKBjgMLypI
         b2ZzpaeawVejcAZUXDG3S8Ecn/DQiEvpQvlibuH8c3ReTYJm8w7J75PyecQrDAHfvw6s
         SPSg==
X-Forwarded-Encrypted: i=1; AKwUvBzJUK0QbC73VQVcDactFfl44+tv/9jgz68malmyyROQ77aqjmNLFAlyQK+A4F/qKEUBJn/LU9Y9kw==@vger.kernel.org
X-Gm-Message-State: APuU4Z+xRD1LjbNVeKHVKG4rGvw9DFZovCGkJzcYzeF5mB5sRVH2bQJ0
	YwuixG8KGRoCrQaR98jdcLc21MYVKw/0FzfBbGd9OXAWmBebMdZLkJOixl99llJj5DE=
X-Gm-Gg: AYBFou13QtVND3BKSy3PFo1FjknqatcfGMW5G01HAq+M/XsURLGgFoY4aZ9Xbwop+3Z
	yyWaYEyy0fyarUXZVuCV/AMDCBMSdYVpew+q+5cQJ5xXs4noN3YVbK2lqwvWSmue4ImxryIfsvq
	fRtvfv3KLu/EzafV1hPDl4RkD5jas9iO5QfjJPPbKHMmVT6nV/dREu8u3XOGz3tFvLRq3R5zVWC
	DShWOdHk5OXT8J3WhcIc2gTrLrDp8QrQHmhqJdPsIsNeDowu+BjTJMYXrODI/vWi5qCQ2nTifbw
	iAAseVVoITRwT5OE4mVSdi0OEva1DLCDRLh2n4TUHMHtUSdZdoT8Jn5sLrsYw4YDd9idRo0BoqM
	kwg05lLP+VZokD8alOz01DgknpwFzN8RAfTg0eOktI38ZDKq5Zc3A/8tgTiNvY6DFAlhnK6+Om0
	ye5RRr8ZzRkXBpuD3a+IC5iqEWJt4iEARopexxWJ5B+th1SB8talLhQ3Ac/Xg9ILh2QzmD6gzXp
	6wIpC2Z/GYRhiANKckPRr70Jx5p9wpdn//0iaDUyUApPrwuDOth7tyEM4No2sdfBr2YhXGIioqW
	qX0XxxxFGXVovQEGYk+G8NJM4N2Aj7u/L0iv+96DExelPVscpv+9OLrDhbzx7FiyMOe4LroWXQg
	pJ+aIKu+TfKck/JaSITjf1o2jMJlCOD8UBPekq4nEzWzU2plPmbE=
X-Received: by 2002:a05:600c:4fd4:b0:4a1:e250:b191 with SMTP id 5b1f17b1804b1-4ac180f2ff3mr353454585e9.17.1793788584219;
        Wed, 04 Nov 2026 02:36:24 -0800 (PST)
Received: from dario-ThinkPad-P14s-Gen-5.amarulasolutions.com ([217.201.213.4])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b2afee292bsm141685155e9.4.2026.11.04.02.36.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 02:36:23 -0800 (PST)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: Sudeep Holla <sudeep.holla@kernel.org>,
	Cristian Marussi <cristian.marussi@arm.com>
Cc: imx@lists.linux.dev,
	Peng Fan <peng.fan@nxp.com>,
	linux-amarula@amarulasolutions.com,
	arm-scmi@vger.kernel.org,
	michael@amarulasolutions.com,
	Dario Binacchi <dario.binacchi@amarulasolutions.com>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Sebin Francis <sebin.francis@ti.com>,
	Stephen Boyd <sboyd@kernel.org>,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v15 0/2] clk: scmi: fix the i.MX OEM spread spectrum configuration
Date: Wed,  4 Nov 2026 11:36:01 +0100
Message-ID: <20261104103620.4054694-1-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
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

These are the two patches of the v14 series [1] still pending, as
patches 2/4 and 4/4 have been merged in 7.4-rc1.

The first one is a fix for 7.3: the i.MX SCMI OEM extension converts
the spread to the wrong unit, so the hardware is programmed with no
spread at all for any valid configuration. The second one rejects the
configurations that do not fit in the OEM fields, instead of silently
truncating them.

Brian is waiting for an ack from the SCMI side on both patches.
Sudeep and the arm-scmi list were not Cc'ed on v14, as
get_maintainer.pl does not list them for clk-scmi-oem.c.

[1] https://lore.kernel.org/all/20260904101243.412006-1-dario.binacchi@amarulasolutions.com/

Changes in v15:
 - Drop patches 2/4 and 4/4, merged in 7.4-rc1.
 - Rebase on v7.4-rc1.

Changes in v14:
 - Move the fixes first, so that they can be picked up separately from
   the new patches.

Changes in v13:
 - Add patch "clk: scmi: reject SSC configuration out of the OEM field
   range".
 - Rename patch "clk: scmi: fix SSC permyriad conversion" to "clk: scmi:
   fix SSC spread conversion".

Changes in v12:
 - Add patch "clk: scmi: fix SSC permyriad conversion" to fix the
   permyriad to percent conversion in clk-scmi-oem.c, reported by
   Sashiko AI review.

Changes in v11:
 - Add patch "clk: Validate spread spectrum configuration" to reject
   invalid parameters in the clk core before they reach the providers.

Changes in v10:
- Drop patches 1-22, superseded by the generic spread spectrum clocking
  support from Peng Fan, merged in 7.3, so the i.MX8M specific infrastructure
  is no longer needed. This patch is now based on the following commits:
  - ae794aa6e88d ("dt-bindings: clock: Add spread spectrum definition")
  - c86814e70390 ("clk: Introduce clk_hw_set_spread_spectrum")
  - a7f16660af39 ("clk: conf: Support assigned-clock-sscs")
  - 7d98de6ffdab ("clk: Add KUnit tests for assigned-clock-sscs")
  https://lore.kernel.org/all/20260826165611.236321-1-sboyd@kernel.org/

Changes in v9:
- Add 'Reviewed-by' tag of Peng Fan for imx8mn platform patches
- Fix building warning raised by the kernel test robot for patch
  v8, 11/18 clk: imx: add support for i.MX8MN anatop clock driver
- Add patches for imx8m{m,p} platforms:
  - 23/23 clk: imx8mm: support spread spectrum clock generation
  - 22/23 clk: imx: add support for i.MX8MM anatop clock driver
  - 21/23 clk: imx8mp: support spread spectrum clock generation
  - 20/23 clk: imx8mp: rename ccm_base to base
  - 19/23 clk: imx: add support for i.MX8MP anatop clock driver

Changes in v8:
- Drop the patches added in version 7:
  - 10/23 dt-bindings: clock: imx8m-clock: add phandle to the anatop
  - 11/23 arm64: dts: imx8mm: add phandle to anatop within CCM
  - 12/23 arm64: dts: imx8mn: add phandle to anatop within CCM
  - 13/23 arm64: dts: imx8mp: add phandle to anatop within CCM
  - 14/23 arm64: dts: imx8mq: add phandle to anatop within CCM

Changes in v7:
- Add and manage fsl,anatop property as phandle to the anatop node with
  the new patches:
  - 10/23 dt-bindings: clock: imx8m-clock: add phandle to the anatop
  - 11/23 arm64: dts: imx8mm: add phandle to anatop within CCM
  - 12/23 arm64: dts: imx8mn: add phandle to anatop within CCM
  - 13/23 arm64: dts: imx8mp: add phandle to anatop within CCM
  - 14/23 arm64: dts: imx8mq: add phandle to anatop within CCM

Changes in v6:
- Merge patches:
  10/20 dt-bindings: clock: imx8mm: add binding definitions for anatop
  11/20 dt-bindings: clock: imx8mn: add binding definitions for anatop
  12/20 dt-bindings: clock: imx8mp: add binding definitions for anatop
  to
  05/20 dt-bindings: clock: imx8m-anatop: define clocks/clock-names
  now renamed
  05/18 dt-bindings: clock: imx8m-anatop: add oscillators and PLLs
- Split the patch
  15/20 dt-bindings-clock-imx8m-clock-support-spread-spectru.patch
  into
  12/18 dt-bindings: clock: imx8m-clock: add PLLs
  16/18 dt-bindings: clock: imx8m-clock: support spread spectrum clocking

Changes in v5:
- Fix compilation errors.
- Separate driver code from dt-bindings

Changes in v4:
- Add dt-bindings for anatop
- Add anatop driver
- Drop fsl,ssc-clocks from spread spectrum dt-bindings

Changes in v3:
- Patches 1/8 has been added in version 3. The dt-bindings have
  been moved from fsl,imx8m-anatop.yaml to imx8m-clock.yaml. The
  anatop device (fsl,imx8m-anatop.yaml) is indeed more or less a
  syscon, so it represents a memory area accessible by ccm
  (imx8m-clock.yaml) to setup the PLLs.
- Patches {3,5}/8 have been added in version 3.
- Patches {4,6,8}/8 use ccm device node instead of the anatop one.

Changes in v2:
- Add "allOf:" and place it after "required:" block, like in the
  example schema.
- Move the properties definition to the top-level.
- Drop unit types as requested by the "make dt_binding_check" command.

Dario Binacchi (2):
  clk: scmi: fix SSC spread conversion
  clk: scmi: reject SSC configuration out of the OEM field range

 drivers/clk/clk-scmi-oem.c | 27 +++++++++++++++++++++++----
 1 file changed, 23 insertions(+), 4 deletions(-)

---
base-commit: 05441d697f7f9a927264f4058cbbc6a03dfcac9d
branch: imx-pll14xx-spread-spectrum

-- 
2.43.0


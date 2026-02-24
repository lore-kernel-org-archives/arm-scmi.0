Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BA313644B6
	for <arm-scmi@vger.kernel.org>; Tue, 24 Feb 2026 10:43:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771929829; cv=none; b=sSQoMM8oQ/z8qUIjIdjvgmuHkDAVuKi/X4qJq0EGdIT8qqSUrtAQVHbXfUosWj2xXPektWMZSdzOS06M861nXVBxBiKX/Nqez3YUMyR9v6A92q6tY5NOucwI0wQL2PG/gUnrvdEKDNUWGoppe+HY0+7p49lDmhmXihOUApsqFkw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771929829; c=relaxed/simple;
	bh=6sPDie8uUqGDS1bsA07NmZp55tMOfOGlzrz/b5hPRYY=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=V9nYLKbQq1UsxxTwLQC8+XcfxaGUU1RJkFIULbLHb+wtUs4yhwOb53LdR6ZKRhVSjvBjErlD0Fagu1l/urxHrwtohCIKXbU2DALfp7OgrQqtaYX9pl85Y1CohBVOsKv5H7VXq37WEunAaaDxkjABTba35PUQAa+YuD3dRepouXg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=d/oQ9vYR; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Dwy+DFrO; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="d/oQ9vYR";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Dwy+DFrO"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61OAFMqt3884215
	for <arm-scmi@vger.kernel.org>; Tue, 24 Feb 2026 10:43:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=GVPafuMTkBBvdHOwmIqwEb
	y5N6HPu4j2/4G4NoYv4Ds=; b=d/oQ9vYRMDkrfNc68cBbbYSDw1IQ6cPp24mLeX
	KblHfoB6mwkPmGQ9sxCl77WDjAgfiefYV6LRzDjAaReBxt86oZ+m6nrDXY2GQXB+
	x/5XVbvu+CraARis4OvfkbU36yhSg6XK4uUu466ijZgFkJDyYvsQX4lUMhsUnb8L
	UD//CcI5M4fLbpS+/fSXfR/ZmSiRO+DCj81KyI3oTbTBJ9gvGoQQ5Q04eO3XJmj2
	InicdozEvmXzHIpVklzrHyvQNl3BRDr9CRXBXXiRwZKsS4jeeC577MgDmiYV7wXB
	tvbLh2g5ZMB3PhT6U6a1IBwB3SnJoL2ghBFJksWgjZws+aXQ==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cgte8tukk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <arm-scmi@vger.kernel.org>; Tue, 24 Feb 2026 10:43:47 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8c70ab7f67fso3843456185a.3
        for <arm-scmi@vger.kernel.org>; Tue, 24 Feb 2026 02:43:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771929827; x=1772534627; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=GVPafuMTkBBvdHOwmIqwEby5N6HPu4j2/4G4NoYv4Ds=;
        b=Dwy+DFrOehG8atDEOSN4T2JeyU61aVQ79ex9Z06Gu07PogWqUAvfDyIl5pnsq8rBwU
         dPRqql2+Yc2DNJuZFODF6aBtrfFePCaaNLG4qUQ+UCetuTVJNY14fPddu77bUsZSXVpk
         ODBCq9VQIasCJgj7dzFZ7el7eTM2T3JpjCdNsrGjEzY3f2PzlVqQDL6/QfJC1ghIvSk0
         2rb4SHjsyB5AOHL9mdHgopZf9lO3KlBDqa0JXT7s0rrSLqtIT0306drpl/S/FQKDd0/I
         5COwGAeTG4+vMTJA0PuSgRnfi0T4Ksm6QiofYeVDeXR28FOBoZDwjaSQ3J00931rJ3fN
         4r7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771929827; x=1772534627;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GVPafuMTkBBvdHOwmIqwEby5N6HPu4j2/4G4NoYv4Ds=;
        b=n2pYUm+eEkuNcA5k2AmQHR2pfnxpo8VO28+6Eh1z+VKtLQJwtePbgm2FOk2f5xSk14
         K4SuKifqrIpjV1q4TK2wJJMSKOicSP2+9rIkRV5iCzbxWvjXrsADtYon+yxGtTkSqyp1
         S3zUWNtGrpzObqsPoTuVR7eSsJgEyhK9+Q6rmJn4kYvkkJKWBSoSUdLpLDoqigYVIZiF
         Z1hBzpfOhJiVP7+wMgoKpV5q9CW8Axk7P//nt+uq2Jg3kuXoL3sYBE+2Yw9qyRPj0UOG
         aaqkm2lAhLMvX1l0JvdQvPB3m0ZtxV9XphaTKRFDVZzAocu29mjkn7iPZBvDcvUMDZXE
         XEGQ==
X-Gm-Message-State: AOJu0Yyi+QITgZC1fEJhO06y0ZQ6APzesGyLEW4JTyKwagOGkFncM4Gv
	L3Ttmca1bilqDPhHLySOJJPwDg+ozIp4MqkFyOo4gx7ezs3ohi4urk4OD08bdNJU+2NgmLfInch
	96WJDV6ZF5ngF7isQnnL0PQxwcGWx39p6qb1YtZc7L5HXCdDet+LCPCaQ+bfdJg==
X-Gm-Gg: AZuq6aIt+UvVBoaAyoJBwCLhm1svkgaHSmTnpTZrTadskUnqHWHuhJjSWIdZrtyCggN
	liwmUOrgBHKa6r2G/mVGNPZar0y7n2MuCGX+aYR6wXjqS69YUVEOV4wQj954aRUAt0AP1VyIqKJ
	cXV01gkR0+dimH9U0ebGng1MWxDJFMNS0DGRgaylnIW8xK+oXtdhJ14eJp/ilDIxf2whi3De/8L
	LyAXsu9ulDBO++Hn96Yzvc9+75SNBe/btAiUu002kxuihrW4Ax7pH3KFP/SJFpq9SAajoqpg0qv
	4ErHXCHsOKJCvJKzh3JXySjqGMesNDcaO3YHx4feQCrH/XYZ6tQ+Spx0KTlG6852fYyQwq7keq+
	UIzgUUbHw9AthZ9ETC+1AE5quFkU+KInVU7TydBYJA0fryQ==
X-Received: by 2002:a05:620a:4627:b0:8c6:ffe3:49e4 with SMTP id af79cd13be357-8cb8ca6e217mr1443428185a.52.1771929826630;
        Tue, 24 Feb 2026 02:43:46 -0800 (PST)
X-Received: by 2002:a05:620a:4627:b0:8c6:ffe3:49e4 with SMTP id af79cd13be357-8cb8ca6e217mr1443426885a.52.1771929826083;
        Tue, 24 Feb 2026 02:43:46 -0800 (PST)
Received: from [127.0.1.1] ([178.197.223.140])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43970d40004sm25685906f8f.21.2026.02.24.02.43.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Feb 2026 02:43:45 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH 0/4] firmware: arm_scmi: Drop fake 'const' on scmi_handle
Date: Tue, 24 Feb 2026 11:43:38 +0100
Message-Id: <20260224-handle-not-const-v1-0-90bf93b53e27@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: arm-scmi@vger.kernel.org
List-Id: <arm-scmi.vger.kernel.org>
List-Subscribe: <mailto:arm-scmi+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:arm-scmi+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIANqAnWkC/x2MQQqAIBAAvxJ7bsE2FOwr0cFyq4XQ0Igg/HvSc
 QZmXsichDMMzQuJb8kSQ4WubWDZXdgYxVcGUmQUUY9V+oMxxAuXGPKF1hmetSarrYKanYlXef7
 lOJXyAf+h7WViAAAA
X-Change-ID: 20260223-handle-not-const-9a6eb5529590
To: Sudeep Holla <sudeep.holla@kernel.org>,
        Cristian Marussi <cristian.marussi@arm.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Peng Fan <peng.fan@nxp.com>,
        Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>
Cc: arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        imx@lists.linux.dev, stable@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=2696;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=6sPDie8uUqGDS1bsA07NmZp55tMOfOGlzrz/b5hPRYY=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpnYDcRw8HWd8txJCgD3Arumeb3Kt0gJSl22Bwu
 5P16m8ME0mJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaZ2A3AAKCRDBN2bmhouD
 13RsD/0U2Kzo2qesvlrOb07YD9SW5ZCP1FxlSzAGO4KbDOGkmm5by6HPnMA2oR+qWkAfHJLNNP4
 fOvAtijr6UM7Ckd6ysYb0jQLJ9GcJzeFPY44yghOURRRRQK2i5wa7p64qcCyCp1P32kHsbj7J23
 JzXFCovKdNGyFm41w2LPX4DmdaxDO4z6tRr1QfhCaKxruQefjBuORlAMA0BOVVcA2HSxfvcvJUG
 LUsf/aiM1p7Vb7tniN3bQmUZlhF7lSDwIMfMeR5EMGhHf21vgEOYjJtQRG7ZCtm6uNMdfzR0NXO
 8nJXjDY3rhLTThDp8eig8CybDwLP0kFCNNZi3m4Ro1znCVVbOi97ZsCYhyL2t3/SYXzMioXWyHW
 X9ZdZiO73mFpyEbQveSIcUJSozDn1t2p93rirFPmZkU2rmpk24qotVBI+uTprSRal74HajfsYzr
 fm44jNBruZ3VeX0xToabjB0aOc2S1udXdwlvuP2cCA6mOYdj/25TUWPIqCPWiNCt0U4ONm+eOhs
 cZ4Ysui0ZnEhX8AupCpEl3ji3sTsVGbGVBnImrxiA3jzY6pP+XT31QKcnRrM+YDG4z0Hv1SKMzy
 SmZc5CDHJozCT12HnwAIGab+HOJg8NASzJ/UIaV8Pg7YJ9G6w5imQg22Boz+n3CrFtliY8vg70j
 u6MGUlqTSqnFg0w==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Proofpoint-ORIG-GUID: CNzS1roTBEHV5kaC6hYZoK-ps9P72Iqb
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjI0MDA4NyBTYWx0ZWRfX3ol5Qxsd9lcO
 LnvVGeY8+tWKDbh+T0HAbpzQftYJNCDlxin/j75JqslWKiSuODW/791C6kCWziHyPPskWqY8yPo
 I4e8iiXAPyGRcZtDliGnfEgHACT1KxmO6WslFZR8tMuvQ4/TdQhdn5TO+hkIMGoh9OWzObcTP3L
 6rX7WfPS925GaVDkLriAyiPh6pwQRR2c9mrzmlBsOLS4QQilv9HH4APBGC08aawDod89vzdChLB
 OqEL8NoBMJqbZ48lEyscoPQ6NEbtLHl0OXt864pbNC6O31EC3LxyNY0m5ITGrJD1aOWEt6hvREI
 JTnSnwr0W/sOoOoRY0DKPPKjN/6FSeW6DXJpaaJeV0qN10LSIQC0JNfUImO0Epkcrf9OpVfNbSF
 xThKsFrbwCqaZOdvA4bGkvuGMHZ6+VhtjrT8qsXIcolptjnbtkSvlgmQ6hIYhe1Q+T/Cj746aVb
 N7eyQ28K7UKigP2hpdw==
X-Proofpoint-GUID: CNzS1roTBEHV5kaC6hYZoK-ps9P72Iqb
X-Authority-Analysis: v=2.4 cv=WqQm8Nfv c=1 sm=1 tr=0 ts=699d80e3 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=6nO30s3o7FuWeffXwhKHTA==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=QjCKVQx7SMNC4EIcHegA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-24_01,2026-02-23_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 phishscore=0 suspectscore=0 adultscore=0
 priorityscore=1501 spamscore=0 impostorscore=0 clxscore=1015 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2602240087

Severale functions operating on the 'handle' pointer, like
scmi_handle_put() or scmi_xfer_raw_get(), are claiming it is a pointer
to const thus they should not modify the handle.  In fact that's a false
statement, because first thing these functions do is drop the cast to
const with container_of:

  struct scmi_info *info = handle_to_scmi_info(handle);

And with such cast the handle is easily writable with simple:

  info->handle.dev = NULL;

If the function really was not modifying the pointed handle, it would
use the container_of_const() call.

The code is not correct logically, either, because functions like
scmi_notification_instance_data_set() are meant to modify the data
behind the handle (in containing struct).

Best regards,
Krzysztof

---
Krzysztof Kozlowski (4):
      firmware: arm_scmi: Drop fake 'const' on scmi_handle
      firmware: arm_scmi: Drop fake 'const' on scmi_protocol_handle
      firmware: arm_scmi: Use container_of_const() on scmi_handle
      firmware: arm_scmi: Use container_of_const() on scmi_protocol_instance

 drivers/clk/clk-scmi.c                             |  2 +-
 drivers/firmware/arm_scmi/base.c                   |  2 +-
 drivers/firmware/arm_scmi/clock.c                  |  2 +-
 drivers/firmware/arm_scmi/common.h                 | 15 +++---
 drivers/firmware/arm_scmi/driver.c                 | 58 +++++++++++-----------
 drivers/firmware/arm_scmi/notify.c                 |  2 +-
 drivers/firmware/arm_scmi/perf.c                   |  2 +-
 drivers/firmware/arm_scmi/pinctrl.c                |  4 +-
 drivers/firmware/arm_scmi/power.c                  |  2 +-
 drivers/firmware/arm_scmi/powercap.c               |  2 +-
 drivers/firmware/arm_scmi/protocols.h              |  4 +-
 drivers/firmware/arm_scmi/raw_mode.c               |  4 +-
 drivers/firmware/arm_scmi/raw_mode.h               |  2 +-
 drivers/firmware/arm_scmi/reset.c                  |  2 +-
 drivers/firmware/arm_scmi/sensors.c                |  2 +-
 drivers/firmware/arm_scmi/system.c                 |  2 +-
 drivers/firmware/arm_scmi/vendors/imx/imx-sm-bbm.c |  2 +-
 drivers/firmware/arm_scmi/vendors/imx/imx-sm-cpu.c |  2 +-
 drivers/firmware/arm_scmi/vendors/imx/imx-sm-lmm.c |  2 +-
 .../firmware/arm_scmi/vendors/imx/imx-sm-misc.c    |  2 +-
 drivers/firmware/arm_scmi/voltage.c                |  2 +-
 include/linux/scmi_protocol.h                      |  2 +-
 22 files changed, 60 insertions(+), 59 deletions(-)
---
base-commit: 5848db9e2caaa560a21ce692c4c32badef3c813f
change-id: 20260223-handle-not-const-9a6eb5529590

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>


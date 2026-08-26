Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8CA43BCD3C
	for <arm-scmi@vger.kernel.org>; Wed, 26 Aug 2026 10:27:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787740062; cv=none; b=N9ma1qxTfYxBarCWLYR06DgBiDu12cDKAbJBGl7zQROC4hM3XruIxhVIglR8rwTvp6TUC9g+S+CEji+hpeoFP652PbR3EoR8k6pU4201BtDp94RdLSJI6TgZi3a5KjNvbxOFOPst+3luY7ph/Bujpyhx8uhDQt+/fteOnI/qfcc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787740062; c=relaxed/simple;
	bh=KLIlR+koIz0OfzI6bzUVYKFw5N6U8gqdkPJ1VJ8XM2I=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Dgh2+1rrfkv0rLgThLxw+dBorx4eTTQOZkKz8Msz8MdWVSiUegLsQA0W+3TduBfkTX5n8761Lo7jZZIoNQ7vOWwE0c4AeuG4H36lY7VQr92IQ9XKRj8fNKmHJxT6vBQt6J+1K7d6jGUtEtiBpjyU+MtJEbDb1iml8ElAzNsf1YI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=W+Q+4SpV; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=PbDz6f0f; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="W+Q+4SpV";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="PbDz6f0f"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67QAGXVW1209741
	for <arm-scmi@vger.kernel.org>; Wed, 26 Aug 2026 10:27:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=FqF/pFKdhvjVFIbFaRcdom011G7Oq3Fs4Hs
	sXxqokMA=; b=W+Q+4SpVqz9ejYQlSvt5l7ukSyfc5ROPRWIcw/r6+1/zD+VHomr
	yPU1pRVgMjR4iwz3+fCSC6EV3osKC2qgMO7rOIObmiUTMQuGtnLutiLi95NO5A68
	eN/7W8z7h15krKQEtgA0LpHI8/mnqPnduJAtIPUbOMHYvd3vNPsXzxQlgS9I3WGd
	Vkr7BXW5p23g+xrt+tarXk/6hEaZjGuk0GkbUiCR10S7NkLek6vwDNqR26jjEvdi
	BXUIC2KCg2bb29mgBHpsnEdIARdSh0/LMKi7D4JKDCk2I1sWNFkX60R3j1aLET9Y
	tMzUAmvjhKY4Kq+aNfIfdoCDiXqTjorQntA==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g9fgxkejc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <arm-scmi@vger.kernel.org>; Wed, 26 Aug 2026 10:27:37 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-5276aa86d00so8311901cf.2
        for <arm-scmi@vger.kernel.org>; Wed, 26 Aug 2026 03:27:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787740057; x=1788344857; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=FqF/pFKdhvjVFIbFaRcdom011G7Oq3Fs4HssXxqokMA=;
        b=PbDz6f0fD6T7aDLWbO0LZ4H+ixLBr4ZpDnO9X3e/PC4UbNh+UzNEqvuRzknBg1vgUa
         wlSg7tS86/bHRGPQ3wmvHycv+RZ//4Yh0QoSF+AStqV8P0D8Oh6nw84M8SDIfgO6zk16
         zxiJuahDTufayshoODRLKikPZxAKZgCIZL4sXX/tGjOmsv1tW5lT5UfXcgtA8Ov7WY5e
         vsF/N2AluMMWGt6EUMPzFbCSeapF4GRjQPylMaRCB3uja4hq7V4jm6yKEkZ/9cUy3YGz
         7SC87HVAKj3PYSt5T8ABKycscnpY3eKzX8DJM1sbprBOnEWjeuMjLVR0TMgqWEeJLkSh
         9kKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787740057; x=1788344857;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FqF/pFKdhvjVFIbFaRcdom011G7Oq3Fs4HssXxqokMA=;
        b=nY7B+RYXKId2YY7WRe8FIfGBdK9EeZONhuLP8j9y7n4KncL0p+NPo1fY5Maqv7H17f
         3Gc56mSWaj4EgJVscNT+bF0XH97eAQ9/zPBT87VMxbvL+D0Vnfzgd1AwOh12d5sJ5cCe
         A7qwjh9dPeL49pcWAdn0o0NgO1oow1MBFwCcICUI/N2wRwWcYFfoJw+jEku5lU45W0gX
         G+fbYDPNSOsEDB3XrLutzH/W0kTRtUcTi+0ksgESvPCe9p3vmDkkhy8b+k2kdtaLbgGT
         5t4m7hMwFgh5+0lmOSGDy34LilYb9CDJOC3mSp9HmzVc1Q/65hhMiwzRhPUH7yMgYGH2
         I9dA==
X-Forwarded-Encrypted: i=1; AHgh+RpjWUERzNjDZqk0a97r1rWRgrDcggjA7DwA1J/sdlCg7xxP9UTmYnyK5k9NCLE6eyZO3+bnbU6Hvg==@vger.kernel.org
X-Gm-Message-State: AFuF++mx8zE8APdKUJNx0SfZTO08uVVFRHghodC/hJ04T6WbL5GN5mjg
	ojmu5nF4lPohp1Pc6K3C9rQJI66vFt4EsyMLsolhcYQgMkq+SYZjkD0mKaxSjC22nSchFHO3x+O
	ybe/8cjdqRiHPjSNx0Ko5aJhlOyijpAhT0GpQ3krvbCWr8t8WNqZBytVVZfD7og==
X-Gm-Gg: AR+sD11a0D1i19e1pjGGaIEHEx7qyZbw4NAzSed4djRul9RczuWAd3m7Uavt2rj5HLT
	QiSVjl2n59gHYLiYneBStez461O7Sy74DA1nLAq2YELhX4DNPAJy+L2oDEhk0t0ipVStHZEwqMO
	HcGiNR16c/s+D9mU/JHNqU0w7DoW3MsHb5uRTlrJ0vu4VZPOPG8M42eZwcmNUlnEXizweot11nr
	b8o7badfZ7D526cZmJ1eS9GAOM1sMH+vOBhYRF8m2ne9AlEY2oAWSYNWr4pzp9CG+0T1NkwvkU/
	4rHAwSNdtUhJVaDl/fBe3mRzXgXwEAT5xtrJqazQqcBaOSDn1JO56rmWBq/4+jycoZUe/wWbEN2
	aFPufipA56tgwD5WfYX7zL0CG2V+pPDyANT1YqYCGP/ttoKG5bP2KU+qk6b+P7Djn3dT/E2tQKT
	9rZUN3mFAFQTKFwA8=
X-Received: by 2002:a05:622a:4a83:b0:52d:cf84:e98 with SMTP id d75a77b69052e-52e423a4a9amr55060821cf.33.1787740056651;
        Wed, 26 Aug 2026 03:27:36 -0700 (PDT)
X-Received: by 2002:a05:622a:4a83:b0:52d:cf84:e98 with SMTP id d75a77b69052e-52e423a4a9amr55060421cf.33.1787740056283;
        Wed, 26 Aug 2026 03:27:36 -0700 (PDT)
Received: from shalem (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c250a5d68d1sm506364966b.11.2026.08.26.03.27.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Aug 2026 03:27:35 -0700 (PDT)
From: Hans de Goede <johannes.goede@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Cristian Marussi <cristian.marussi@arm.com>,
        Sudeep Holla <sudeep.holla@kernel.org>
Cc: Hans de Goede <johannes.goede@oss.qualcomm.com>,
        Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>,
        arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-arm-msm@vger.kernel.org, imx@lists.linux.dev,
        linux-kernel@vger.kernel.org
Subject: [PATCH v4 0/3] firmware: arm_scmi: fix module auto-loading
Date: Wed, 26 Aug 2026 12:27:31 +0200
Message-ID: <20260826102734.31766-1-johannes.goede@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: arm-scmi@vger.kernel.org
List-Id: <arm-scmi.vger.kernel.org>
List-Subscribe: <mailto:arm-scmi+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:arm-scmi+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=MqZiLWae c=1 sm=1 tr=0 ts=6a8ebf99 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=Sv0fKeRqtYgA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=Um2Pa8k9VHT-vaBCBUpS:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=bC-a23v3AAAA:8
 a=7CQSdrXTAAAA:8 a=QYgjaYqrS4LJc6J_j6wA:9 a=kacYvNCVWA4VmyqE58fU:22
 a=FO4_E8m0qiDe52t0p3_H:22 a=a-qgeE7W1pNrGK8U0ZQC:22
X-Proofpoint-ORIG-GUID: VycMALoHBH8AqmPU_NHLHGpTZnftse3x
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI2MDA4NyBTYWx0ZWRfX9VULoOk7Nncb
 EhEX+e76UYLJksrvd28m0OEtOaxraLmhdAoQRMVNpDgcdYb32FC/hWN2z+p/n30l6dS7FlE5oTT
 lP1n0ZHhpw+ir6/o4fe1xHa8hdkrztRMrDDGsn7k8OyzajQir5H7WoJMmUHwMyKb8cpCQYY9g4O
 MSWfnjKfUQZ9wCeUt3//I3tsVelSxIdXJ6IcFp6cDVaamYkU51xdtCMZqr1vO6QJw+Zkv3z3SJl
 Cpmkjrxja+ZZyonVhNCamZbdMRElgqW/ojLOgybcLLMP2STJt8QXaX7WqbhzOK5VM1279enwLOv
 ZP9gMQXOC+tg47Tb7STAH/RP0ibW5XZMO9fL/pSxKZZQ3UZmfSB52r0P/z5EvdvKtSQClQA/JYN
 W0w3mpjq11l8nDt4jyLLs3H4ocicS4kDFliuhneb4nQFptD6i07HMXSCbvibC8Y5aEJHtqQdqwy
 n/lznZxnSQtFUj48YTA==
X-Proofpoint-GUID: VycMALoHBH8AqmPU_NHLHGpTZnftse3x
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI2MDA4NyBTYWx0ZWRfX9tH3sQhOSiV5
 3pCrMvdcFYpG4mEJcaQ+dNSWOKTbcYv0YWKRw9rcQTfAlN2rnwt1+MCUvzFfuMSjdIW6OWURprx
 TMtfWbOdBSGWxAyuVYpI03pGieuqCT8=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-26_03,2026-08-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0 suspectscore=0 malwarescore=0 bulkscore=0
 adultscore=0 clxscore=1015 phishscore=0 lowpriorityscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608260087

Hi All,

Here is a patch series fixing arm_scmi module autoloading this combines:

1. Patch 1/2 from Bjorn to add support for scmi bus modaliases to modpost:
https://lore.kernel.org/all/20260618-scmi-modalias-v2-1-8c7547c1be21@oss.qualcomm.com/

2. RFC 2/2 from Cristian which pre-populates the scmi { protocol, name }
tupple list with standard protocol info to break the circular dep:
https://patch.msgid.link/20250203100154.140877-2-cristian.marussi@arm.com

1. is not enough by itself because driver module auto-loading requires
the devices to already be created for udev to get the necessary uevents
based on which udev auto-loads modules.

But SCMI devices are only created after their { protocol, name } tupples
have been registered which is done from scmi_driver_register(), creating
a circular dependency.

2. breaks the circular dependency by pre-populating the { protocol, name }
list with the standard protocols. This allows the devices to be created
before the module with the driver is loaded, after which module auto
loading works the same as it does on any other bus.

I've tested this on a T14s Snapdragon laptop with Fedora's kernel config
where scmi_cpufreq is a module. With this series scmi_cpufreq correctly
autoloads even if it is not included in the initramfs.

I've added a 3th patch extending the pre-populating to also include all
the { protocol, name } tupples for the in tree SCMI drivers for IMX
vendor protocols, so that module auto-loading will work for all in tree
drivers.

Out of tree drivers can still register new tupples as before but their
modules will need to be manually loaded (also as before).

Changes in v4:
- Drop unused driver_data member from struct scmi_device_id (Uwe)
- Drop device-id/scmi.h include from mod_devicetable.h (Uwe)
- Add device-id/scmi.h to devicetable-offsets.c and file2alias.c (Uwe)

Changes in v3:
- v3 is the first series combining Bjorn and Christian's work see above.

Regards,

Hans


Bjorn Andersson (1):
  module: add SCMI device table alias support

Cristian Marussi (1):
  firmware: arm_scmi: Pre-register protocol, name tupples for standard
    protocols

Hans de Goede (1):
  firmware: arm_scmi: Pre-register protocol, name tupples for IMX
    protocols

 MAINTAINERS                       |  1 +
 drivers/firmware/arm_scmi/bus.c   | 75 +++++++++++++++++++++++--------
 include/linux/device-id/scmi.h    | 17 +++++++
 include/linux/scmi_protocol.h     |  6 +--
 scripts/mod/devicetable-offsets.c |  5 +++
 scripts/mod/file2alias.c          | 12 +++++
 6 files changed, 93 insertions(+), 23 deletions(-)
 create mode 100644 include/linux/device-id/scmi.h

-- 
2.55.0


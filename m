Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B745839F165
	for <arm-scmi@vger.kernel.org>; Thu, 20 Aug 2026 19:48:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787255339; cv=none; b=jU90hVk+mRRe0OwKpEQsDCptBnr3+1ABkT2iytiODn2q4R1YTLqnf4WSmuLnr0LmnxR8GQH67gz90EmZ7MH7p7bqC8HXAdF7s0saWX+CFOCbvnztrumkGUTNwGAqsg7MIsQ5WSPw5YgjX7HqNUc/dw/xSkcSUciYAnpoumPcknQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787255339; c=relaxed/simple;
	bh=C8tLQCcUPVyl+nU7V9GvLsHmUI3vby175dXTcf2BV9Q=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=luHogRVuquGAMWwCcvtBbXet3MhVb1uNC/c9q0ifqTaPr5zglH20UoMiunrAtW5pW/xEmApV5iDPPQL5eMuJWDs7vd09NIVWfeFtGSudG+H6QyJRj6Rxh34BM+U20qiU/FKp5MzXvzGurFncRndF70Bv37CbiPH2smacDqPO6XU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=DOWetbHj; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=TX1A5ByE; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="DOWetbHj";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="TX1A5ByE"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67KIIuir571524
	for <arm-scmi@vger.kernel.org>; Thu, 20 Aug 2026 19:48:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=x2Cmaab1c8skxG2XWMAOAO6+MfGSdVWYe9e
	RT+Q7FR0=; b=DOWetbHjIo3hBlH5OepFF2/oJtZ9sj1U5SchZFWIhPK9l2Wv4yA
	wku2TSLme2SYWGRTyUNtwtxGkUq0f8aTT8+W9YjBaFuZpOgWkwL+Rz2rvIjMt2TX
	P1zt+CMJGxoNXfLp7KzLU7+Kw4EofrpCUqYwSW3R327aMkwwJJAqqBFCsZZfZ8Jj
	fU8em8swmTbbBkz0MJJ0YhWmzRC8HZXDhFL8dNdMIL3hgoQscfu/mUTM+hg9R8v7
	G5QZ4bXXVccc8858rLayGlRBhA3r6dA0wkJQmHmIStKX8ooYO1ISX9h+rDYa2afT
	Qt3SZFMXTU9KJRmo4htp0GnEV5FMMgZEKYA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g5xgcb0cf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <arm-scmi@vger.kernel.org>; Thu, 20 Aug 2026 19:48:56 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-92e5e38fbc5so25399585a.2
        for <arm-scmi@vger.kernel.org>; Thu, 20 Aug 2026 12:48:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787255336; x=1787860136; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=x2Cmaab1c8skxG2XWMAOAO6+MfGSdVWYe9eRT+Q7FR0=;
        b=TX1A5ByEB1X6UFhRJD6IlQBRNNJIdrVHQISWkkFprXeII7p+2Nr2H/7+OHakB3UmE0
         KdRd+Nc6eT2uZQPuv9ds1lAju9NFDJKC2bxkbdNH+gNafzv2tD7CmdMXlxSf1RAp+fke
         Ay6OWKl+ueI7i9NH2FYEleyWc+cvFsqm6VEoIuX2sp0Y0A5CvFA9bDO/mrAiGyTNvOu4
         qMXBiYOkIIymQvfUGF0y25fvszeN1gfA40yX9vWC1zx+09CYCkP4yAts2DnRmz92pAXA
         7VI2EcYwRoRGY4vxBGE1bNKf9j/XS4TqsgFNcrm1FFLzRlHMu7SFf2NTk8PuJYnoQjaE
         lIBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787255336; x=1787860136;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=x2Cmaab1c8skxG2XWMAOAO6+MfGSdVWYe9eRT+Q7FR0=;
        b=P1b3BEtlKqyETzHDInWKrhmeSwAM+iIE+TAe7+CtA7sACAWXzBT5KAGLcsbOFEp0kb
         vJkFtU67MdJuaQXIfp/qNSQS2yWUXkfujo0/aFnW8ghEUipI+JznnlPaReHvTyfojwdF
         q1Ss2TXTtQn7XFYDRxe2pXiQUbJ7Y1bWX69Z4JUEfBgBMup9We8Dz5L0BZDjtM1yblIm
         4SgywQt2EJqkAcP7gMgEdISkLYVBXK4212XU2y/+/p9yNm/nUheSO9pPQjiwrObKYNLx
         CNydsQUDNOJYXkfqOxP0xNOZhmm8mR4N0CF5khtB3jmwqDce8vNIGfadZbq1iBbaiIZ+
         nmYg==
X-Forwarded-Encrypted: i=1; AHgh+RoA+JIa4Z+QzLQVyJCu85mQHja1V8if8iotuuGJOYI3BTjvjnQUSVqs4MI6PGY7dXjRh5WUX/YuHg==@vger.kernel.org
X-Gm-Message-State: AOJu0YxAC+KwHevC7cc97fUONlaut7pj6wq/02IXxARdlQWvL9/g2Wx7
	t+rGixxEmsT436uQrLhfk8IV7EOe6F/WNDfeE/3NO44JzUjNJUrn4m2WESaM/9fLH/bVmPrIKfQ
	xtgVe7FgszVjzQ9Yop2hNLOwyE742wolvP6PYo5ki0xeDvAiV+D97V1VuOstXjg==
X-Gm-Gg: AR+sD11mDqxu/lrO4mMsB3LjcXb8zSe/TkUYs32jj25F7AaddIeuPhGcpiqfTtGMrDR
	0bC/fYjvfpRTTXhxyzuLlepuL4+W2OHtegVWKzm9xzhGbBJAVSRfY1J3KoypALRkAYiC6hoAr6B
	lxjUFmHg+nLGifMrJOxbBl4QJcEdWk+BYpz5ZLOTMSr8Po/ktMxzj0kw3792HdSw8TmM1cWh+Rc
	WGvdiWoGRHKp0McuInPpi7dahkdbdEZaVXHQC+v3+m3wwDPiN6aShfRh15ooLsbDP0zGQ3hkHe0
	82y4glmztoCYhrlEBdspVzYUPbIPBUDM+LZU/W7lJedZboSAJ/ap4gsO3guXHJcgWH5IoPQcFzr
	sypiExoUZLrEv
X-Received: by 2002:a05:620a:319e:b0:936:ea3d:9313 with SMTP id af79cd13be357-93739497c75mr56867185a.20.1787255334995;
        Thu, 20 Aug 2026 12:48:54 -0700 (PDT)
X-Received: by 2002:a05:620a:319e:b0:936:ea3d:9313 with SMTP id af79cd13be357-93739497c75mr56863585a.20.1787255334517;
        Thu, 20 Aug 2026 12:48:54 -0700 (PDT)
Received: from shalem ([2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2459198ec5sm113433266b.34.2026.08.20.12.48.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Aug 2026 12:48:53 -0700 (PDT)
From: Hans de Goede <johannes.goede@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Cristian Marussi <cristian.marussi@arm.com>,
        Sudeep Holla <sudeep.holla@kernel.org>
Cc: Hans de Goede <johannes.goede@oss.qualcomm.com>,
        Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>,
        arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-arm-msm@vger.kernel.org, imx@lists.linux.dev,
        linux-kernel@vger.kernel.org
Subject: [PATCH v3 0/3] firmware: arm_scmi: fix module auto-loading
Date: Thu, 20 Aug 2026 21:48:47 +0200
Message-ID: <20260820194850.459739-1-johannes.goede@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: arm-scmi@vger.kernel.org
List-Id: <arm-scmi.vger.kernel.org>
List-Subscribe: <mailto:arm-scmi+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:arm-scmi+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=GPM41ONK c=1 sm=1 tr=0 ts=6a875a28 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=Sv0fKeRqtYgA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=Um2Pa8k9VHT-vaBCBUpS:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=bC-a23v3AAAA:8
 a=7CQSdrXTAAAA:8 a=QYgjaYqrS4LJc6J_j6wA:9 a=bTQJ7kPSJx9SKPbeHEYW:22
 a=FO4_E8m0qiDe52t0p3_H:22 a=a-qgeE7W1pNrGK8U0ZQC:22
X-Proofpoint-ORIG-GUID: 4gKBYsNI9dothfyzUqPvTTR4Z5wz5I0h
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODIwMDE0OSBTYWx0ZWRfX/skyCaDqw0P7
 oITOhLat9wjrVlqvK2qnmRonLmtgpTQ+v3MRI28Eel6Rwra3kfGQsQlxzreDFzocJqm1b9hzbQq
 U5PhTkF4KNSEgyIcE5z4c9Vw0owzTbOAlyfEttMAHd1by4+IevGeqgvPlecD7j7fpnBSO1NmoOw
 jfHs7ngp+NldJYjngt8bbigdhlCBFKNiGYR5h3w8aX2ICeXnfdIEg6aM6oEbYTIjwfhECfzXOVG
 6HDH4/PaDvDVNK9WMWI4Q/P/6emnk8mRcuQ3Uq02d4bTrvuGNHrN1lZYDtQIMG3OfAD29rFrm4V
 BJ/3myBX6KfqO3qU7Hdo1Oom/nK5SnWQFGfwnFC3KyHZR6bVK5HBCwRmPheHNkeqNHSqR8qsHSr
 ux7XXoemlIUKwX0EQxnyWmVDLrAEBDt8lNNYXl182E7okSWpW4EeA/MzQ9AunWKwz/DY7oe+0Mc
 cJadmnOZO3FG3c9ouyg==
X-Proofpoint-GUID: 4gKBYsNI9dothfyzUqPvTTR4Z5wz5I0h
X-Proofpoint-Spam-Info: AW1haW4tMjYwODIwMDE0OSBTYWx0ZWRfXysXe8Go5FEab
 8+/me4mPkT0gR6Xrz0H3twiEpEVgFCQeZMA2BkYXF1/vqpL+3U394RzLvBQpvHuv8e7EzqEen92
 aSmvrSDePxd1/IQUtgnF4z3c1jX83dg=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-20_01,2026-08-20_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 priorityscore=1501 spamscore=0 clxscore=1015 impostorscore=0
 lowpriorityscore=0 suspectscore=0 phishscore=0 malwarescore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608200149

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
 include/linux/device-id/scmi.h    | 19 ++++++++
 include/linux/mod_devicetable.h   |  1 +
 include/linux/scmi_protocol.h     |  6 +--
 scripts/mod/devicetable-offsets.c |  4 ++
 scripts/mod/file2alias.c          | 11 +++++
 7 files changed, 94 insertions(+), 23 deletions(-)
 create mode 100644 include/linux/device-id/scmi.h

-- 
2.55.0


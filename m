Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5F643F23B6;
	Wed,  8 Jul 2026 07:24:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783495456; cv=none; b=RyvqTE6K57R2k+OcYHTd0s2PK+CghKIL3dF28Dx2Ziab4evB/4/iBqdnIqViRIBlx6mXVwEZdypKkeMzMGm5zcIkiTTmXvgYzfjAK0bYL6mPvxWxTyAU6SMMm9ShiDObrO+CMIwaItKbWCzoZfrbjvEnmUovS54iRBAfAHKvMVE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783495456; c=relaxed/simple;
	bh=fufk7HfefIX5J/h38j39xTQON9Gh9fw+EwL/zfaHoo8=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=L+a4inNYvQ4+bWn8JNJ0x5/evQRvHksxYH5x9l2Dqb28UEAUZpAUi0tilnjMgHywvP84rqt6qNjdiliD2hslcxqvD2yOOV6xE5DWQdaWTRTpmG/QY6xA10snc78gzmUh2hvCrq2/dH5ycnJeEfxluMWFkmmJhO6OzCE4qcL7jKk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=UZ8CTv7s; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="UZ8CTv7s"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 668429g91656437;
	Wed, 8 Jul 2026 07:23:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=ZnmnBCrjGVsWqSF63EiwjA1gw4cqJHz9fjt
	HdnFR9RA=; b=UZ8CTv7s5BLrHe/9WVlP5MEdal8HtcKDP3xKDPMTYNlqVixs4ZP
	lOfmtu7NQryxvNHkpEdFHsSMEAiuADoVFYUDZtletK/N5Ns1Nl54Fb36po/mh4r/
	bpHU5u8ClvEGnbMsMIGgHABXoeFMTkRPkxNIbjV6hRXWw7hL1mTMe1xI5IJzuKCF
	2HRcaERcnH6uQ3FKwjUQpkLFwv1sQFnrNkB5NgvYDprWw8j1EufhDplBMTdNWk58
	J8vQbiCURag+tvIuc8MoD+WKnWM4V5P7RmWPOK9pedlw4MJ4xz0Po5J+dNGqRlty
	IBMtZ2AsWRztjDEuRPTn2WhDxbazzgJYYcQ==
Received: from apblrppmta02.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f9csss82s-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 08 Jul 2026 07:23:51 +0000 (GMT)
Received: from pps.filterd (APBLRPPMTA02.qualcomm.com [127.0.0.1])
	by APBLRPPMTA02.qualcomm.com (8.18.1.7/8.18.1.7) with ESMTP id 6687Nm6n002944;
	Wed, 8 Jul 2026 07:23:48 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APBLRPPMTA02.qualcomm.com (PPS) with ESMTPS id 4f6u8ke5n7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 08 Jul 2026 07:23:48 +0000 (GMT)
Received: from APBLRPPMTA02.qualcomm.com (APBLRPPMTA02.qualcomm.com [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.1.12) with ESMTP id 6687NmLF002939;
	Wed, 8 Jul 2026 07:23:48 GMT
Received: from hu-devc-hyd-u22-c.qualcomm.com (hu-pussin-hyd.qualcomm.com [10.147.247.182])
	by APBLRPPMTA02.qualcomm.com (PPS) with ESMTPS id 6687Nm8Y002938
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 08 Jul 2026 07:23:48 +0000 (GMT)
Received: by hu-devc-hyd-u22-c.qualcomm.com (Postfix, from userid 4706513)
	id 7A25763C; Wed,  8 Jul 2026 12:53:47 +0530 (+0530)
From: Pushpendra Singh <pushpendra.singh@oss.qualcomm.com>
To: sudeep.holla@kernel.org
Cc: cristian.marussi@arm.com, arm-scmi@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        Pushpendra Singh <pushpendra.singh@oss.qualcomm.com>
Subject: [PATCH] firmware: arm_scmi: rate-limit queue-full warnings in IRQ context
Date: Wed,  8 Jul 2026 12:53:39 +0530
Message-Id: <20260708072339.3021140-1-pushpendra.singh@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: arm-scmi@vger.kernel.org
List-Id: <arm-scmi.vger.kernel.org>
List-Subscribe: <mailto:arm-scmi+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:arm-scmi+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Authority-Analysis: v=2.4 cv=EtziaycA c=1 sm=1 tr=0 ts=6a4dfb07 cx=c_pps
 a=Ou0eQOY4+eZoSc0qltEV5Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=RAioF0-LDSMA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8 a=dPwN2nIJ5BbuoenhFM4A:9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA4MDA2OSBTYWx0ZWRfX290pA1Facwn2
 KNtWMhPaf7UkIc0aIqpyPKVZ3u9k9kFtNo+vh6+jqTJetWgNmKHaRYPeUkGvT3LLvfgUf1WZzOc
 c7KQsS2dEkKM2bzwg0F3km5DBpsBezVQUqjYlKvFkiVjOA8TjJ9Cq5sV5ZTulR1uFab8bcC9DKT
 AeznWhxRdiT7vpIFXciSEOLUnJ0dNA0vR6S5eSEV+DmPkPt1Pa4Io7qwO91PLaPG+UXEHT51zQE
 4SQ/tIsqNi2SspD3PcXVM5g1I1M+DDtjf02qE/5G0ExvhV4CKMaBOVvNkqh4SD/ajFiq0aJVwWM
 /KIEjiXfTXTG3SdeaI+pNPVc4klZDO8w/mRjeYzN+NktfHUwAiETHvSdCNPwHJTMwnCsSZ0+6Jn
 akEHvS6m6WqpGSKZY8ZJvX9ZBR6+iCdML5QpbENmSaNBnDHKdvQ17+A3Zng6caHy85gZEq1ajZd
 2eb/0qKPpA1zPnWK3HA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA4MDA2OSBTYWx0ZWRfX5rl7+kh7hLY+
 JEzEYYx+EDfpbvKjpNhtwgE91CsVY645PpsvSQGrjQdG8jM0aX4lWyEcCQKDxzTQg2s3xFdteco
 rkmOiLK1wO3U43Lfle3zDvzW5BtjLvo=
X-Proofpoint-GUID: SsuvXU2H3BGD5_mjpEAKmNtKGWK32AGo
X-Proofpoint-ORIG-GUID: SsuvXU2H3BGD5_mjpEAKmNtKGWK32AGo
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-07_06,2026-07-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 lowpriorityscore=0 malwarescore=0 phishscore=0
 priorityscore=1501 clxscore=1011 suspectscore=0 bulkscore=0 impostorscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607080069

The scmi_notify() function is called from interrupt context
to queue received notification events onto a per-protocol
kfifo. When the kfifo is full, it logs a warning via dev_warn()
for every dropped event.

Under conditions where the platform sends a burst of SCMI
notifications faster than the deferred worker can drain the
queue, this results in a flood of dev_warn() calls from
IRQ context. Each call acquires the console lock and may
execute blocking console writes, causing the CPU to be held
in interrupt context for an extended period and leading to
observable system stalls.

Fix this by switching to dev_warn_ratelimited() to limit the
frequency of log messages when the notification queue is full.
This reduces console overhead in interrupt context and prevents
CPU stalls caused by excessive logging, while still preserving
diagnostic visibility.

Signed-off-by: Pushpendra Singh <pushpendra.singh@oss.qualcomm.com>
---
 drivers/firmware/arm_scmi/notify.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/firmware/arm_scmi/notify.c b/drivers/firmware/arm_scmi/notify.c
index 40ec184eedae..574f368033ae 100644
--- a/drivers/firmware/arm_scmi/notify.c
+++ b/drivers/firmware/arm_scmi/notify.c
@@ -600,7 +600,7 @@ int scmi_notify(const struct scmi_handle *handle, u8 proto_id, u8 evt_id,
 		return -EINVAL;
 	}
 	if (kfifo_avail(&r_evt->proto->equeue.kfifo) < sizeof(eh) + len) {
-		dev_warn(handle->dev,
+		dev_warn_ratelimited(handle->dev,
 			 "queue full, dropping proto_id:%d  evt_id:%d  ts:%lld\n",
 			 proto_id, evt_id, ktime_to_ns(ts));
 		return -ENOMEM;
-- 
2.34.1


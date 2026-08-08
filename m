Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 995C0345EA4;
	Sat,  8 Aug 2026 19:12:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786216367; cv=none; b=QTuCrjNqtZ9I+rMFiy1twTpcxr04cfIpgz5wdqmMDoIchKm3yd4fpveWcox7L1X0+Rtn5lQDka2lcO2WYOa3WAj8V5KXBFu+IXrJfRXWCoQ+8ygMMhWVSF35uxVisT+sQ+g+izfahr3ibpBbb09M8az2lPFyPb3GPEVcHf/RJNU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786216367; c=relaxed/simple;
	bh=PJo0e87K0b7aftzvRmzyQXJCTjcTrGX4WcEBc3ZkxnU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=M00b6/gDdMcI2byyFP/lsVoxKcAdIJFcuEJc9cS+IbGsTZNYQzYQjHJtAlr4IFrsDvSOGnLLtrv6bVsXL+JswJMEFKcx0dZn7rhGXlfnGKTiGjP6xEMRQxxnQDvn7gkbwz4nRPJgB/ipsInrKt3a/ys9B34MAAOGbUjn5yvHDgs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=CmzlonLm; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="CmzlonLm"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 10619152B;
	Sat,  8 Aug 2026 12:12:41 -0700 (PDT)
Received: from pluto.fritz.box (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 11BD13F86F;
	Sat,  8 Aug 2026 12:12:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1786216365; bh=PJo0e87K0b7aftzvRmzyQXJCTjcTrGX4WcEBc3ZkxnU=;
	h=From:To:Cc:Subject:Date:From;
	b=CmzlonLmlBpocoeLxHVMGseJiXq5FWo3bMzAaATrmY8xYkC6cFmVX5G+/c5HKhoab
	 pJcpBl+5pZ8f/5pxzQr8fjzyQEhbNphlCDII6P6Q9CfdVcDuGRPV/BlHO3GKGcnhOt
	 AqB8IBz2JvGRbHRYrJqVGDGbgb5WBvxgioMLB5kQ=
From: Cristian Marussi <cristian.marussi@arm.com>
To: linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	arm-scmi@vger.kernel.org
Cc: sudeep.holla@kernel.org,
	cristian.marussi@arm.com
Subject: [PATCH] include: trace: Use string helpers in msg_dump trace events
Date: Sat,  8 Aug 2026 20:12:34 +0100
Message-ID: <20260808191234.402312-1-cristian.marussi@arm.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: arm-scmi@vger.kernel.org
List-Id: <arm-scmi.vger.kernel.org>
List-Subscribe: <mailto:arm-scmi+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:arm-scmi+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Use proper available ftrace macros to handle tag strings of variable size,
to avoid wasting space using statically oversized arrays while risking to
expose stale stack data when such array is not properly padded when filled.

Signed-off-by: Cristian Marussi <cristian.marussi@arm.com>
---
 include/trace/events/scmi.h | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/include/trace/events/scmi.h b/include/trace/events/scmi.h
index 703b7bb68e44..b421c253df00 100644
--- a/include/trace/events/scmi.h
+++ b/include/trace/events/scmi.h
@@ -7,8 +7,6 @@
 
 #include <linux/tracepoint.h>
 
-#define TRACE_SCMI_MAX_TAG_LEN	6
-
 TRACE_EVENT(scmi_fc_call,
 	TP_PROTO(u8 protocol_id, u8 msg_id, u32 res_id, u32 val1, u32 val2),
 	TP_ARGS(protocol_id, msg_id, res_id, val1, val2),
@@ -156,7 +154,7 @@ TRACE_EVENT(scmi_msg_dump,
 		__field(u8, channel_id)
 		__field(u8, protocol_id)
 		__field(u8, msg_id)
-		__array(char, tag, TRACE_SCMI_MAX_TAG_LEN)
+		__string(tag, tag)
 		__field(u16, seq)
 		__field(int, status)
 		__field(size_t, len)
@@ -168,7 +166,7 @@ TRACE_EVENT(scmi_msg_dump,
 		__entry->channel_id = channel_id;
 		__entry->protocol_id = protocol_id;
 		__entry->msg_id = msg_id;
-		strscpy(__entry->tag, tag, TRACE_SCMI_MAX_TAG_LEN);
+		__assign_str(tag);
 		__entry->seq = seq;
 		__entry->status = status;
 		__entry->len = len;
@@ -177,7 +175,7 @@ TRACE_EVENT(scmi_msg_dump,
 
 	TP_printk("id=%d ch=%02X pt=%02X t=%s msg_id=%02X seq=%04X s=%d pyld=%s",
 		  __entry->id, __entry->channel_id, __entry->protocol_id,
-		  __entry->tag, __entry->msg_id, __entry->seq, __entry->status,
+		  __get_str(tag), __entry->msg_id, __entry->seq, __entry->status,
 		__print_hex_str(__get_dynamic_array(cmd), __entry->len))
 );
 #endif /* _TRACE_SCMI_H */
-- 
2.54.0


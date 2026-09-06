Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0DCE03B47F4;
	Sun,  6 Sep 2026 10:07:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788689255; cv=none; b=n1vSlFAXFZKW+KmgrbzCBMXlNAlHFePfZAhfLJ+1NDdEB7PdZuStsLFuj21Fs+JZDxAqkXge8MWKBYZc/ysxa2kjn/1xSyGtfshwc+ilaP//yBIAJd5yYaPfY25pP+5Es/WKG3MNf5ePFlIm7h5AMatjkcO+M9CG6qNoYitVw2Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788689255; c=relaxed/simple;
	bh=5P9ZuvQ/38HQaH48tpNZsAjPLPf474W8M/GUNsIkNhg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=WL1BggPMkUfRbrvNsjsUhP+XNGoETUtVgPVClbeNKGfdZ3Ce24uh6TJT+sihGLsgnoJ4DZs2lmHbWiw+IVsK2D8Yqrr09x8oSAef8+iPU2QHbNBRwo+pL58dluF6RfRhLf9KKwSvdwxjq7OCoRa0Iz3ROG4tvk9S8IUB16xt58k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=LjZEViTI; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="LjZEViTI"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 4D61F1A2D;
	Sun,  6 Sep 2026 03:07:28 -0700 (PDT)
Received: from pluto (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 1741E3F7D8;
	Sun,  6 Sep 2026 03:07:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1788689252; bh=5P9ZuvQ/38HQaH48tpNZsAjPLPf474W8M/GUNsIkNhg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=LjZEViTIgdml4TqU99WQOCpNhJIg2GrYtVmHPwcChCv5t1vKtnitESTXnVvA2q0YT
	 ttJmaV/ze248z8mW+adTi+hQvkYtiZtx9PooYAElqm5Xd/QJK0X7o460ym/8MyunmT
	 rRVqNP8zPMkvTeaHfmsOLNXM9i8lgc8wRWHbYL88=
From: Cristian Marussi <cristian.marussi@arm.com>
To: linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	arm-scmi@vger.kernel.org,
	linux-doc@vger.kernel.org
Cc: sudeep.holla@kernel.org,
	james.quinlan@broadcom.com,
	f.fainelli@gmail.com,
	vincent.guittot@linaro.org,
	etienne.carriere@st.com,
	peng.fan@oss.nxp.com,
	michal.simek@amd.com,
	d-gole@ti.com,
	jic23@kernel.org,
	elif.topuz@arm.com,
	lukasz.luba@arm.com,
	philip.radford@arm.com,
	david@kernel.org,
	souvik.chakravarty@arm.com,
	leitao@kernel.org,
	kas@kernel.org,
	puranjay@kernel.org,
	usama.arif@linux.dev,
	kernel-team@meta.com,
	Cristian Marussi <cristian.marussi@arm.com>
Subject: [PATCH v11 05/25] include: trace: Add Telemetry trace events
Date: Sun,  6 Sep 2026 11:06:03 +0100
Message-ID: <20260906100623.3488327-6-cristian.marussi@arm.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260906100623.3488327-1-cristian.marussi@arm.com>
References: <20260906100623.3488327-1-cristian.marussi@arm.com>
Precedence: bulk
X-Mailing-List: arm-scmi@vger.kernel.org
List-Id: <arm-scmi.vger.kernel.org>
List-Subscribe: <mailto:arm-scmi+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:arm-scmi+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add custom traces to report Telemetry failed accesses and to report when DE
values are updated internally after a notification is processed.

Signed-off-by: Cristian Marussi <cristian.marussi@arm.com>
---
v7 --> v8
 - use proper FTRACE helpers for variable strings
---
 include/trace/events/scmi.h | 45 +++++++++++++++++++++++++++++++++++++
 1 file changed, 45 insertions(+)

diff --git a/include/trace/events/scmi.h b/include/trace/events/scmi.h
index 703b7bb68e44..002d2bc9ae15 100644
--- a/include/trace/events/scmi.h
+++ b/include/trace/events/scmi.h
@@ -180,6 +180,51 @@ TRACE_EVENT(scmi_msg_dump,
 		  __entry->tag, __entry->msg_id, __entry->seq, __entry->status,
 		__print_hex_str(__get_dynamic_array(cmd), __entry->len))
 );
+
+TRACE_EVENT(scmi_tlm_access,
+	TP_PROTO(u64 de_id, unsigned char *tag, u64 startm, u64 endm),
+	TP_ARGS(de_id, tag, startm, endm),
+
+	TP_STRUCT__entry(
+		__field(u64, de_id)
+		__string(tag, tag)
+		__field(u64, startm)
+		__field(u64, endm)
+	),
+
+	TP_fast_assign(
+		__entry->de_id = de_id;
+		__assign_str(tag);
+		__entry->startm = startm;
+		__entry->endm = endm;
+	),
+
+	TP_printk("[%s] de_id=0x%llX - startm=%016llX endm=%016llX",
+		  __get_str(tag), __entry->de_id, __entry->startm, __entry->endm)
+);
+
+TRACE_EVENT(scmi_tlm_collect,
+	TP_PROTO(u64 ts, u64 de_id, u64 value, unsigned char *tag),
+	TP_ARGS(ts, de_id, value, tag),
+
+	TP_STRUCT__entry(
+		__field(u64, ts)
+		__field(u64, de_id)
+		__field(u64, value)
+		__string(tag, tag)
+	),
+
+	TP_fast_assign(
+		__entry->ts = ts;
+		__entry->de_id = de_id;
+		__entry->value = value;
+		__assign_str(tag);
+	),
+
+	TP_printk("[%s] ts=%llu de_id=0x%04llX value=%016llu",
+		   __get_str(tag), __entry->ts, __entry->de_id, __entry->value)
+);
+
 #endif /* _TRACE_SCMI_H */
 
 /* This part must be outside protection */
-- 
2.54.0


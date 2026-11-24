Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795549839;
	b=r0aLK6q3xuMyNyOFGK/SB7ATQxqB4+29f5y46ARnGjNpASP4xgAEZRkKwBQB1sLmvLj3
	 AFkAkZUlwaT0g+0aLalLemJ7Fv52SnkqWo0IAYUZ1lVCBN6EAlYaewTb2msXMTPuTGCKW
	 w4tghqYOXzc4MVxoAd7Vo9Wx4E9o03X6VvgSqt7GEnDHlw9VbZ1P3ELFdk4XLfwvC0nW4
	 khHV7aJgdCeqNyDOi+hvkStHiCvJJLz9xsXBh3+YUZAqs/3MHh94QdclUl4D5e4Ol5BrY
	 IWtV5X7H1a+pgyHhHz3t3wmZHSSyM50dnR+LGTNOu2Jog9XuxSFaesZVNj3PjK98h8A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795549839;
	h=DMARC-Filter:Received:Received:DKIM-Signature:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=qECIJQpjfuH1ZjZJ/r1/HeSCxlIyRoe7mrKRIpv1eYs=;
	b=Eopyck+gjbZjpAt7RXoZmm3eLIiP70UoagtOS7S231TwYL44IQTrqLtig1dBv2flexlz
	 P0MfaXO7cbWIv0HelENpHwTW1tmhR6kLoIWnd6fCwl3k5Tp8QRrvTbIqK4W3ya7LLlers
	 Vnwinm0gWeqSFqg10Cog3+zfnlUwFDGLQwy2gEEME6VREKvsZu5Yp0421QPlRNvcvFnOO
	 Wkv6gpgBasYYCVOAeFmXLiCTu7zasODoC5Rpn33v4R35txye4ed6zycO2nwzndfff91sx
	 T7W2OWX769M1OnamuvXlluf80NTWLy6jtDGhtHv7x9059pKmjluLHQbeSlcHD2jsLUg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=arm.com;
	spf=pass smtp.mailfrom=arm.com;
	dkim=pass header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b="tCVuD/1C";
	arc=none smtp.remote-ip=217.140.110.172
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 012B3606A323;
	Tue, 24 Nov 2026 19:50:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 012B3606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=tCVuD/1C
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 7E6AA497;
	Tue, 24 Nov 2026 11:50:35 -0800 (PST)
Received: from pluto.guest.local (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 8E6C13F763;
	Tue, 24 Nov 2026 11:50:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1795549838; bh=/SQydrJmcQbyexqcY63QR4hJ8qgiHzXl7qLMR3pL2Cc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=tCVuD/1C+E0CEtwigo3CyzjpCkIzggnVs5gvep3MWRqrwK2OdplPwT2sYtQapVgeO
	 p94PVIN+TUKywlpIly1pyOtQAgv9B+UCBkpIOWk8jCz0AEPJyBkG8iCv0eeGCMAIWc
	 U5p5HpFOH8dMgsHZ1tBeg+jUgvxD8MsDn3NTlrgI=
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
	jonathan.cameron@oss.qualcomm.com,
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
Subject: [PATCH v17 10/34] include: trace: Add Telemetry trace events
Date: Tue, 24 Nov 2026 19:48:16 +0000
Message-ID: <20261124194841.1147072-11-cristian.marussi@arm.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261124194841.1147072-1-cristian.marussi@arm.com>
References: <20261124194841.1147072-1-cristian.marussi@arm.com>
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

Add custom traces to report Telemetry accesses and collection events.

Reviewed-by: Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>
Signed-off-by: Cristian Marussi <cristian.marussi@arm.com>
---
v12 --> v13
 - better commit message
 - use const char where required
v7 --> v8
 - use proper FTRACE helpers for variable strings
---
 include/trace/events/scmi.h | 45 +++++++++++++++++++++++++++++++++++++
 1 file changed, 45 insertions(+)

diff --git a/include/trace/events/scmi.h b/include/trace/events/scmi.h
index b421c253df00..ae63a13fd141 100644
--- a/include/trace/events/scmi.h
+++ b/include/trace/events/scmi.h
@@ -178,6 +178,51 @@ TRACE_EVENT(scmi_msg_dump,
 		  __get_str(tag), __entry->msg_id, __entry->seq, __entry->status,
 		__print_hex_str(__get_dynamic_array(cmd), __entry->len))
 );
+
+TRACE_EVENT(scmi_tlm_access,
+	TP_PROTO(u64 de_id, const char *tag, u64 startm, u64 endm),
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
+	TP_PROTO(u64 ts, u64 de_id, u64 value, const char *tag),
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


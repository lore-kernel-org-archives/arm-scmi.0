Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25ED63A4F32
	for <arm-scmi@vger.kernel.org>; Wed,  1 Jul 2026 19:59:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782935976; cv=none; b=cOZ5MlFEu2iIV6DnN7ljO406/37jlgUJVqxXTB1Hb3YDr01Wu97OhqoUHUijMV1yOgMdXhjVqQu1oI55BbuNkvCqXafmQr3ZWTFF4plWu6uEtGc7XEi2f1Vkugi1xxos9EE6R9rvDCLkNaKFgtnTB5OVf4SDoDJEgORTl7p6q9Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782935976; c=relaxed/simple;
	bh=jhsE3phK56GnfXkz8vX5UjW/dkujz1nN8CKgqHCgxYA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:content-type; b=J33+oqTt09SkNiK4AcVdNe48GvgtVGDAMzSptSe6sW8uEsjPh6C3zVfVdvxIkDLj20jJ5jm2z0878F/Xtn+2ILehCMKPzdYHMjvxGiQO9Yh9hjbGy6aGCDcMfDiT6XEibt3d860qGQ6Y+Hy5tjnDaBoTQVrR+mADk6M7peQ7OAI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=M4Qrjo9+; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="M4Qrjo9+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1782935971;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=3Ms/Lm3glLtAQbh7R8PlfKB/uaxb6UHsWQYOzJ5vMLM=;
	b=M4Qrjo9+LKm/0rYJJblOPEpTKnZG4SJ7oI/ea/x9sd0alYNJSczv2bhSx5prITVzHgOt5f
	vkZy5/3vpAwW8VA718ekmVCqCXCIDTDNmd2ivjl7fCaFQu3l4ANjVo1gBZ8F4eur8CmZ1O
	xmPaOevJVmRGF3aaJ61W04jRQlqbtTA=
Received: from mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-668-FobhcWmuNg-wQwkGAARM4w-1; Wed,
 01 Jul 2026 15:59:28 -0400
X-MC-Unique: FobhcWmuNg-wQwkGAARM4w-1
X-Mimecast-MFC-AGG-ID: FobhcWmuNg-wQwkGAARM4w_1782935967
Received: from mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 3CBF91808978;
	Wed,  1 Jul 2026 19:59:27 +0000 (UTC)
Received: from shire.redhat.com (unknown [10.22.89.24])
	by mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 18CC830001BE;
	Wed,  1 Jul 2026 19:59:25 +0000 (UTC)
From: sdunnaga@redhat.com
To: Sudeep Holla <sudeep.holla@kernel.org>
Cc: Cristian Marussi <cristian.marussi@arm.com>,
	arm-scmi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Steve Dunnagan <sdunnaga@redhat.com>
Subject: [PATCH] firmware: arm_scmi: Use 64-bit division for clock rate rounding
Date: Wed,  1 Jul 2026 15:59:20 -0400
Message-ID: <20260701195923.444270-1-sdunnaga@redhat.com>
Precedence: bulk
X-Mailing-List: arm-scmi@vger.kernel.org
List-Id: <arm-scmi.vger.kernel.org>
List-Subscribe: <mailto:arm-scmi+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:arm-scmi+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.4
X-Mimecast-MFC-PROC-ID: q1Hw_XeazT36dfT4X3oA0PiOQuHqwhbOTaKWMK6WXaI_1782935967
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true

From: Steve Dunnagan <sdunnaga@redhat.com>

SCMI clock range descriptors report rates as 64-bit values. When handling
a range clock, scmi_clock_determine_rate() rounds the requested rate up to
the next supported step using the SCMI RATE_STEP value.

The current code uses div64_ul() for this calculation. Since div64_ul()
takes an unsigned long divisor, the 64-bit RATE_STEP value can be truncated
on 32-bit builds. In the worst case, a non-zero 64-bit step can be narrowed
to zero before the division.

Store RATE_STEP in a u64, reject a malformed zero step, and use
DIV64_U64_ROUND_UP() so the divisor is handled as a 64-bit value.

This does not change behavior for valid firmware reporting a non-zero step
that fits in unsigned long.

Tested on Xunlong Orange Pi 5 Plus / RK3588 with SCMI over SMC. SCMI
clocks probed successfully before and after the change. SCMI-backed CPU
clocks were exercised through cpufreq-dt by switching each CPU policy
between its lowest and highest available OPP.

Signed-off-by: Steve Dunnagan <sdunnaga@redhat.com>
---
 drivers/firmware/arm_scmi/clock.c | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)

diff --git a/drivers/firmware/arm_scmi/clock.c b/drivers/firmware/arm_scmi/clock.c
index 42e666a628c7..0278705d809e 100644
--- a/drivers/firmware/arm_scmi/clock.c
+++ b/drivers/firmware/arm_scmi/clock.c
@@ -718,7 +718,7 @@ static int scmi_clock_rate_set(const struct scmi_protocol_handle *ph,
 static int scmi_clock_determine_rate(const struct scmi_protocol_handle *ph,
 				     u32 clk_id, unsigned long *rate)
 {
-	u64 fmin, fmax, ftmp;
+	u64 fmin, fmax, ftmp, step;
 	struct scmi_clock_info *clk;
 	struct scmi_clock_desc *clkd;
 	struct clock_info *ci = ph->get_priv(ph);
@@ -749,11 +749,14 @@ static int scmi_clock_determine_rate(const struct scmi_protocol_handle *ph,
 		return 0;
 	}
 
+	step = clkd->r.rates[RATE_STEP];
+	if (!step)
+		return -EINVAL;
+
 	ftmp = *rate - fmin;
-	ftmp += clkd->r.rates[RATE_STEP] - 1; /* to round up */
-	ftmp = div64_ul(ftmp, clkd->r.rates[RATE_STEP]);
+	ftmp = DIV64_U64_ROUND_UP(ftmp, step);
 
-	*rate = ftmp * clkd->r.rates[RATE_STEP] + fmin;
+	*rate = ftmp * step + fmin;
 
 	return 0;
 }
-- 
2.49.0


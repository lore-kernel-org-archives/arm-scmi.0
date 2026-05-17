Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A97282F7AAB
	for <arm-scmi@vger.kernel.org>; Sun, 17 May 2026 19:04:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779044661; cv=none; b=pZqJxjvolCOe9+D0VERGSCNszpgA4TWPc2KWZ940Dr6VLFvAG18X1RG+X6OiNr0DTF0JUvDUEynj85DZRFP8zG9GeSIxE6uA2ESLwFI5kyWcINOYKPoqgkXSg9PLsR2hLRvv+iDfnfPoHN6zxFs94r8qM9m3eMLOEDvWeO71YFE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779044661; c=relaxed/simple;
	bh=BagPRorJW0mo6+WpFTl1DFwi/7L5mgLhGiL9DVliUXs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To; b=DuY+G+c0yo7af7p+Usym46UBSP9GrAdfWjcMzXXXxdLSao7o/PyqXv1f4EAbS1Gij1VG9vN+H4JejI9T5/Wns3Y4g1odf5EGQOr+G9UZCsEu5XmHLAFLAaWzh5Ya5hn91dX6jIoz9Zwe7FR2QEjGjEZTHbf8/K1hzH9QGULUQA4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YLlgiVpT; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YLlgiVpT"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D1DAFC2BCC6;
	Sun, 17 May 2026 19:04:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1779044661;
	bh=BagPRorJW0mo6+WpFTl1DFwi/7L5mgLhGiL9DVliUXs=;
	h=From:Date:Subject:References:In-Reply-To:To:From;
	b=YLlgiVpTDR9dcJW1vjOzjHVtiy+FWXqRrSWsZOpbf94OoDar2aJzhzXyst88zz+Jw
	 YHhgiC0iapbFxhzsZHn1cQYVzEtRvTkFqC6rEhAVeg88LntoSeFfh0mAPELovuP3NZ
	 1Rsak1NdL50VBHLG30WwRanffpXch4JGmZq3nwi08IR1awVTeg1BAqjemPtmlGhFN3
	 Vqeq+TsqplFTXeo/++7q+syiI4s+fo7Dh+FckxfLKwVTSm47aXMFEtmn9uTU4mYkcL
	 +1ADfCqggl31JxhW3GDcmMS2e5TCN9rxHhyPkKQ6IG17ACPTYMXNsEFnfJI9jYcE7l
	 RtAlfesAQuBFQ==
From: Sudeep Holla <sudeep.holla@kernel.org>
Date: Sun, 17 May 2026 20:02:42 +0100
Subject: [PATCH 3/4] firmware: arm_scmi: Validate SENSOR_UPDATE payload
 size
Precedence: bulk
X-Mailing-List: arm-scmi@vger.kernel.org
List-Id: <arm-scmi.vger.kernel.org>
List-Subscribe: <mailto:arm-scmi+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:arm-scmi+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260517-scmi_fixes-v1-3-d86daec4defd@kernel.org>
References: <20260517-scmi_fixes-v1-0-d86daec4defd@kernel.org>
In-Reply-To: <20260517-scmi_fixes-v1-0-d86daec4defd@kernel.org>
To: Cristian Marussi <cristian.marussi@arm.com>, arm-scmi@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, 
 Sudeep Holla <sudeep.holla@kernel.org>
X-Mailer: b4 0.15.2

SENSOR_UPDATE carries one or more sensor readings after the fixed
notification header. The parser derives the expected reading count
from the sensor description, but it did not verify that the received
payload contains those entries before parsing them.

Reject truncated update notifications before reading the variable
array.

Signed-off-by: Sudeep Holla <sudeep.holla@kernel.org>
---
 drivers/firmware/arm_scmi/sensors.c | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/drivers/firmware/arm_scmi/sensors.c b/drivers/firmware/arm_scmi/sensors.c
index 836c294a9f42..b14bb1146356 100644
--- a/drivers/firmware/arm_scmi/sensors.c
+++ b/drivers/firmware/arm_scmi/sensors.c
@@ -1072,12 +1072,15 @@ scmi_sensor_fill_custom_report(const struct scmi_protocol_handle *ph,
 	case SCMI_EVENT_SENSOR_UPDATE:
 	{
 		int i;
+		size_t expected_sz;
 		struct scmi_sensor_info *s;
 		const struct scmi_sensor_update_notify_payld *p = payld;
 		struct scmi_sensor_update_report *r = report;
 		struct sensors_info *sinfo = ph->get_priv(ph);
 
-		/* payld_sz is variable for this event */
+		if (payld_sz < sizeof(*p))
+			break;
+
 		r->sensor_id = le32_to_cpu(p->sensor_id);
 		if (r->sensor_id >= sinfo->num_sensors)
 			break;
@@ -1091,6 +1094,11 @@ scmi_sensor_fill_custom_report(const struct scmi_protocol_handle *ph,
 		 * readings defined for this sensor or 1 for scalar sensors.
 		 */
 		r->readings_count = s->num_axis ?: 1;
+		expected_sz = sizeof(*p) + r->readings_count *
+			      sizeof(p->readings[0]);
+		if (payld_sz < expected_sz)
+			break;
+
 		for (i = 0; i < r->readings_count; i++)
 			scmi_parse_sensor_readings(&r->readings[i],
 						   &p->readings[i]);

-- 
2.43.0


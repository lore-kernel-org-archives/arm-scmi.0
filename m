Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795549805;
	b=4sBKfHkg7fiLiIE7KE09VnpQ586ZLNvGI3QFN0Q0CHO3dkfyK/Jri7d9B0K5e2kkQprD
	 7eUKwR0+so8q65xkRUXJ99NGOjcIzgVYD4VWkhSyx4BvmlPzT8ONMysjWKMky4ni/D8tm
	 KxgF9nHBCi+fOE/57L6IuxUH9ll9VGLw3p+W6wqwOLqFSJPpFR/1wjMW/vvMwSlUe/Hsa
	 fqiR2zQloYi3pJpXP8DvnwnnOCoWHs+BPaA66RDq9mMaraUnPjFxbkDAdRtzzxim2Ug2U
	 JKL9vb14lXo+pFoU7snVWv2Aaoxse30PPHT08VkA98ZAx15Or3nbzIcxkNT8s2BiI0w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795549805;
	h=DMARC-Filter:Received:Received:DKIM-Signature:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=80q8YD+7sXMXFl1ECfvCh2AR2uYXOG7FEJnScBZQu+E=;
	b=2r5TWLkMuErxJA7yhQDXRBqvykh6vDrzDTROv6IN9JX8vB9jqaQnXAvcAn4wh/IV+wyx
	 cUmzLMJaiGuczK+piLPXosx40JzmNok8TNE1uYV/0FhynKgd7Bv2QEpScBrjnEKB3HQRS
	 T6HvAdbBFJ4PT9CJJWr+FfBP/1OzrbVijQj6ZPidZEhJMdDPPogISKfs/CYYOBjLajZ3P
	 TsR7SBoRPejNW5Afkugw/Cdw4rpW7QZizCfIBLC6To0Yu4uXo5zuexUf63T9cIb/jxUAX
	 2vuKWsi2XFyhwIQGKzqX8ns7SndxP8W90N0vKzS8+czlsIlJfN6bmuQOHRPNlhVDHww==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=arm.com;
	spf=pass smtp.mailfrom=arm.com;
	dkim=pass header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=PZoTVDeX;
	arc=none smtp.remote-ip=217.140.110.172
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B2345606A323;
	Tue, 24 Nov 2026 19:50:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B2345606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=PZoTVDeX
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 2229516F3;
	Tue, 24 Nov 2026 11:50:01 -0800 (PST)
Received: from pluto.guest.local (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 597AB3F763;
	Tue, 24 Nov 2026 11:50:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1795549804; bh=Y0MBG+9tAaJnrCVNc9NifzCluMxb+aEqtuevfolvhu4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=PZoTVDeXQBHBNQY/osXgVd4HpvJwvqovP/XFHePZT8nGFZFqxWnm001xC7RIY477y
	 hD0+50Et8HCCSg1ZBt1r60YTg2KwysBE7pqyUxA7BaE35ZhOd9sZ+u52C3Upk3hKfv
	 9c/4qEcw57xjbMDkUNjGtG2kfvNFD6DIDyN3uPQ4=
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
Subject: [PATCH v17 02/34] [RFC] firmware: arm_scmi: Additional iterators consistency checks
Date: Tue, 24 Nov 2026 19:48:08 +0000
Message-ID: <20261124194841.1147072-3-cristian.marussi@arm.com>
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

Add a few more consistency checks around the number of returned and
remaining items during the life of an iteration: this is useful to spot
prematurely terminated iterations that would produce shorter than expected
results.

Handling these anomalies in the platform multi-part replies within the
core SCMI iterators machinery avoids the need to address such issues
multiple times at the protocol layer.

Signed-off-by: Cristian Marussi <cristian.marussi@arm.com>
---
RFC because this is another fix that is potentially disrupting for any
non compliant SCMI platform deployed in the wild.
---
 drivers/firmware/arm_scmi/driver.c | 36 ++++++++++++++++++++++++++----
 1 file changed, 32 insertions(+), 4 deletions(-)

diff --git a/drivers/firmware/arm_scmi/driver.c b/drivers/firmware/arm_scmi/driver.c
index 55d9cc487916..6dd249c08f5f 100644
--- a/drivers/firmware/arm_scmi/driver.c
+++ b/drivers/firmware/arm_scmi/driver.c
@@ -1852,7 +1852,7 @@ static int __scmi_iterator_run(void *iter, unsigned int *start, unsigned int *en
 	const struct scmi_protocol_handle *ph;
 	struct scmi_iterator_state *st;
 	struct scmi_iterator *i;
-	unsigned int n;
+	unsigned int n, i_start, i_max, i_returned;
 
 	if (!iter)
 		return -EINVAL;
@@ -1862,10 +1862,15 @@ static int __scmi_iterator_run(void *iter, unsigned int *start, unsigned int *en
 	ph = i->ph;
 	st = &i->state;
 
+	/* Initialize iteration counters used to check consistency */
+	i_max = 0;
+	i_returned = 0;
+	i_start = start ? *start : 0;
+
 	/* Reinitialize state for next run */
 	st->num_returned = 0;
 	st->num_remaining = 0;
-	st->desc_index = start ? *start : 0;
+	st->desc_index = i_start;
 
 	do {
 		iops->prepare_message(i->msg, st->desc_index, i->priv);
@@ -1883,11 +1888,34 @@ static int __scmi_iterator_run(void *iter, unsigned int *start, unsigned int *en
 		if (ret)
 			return ret;
 
-		if (!st->num_returned && st->num_remaining) {
-			dev_err(ph->dev, "Inconsistent multi-part reply.\n");
+		/*
+		 * Initialize max items expectation for this run based on
+		 * values returned on first message exchange: during the
+		 * following iterations consistency will be validated against
+		 * these parameters, so as to spot FW anomalies like sudden
+		 * termination or unplausible conditions.
+		 */
+		if (!i_max)
+			i_max = i_start + st->num_returned + st->num_remaining;
+
+		if ((!st->num_returned && st->num_remaining) ||
+		    (i_max != i_start + i_returned + st->num_returned + st->num_remaining)) {
+			dev_err(ph->dev,
+				"Inconsistent multi-part reply. max:%u  i_max:%u  i_start:%u  i_returned:%u  returned:%u  remaining:%u  desc_index:%u\n",
+				st->max_resources, i_max, i_start, i_returned,
+				st->num_returned, st->num_remaining,
+				st->desc_index);
 			return -EINVAL;
 		}
 
+		dev_dbg(ph->dev,
+			"Multi-part - max:%u  i_max:%u  i_start:%u  i_returned:%u  returned:%u  remaining:%u  desc_index:%u\n",
+			st->max_resources, i_max, i_start, i_returned,
+			st->num_returned, st->num_remaining, st->desc_index);
+
+		/* Account for last batch received */
+		i_returned += st->num_returned;
+
 		if (st->num_returned > st->max_resources - st->desc_index) {
 			dev_err(ph->dev,
 				"No. of resources can't exceed %d\n",
-- 
2.54.0


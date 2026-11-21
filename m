Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795304613;
	b=tF57R/XhI+0tDldjRtDn+FvPvo3gFnvm63xv5jbOR1ShKejErcT1BaE9q2P2ZaymATC7
	 I2hODV2VIFyWwpX6TmJdV4FR8FfHW4qJYPHjsMJcHOEpu1mYKY5dh/ekoSuHqzBIm/3Uk
	 rKoPR6D5fN6RSmaxGRxhQ5OHunPvVzOzcNHqJxd+7iGVzt/8+qRI4zfRjK1fSAdYr77Od
	 6cJle+BPiDk2jfF2ViBFKVeO0GL8jmGHe6ZwPKJaw2Fcz/XrWZwRTdc+Q3JoGgO2A3BhK
	 cHVH4Sqi2Bb+k4QD1QpnsW3FT/pxr36NyR9eCwfSstNx4z8TJ0iBHZRRlAPzRuZwxAA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795304613;
	h=DMARC-Filter:Received:Received:DKIM-Signature:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=UP2PfH8d8VCNmy/9UBHp2fW+iJh9ONjNf0LSHyozQHU=;
	b=igFFyy7TNWGRSMF7mmau+ZY0T3bfVFNz1DSfHJEDo4Ycth4M4OvN864DOO7zIQPstDJ/
	 xF0ZZKne9b2LSvSphiuzDl64mW2+frhcmYfPfxKX8AFRbG4rEco411+X6yUom8Slmfr4M
	 gSegAgoNho2rJrloszuZHYdI97FBdXCm5C2aWI/ZhHVcJzmcrx2+pgTvFn+khL8XsGibY
	 DfQ4mXKh/+g2MEAOEEwbK9ygtXTMSk5rhY5Je5SVlJYXB96W8CzEebc5ebvSEujJlcHhg
	 Lw9cORx6Ho+h/DFQUBMXgCJNwrAmpgx+/hprPeItTwmT7bslrBYrA8CJLXepeoTGaAQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=arm.com;
	spf=pass smtp.mailfrom=arm.com;
	dkim=pass header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=oo+UnUFY;
	arc=none smtp.remote-ip=217.140.110.172
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 914BA606A331;
	Sat, 21 Nov 2026 23:43:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 914BA606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=oo+UnUFY
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 05DE71575;
	Sat, 21 Nov 2026 15:43:29 -0800 (PST)
Received: from pluto (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 13DE03F632;
	Sat, 21 Nov 2026 15:43:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1795304611; bh=/n2EWMdhO6kRAQYILC79T8bC3i1LKVlfeGgq74DQarY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=oo+UnUFY/GW7vo313JKvwf3sD/EJo5YhDQvHJDjfv2SCO7B6vhg3WsxEt7g22Unr9
	 DsfQRzRI9TJlOvluIrI+IWWSjxG9vNtPXaGpgTHgYymr57/N9aZkrl0HJ5taSa2S0f
	 MlZMOwGkKWqmpI3CPObLWHgO5Nk2h5C/Q37KJBQs=
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
Subject: [PATCH v16 02/31] [RFC] firmware: arm_scmi: Additional iterators consistency checks
Date: Sat, 21 Nov 2026 23:39:36 +0000
Message-ID: <20261121234005.1525419-3-cristian.marussi@arm.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261121234005.1525419-1-cristian.marussi@arm.com>
References: <20261121234005.1525419-1-cristian.marussi@arm.com>
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
 drivers/firmware/arm_scmi/driver.c | 38 ++++++++++++++++++++++++++----
 1 file changed, 33 insertions(+), 5 deletions(-)

diff --git a/drivers/firmware/arm_scmi/driver.c b/drivers/firmware/arm_scmi/driver.c
index 55d9cc487916..a9b0f704c39b 100644
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
@@ -1883,12 +1888,35 @@ static int __scmi_iterator_run(void *iter, unsigned int *start, unsigned int *en
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
 
-		if (st->num_returned > st->max_resources - st->desc_index) {
+		dev_dbg(ph->dev,
+			"Multi-part - max:%u  i_max:%u  i_start:%u  i_returned:%u  returned:%u  remaining:%u  desc_index:%u\n",
+			st->max_resources, i_max, i_start, i_returned,
+			st->num_returned, st->num_remaining, st->desc_index);
+
+		/* Account for last batch received */
+		i_returned += st->num_returned;
+
+		if (st->num_returned + st->desc_index > st->max_resources) {
 			dev_err(ph->dev,
 				"No. of resources can't exceed %d\n",
 				st->max_resources);
-- 
2.54.0


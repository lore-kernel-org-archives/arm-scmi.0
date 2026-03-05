Received: from cstnet.cn (smtp21.cstnet.cn [159.226.251.21])
	(using TLSv1.2 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F27A831985C
	for <arm-scmi@vger.kernel.org>; Thu,  5 Mar 2026 07:17:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.226.251.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772695081; cv=none; b=IP7n6iIHaRqMRLt2YVg7lBBfcbMDgjwc2r0B+/yEhEszZO+TpIxbbEupc1XXv4H9cnd80mY0h+pTs4M0prKgbkLVIEg4QvqsqXeCXnHKozp5pi+BNrvQGhOK1rFrT1EhSZnITkBpbdws2H8rxmMe0jhyvAXN2zEPqmX/bW4ak6I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772695081; c=relaxed/simple;
	bh=3xUVpc2YUr74/j5r9KrI5AkFN71lf331sjRUmsNnU8A=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=SYvsPcOBrcw/XjCSqH9kLyoMUslg/iLFkgNVTNVghmvhlCROazitMjDJ0uUQ7AW7+BPRWftX4S4UVnQb1cMtaG9B4N24umBu8+UdGpWoxTk/V7VnHnWiWA8w8OYbSV3Jc2tkG/l59KtY9OsqSASO5LFDkwQ/VLEA6xiuLFjJuOg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn; spf=pass smtp.mailfrom=iscas.ac.cn; arc=none smtp.client-ip=159.226.251.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iscas.ac.cn
Received: from localhost (unknown [124.16.138.129])
	by APP-01 (Coremail) with SMTP id qwCowADXgGwfLqlpGypHCQ--.538S2;
	Thu, 05 Mar 2026 15:17:51 +0800 (CST)
From: Chen Ni <nichen@iscas.ac.cn>
To: sudeep.holla@kernel.org,
	cristian.marussi@arm.com
Cc: sumit.garg@oss.qualcomm.com,
	jens.wiklander@linaro.org,
	arm-scmi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Chen Ni <nichen@iscas.ac.cn>
Subject: [PATCH] firmware: arm_scmi: optee: Check return value of tee_shm_get_va()
Date: Thu,  5 Mar 2026 15:15:33 +0800
Message-Id: <20260305071533.930896-1-nichen@iscas.ac.cn>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: arm-scmi@vger.kernel.org
List-Id: <arm-scmi.vger.kernel.org>
List-Subscribe: <mailto:arm-scmi+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:arm-scmi+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:qwCowADXgGwfLqlpGypHCQ--.538S2
X-Coremail-Antispam: 1UD129KBjvJXoW7WF4xGFyrAFy5Xry7Ww1kGrg_yoW8JFy8pF
	4YgayUtr47tF4ft34Iqrs7uFy5J3W8Gr9rKa4vya4kAwn8ArykGryUta4jgF98Ar4xt3y5
	K3WFqrZ0gFyUJrJanT9S1TB71UUUUUDqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUvv14x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
	1l84ACjcxK6xIIjxv20xvE14v26ryj6F1UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26F4j
	6r4UJwA2z4x0Y4vEx4A2jsIE14v26rxl6s0DM28EF7xvwVC2z280aVCY1x0267AKxVW0oV
	Cq3wAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0
	I7IYx2IY67AKxVWUGVWUXwAv7VC2z280aVAFwI0_Gr0_Cr1lOx8S6xCaFVCjc4AY6r1j6r
	4UM4x0Y48IcxkI7VAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwCY1x0262kKe7AKxVWU
	AVWUtwCY02Avz4vE14v_GF4l42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr
	1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE
	14v26r126r1DMIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7
	IYx2IY6xkF7I0E14v26r1j6r4UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E
	87Iv67AKxVW8JVWxJwCI42IY6I8E87Iv6xkF7I0E14v26r4j6r4UJbIYCTnIWIevJa73Uj
	IFyTuYvjfU5FApDUUUU
X-CM-SenderInfo: xqlfxv3q6l2u1dvotugofq/

The function tee_shm_get_va() can return an error pointer if the shared
memory is not properly mapped or if the offset is invalid. Without this
check, passing the error pointer to subsequent memory operations could
lead to a kernel panic.

Add a check for IS_ERR() on the return value of tee_shm_get_va().

Fixes: db9cc5e67778 ("firmware: arm_scmi: Make OPTEE transport a standalone driver")
Signed-off-by: Chen Ni <nichen@iscas.ac.cn>
---
 drivers/firmware/arm_scmi/transports/optee.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/firmware/arm_scmi/transports/optee.c b/drivers/firmware/arm_scmi/transports/optee.c
index 07ae18d5279d..a6774152c205 100644
--- a/drivers/firmware/arm_scmi/transports/optee.c
+++ b/drivers/firmware/arm_scmi/transports/optee.c
@@ -340,6 +340,13 @@ static int setup_dynamic_shmem(struct device *dev, struct scmi_optee_channel *ch
 	}
 
 	shbuf = tee_shm_get_va(channel->tee_shm, 0);
+	if (IS_ERR(shbuf)) {
+		dev_err(channel->cinfo->dev, "failed to get shared memory VA\n");
+		tee_shm_free(channel->tee_shm);
+		channel->tee_shm = NULL;
+		return PTR_ERR(shbuf);
+	}
+
 	memset(shbuf, 0, msg_size);
 	channel->req.msg = shbuf;
 	channel->rx_len = msg_size;
-- 
2.25.1


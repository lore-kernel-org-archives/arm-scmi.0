Received: from xmbghk7.mail.qq.com (xmbghk7.mail.qq.com [43.163.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4031A1F239B;
	Fri, 16 Jan 2026 12:54:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=43.163.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768568088; cv=none; b=Nu/cDJseZsDeQ1AZmMsf3aBpz393vjAyuw8jKf1M1OnweFazEqnp7lEllSaPdewDyQAUeQ3gY1w+l5TGZEo7iwNgvBUWAeIIWx3gDIPI/yxfoNnCAtpOWdoJo8c+An9OCM2cf95JquaPSSrx59iINkV4N6LY9ibGyKREO+IjgXY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768568088; c=relaxed/simple;
	bh=8/Sq8StM0qXW5/FciyUQix3rskELa+xfqwbu9DohIkM=;
	h=Message-ID:From:Date:Subject:MIME-Version:Content-Type:To:Cc; b=WadE18aWTRRfKmhqDvbbgDB5k/Dxi+n8a/l5R5urrk5YgdjzHQlYKwO6MaecQGQZSaXgDSGF3lPMEtg0wo5ZHxyHoE4fF8lj9fewJTlkl7jGFfCLalOTPCzh0GZE42QfY/t9zgj8t6+lZUbL+1ybLEo7ucF/gKiLXsaOD2bc+5M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com; spf=pass smtp.mailfrom=qq.com; dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b=ak/WWA8A; arc=none smtp.client-ip=43.163.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qq.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b="ak/WWA8A"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1768568082; bh=M9hfnzEF43IHdUY2dVVEA/3BjfGPtqhazX3KdgqvRkw=;
	h=From:Date:Subject:To:Cc;
	b=ak/WWA8Az/xurRReEvTZjwAjh9Ncv3zUcQYQFjjJBgjZyOuV1TyHrlBMx/a4zAuLo
	 5SeWJ/W9jpXW3TthU8EVZWnxeYJV63ETwA3uPdzWOaaFvIyW218CBCLeaHYQsEc5hk
	 NxrJCJ2Kd5KoPPs+q9pQ/XWnZ4yFl9T7aprVEwJ0=
Received: from junjungu-PC.localdomain ([223.166.246.160])
	by newxmesmtplogicsvrszc50-0.qq.com (NewEsmtp) with SMTP
	id DA818077; Fri, 16 Jan 2026 20:54:40 +0800
X-QQ-mid: xmsmtpt1768568080t7j1nb336
Message-ID: <tencent_A3E20C513BBE7D268B863A5CE473FBA10B06@qq.com>
X-QQ-XMAILINFO: OOO9dHjlsLs7QQS1rP69LWQ35Hp/CJV4p/t4Uitp63MkRuS3enNuG6U4eJ4HUA
	 tSPVgwV52BIS8fRB8wQps4rICSoSkiPAmutE8ShD+9QqZWtHdJ4wmXkPMuKc3pRtMlDXsgYIUqI2
	 7kv1YCa3yRAW2UpGjk3r+7ZEDHQf0axXBaQfCr+O+ZR2LewawR/DFN6A3aP6+cfEtI/qfh6JcONX
	 7rYgNbaEtEwiqiLAqtBFbVmVz+5hxSx5qnGi6zcEHhPwJBI8LVidSQzpPM6ASMA+F/z6VtWCCtSF
	 EfqFN9xXssmguqL9V5UHxlrIbAWKJhAU2awW2upnkkdXeXzzNUm9OfOJv1i+rv4A1JwSolsLafTg
	 I1Y3hAMCKwA85PYB6bYAfEQXXkAk7EoV+dnbh1ykh4B9qSQvkkYhnfoslB3E5dvQcBkxkLh623Zu
	 174i99Gm21+Yee9ASCi2WRlQqaBCv527zu+jFFkrXrK0OeW07CKNaYwKF/4fq5+V/EVmviLDm14F
	 pWFT+IdeSQDqZV3PodY4qN+rC1h8bi2MU8jXcUYTR8g0oVPpx3WT3GUI6diwP2cVQp5CAfMxObAQ
	 ba7dOid5SFIB2wTODJCesdiI4teF9Q2nbz5qYfOSgCxSHdiXNuujIh63FarEYnicCxvilVhBUZ7n
	 m/n9s98MgOd/e0iQqsXvLAD05HghEinbgoW2fRPr8W4UvmIhINx8TlLNUM1svPzkROBMjBB3/Nxu
	 akomwrw6/0V+mynVlG9qpLuiXbNGVV3A5Y/bYGOykzvOBCb0tRCZte0BEYS/mkHI262aF2A5p5uz
	 4wHQN7VUEK8yvsxcpxURqMEG2P2y7m8bSoD5A5Pt5kw44GHhne/UVWJr0zj3K5+wj8YtnpbVLPJw
	 5N5umlxXfAM8Q0W8myHVZcjb+qmO9mOnnCARmVxSJozBi7EaoWzcj8jtuCtJEM5lchJIUwTWe1sx
	 jgpiMTG1umAt2soO4XLKBdwMg6UahZo5gXLtsyYb//tAGEEm+EWGvZMp+htDBGqH3vs8wPgjPzFT
	 Qv3MWgO9ZFaInFk6qsXNEkXas/dfxkyRcc/4pW/V7NlBhSH6vPbpgpE6Hp+r3VmJIVtf6BUpryCe
	 GzGYceRyJU6hvOjWyP0OVP+g7S5XlDnWQeSJMAWwliQlBU5T/6MsMWGO8MLfV9ISyUQ/5zgSz48J
	 9roD8=
X-QQ-XMRINFO: OWPUhxQsoeAVwkVaQIEGSKwwgKCxK/fD5g==
From: Felix Gu <gu_0233@qq.com>
Date: Fri, 16 Jan 2026 20:54:39 +0800
Subject: [PATCH] firmware: arm_scpi: Fix a reference leak on device node
Precedence: bulk
X-Mailing-List: arm-scmi@vger.kernel.org
List-Id: <arm-scmi.vger.kernel.org>
List-Subscribe: <mailto:arm-scmi+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:arm-scmi+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-OQ-MSGID: <20260116-arm_scpi-v1-1-a9692a4b86ef@qq.com>
X-B4-Tracking: v=1; b=H4sIAA41amkC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDQ0Mz3cSi3Pji5IJMXQNDY6NEy9TUVINkIyWg8oKi1LTMCrBR0bG1tQA
 pdV6uWgAAAA==
X-Change-ID: 20260116-arm_scpi-0132a9eee0c2
To: Sudeep Holla <sudeep.holla@arm.com>, 
 Cristian Marussi <cristian.marussi@arm.com>
Cc: arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Felix Gu <gu_0233@qq.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1768568080; l=936;
 i=gu_0233@qq.com; h=from:subject:message-id;
 bh=8/Sq8StM0qXW5/FciyUQix3rskELa+xfqwbu9DohIkM=;
 b=UUtDXrPKMygBcY8JVWTKhqAQ4+cB1V3jx2cl42pVNs1JZPzjsRKypTST6kcL/xg7X+m2l69ac
 k1GWZpbePhYDOEgJQaSfe0rmpTvm2dEhjbOdBS1/xgUa6hYK01lfvu2
X-Developer-Key: i=gu_0233@qq.com; a=ed25519;
 pk=fjUXwmjchVN7Ja6KGP55IXOzFeCl9edaHoQIEUA+/hw=

When calling of_parse_phandle_with_args(), the caller is responsible
to call of_node_put() to release the reference of device node.
In scpi_dev_domain_id, it does not release the reference.

Fixes: 45ca7df7c345 ("firmware: arm_scpi: add support to populate OPPs and get transition latency")

Signed-off-by: Felix Gu <gu_0233@qq.com>
---
 drivers/firmware/arm_scpi.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/firmware/arm_scpi.c b/drivers/firmware/arm_scpi.c
index 87c323de17b9..b6233f81ef3e 100644
--- a/drivers/firmware/arm_scpi.c
+++ b/drivers/firmware/arm_scpi.c
@@ -665,6 +665,7 @@ static int scpi_dev_domain_id(struct device *dev)
 				       0, &clkspec))
 		return -EINVAL;
 
+	of_node_put(clkspec.np);
 	return clkspec.args[0];
 }
 

---
base-commit: 9b7977f9e39b7768c70c2aa497f04e7569fd3e00
change-id: 20260116-arm_scpi-0132a9eee0c2

Best regards,
-- 
Felix Gu <gu_0233@qq.com>


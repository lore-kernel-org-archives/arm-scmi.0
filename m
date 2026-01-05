Received: from mail-pj1-f99.google.com (mail-pj1-f99.google.com [209.85.216.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A66A227EFFA
	for <arm-scmi@vger.kernel.org>; Mon,  5 Jan 2026 10:17:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.99
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767608274; cv=none; b=Zi9gGICGrwUwD+rOevCHrrwpq8YiUhrycP/nLP6Fhgsoz2DWebGIDEpOZPRUMJnod3nG21FXAExB5G7zfQq99e0zo88Ych+dwAuO0AD6QOube1XHEM+N8LktCvrrGrbQUuo4k7XyWanbIwq9FICQPtXREXKvQBwR08ZfJJQsLo8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767608274; c=relaxed/simple;
	bh=QY3HTEVaHPlfhfn0LQXxca+zyPZhcAwhzUarq0fwl9Q=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=I+6zxD1arlQODn4ptzQ4bn0ORigdGN2JzXLM+oTN5GgtaNZvURdauVHr96mTA2TvH8m0zpKzE42F+OB+Qh5XvmDOa3uZbAs5q7IbhU+mY+plDwAUzJzbtFBIuZwK6iNZFBm8xynvaSHPHpoGWgcwcV08n0bERK66h3Brx4HI0u0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=XVT72kka; arc=none smtp.client-ip=209.85.216.99
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="XVT72kka"
Received: by mail-pj1-f99.google.com with SMTP id 98e67ed59e1d1-34c3259da34so14613387a91.2
        for <arm-scmi@vger.kernel.org>; Mon, 05 Jan 2026 02:17:52 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767608272; x=1768213072;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:dkim-signature:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZDEZfxXGKUHqnD6uzu3JESKT0vdq+bi9ssWL2yPlp2w=;
        b=FsvEXkVibatU19+5zZ0tiAzfDiJK2mSQDQd8UCXcgmyxtckKI+IWDKLpQU08TRyBkt
         D5umTJH+ndRWeNlVj2cubC121RTTmgFZF6fMDckwxDJIhZiyrejwbmFddYxxbtrgWOr3
         8o3uC7+Ry+fZPP/p8VcglOKiCArGY7XgWSANyHyfjWSiblzzepdCN0YskKKC8Fn75b1U
         JEqxh9lHSx19rlIH5L+FRuD+9WC1hMpB/BNo55rIALlEINO6Pkeu6ptRXmuIOQew9ltU
         O0RWQ1nZE/YCVcdX1l4D2sfj+RnPJUbgq/9CWlXfJ7zLRn1Zt3eLnxWDAa9wZ+jyILhM
         VZeA==
X-Forwarded-Encrypted: i=1; AJvYcCXsGgkMHOt1xOlJSFjr0GixjQtgLCfxb25rIQuawGHzCAbQUsPmO6oVMr50fp47gf/bLKIRd8agQg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw6DRuzU6rhD3CxgaAsfu83So9BaxCA84GQGiwuDO1UteOLCTCg
	Rxm2lln40NVk0PHJZ5WTvDZYBUXBRBcHQwGWgJGtiQ3hxrdWY9r0SWvAFWnPhb9TEkX78uztE2f
	Z3ryBOsds0Rr9Xuuz9E40k4VbGzU0f33Y1EBLp9Fd/u4LDCW7+kHShohm9v2BAcmVnX3zemJPPR
	91qL5XCjHM4QI20+BNvHUkKMlOqU2l1JO1zksfVbjAGTcqoKBciWazXy13kzPTJ4VL6PtLuIRBg
	0BOMgDceC5ihlSZzrKn
X-Gm-Gg: AY/fxX5IoNz2QANC1UMDxTiVUpDjHVWfDExfPugHcTtc1PDRlPfKan3Ep06Amfi+hjj
	g+OonXW2rbS0KnCUnJvn8YsLRZ+fjgt2hEnEyvFe1d5Ou03/kvHkSl161Tlp7LBf7h/4ywNiyeD
	WS5eAgNjbuwUTzaWuWpQBAZOFlABdAsAHQSM/sNrP1N6LQuvPOlaRpgVhkBCDtkkAWMHcDFyU7H
	dQ9JeP5NXmdvzKP6YvL1o9jtKlso1RjxDmhR3rudJKLbQ1p1NOjoJR5S7HsFCZZK4gdaBEIblWj
	WHJ8b3Il6bH7V963JpzjIvCXspSQvxg8ogCS+MiRES07wkPRiEIKPCsCFMas5XZnhepBqMb7tdr
	DQ3L2/lPHMh++htzCU+DxmvIpQtwzMtPRtoilIU562yUvhKixPT56C38O0u0sCei4Y2eZF4OmCZ
	q+0Ch96X0q01fCrzlOdVO7rck8tQJz9B74SrB6XezK2NfbXegL7vk=
X-Google-Smtp-Source: AGHT+IEq3bvylXVaqnvLg2NIjtiPJlv25DclTaEGpCm81jid2km+zyjS9PpvmRN1G11KIXTNbtSJpqrexCiM
X-Received: by 2002:a17:90b:35d1:b0:341:c964:126c with SMTP id 98e67ed59e1d1-34e921f07f8mr37756237a91.34.1767608271865;
        Mon, 05 Jan 2026 02:17:51 -0800 (PST)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-117.dlp.protect.broadcom.com. [144.49.247.117])
        by smtp-relay.gmail.com with ESMTPS id 98e67ed59e1d1-34f4775c541sm1051466a91.5.2026.01.05.02.17.51
        for <arm-scmi@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 05 Jan 2026 02:17:51 -0800 (PST)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-34c6cda4a92so31144841a91.3
        for <arm-scmi@vger.kernel.org>; Mon, 05 Jan 2026 02:17:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1767608270; x=1768213070; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ZDEZfxXGKUHqnD6uzu3JESKT0vdq+bi9ssWL2yPlp2w=;
        b=XVT72kkahmHtaf719+HMdZO37C3gfnmLQw4FyrAMadM2CYk3a4lhAJOeKTrdwNfv5W
         gzNHLCfteYMe/qZhuUZ/gG7ZnauTI9+wYtcgITdjvpX1JtUGeTwoxK7sfJZlfrrbTj5Q
         5s5EbShd9BYjVHhQvn7CNcjg4S6XdoIvJ11cY=
X-Forwarded-Encrypted: i=1; AJvYcCU38NHPws5TPctwPfB4sW2onUjCM2o/1OdDT5ycNVowyRfZGSDbX5aF5vbZbbX451BBNagl9/V3Aw==@vger.kernel.org
X-Received: by 2002:a05:7023:905:b0:11d:fd26:234e with SMTP id a92af1059eb24-121722b821amr43934357c88.16.1767608269930;
        Mon, 05 Jan 2026 02:17:49 -0800 (PST)
X-Received: by 2002:a05:7023:905:b0:11d:fd26:234e with SMTP id a92af1059eb24-121722b821amr43934337c88.16.1767608269346;
        Mon, 05 Jan 2026 02:17:49 -0800 (PST)
Received: from shivania.lvn.broadcom.net ([192.19.161.250])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1217254d369sm170077924c88.16.2026.01.05.02.17.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Jan 2026 02:17:49 -0800 (PST)
From: Shivani Agarwal <shivani.agarwal@broadcom.com>
To: stable@vger.kernel.org,
	gregkh@linuxfoundation.org
Cc: sudeep.holla@arm.com,
	cristian.marussi@arm.com,
	rafael@kernel.org,
	viresh.kumar@linaro.org,
	arm-scmi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-pm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	ajay.kaher@broadcom.com,
	alexey.makhalov@broadcom.com,
	vamsi-krishna.brahmajosyula@broadcom.com,
	yin.ding@broadcom.com,
	tapas.kundu@broadcom.com,
	Henry Martin <bsdhenrymartin@gmail.com>,
	Sasha Levin <sashal@kernel.org>,
	Shivani Agarwal <shivani.agarwal@broadcom.com>
Subject: [PATCH v5.10] cpufreq: scmi: Fix null-ptr-deref in scmi_cpufreq_get_rate()
Date: Mon,  5 Jan 2026 01:57:01 -0800
Message-Id: <20260105095701.659420-1-shivani.agarwal@broadcom.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: arm-scmi@vger.kernel.org
List-Id: <arm-scmi.vger.kernel.org>
List-Subscribe: <mailto:arm-scmi+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:arm-scmi+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e

From: Henry Martin <bsdhenrymartin@gmail.com>

[ Upstream commit 484d3f15cc6cbaa52541d6259778e715b2c83c54 ]

cpufreq_cpu_get_raw() can return NULL when the target CPU is not present
in the policy->cpus mask. scmi_cpufreq_get_rate() does not check for
this case, which results in a NULL pointer dereference.

Add NULL check after cpufreq_cpu_get_raw() to prevent this issue.

Fixes: 99d6bdf33877 ("cpufreq: add support for CPU DVFS based on SCMI message protocol")
Signed-off-by: Henry Martin <bsdhenrymartin@gmail.com>
Acked-by: Sudeep Holla <sudeep.holla@arm.com>
Signed-off-by: Viresh Kumar <viresh.kumar@linaro.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
[Shivani: Modified to apply on 5.10.y]
Signed-off-by: Shivani Agarwal <shivani.agarwal@broadcom.com>
---
 drivers/cpufreq/scmi-cpufreq.c | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/drivers/cpufreq/scmi-cpufreq.c b/drivers/cpufreq/scmi-cpufreq.c
index bb1389f27..6b65d537c 100644
--- a/drivers/cpufreq/scmi-cpufreq.c
+++ b/drivers/cpufreq/scmi-cpufreq.c
@@ -29,12 +29,18 @@ static const struct scmi_handle *handle;
 
 static unsigned int scmi_cpufreq_get_rate(unsigned int cpu)
 {
-	struct cpufreq_policy *policy = cpufreq_cpu_get_raw(cpu);
+	struct cpufreq_policy *policy;
+	struct scmi_data *priv;
 	const struct scmi_perf_ops *perf_ops = handle->perf_ops;
-	struct scmi_data *priv = policy->driver_data;
 	unsigned long rate;
 	int ret;
 
+	policy = cpufreq_cpu_get_raw(cpu);
+	if (unlikely(!policy))
+		return 0;
+
+	priv = policy->driver_data;
+
 	ret = perf_ops->freq_get(handle, priv->domain_id, &rate, false);
 	if (ret)
 		return 0;
-- 
2.40.4


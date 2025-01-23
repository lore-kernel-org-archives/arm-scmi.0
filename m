Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C4AE20FA91
	for <arm-scmi@vger.kernel.org>; Thu, 23 Jan 2025 11:39:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737632364; cv=none; b=P+BEtJ1ujMlfVvUylb3FgAYgoTOaNZBgu6m9NDKd8qfrXzTEoPQ50Gwh3jX3OlImBNXsMAZuZiM6ru/IedCjAcAd5QmR708b8dZ5FDsss/vg3lIKWmbLGZ6RBMXehcHGQykildLOo/5T90w8APHLuAfpNMtdevM/+OCBuRxUmvg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737632364; c=relaxed/simple;
	bh=VXzi3vQGoGrFGGoCyXxs3yzYdKXJIY2PFnz+CzvQS0U=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=K01PlQ7LDyKP/hY2zVsrAxgJOetJKaBpTjhzl4UJRytL/WADk1F4jRAjnzI4mCwTUQ9iBf7qscMlDyHV6vyoSoztA87b3BmAEtb9Qf5JXz5wajqvKDUvGDmIsNCKUctbbhClWS4e6Zak902qCXLyme9Ho+wDnbmMrva3ZHS/0vE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Nu2AC3Ua; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Nu2AC3Ua"
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-21619108a6bso11665915ad.3
        for <arm-scmi@vger.kernel.org>; Thu, 23 Jan 2025 03:39:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1737632362; x=1738237162; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MdX1SYlxV+BuSD5MpIWAGjJb4j3+Z4eC30JBUmG9pbw=;
        b=Nu2AC3UayPXF+ScZ+VlLYNfUBBO1RN50K0T2I5+aSVZMpCfbI+9lSr2d5lYzxkJhYi
         uz7xWyIvI5q5QLIJG0SOyv32gKNXIuJJEDXcifVnYz3WIPgi7lYVw41MOBU9bzG5I94c
         LZosnuaNZyXtAQkbz8ROQofDL21zaGOA84+dOvmNnefl0QnGlQGiVlRzBN+YGuK+XVwA
         jbKQ5YDSZe1cBYj6Xu/WhTu7QVfRwxHNIUItJzw5HrncHYTtNGJWBzLZnLhz/WN4bBNY
         Q1u0O71Bzrdd3WUIGwK0mxrSEYTcZ5Nd6AbDkzFiE5Gp7n4jSHF52ayriql18lehgpFt
         Lbng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737632362; x=1738237162;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MdX1SYlxV+BuSD5MpIWAGjJb4j3+Z4eC30JBUmG9pbw=;
        b=VLnrHbj5rhrw9aU2LFdumvazZgXMIg/mQ0k8qUCfqQE5XnppzOVJZff+NsYNfWWSLU
         dJ3zf7TyXjuekoOA0xsllLLkekXYb0KqhOLg70wzGh0TOsQTndVYS9US8w2dmMWthxoz
         Qes42hZOx5MK2Ejyf08pGXXUDa+DnXGLpE0Q+WR3oQNG+7eJUaSC7EsLo1C0OqTyvg3N
         TTmM954LMbTsXQq/EmZicrq1U5g8zKCpQXWYBum32pPkS887B/52GfWaFwgbnftFJZ+0
         /G3vroJzGle11/7bNuTAE7wkWvwgIAhd/qlEkg56K+etwmfhsRMsRWNa4jE7h0ZFTt0C
         3h7w==
X-Forwarded-Encrypted: i=1; AJvYcCVF3BndsN94tlw2NIisUsInhZwQY66gq7SnQB7ixeTTDuipAEZJ66x/XJAJ1q2j4AYIaAF9iWMRlg==@vger.kernel.org
X-Gm-Message-State: AOJu0YxZIJ8wlEF8xsz1Mw+Olv0XS2SsdFfEIdbOzqSgTZzjYIIbc3xp
	QGT2Wlscz8dIu0zeRaWd2l2BE0j0dikyfVUttMN8qb60NCcbgV8nHAt1rorM1vU=
X-Gm-Gg: ASbGncup+GOxwqk1oYPMN0FkS4J4h/J8AF5VA2LH8rLWBLqaJVGhlJh4FJYDYIQCpIx
	FkpLe46D7qRy96Ofr5lOItdeIdFdO0o4qFVKlAwKnro2zpA4Uk1mYyxCGY3XMTFCr+8zUB5Ox9S
	BOkhZAbmSPl8c7BIb6Pcxj24/MHgM0Gccz568xrmC+clIUc/uPfbl0XN9k+QVj8zXjifmQhl0+F
	QpT6Lfi4DDaiTTu99+g1A5pvXiSvVWIjQK+XGTqiOyb4pw3L36Mnys2Szxq/y/JhpIvBkRn0MJK
	umwyGpcBy9B4+KnWGQ==
X-Google-Smtp-Source: AGHT+IGErAbE+NwTrY1AINeQ3Si6MPxs7fVewd1+h1jBQl/h9wJNR/mCHaoI/Y7H43GtjmK7onqLBg==
X-Received: by 2002:a05:6a20:2589:b0:1e0:d0c8:7100 with SMTP id adf61e73a8af0-1eb214701c4mr46281215637.7.1737632362526;
        Thu, 23 Jan 2025 03:39:22 -0800 (PST)
Received: from localhost ([122.172.84.139])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72dab7f2a38sm12882604b3a.21.2025.01.23.03.39.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Jan 2025 03:39:22 -0800 (PST)
From: Viresh Kumar <viresh.kumar@linaro.org>
To: "Rafael J. Wysocki" <rafael@kernel.org>,
	Sudeep Holla <sudeep.holla@arm.com>,
	Cristian Marussi <cristian.marussi@arm.com>,
	Viresh Kumar <viresh.kumar@linaro.org>
Cc: linux-pm@vger.kernel.org,
	Vincent Guittot <vincent.guittot@linaro.org>,
	arm-scmi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 24/33] cpufreq: scmi: Stop setting cpufreq_driver->attr field
Date: Thu, 23 Jan 2025 17:06:00 +0530
Message-Id: <d4893396c4bacdd995d03a296b9d3ff44e71d072.1737631669.git.viresh.kumar@linaro.org>
X-Mailer: git-send-email 2.31.1.272.g89b43f80a514
In-Reply-To: <cover.1737631669.git.viresh.kumar@linaro.org>
References: <cover.1737631669.git.viresh.kumar@linaro.org>
Precedence: bulk
X-Mailing-List: arm-scmi@vger.kernel.org
List-Id: <arm-scmi.vger.kernel.org>
List-Subscribe: <mailto:arm-scmi+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:arm-scmi+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The cpufreq core handles this for basic attributes now, the driver can skip
setting them.

Signed-off-by: Viresh Kumar <viresh.kumar@linaro.org>
---
 drivers/cpufreq/scmi-cpufreq.c | 8 --------
 1 file changed, 8 deletions(-)

diff --git a/drivers/cpufreq/scmi-cpufreq.c b/drivers/cpufreq/scmi-cpufreq.c
index b8fe758aeb01..4a3ee59cb771 100644
--- a/drivers/cpufreq/scmi-cpufreq.c
+++ b/drivers/cpufreq/scmi-cpufreq.c
@@ -171,12 +171,6 @@ scmi_get_rate_limit(u32 domain, bool has_fast_switch)
 	return rate_limit;
 }
 
-static struct freq_attr *scmi_cpufreq_hw_attr[] = {
-	&cpufreq_freq_attr_scaling_available_freqs,
-	NULL,
-	NULL,
-};
-
 static int scmi_limit_notify_cb(struct notifier_block *nb, unsigned long event, void *data)
 {
 	struct scmi_data *priv = container_of(nb, struct scmi_data, limit_notify_nb);
@@ -309,7 +303,6 @@ static int scmi_cpufreq_init(struct cpufreq_policy *policy)
 			dev_warn(cpu_dev, "failed to enable boost: %d\n", ret);
 			goto out_free_table;
 		} else {
-			scmi_cpufreq_hw_attr[1] = &cpufreq_freq_attr_scaling_boost_freqs;
 			scmi_cpufreq_driver.boost_enabled = true;
 		}
 	}
@@ -395,7 +388,6 @@ static struct cpufreq_driver scmi_cpufreq_driver = {
 		  CPUFREQ_NEED_INITIAL_FREQ_CHECK |
 		  CPUFREQ_IS_COOLING_DEV,
 	.verify	= cpufreq_generic_frequency_table_verify,
-	.attr	= scmi_cpufreq_hw_attr,
 	.target_index	= scmi_cpufreq_set_target,
 	.fast_switch	= scmi_cpufreq_fast_switch,
 	.get	= scmi_cpufreq_get_rate,
-- 
2.31.1.272.g89b43f80a514


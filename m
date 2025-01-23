Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93191216E01
	for <arm-scmi@vger.kernel.org>; Thu, 23 Jan 2025 11:39:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737632368; cv=none; b=qeyLsBs15/EY4n8qKgndibmNS4AiX/kxnkQhUpNm+aNFhiP2FmhhsQ8loEKBr42T/j3W51KYk4UA+Lkdhqds+ocQnAu9+PISqB1pjPhqdRoGFbX4Dgks9zpLq/u+aKTxCg58flv0+lPejQ5k8OWoKe1fP6hhc16vGoUhAjSsOVw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737632368; c=relaxed/simple;
	bh=ISnDu8HFa/lMeUi1aSqC0GPxgTXvokFOJYnohLySKhM=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=ZIsIo17ez9xEYas2lVAWufXZQppTnlIkkknscgDLOtmWHH86Oo513rYcrSdcKo0Javy5aUWNGlkUVyhvnuwTzNF50FkqKL4OT6NnpSGdJ+dksGvrO/mvvjpShU9cJEPNqHV/greqnDguLbHXX/aNy9GcXcu33j8xPMWb9IBVwv4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=FpdX5lel; arc=none smtp.client-ip=209.85.216.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="FpdX5lel"
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-2ef8c012913so1140764a91.3
        for <arm-scmi@vger.kernel.org>; Thu, 23 Jan 2025 03:39:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1737632366; x=1738237166; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bidGXEhWbEsWi+5Sth126LejibvpIMLA/P72ifY2Y/8=;
        b=FpdX5lelOIK58W32hV07DR31kCXPX10mFmUBXsJNAwfuNczwYakcwz8HSyKh250Atg
         lZixakHB/OPPq+YETzH4NbGs+WhgkpxVnRPpsunvWX598FikNYVX3vjs+T8x9nMPc6uW
         It/UrvBtmUp35CldDl4eMZ0FNuynFiX4vIjaR58unop7kVf41n30MYtd6eyuth+vMkLW
         1hFGCv+Go5/uKugpf7Q6AuVoZWj+aYTuO2dnrESFC3w/1IR3muynkJ57Lskhq/e5dJNz
         XqICDzRpjMNQaHdu0C4ezzEtN/9BHPGZzATL14+HHikgcxjVeieLyiCwLoflttU6pGft
         14TQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737632366; x=1738237166;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bidGXEhWbEsWi+5Sth126LejibvpIMLA/P72ifY2Y/8=;
        b=hasXPvaoJj7OQa+rLZISLXp1ID3+YQ15ViYQIcHGCGZoCsK6O0gM6JQ5abtGeaT/Re
         pgfmasrogjnkPgu368Lhm2/cGIPnyiclWvqqdyJkC3SWdjCkK7TCwEeu0MQCUSsYt96v
         FOqLGKrs5ptxbI2An5CCVPzz/7u3GE4pKZwP3dd6jbrbi0GjX6PXyqBzzrCytgJVPh6f
         X//iol36NJhcc5WlKnfqYjdIk6cBXO/xsvXOddcdQ6KH4GulFtCtUOXcnt12g8EfyF7u
         LJDRWWhnpG0aO1gALFiElU+JZO3Ow+Cr1T+RJiJcywH8luSjk0uwYv5S8rq1Ve+x9AmE
         dA/A==
X-Forwarded-Encrypted: i=1; AJvYcCX3NeI2WkKglhSbJ9Qxwk7zf/tNxjTi1i9beY3tu3CwbFfWT9bD/9FaC5sUC9m5H27wqAD1IAR4Qg==@vger.kernel.org
X-Gm-Message-State: AOJu0YwvI8zybK7sEoQMlEyURzikcd58m9e4e16ISu8Oishli/14xbOb
	WaDrzbqpepZjDdHgD6Z4nWj39lbQjSqEMfTQOAaYSh4kjQTff0fhhlRY7U/7u/k=
X-Gm-Gg: ASbGncu9HdHQBWHl4J5N5Ia9o6ETbfgR+wvUOtkZ1Y95qZnxY7gBDFGihvnCdrEL49L
	6wkKfY2RhJAB3Wj3qKpevHmkp4D+pk/G+tA6VkOhIasVvlSdYdM0UPoLzXWCUXdGMoMfrUQtspi
	R/UAAgdW2KvEC7jfRyLpmblZrT4fEsBsPQSa11xstd40Z5VK6HnzFSiNLmTpIW7BAepVBUzoOcv
	ZISza1N8FhMGW+o3jItqxgISL0v9+N87yZ3OuQx0/v4Tid1tVrBGrPS+eYnUx9Y/cqiYCwApGV9
	Ihx1xhs=
X-Google-Smtp-Source: AGHT+IHMoaj306mgy718YKGGZ2ZKiv1T27I/McQDNCDh5aizBvwSBcMBEOMZ/suJHkPkfqgWyPwUEA==
X-Received: by 2002:a17:90b:37ce:b0:2f2:ab09:c256 with SMTP id 98e67ed59e1d1-2f782d6f0b9mr39599393a91.33.1737632365880;
        Thu, 23 Jan 2025 03:39:25 -0800 (PST)
Received: from localhost ([122.172.84.139])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-a9bdd309d91sm12546450a12.48.2025.01.23.03.39.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Jan 2025 03:39:25 -0800 (PST)
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
Subject: [PATCH 25/33] cpufreq: scpi: Stop setting cpufreq_driver->attr field
Date: Thu, 23 Jan 2025 17:06:01 +0530
Message-Id: <2b89078adc1472d5ab9377ad7675cf4c07a8f7cc.1737631669.git.viresh.kumar@linaro.org>
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
 drivers/cpufreq/scpi-cpufreq.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/cpufreq/scpi-cpufreq.c b/drivers/cpufreq/scpi-cpufreq.c
index cd89c1b9832c..54574978986c 100644
--- a/drivers/cpufreq/scpi-cpufreq.c
+++ b/drivers/cpufreq/scpi-cpufreq.c
@@ -183,7 +183,6 @@ static struct cpufreq_driver scpi_cpufreq_driver = {
 		  CPUFREQ_NEED_INITIAL_FREQ_CHECK |
 		  CPUFREQ_IS_COOLING_DEV,
 	.verify	= cpufreq_generic_frequency_table_verify,
-	.attr	= cpufreq_generic_attr,
 	.get	= scpi_cpufreq_get_rate,
 	.init	= scpi_cpufreq_init,
 	.exit	= scpi_cpufreq_exit,
-- 
2.31.1.272.g89b43f80a514


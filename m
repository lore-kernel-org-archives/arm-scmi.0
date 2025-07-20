Received: from mail-oo1-f50.google.com (mail-oo1-f50.google.com [209.85.161.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE4852236FA
	for <arm-scmi@vger.kernel.org>; Sun, 20 Jul 2025 19:38:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753040324; cv=none; b=i6IGRxX6kn4wiLsMzfCxPR6plOD1LApQVkTqewJUL8/sO3pMWgCylIHjpHDB6kChh+TulnU5/TBhQ1gYh0L468weITqKC8Nqe1rCvgjyNBej7iQ9KVvPGpgorq1aVxejxi7eekeAotAOfyDYFgjjrwKqXj8ZSQkArkzPc7CKn3Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753040324; c=relaxed/simple;
	bh=NGvVaxHT6GAmFiO4/MidCvEywAVxDk7Jl939F55Z0dI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=m9HjtBKWh7wSvYm9C1qhrn9hIEWEk2NuW0lYXcaP13JViivi3+8WCzpwnXr9ufvaHKZ1NKnpINfX45IPNMbxIH9rPcDkf9WvIGXRdZRJXhIotwpGyQcLMHk9gcoRGbg3AjHBy1F050PWY/g3MuJmeGzdMh/O7PMPiq89sGCk35M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=xURukzX9; arc=none smtp.client-ip=209.85.161.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="xURukzX9"
Received: by mail-oo1-f50.google.com with SMTP id 006d021491bc7-615a68bd0efso776857eaf.2
        for <arm-scmi@vger.kernel.org>; Sun, 20 Jul 2025 12:38:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1753040322; x=1753645122; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=X8e0Rkt8jdkgvftQKNoZRYfHGuTcfUv00gpyykQyZ5M=;
        b=xURukzX9xG/OwgS474fODizN51RwJT7HiKxjhoaHkXB/BmQt4vJX2WX0s7Ql2g1ALs
         gWqsX1pVFv11bd5CMefY9iaJt3OchcllDfqr5gHjXP1wRVhUqMhvYkqMLc8xTAKKXU6N
         QU25j5dQlsSnQxrFBgUusVgRrgq4krWXgE5rgSlRDJpZQ3aJEjqGNs346RrRxL/dmNXV
         dVyzZ6d+FYNme9iLEsrNA24WE7OdhBeJ/VEB58xD0yQCCWKmtwMBc7RbzOoyNqj17pA8
         jr4O50JEBOuTGKo5t7+O4NKck+uS2rlm5lUt7i0NfFa9FY8wzcrGcSCUNvDY2zEx2/pu
         QYBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753040322; x=1753645122;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=X8e0Rkt8jdkgvftQKNoZRYfHGuTcfUv00gpyykQyZ5M=;
        b=MRNOsifDsfzg+L8Rr2u467r8+HHRTpIu++ulU6WqzLCbQDP3DNLobhNOFfjdZBoAmQ
         9jffmPy1s2cxuy2oByOexEsUi5uywvanrGuZ4sMcuLp0xgrPV6UIo6Knnqvot2Cj0PiM
         v+haSFimy9kDlYz6uGvQBGVLcgQ2Q/f38IULpBu9eaPij/fSBRetJtBr8EKScrLHFWZk
         w8MoPXLGqBEEzXKGKfnVBtQPPvxokNEtdoac9fDLZ7sbZ6Nz+rC72qsCuAGwckftd8v+
         8RjbCYr8Xne+X8z0Nzk4YZRVcyTZ/t9xhBxIZGqCRsmzgBwvgJZBpRkxzsAhnWM43Txn
         wfBg==
X-Forwarded-Encrypted: i=1; AJvYcCW3c+TdFhTgsev6yrnmoLhRdfm7YSt7hE3qpL68VkH+P/tE0P1Y0arzkFrmilCzWeFZTs3sxuWyAw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz5zhdsarbAAIPe7pz4ReiTGwCSgkQtDLl1TxyW1soF4g93foNU
	d+Zzruyut96q3gRgSeCBz8N5PiaSQgWwXyTsWeABfImMc0Wi3BpkWJT6SzxSO5d76os=
X-Gm-Gg: ASbGncuHH8FEJrUx2xLkDoRJM9j/VcTh/UzMQlRZRg3YbIJN/2hti7V4lraT2QDqnly
	f34RNTM8V1OTZHn4xMRiRBPhV7JbGY7rsleSdWwwpYzbyiZXe2Dj2n12ypHzjolutcKgNs6ihrg
	e6vzbpooDEpHRnDUrKBN0BgYtPhteWzH5cFxMr5ucJhCRGw03WimtMb0AbYjTKhVAwp3opWDxaB
	opyCU38nMjuPTjrfkMyFe4k7YrslOPMycHPw1jEHnFU/zyrAQ5koR6YzxWdhr9dJ/ZeL0+a5xGq
	8OCd6Ik1XfjUSeN57U3iMt2FTznKKsLUeR/Nq6gRHoBKIGAITp+QA1E8Bpiw4EW+KCBMtlnLoAX
	p3rC02aGSr94=
X-Google-Smtp-Source: AGHT+IGeTlhYB9KS9TF9xSDd7VU5hXZEme07PjGtrxZBrvFLIeMvThRyC/+06//IuEU+tzOyCgkyAA==
X-Received: by 2002:a05:6808:3c4b:b0:41c:d19f:27a7 with SMTP id 5614622812f47-41d031f1b44mr15123791b6e.8.1753040321954;
        Sun, 20 Jul 2025 12:38:41 -0700 (PDT)
Received: from localhost ([2603:8080:b800:f700::1fec])
        by smtp.gmail.com with UTF8SMTPSA id 5614622812f47-41fd10c2058sm1777647b6e.2.2025.07.20.12.38.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Jul 2025 12:38:40 -0700 (PDT)
Date: Sun, 20 Jul 2025 14:38:35 -0500
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Sudeep Holla <sudeep.holla@arm.com>,
	AKASHI Takahiro <takahiro.akashi@linaro.org>,
	Michal Simek <michal.simek@amd.com>
Cc: Cristian Marussi <cristian.marussi@arm.com>, arm-scmi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH RFC v2 1/7] firmware: arm_scmi: move boiler plate code into
 the get info functions
Message-ID: <7a47cf3d-05e1-4702-87ef-cb7f36f03149@sabinyo.mountain>
References: <cover.1753039612.git.dan.carpenter@linaro.org>
Precedence: bulk
X-Mailing-List: arm-scmi@vger.kernel.org
List-Id: <arm-scmi.vger.kernel.org>
List-Subscribe: <mailto:arm-scmi+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:arm-scmi+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1753039612.git.dan.carpenter@linaro.org>

This code to check whether the selector is valid and if the item has
already been recorded in the array can be moved to the
scmi_pinctrl_get_function_info() type functions.  That way it's in
one place instead of duplicated in each of the callers.

I removed the check for if "pi->nr_groups == 0" because if that were the
case then "selector >= pi->nr_groups" would already be true.  It already
was not checked for pins so this makes things a bit more uniform.

I also removed the check for if (!pin) since pin is an offset into the
middle of an array and can't be NULL.

Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 drivers/firmware/arm_scmi/pinctrl.c | 108 +++++++++++++---------------
 1 file changed, 48 insertions(+), 60 deletions(-)

diff --git a/drivers/firmware/arm_scmi/pinctrl.c b/drivers/firmware/arm_scmi/pinctrl.c
index 3855c98caf06..d18c2d248f04 100644
--- a/drivers/firmware/arm_scmi/pinctrl.c
+++ b/drivers/firmware/arm_scmi/pinctrl.c
@@ -596,11 +596,19 @@ static int scmi_pinctrl_pin_free(const struct scmi_protocol_handle *ph, u32 pin)
 }
 
 static int scmi_pinctrl_get_group_info(const struct scmi_protocol_handle *ph,
-				       u32 selector,
-				       struct scmi_group_info *group)
+				       u32 selector)
 {
+	struct scmi_pinctrl_info *pi = ph->get_priv(ph);
+	struct scmi_group_info *group;
 	int ret;
 
+	if (selector >= pi->nr_groups)
+		return -EINVAL;
+
+	group = &pi->groups[selector];
+	if (group->present)
+		return 0;
+
 	ret = scmi_pinctrl_attributes(ph, GROUP_TYPE, selector, group->name,
 				      &group->nr_pins);
 	if (ret)
@@ -632,21 +640,14 @@ static int scmi_pinctrl_get_group_name(const struct scmi_protocol_handle *ph,
 				       u32 selector, const char **name)
 {
 	struct scmi_pinctrl_info *pi = ph->get_priv(ph);
+	int ret;
 
 	if (!name)
 		return -EINVAL;
 
-	if (selector >= pi->nr_groups || pi->nr_groups == 0)
-		return -EINVAL;
-
-	if (!pi->groups[selector].present) {
-		int ret;
-
-		ret = scmi_pinctrl_get_group_info(ph, selector,
-						  &pi->groups[selector]);
-		if (ret)
-			return ret;
-	}
+	ret = scmi_pinctrl_get_group_info(ph, selector);
+	if (ret)
+		return ret;
 
 	*name = pi->groups[selector].name;
 
@@ -658,21 +659,14 @@ static int scmi_pinctrl_group_pins_get(const struct scmi_protocol_handle *ph,
 				       u32 *nr_pins)
 {
 	struct scmi_pinctrl_info *pi = ph->get_priv(ph);
+	int ret;
 
 	if (!pins || !nr_pins)
 		return -EINVAL;
 
-	if (selector >= pi->nr_groups || pi->nr_groups == 0)
-		return -EINVAL;
-
-	if (!pi->groups[selector].present) {
-		int ret;
-
-		ret = scmi_pinctrl_get_group_info(ph, selector,
-						  &pi->groups[selector]);
-		if (ret)
-			return ret;
-	}
+	ret = scmi_pinctrl_get_group_info(ph, selector);
+	if (ret)
+		return ret;
 
 	*pins = pi->groups[selector].group_pins;
 	*nr_pins = pi->groups[selector].nr_pins;
@@ -681,11 +675,19 @@ static int scmi_pinctrl_group_pins_get(const struct scmi_protocol_handle *ph,
 }
 
 static int scmi_pinctrl_get_function_info(const struct scmi_protocol_handle *ph,
-					  u32 selector,
-					  struct scmi_function_info *func)
+					  u32 selector)
 {
+	struct scmi_pinctrl_info *pi = ph->get_priv(ph);
+	struct scmi_function_info *func;
 	int ret;
 
+	if (selector >= pi->nr_functions)
+		return -EINVAL;
+
+	func = &pi->functions[selector];
+	if (func->present)
+		return 0;
+
 	ret = scmi_pinctrl_attributes(ph, FUNCTION_TYPE, selector, func->name,
 				      &func->nr_groups);
 	if (ret)
@@ -716,21 +718,14 @@ static int scmi_pinctrl_get_function_name(const struct scmi_protocol_handle *ph,
 					  u32 selector, const char **name)
 {
 	struct scmi_pinctrl_info *pi = ph->get_priv(ph);
+	int ret;
 
 	if (!name)
 		return -EINVAL;
 
-	if (selector >= pi->nr_functions || pi->nr_functions == 0)
-		return -EINVAL;
-
-	if (!pi->functions[selector].present) {
-		int ret;
-
-		ret = scmi_pinctrl_get_function_info(ph, selector,
-						     &pi->functions[selector]);
-		if (ret)
-			return ret;
-	}
+	ret = scmi_pinctrl_get_function_info(ph, selector);
+	if (ret)
+		return ret;
 
 	*name = pi->functions[selector].name;
 	return 0;
@@ -742,21 +737,14 @@ scmi_pinctrl_function_groups_get(const struct scmi_protocol_handle *ph,
 				 const u32 **groups)
 {
 	struct scmi_pinctrl_info *pi = ph->get_priv(ph);
+	int ret;
 
 	if (!groups || !nr_groups)
 		return -EINVAL;
 
-	if (selector >= pi->nr_functions || pi->nr_functions == 0)
-		return -EINVAL;
-
-	if (!pi->functions[selector].present) {
-		int ret;
-
-		ret = scmi_pinctrl_get_function_info(ph, selector,
-						     &pi->functions[selector]);
-		if (ret)
-			return ret;
-	}
+	ret = scmi_pinctrl_get_function_info(ph, selector);
+	if (ret)
+		return ret;
 
 	*groups = pi->functions[selector].groups;
 	*nr_groups = pi->functions[selector].nr_groups;
@@ -771,13 +759,19 @@ static int scmi_pinctrl_mux_set(const struct scmi_protocol_handle *ph,
 }
 
 static int scmi_pinctrl_get_pin_info(const struct scmi_protocol_handle *ph,
-				     u32 selector, struct scmi_pin_info *pin)
+				     u32 selector)
 {
+	struct scmi_pinctrl_info *pi = ph->get_priv(ph);
+	struct scmi_pin_info *pin;
 	int ret;
 
-	if (!pin)
+	if (selector >= pi->nr_pins)
 		return -EINVAL;
 
+	pin = &pi->pins[selector];
+	if (pin->present)
+		return 0;
+
 	ret = scmi_pinctrl_attributes(ph, PIN_TYPE, selector, pin->name, NULL);
 	if (ret)
 		return ret;
@@ -790,20 +784,14 @@ static int scmi_pinctrl_get_pin_name(const struct scmi_protocol_handle *ph,
 				     u32 selector, const char **name)
 {
 	struct scmi_pinctrl_info *pi = ph->get_priv(ph);
+	int ret;
 
 	if (!name)
 		return -EINVAL;
 
-	if (selector >= pi->nr_pins)
-		return -EINVAL;
-
-	if (!pi->pins[selector].present) {
-		int ret;
-
-		ret = scmi_pinctrl_get_pin_info(ph, selector, &pi->pins[selector]);
-		if (ret)
-			return ret;
-	}
+	ret = scmi_pinctrl_get_pin_info(ph, selector);
+	if (ret)
+		return ret;
 
 	*name = pi->pins[selector].name;
 
-- 
2.47.2


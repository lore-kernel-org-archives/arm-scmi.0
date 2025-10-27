Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49F1630ACEC
	for <arm-scmi@vger.kernel.org>; Mon, 27 Oct 2025 15:16:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761578174; cv=none; b=dSlBdDWR54fZkXWps/3/AQEI5n1Qf37CfX/3DytqhXX8sk8UqdeRd0nF/eY7jvWjrS2f/7q9e0ZdUHGcrTJpMBx+Uiu9RgPXoCoNFKq66vZf8cLJvl0ParmP1Zt8quM4Tgrle0cwVjpTwm5SC8B3C/WRCbhDCUXCdBnWYSloxAE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761578174; c=relaxed/simple;
	bh=HFi+5jzbzkDJhJ74N9vt34VSKsKa/+KypnZEEOeAjng=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uV0zDz8qAsluMTb1PIkLktizoSbJCqZI9YvbYCmW84MAuTjIPA7mp72aQwxR6kIXN4RkVSL0oEnjY4ej7I+55bxKiHING5KbxybS4J+KA3kb0RyqVvjFhODC1lY5ahmFpS8HA4K2o196uKwNR0wKffKzd4T+RHAYQeuOqMcsJnk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=eT9KRazD; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="eT9KRazD"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4710a1f9e4cso39743375e9.0
        for <arm-scmi@vger.kernel.org>; Mon, 27 Oct 2025 08:16:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1761578170; x=1762182970; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=28LMzmOlKg+KTnmCehGJ4yq2NWfrmOTiYLvi3XZto1U=;
        b=eT9KRazDs15k/EflOM1WaRlrBsWQPQ5X6Ro6rTpiPV+eMkDTakRDYqHHCwaoGJfPw3
         KijxMPe8uihCejY8YPq53bz8/5gZ+ebCsUnSOmFLvbcMp7RtED68lDISCVSd563fErAN
         FANbDtpyJiWGOHXyZqxWld4deWJL0nhonsAPdPlg7BVC0ZF7EB7x/siwLzE0j3he0r3i
         YMkIiLr2sSQTPPG5abJK+qX7JAXIpuyIer33uIkQMdqWMHrPuPJQOFjyFsPv8tzliuja
         NX8Q1uCgFotWTHHFx1D4FRHV6AED//pVEw7kfs/SJH4p+q21hDXQppf9SVESWDBZ1xXp
         aQYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761578170; x=1762182970;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=28LMzmOlKg+KTnmCehGJ4yq2NWfrmOTiYLvi3XZto1U=;
        b=McaSNA9DisIfhyedSo3VykotlyxNACQQZSqpqRxlO+phfNzi0YEoBtG+1pcfg2+ZXD
         9ydBm+juG2KLmTr+q+ShZcOEFQvmeFCBK259q5obW6HSR8dZLiphJSYBAYjgXJtv/Mmk
         M741SetfdpDwjgUMHSgtalDP2qreHLDiWwoFS8Mn3Ekoq6ANiTPIJaa6l1r/cipxcFQv
         dwlZJY+kAo0S5S4Q82O19wadWPOYz1pup7MgnRRLbTBDvpseRvGcJpnzInhnCGazBg+N
         GC8NYd5ZlkHiMICwGYyEHkPp+cwNGyRmGBQFqdH2X+3cOPZUClAuh9P1y15L/WtRpY4z
         sLtw==
X-Forwarded-Encrypted: i=1; AJvYcCUhyugKGdpFJJVCgVmN2GQdoPnsW22YMApUc4MGccCSi8JsV4CWEFSkytuJjLcFBXCBBhS7LolvWA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw/THDdZb4Nc9TWQV3UKDXLmqBVB3hVeav2901weUqd2Nt9axVd
	tTOYLJ5u5grjINMKyJBpQaciIfa5xZxNT1q9mn1puTUCzdykgufoFtLnvQB0JwgPFjGE9BVD6l3
	4GtF4
X-Gm-Gg: ASbGncvr0s7otzY+bri/kxMBi3xilf6Ry2BQSXdkj2k67rEvLyYZI6hnl+WLJcDyTnM
	aU5elxkEurRl7VHsesFgxKKlayeS5kwu9t15Nt2YxlA+ARTCexF4ONK7/qoWvcu5hBK3drmIXKg
	7enQojbdla1S1vUwOf3lBhkY8SXtj0owEuTWcbt7f1kQBIEOGYG9mPyl1L6286q7JDY5xZrdlpi
	sezpTcSsisckUdtFZkFBfXXOruxgzmeaRPQRzcjDbAnTpseXAEMqe2ePqApUwGkYzyYnvZDZB+U
	hsRbDZ7Zny9/1p5LjD39T6AuI+a4GWlzxnZv2OWxjQbmmU6rselfqCvF1Pf4FkXQOrG1ncgk1gs
	+AqAT51JdbGXkomUWpka8wOUIPQEqtyokcyEfQC8qlgxhYcXg7wz83FgDO34tf8DTaK72TBqIOH
	gByvBF2Ae0WnaBXBq2
X-Google-Smtp-Source: AGHT+IF2Q+U4P39LMqUNYJRoBXTbX3H+nbIPvbSIsonN/qYyyF3APhKrFIUh2pTy2NcU3nGppP4j3Q==
X-Received: by 2002:a05:600c:3103:b0:471:1717:411 with SMTP id 5b1f17b1804b1-475d2ec5e4cmr85126425e9.24.1761578170439;
        Mon, 27 Oct 2025 08:16:10 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-475dd4924e2sm142618495e9.8.2025.10.27.08.16.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Oct 2025 08:16:09 -0700 (PDT)
Date: Mon, 27 Oct 2025 18:16:06 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Sudeep Holla <sudeep.holla@arm.com>
Cc: Cristian Marussi <cristian.marussi@arm.com>, arm-scmi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH] firmware: arm_scmi: move boiler plate code into the get info
 functions
Message-ID: <287b5302f583e3535d50617ec3b0856e38253171.1761576798.git.dan.carpenter@linaro.org>
References: <cover.1761576798.git.dan.carpenter@linaro.org>
Precedence: bulk
X-Mailing-List: arm-scmi@vger.kernel.org
List-Id: <arm-scmi.vger.kernel.org>
List-Subscribe: <mailto:arm-scmi+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:arm-scmi+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1761576798.git.dan.carpenter@linaro.org>

This code to check whether the selector is valid and if the item has
already been recorded in the array can be moved to the
scmi_pinctrl_get_function_info() type functions.  That way it's in
one place instead of duplicated in each of the callers.

Remove the check for if "pi->nr_groups == 0" because if that were the
case then "selector >= pi->nr_groups" would already be true.  It already
was not checked for the pin case so this makes things a bit more uniform.

Also remove the check for if (!pin) since pin is an offset into the
middle of an array and can't be NULL.

Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
Reviewed-by: Cristian Marussi <cristian.marussi@arm.com>
---
I had sent this as an RFC earlier.  It can just go in by itself.

https://lore.kernel.org/all/aDmpD9qz-4RUXvFq@pluto/

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
2.51.0


Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4177E1B4138
	for <arm-scmi@vger.kernel.org>; Mon, 28 Apr 2025 09:27:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745832481; cv=none; b=nVd1O5ItHuVm1BEnr+PZTU75MVbDOI2O+vO1ymsY2ptkv3XUoKm1CqT/2OWjv2IKU/YM9YA97xHVKrfA6LNkxxn+dpWdVwDckTZTXhqyx0pW9OoOMTybC02X2d50Z1EF7OqVdIWi9eiY4K3BVHk9fJJhi07QWMLl+mSI1YgiL0g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745832481; c=relaxed/simple;
	bh=TGkE9kIV5CP/rb826rmt2oG4WKDdh9Ues+PaiaUo2+o=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=E1nlkldgBcTMKu7RZW07Vl9/Aco57dOfw7g8LePdze+Af8+t0/2GSl5LQ9AHfTT4I05FjURICP/1VNTLdkLLitYp1HTyh/K3X073ZKqoDOmUCAg/vl3h9ozLEbfERQyA+JlIsTBmVk4vMLvTDNJLQlHErfUTHbTTSU5dBXWSumA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=VArcNOZJ; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="VArcNOZJ"
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-39c13fa05ebso2931359f8f.0
        for <arm-scmi@vger.kernel.org>; Mon, 28 Apr 2025 02:27:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745832477; x=1746437277; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=/McI7ZOC/UHJ7m7SA/U4UrRNwplmzHL51CRoEKnevhE=;
        b=VArcNOZJ1Wcy7udVcl4i/pynD2u2FV8iiYKJH/mOk9+dOShY8OQmz2deEAYffnOYLz
         YNloYOX6jTPWVHiTIFjR9ZVt3xFH66e562GcWGaxDsXsBPjvnd7uRm+FjmSeCn6Qqt3j
         H0RFIuaF0UqtNIG31MinkrdPKrENHpo8X0cG9Qfw9k6kK/Sseq3q0OxvU+VgZkzMSK0d
         TSEIbikxh9eYlNX9mc0+nTC6yMdZuJM4JhBmB90Y9GitbgxPIjj2Q+qX4lBZIi6vRSwJ
         +H85/AV7TnoTzwX4XfcHUZeQCI3YwMN2y5BmpFwj9Bdwn+3hrjvmKUTEPoGOBC58IRl6
         2H6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745832477; x=1746437277;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/McI7ZOC/UHJ7m7SA/U4UrRNwplmzHL51CRoEKnevhE=;
        b=h1NS+lsfENJrZJ9EE76CwwpWqLpXH9Ii/CS62i7GDxKVZXm0Pg1ibCEFBzq1dsG+er
         nqEADS4BKtttHkm1EZIN8tM0UaUXbzrCePoMqgQIrquBouc7bGUN0M/XsNfVc4cU8HO3
         WlEluaHPfhkb7GHqsj/VkBVJ1qaIc8yO48sIbZmWAAaVuvA5dPkLcjL5Bzp+59ZbOi4O
         91kPsOQau0eQuctKF4aaDNEpCtQZM7kdcO0UwaknTFTa6cpK2ohlL160wwvOaIcKeRyH
         mQLrWI/jzKgMmrQybdgrQrpqLkhelHlL1vONdZbBW1SaXFE3XWMSSHy5uKX9qrM+Cs2p
         5mjA==
X-Gm-Message-State: AOJu0Yzz+744rTa/6cXHssQaHTaI742saxl0Qbnn0EPllDwp3QNxsrHt
	wcmlzf7HyZ+otiP6TDzpnC6AmKRjtC0q9x93+fz18obvO6dT1KfITCz9VZ1mXzg=
X-Gm-Gg: ASbGncvSHVCjz538bwaqgFC4MDsWtDS9E5Kd147xUPxW4bChmhCeeb6jUgL2kj2i5vO
	Lh8FvbEYiKldmLTxD2T3QnnctP8d9i5oBU46jyBD7/ZOfefboe7t+YSGbWx3zd2rAd6JlZNFbd7
	eTCSlSLrcXRjPsO8aFstAYbX8f8m6OH2p8ppXzbOzEkxButhLKuiOkMUHPBgY3hQVnarTTyHJ6F
	eFxoyHnV7qCnpU1bYfdX5rvdpCmh2MXuAMJU/hsPlCB11hXxZQUFmPMxuoPAHbf0tff53ypun4p
	vOTkvaBsAXPv+q8ibPJ77k2KUiYR4yI1l10SOmWNqYXQBQ==
X-Google-Smtp-Source: AGHT+IFbqQuoP7PQSyZ6Gbin6zcRcOjrszC/CFjDipuyXbhGRAIU1lQ0LjSIY0BA8w+jSSMf8iMang==
X-Received: by 2002:a05:6000:2584:b0:39e:f641:c43 with SMTP id ffacd0b85a97d-3a07adb233dmr6029576f8f.53.1745832477420;
        Mon, 28 Apr 2025 02:27:57 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-3a073c9ba61sm10661109f8f.9.2025.04.28.02.27.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Apr 2025 02:27:56 -0700 (PDT)
Date: Mon, 28 Apr 2025 12:27:53 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Khaled Ali Ahmed <Khaled.AliAhmed@arm.com>
Cc: arm-scmi@vger.kernel.org, Girish Pathak <Girish.Pathak@arm.com>
Subject: [PATCH SCP] module/scmi_pin_control: allow variable length responses
Message-ID: <aA9KGTuVXZotPEMF@stanley.mountain>
Precedence: bulk
X-Mailing-List: arm-scmi@vger.kernel.org
List-Id: <arm-scmi.vger.kernel.org>
List-Subscribe: <mailto:arm-scmi+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:arm-scmi+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

The PINCTRL_LIST_ASSOCIATIONS and PINCTRL_SETTINGS_GET commands can
return variable length responses.  Originally, they were hard coded as
returning only one response.  Change the length to -1 and change
scmi_message_validation() to skip the length checking for lengths when
it's -1.

Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 module/scmi/src/mod_scmi.c                         | 5 ++++-
 module/scmi_pin_control/src/mod_scmi_pin_control.c | 6 ++----
 2 files changed, 6 insertions(+), 5 deletions(-)

diff --git a/module/scmi/src/mod_scmi.c b/module/scmi/src/mod_scmi.c
index dfaf441fbae5..da4ecc09e13b 100644
--- a/module/scmi/src/mod_scmi.c
+++ b/module/scmi/src/mod_scmi.c
@@ -434,8 +434,11 @@ static int scmi_message_validation(
         return (int)SCMI_NOT_FOUND;
     }
 
-    if (payload_size != payload_size_table[message_id]) {
+    if (payload_size_table[message_id] != -1 &&
+        payload_size != payload_size_table[message_id]) {
         /* Incorrect payload size or message is not supported */
+        FWK_LOG_ERR("invalid message size: message_id=%ld payload_size=%ld vs %ld\n",
+		    message_id, payload_size, payload_size_table[message_id]);
         return (int)SCMI_PROTOCOL_ERROR;
     }
 
diff --git a/module/scmi_pin_control/src/mod_scmi_pin_control.c b/module/scmi_pin_control/src/mod_scmi_pin_control.c
index 058c89f9512f..2a1095dba9b4 100644
--- a/module/scmi_pin_control/src/mod_scmi_pin_control.c
+++ b/module/scmi_pin_control/src/mod_scmi_pin_control.c
@@ -99,12 +99,10 @@ static const size_t payload_size_table[MOD_SCMI_PIN_CONTROL_COMMAND_COUNT] = {
         (unsigned int)sizeof(struct scmi_protocol_message_attributes_a2p),
     [MOD_SCMI_PIN_CONTROL_ATTRIBUTES] =
         (unsigned int)sizeof(struct scmi_pin_control_attributes_a2p),
-    [MOD_SCMI_PIN_CONTROL_LIST_ASSOCIATIONS] =
-        (unsigned int)sizeof(struct scmi_pin_control_list_associations_a2p),
-    [MOD_SCMI_PIN_CONTROL_SETTINGS_GET] =
-        (unsigned int)sizeof(struct scmi_pin_control_settings_get_a2p),
     [MOD_SCMI_PIN_CONTROL_SETTINGS_CONFIGURE] =
         (unsigned int)sizeof(struct scmi_pin_control_settings_configure_a2p),
+    [MOD_SCMI_PIN_CONTROL_LIST_ASSOCIATIONS] = -1,
+    [MOD_SCMI_PIN_CONTROL_SETTINGS_GET] = -1,
     [MOD_SCMI_PIN_CONTROL_REQUEST] =
         (unsigned int)sizeof(struct scmi_pin_control_request_a2p),
     [MOD_SCMI_PIN_CONTROL_RELEASE] =
-- 
2.47.2


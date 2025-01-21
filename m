Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3ECC51F152D
	for <arm-scmi@vger.kernel.org>; Tue, 21 Jan 2025 13:05:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737464756; cv=none; b=g7pxE1ctp6VU3JGAObTzeDcAORGJCwThLNS853yrLXE5PGBudGHdsIXYHgTa0WCj358AdAUXTlhoYlocldNvXB+rQRs8qVR8OAg5xiUxcph9SAa/YlyI0NdoTcXPA+FQqLKFjmO2x6PO+HdUaWVBMmVBUuJBa3gJGwKGKPOhtiQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737464756; c=relaxed/simple;
	bh=0rh+ktra4/CJTrYbV7MpeXmKyARn32Pgw1kclep605U=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=sHT/ufKOn46UUD3B2MyEoeEDM9hy3iumbtN7F5EtDm94yoo/vYv4X8UNWLQc0dagCuJH/OaEyF6dLs5PMd/IOpOVIWWjkxivww7T0H1v7uwY4naiZHbZuOni8M8g7wkxwkSBZKeF+VD3RIdMQFn+LH9Ry5n3ld1NigKcvn277rA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=SrMDE2Ka; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="SrMDE2Ka"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4368a293339so64384225e9.3
        for <arm-scmi@vger.kernel.org>; Tue, 21 Jan 2025 05:05:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1737464752; x=1738069552; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=lDvS85+uFk7jq8RzMooM/0y08dYdS5LIgTKDh5Y5Sjk=;
        b=SrMDE2KaFwnPXSMIpLmZH9CbrdVBHk7kYkHdym/6f3eMJfYvdONIATtezMEiq0srQ3
         ZNp7wLu67lAS0ZLa9M/M6h3eJs3+ntPGgPBazuibqBg917z6Cr9aEi0sqBkdUHrB+iAX
         gduMH+BBQSCnotCEFV9IN9PuiecA+8FYzedsS1ViqVWDgFXWY3HHXG8ZLbanyH71JCft
         opaa79o1cTfqelU5BMs42NF13EJFuPb2w9CJuQVEDMl04dhQGI4Wp+2zxKsLfhyo/eBW
         zS6zlrhw/GaGRVPltobHmrb2F/0R0M/fAKXIw0/XQivtzDPB5eRqGjWi92y+TUDLGdMa
         ZmAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737464752; x=1738069552;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=lDvS85+uFk7jq8RzMooM/0y08dYdS5LIgTKDh5Y5Sjk=;
        b=R08tIuYrfQW60ejooCFsdGR5FrIb2fuuen4AApkw/bI7im/nXIh9n4G1w66L11EOa/
         zEFJWzKH55OZvp4PNG707iJRldLA5wbJ/oXUF8OxfAZBVm5idNAsayaYmInhaxhi8p5O
         RLnYyzkLqhtgHn6TDzL8LC6ioNfOMuUmoHBE1Uvk6TfL23vrNK5IZtekjz46/rn8HqoG
         QdJwvi9GH1DNO+s7/OocmtILcjoFqrJ0iJ/84wThnm7xljWtSteTzUYmSubxGO4eSo99
         4vMT/jnALP/FvfCdy5ZULn/VNpYeMQ0VtuWrbPdU0zHuF7nZbWcMLJC3/7JqdTAwXEXe
         IpHA==
X-Gm-Message-State: AOJu0Yw1ZorTMacbXOi+vlXTpeT0vgaZDPWqC9zzNTZffPF40iddPmR7
	cMVyk8EpY+lStRcYd54AmGENCMUMYkOqqsCuKiujIrUcqDnGBkbSxW4DQ5Nb/Oc=
X-Gm-Gg: ASbGncswCpi4mpAeIgruVh92OoGKvQNGq37WHBY4tMMBNwgwrOzRCUoZwk5slDYV8jt
	ZLKFOFDbWTfClVJhKheGLtZcl34382L+ngxnn8X3wFiCmsIUMYMiGd6iN2Ei2TQV84uEssBwDW3
	17dVvJzpJa58jbyeLmGK+OTSs6nff3zcUWv8fTjRrTP4vQlVnhkwUjZX9tN//flVjHMYVK28C9B
	0l2nD0Wsrsg40FDna0OV32ekeTLdomEBff4G/jyLzAZoqS4svcfZPn3xdMBO3jJ6ViOPON8Uhk=
X-Google-Smtp-Source: AGHT+IEbW6NH9ujG8Xy2KMtGNrLfSz7JtIhdiGTklLq3aC/aeJruMddNzZ0Ss22mw/ix0V5y1id/iw==
X-Received: by 2002:a5d:648a:0:b0:385:f349:fffb with SMTP id ffacd0b85a97d-38bf57bfba2mr17045519f8f.45.1737464752414;
        Tue, 21 Jan 2025 05:05:52 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4389046250csm176347705e9.25.2025.01.21.05.05.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jan 2025 05:05:51 -0800 (PST)
Date: Tue, 21 Jan 2025 16:05:48 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Khaled Ali Ahmed <Khaled.AliAhmed@arm.com>
Cc: "arm-scmi@vger.kernel.org" <arm-scmi@vger.kernel.org>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Girish Pathak <Girish.Pathak@arm.com>
Subject: [PATCH SCP] module/scmi_pin_control: Fix ->write_payload() memory
 corruption
Message-ID: <ec49918a-595c-4755-8b1b-f0351e63de1f@stanley.mountain>
Precedence: bulk
X-Mailing-List: arm-scmi@vger.kernel.org
List-Id: <arm-scmi.vger.kernel.org>
List-Subscribe: <mailto:arm-scmi+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:arm-scmi+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

The call to ->respond(service_id, (void *)&return_values, payload_size)
will copy payload_size bytes from &return_values to the payload.  There
are two problems with this:
1) return_values does not have payload_size bytes so it's a read overflow.
2) It will overwrite the data that we wrote earlier with ->write_payload.

The way to use ->write_payload() and ->respond() is to use
->write_payload() to write the entire payload (in multiple steps, chunk
by chunk), and then pass a NULL payload pointer to ->respond so that it
doesn't write any further data but just sends payload_size bytes of data
that we have already written.

Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 module/scmi_pin_control/src/mod_scmi_pin_control.c | 12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)

diff --git a/module/scmi_pin_control/src/mod_scmi_pin_control.c b/module/scmi_pin_control/src/mod_scmi_pin_control.c
index e58814660f4b..058c89f9512f 100644
--- a/module/scmi_pin_control/src/mod_scmi_pin_control.c
+++ b/module/scmi_pin_control/src/mod_scmi_pin_control.c
@@ -392,11 +392,15 @@ static int scmi_pin_control_list_associations_handler(
     }
 
     return_values.status = (int32_t)SCMI_SUCCESS;
+    status = scmi_pin_control_ctx.scmi_api->write_payload(
+        service_id, 0, &return_values, sizeof(return_values));
+    if (status != FWK_SUCCESS)
+	    return_values.status = SCMI_GENERIC_ERROR;
 
 exit:
     return scmi_pin_control_ctx.scmi_api->respond(
         service_id,
-        (return_values.status == SCMI_SUCCESS) ? (void *)&return_values :
+        (return_values.status == SCMI_SUCCESS) ? NULL :
                                                  (void *)&return_values.status,
         (return_values.status == SCMI_SUCCESS) ? payload_size :
                                                  sizeof(return_values.status));
@@ -569,6 +573,10 @@ static int scmi_pin_control_settings_get_handler(
     }
 
     return_values.status = (int32_t)SCMI_SUCCESS;
+    status = scmi_pin_control_ctx.scmi_api->write_payload(
+        service_id, 0, &return_values, sizeof(return_values));
+    if (status != FWK_SUCCESS)
+           return_values.status = SCMI_GENERIC_ERROR;
 
 exit:
     if (status == FWK_E_RANGE) {
@@ -579,7 +587,7 @@ exit:
 
     return scmi_pin_control_ctx.scmi_api->respond(
         service_id,
-        (return_values.status == SCMI_SUCCESS) ? (void *)&return_values :
+        (return_values.status == SCMI_SUCCESS) ? NULL :
                                                  (void *)&return_values.status,
         (return_values.status == SCMI_SUCCESS) ? payload_size :
                                                  sizeof(return_values.status));
-- 
2.45.2


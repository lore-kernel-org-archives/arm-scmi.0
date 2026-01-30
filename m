Received: from mail-wr1-f66.google.com (mail-wr1-f66.google.com [209.85.221.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD1792ECD34
	for <arm-scmi@vger.kernel.org>; Fri, 30 Jan 2026 11:26:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.66
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769772368; cv=none; b=TyqBOLI9GzOIP4CLbwaUekOwkBtNtdSgVitrhRXqN4MuctZylLi6D3DIh2nZgzDpfjxq2PEJFMbRpQEPCahfSXhJTcWtLI1TkhxwUQl5+QJxP8RwdJXSnFjjSsQLWI3ia6ru16RWsciFrWJl8uy4KIosgJYS2FogAqC+Bjh9Zjk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769772368; c=relaxed/simple;
	bh=zuica45ST2FvJvBOCYoNysgtV8wmkzlhbdR2aRUyiI4=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=XHU1TE1XeY+mV39CuWCBvXgTb9pJvjv5/fetNRFOXyfTn1LFUEajTb7KMwA/KzvJkxlrBZjL7QkihsId59vFsSunTwwitHXojflHDRuiCV7cQ7gqtMePQIxakTLHeU35gPmA/Sc2UZu3FVBVDrSbbMc6BDIjNutB0Ddg2ukFTTI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ffuor0mV; arc=none smtp.client-ip=209.85.221.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ffuor0mV"
Received: by mail-wr1-f66.google.com with SMTP id ffacd0b85a97d-432755545fcso1395731f8f.1
        for <arm-scmi@vger.kernel.org>; Fri, 30 Jan 2026 03:26:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1769772365; x=1770377165; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=VTSM1Hdnzd9opFai7KOO5We54G9/h05IaQO5gGw5wwg=;
        b=ffuor0mVdQUsGqCsuzi/F8UlKFiPksTdkESdUK5nfFy+Iy/LTUa8YStgWstigdu6ky
         YSCU4nn8q7/wCv2xCynunbnLUkRMBe6T++ZtE3xI4ILTjBuegeR1tg4K4YU+yravnHPZ
         HL872lddj3a7EOvLydwHhAy7SD89pChK1j7ArAGJgIoN0VpblBWw+kYe2RAlWl+VL5w8
         NjzHOKEgGcR87WMZuHmlvJlC4jxGz93+KUCzSH5JyX4A0Ic5jEDaYpx4J+WIANKeZ56r
         veGIgZVc0I2UMic/c2ZDBOuSk8JI1mEAhbppUarMKCRYUtGfHt78ltPkxVM1TpRKuFf7
         GvDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769772365; x=1770377165;
        h=content-disposition:mime-version:message-id:subject:to:from:date
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VTSM1Hdnzd9opFai7KOO5We54G9/h05IaQO5gGw5wwg=;
        b=il1mKpiz9M800Td7xNFUOcf23FefszPacvFdGgOzdZAWd6ZZHvp8mHjU2wIt6BS2Nn
         KPycwvdIS77UHv57U+PEheRL7Wwquq6r39qKdSsP+JM35pGZtef1NbLP399NPIN8ucYc
         1pkcG5J9vPjrndF9z5T2baznb65YQXYkk01151Igxo7jALjgYhg4Ihn3zWdBLOIj6nKR
         c+WqG1kFiDRPKjSNL0FGr7+4LRhvLjYlCTGOwEnITNdO02Houll7/SiONh77QIwF3IQT
         ajM0sePcO6Mn9MGCW/eRBdNchhGFtWeJKSREyvGnhCpvr2KRmNRcHPUD5O1n3SAA5AoB
         R21A==
X-Forwarded-Encrypted: i=1; AJvYcCXp/XrGM7I9CU8ut7n5yZksEfHi/GjtimmIPUyBrpl69ykhjHm++wIJN0x0znx/avU4t5ck5SL/dg==@vger.kernel.org
X-Gm-Message-State: AOJu0YyMqavRVNAdlwOyt4goobyD3o8nRyyLT40t4kz7Gk/N0XS1SR98
	ZLAk7vwzepJjC3x93tBbmEOlrTzlVV50c8BLqoenSKDL/2D4+OEZ1XclxR1402w7VzPNFwEQQ6Z
	asNfJ4GQ=
X-Gm-Gg: AZuq6aJrdYosxQctGGFUeC1U/G6tLZtci/rFw9IwuiXCJ4w9YnEmrL32+lpn9NX4fSC
	Si5JBMjgRZHKCee6u6jJBeXZoH72gWhg/EzjMPPSe1/fXicVHj6eFx5VVoztH7rNxe6KVynSE4f
	3TeL9B6g2Nx74oiRrxDY2TlR8ehlM66pjFN4pEW5fvkTtn3k0tldc/yEtDtZxFjCZIqnQYU50m6
	4W7QSCb22P/zfUoFOqpSKX4UtVQgGlWMHyhBbpPxPb1+qSAu0uO9uNLzpiosK6RP4ynXKeD0Opm
	z4+8NHhF7x0ftUl50OCozYjCmHgvafFSr3R2YMQvuC1hrBhkxmEt/xrBIMpygLwEkdRMwJsDtpv
	ZW0trognWjvUiRd9A2XJHOXtzqvYblcIQEIfgibRWkursqatp3lamcm+FqvLLqgSOl43F+qcU46
	bIkQfiM0oS0y8wneUL
X-Received: by 2002:a05:6000:25ca:b0:435:a815:dd86 with SMTP id ffacd0b85a97d-435f3abb19dmr3987305f8f.62.1769772365032;
        Fri, 30 Jan 2026 03:26:05 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-435e1353ac2sm23044115f8f.38.2026.01.30.03.26.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Jan 2026 03:26:04 -0800 (PST)
Date: Fri, 30 Jan 2026 14:26:01 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Jens Wiklander <jens.wiklander@linaro.org>,
	Khaled Ali Ahmed <Khaled.AliAhmed@arm.com>,
	arm-scmi@vger.kernel.org, op-tee@lists.trustedfirmware.org
Subject: OP-TEE: memory corruption in
 scmi_pin_control_list_associations_handler()
Message-ID: <aXyVSfxbrff_GX8A@stanley.mountain>
Precedence: bulk
X-Mailing-List: arm-scmi@vger.kernel.org
List-Id: <arm-scmi.vger.kernel.org>
List-Subscribe: <mailto:arm-scmi+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:arm-scmi+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding

When we do SCMI on OP-TEE, the in buffer and out buffer are the same buffer.
I added some debug code to confirm this:

diff --git a/module/msg_smt/src/mod_msg_smt.c b/module/msg_smt/src/mod_msg_smt.c
index 853fe66b8d27..1e92dcd49c29 100644
--- a/module/msg_smt/src/mod_msg_smt.c
+++ b/module/msg_smt/src/mod_msg_smt.c
@@ -175,6 +175,11 @@ static int smt_write_payload(fwk_id_t channel_id,
     if (!channel_ctx->locked)
         return FWK_E_ACCESS;
 
+    FWK_LOG_ERR("OUT=%p IN=%p %s",
+               channel_ctx->out->payload,
+               channel_ctx->in->payload,
+               (channel_ctx->out->payload == channel_ctx->in->payload) ? "equal" : "different");
+
     memcpy(((uint8_t*)channel_ctx->out->payload) + offset, payload, size);
 
     return FWK_SUCCESS;

And it's true:

[    0.000000] OUT=0x9c401004 IN=0x9c401004 equal

This normally isn't a problem because we read a few inputs at the
start of the function and then write out the result to the output at the
end.

But in the scmi_pin_control_list_associations_handler() it does a loop
where each iteration reads from parameters->index which is input and
writes to the output with scmi_pin_control_ctx.scmi_api->write_payload()
and that corrupts the input data.

Copying the input buffer to a the stack the issue for me, but I feel
like it is a hack.  It would be better to use separate buffers for
input and output.

I think this comes from:
https://github.com/OP-TEE/optee_os/blob/master/core/kernel/pseudo_ta.c#L93
I added a print statement to there as well:

diff --git a/core/kernel/pseudo_ta.c b/core/kernel/pseudo_ta.c
index 587faa41a770..426870fb934c 100644
--- a/core/kernel/pseudo_ta.c
+++ b/core/kernel/pseudo_ta.c
@@ -90,6 +90,7 @@ static TEE_Result copy_in_param(struct ts_session *s __maybe_unused,
                                va = NULL;
                        }
 
+                       EMSG("n=%lu va=%p", n, va);
                        tee_param[n].memref.buffer = va;
                        tee_param[n].memref.size = mem->size;
                        break;

E/TC:? 0 copy_in_param:93 n=1 va=0x9c401000
E/TC:? 0 copy_in_param:93 n=2 va=0x9c401000

Here is the patch to save "parameters" to a different buffer.

---
 .../scmi_pin_control/src/mod_scmi_pin_control.c   | 15 ++++++++-------
 1 file changed, 8 insertions(+), 7 deletions(-)

diff --git a/module/scmi_pin_control/src/mod_scmi_pin_control.c b/module/scmi_pin_control/src/mod_scmi_pin_control.c
index a0b90dd2b73f..54e613b70f69 100644
--- a/module/scmi_pin_control/src/mod_scmi_pin_control.c
+++ b/module/scmi_pin_control/src/mod_scmi_pin_control.c
@@ -344,7 +344,7 @@ static int scmi_pin_control_list_associations_handler(
     fwk_id_t service_id,
     const uint32_t *payload)
 {
-    const struct scmi_pin_control_list_associations_a2p *parameters;
+    const struct scmi_pin_control_list_associations_a2p parameters;
     uint32_t payload_size;
     uint16_t identifiers_count;
     uint16_t total_number_of_associations;
@@ -362,8 +362,9 @@ static int scmi_pin_control_list_associations_handler(
     payload_size = (uint32_t)sizeof(return_values);
 
     parameters = (const struct scmi_pin_control_list_associations_a2p *)payload;
+    memcpy(&parameters, payload, sizeof(parameters));
 
-    status = map_identifier(parameters->identifier, &mapped_identifier);
+    status = map_identifier(parameters.identifier, &mapped_identifier);
 
     if (status != FWK_SUCCESS) {
         return_values.status = SCMI_NOT_FOUND;
@@ -371,7 +372,7 @@ static int scmi_pin_control_list_associations_handler(
     }
 
     status = scmi_pin_control_ctx.pinctrl_api->get_total_number_of_associations(
-        mapped_identifier, parameters->flags, &total_number_of_associations);
+        mapped_identifier, parameters.flags, &total_number_of_associations);
     if (status != FWK_SUCCESS) {
         return_values.status = SCMI_NOT_FOUND;
         goto exit;
@@ -388,11 +389,11 @@ static int scmi_pin_control_list_associations_handler(
 
     identifiers_count = (uint16_t)FWK_MIN(
         buffer_allowed_identifiers,
-        (uint16_t)(total_number_of_associations - parameters->index));
+        (uint16_t)(total_number_of_associations - parameters.index));
 
     return_values.flags = identifiers_count;
     return_values.flags |= SHIFT_LEFT_BY_POS(
-        (total_number_of_associations - parameters->index - identifiers_count),
+        (total_number_of_associations - parameters.index - identifiers_count),
         NUM_OF_REMAINING_ELEMENTS_POS);
 
     for (identifier_index = 0; identifier_index < identifiers_count;
@@ -401,8 +402,8 @@ static int scmi_pin_control_list_associations_handler(
 
         status = scmi_pin_control_ctx.pinctrl_api->get_list_associations(
             mapped_identifier,
-            parameters->flags,
-            (parameters->index + identifier_index),
+            parameters.flags,
+            (parameters.index + identifier_index),
             &object_id);
         if (status != FWK_SUCCESS) {
             return_values.status = SCMI_NOT_FOUND;
-- 
2.51.0


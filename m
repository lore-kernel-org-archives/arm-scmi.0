Received: from mail-lf1-f65.google.com (mail-lf1-f65.google.com [209.85.167.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B85841C3BFC
	for <arm-scmi@vger.kernel.org>; Wed,  8 Oct 2025 09:11:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.65
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759914663; cv=none; b=rYIDWPr6gRdVtVq+pj1isISZU5q0RnYS20hyj/o3rLMKZTfC8Mp/EMROqIh3CiaWa5yYEoS3s0L8G+BZSvwRuluRfJ8ADzpERpEs676Suv5GdKJyEN7UdY5uiyU+H8IQWLI7IK2Dba3nlCNQRnD360w39paM9GCcSQZs9RFGKLQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759914663; c=relaxed/simple;
	bh=lxN9sOcPPF2unfwKbwqkuvp1Tn4yxMgZZZ9GByqgfeM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=piH74OvwVpn/x2sF7H1Ax8pwgFrbMynnyKq+TbXy6igZc6jAZe5aaTNEvmdWvcTTBeXlfNCVj6KSNewk9EKzC0dNt+T+McBDI3TSY0tPfdrovvn8DxZtT0aG0u2xrg+NLL9OIbe4ItxFgERCNs+XpnS7r+NuEB1dks+Opo3bF8M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IrFjIoVx; arc=none smtp.client-ip=209.85.167.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IrFjIoVx"
Received: by mail-lf1-f65.google.com with SMTP id 2adb3069b0e04-57a960fe78fso8128298e87.2
        for <arm-scmi@vger.kernel.org>; Wed, 08 Oct 2025 02:11:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759914660; x=1760519460; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zxQHIUxFiDeJFOm/Va8E2Uq1rUAx9+BBWG6CQEcxEpY=;
        b=IrFjIoVxXSbK5lorTfKEGGqFRD8mn29MlCFgU7AKupSKN2cZNkNVexzxwQnNl82dah
         NVWTOPJvHEauhe1/sLC276Xg/To9WVHpHXkLSfLlqGdk1yZ6jngDq3y3R4bxT6NgqCW8
         bRcuDIstJathxHe2P2m8gwNYvJ1tEVD6VktJZUgEa1LINbUsjNLkkm/dRwMFWgVf7R2x
         jFc7KvabtieyH71izJ3BZeII3ogWGryH6jeqTdbJ36s8X75BNuhNLqH/Fp9zHgW64vqD
         D/qRtohJmP38VgeU1BvklKqALBNOOWmwIgMpImOZdxHxcuvGLIEN8um0Hkmr+RQQtkvm
         Inlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759914660; x=1760519460;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zxQHIUxFiDeJFOm/Va8E2Uq1rUAx9+BBWG6CQEcxEpY=;
        b=xCSSBrhj7Rcn8I52j5wDSfdS+vKACCKB8BPt8Ol0z1KCDzablrY2bbbEj3eo7KInOb
         79ECDMAT16InZlGuK4nJ8mM8xCHOCuKLD8pM3YafUVFquUqv3pk20HJtgobAtMYLLf74
         pzCU9T9wjKLphBWBNx2l4Jj9V0EI7cyPfW8+Gredp25UkoPWHerIc311F67i6/4RruCW
         Rp6ANBoX75SgBzwXOQxtDXrYPMF76dtkx2NbVnpWkij72oxQJUBfDWEVxY2glLq3cP79
         oX4UoikqUZlrBdNKrgEdvj0hQwbtvAp7Lan8cM9qZqsx9swhVsEOobbROy1WTXH+rtjT
         CUYg==
X-Forwarded-Encrypted: i=1; AJvYcCWUPsyGIriKmvFFHokuFaMOlpYv5iRnW1zL94MB8U8oFh+7CiGaFzsyB10yN0Mnte3k12+w0fDsOg==@vger.kernel.org
X-Gm-Message-State: AOJu0YzhKaTtpI4GfdH5w7Ub/2KJGcnQJkDIeRZ0KYrtPQGLr+ecBgVJ
	YpEv5jr/vb8c1Cbsxst94FppkSj3Go+f0FnS1IpTxG+jLaAW8BxreqTU
X-Gm-Gg: ASbGncsmaFw/xgv2VkZFg/nzKMaVnr7gY2Kryhrih5WHDmO1kyfMEppm79KE+nZ1zIH
	rptEn1VL5TmTSCydJFBw6LI8DDtgTaBPA4877prSqT+tReZI/A5SQPz1i6MXnmZ8/dUvKFKVLOJ
	NNGy5jRqMekvm1d805nYyYQ9aUfomN8gQQjp7puz9bYu5LCEcb17X4kvrhIRNZDMrpiQnnaljtP
	ujZxtdmAyMyfQF13P4s5WhmX1Cg20G+e6+bnASBWHmrde7jiU23j+gjjPdEfJO65SQJRGWhZ7ao
	Kj+zaDJL/Oqkb+j4hSewznVgHNY9sCQYPG0pulTUR6lTchXD8L48/3YgvKOLIGH1Ku+wSYs8M42
	cYD8q+NENrs8b+4qnpfSTOkXbDunrzRshIu7l2fi4oX/JrzTJbQO8ZDum0lF+is1t9sY=
X-Google-Smtp-Source: AGHT+IFFnp5zRiaOqdrWP4/IFuKc5CdpR8oVCCXw/bdrr5L7yHo5ECrtVOBZMd4Ro1bmRiDUe/2GBw==
X-Received: by 2002:a05:6512:3e1d:b0:55f:4bf6:efed with SMTP id 2adb3069b0e04-5906db03742mr681406e87.1.1759914659624;
        Wed, 08 Oct 2025 02:10:59 -0700 (PDT)
Received: from NB-6746.. ([188.243.183.84])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-58b0112462esm7045115e87.3.2025.10.08.02.10.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Oct 2025 02:10:59 -0700 (PDT)
From: Artem Shimko <a.shimko.dev@gmail.com>
To: cristian.marussi@arm.com
Cc: a.shimko.dev@gmail.com,
	arm-scmi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	sudeep.holla@arm.com
Subject: [PATCH v3] firmware: arm_scmi: Fix premature SCMI_XFER_FLAG_IS_RAW clearing in raw mode
Date: Wed,  8 Oct 2025 12:10:57 +0300
Message-ID: <20251008091057.1969260-1-a.shimko.dev@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <aOVGGaY9NmKqUwPG@pluto>
References: <aOVGGaY9NmKqUwPG@pluto>
Precedence: bulk
X-Mailing-List: arm-scmi@vger.kernel.org
List-Id: <arm-scmi.vger.kernel.org>
List-Subscribe: <mailto:arm-scmi+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:arm-scmi+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The SCMI_XFER_FLAG_IS_RAW flag was being cleared prematurely in
scmi_xfer_raw_put() before transfer completion was properly acknowledged
by the raw message handlers.

Move the SCMI_XFER_FLAG_IS_RAW and SCMI_XFER_FLAG_CHAN_SET flag clearing
from scmi_xfer_raw_put() to __scmi_xfer_put() to ensure flags remain set
throughout the entire raw message processing pipeline until the transfer
returns to the free pool.

Fixes: 3095a3e25d8f ("firmware: arm_scmi: Add xfer helpers to provide raw access")
Suggested-by: Cristian Marussi <cristian.marussi@arm.com>
Signed-off-by: Artem Shimko <a.shimko.dev@gmail.com>
---
Hi Cristian,

Oh, sorry, sure.

Could you please have a look to a new version of commit.

Thank you!

Best regards,
Artem

ChangeLog:
  v1:
    * https://lore.kernel.org/arm-scmi/20250929142856.540590-1-a.shimko.dev@gmail.com/
  v2:
    * Use simpler approach suggested by Cristian Marussi
    * Clear all xfer flags in __scmi_xfer_put() under spinlock protection  
    * Add Fixes tag as requested
    * Drop completion timeout mechanism from v1
  v3:
    * Updated commit description as suggested by Cristian Marussi

 drivers/firmware/arm_scmi/driver.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/firmware/arm_scmi/driver.c b/drivers/firmware/arm_scmi/driver.c
index bd56a877fdfc..0976bfdbb44b 100644
--- a/drivers/firmware/arm_scmi/driver.c
+++ b/drivers/firmware/arm_scmi/driver.c
@@ -821,6 +821,7 @@ __scmi_xfer_put(struct scmi_xfers_info *minfo, struct scmi_xfer *xfer)
 
 			scmi_dec_count(info->dbg->counters, XFERS_INFLIGHT);
 		}
+		xfer->flags = 0;
 		hlist_add_head(&xfer->node, &minfo->free_xfers);
 	}
 	spin_unlock_irqrestore(&minfo->xfer_lock, flags);
@@ -839,8 +840,6 @@ void scmi_xfer_raw_put(const struct scmi_handle *handle, struct scmi_xfer *xfer)
 {
 	struct scmi_info *info = handle_to_scmi_info(handle);
 
-	xfer->flags &= ~SCMI_XFER_FLAG_IS_RAW;
-	xfer->flags &= ~SCMI_XFER_FLAG_CHAN_SET;
 	return __scmi_xfer_put(&info->tx_minfo, xfer);
 }
 
-- 
2.43.0


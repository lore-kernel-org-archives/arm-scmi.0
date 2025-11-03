Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com [209.85.208.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5667430E847
	for <arm-scmi@vger.kernel.org>; Mon,  3 Nov 2025 16:10:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762186256; cv=none; b=HOeFGgkKXSnm42VrKb+Kp8yeZSAEPZt3lYLNdd40B9Ca5snWZBwKq7F0BaoARxuRdNbWzvwemkCmHKS/gnkJwJWG6ueQysBcZpgZIY5ZWxDkP6+CqphOgMIHk5zjnYEBDjSQjnHC8mXFSUx5saYyMS1qKx0onC3DkAVBTPDIhiM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762186256; c=relaxed/simple;
	bh=ktlRiybfVEE4M9mS7/vq+nrhzHGkjir61sJqYVJa+ps=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=RNhze1T0Zk6EiM4c6aFf/6Sqx8VqnzNPwjxy/RtPz1kbYy80tMsgiU/6zFlWxVDKj9u2AJ4hG60bh3oCD0F2Onij5yLF3+q7F/ItBQWnMTCTOi4eKW4QMFjbFbNPOsVbHVeUmkeNOz2ldOYh2IG/gcVATxeF+MopWDAcqCA3kh8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nrEAoAO4; arc=none smtp.client-ip=209.85.208.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nrEAoAO4"
Received: by mail-lj1-f179.google.com with SMTP id 38308e7fff4ca-378e8d10494so48005021fa.2
        for <arm-scmi@vger.kernel.org>; Mon, 03 Nov 2025 08:10:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762186252; x=1762791052; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=cFtPE9g4ieXWJSfE3Mqom4niwcqmKkIZ8WbFN2jJcvg=;
        b=nrEAoAO4ZpOQALrpx1tIpxmRjJ+0Bck3VVr5ytZ7wpDrK8S3KY1WDAlk0Uaw55Mh+p
         jUpQS8XspuoByl/YltxviIGmeNl9WXeLOGXS4V52OT47zKUdnLDQcjLYe2I+YxJ2LUMR
         pOBgDwn/4E3B/zn5Y6IRp5xlBXFZy1QzUd06QGA2pMCpI987IK/EOvZt+o17dlnmm+fi
         jJviZQFdqBE9O9WYf/PFJPPESsuboI3qauxu/KcCtUXx6pFvOogAPFE6+d9Qxihgos35
         sfVjrVuI+7U8AeHmDZTh9ZOWt43cYoEotYTx59Cu9Un9GzhIAzB2UmN6Kd6GcWUA4rni
         wYmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762186252; x=1762791052;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cFtPE9g4ieXWJSfE3Mqom4niwcqmKkIZ8WbFN2jJcvg=;
        b=VYfakgrMAV2/lYKzvcBdEgNbYjtoUWqtva8zmGF1JujvSkTshs1mIVUvvf55m3XCvq
         vsFyXLD3xaEn5LL/2kDmcwb+KWGu5OTXcWvIMttyknYxwYrlOpbeGReIaycym6EIoy/5
         EQHtyPjGd1Iol0iBavCFn7cmJZbBymzM/nvF4X/DVP4MDtchV61WWoF+QOL/IDS07yNL
         XgRkOj3up4fItJkdeQ8hQZ2AmuupTQWTnn1JPYvVLHDnfQ1jXhYa+z0JGX3e7tz9vScQ
         4v+BgrXBqiS/20vnCSjjLlCK36gl1UtGX2eXtiryK6BE7jvH8rWbw+QoJ+9O1S55fRde
         m97w==
X-Forwarded-Encrypted: i=1; AJvYcCWDzTmibbOWaX6R8V0H9yajm6KYtnNm0PDPSnmhJX0oFabyjxGn1RbbAH0qpK6pmkk6L6qiHchpjQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YyyKC+iLW7iOPs/JjHERLbq9+pL7v/VypBDgFi7eF9OKIyoy+qg
	g1bb+0Xx9oeGicDAVYQ7R49ofYYChSNo2jcl/HWSLlm5WNuzPpjakqTdpgI9y5dytLA=
X-Gm-Gg: ASbGncvkXRoOpb8fCQCXt43rLjdZR58bnizrxjl5A0bTCh05aVKoUdNYDPtha9gjmgV
	KVb/iVm+uL8geNaSKr5oPfUlNkEgcfb83oX/qOGEaXs+H5seicPBNYLX1kp7AZVZbHLrEndykPI
	aS0RXisairKFM1DVW0mrjtR9+Gzy1l0qZJD0bwPtCzCeffIHWwVeMcZlITz/tyUHDWGpFqwiVmU
	ghGtjZ6AZ+omtkz/G7BaWlxUWJ87U6e9EQUGCPwjzwCvSK3aoMRb52hIwenSTwnYxN/CmUsaIJq
	SQW+zFJ1iVzB9ezgo7TWc1APocEYoRtOnaswvp+4qMx8/QMADVZruZY2w2tTrnMEFZdMqR8NSB7
	8egyIyIght3mcRCNMPoHUN/2K6ZZRCOcwd9ZIT4yG1wfyys6j3Ns2Jm4noBBImPvjuoTcFB2sd1
	M=
X-Google-Smtp-Source: AGHT+IHi5+1WnUMMnmI9WW8vac117JgHMer+uQjCtLqpPudFJmKKnUMgQHR5NcfnfbgtqZCF7Ymeww==
X-Received: by 2002:a2e:bcd0:0:b0:338:8:7275 with SMTP id 38308e7fff4ca-37a18dfbddfmr37782521fa.25.1762186251889;
        Mon, 03 Nov 2025 08:10:51 -0800 (PST)
Received: from NB-6746.. ([188.243.183.84])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5943443966esm22772e87.68.2025.11.03.08.10.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Nov 2025 08:10:51 -0800 (PST)
From: Artem Shimko <a.shimko.dev@gmail.com>
To: Sudeep Holla <sudeep.holla@arm.com>,
	Cristian Marussi <cristian.marussi@arm.com>
Cc: a.shimko.dev@gmail.com,
	arm-scmi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2] scmi: reset: validate number of reset domains
Date: Mon,  3 Nov 2025 19:10:43 +0300
Message-ID: <20251103161044.2269377-1-a.shimko.dev@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: arm-scmi@vger.kernel.org
List-Id: <arm-scmi.vger.kernel.org>
List-Subscribe: <mailto:arm-scmi+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:arm-scmi+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add validation to reject zero reset domains during protocol initialization.

The fix adds an explicit check for zero domains in
scmi_reset_protocol_init(), returning -EINVAL early during protocol
initialization. This prevents the driver from proceeding with a
non-functional state and avoids potential kernel panics in functions
like scmi_reset_domain_reset() and scmi_reset_notify_supported() that
assume dom_info is always valid.

The change is minimal and safe, affecting only the error case while
preserving all existing functionality for valid configurations.
The existing -ENOMEM handling for memory allocation remains unchanged
and sufficient.

This change ensures early failure with -EINVAL during protocol
initialization, preventing silent failures and maintaining system
stability. The existing -ENOMEM handling for memory allocation remains
unchanged and sufficient.

Signed-off-by: Artem Shimko <a.shimko.dev@gmail.com>
---
Dear SCMI Maintainers,

This patch addresses an issue in the SCMI reset protocol initialization
where a zero value for num_domains could lead to a non-functional state
or potential NULL pointer dereferences.

Currently, if the platform reports zero reset domains, the driver
continues initialization but creates an inconsistent state:

    ret = scmi_reset_attributes_get(ph, pinfo);
    if (ret)
        return ret;

    /* When num_domains == 0: */
    pinfo->dom_info = devm_kcalloc(ph->dev, pinfo->num_domains,  /* 0 */
          sizeof(*pinfo->dom_info), GFP_KERNEL);
    /* Returns ZERO_SIZE_PTR (not NULL) */
    
    if (!pinfo->dom_info)  /* ZERO_SIZE_PTR != NULL, condition fails */
        return -ENOMEM;

    /* Execution continues! */
    return ph->set_priv(ph, pinfo, version);  /* Returns SUCCESS (0)! */

However, subsequent reset operations crash when accessing dom_info:

    static int scmi_reset_domain_reset(const struct scmi_protocol_handle *ph,
              u32 domain_id)
    {
        struct scmi_reset_info *pi = ph->get_priv(ph);
        struct reset_dom_info *dom = pi->dom_info + domain_id;  
        /* ZERO_SIZE_PTR + domain_id = INVALID POINTER! */
        /* KERNEL PANIC on dom-> access */
    }

The protocol appears to initialize successfully but is actually non-functional
and will crash on first usage.

The patch adds validation to reject zero domains during initialization,
ensuring fail-fast behavior and preventing hidden failures. This approach
maintains system stability by catching invalid configurations early.

Testing confirmed normal operation with positive num_domains values and
proper error handling with zero domains. The change is minimal and safe,
affecting only the error case while preserving all existing functionality
for valid configurations.

This patch fixes a potential crash scenario while maintaining full
backward compatibility with properly configured systems.

If this is a working case, I will check and supplement other protocols such as
sensor and power domain.
--
Best regards,
Artem Shimko

ChangeLog:
  v2: Change commit message

 drivers/firmware/arm_scmi/reset.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/firmware/arm_scmi/reset.c b/drivers/firmware/arm_scmi/reset.c
index 0aa82b96f41b..458b75fcc858 100644
--- a/drivers/firmware/arm_scmi/reset.c
+++ b/drivers/firmware/arm_scmi/reset.c
@@ -358,6 +358,9 @@ static int scmi_reset_protocol_init(const struct scmi_protocol_handle *ph)
 	if (ret)
 		return ret;
 
+	if (!pinfo->num_domains)
+		return -EINVAL;
+
 	pinfo->dom_info = devm_kcalloc(ph->dev, pinfo->num_domains,
 				       sizeof(*pinfo->dom_info), GFP_KERNEL);
 	if (!pinfo->dom_info)
-- 
2.43.0


Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com [209.85.208.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A08D302779
	for <arm-scmi@vger.kernel.org>; Wed, 29 Oct 2025 17:35:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761759312; cv=none; b=QDDcUpuDe5fURmb7dBcgL61EPvjL3zL/fuH+brNT1+FbXLpbxl6lKJXQQrjYrNOzrzA4CmAEr83Ww/SinQ8gwn5BeV1H27ogwqNB+zweZrAsQt84vwWAc3t2y88XTy6P+hBc4nZwC2MsyoxoHqkPb1BP5GWpb+f4o3FcAQBXbmM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761759312; c=relaxed/simple;
	bh=g98qGunIl/C664+ehFNVQ4SzabEgiIu2KI5IioXRSsU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=u7gdXfrvvq7mhx8cgXpK5Xk0o6hRCYztPkOPIDUhngs5lZ2NV6SWpYPV45N5Gwi1kixVtBiWMrPxGTKZR6Qx1CFDqQ80rCcYfKJx/H3ohyMe9ELtedSV0Uxx7T5RgVbN7FK5QSDJEl+2ERQaeyjdP0hkRUuYmoip9YSbuirBXAU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=i6r0cFn6; arc=none smtp.client-ip=209.85.208.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="i6r0cFn6"
Received: by mail-lj1-f181.google.com with SMTP id 38308e7fff4ca-378d246f0f1so377281fa.3
        for <arm-scmi@vger.kernel.org>; Wed, 29 Oct 2025 10:35:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761759308; x=1762364108; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=XdYN/06x3KRPapdi984l0BW/Th8+IhDTjM+xhirl2Oc=;
        b=i6r0cFn6LcL7XUA0vVoFj7DnZRD6PWfrlydvSkHABX9eonsBGXmY358b4GQQYUhuaz
         XalJB7WjMFlVzPY1hecsRynsklJnG6pukgfnpxvaFMxLkzqzAMrTUUUzo6HIBJpKMv30
         rjlGFZVVPkCDqTQ6cL9GQeqqlWomPLJgFqo5qRnbAPJcMYB/ZNICiZo8/f7F9Wy/HRlI
         Rb5JVuv69c9bq43XNdy9sUajbPhHkT3t7qVCIV1VWMFP98E1kPYCwNCNGiQ9uwU21epX
         aqaHBQ/NuX1Pck9FF9YxWzldyNwc/sfKGSadhmbCQUB22BjEbVlIDcsZGGV0oBMvQWIO
         Fm7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761759308; x=1762364108;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XdYN/06x3KRPapdi984l0BW/Th8+IhDTjM+xhirl2Oc=;
        b=Tabnlz33iIL8OoWeVj446PGihDE55vaDJJ7CA3ArXHz8c1MHwUYfsv+SU/CbNhQ9HG
         Pe6C0l5lk3UNqj1QhUbha/BzfpcYCp8XcRhiqUCu6EffLIphfjNKCTSnmZLiE9iWkRtv
         SJxgU1dJcTCCmfNwcmk3rsiyajEQUglcldyg8MZJbUruIKVJZfGQxpvOhV5HLwsx4BH1
         Bwi4CLfQZtTPTDUJkoz9EGEL9NOGAgidkixJODjiGpwG+roJLjxubX8QuRjrCe6sK6pU
         4FM55L4vf9wr7YTlQ2PXVjX2kadpLceBIQ3DOmu66x61TPOgh2bU0XDwLoj+21oWZ99v
         MEMw==
X-Forwarded-Encrypted: i=1; AJvYcCV5N1niJxucxbgaZZ/pHjhT87hw9gr9/5kQAtNT28EJAs95vfPP2EjGA2IVjb+tMIIcShPtAR+EVQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwnTXf2Snbxk9OXjTwJzqNRmvvndKkvqR3s1NLKku4i6SkbWCZq
	FRsLavyzedprxEVjS/FmuAreIG2WoVCxmUwkz1LIyLMbQQxOoW/q85Ud
X-Gm-Gg: ASbGnctkDMVhqKndBfKbnU1tJ7+W+NTN8tn3PnjxMIbpDek7s5lSlqbKfZ5U0AumQVC
	jBh5tzHtkYp7HJTLUJcyo/+9DTfHl2J96uA5Zm+8bN9vowDUJ993wiT1+zX8PGLEdlIFz2f+HSS
	NykTcvsqpAk+BoQFMIY3VMl78eoBMuMnWOEVu6P+HjNZP9HfoUty64r5x0Uf9HCfP65t3E4NYrl
	RrXmoy+tX58/qo/gZ+ANsqYfxPFbGYMriFONSvJY75ikDQMLRLZJ1XRtjHMZuLQiCf+i7RsJ2/h
	3/Y20lCCX3yF8Hrug3XTNSzJx3eWFAJbbDKRX1xEeqzgzmdzsJvjbrOuLYd180XOHkQtGdymZ9G
	+Zjhh+5/qAQyFNN7kdeM0ZxqazTd8CzxsUI9VWouU+24SoLG/IRS+x2EI0r6zezOpHCjEYxq+TN
	hvZMQ9Kfz3Agzwh9xiRQ==
X-Google-Smtp-Source: AGHT+IEwDLNwLK/A2+TDrXzVle4wM4y4gZurIwihWWiE7msduXVNYsAHjJg+irNLnRcqkFgHzU7XvQ==
X-Received: by 2002:a05:651c:516:b0:36b:d9d2:734c with SMTP id 38308e7fff4ca-37a023ba9demr13208061fa.8.1761759308078;
        Wed, 29 Oct 2025 10:35:08 -0700 (PDT)
Received: from NB-6746.corp.yadro.com ([188.243.183.84])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-378ee091f33sm37346051fa.3.2025.10.29.10.35.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Oct 2025 10:35:07 -0700 (PDT)
From: Artem Shimko <a.shimko.dev@gmail.com>
To: Sudeep Holla <sudeep.holla@arm.com>,
	Cristian Marussi <cristian.marussi@arm.com>
Cc: a.shimko.dev@gmail.com,
	arm-scmi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] scmi: reset: validate number of reset domains
Date: Wed, 29 Oct 2025 20:34:55 +0300
Message-ID: <20251029173456.1749436-1-a.shimko.dev@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: arm-scmi@vger.kernel.org
List-Id: <arm-scmi.vger.kernel.org>
List-Subscribe: <mailto:arm-scmi+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:arm-scmi+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add validation to reject zero reset domains during protocol initialization.
While the SCMI specification allows zero domains, the current driver
implementation cannot handle this case safely.

The fix adds an explicit check for zero domains in
scmi_reset_protocol_init(), returning -EINVAL early during protocol
initialization. This prevents the driver from proceeding with a
non-functional state and avoids potential kernel panics in functions
like scmi_reset_domain_reset() and scmi_reset_notify_supported() that
assume dom_info is always valid.

The change is minimal and safe, affecting only the error case while
preserving all existing functionality for valid configurations. The
existing -ENOMEM handling for memory allocation remains unchanged and
sufficient.

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

Case with num_domains == 0 before the fix:
[   25.617950] SCMI Notifications RESET - drivers/firmware/arm_scmi/reset.c scmi_reset_protocol_init
				num_domains == 0
				pinfo->dom_info == 0000000000000010
[   25.623655] Unable to handle kernel NULL pointer dereference at virtual address 0000000000000010
[   25.625241] Oops [#1]
[   25.625585] Modules linked in:
[   25.626343] CPU: 1 UID: 0 PID: 62 Comm: kworker/u39:0 Not tainted 6.12.0-01121-g62b3fcf44d59-dirty #1
[   25.627257] Hardware name: YMP ELCT QEMU (DT) 
[   25.628276] Workqueue: events_unbound deferred_probe_work_func
[   25.629447] epc : scmi_reset_protocol_init+0x256/0x2de
[   25.630109]  ra : scmi_reset_protocol_init+0x248/0x2de
[   25.630616] epc : ffffffff8080d618 ra : ffffffff8080d60a sp : ffffffc600263350
[   25.631232]  gp : ffffffff81a4d9d8 tp : ffffffd60e834380 t0 : 0000000000000008
[   25.631897]  t1 : ffffffffffff0000 t2 : 69746f4e20494d43 s0 : ffffffc6002633f0
[   25.632570]  s1 : 0000000000000000 a0 : 0000000000000000 a1 : 0000000000000000
[   25.633364]  a2 : ffffffd60ece0740 a3 : 0000000000000000 a4 : 0000000000000001
[   25.633950]  a5 : ffffffd60f75c640 a6 : ffffffd60e834480 a7 : 0000000000000001
[   25.634496]  s2 : ffffffd60eee3440 s3 : ffffffd60e812a30 s4 : 0000000000000010
[   25.635037]  s5 : 0000000000030000 s6 : ffffffff80000000 s7 : 0000000000000000
[   25.635581]  s8 : 0000000020000000 s9 : 0000000000000002 s10: ffffffffffffffff
[   25.636127]  s11: 0000000000000048 t3 : 00000000000000ff t4 : 0000000000000000
[   25.636660]  t5 : 0000000000000001 t6 : 0000000000000008
[   25.637071] status: 0000000200000120 badaddr: 0000000000000010 cause: 000000000000000f
[   25.637836] [<ffffffff8080d618>] scmi_reset_protocol_init+0x256/0x2de
[   25.638472] [<ffffffff80805670>] scmi_get_protocol_instance+0x186/0x44e
[   25.638984] [<ffffffff8080597c>] scmi_devres_protocol_instance_get+0x44/0x88
[   25.639501] [<ffffffff808059d2>] scmi_devm_protocol_get+0x12/0x30
[   25.639917] [<ffffffff804e3978>] scmi_reset_probe+0x3c/0xce
[   25.640278] [<ffffffff808010cc>] scmi_dev_probe+0x18/0x26
[   25.640566] [<ffffffff8058541c>] really_probe+0x8a/0x30a
[   25.640830] [<ffffffff80585700>] __driver_probe_device+0x64/0x10a
[   25.641147] [<ffffffff80585864>] driver_probe_device+0x2c/0xb2
[   25.641450] [<ffffffff8058595e>] __device_attach_driver+0x74/0xd2

If this is a working case, I will check and supplement other protocols such as
sensor and power domain.

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


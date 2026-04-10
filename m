Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BAA2387593
	for <arm-scmi@vger.kernel.org>; Fri, 10 Apr 2026 23:44:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775864695; cv=none; b=Z1bQn7D5w9FhJxDNoh+MlwIKOJbsJMuvDwjwQM8AfZTyfeRnTwBp4oO/GKZvhYBoX20+2i1tyWr36Q3vD+i8NP7EMhxjB54P0omqqg9HX+esiV84Nnwm+FIzKoIrD2N4UKHMSX5AS3tD7X6wp/AOvqJmEUnzX0A+fOf1me5c5o0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775864695; c=relaxed/simple;
	bh=aPM/J6Atyc6lQWjkUGFT2TxILqNUCfZT//AqqZmtYrw=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=o0RoFZAgHW8jGoklsbFjdlJH3CSo2RAYpNYzK3dZqsNoUk7+4JGzYWqnNcsRVhjfiHWt0Kg+S5etwRHMGulqXUSqAwujpHV5KPxtrnpZJm8EADPT3nm1PFGTTE98h46zB0YdM/sfGeF7zUJtOJpEeMpT8DscgKLsVJwHoyMS6So=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20251104.gappssmtp.com header.i=@baylibre-com.20251104.gappssmtp.com header.b=IyzuWapz; arc=none smtp.client-ip=209.85.210.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20251104.gappssmtp.com header.i=@baylibre-com.20251104.gappssmtp.com header.b="IyzuWapz"
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-82f22f6b0feso9827b3a.0
        for <arm-scmi@vger.kernel.org>; Fri, 10 Apr 2026 16:44:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20251104.gappssmtp.com; s=20251104; t=1775864691; x=1776469491; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=huYHr9pbT+aIbCmPuPJO5mChpAaAzejhwMiDIrUto84=;
        b=IyzuWapzYS2VcpNyYxmGflSHPnVfTJnm9m574rPAFT7qsnLa/ibCVBdPPUjYjV0q35
         ywZfSclvAyMKNDBZv0yik3Y7/5ycSpnaD113su2w37jETxS7oSB+0TFeBTK+NPPd7ivR
         eWKDUlTdu9Ty6OjQ8+GyaD+cmlxuULu5WdJwMRy86pyvZmn7YMlKHD6SaloBPj2z1KkF
         SgIQDz5p+161C8d61YbN/8y+5eq0LICeGszhh29kkqeMd64216WogSi2C2YutOQBBBZf
         u5f7s+MSK82Oip0anb9LiSvCEcrHw4tFMtve5N2d37UN/RtVwyv/z254EBa12jGkWeH8
         zjqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775864691; x=1776469491;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=huYHr9pbT+aIbCmPuPJO5mChpAaAzejhwMiDIrUto84=;
        b=ZKHkls7L28LrHOtUmpIuGxnRhZai4W57eqQyQfl+JTTZdGxusV1obd2Klvgkpek4b1
         JCFAjTYGbail1E13GYRJKel3XU5BaPhw7qS1vmsN9XPNfV9qsLUPI/wSvYvKI2B6gUbr
         +O8vq08oOO6lX6ZrHoRAT3HsD4AobhqlwVxzST4sbac9wyE9DbejKR+DSV5uepbqD2PZ
         95Bvge6xCPqehBRyxhq2e2iPT9sw3R1+N2zuFiEMnIY0hKf1ztDNqJt0glyOaPA1ulAQ
         Cs48DR0qwHB+htOmdXoYfqUUBs5BXWxR7yikLELsnctKiFRQbzhX93YMtRNKDarhWXtv
         2SAw==
X-Forwarded-Encrypted: i=1; AJvYcCVVQCTDTvx78b52RJBfVV4AnlQu27AahHmzF33FWjnz508EGbWeC8rK03/WHn4IHc8uOFwINUCUoA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yyn0pltSVrhdoJUXQfdnx/Az+OvwQSv0OEY2r3cfRR+hP0XqLFX
	U6PNqOBzgeo0aZtcTVo4LUt+yOiucBIRDCSQe7ow1kISI5EhNwloNdBhcA3X7a2fqcU=
X-Gm-Gg: AeBDievh1V/TZSfwaAV1f3UUOnAJDzQhtOc8G0WXAFupy5XI4U+sFK0gfXl70giN8nV
	xooNIIzLoV8k+tJh3fzskKKxE9wfQCH/CsNs5nRu40UZvXJ0+Km9l2JpYhFquRPkpEJiQ43TMS6
	qh9fX4NOAAbKnTMVEx34QOtHPvD3+9lAOM6yHYNU2bBvJS1FOslP44gE+bvWqe0c/YSFN2MMsxd
	8bYxKe+EJo1jVAlNM/JVLkggEiEIVgbszRkUNK1SA8OT65KWxHpNllz9XycyqRi9ZhWrkTWozPD
	BzgYPGKQsDXWpPkXQzpNYhQbYQp7YeYxZiL9cMtnERTzHafdDw8QQkQJIMOX9fq84rKj31vRvbq
	J9DZdS1RzUrnH8Bthp3lxPTiF57MKfmpcGBGiL7LfZ4P61F3jsFKqHrYQRvXbaJeDM/S9abdXaF
	YllawSmvrqVoJWm6p1cV8=
X-Received: by 2002:a05:6a00:2291:b0:822:6830:5900 with SMTP id d2e1a72fcca58-82f0c131fe8mr5687894b3a.6.1775864691397;
        Fri, 10 Apr 2026 16:44:51 -0700 (PDT)
Received: from localhost ([97.126.187.42])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82f0c50d24bsm5199585b3a.57.2026.04.10.16.44.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Apr 2026 16:44:50 -0700 (PDT)
From: "Kevin Hilman (TI)" <khilman@baylibre.com>
Subject: [PATCH v2 0/3] pmdomain: core: add support for domain hierarchies
 in DT
Date: Fri, 10 Apr 2026 16:44:35 -0700
Message-Id: <20260410-topic-lpm-pmdomain-child-ids-v2-0-83396e4b5f8b@baylibre.com>
Precedence: bulk
X-Mailing-List: arm-scmi@vger.kernel.org
List-Id: <arm-scmi.vger.kernel.org>
List-Subscribe: <mailto:arm-scmi+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:arm-scmi+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAGOL2WkC/42OTQ6CMBCFr0Jm7ZgW5CeuvIdhUcogYyjFthIN4
 e4W9AAuX/K9770FPDkmD+dkAUcze7ZjDOkhAd2r8UbIbcyQirQQmRQY7MQah8ngZFprFI+oex7
 ayHmkrM1LRXkpTgKiYnLU8WvXX+tv9s/mTjpszh/h6PGMu+GLQaM8obbGcDgnc3GUFWzVnn2w7
 r0fneVO/vdpligwzwpZVKWSVdddGvUeuHF0jCtQr+v6AeWCMlYGAQAA
X-Change-ID: 20260310-topic-lpm-pmdomain-child-ids-e3d57ae57040
To: Ulf Hansson <ulf.hansson@linaro.org>, Rob Herring <robh@kernel.org>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>, linux-pm@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=2918; i=khilman@baylibre.com;
 h=from:subject:message-id; bh=aPM/J6Atyc6lQWjkUGFT2TxILqNUCfZT//AqqZmtYrw=;
 b=owEBbQKS/ZANAwAIAVk3GJrT+8ZlAcsmYgBp2Yty8etfKsq26Uwcdeie8PHr7MO6o7FocgTRi
 Dsr/NXJk1aJAjMEAAEIAB0WIQR7h0YOFpJ/qfW/8QxZNxia0/vGZQUCadmLcgAKCRBZNxia0/vG
 ZciKD/9w5DzMzDtkLd5MFvW6NXTCrw7RU+nBKNEmAkSIKvwJJNIiVjKky6HXf7s3WaEfLY6aQQI
 TVzGCpWNNprKPNrTSFDoki3zzuSKoULopyeOodq9U8kYJLfyVMOA6FUdltIArsiHyeI8U4AswFU
 /pNN97hk2zOQfdOLYnhrnKMGZj7dfUrlp/2XdmwVcTH0wMdL2EUJWgo5nhpOXCcXmqTo0Q/Wrly
 l4WzqxaTqYWL1k5FAeJQlyL/D5ybDcP/iwk98ElOjOpBhbwpnXlthwMheOldPNkchGkESngwDv9
 7qi3AAuK4/RAbvHr8H1NwuLA0rBb7GdzTUmBTQeh1jS9AL+5ADu0gwmMS7lBul31vbJ7ikrq+zp
 o1KBTCSiYtVYEeXa53E7iCF05XLc9AHrffhF5BGsMu2xsdemEK6hG2PURiRrXNwDxHhxm2UFFt5
 xuwxzaD/9XGOaOFXLFuIubVzI9Kv/RcawuzKLRmi5sMPNYq6Enjg59VtScYIi+gW1LMKpmHZBoy
 XiPHF+rNtaOC4DR/3bmjM//WzuXiCkbNJnYQEVVGIeAcdxQYwBU7NGFN1rZHzQzQHv93PLoFlx+
 uCHusFOjLcJES5qUWbBqXElwAy538ZgFsJ2mD/cLy6ylDsak+dfhvD9Ducp5iUixDLjEfcShLL5
 lu9h+4pnWLivOfQ==
X-Developer-Key: i=khilman@baylibre.com; a=openpgp;
 fpr=7B87460E16927FA9F5BFF10C5937189AD3FBC665

Currently, PM domains can only support hierarchy for simple
providers (e.g. ones with #power-domain-cells = 0).

Add support for oncell providers as well by adding a new property
`power-domains-child-ids` to describe the parent/child relationship.

Also adds the first user of the new API: the Arm SCMI PM domain driver.

Signed-off-by: Kevin Hilman (TI) <khilman@baylibre.com>
---
This idea was previously discussed on the arm-scmi mailing list[1]
where this approach was proposed by Ulf, and then an initial RFC[2]
implementation was made.  From there, it was suggested by Rob[3] to
use a nexus node map instead, which led to several more versions
attempting to implement that, culminating in v5[4], where Rob and
Geert then had second thoughts about the power-domain-map approach.

Therefore, I've gone back to the approach in the initial RFC[2] to use
the child-ids approach.

Changes compared to initial RFC[2]
- dropped RFC
- rewrote the parse/add function to use iterators/helpers from of.h
- add a remove function for cleanup
- use child domain language instead of subdomain

[1] https://lore.kernel.org/arm-scmi/CAPDyKFo_P129sVirHHYjOQT+QUmpymcRJme9obzKJeRgO7B-1A@mail.gmail.com/
[2] https://lore.kernel.org/all/20250528-pmdomain-hierarchy-onecell-v1-1-851780700c68@baylibre.com/
[3] https://lore.kernel.org/all/20250528203532.GA704342-robh@kernel.org/
[4] https://lore.kernel.org/r/20260122-pmdomain-hierarchy-onecell-v5-0-76855ec856bd@baylibre.com

Changes in v2:
- dt-bindings: fix warinings from make dt_binding_check
- scmi_pm_domain: switch to dev_err()
- pmdomain: core: fix locking around add/remove domains
- pmdomain: error unwind if any children fail to be added
- pmdomain: fix node reference leak
- pmdomain: ensure power-domains and child-ids properties are same
  length before iterating
- Link to v1: https://patch.msgid.link/20260310-topic-lpm-pmdomain-child-ids-v1-0-5361687a18ff@baylibre.com

---
Kevin Hilman (TI) (3):
      dt-bindings: power: Add power-domains-child-ids property
      pmdomain: core: add support for power-domains-child-ids
      pmdomain: arm_scmi: add support for domain hierarchies

 Documentation/devicetree/bindings/power/power-domain.yaml |  34 ++++++++++++++++++++++++++++++++++
 drivers/pmdomain/arm/scmi_pm_domain.c                     |  14 +++++++++++++-
 drivers/pmdomain/core.c                                   | 166 ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
 include/linux/pm_domain.h                                 |  16 ++++++++++++++++
 4 files changed, 229 insertions(+), 1 deletion(-)
---
base-commit: f7b88edb52c8dd01b7e576390d658ae6eef0e134
change-id: 20260310-topic-lpm-pmdomain-child-ids-e3d57ae57040

Best regards,
--  
Kevin Hilman (TI) <khilman@baylibre.com>


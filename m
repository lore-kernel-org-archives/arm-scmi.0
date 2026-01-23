Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com [209.85.215.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2EBBC33D6E7
	for <arm-scmi@vger.kernel.org>; Fri, 23 Jan 2026 01:14:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769130857; cv=none; b=DRLF9ASVkPyCzZCAhOvSk+5g1oh2yyIiA/oj3l2JQqYWhFKN/fV08lABuTlrOOL3coWB3XBtAG1ux0x/HPL2fEAGNoFqCyv30nztT97T009RZxQ171YKT6SOsImdghm5MWzYN48UZwQ1haGIVVlpfTU+YJv4/+y3phCMmXxq/fk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769130857; c=relaxed/simple;
	bh=aY3lzdYo34rzzl5rEA1NOAbbPbFMvxFb3wjxISqu7SQ=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=oOANfnDmxcg5qAbYtdrNbc7Eb/ruhjmKUXV2HrZ9aQsm5RQtDfB/pjv5PIzp45TtTVrO2RbPqNC2eeICgLRiEy+CxE1i7heYgYDueVtBDUoRQKefKu71IZ+5nPqPaycFv1rb//M0E/sFjeQK5Vs3292ijq3pnumOgKmJiqsVMJ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=J3QaCRwG; arc=none smtp.client-ip=209.85.215.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="J3QaCRwG"
Received: by mail-pg1-f174.google.com with SMTP id 41be03b00d2f7-c633984fbeeso514526a12.0
        for <arm-scmi@vger.kernel.org>; Thu, 22 Jan 2026 17:14:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1769130847; x=1769735647; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=WRGD2YWjrtmwGYVwivTN08CsAVPXSr88y6f4NIlNfN8=;
        b=J3QaCRwGdyavKFsHN5awhCZf+u1HtFoeQvffyHjMsLC501Rdy/w3ttC4v3J83ekTgb
         ODqn9SsS5WImJ1hC2CKwxpEAPJ7fuMFWvvd1JkTGFtvGAFP7MAKuIgnbQF4X+3CYBasI
         MRs13SPzl88zMAoZ6L+SdYNorSU6wga6E5JiY6ZfYuCiE9t6Dl1C2fxHIBl7fCOQVPk1
         jljLjWNJLrHKrbFU6rZ5Q9kPFDVkLdpyAC8s+UNVvOIX4BJToQ0JL+mFhEQyZRjQzioP
         3e+Jphy4nHgAdIjoPi/uok63WGgX9/RPU04cRmphDbX+EaljB/MkUuMZitZEcRQevE3L
         xj8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769130847; x=1769735647;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WRGD2YWjrtmwGYVwivTN08CsAVPXSr88y6f4NIlNfN8=;
        b=Wcq1r4UZbgoYaSSBUGSkGICYkCtxQ0D3M7npKn/SYCOn7Hhm/4ELIXazQhIRMjotLF
         O5zgFujxP3NNXcaOlEquQs6P8Yx0MpW6qTzAYac9e/Lp0iUUE2hXayrtRGJA/1ZVs/Cg
         Fel6tVFaCdeSfx6ccz/iZVTDZ30h3naPJape/lfV7sd4eZM6QOdVtgvi1QFdp0JeZSNa
         JUVyJakgsQ/rttn+Q1ozYE9N0tI3Ov8i86dkvFt84RwkYiNGhJF+wafy7U0ZY/Eofwlr
         YgSZQNZ2loCIEKRdZ8TTCK1JakUEb5+CKCMmKwGF3H1evbCzAxiEjWA5q9K/KZxuesJh
         7ZBA==
X-Forwarded-Encrypted: i=1; AJvYcCXyxeHBBPI6OCyNUFJUD7cYf5p+sNOaoH+yOvVoDd9anz4LI2qi9/QHp2rooDD/8EAQhHneaHU+lQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YyhEFnYfUDETMhwl8bUjGIbFOFNVUWN9Bb8REl5n7UxaZAK4C0y
	emXVoRcii5S4xpP9GTzsxqeU4m1Tn7LRlXbvx6Vx5NNo/1RHeIi2IXGZ0MXCUeJFKZU=
X-Gm-Gg: AZuq6aIN3T0S5wactBOJ5ksebeeuXAfeGidpIhN7bzpxK48lwADzrKQ9DmYUOP7k1il
	uuFKJ6TmfzKTT3vbAN3f+ntiiejrMo7fdzDbFPzQ9hO3tmfkbsACu4UEcgV7AuAdcXOEa70c4/1
	UetN99m/++XHhzpBAl4p4dcwaT1KF6JxQazaWTMrOREIcNdzohzcIc+Ulz2H3KoxRUdGzRAvjl8
	yaCdqQV/9UG6BoLffr91eE55upOdxH5gZ32E+Q9qXp2QWVunSvy7rYczkyRU/K/0AAGHw5RdS7V
	ULSF1kAzTFpMdnUfsw6AxEQ2Z6mr7X3eOjw6iYwpsCIPHqMH/IAfoQ0eI65h8DKS8Ol8zr2gGZP
	zXgitXtG8otLb2qGm5ymJLjxDlpmX/H9fYCPRk4eiRtEexN2yDbZHMJdDnuVEhan0BywvFe+WM/
	l0qiOEpm4e
X-Received: by 2002:a17:902:f54b:b0:2a0:9238:881d with SMTP id d9443c01a7336-2a7d2f7cca4mr48720845ad.15.1769130847498;
        Thu, 22 Jan 2026 17:14:07 -0800 (PST)
Received: from localhost ([71.212.200.220])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a802fda160sm3960495ad.88.2026.01.22.17.14.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Jan 2026 17:14:06 -0800 (PST)
From: "Kevin Hilman (TI)" <khilman@baylibre.com>
Subject: [PATCH RFC v5 0/2] pmdomain: core: add support for domain
 hierarchies in DT
Date: Thu, 22 Jan 2026 17:13:59 -0800
Message-Id: <20260122-pmdomain-hierarchy-onecell-v5-0-76855ec856bd@baylibre.com>
Precedence: bulk
X-Mailing-List: arm-scmi@vger.kernel.org
List-Id: <arm-scmi.vger.kernel.org>
List-Subscribe: <mailto:arm-scmi+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:arm-scmi+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAFfLcmkC/43RTWrDMBAF4KsYrTtBkvUXrwqFHqDbksVEHtcC2
 3Jl19SE3L3CLWkpIWQ5GvgemndiE6VAE6uKE0u0hCnEIQ/6oWC+xeGNINR5ZpJLzbV0MPZ17DE
 M0AZKmHy7QhzIU9cBKtNgrWzttGYZGBM14XPDX9nL8xM75Mc2THNM6xa4iG11j70IEOC0sI5bz
 r1xj0dcu3BMtPOx3+RF3q9J4GCd00hKk977K1r5qxlR3tTKrGlvLTfWNJ7sFU1dNCHE/qamstZ
 IjaLWXMrm/0/P35dN9P6R25p/znvEiSDv+zBXxWJ2OSN5wf7WWBWX+DmOwUM39hAb6HGE7CTMv
 cBiQDhAI5SySpZY+yrf9XA+fwHl5LjwKgIAAA==
X-Change-ID: 20250528-pmdomain-hierarchy-onecell-a46fad47d855
To: Ulf Hansson <ulf.hansson@linaro.org>, 
 "Rafael J. Wysocki" <rafael@kernel.org>, 
 Sudeep Holla <sudeep.holla@arm.com>, 
 Cristian Marussi <cristian.marussi@arm.com>
Cc: devicetree@vger.kernel.org, linux-pm@vger.kernel.org, 
 arm-scmi@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org
X-Mailer: b4 0.15-dev-47773
X-Developer-Signature: v=1; a=openpgp-sha256; l=2221; i=khilman@baylibre.com;
 h=from:subject:message-id; bh=aY3lzdYo34rzzl5rEA1NOAbbPbFMvxFb3wjxISqu7SQ=;
 b=owEBbQKS/ZANAwAIAVk3GJrT+8ZlAcsmYgBpcstejbN/+il4BUXiOOZpRcNwNGsz74GvjwhTB
 7ou/Vz0eMaJAjMEAAEIAB0WIQR7h0YOFpJ/qfW/8QxZNxia0/vGZQUCaXLLXgAKCRBZNxia0/vG
 ZWeHEACe7CpdiIWB2PxK/uKxOKEiOMTBcVQNvq4lj1vZw4q9o7qyG5DQL5hUSCPWUWtvyoU+2EP
 t5xX53KzA2crRXbSzkhfOBRv/fJ2BN8eHrjBbca9OaSIpbLDKVXbjViDn2RpuOHwM3KTxFHV4w2
 5Dp6BngEnIPrz3IARPdH5R2tB04xMIUgevYw/83E6WkixELZGsNaof7uQQT6vE2nxHFlkOGRNrh
 29QDnZ/21z1p9uqDGjBAKvY17Pc2IckmEEWVWf3++3PzC2On+IxlAV9bAuKqjNbjqaELAFmtctI
 Tj1MoCTM3RywCAia85SjJPOCyGRw5NE2C1c3yPl+Vpnf4ZMeti0GZZ4MwHp3CO2IGFLuiiaUfvS
 SbVhmXjao4xXBL8xJHUhbKC5GSSYGjb49WQrbYP+RZCaZaqPXPy3afgS28rRqafd2hljFW5ilZ8
 jJLnntwZVYpqdskBDlQaor0Yz7mpBMIXuMzsOvK2WqRIIDqLTBMZBkE1VUjFOo1FnPb9LMma4ik
 42TKoQTflbbagSeoofQ9ic6gi1drt+ArEOyu3f6v4d7i3FsHzgwF9obnxVtLNrQseQql5nKh3DC
 2v39nHn7ooOwGGO4QM1lA9W0JS4xIEm5p0LUkpZdSUC1o1eFY3L7G2RlZ0mUgFyv9JpjNf/6NuC
 in79ZCaFdxuAF1g==
X-Developer-Key: i=khilman@baylibre.com; a=openpgp;
 fpr=7B87460E16927FA9F5BFF10C5937189AD3FBC665

Currently, PM domains can only support hierarchy for simple
providers (e.g. ones with #power-domain-cells = 0).

Add more generic support by creating an of_genpd helper which can
parse a nexus node map, and create domain hierarchy.

Signed-off-by: Kevin Hilman (TI) <khilman@baylibre.com>
---
Changes in v5:
- update subdomain language to parent/child
- add remove function to remove all children
- if any children in the map fail to add, remove them all
- Link to v4: https://patch.msgid.link/20251119-pmdomain-hierarchy-onecell-v4-0-f25a1d5022f8@baylibre.com

Changes in v4:
- use new OF iterator for parsing map. See:
  https://lore.kernel.org/r/20251119-topic-lpm-of-map-iterator-v6-18-v1-1-1f0075d771a3@baylibre.com
- instead of mapping on probe, create of_genpd helper to be called by providers
- Link to v3: https://lore.kernel.org/r/20250613-pmdomain-hierarchy-onecell-v3-0-5c770676fce7@baylibre.com

Changes in v3:
- use of_parse_phandle_with_args_map() instead of custom parsing
- probe when device is attatched to PM domain
- Link to v2: https://lore.kernel.org/r/20250528-pmdomain-hierarchy-onecell-v2-0-7885ae45e59c@baylibre.com

Changes in v2:
- Use nexus map instead of creating new property as suggested by Rob H.
- Link to v1: https://lore.kernel.org/r/20250528-pmdomain-hierarchy-onecell-v1-1-851780700c68@baylibre.com

---
Kevin Hilman (TI) (2):
      pmdomain: core: support domain hierarchy via power-domain-map
      pmdomain: arm_scmi: add support for domain hierarchies

 drivers/pmdomain/arm/scmi_pm_domain.c |   5 +++++
 drivers/pmdomain/core.c               | 160 ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
 include/linux/pm_domain.h             |  16 ++++++++++++++++
 3 files changed, 181 insertions(+)
---
base-commit: 3e7f562e20ee87a25e104ef4fce557d39d62fa85
change-id: 20250528-pmdomain-hierarchy-onecell-a46fad47d855
prerequisite-change-id: 20251119-topic-lpm-of-map-iterator-v6-18-a61447423adc:v2
prerequisite-patch-id: e5697df059c17cf967fa6e4b1edb70874fee4ad3

Best regards,
--  
Kevin Hilman (TI) <khilman@baylibre.com>


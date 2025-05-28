Received: from mail-qt1-f174.google.com (mail-qt1-f174.google.com [209.85.160.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A17DF22488E
	for <arm-scmi@vger.kernel.org>; Wed, 28 May 2025 21:59:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748469558; cv=none; b=ElCfD4em/sEdXtk4UW1iYEcuqZabZh7qMqCFbQFDpMz26C9L7uLIeYu+ZVgDOFnBBIOItNy4fE6YS1WUpkOobPMDiIEqP6I7Z/pYg/11BdiOZc9dD2zzxY3BBNWOHGd9PfePhkClpkcHI2F2mFuES928jm08ADM1YkgqHq5B3IY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748469558; c=relaxed/simple;
	bh=yyebnnYOMbojsKMKGZn7b6zqWXbtEPzDW9iqHsQj194=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=pd8wYNLRs4lBE9Yjn48RqQWIYwgExXbFXbGCISw7lwLn/vqoyn+cRZE1Mcd2spIDJW1E9VQRW7z95PMvTGip/+l1DJPIsRIb4tYXzpaJlOCAJa6TpsJLMPPXLDaTVTAJjToxPigQOCuDVCXcF2jmdv8G77usrCgFQ+kjoPe6s0g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=xyTS/0IS; arc=none smtp.client-ip=209.85.160.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="xyTS/0IS"
Received: by mail-qt1-f174.google.com with SMTP id d75a77b69052e-4a42cb03673so2844561cf.3
        for <arm-scmi@vger.kernel.org>; Wed, 28 May 2025 14:59:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1748469554; x=1749074354; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=omqhGSOmEXdWEk90xAF7uWs/RUMkuzL/uGHdLMr4fAc=;
        b=xyTS/0ISigjpP7Axm6ewGMGQrt7+CGWL53KT49AcWkNAStpWCOxm6B6xw8CRQYmE6D
         9W0oPyepbxSE4hZMnWx31r4QcqtXjHtR7KC4EvM0U2Pj1Ld2VWOchAMgWX+1z3T9Vp43
         0zF+ckASBLohDBX8EB78mduf7cQPX9/50uBs4atvDYTEa/IM6A7QVMRSp8WH++BpoSr8
         zkR1HKXCEOS15jCK13yrI84y3OtdnRAxoENi9n3+4cOqyUv7mMFyigaaEGFWS27FwDJB
         u0Z/YwSgfGQEEJZD8Hz28g/Fib3UBGkAvrhQ4POu2qt0tto9sTem4fVp7oEkT/GwrnVP
         AQ7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748469554; x=1749074354;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=omqhGSOmEXdWEk90xAF7uWs/RUMkuzL/uGHdLMr4fAc=;
        b=OOG+rmrvmCYycq531ti/FrdKHZyqNeaBjwwcixgIjfvJPJrNwR4z+56hrfwqOPuAZ5
         w39Pbq2nm+eaa+0vidfCaDs8qbBYRQT1XXLZ0yqVqAcCv2g7R6nBbLZ10X4NZDJLxwDw
         0PvoR+b3+yTxJVQp8WkDeroyWoxpkybHQ6vAMeoG504neBk30w5MhvoIGOAux5FZY1pj
         HZJy3em1VK6w9LtrGaOnY5eJ0GvhkwDXoei8VVGVt+zd4nGj0fJQhukjiladehyhvrFl
         c1ttdUgcl4sdBWHdRDxh5n9+euK1mPm1OSEj6a1dskz2oom81yB79SMnTdZ7EnCBSct4
         kpFQ==
X-Forwarded-Encrypted: i=1; AJvYcCXccBvwezRLbzx7veM1itWDHe449KCB4ekzUG5ntaZnE4x4BCVRW4EZWATIa5U15hyPm0YQ39x7wg==@vger.kernel.org
X-Gm-Message-State: AOJu0YxZw6KU0Uk5pJUMIS+ue2WRoC6cyaof9798OZQ0+utrkY9GFk3s
	JnosTWVZdUOGewJHJSpqoWLeMQea35KbKRZaRZnt2NszwMzGTdOfh4GUdq120NnaLWcVZeWc2LH
	ACQ6qna08Tw==
X-Gm-Gg: ASbGncufCaJHbcsEUELleu2rAgOOz/feW3sdLhBWOM1PEIBlhPmx97WQaWox5JMAGE3
	NuCuWtN8uPLnLQKXzU7ydj0nSIhpEJGC2Ciq3ezWJWnDrwD8t8A3PnE/dmSWBgYP3zC0PRUD839
	LYgE0w6WYZAObDKAjnGGnc1SQDs2la/O7U8FNd4IkhO4nJrWxJ0AlV5q/Rw/3eF1DXnLAYNDxz3
	HrW2yOpZVuKsYdDhGoPFp9PPH0Vf6w4HRnKzRHEUVykkboJfd3JfEuF1tocbfGMJG9Nw2Rq/OeP
	XyegYJGJTuCGNCC7PlS3/wTC0iV3K9iGz6MGr4Uq1zF6QzpLnw==
X-Google-Smtp-Source: AGHT+IEeu/ru0xTIC0/zY+95mafro63ViqPTFWl+O1vbQhm3YH/mab55TTmjjT4Phvr/wnuUzcgNMA==
X-Received: by 2002:a17:90b:1dd0:b0:311:c970:c9ce with SMTP id 98e67ed59e1d1-311c970d207mr9821264a91.28.1748469543377;
        Wed, 28 May 2025 14:59:03 -0700 (PDT)
Received: from localhost ([97.126.182.119])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3121b9337c6sm119747a91.31.2025.05.28.14.59.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 May 2025 14:59:02 -0700 (PDT)
From: Kevin Hilman <khilman@baylibre.com>
Subject: [PATCH RFC v2 0/2] pmdomains: core: add support for domain
 hierarchies in DT
Date: Wed, 28 May 2025 14:58:50 -0700
Message-Id: <20250528-pmdomain-hierarchy-onecell-v2-0-7885ae45e59c@baylibre.com>
Precedence: bulk
X-Mailing-List: arm-scmi@vger.kernel.org
List-Id: <arm-scmi.vger.kernel.org>
List-Subscribe: <mailto:arm-scmi+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:arm-scmi+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIABqHN2gC/42NQQqDMBBFryKzbkoSjIauCkIP0G1xEZOxGdBEk
 iIV8e4NnqDL9z68v0PGRJjhVu2QcKVMMRSQlwqsN+GNjFxhkFwqrqRmy+zibCgwT5hMsn5jMaD
 FaWKmbkbj6tZppaAEloQjfc/4C56PDvoiPeVPTNt5uIpz+qe9CiaYVqLVvOXcNvo+mG2iIeHVx
 hn64zh+6Prit8wAAAA=
X-Change-ID: 20250528-pmdomain-hierarchy-onecell-a46fad47d855
To: Ulf Hansson <ulf.hansson@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, "Rafael J. Wysocki" <rjw@rjwysocki.net>
Cc: linux-pm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, arm-scmi@vger.kernel.org
X-Mailer: b4 0.14.3-dev-d7477
X-Developer-Signature: v=1; a=openpgp-sha256; l=1106; i=khilman@baylibre.com;
 h=from:subject:message-id; bh=yyebnnYOMbojsKMKGZn7b6zqWXbtEPzDW9iqHsQj194=;
 b=owEBbQKS/ZANAwAIAVk3GJrT+8ZlAcsmYgBoN4cmQojOk3Ihl9E9SAPUH/nPBbWT/ptBi3GKE
 yto3X+2wKKJAjMEAAEIAB0WIQR7h0YOFpJ/qfW/8QxZNxia0/vGZQUCaDeHJgAKCRBZNxia0/vG
 ZReYD/0UiVWQ8Gm6D+kFMfawkv1wkZcTcoS8aCapvqjbHOU06U54DLhNtqjXVwJZN8SdGkWEzXK
 XCUIb+sR+91FDipIxCQWW4Y8S7xrFpCf5OWEmpXsgNsZtoqa8waPcqpuZo5ymhwZQZt1DxXQCGs
 q3trDyhh1vm5jKR0hWnfgBB+O1xR5IHdAIxKrup8TyeSq8xzDaKWvrhLBAFcbPmQz3FHMOJdXdW
 De0UXcS362k8GBVHyvaRYDA5Y4nG5pmKh5ekpFtw4GEBmojphBna2wZ0IQYgdZVleg+fBfcmymo
 WUNuALb5gFUn5lvQQitX1wqw8vcvmISdmJpUYO7BheCZcJhZDJd6rtO8R50a+6utWe2igSVZJ5m
 bvSHn+VIScsCGcHoQlkBoCBZIYsj6OknD8FC+NLhIlddV9uoCsGzXiu6mRfNPtiCTATg37LNJS9
 Wy5CE65DeVd6UJceBPCa9izXgMWcmHGh3bN3Q5E4V8k8zdBiyG6eR2ZakDWkyWYPQ3PU8z38tTz
 M9Kn4E1+0Henp2Ks+cVffVM3wqs6DFwBAhu12AqjU0UzuD4y6gTCmHwYOpqc0ucR1lJ5hfZKcll
 t6oIbAgdnIMHgTK45eRmxEeOFrcnfMqmpxIXGCfzNPA8+aHRzZuPSjGDiWVnvsNaxu5obhE3q/+
 8tZEFD0oL5da76g==
X-Developer-Key: i=khilman@baylibre.com; a=openpgp;
 fpr=7B87460E16927FA9F5BFF10C5937189AD3FBC665

Currently, PM domains can only support hierarchy for simple
providers (e.g. ones with #power-domain-cells = 0).

Add support for oncell providers as well by adding support for a nexus
node map, as described in section 2.5.1 of the DT spec.

Signed-off-by: Kevin Hilman <khilman@baylibre.com>
---
Changes in v2:
- Use nexus map instead of creating new property as suggested by Rob H.
- Link to v1: https://lore.kernel.org/r/20250528-pmdomain-hierarchy-onecell-v1-1-851780700c68@baylibre.com

---
Kevin Hilman (2):
      dt-bindings: power: add nexus map for power-domains
      pmdomain: core: use DT map to support hierarchy

 Documentation/devicetree/bindings/power/power-domain.yaml |  35 ++++++++++++++++++++
 drivers/pmdomain/core.c                                   | 166 ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
 2 files changed, 201 insertions(+)
---
base-commit: 0ff41df1cb268fc69e703a08a57ee14ae967d0ca
change-id: 20250528-pmdomain-hierarchy-onecell-a46fad47d855

Best regards,
-- 
Kevin Hilman <khilman@baylibre.com>


Received: from mail-dy1-f182.google.com (mail-dy1-f182.google.com [74.125.82.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6EA483A7F57
	for <arm-scmi@vger.kernel.org>; Thu,  8 Oct 2026 19:16:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791486994; cv=none; b=GPXfkdb+Ivnl6hUNC04bW3MZrIWq3NnZghfl89yBtsm+85t4Nj2Tub47FWJ+QMyCqAtpKPNekPC2d9LqeK9HN002EMW17MatCx7/rJoce1aU5N7lhB/SLypQxKTWBSZQOe4YwVSXtMF4mu1GFOEtAyFfi3ESORb9AtDfiOv0Ho8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791486994; c=relaxed/simple;
	bh=Zduh2DU6SfY5so6BkNbBiVSWdbKi86BAIrpyrB+S01I=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=OWMKxA+DL/VS77S+iSh43lspsC2TSFbKOZExglLLeTq3f8IlBuBoMwSzVOnG74FfbAtDlbofYLzh8GLPAI4S0gaY32XBU5//BrQ/eb4e/I33b14Zy9LVgFeY9Yw/2uyFVZKVIRZKEL1dloybUFpufDs9uzTd0pTa5z1KsgiR6FA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=trailofbits.com; spf=pass smtp.mailfrom=trailofbits.com; dkim=pass (2048-bit key) header.d=trailofbits.com header.i=@trailofbits.com header.b=MzewuW+y; arc=none smtp.client-ip=74.125.82.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=trailofbits.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=trailofbits.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=trailofbits.com header.i=@trailofbits.com header.b="MzewuW+y"
Received: by mail-dy1-f182.google.com with SMTP id 5a478bee46e88-33bf40b0c8bso3149343eec.0
        for <arm-scmi@vger.kernel.org>; Thu, 08 Oct 2026 12:16:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=trailofbits.com; s=google; t=1791486992; x=1792091792; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=sJxEIraSPOLWNZvCZSoZUxwKzeKR9+5tZ/1A97aGpYs=;
        b=MzewuW+yy0tntgC4TVkCNCgPrac0C+/RrxAqDvhDoT8j1V5scpP5T5ouvln9lblKK3
         QH6+bWNHrvnwk1yXsAVtAww8AvQh4MInQJpuzLd3+T324yro++xwBAQGBCv65Mnnif2a
         pzAVw//myKcVf62DtTJimWTUyPdMoPMjvynE2912Yz6ALLcgMJ1SCcp/tCffOCdoonjL
         B0lCIOyJAnYR69gLTlxTylv/crXBcv3Zzr20ipcPdCsl3g1Cfa1QE1m49kVWVSgKxETn
         qNuczwzpnuXUKsgahWEbYvBzL/MffmrZti9uTlRHzyd2gYCQuOcddHtM5o9Tn1BGSEA3
         SKUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791486992; x=1792091792;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=sJxEIraSPOLWNZvCZSoZUxwKzeKR9+5tZ/1A97aGpYs=;
        b=SDW/2fZUHo0z7/giDK4qmH59XFR1yQK3oQcIUhdeUyG/9DAL6IUDn5CBb6jjY7jNgx
         wipxci4fSGvr6jUGkHDgYtRDGrgoyKUZYIZBbSXxsPtoCnrikS8T1u+EttK44yJHR3QP
         zWeJqL69N6aUhpa5Z74M/xnaUywOOAKWhg+37G4sKc/eUeWiqEUDZ3PNSA/gruodh0Tv
         AvVI8+hKHMC/sLLWfBH/425bKV9XNDWKUNGPpqvOCUr1jXY3yaUlrU7PcR23JVtLakzZ
         3JB7k69KmlGja+QCKpkrLbx/ZaZpFY+odo3llJvKRVfT9uc5xd//AT49hnMrfto5KAOc
         5Law==
X-Forwarded-Encrypted: i=1; AKwUvByIl5cidZ94JMAMkguDwUFZFxZYE42E1BsWeIKa+DyezHdTgt6WPWs6CK+3W6jOymmdRK1c/AL3Ig==@vger.kernel.org
X-Gm-Message-State: AFq9FYLS1WQKfFAV7n+f+zlZ5U+WVzavR+2Jh4YlXcS2Lc4WjpW7PcGt
	Bcq46o/wbwCXTrmurN4/9hGIfijPZouvrzI+Act/LEo9fvfvDByd3URNCAwxjLDBXQI=
X-Gm-Gg: AYBFou2YzsVEm6q1JqLsBstTpY4vrcYU8yqRSKei+vnMZlBomjW4C4TjCZ22ZIVgAqn
	upFpxb92abe5znP4ZE5dpAyrPXmDZfOhwey0jD37fbXI+5D6ayIVD+yPgBxHmsaxVKcji1RO2Ag
	gUZ4M0sB12ZpXizIPvFcnRBt67JtWssqfft/I8FJYcmA5un7MJbVWDAFoBibNxKtA+zNGwuGLMU
	C4BdfRArZ3JsRcSPtvqIf5Oeq7bvDhipBnbwolithjrcRJyMmIn5v8Ylzti9TZmKZ+9hc3XzbEC
	UL0l/dPA/H5jHfX5dwcwdDUfqx3exodF5aMLDx287n0Vxd57Veh3DNKwag8+tHNyExpKzwYyW6X
	hnOEPZagvRbSG0j2/2VFZg/fpTeHcGtiw8buJUK4Aw7j13Z2gkLGUk5fYIRAciAnqmrGtGjd/Mt
	972QodxZHvQarROtrNZ0iY90TrzuyIA3LNSsYmbk8AzzGXNNL3IMhsuni2l4Wj03rzHUOeF9CTm
	00PijRXwPcQUnT6wyGPz4DUQ84PKhDRObJOd75ACl6KPcHStX9KvDdgR67dlYVxzr7inrIMXPip
	SRi8Ig==
X-Received: by 2002:a05:7300:881b:b0:351:207d:bff4 with SMTP id 5a478bee46e88-3515db9c789mr8494154eec.4.1791486990854;
        Thu, 08 Oct 2026 12:16:30 -0700 (PDT)
Received: from localhost.localdomain ([2603:8001:5f01:8bab:bc88:5ec1:4f8a:5b23])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3537cacb5e9sm54053eec.20.2026.10.08.12.16.29
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 08 Oct 2026 12:16:30 -0700 (PDT)
From: Artem Dinaburg <artem@trailofbits.com>
To: stable@vger.kernel.org
Cc: Artem Dinaburg <artem@trailofbits.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Sasha Levin <sashal@kernel.org>,
	Sudeep Holla <sudeep.holla@kernel.org>,
	Sashiko <sashiko-bot@kernel.org>,
	Sudeep Holla <sudeep.holla@arm.com>,
	Cristian Marussi <cristian.marussi@arm.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	arm-scmi@vger.kernel.org,
	viresh.kumar@linaro.org
Subject: [PATCH 6.6.y 0/2] firmware: backport CVE-2026-93083, CVE-2026-93093
Date: Thu,  8 Oct 2026 15:16:19 -0400
Message-ID: <20261008191624.98532-1-artem@trailofbits.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: arm-scmi@vger.kernel.org
List-Id: <arm-scmi.vger.kernel.org>
List-Subscribe: <mailto:arm-scmi+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:arm-scmi+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Greg, Sasha, and maintainers,

I'm working through the smaller CVE backports still missing from 6.6.y.
These 2 upstream changes belong together for CVE-2026-93083,
CVE-2026-93093. They must be applied in this order because the later change
depends on or completes the earlier one.

The complete series is already present in 6.12.y, 6.18.y, and 7.2.y.
Patch 1 also affects 6.1.y and will need a separate backport; this
series contains only the 6.6.y patches.

Could you please consider this series for 6.6.y?

Thanks,
Artem Dinaburg

Series:
  1. firmware: arm_scmi: Publish channel state before callbacks
  2. firmware: arm_scmi: Unwind TX receiver mailbox setup failure

base: v6.6.157 (79643295eba17affbd16ca97f3ef04c90266b28c) plus stable-queue
revision 958ddf240a33ef26b1771be944f0ea6c3b597472

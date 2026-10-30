Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793375927;
	b=wn1nmwpF5ejDkF7D63wk+6zgSFbqrvK6pZ0xDW/E8+VMiU41FC7di6zOChcaBdUZYrQS
	 OvmYlrt12h2IXQUptRT3e2CnlRHnopLmY/LJdPJtaky8vDpPrKHlcs2N7ATT4bDI390vr
	 mxw3U0V2lelzFixJ8u9aPPYCfFtNaA70ERy+UY9ujiYADlQuU7YZOv1e/+AsMW/MqxIyY
	 08poKpKG3tbYZMCEsFjMWWoepFLpnQSTh5GA4aQV2/hM9QyW9yFrpgZU0mkGfnjk+VCp2
	 7fYZFTc/CuD7CbTGVhh/GXDZlaXN3KgAs4H/ZqA5RNbjEbv7RkFGNEW74zs/VRTXbNw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793375927;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer;
	bh=xVKdou+VgdxrxuNukuzV2dd7tDlo47ujCjTpwTY+LWY=;
	b=YZhRH5aypzN0AuZS8WoFrRcsA/mu9+jtrihwkr4FfsGwOPOZfbQ+hoX3iBHQpSdxRWkI
	 Kw+QAgBnDZNjl8BWYOsb4nlhN+if/X5+E97F0DnvUmovSK3zegMzaPIEoROubj/I+XcsQ
	 hyl+26dWkWPa62yQb76XKjGhRqkQa3ac6ImKG4i6WErA7PCyYhuzmLb51tR4rkD7K8zQ1
	 cQjA6kkgR81TQUv8N2/wY7/anrGtOsP+dUu9S75/Hw8c1qsqhEOSbIquAz5Ow0wPvMgH+
	 b3wnRfzRzcz4F7dFuo+WJ50S9rRQ8Ve2Qi8B9GaWCmOHoTyPIc4fzio/P2F/VREc+Tg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=no1NUXfu;
	arc=none smtp.remote-ip=209.85.221.41
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4122606A32D
	for <arm-scmi@vger.kernel.org>; Fri, 30 Oct 2026 15:58:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D4122606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=no1NUXfu
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-48e4831c028so850607f8f.0
        for <arm-scmi@vger.kernel.org>; Fri, 30 Oct 2026 08:58:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1793375920; x=1793980720; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xVKdou+VgdxrxuNukuzV2dd7tDlo47ujCjTpwTY+LWY=;
        b=no1NUXfuzQQ58syEI6DSHr6K09poEWBp1PheN9m+LUUfmjsSyv8P0XyGVA/mPJO8de
         QUmQx1u2N6as6AqRj8HgJb103X2/s7DmTeCXb/EYZsBN1Zk9OQWJTbM37BFtoQFXA70w
         EJ3RAzZiXKcpYoL3ZjqhHXBqOEZ01zOctuTxbNSI+E0R92C/vQ1S2PchXRJxg5aFvfpm
         lIGnzcidYTVTlqqUfiLvox6Pjs1dkINosLRrA6PQJTb4OC6xA1KRvtNE+8yiOD2ndIaJ
         oJ+ogN3bwjxFwKq7W36emk4xLJ4rq6wRA+NorHKhwTIWtrN7lgyEkG3rlz1ivOnSzEKo
         PHlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793375920; x=1793980720;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xVKdou+VgdxrxuNukuzV2dd7tDlo47ujCjTpwTY+LWY=;
        b=ErlmZzrByTObgcUjDuZ1klDTgiOkpIc905qp3Uwu8LR0Q54/lczIUIOV+eciC/UQtu
         7CChVHzYozC/rhSgXTrFVedHYEMbq+12gVLXO9hc4L/0hz8n9bvkUhfWl+yR4+TbsE4A
         WIrblm6Y1eQFpqOR9ewT2npl3lzfOGqfrOTyP30/QSUdrJfaypiP3KUL9zmqD9LVkZ63
         gMANtmc2kCmH3A6uy1RCOQcavAzMKsVlViEKh5afLsAZDfkZ9AINyUq1ZQWY2IcKcxKQ
         7OkKb+KzKK4k2Tp2dSk3rsSClp1eLoOJeF/yCzDzABTww5cOkm83ualh9Wfn3DAHCvJ+
         m/4Q==
X-Gm-Message-State: AFq9FYJI7qQ5l01itYrO983O+zjcOy4exppAg7mGScw8oyE7QPoviiZI
	IAWIIyfNK4+5S+RADi1CmCHMVhLCCTUuFSpJOzBL6rzTzoiEnWxB1MFsixudUXP+Egg=
X-Gm-Gg: AYBFou2JQCDOd3ZE7plMK8Hmqk1DUP09yh9QG9/lQyCkqLVhRlfIc2xXQ4cWBbpzFf6
	r0KOJMNBBERVEWHMs9kJ/10Sx0C/xYdHHH0sFqjyCzGvM4i82VzWRQf5qI6t/Fx8xw65XeoGmlj
	SfBcW5A0GeRvwxwmTC+4cwSj4I0gJ949L4MSvD0kRnF03/N4nQpZQqBOsONnyOWzcbHjqxgAL3r
	wgCsxG/pVxaeICqnfOjWgNrn0HUoR2GaQkCSfwsojvYq7cpay553Hr02c8F4e80ZaEgibHE7sGw
	C5MBmy8YMmJKpolk2W2BWwQG3Zh9N/BbDjUGCe+tW9+8zpQFO9GHTbVq34wQOWLKYsJIpW2up7Q
	qy3YQkfl7rpuWoYAPrtVPt2zoj4a+adQTBjqpbk2H/Hs+IAOIE7F18uY4eDtgb+9s1DpmI4b16Q
	PM3zSxUeE5ijuRNVz0Uhg6M3hGYCAtLP53wo+q2J32jk3JFRlDb/FQurG+Y9oBfI5cfboDdpdlj
	gk2Y5ZJp/rtik17wbVQP9dHaPPQAEZ+zd2HIKRjUKlvbJTOHqfJZDZWZUVkvv7wPAVDkYPaVGP6
	aFICCKt2lTyE9wXJ1UID8VU3S6FtIo480STuX8/wka8VVMrklEc=
X-Received: by 2002:a05:600c:46ce:b0:4a1:f625:2108 with SMTP id 5b1f17b1804b1-4ac18a88820mr62818445e9.33.1793375920100;
        Fri, 30 Oct 2026 08:58:40 -0700 (PDT)
Received: from localhost (140.30.66.37.rev.sfr.net. [37.66.30.140])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e71ba53d7sm5738054f8f.53.2026.10.30.08.58.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 08:58:39 -0700 (PDT)
From: =?utf-8?q?Cl=C3=A9ment_Le_Goffic?= <clegoffic@baylibre.com>
Date: Fri, 30 Oct 2026 16:58:36 +0100
Subject: [PATCH 05/11] firmware: arm_scmi: stop reading past
 PINCTRL_LIST_ASSOCIATIONS replies
X-Mailing-List: arm-scmi@vger.kernel.org
List-Id: <arm-scmi.vger.kernel.org>
List-Post: <mailto:arm-scmi@vger.kernel.org>
List-Help: <mailto:arm-scmi+help@vger.kernel.org>
List-Subscribe: <mailto:arm-scmi+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:arm-scmi+unsubscribe@vger.kernel.org>
List-Owner: <mailto:arm-scmi+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20261030-clegoffic-pinctrl-scmi-gpio-v1-5-52d92843ad97@baylibre.com>
References: <20261030-clegoffic-pinctrl-scmi-gpio-v1-0-52d92843ad97@baylibre.com>
In-Reply-To: <20261030-clegoffic-pinctrl-scmi-gpio-v1-0-52d92843ad97@baylibre.com>
To: Sudeep Holla <sudeep.holla@kernel.org>, 
 Cristian Marussi <cristian.marussi@arm.com>, 
 Linus Walleij <linusw@kernel.org>, Peng Fan <peng.fan@nxp.com>, 
 Oleksii Moisieiev <oleksii_moisieiev@epam.com>, 
 Andy Shevchenko <andy@kernel.org>, Dhruva Gole <d-gole@ti.com>, 
 Bartosz Golaszewski <brgl@kernel.org>
Cc: arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 =?utf-8?q?Cl=C3=A9ment_Le_Goffic?= <clegoffic@baylibre.com>
X-Mailer: b4 0.17-dev

The transport cuts a reply larger than the receive buffer, but the iterator
still reads every identifier the reply announces. Use only the identifiers
that were copied and ask again for the others.

Fixes: 2145af01b9cb ("firmware: arm_scmi: Add basic support for SCMI v3.2 pincontrol protocol")
Signed-off-by: Clément Le Goffic <clegoffic@baylibre.com>
---
 drivers/firmware/arm_scmi/pinctrl.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/drivers/firmware/arm_scmi/pinctrl.c b/drivers/firmware/arm_scmi/pinctrl.c
index 42cb1aef1fe1..69645ce73d9d 100644
--- a/drivers/firmware/arm_scmi/pinctrl.c
+++ b/drivers/firmware/arm_scmi/pinctrl.c
@@ -261,10 +261,22 @@ static int iter_pinctrl_assoc_update_state(struct scmi_iterator_state *st,
 					   const void *response, void *priv)
 {
 	const struct scmi_resp_pinctrl_list_assoc *r = response;
+	unsigned int nr_fit = 0;
 
 	st->num_returned = RETURNED(r->flags);
 	st->num_remaining = REMAINING(r->flags);
 
+	if (st->rx_len > sizeof(*r))
+		nr_fit = (st->rx_len - sizeof(*r)) / sizeof(r->array[0]);
+
+	if (st->num_returned > nr_fit) {
+		if (!nr_fit)
+			return -EPROTO;
+
+		st->num_remaining += st->num_returned - nr_fit;
+		st->num_returned = nr_fit;
+	}
+
 	return 0;
 }
 

-- 
2.56.0


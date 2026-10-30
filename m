Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793375923;
	b=4VjYBF3uk6kx8O8h0CAP5NTIamFjPVmcLOCZmZYF2e+m742az5xISHSQ0aVzliQ7rJnn
	 IGHRxd84ybGfO04BYWMZgzxVGMyJS9IVi+aYwgL2dSNptal0lzmEc7tUxBM5+UGdtLWwF
	 8Zi22HmCDwYyLWClBfLPRcUhP9ESjJsQFWKz0xBTDADeXAn7sTwzHcjNPSqzyFF9yOJ71
	 6FT68remdMKxYaMLLr52ZzZk89jnBVELn9MgMGMVQPRXqOXDcDxofxFBMVU70zFkfpjYl
	 IY7ZK2OcgmtFoHkUF4iwB3NGZAlFo40nPPxbsJSA3vcQJirL/43Eps6O2HQ9m27ih7A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793375923;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer;
	bh=LeFt7P1mVFRjUvJApqNjloRcS0qu8nw+PQFMs/A+hxo=;
	b=T3azaAc1GmDm0bChpvXEyqi8DjKI08lk+sU5DRqwMlFX+Hv9EsKtb9lbwWqNVedm5xhD
	 CL8u5XplxLxEhM8HZdqtVFAR+u9SSRQSoPBb2L/+Shk4pQvhLCwuLt6BYPEJNyKycAOEC
	 yMpvg6vpEbTwWKhcyUnSvHbDCIC+XS9SP0qKEbBdY2OTPNLJYz77UYJKBNB9Q7keiaJbr
	 Uzo65rBGt1sOsnlgL6UQqzmfsTh4gOISWDlQsrrQLCQpVUgcmqFlSMfqn1u/i5KxeJ8Lh
	 d0OaamXB6yliDJ7v75o+kmJfKpRg0u192kqMzFpxKbu+Wv5GioNwWGTA8eV1ATrFikg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=eQz3xZcO;
	arc=none smtp.remote-ip=209.85.128.47
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FF09606A325
	for <arm-scmi@vger.kernel.org>; Fri, 30 Oct 2026 15:58:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3FF09606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=eQz3xZcO
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4a59100fa83so7954535e9.0
        for <arm-scmi@vger.kernel.org>; Fri, 30 Oct 2026 08:58:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1793375921; x=1793980721; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LeFt7P1mVFRjUvJApqNjloRcS0qu8nw+PQFMs/A+hxo=;
        b=eQz3xZcO8fhc80b9DM7dIQQPIRJUL4XPzLVpWMQiIlok8e6xOugHJep8E3TX6aFz6t
         Kr22/j0ACfLsAC2e3VQsItC9FP7zxT2UdGhgLrb3Mm8yjZ+hhEw7ZFxgft28wl7cAtE0
         U+MmKtgwF4OJdmXW+YyAJffKpXh7guCkYD9AqKT9wiJauIQuI1QnUVB5n6nUtnlhS41e
         wNCk2OeLPTw47q3fvByvzsUcziKHUSQMXbh7n/jZQ47WaIKOmHtfI31h2BsTkdMXKUjE
         HgZDGRsz8p+ty42QpR271uR8myGQddMWYuymIF+Ol3khVPOFwBtZUwXw5Y9joYnzJi4k
         9Bvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793375921; x=1793980721;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LeFt7P1mVFRjUvJApqNjloRcS0qu8nw+PQFMs/A+hxo=;
        b=Fl7MmStDaS44HGFthmGTivntMueYa9lBU2953VswZwmna8s3NQQViShqx7EMIOGqfN
         oB/ymVWRH+vfhXVNrd0mVZ3K7ifqqzDxrzWn4WGmWDSfD30Km3pDPLUGQNhKDKxN3rvL
         F134Ae8gvHzskaq893mvKAwWkzoamSv3M+slavp4qHiduW9yOEYcVdG1076FMK2z4D5o
         ANyTMLBKfQewsyk5Hxzcsmt2VlKCfMkQHfogw6T1YHqtQfC+hdVOE6cUwYOSsZp4xXfS
         2djoPL60qtVSdEwNEl4pmYeUBfNERbfJgkv+4l48v9iarn8NRCDGf8T/FYX1IyNx9P9E
         hglQ==
X-Gm-Message-State: AFq9FYLII/Mp5NUHfce94Lm4w8nGb/ZbJU1iMqtLzQk+WbIkXFcq4FN1
	9S55/61bpH8PqFEQe1aVsHPffiXjN+35veMHbT4PmmJHz57vO2gR9msE2URixHeTCC0=
X-Gm-Gg: AYBFou2V3ePyuR1KfCfJP3tQVw+FvBbytGDChPgWzQSl1o1Tppj1/vF9ALhJ+8g+Dns
	0jFoj4TEhZ5gw0eA4X1ZayqNull9Ydx42R90ij0gpJfZ7FdrubyzXTKMeBLOhu8TjbqmUisrlGA
	zNntX+dEPwZ2yeE/a8l5MxQzsbdqKLr70/pZOV/Oq23QH2Vp2T40jI+1n5JBA1TGPk7XIt7MByH
	sC6lvzs/JDbFRcBQVrq+OQZOtgjScmoCr7Rb5b4dyN/3jkDgPvDRzKhmHem+FZkXjcHS2VJK04Q
	ippjYJaTakpfEuH/Irc+CcQKWtCz8GTCrxvkOFv43oe3vnNj/Sc4VXK/xGrwDue/rGOPX/YoUkx
	dN8n3yRM0jMyeaBxC3kwqkblWi7XFPeD98GMBPHOORmaOYb8nCOor5Vxj8YylJ/u2xDwLT2v4CT
	VeCoPYx/gE0RITCQIKYKGDum7shvHF58lERx2wfbyZFFbhQ391FygRSwY64tu2mhb+UGN3PKf+X
	GPKpbccUpRc21pdmYy+P09VNMQvdzOUQ/J3y35oXRA0zI6q0Btr6jsOksKKGFHlQt6+FcLdSp45
	+UMFGl9tjORNtSgOzjA4ByzFGiIQoW/qNLmtKdKcGzSGdWoltsE=
X-Received: by 2002:a05:600c:8709:b0:4a1:9078:911 with SMTP id 5b1f17b1804b1-4ac181e75b7mr66361365e9.31.1793375921690;
        Fri, 30 Oct 2026 08:58:41 -0700 (PDT)
Received: from localhost (140.30.66.37.rev.sfr.net. [37.66.30.140])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e71ba24f6sm3802033f8f.51.2026.10.30.08.58.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 08:58:41 -0700 (PDT)
From: =?utf-8?q?Cl=C3=A9ment_Le_Goffic?= <clegoffic@baylibre.com>
Date: Fri, 30 Oct 2026 16:58:38 +0100
Subject: [PATCH 07/11] pinctrl: scmi: give no groups to pin-only functions
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
Message-Id: <20261030-clegoffic-pinctrl-scmi-gpio-v1-7-52d92843ad97@baylibre.com>
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

For a pin-only function PINCTRL_LIST_ASSOCIATIONS returns pins, but the
driver registered them as groups. Register pin-only functions without
groups.

Fixes: eb524cb651b7 ("pinctrl: Implementation of the generic scmi-pinctrl driver")
Signed-off-by: Clément Le Goffic <clegoffic@baylibre.com>
---
 drivers/pinctrl/pinctrl-scmi.c | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/drivers/pinctrl/pinctrl-scmi.c b/drivers/pinctrl/pinctrl-scmi.c
index 355ad26cb215..1a14e254f011 100644
--- a/drivers/pinctrl/pinctrl-scmi.c
+++ b/drivers/pinctrl/pinctrl-scmi.c
@@ -443,6 +443,7 @@ static int pinctrl_scmi_get_functions(struct scmi_pinctrl *pmx)
 {
 	unsigned int nr_funcs, nr_groups, i, j;
 	const unsigned int *group_ids;
+	bool pin_only, gpio;
 	const char *fname;
 	const char **gnames;
 	int ret;
@@ -455,13 +456,20 @@ static int pinctrl_scmi_get_functions(struct scmi_pinctrl *pmx)
 		if (ret)
 			return ret;
 
+		ret = pinctrl_ops->function_flags_get(pmx->ph, i, &pin_only,
+						      &gpio);
+		if (ret)
+			return ret;
+
 		ret = pinctrl_ops->function_groups_get(pmx->ph, i,
 						       &nr_groups,
 						       &group_ids);
 		if (ret)
 			return ret;
 
-		if (!nr_groups)
+		if (pin_only)
+			nr_groups = 0;
+		else if (!nr_groups)
 			dev_warn(pmx->dev,
 				 "Function %s contains no groups\n",
 				 fname);

-- 
2.56.0


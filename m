Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E48F333CEA8
	for <arm-scmi@vger.kernel.org>; Mon, 15 Dec 2025 14:17:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765808277; cv=none; b=SltGlM7x/AXCkeOT7mnT9jU+w8ygg8VJuQsAftffiNk/hotUcncZebRwG/Hpqv7RENhkOzkFgJJtDp3rG6nZna9eSDv2ak/rbuFoiEQE0+Vg19WMCZ7zV8PA6XmLBrFivXF+Wn5LqHsQcAX9v9dRshrvWgKTzvlAPzRVZyf7PZY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765808277; c=relaxed/simple;
	bh=djoazKNFNWBpRKVOu8VgnZQUMBy5m2efHrrhLCTajBI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Vv9vbSCcSo5R14dDaelkUxaH1o/NEzDUIPNSooEq8fEdUq+9aCmzHYz/PYbu2Bu2dn2xVzgjSZNtUzdoB6om0tC0VtdprkhgXHP2b3Y2gzMcV2Ppa8ziWrFegsMu+ChqZCo/J/T6gw85V7rsoidZX9Hafnhjmo4MiOR1usmJols=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=Y64eS6Hw; arc=none smtp.client-ip=209.85.208.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="Y64eS6Hw"
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-6419b7b4b80so5380778a12.2
        for <arm-scmi@vger.kernel.org>; Mon, 15 Dec 2025 06:17:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1765808271; x=1766413071; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZKbJnfJE7xkWU00mrWTEhz/b//1iCTobbbTcn9iMvYI=;
        b=Y64eS6HwSS+LjS1jF7Uq6cKyFWEk4XXBpea6jVT2NhXvx+8v+eQK6H9svLfXkgW+D1
         sSGRLimOQcH25SNvo0go7O0bKeiEBjXfummuhgj6/P7jEkciZWHaZ12T/bvGJTMCSRJm
         AhcXae6HrcaHMNgGbK/KzZN/GFd2qgzo1ApB6dJdMYhFAXPBJQGOAQOjas7jl8OFLubt
         iAct+6FnMIs5ikIl2dRhESy07l0O/u77mkckEI5o0lceVk7dS8j6niofJElsd8RPan5H
         bVsWV7bcuH6EUNKQwqVYfx5iCKzWBQdlXfJP2Aj/ux3DvQQMS1L1KeA3Qc0cGqnc+LFF
         FH3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765808271; x=1766413071;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ZKbJnfJE7xkWU00mrWTEhz/b//1iCTobbbTcn9iMvYI=;
        b=Lb7aRX70RhmbdDz2ieytXPq5pYIfDtCSGObXUy1q3zIuuS45GyuJwNTIb3DKRidPcS
         yXyFxSpmP6gJmXiwGtp+DIs6E3K59PonWS1k/jpxVvp+6OA8xAQivmStTtbcw6/Pq4Nz
         6py7GEQwm5uBdDdRR/zOstTD2wSdCGXQogasLhniPAxJb99jViyyhna/BdBGKl64vw/t
         fewU3efAOvdmwCsWTaphYSnLIwzZSvJRTCi0/H+0OKua5pV9hS/eA4ETyBBV0Uz1HQB4
         s7z5zBqg0/7WOJfuC0cU2QZgZim/fGcG8Vg04/8XjwkwLckqtLqINx6MqQfQAc0QQoU9
         HUBg==
X-Forwarded-Encrypted: i=1; AJvYcCXyy00iuiV8imaH6tukJ52TIT9x0++xozDx/2/mOJDCyYI5Lkp0L4GA/jPvrvABx9lWWxjcTzMWwA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxYFLRJKJgsl+m6mhLRPy6WnEZiP89szzoJRpVlyY969EeJthV+
	o43bp3o/oCVWVNvuv9bS8rsZXsfjGcmzVMyizvAkLub8WzljU6gRTjQuYXmpYYmxF9E=
X-Gm-Gg: AY/fxX5tuN5rFLvumEkQRjFoOU4MSz1+bxrw3Td8zRXmkqe6hJYlUpF4qKTvWceRogI
	r7tRCao7cmUKMHC+VnHnjQRVNdLarD3NRInkrTFWjfPz4adomYVsG1UL0b2kSrqrmuKS6DGitwj
	Nv2X2B8Je0SXjPR8EW+uhFOlB62jE+fSmxqmh5K/rprcNU70XirJP7qOK//h++oSv6wYtILp2cU
	xzBtXhR/1hdRA1/M/y3Wl4DEXVyHUuCVzo+Lst3Pj4wLXYJ48JbQ0CKVS07qPXjdA8yerUe3puA
	nWYaAGVkygKNmYh27ZOyIZ2W505IFujKnsRpu4OCKDLh7BGkXztFUqIcZOdxbFkNzt/ro9kso/d
	MOZv3bZ2ySAj7zaG6Jv8+6LAc8dkTsLd2mP3LsGnEX0kWcPrLBRLjinyvzmNSGUfByMAXjZmqUW
	UJt5jKgS2LKnIb3cfAF7ArSUN4LFftXXXrNScMtARymXlj9LVZG7OPUOXSmg==
X-Google-Smtp-Source: AGHT+IEeSJVfJZs2amYWw+KLmEmBNVhUpqN/6+ZL8YgyOFyTuCX5haEwqwHXINz3XjvZu+mkawojpw==
X-Received: by 2002:a05:6402:5190:b0:649:cafc:2656 with SMTP id 4fb4d7f45d1cf-649cafc26c4mr4434360a12.11.1765808270921;
        Mon, 15 Dec 2025 06:17:50 -0800 (PST)
Received: from localhost (ip-046-005-122-062.um12.pools.vodafone-ip.de. [46.5.122.62])
        by smtp.gmail.com with UTF8SMTPSA id 4fb4d7f45d1cf-6498204fbb3sm13523660a12.8.2025.12.15.06.17.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Dec 2025 06:17:50 -0800 (PST)
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Jens Wiklander <jens.wiklander@linaro.org>,
	Sudeep Holla <sudeep.holla@arm.com>,
	Sumit Garg <sumit.garg@oss.qualcomm.com>,
	=?utf-8?q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>,
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc: Cristian Marussi <cristian.marussi@arm.com>,
	arm-scmi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	op-tee@lists.trustedfirmware.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 10/17] firmware: arm_scmi: optee: Make use of module_tee_client_driver()
Date: Mon, 15 Dec 2025 15:16:40 +0100
Message-ID:  <983988a9020a2829bbedfd599fb6a52f8867e37b.1765791463.git.u.kleine-koenig@baylibre.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1765791463.git.u.kleine-koenig@baylibre.com>
References: <cover.1765791463.git.u.kleine-koenig@baylibre.com>
Precedence: bulk
X-Mailing-List: arm-scmi@vger.kernel.org
List-Id: <arm-scmi.vger.kernel.org>
List-Subscribe: <mailto:arm-scmi+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:arm-scmi+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1534; i=u.kleine-koenig@baylibre.com; h=from:subject:message-id; bh=djoazKNFNWBpRKVOu8VgnZQUMBy5m2efHrrhLCTajBI=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBpQBhlaY2qxCEcyR8weby9a0kZHvfdpLdOH2fIH cLAkAUU1SWJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCaUAYZQAKCRCPgPtYfRL+ Tm8KCACFX8eQzR1FU1YYCPyj7bjkaPb1IJMAne74xoK4zA3MizdDdnVj2jg38iTR72qB2ShDcYl m5G5Mnl8h4+UfOlGR5qzEmCbu89xesxDd20Sw95hoAUVz0pmelASWucFk/Jd6VnV3rG/n7NZo22 +3EQyvtFlSVGKdWFk2qXUJxXteCmVDN7EZGLLs0sR9tZ1VSESx2gPy+4AKC1jd7FYaliy79sV53 VKQyVvFcddYJFYjP6hQxEvlwnEScer6VulhTzAxgkG2lUsElYoPUmoSnEu0FQInj+ge7ThPx9HV g+mRx396gQ39PUOMdWVo9ck0W7i0qCVcz3/vA9UQ+E7jL/UP
X-Developer-Key: i=u.kleine-koenig@baylibre.com; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit

Reduce boilerplate by using the newly introduced module_tee_client_driver().
That takes care of assigning the driver's bus, so the explicit assigning
in this driver can be dropped.

Reviewed-by: Sumit Garg <sumit.garg@oss.qualcomm.com>
Reviewed-by: Sudeep Holla <sudeep.holla@arm.com>
Signed-off-by: Uwe Kleine-König <u.kleine-koenig@baylibre.com>
---
 drivers/firmware/arm_scmi/transports/optee.c | 13 +------------
 1 file changed, 1 insertion(+), 12 deletions(-)

diff --git a/drivers/firmware/arm_scmi/transports/optee.c b/drivers/firmware/arm_scmi/transports/optee.c
index dc0f46340153..8fdb80d3fabd 100644
--- a/drivers/firmware/arm_scmi/transports/optee.c
+++ b/drivers/firmware/arm_scmi/transports/optee.c
@@ -612,23 +612,12 @@ static struct tee_client_driver scmi_optee_service_driver = {
 	.id_table	= scmi_optee_service_id,
 	.driver		= {
 		.name = "scmi-optee",
-		.bus = &tee_bus_type,
 		.probe = scmi_optee_service_probe,
 		.remove = scmi_optee_service_remove,
 	},
 };
 
-static int __init scmi_transport_optee_init(void)
-{
-	return driver_register(&scmi_optee_service_driver.driver);
-}
-module_init(scmi_transport_optee_init);
-
-static void __exit scmi_transport_optee_exit(void)
-{
-	driver_unregister(&scmi_optee_service_driver.driver);
-}
-module_exit(scmi_transport_optee_exit);
+module_tee_client_driver(scmi_optee_service_driver);
 
 MODULE_AUTHOR("Etienne Carriere <etienne.carriere@foss.st.com>");
 MODULE_DESCRIPTION("SCMI OPTEE Transport driver");
-- 
2.47.3


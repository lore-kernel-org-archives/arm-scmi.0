Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A5D73176FD
	for <arm-scmi@vger.kernel.org>; Thu, 11 Dec 2025 17:16:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765473368; cv=none; b=rZdXo5eUsnDp5tLuZk/FMLvDqGM5Qbq0itmqtEcxjQt7/PjVMgiQqC9F3J6ESW/NXkyoMhrG1VJUrSk8O/XR2H9eDE5Zmkj9JO8Rvl5whS8Q8PBXlNaHKj3u3Z/WAt1v+6O2+j2vdiievwhuBPg7wpJNDZZRNL55jz5zcjzJLa8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765473368; c=relaxed/simple;
	bh=XCE+dl0ldCkIhemm2S2ZeqHCREzROrXlRdPi5igiXsk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=TBlkkmaaT7GeqkX8Oy+COhQlLm0qRi+Ks2FccUz2HKCBI3ql1H0GJ73Ruqu6gqWP+A1w/9M3tqkbqUvPHqHaJfBnqEyRF7Y+0cH/0ORqqdfTGMyNmUAdjJT/PtrLXioBILBMJSt3Bhz/PSya6h5h+1xK3SCkmtktOfRWwO5Qntc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=wKJ5quxG; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="wKJ5quxG"
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-42fb03c3cf2so1625f8f.1
        for <arm-scmi@vger.kernel.org>; Thu, 11 Dec 2025 09:16:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1765473365; x=1766078165; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0Jsu33z0wmycD38Ck1lob20P1g6o+zkut+jonvSWb/k=;
        b=wKJ5quxGtR/l9tA8vmg6AFfMefeZXVT7BXJyNbTkRzc2fsd2RKV7RzpDGK7igOUIh2
         /uNLBpFfLK+wWA21BL8TYS9AkRhYnMN9PmN6aPbUeeyAbNaPb9MycteRDUFeENqFBSx9
         NdnGo+iI2s0+Ya49nt5Fc00k3PAKu0NDnaVqd3pf6oNn/g9+Qy7d+RREPnptnG80aHO3
         3NWsInEzfcOjiqD9J0y8CBizF0f1lIJAo1ZRXzLsMPWWPPpvx0UlHce1su/omDdvhhII
         4pLfS135dmEJTlJalLXabQ6bq0RWGIU8eaUVGyXf7N9qBzemyWUBNcgKfiwtWMV2KaqT
         OjfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765473365; x=1766078165;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=0Jsu33z0wmycD38Ck1lob20P1g6o+zkut+jonvSWb/k=;
        b=PCdmWcWcpZDwkgiOWhvrpMktT8tZDMByFLQwLRKsQfrmsasjK77kZZPHKqrEPDYIH7
         d1ZpSOEdBOL0BVMI9iczKMqcQbI16tzWD1fJdp4/+Vlq9xtIV6l1VC4mvL1s87epG6Ue
         WuH9L5KyNF4zk+NwZchG7UvIg2vEsoNYaavLflSDfU+4C1gCsCkKmCwb6rxRzwadDUwK
         9fTL75tUFvhYcu2/Odq74dsD/KVn41THn+1M1+XmDyIXKNuQEqL93Tw5G4s9YfDHTpyt
         06pjIpUWOIG534ceKU9lVEJDxeoifCCWAis0rqCof7/hSbREeAoXlufj6v+jG0Vd3eLZ
         Mncw==
X-Forwarded-Encrypted: i=1; AJvYcCXUahKVSTS+KqRg9SNb+Yahu1SJuF8tjh4hkcVxLq19YhnhI7pvJxcYGzQg1n7Cv34tUIXI+PVPwQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzjCK7s4plBR7cGhfjTkwDqyo9EJn9/piSYqYsVfuFLz546kRNn
	2UA7o/WTNaNppy6IoLItDiAaBPCJLkZ1zvyKCLYJXOgalU0YoRoMOuFfbj8bIkIwkrk=
X-Gm-Gg: AY/fxX6L2QOgEcap/Wf0Pj4GQNfnvGRdQh46w+4O2/qRKPnS6hbic/Imhynv3mxO3UV
	VRuY8ViMjnrLqbBYBwf9mhkrmbGeZtuh4w1B4e7UjcWy3N42BK/9LCz5rVNJr6JN8N6z/oqrC7c
	dDaxnEd1alg54p2pBojFIhzdX6+WhB/uvJHFrikVodXKGccMbtTH4wHAav69uyIrG7HVmo8KSNw
	+XA6H+vAVqSN5Fl9Zi3VN1J5eDF6A/+HNEsqizWHlR8o9Klio6EG2ExMtF6Fs4mm1TFm2e97VcN
	GpAfqM+se6oIju30iYCR5b1Fndn/WIcblYaIT3HpoNWm+d2hrg+nu7QUUj6vd4C/hwHP5xkbbVY
	Hvia5ggxDyg1ku1FBO8TEVAdDOhoEyZzJOsMUqg9Z/+ufzsr90Z/Eomeb/PyDLdQJ4xA4Qwd6ce
	gmbQxK6xxdB43IJrUOhFPGW7KMzUGSONTlkmkDSU+7uhsB6L5BM7REFyeY2X2H1vSqgg/3qsaHc
	Nc=
X-Google-Smtp-Source: AGHT+IHT/47lM8U2n9kb0yO2qNfCYTAMiiikeGIeIkkmwYtl5yfApNSyt+GvQrmmfeRCuqCiWdtNfQ==
X-Received: by 2002:a05:6000:2008:b0:42b:3c8d:1932 with SMTP id ffacd0b85a97d-42fa39dff34mr7462013f8f.23.1765473364680;
        Thu, 11 Dec 2025 09:16:04 -0800 (PST)
Received: from localhost (p200300f65f006608b66517f2bd017279.dip0.t-ipconnect.de. [2003:f6:5f00:6608:b665:17f2:bd01:7279])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-42fa8b9b20dsm6977919f8f.38.2025.12.11.09.16.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Dec 2025 09:16:04 -0800 (PST)
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Jens Wiklander <jens.wiklander@linaro.org>,
	Sudeep Holla <sudeep.holla@arm.com>,
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc: Cristian Marussi <cristian.marussi@arm.com>,
	Sumit Garg <sumit.garg@kernel.org>,
	op-tee@lists.trustedfirmware.org,
	arm-scmi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1 10/17] firmware: arm_scmi: optee: Make use of module_tee_client_driver()
Date: Thu, 11 Dec 2025 18:15:04 +0100
Message-ID:  <537c48e3db243b5c68c3192179a948efb3a180c7.1765472125.git.u.kleine-koenig@baylibre.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1765472125.git.u.kleine-koenig@baylibre.com>
References: <cover.1765472125.git.u.kleine-koenig@baylibre.com>
Precedence: bulk
X-Mailing-List: arm-scmi@vger.kernel.org
List-Id: <arm-scmi.vger.kernel.org>
List-Subscribe: <mailto:arm-scmi+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:arm-scmi+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1429; i=u.kleine-koenig@baylibre.com; h=from:subject:message-id; bh=XCE+dl0ldCkIhemm2S2ZeqHCREzROrXlRdPi5igiXsk=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBpOvwtSZF4Ik75GwqQ+EWV8U0/usd0EXZO6Sryo OtegG9XU8GJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCaTr8LQAKCRCPgPtYfRL+ TkGsB/4kfZYi859BNNllj8EMK4U0tKtFDeScFfbKa+NwjGXgHVpSR89DKubfoO7V7TXzKxzZvMC v63m9WjAd7iwwwDv5xXNjj1JC1KnscMoyDrKlzKWrZiLuYJHCZrk3Sydo/8FtIfFKhL3/J5Vixg P+q+Yafa9vNA3OaLq/baAtLoPdm17/FoQA8NR4prce1EHo8UMzLvPXuyrpEGvq/WvuDVwpPraxd H88+knoEsk+vtjpVUa1O6A91PsS5YPd1QCPuwaCJ22w3g8vPvCpO+5sOP5c7Yfu4Mf9ShaalcGG QH/pUvOksk9bBlExdPdfrM98AqIk/xJKyHsRfm6/hBZGcaId
X-Developer-Key: i=u.kleine-koenig@baylibre.com; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit

Reduce boilerplate by using the newly introduced module_tee_client_driver().
That takes care of assigning the driver's bus, so the explicit assigning
in this driver can be dropped.

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


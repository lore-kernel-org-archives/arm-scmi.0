Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13DE733E347
	for <arm-scmi@vger.kernel.org>; Mon, 15 Dec 2025 14:17:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765808279; cv=none; b=OIHnKGvR1TFUlkN4pIpp2A2GIvmH5+UkrkvDWbPjATbRuFXfzSmabImEQ6X1+0Yn2fLNzBA3iBlvS31/4blXAOqJQeEk7+fjtGnSGkgPElAmtNz/revb2E0usycO8wgsvjYL5z6xz0/5ds2+E0qjyBAnoGahlUrEti/elRrLZrw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765808279; c=relaxed/simple;
	bh=4A/9VAHmTaZWnv8JgiT7H1qCJuRsg+ML7SSaVfNtUv0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=IkH8DkjP8YtCVVch40zhs7PBeSOvosp93s7aIXQJWa2/JMnZ0cCoqQSGfith3ERjGWbdu0o49qLwVFF/Hutse2n7aWnVT/oCDKlIJMsLNIqLb2YajX4VYwQl2S8Zb3TXiM8mwkKNJnFp4WSDJT2dOQxhCRXDXN8TP0ZnUBcm2kI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=mm+vn8Iz; arc=none smtp.client-ip=209.85.208.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="mm+vn8Iz"
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-63c489f1e6cso1530997a12.1
        for <arm-scmi@vger.kernel.org>; Mon, 15 Dec 2025 06:17:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1765808272; x=1766413072; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sfzDwdLQJZM+QWaZp429a9MEMQ68gzEG7kbM26+AAC8=;
        b=mm+vn8IzC5KfpdLYgEU6KpMr4FaNGnqtVc7NfPa8oDlyyfkwbZ9JBhQfzxIwYVfNQH
         +lFEAH78R3djpoYCQSSLSGyXJB0wOUbAr96TlcOEkS3ElR5ifMSJFOlyk+aN97eeE7aX
         0C4PWbDAwVcuBJnFe/2y5f1pmBvlbfk/odUsRxG/JNltcpVNddNU57A+TQeBGzQxrysh
         zn7+UhKFbO9d5CDa/dJq9uufSkJTsQQXucOaD7cejll4aL65oI9E+e5OjAg3xCsLMTq7
         M/bTVqCQsJEuWeN+KwvWv37TSd+3uslxq8I+0qggaQTZtp912S1GPFE8mum0bXXFVXQI
         hDEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765808272; x=1766413072;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=sfzDwdLQJZM+QWaZp429a9MEMQ68gzEG7kbM26+AAC8=;
        b=bQMpJcYdlezwZrbKirpWDvbByW48vl5alsK13EGjCVvXO3U4lqXq7c/O0rA1d88bBi
         nRzxgmPl6Oq2NNJTBnpUg57TVnfq2UfdUTFBZJ/d9/WnU1+HSriyjMuH/5jc7eFI3lnO
         EIHRQAQbMVpPCdEMb4ytYi0/6UkIvUp2BIC8xt5Usn1pmtPyD+qYyHJuoMMePVZw7vsz
         0/zrnlppIYjZ/14++gLPyjUvOIg+hLNYGcKp6JEuSCcIkwGEWrP8khIXk3T0LO8+QaQP
         EMKsRRODyRChu/6NeEfft2/9IIUSGU7hRfTpmYs96x5y8CSN3hiU/hhIO+2nK9GZ5JOn
         YwqA==
X-Forwarded-Encrypted: i=1; AJvYcCUbmoQHEzkSlPm6dQXUlx5+GQlW2pWj0LZeMRPMRUDuXv6YCpvJ1QqsawrOOwaD1iWFbGNsUH3GLQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzLPEgiFFGM4FY64opNjDJ5OlWv8L/ELOGJB1Cx+HdYxQxIxPNt
	5+uK4LgGXt90JgpMDO7VZ/BYx40swsyWrnO3f7t2hciJL0ynt5PX6MkPCay3ZzTAfIA=
X-Gm-Gg: AY/fxX6hEI4qm5iZdStJO4BFjNPfFR4V040dsIrLrv9WQt6YVelZDX0o5QE1qAaOa2X
	QlrnO+b8XxiwWZ0XCOHJdtuRC2Q6aULAXZmUiZjSxASExyxSgT/zgtPrOMHQTgvSLX6SYnvxNkp
	B/Zoi/ncu9IhutT5wdjaY/9dYOwGyeCYpxwGIuxZ+N7s8e2W0mr43L/tjMb4XXF0yukqhYIC4Y+
	ZhuE/geNetWFOEYqFSHFDhg2O3oXNoiRpZMzyJnRQOepgkV6bI51oQJwAl83ek7Ye8WEl6lrIUP
	xfazlvsvGXxrfDOrdsggGHJy7y4onBq1VC1k2OBopQisl1SiXhuGRaVp/MsRMmqngaF03Po61A6
	BV9iOTrSDHKIqkX9frSj4ApRDXVKmqXEANDjCtqZQGiKlvAf830RI5QZFxnGYkxbKSHdJ+Hr9s8
	5xY5A/QKXqJUTc+i1301pGvO2IMEaORdWsCs+np+z4DrdkBOPK7LEKz/JyJNCLfsK7cghX
X-Google-Smtp-Source: AGHT+IFOJgC5Ya2iL64i8Tv4dTF8QQYDLC4+J0wActxyot5OM2vMJCd/KcUe/O38HWI5lnvavkRPtA==
X-Received: by 2002:a05:6402:345b:b0:640:abb1:5eff with SMTP id 4fb4d7f45d1cf-6498745b430mr10332378a12.8.1765808272372;
        Mon, 15 Dec 2025 06:17:52 -0800 (PST)
Received: from localhost (ip-046-005-122-062.um12.pools.vodafone-ip.de. [46.5.122.62])
        by smtp.gmail.com with UTF8SMTPSA id 4fb4d7f45d1cf-64981fa5514sm13619843a12.0.2025.12.15.06.17.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Dec 2025 06:17:52 -0800 (PST)
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
Subject: [PATCH v2 11/17] firmware: arm_scmi: Make use of tee bus methods
Date: Mon, 15 Dec 2025 15:16:41 +0100
Message-ID:  <859339714ce238c34fdc4832fa23d6d6abec6ba1.1765791463.git.u.kleine-koenig@baylibre.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2594; i=u.kleine-koenig@baylibre.com; h=from:subject:message-id; bh=4A/9VAHmTaZWnv8JgiT7H1qCJuRsg+ML7SSaVfNtUv0=; b=owGbwMvMwMXY3/A7olbonx/jabUkhkwHiXSzA2c6kuc0awa3zu+SCZ668nFKvHWuQ19u+6RrV +fOP2TSyWjMwsDIxSArpshi37gm06pKLrJz7b/LMINYmUCmMHBxCsBELnWw/7OWWaMvsKvlGqeJ z1e9vfb6bD16p1Yo+j3aH1+h4WE+cR+rYGip+ZscsVOCdsvEzzEe/2OuPX1C0dzONVfenBSXdO6 e1BtrkaJnFXTX9qFbVku81gGHfJl9i7dtXOw37fxuLncN9+t2MjZ9TFN03JkW/zSd8+Hcdrf3Yu pCDWLba9+rzpdm/bDznlWxX63nqrDMdlVjC6bdwWea7PgbbQsaD3usDXjRmnko2+n6OT7dn1PuK vutPc98QFulL1RplW5+csjilybqX3IPKcRm3Xw5LW/Jft5d9ns+zE+5xtCrPjX07ZFLfxQsBcSi Jt3TWi4c4RbgyGilb3ldI3iztf2EVXo9Fy6eZON4E9APAA==
X-Developer-Key: i=u.kleine-koenig@baylibre.com; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit

The tee bus got dedicated callbacks for probe and remove.
Make use of these. This fixes a runtime warning about the driver needing
to be converted to the bus methods. Note that the return value of .remove()
was already ignored before, so there is no problem introduced by dropping
the error returns.

Reviewed-by: Sumit Garg <sumit.garg@oss.qualcomm.com>
Reviewed-by: Sudeep Holla <sudeep.holla@arm.com>
Signed-off-by: Uwe Kleine-König <u.kleine-koenig@baylibre.com>
---
 drivers/firmware/arm_scmi/transports/optee.c | 19 +++++++++----------
 1 file changed, 9 insertions(+), 10 deletions(-)

diff --git a/drivers/firmware/arm_scmi/transports/optee.c b/drivers/firmware/arm_scmi/transports/optee.c
index 8fdb80d3fabd..07ae18d5279d 100644
--- a/drivers/firmware/arm_scmi/transports/optee.c
+++ b/drivers/firmware/arm_scmi/transports/optee.c
@@ -529,8 +529,9 @@ static const struct of_device_id scmi_of_match[] = {
 DEFINE_SCMI_TRANSPORT_DRIVER(scmi_optee, scmi_optee_driver, scmi_optee_desc,
 			     scmi_of_match, core);
 
-static int scmi_optee_service_probe(struct device *dev)
+static int scmi_optee_service_probe(struct tee_client_device *scmi_pta)
 {
+	struct device *dev = &scmi_pta->dev;
 	struct scmi_optee_agent *agent;
 	struct tee_context *tee_ctx;
 	int ret;
@@ -578,24 +579,22 @@ static int scmi_optee_service_probe(struct device *dev)
 	return ret;
 }
 
-static int scmi_optee_service_remove(struct device *dev)
+static void scmi_optee_service_remove(struct tee_client_device *scmi_pta)
 {
 	struct scmi_optee_agent *agent = scmi_optee_private;
 
 	if (!scmi_optee_private)
-		return -EINVAL;
+		return;
 
 	platform_driver_unregister(&scmi_optee_driver);
 
 	if (!list_empty(&scmi_optee_private->channel_list))
-		return -EBUSY;
+		return;
 
 	/* Ensure cleared reference is visible before resources are released */
 	smp_store_mb(scmi_optee_private, NULL);
 
 	tee_client_close_context(agent->tee_ctx);
-
-	return 0;
 }
 
 static const struct tee_client_device_id scmi_optee_service_id[] = {
@@ -609,11 +608,11 @@ static const struct tee_client_device_id scmi_optee_service_id[] = {
 MODULE_DEVICE_TABLE(tee, scmi_optee_service_id);
 
 static struct tee_client_driver scmi_optee_service_driver = {
-	.id_table	= scmi_optee_service_id,
-	.driver		= {
+	.probe = scmi_optee_service_probe,
+	.remove = scmi_optee_service_remove,
+	.id_table = scmi_optee_service_id,
+	.driver = {
 		.name = "scmi-optee",
-		.probe = scmi_optee_service_probe,
-		.remove = scmi_optee_service_remove,
 	},
 };
 
-- 
2.47.3


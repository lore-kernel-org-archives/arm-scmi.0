Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A081131814F
	for <arm-scmi@vger.kernel.org>; Thu, 11 Dec 2025 17:16:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765473369; cv=none; b=QUBsC31mx9h3JTuPulBvm5dT1i0l03Y5fV1hX6H538bG5SAFtQs8EI8ozopT3k3GN195c9R+2JxuI9aP6TQAV+2afNh+hjQVmvM1JjV7lRN3i6wLjxTUj3yFvDihgOGHE8uHXkWYKA2bhGhwBpjNQ+LunOdcfX0j/FCNpwg/PsU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765473369; c=relaxed/simple;
	bh=CThuCWJi4dOQENcO7QkBfz1Ye/Pbs4UbUDXRANvmB2A=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=FlwpbQ1JXZDlKYYBBISLqGfJGCfORnPvE6rAUqGmXH8XtuZjl9c/bloge4NHZzEWiTkp2dzf/qWys6MAjnuEiYNldXHr9iM+tZv0afUr5hVKIvFVbLQ2e5paSTlvE4sgohoxvuzm28/4EaJ4pQTEmIufPKLy7W3MF2vUXZqVQ4Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=lGTTRowI; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="lGTTRowI"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4779d47be12so3621405e9.2
        for <arm-scmi@vger.kernel.org>; Thu, 11 Dec 2025 09:16:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1765473366; x=1766078166; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uJvuh2zJXk/iXDELpMIpnq6ZsR0QR0lcnSQ7RpEarGA=;
        b=lGTTRowINsFcOVe02lSNjSll2fQ855VfYEwxB0PZAzZCm9BARiiuMTwWFtsOxnOXLJ
         oxmLE473FunVvaebavQ7ae830a+XmlksI4UPrjGOVEaqK1Gr4BS4A1Rg+ZIfikbQceiL
         y/KaNKMOU/xedGN8nQB547V7fCjbU770vFOQogqspq60AHfTjEQQmkVjYYdPCl5Cn3mz
         wqr6zHPZPQFjJx/4FJgdqLeMLYrWC0XvSybIihkNlfJ6fbhpaEfW211c2BGOE70sR6nE
         Y1yIKnCxJSsk3bVuLZHRV62xd4ZpkPilK2mmNorbjQOnJZolMWpwPixRO15CaGBnpsmG
         +Ssw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765473366; x=1766078166;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=uJvuh2zJXk/iXDELpMIpnq6ZsR0QR0lcnSQ7RpEarGA=;
        b=MHcFFXg9HHWzikZ00fo+rxV6rLitFKbpvAI/u+hvb6sE4hqKxZbL57vkXLG5tx0dYl
         EzKKWz+LdgvKfi4g/ZvsArjpwz8dyQEuWDkAdPK/NRSVFZsa48y0LvJblhkzmy7cL/qy
         v46SN6iB3P6q5KXiZLG/0L0XwB159s4CijZgNEtu2PMl/sAxum6Q5B/SoW3FnntJTVBw
         pPHX6rzGjZgh5jDafaJ5Fc1aHukPN76ovLlC/pcD09cWU4fJPMSTUxjB6yOdqNGWv6i5
         uipWEoS998jeS3tU2wYK+eHPYHa/MhFwQiHXie4aBbUvOitRwzCCP6fWi7hYNkkFPpIK
         TzfA==
X-Forwarded-Encrypted: i=1; AJvYcCVFymyLlOU0nNGJdBjk79MO/Fn7Rg1fy/mRH3BMxQKUPxvcZh+CXmn65kDm+Mg+rXuCvYr1ij7TuA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxCh5nlzKsuaMCH0rXVLIyeH+uhWkxaCSzLg/mwO3gWdafTamrv
	uFHoc+FguNnsRWeEafTamH8mkqOz3raBPWMPfvycfRuunrhvtAc4dy1vZUR6iF+G9Nc=
X-Gm-Gg: AY/fxX6FIPtNHwRnJXADTIRnrnlXRKNpnw+x+M5wjLB52y1YJ5pNDGd0nkk+N/t+QnY
	9+yIvoysQaHTDnuRJ6AWVeyOHECfa6ILVHHccr12yehvxtWB8Eh12tQTpw+3dTJtMdDXhPNMr7q
	vEhJ+jJfxia+4MEQLhsh5WI0yafyjtv7i6LmksawPy8U63vvcuCNetdOWoyStDYFrpa37qq+P8W
	bW6efAMSPGXS50AVDe+2aDCX1048bzW7Wk4YXmeO9pCSCE8s3486SdYxqCxQfw/Q+3WLDLgKMb2
	xSTp0HivqCDc+dfhu3KiOvn3ayZJWOr9S/f5/xK8b0vfpwRJNDR0rBERGXX+1+WXz6NDLO3bXyC
	BaFzgurd+pke9Obh2etEPJeCm2kiZ0wwIaNztCnvsDaxSN85UFEuRSqYpiY90yj0/s5ltcq8mlZ
	vvc+wiWex1ngzJSv0++2SpkRo8AVjrZWb+RQAGTPFvQw+Ce3l0b7utfWrzv0l/K7mQVZlDhcnCu
	y4=
X-Google-Smtp-Source: AGHT+IEGmS+1LhS4ZsJsEwUzoNuTKqPZKX6sWYZNnchoA1D32F7TBe8hMOH8GOYwpwExY7BjQ6puZw==
X-Received: by 2002:a05:600c:470a:b0:477:c478:46d7 with SMTP id 5b1f17b1804b1-47a8384bb93mr65103155e9.22.1765473365857;
        Thu, 11 Dec 2025 09:16:05 -0800 (PST)
Received: from localhost (p200300f65f006608b66517f2bd017279.dip0.t-ipconnect.de. [2003:f6:5f00:6608:b665:17f2:bd01:7279])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-47a89ed6813sm18027445e9.6.2025.12.11.09.16.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Dec 2025 09:16:05 -0800 (PST)
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
Subject: [PATCH v1 11/17] firmware: arm_scmi: Make use of tee bus methods
Date: Thu, 11 Dec 2025 18:15:05 +0100
Message-ID:  <46dae3cada663b3a5ae1989881d9e74ef40acce5.1765472125.git.u.kleine-koenig@baylibre.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2489; i=u.kleine-koenig@baylibre.com; h=from:subject:message-id; bh=CThuCWJi4dOQENcO7QkBfz1Ye/Pbs4UbUDXRANvmB2A=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBpOvww5Fdhu+aWz2MP7psFnJDaCqSIMI0L6LHTN epd1RJ6lh6JATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCaTr8MAAKCRCPgPtYfRL+ TmkNB/0YKwt4sdh/V0tvwCmGZWV8z4k4PtU5uKfNbIzaUiD6HqBwjSazrEryMHtANr/UGgSXKIY g6wAfPHQ7BBgbU8Vh2aGoY76LpexA4nfFlq68n8Suxao5uRi6oduzNpX8YoMvSsFQKZLFPonVdU tLx7XPSKIBhVdbMadabM2MGwZmSfYe6lCQY5zuKRxzk2CXnwk1Ip8rZMZYq7qqY15E6ysSl1y6a tLiFhXD7hUsGffmgeMlBtuHsXOKqk9k7Os37VByPrcKt1yqVayq6gSWhgzGIFo7P2NiyqakZgf6 l6t7cZBtlhYHU4BluapUDhLu26g/LOWvt+tVlchYsiKw2ESz
X-Developer-Key: i=u.kleine-koenig@baylibre.com; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit

The tee bus got dedicated callbacks for probe and remove.
Make use of these. This fixes a runtime warning about the driver needing
to be converted to the bus methods. Note that the return value of .remove()
was already ignored before, so there is no problem introduced by dropping
the error returns.

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


Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794239619;
	b=X0dpaMwk6AZBkHhOSC8c1fj5W94sbtFDn3tnKVbmurhUjVMvvbbEi/5f5Lhu+9UdbR91
	 1POCgX4bqvc7IHa19iwBd8Pwm1FSIw0uUhjCoRSBzPiu6N01U8st0Ad09A5aZFgrCXY1e
	 o9OulrxuN/NIYEEdQVEwQdhXyNDSLBAMKHuZvu4SiVrwwotKr1id+xea9+KDdRdsa3x1a
	 pzI3pBFJvRDaauXnXw1gypmaPZINN7iw++cGCg7g1ZGIRKAIiYhvLouysvA7FxglyL7Bk
	 6lOmtZwiOt/KlkoarMqu0wsSoIzhnZPWXP0LJv4QHguG6RJ5SCg0lg9iATMEXUInAwQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794239619;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 MIME-Version:Content-Transfer-Encoding;
	bh=y/UIhhNXTZbQxwNhuS+j3xwIQNBK1V9B1w6cr776u5M=;
	b=xPoz7EMPMJTM33eP+8/ETGIjn7OAc9WjYQNyt3CryCim8Uvreu4x9hg1brrivY+5fvmV
	 dkao6tknYJJ7oDJMID+kGhIZXKriFIs4XnXGI+BmEePngQ0ZmmVGXs8dGtvSnkHIolGQX
	 RLDCo+HiOBW6uhLL+/EMoa/jbyvNTH9brkvJ0NTkgaVjw669+0nkGGwJTMKORNOd5mDB1
	 GnKmwSxN058LsHhogDLgcYHwLMfhTttEybdjf3pC4ki1Gwk0ViELY++3qRITvx5+GJC5g
	 RQzrZ00vFR5sHAfZcvQdL1f7cL8Od5buUWeMufTQ/IsUCCFfyWmOZo+WN/RADGG5LpQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=C02oSTTp;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4EC91606EEA4
	for <arm-scmi@vger.kernel.org>; Mon,  9 Nov 2026 15:53:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=C02oSTTp
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E1CEF1F008A3;
	Mon,  9 Nov 2026 15:53:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794239619;
	bh=y/UIhhNXTZbQxwNhuS+j3xwIQNBK1V9B1w6cr776u5M=;
	h=From:To:Cc:Subject:Date;
	b=C02oSTTpUKkKoh8I0h8uuS5MyLowq7ygidt5jyoyJuh5mERtq5B7VIWHSYxeh8sVD
	 TrKvU0a7JjkolClj1XD/cItICx4EnqOD2bkFymaUsh1VdIQI2q2AwmDZX5o9pRwsdL
	 anifEssVJ1AF4B4PCOsJs9p0Sx2TpmQ1v1ZPZkyRw9JjT62QGrY0X8ifoZWxjixhaH
	 zimq+2xQwS9fkpWSyT/hIonHuyNC5uDlF5L4OKtF0XRX0AuLI0x6m/FFZ3R+feSfzc
	 ZVq12El/KFRJB2hifXlr+GyuFnjdPDDY1S6x4rXBPnxcU6v4xPqgmHeeMuNR+GE13Q
	 px20JWDis60Lg==
From: Sudeep Holla <sudeep.holla@kernel.org>
To: arm-scmi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Cc: Sudeep Holla <sudeep.holla@kernel.org>,
	Ulf Hansson <ulfh@kernel.org>,
	Cristian Marussi <cristian.marussi@arm.com>,
	Kevin Hilman <khilman@baylibre.com>,
	Ulf Hansson <ulf.hansson@oss.qualcomm.com>
Subject: [PATCH RESEND 1/2] pmdomain: arm_scmi: Skip domains that fail initialization
Date: Mon,  9 Nov 2026 15:53:31 +0000
Message-ID: <20261109155332.1686594-1-sudeep.holla@kernel.org>
X-Mailer: git-send-email 2.43.0
X-Mailing-List: arm-scmi@vger.kernel.org
List-Id: <arm-scmi.vger.kernel.org>
List-Post: <mailto:arm-scmi@vger.kernel.org>
List-Help: <mailto:arm-scmi+help@vger.kernel.org>
List-Subscribe: <mailto:arm-scmi+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:arm-scmi+unsubscribe@vger.kernel.org>
List-Owner: <mailto:arm-scmi+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

pm_genpd_init() can fail while allocating generic power-domain state.
The SCMI driver ignores that error and stores the partially initialized
domain in the onecell array. Provider registration then fails because that
domain was never added to the global genpd list.

Preserve support for partially available SCMI power domains. Log the
failure and leave the corresponding onecell entry NULL so the other
initialized domains remain available. Explicitly skip empty slots when
unwinding provider registration failures.

Fixes: 898216c97ed2 ("firmware: arm_scmi: add device power domain support using genpd")
Signed-off-by: Sudeep Holla <sudeep.holla@kernel.org>
---
 drivers/pmdomain/arm/scmi_pm_domain.c | 14 +++++++++++---
 1 file changed, 11 insertions(+), 3 deletions(-)

Resending
https://lore.kernel.org/all/20260923101608.4180057-1-sudeep.holla@kernel.org/

diff --git a/drivers/pmdomain/arm/scmi_pm_domain.c b/drivers/pmdomain/arm/scmi_pm_domain.c
index fff7b4f438ca..b95b24470ba5 100644
--- a/drivers/pmdomain/arm/scmi_pm_domain.c
+++ b/drivers/pmdomain/arm/scmi_pm_domain.c
@@ -99,8 +99,13 @@ static int scmi_pm_domain_probe(struct scmi_device *sdev)
 		scmi_pd->genpd.power_on = scmi_pd_power_on;
 		scmi_pd->genpd.flags = GENPD_FLAG_ACTIVE_WAKEUP;
 
-		pm_genpd_init(&scmi_pd->genpd, NULL,
-			      state == SCMI_POWER_STATE_GENERIC_OFF);
+		ret = pm_genpd_init(&scmi_pd->genpd, NULL,
+				    state == SCMI_POWER_STATE_GENERIC_OFF);
+		if (ret) {
+			dev_warn(dev, "failed to initialize domain %d: %d\n",
+				 i, ret);
+			continue;
+		}
 
 		domains[i] = &scmi_pd->genpd;
 	}
@@ -126,8 +131,11 @@ static int scmi_pm_domain_probe(struct scmi_device *sdev)
 
 	return 0;
 err_rm_genpds:
-	for (i = num_domains - 1; i >= 0; i--)
+	for (i = num_domains - 1; i >= 0; i--) {
+		if (!domains[i])
+			continue;
 		pm_genpd_remove(domains[i]);
+	}
 
 	return ret;
 }
-- 
2.43.0


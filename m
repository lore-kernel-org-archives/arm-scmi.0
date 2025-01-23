Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7595F20C486;
	Thu, 23 Jan 2025 08:41:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737621693; cv=none; b=PPP+Y/U6U2d2vT/aYXFi7peQ0L4aS6NQmNAlpeSTbktUK0lFGpT+trbVlqtTL8wKnByV3c0p2M5s3BknGJbPvbU6+cGbZ5TAyKuAQXSOqi4gzDzpJhe23/ypqQq7oeCOqZCgICFsQvkqg72dqC7oFADB6rkFy5T0p+plLXTU06c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737621693; c=relaxed/simple;
	bh=62I6oA7eOCgQ+FxGm/QnqfQXIXepJ/0mn3YRReJf6Hw=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=am467GPaKI03nYpQ694YUGjKrXChTqz5rkzw6GB4/8dqw7NtFhlXB725ZDG4VvDJcDFbDDu1t+G3UqYHoKVYIMDjSR9+hNik1QMmQHa9DNDsbP9ZilJxzNraDZkVq8Wkezva3bV4JrVcXN1lrDTp80Qzf4u6NnkBd8+76buqEEM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IAzl8Ugr; arc=none smtp.client-ip=209.85.218.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IAzl8Ugr"
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-aab6fa3e20eso114391066b.2;
        Thu, 23 Jan 2025 00:41:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1737621689; x=1738226489; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=S2y5oYcaSI4UBJDG+9jJe3TDfvdo62ihfoVlT1vvxHQ=;
        b=IAzl8UgrmdGwDKC65Jq3OjAFHjuegESSkqVFmCxsOfp/A370vKNwhhUZYAJe9ZMaoA
         UxYE4/ek5PKt9JBs+3zTDBP5IkJX6/9A1eW9f4DM0mjXC8IHsfXMrjjqC/UK3T9gFMI+
         cH+sTCzK3FjR+zYwd2MAsfdTQPPxFgpdVh6KXG0qjV4X6xDYnTMIyVMDsTXreQjp8KZD
         YQutW7Xclg9Su/konbD4GHSC9vTOPItPKHZDCROZkEVfUXuS+BnjH8k+T+BROW8qequr
         QLQ2+8Yetk6r1+sWmQ28KuZrq1dzixTqJEUlGG/mQ0N5I3me7U8Sid4/xKS49unrdcpK
         K2gA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737621689; x=1738226489;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=S2y5oYcaSI4UBJDG+9jJe3TDfvdo62ihfoVlT1vvxHQ=;
        b=nIe+Lrru3hznfs1hKsDuK69kMqyTrg/KH8+HQ1qioU/Lo3cbb1CnxqqT8n6JkZSt+e
         m7dj+YQNiPaRmjaWfnN67RAVuemgwovpf3ZylUJLJmBQIRwL/tYIaTynStOGLM3DvYTq
         DTEAicokpaAXJLK6hvMcc2z8s9x8zZynm6z/YEkf6s/7bpDw5ww15riTb1vFYYMSS3Kq
         RfroLHylpyEHiVLe+Dxcg46aPql3A1o6Jh0jpo84uDi9exES1s8LUASeQYj29Etwd5pC
         YieDwV3q+ieygZHcM+7MwQ0yj+MRHauEmFj1L+rQvpLxSdvja82R/eFcippZJm7HOs2h
         mvig==
X-Forwarded-Encrypted: i=1; AJvYcCUTlywGk86D932BTIVU6j3LW8gcMhJJHzCKpBZF6xYklAx2Z4crHLZTIo10c9VNPvLZpYoN9kvJ3eKDRrs=@vger.kernel.org
X-Gm-Message-State: AOJu0YxSp8pCWOpWRW9GI5gY1HTpJGwPi1Ix2KocNNwSgbGjonN8Gd/4
	Ha2ZpqOxkzg7oPo52UnyBlsZ6j74u6mciRaN/n5pCfePsuSN12orOHupUUgDoErWbQ==
X-Gm-Gg: ASbGncubLI1CW61iSNCslLaw/rV08xQpj+y+bbwrDL08Sri1shEskImt/WdyKVRclQf
	IvQ9Wj198D3o6YD+6eo+ZZgBouz1pPpzJltWlv8qbEtRMDeu6s1X64FsOltqpYXGC5dTrQKXv3U
	jSxKqQ1hP3dCwbHH6uC22TuEegi7KjH2OV7bhZ8lMG8LaXiNpcQA1XFFTgUF5RWwKUQ7i7WQdlb
	JoF4OHCgYX+kiLscRfuHlOAMITkshY9sJHnzrv58NhlJfBtxHVyVIMNkLqbEGaerad729bf0ZkO
	JSe2
X-Google-Smtp-Source: AGHT+IFkaVPaBMvB5rcbN4hV/EU/dcj7Ws/sBuVzb+rJj8kAP/ApwFVhsti25NHx4pZGYU+LgV4BtQ==
X-Received: by 2002:a17:906:ae86:b0:ab6:32d2:16dc with SMTP id a640c23a62f3a-ab632d21aa0mr1028215166b.11.1737621688285;
        Thu, 23 Jan 2025 00:41:28 -0800 (PST)
Received: from linux.lan ([218.76.62.144])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ab384f223f3sm1031867766b.116.2025.01.23.00.41.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Jan 2025 00:41:27 -0800 (PST)
From: jack21 <jackhuang021@gmail.com>
To: sudeep.holla@arm.com,
	cristian.marussi@arm.com
Cc: arm-scmi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Huangjie <huangjie1663@phytium.com.cn>
Subject: [PATCH] dirvers: scmi: poll again when transfer reach timeout
Date: Thu, 23 Jan 2025 16:33:24 +0800
Message-Id: <20250123083323.2363749-1-jackhuang021@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: arm-scmi@vger.kernel.org
List-Id: <arm-scmi.vger.kernel.org>
List-Subscribe: <mailto:arm-scmi+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:arm-scmi+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Huangjie <huangjie1663@phytium.com.cn>

spin_until_cond() not really hold a spin lock, possible timeout may occur
in preemption kernel when preempted after spin_until_cond().

We check status again when reach timeout is reached to prevent incorrect
jugement of timeout.

Signed-off-by: Huangjie <huangjie1663@phytium.com.cn>
---
 drivers/firmware/arm_scmi/driver.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/firmware/arm_scmi/driver.c b/drivers/firmware/arm_scmi/driver.c
index 1b5fb2c4ce86..10b049fe5fd0 100644
--- a/drivers/firmware/arm_scmi/driver.c
+++ b/drivers/firmware/arm_scmi/driver.c
@@ -1246,7 +1246,8 @@ static int scmi_wait_for_reply(struct device *dev, const struct scmi_desc *desc,
 
 			spin_until_cond(scmi_xfer_done_no_timeout(cinfo,
 								  xfer, stop));
-			if (ktime_after(ktime_get(), stop)) {
+			if (ktime_after(ktime_get(), stop) &&
+			    !info->desc->ops->poll_done(cinfo, xfer)) {
 				dev_err(dev,
 					"timed out in resp(caller: %pS) - polling\n",
 					(void *)_RET_IP_);
-- 
2.34.1


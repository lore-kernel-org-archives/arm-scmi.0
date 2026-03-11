Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54153362147
	for <arm-scmi@vger.kernel.org>; Wed, 11 Mar 2026 19:39:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773257951; cv=none; b=J+juSZgrarihKcSaEAndFH4qnoUDbzA+9l0fcLmvl08Y0BSQreUW9W7JwIsxGTz2UEDeGc5bUaz+wrDKJK/SKl3fp9BeBlmWNSl5gOm+bdbN/CFcIjZahTcCY/pq+R5tYTk0KM0iZgCoK+peqUnnsMkaPCcSy3rXN/6heRLrDko=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773257951; c=relaxed/simple;
	bh=uiuLKhkwbgJ5qG82TYs4zio4/Nc6RL2AdehoOVJmCbQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bTpO6NBB6tG+5EmDk1DeQfQ6YaPGaaz45U7RHZAiTbr/X5iZJKpNPXeN9tKcMLhRSAHYdpga0mLbgRnoj4uBhoKNWtI5P1LAUJmeNeJkYdrS0C+Ai5PToLE/LsTQ3Co9X+nRwWpYbI6d0ZKOnSUdJwNuIN/zoExnjGSdpT+7u2U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=thfrsgzY; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="thfrsgzY"
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-439c4bde55cso177090f8f.1
        for <arm-scmi@vger.kernel.org>; Wed, 11 Mar 2026 12:39:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1773257946; x=1773862746; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=KMLfC50swTxVVqIck4nOrGTGoLiTGa8vSDXPzAV9bIU=;
        b=thfrsgzYc/juoBaMoXh5jvF8AxXbvSkyLZ2ShmODj25R7CD9u771avdk4bkRV0Vm8O
         jdMTX8v8G11j+L/7vzWoCgLPll91EmfxMyf/r7hOpudpSN+u2kARRX+SJizKPCxNBc3q
         gugIq6D9TYk8jjMhKFE4Q88fIX7e2j9xtp+O41HAMMh6ctn0px/a7wY5QqEOICRqD9zk
         Ay1/h+9AhQ3cKoxF603Twv8B4X9rUG3YeRDM6lmH28F9Kv+3239KppCkreCNH2ATFcPZ
         RNB9Hgf6sCBK3HwtyhCv8/o3HAJ3UqG8Fjs9kHBe9yY0qysXzA6ExSea2GgeD0ISW06P
         QGfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773257946; x=1773862746;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KMLfC50swTxVVqIck4nOrGTGoLiTGa8vSDXPzAV9bIU=;
        b=O1wDC4TTu4i6wCG9GMbcKTx0qzGVmRQe/uLSlzo/H8MxnJUWbqaCmY7BD6q/lRUeUV
         YiZ8XMkddu5cXhRi74ghGBgOzfR8+o5wY5EWy9Mx2gOkUMOpu9phY9gjbPAP/eFqaZkq
         5lSOADsnqUNZ/0A1C7Qrg1MNSuwL1xaoM0VWwbuNW6/mEWxEKfxudLIXkuZHfc0/0y9a
         yQK/kF2MgZPDQ2mKsC/l/qZBopLmF8HWnTZv5hh1MMN7ig3WdqJQyvW+urJnFnkHkTDo
         cEAmCA+U1gbxo2qWznlF4HufM5EyKcOt0O4vHnsnDmvjs71wlynmb/nncAs1pz5LwDGc
         msTg==
X-Forwarded-Encrypted: i=1; AJvYcCXlaf9exDnguMiEie5ytYT7qQa0H8ZIUypyijXOty+2h0D37kG1Ymxz5s/Sh1VgX36u9SGS/J0PkA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxT+JGx3I/6aGgwGFPZLZrKjBPaf+OksT616hXQncwB23SOFP9t
	ert5epSmuoUh160tv0Ly8lh3s0usFOyucZC8ANuQcaha0W9npJZPM2MBEqdHJQkJNEE=
X-Gm-Gg: ATEYQzyrb5/X269o2S/jg6QB6V71S4kgC71sEDk8+eYuQaPKz+9REOu94nM0nosebW7
	furZR/hDPGv0mBVVhMzQyQL5IhtdlwpkPqmbXEuImBAclcJJJ5qfe26H8DibhaJW8WqCC3PiBmI
	VcWiWK7g3CetCpySznhLbu07cKEhiUTOv6ZGOik4U+DskomC8RotAANu+Q4M461q6n00B+zIalO
	3ApMt5zHDcwHmLZsiggBM5rSGGuf/OefPCVegx4gLsULCIZ2TTjJAIXr1ucbWVkCx4y06S8sYgL
	r7vrl7QJI5v054zZfIoIyNpyIy+NrGmoISHTrE09kKrgqzh2M0lhGEw0utLbDqb0fkv6gWEP+6T
	b1LgN6sW23f93mnEoZ/uKRxunqFoDpo/E9PhcvjV1W4p5rBTMY/DXuCqbfrW5StS369gTwSMZCL
	LxaPjbKw1UeSHJXNnHF4v9IoE+XRor
X-Received: by 2002:a05:6000:1846:b0:437:6625:d0d7 with SMTP id ffacd0b85a97d-439f8438f5dmr7101833f8f.42.1773257946416;
        Wed, 11 Mar 2026 12:39:06 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-439fe2273e8sm1655600f8f.33.2026.03.11.12.39.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Mar 2026 12:39:05 -0700 (PDT)
Date: Wed, 11 Mar 2026 22:39:03 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Sudeep Holla <sudeep.holla@kernel.org>,
	AKASHI Takahiro <akashi.tkhro@gmail.com>
Cc: Cristian Marussi <cristian.marussi@arm.com>, arm-scmi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Andy Shevchenko <andriy.shevchenko@intel.com>,
	Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
	linux-gpio@vger.kernel.org
Subject: [PATCH v3 5/7] arm_scmi: pinctrl: allow PINCTRL_REQUEST to return
 EOPNOTSUPP
Message-ID: <e10b198aa9ed7a9cda6d0e9033a00d1c700ecf9b.1773150895.git.dan.carpenter@linaro.org>
References: <cover.1773150895.git.dan.carpenter@linaro.org>
Precedence: bulk
X-Mailing-List: arm-scmi@vger.kernel.org
List-Id: <arm-scmi.vger.kernel.org>
List-Subscribe: <mailto:arm-scmi+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:arm-scmi+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1773150895.git.dan.carpenter@linaro.org>

The SCMI protocol specification says that the PINCTRL_REQUEST and
PINCTRL_RELEASE commands are optional.  So if the SCMI server returns
-EOPNOTSUPP, then treat that as success and continue.

Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 drivers/firmware/arm_scmi/pinctrl.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/firmware/arm_scmi/pinctrl.c b/drivers/firmware/arm_scmi/pinctrl.c
index a020e23d7c49..42cb1aef1fe1 100644
--- a/drivers/firmware/arm_scmi/pinctrl.c
+++ b/drivers/firmware/arm_scmi/pinctrl.c
@@ -578,6 +578,8 @@ static int scmi_pinctrl_request_free(const struct scmi_protocol_handle *ph,
 	tx->flags = cpu_to_le32(type);
 
 	ret = ph->xops->do_xfer(ph, t);
+	if (ret == -EOPNOTSUPP)
+		ret = 0;
 	ph->xops->xfer_put(ph, t);
 
 	return ret;
-- 
2.51.0


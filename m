Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8692C31717B
	for <arm-scmi@vger.kernel.org>; Mon, 23 Mar 2026 19:01:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774292503; cv=none; b=rMJOh+FyKgPBCuKNbuSohb7NNhd+1eYB+4XDSoOEImCguBzx46sqXydKb2ZNAR8ADJ1B4ksbs0DAaCsxbDFJFihm69K25xJM7UmL7jzagnThuRxg2enYCbwIdPa8XSDd2LCKQiTK4Lhgq/lal7/hQZ9EaUsMAnauTTENTJywOMk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774292503; c=relaxed/simple;
	bh=4eMRyd7ypxHELGqboKMzfQdvI1AzqqmZaR+Esy/mH5Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RLisrvVu+XErWRrx3CfYMf5d6rWu/qEMBrCsvcogRcEslkZdmYnd3Tlu0lQfJyC27mgoXxGC1Zudebr9Rswg1I1nZYrInwiHkuuiDBKcbTBSYa4aLR0YmHhPDQZmaRGBbZvK3G3OIKrQ7hPe5X8wKpQhIzBWrY339XfVcEuRs8g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=btnBsPSF; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="btnBsPSF"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-486ff201041so26037845e9.1
        for <arm-scmi@vger.kernel.org>; Mon, 23 Mar 2026 12:01:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1774292501; x=1774897301; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=wqJ8L0iDmB6uCpuEVuLQCen8FVgOtcZrswCudIKUuCI=;
        b=btnBsPSF92cKZrz8T6VQhotiwZbNd18MKjnhDSiZyBAnN1eqPBxva9wvOE3Fremi9H
         iMhE5YFPQQOMeoDtrkQ1NMUgMd0R0QY0ySqjpvqB7mkKvIDEduP7rv7Kva8CYUoRB9SX
         oZrL8V+Dizk8Bd0cM6qhM0dmCOP6sUPSwrM5g0WO8llcQotV4Mr6UdU62vETUZWicaLE
         M/o1G/IBGTt5wtXoxw4wMcUnu6hoeb10Td+5GB8TivzOul1iRNTabc27s5Tdq0S/T4ge
         ieXy0R1gRgbFZsKe9l9NfxuY2n+DmmCNwyZXr5IC5oQlC356SYjE0GBBbmwIkVS7Z5b2
         Z4PA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774292501; x=1774897301;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wqJ8L0iDmB6uCpuEVuLQCen8FVgOtcZrswCudIKUuCI=;
        b=UXdoLJpopltU9A4IyXne6I6TpukQsn383Dt6+1bfhuex+5R9dpwogdkAD6nsatsXij
         PI+24q5baWqGM0A0ctHegF9udaVU6kiY7pzz3gpBZJ/UwIXOCZgB/Ty9hFXosw4Anq8/
         v1wF6OT+PgCEA7g/VsrJ+nX9kuGkgUwXeJ03Q3bX7MJb07B/wvJXUsRT7EQspcWIw+J6
         CNXriWZjqGAATFw0auP3AjmqmF9M6UaMRNdZuM4negKQYWZZX9wh8iT6xL6iYXABTYQ0
         N8Jav6tFxzCab3et/5stglAEPrKzmsHib8s3Bbu9+bxx51eOdmlZToYF5jOYaN6u+aWl
         U5jg==
X-Forwarded-Encrypted: i=1; AJvYcCWY/DeA9+vex2R9+G+T6x/AxdD8IDokVdP5WQxp5BSflaRs+fk/bWLTav5MgWsGdEzRlldqajopXA==@vger.kernel.org
X-Gm-Message-State: AOJu0YzUWEqBZAogowvmZRXI5aqhyFov1wtJRc13hQzxzUlkB8uW2mw7
	R1Fy0k8X2eP2CrxLicuvp46igvwSkrezDgyoqKC0lnbrcN6EqFO1tGOLetJNnDou+7Zuxk8GgLS
	jjLL4
X-Gm-Gg: ATEYQzxhA9LcfdXw5VjxWO2RDCyVw929gQGJaGway7f/WQ5kcpdt1dUQvYDUCKVS79F
	1i985F9YZLx6KM0CHw9PW8e1zpW9B7r8f+56yyZg7QfRAMMgOpc5Pc7oaTZYINH+JKcvInE7lVb
	48KPsSoEwRxrfA3Qx1A539kSxDxezRYZGwIFqRuwhsgaecLoBtuF99E9Ht+USPcwSNrLw8l46+m
	Jb4lyPaZQSaGro9NOmbxQrMUzpbFjTPkfbpDP+NiW6dKXS0whmH0Ix0lFCph5+ZCoR4vLO1jhml
	lJIU+/YJpjCTyqtaBNby8ocHSmW6IFnfQjchx92UXRDNep/f7jGWRtoQRv+6EPGnBtB9Baizsme
	7iJIYSCp48/084m3QlMdyTlWzA/19UT8aaYQRdvNZ/UYw9jawCF+O8RowGop5gHv6Ti5BKJ+h1l
	W4uuSzsVR+/qLxzhk+nOogCz74Hk7X
X-Received: by 2002:a05:600c:608e:b0:485:419c:4eba with SMTP id 5b1f17b1804b1-486febb58a9mr166627335e9.1.1774292500848;
        Mon, 23 Mar 2026 12:01:40 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-486fe032a55sm582792635e9.7.2026.03.23.12.01.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Mar 2026 12:01:40 -0700 (PDT)
Date: Mon, 23 Mar 2026 22:01:37 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Sudeep Holla <sudeep.holla@kernel.org>,
	AKASHI Takahiro <akashi.tkhro@gmail.com>
Cc: Cristian Marussi <cristian.marussi@arm.com>, arm-scmi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Andy Shevchenko <andriy.shevchenko@intel.com>,
	Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
	linux-gpio@vger.kernel.org,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Khaled Ali Ahmed <Khaled.AliAhmed@arm.com>,
	Michal Simek <michal.simek@amd.com>
Subject: [PATCH v6 5/7] firmware: arm_scmi: Allow PINCTRL_REQUEST to return
 EOPNOTSUPP
Message-ID: <2089955559d22747745c0f3fed19c1bea8608d83.1774283146.git.dan.carpenter@linaro.org>
References: <cover.1774283146.git.dan.carpenter@linaro.org>
Precedence: bulk
X-Mailing-List: arm-scmi@vger.kernel.org
List-Id: <arm-scmi.vger.kernel.org>
List-Subscribe: <mailto:arm-scmi+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:arm-scmi+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1774283146.git.dan.carpenter@linaro.org>

The SCMI protocol specification says that the PINCTRL_REQUEST and
PINCTRL_RELEASE commands are optional.  So if the SCMI server returns
-EOPNOTSUPP, then treat that as success and continue.

Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
Reviewed-by: Linus Walleij <linusw@kernel.org>
Reviewed-by: Sudeep Holla <sudeep.holla@kernel.org>
---
v5: fix subsytem prefix
v4: add r-b tags
v3: new patch

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
2.53.0


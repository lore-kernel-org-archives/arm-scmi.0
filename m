Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9400204592
	for <arm-scmi@vger.kernel.org>; Mon,  5 May 2025 11:38:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746445089; cv=none; b=tULz3Y5sg7P1IZ9fSabCxFGzfv1uh3BOeHnIKnHxLbFd+503wW7E6U52WmEPVIGtOdvRDDG33crbxLWh8LFSffFtRa9hQIDvMyU37DXbziRHm0L31HStF/2E1gJ3dwbSIJB4sP9f7f0+WKCUtR9OkHUVcRQX5QrVFzgF3KT1jE8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746445089; c=relaxed/simple;
	bh=R/WHlFZFKv+KxPs+9oB1B0r5TXqskrjUVFLrHry2GT4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qK0X3wwbjb+87FwW9PGGLDl0PAkJu0WIuDtrqmrMOgFSfNNuowxkLz3zO9YA10HUl+UBzZ+jzLixV5erRUrs5T/Ys6D5C+egPz/vL/BjTAGBQOYQBBQrf5p+Kl9ckrz2j4x0uzNPnxmnLjD1Mt7k71+ccVn6sR8vGw23Ld0Potc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=B2KEd8tn; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="B2KEd8tn"
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-39ac8e7688aso2979990f8f.2
        for <arm-scmi@vger.kernel.org>; Mon, 05 May 2025 04:38:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746445086; x=1747049886; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=EnfanRT/xnMsGy8H0p32Y/2L5KjP3rCv4iXcBwib1Gc=;
        b=B2KEd8tnRltXOjFpEuJ6OfklU49ySnIoVTv53sDC0kj8FwlTUA7171/BXaQH3k+1Ws
         IRnEL3nQ7sKN/iPLKerTQxN8DOEKgxNeH0CuNMc8epiGXEriQMbrRv/w2OlFcMNMlokE
         NOtHQq2iiVxLn/TC8caxIgYF6e8fExY5e04bn7JBPJOIRXrdo75PBkWrKw0jdAr+o+kS
         Ds2FBhIi+qXphfRRz4Dypw0pW0345b3Ky20Fqpgqpsusggjl5lVH8QN8sZ8KRESopLNM
         t6nb3ZwPUnwAXLCvW9bUR4bWJZ7H5Ykl2ifSULVhx75wpA41zSrIKIak2TGV9CrhXDzy
         sDsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746445086; x=1747049886;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EnfanRT/xnMsGy8H0p32Y/2L5KjP3rCv4iXcBwib1Gc=;
        b=WCz2hgHaJXtWsOWXMYh46h0v1X2fQG0rMw2qbykO/ztshFY9I8JZZM571keg+bExYQ
         BjVIq9q0ewODKdIg/uMrd18aTD90zAZH9jZS7Z938iAvQW2lH4k5Vwv9QJveNBISBnlH
         gIWaXbkZFqiDH3hNrWEH/YBEbnWcYMAbstZ3bt8XlQpJH9PjK/XfNtx/MMrrl7T50GYt
         aQNm5Lyu7q3OOYHo1b9kkwJPLlWXPZaKTHuc2bG6xUo3YE2zSPcqhOtslV24WWj8UrSw
         yAg8JRUiQwBjwx7lVGp+pms7nUho20+ztUTonj8L0XTE7ltQ4DJ0/lMfs0fgPznnLVcX
         yk7w==
X-Forwarded-Encrypted: i=1; AJvYcCUudQXDrzbzX32EwfmIQnjCvFxAMi5zwdALmH8qs/nt9FfgRUxKud5rXPP4liJFwD9Up0yBee12Eg==@vger.kernel.org
X-Gm-Message-State: AOJu0YwHZmu3Gk12Zx0cXT9raa5fkfrhU7PVu0sgN3HuUtqrzOZfkWm3
	Jbxj/ng60tkfaH36ABpROGhD8oPP98ztSIY179a+c1zrwEC3F7iR5+ScWJOVygU=
X-Gm-Gg: ASbGncsYZ6c0nF8Y4JiF+GbmN8fose/AB+qR0JY5plECyb6CZ8O2lYpqw7vetWZmes3
	f0curNoRtPXodUb7uYe86BpY0HR+N7N3Vpm/YzL+9JFIyMEjCUbetfLhKm820KQtI/WldNGKrOl
	h56w3D7ml5GEC3/zniIf5olJ2WP76YDI+va2SPBsDYEq6357GK9uF8a0WU5mvliQkV98jKSiWY+
	YjaFNp1PE/UIvnCedDQBv78+wY+/PzgsjRA5QQHs/yCKTZ0V6tR5rVf93/U5whbpBaVa2nsCHUS
	a3LhdGPdL1QK5HXwSGM85K6kFOQQHRDFBVWxeKw+BJuvxg==
X-Google-Smtp-Source: AGHT+IF/dmblFRkX7iqKnSY3Ui47NKfre3JcFqznctB9OO4eNwvIWHtPXnnSjPUS4bdilcUbRpgeUw==
X-Received: by 2002:a5d:588a:0:b0:39c:30f9:339c with SMTP id ffacd0b85a97d-3a09ceba16amr6598523f8f.28.1746445086315;
        Mon, 05 May 2025 04:38:06 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-3a099ae8117sm10276584f8f.56.2025.05.05.04.38.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 May 2025 04:38:06 -0700 (PDT)
Date: Mon, 5 May 2025 14:38:03 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Sudeep Holla <sudeep.holla@arm.com>
Cc: Cristian Marussi <cristian.marussi@arm.com>,
	Linus Walleij <linus.walleij@linaro.org>, arm-scmi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Takahiro AKASHI <akashi.tkhro@gmail.com>,
	Peng Fan <peng.fan@nxp.com>
Subject: [RFC 4/7] pinctrl-scmi: add PIN_CONFIG_INPUT_VALUE
Message-ID: <855acdd6fcef4856c4fcc59affd3a191f74dbe82.1746443762.git.dan.carpenter@linaro.org>
References: <cover.1746443762.git.dan.carpenter@linaro.org>
Precedence: bulk
X-Mailing-List: arm-scmi@vger.kernel.org
List-Id: <arm-scmi.vger.kernel.org>
List-Subscribe: <mailto:arm-scmi+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:arm-scmi+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1746443762.git.dan.carpenter@linaro.org>

In SCMI the value of the pin is just another configuration option.  Add
this as an option in the pin_config_param enum and creating a mapping to
SCMI_PIN_INPUT_VALUE in pinctrl_scmi_map_pinconf_type()

Since this is an RFC patch, I'm going to comment that I think the SCMI
pinctrl driver misuses the PIN_CONFIG_OUTPUT enum.  It should be for
enabling and disabling output on pins which can serve as both input and
output.  Enabling it is supposed to write a 1 and disabling it is
supposed to write a 0 but we use that side effect to write 1s and 0s.  I
did't change this because it would break userspace but I'd like to add a
PIN_CONFIG_OUTPUT_VALUE enum as well and use that in the GPIO driver.
But in this patchset I just use PIN_CONFIG_OUTPUT.

Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 drivers/pinctrl/pinctrl-scmi.c          | 3 +++
 include/linux/pinctrl/pinconf-generic.h | 3 +++
 2 files changed, 6 insertions(+)

diff --git a/drivers/pinctrl/pinctrl-scmi.c b/drivers/pinctrl/pinctrl-scmi.c
index df4bbcd7d1d5..362a6d2c3c68 100644
--- a/drivers/pinctrl/pinctrl-scmi.c
+++ b/drivers/pinctrl/pinctrl-scmi.c
@@ -250,6 +250,9 @@ static int pinctrl_scmi_map_pinconf_type(enum pin_config_param param,
 	case PIN_CONFIG_INPUT_SCHMITT_ENABLE:
 		*type = SCMI_PIN_INPUT_MODE;
 		break;
+	case PIN_CONFIG_INPUT_VALUE:
+		*type = SCMI_PIN_INPUT_VALUE;
+		break;
 	case PIN_CONFIG_MODE_LOW_POWER:
 		*type = SCMI_PIN_LOW_POWER_MODE;
 		break;
diff --git a/include/linux/pinctrl/pinconf-generic.h b/include/linux/pinctrl/pinconf-generic.h
index 1bcf071b860e..b37838171581 100644
--- a/include/linux/pinctrl/pinconf-generic.h
+++ b/include/linux/pinctrl/pinconf-generic.h
@@ -83,6 +83,8 @@ struct pinctrl_map;
  *      schmitt-trigger mode is disabled.
  * @PIN_CONFIG_INPUT_SCHMITT_UV: this will configure an input pin to run in
  *	schmitt-trigger mode. The argument is in uV.
+ * @PIN_CONFIG_INPUT_VALUE: This is used in SCMI to read the value from the
+ *	pin.
  * @PIN_CONFIG_MODE_LOW_POWER: this will configure the pin for low power
  *	operation, if several modes of operation are supported these can be
  *	passed in the argument on a custom form, else just use argument 1
@@ -135,6 +137,7 @@ enum pin_config_param {
 	PIN_CONFIG_INPUT_SCHMITT,
 	PIN_CONFIG_INPUT_SCHMITT_ENABLE,
 	PIN_CONFIG_INPUT_SCHMITT_UV,
+	PIN_CONFIG_INPUT_VALUE,
 	PIN_CONFIG_MODE_LOW_POWER,
 	PIN_CONFIG_MODE_PWM,
 	PIN_CONFIG_OUTPUT,
-- 
2.47.2


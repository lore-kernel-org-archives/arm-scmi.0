Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795447296;
	b=giEHpOlG0dVOoRvOrzuryZdVoOkytxT9SUqKHRrX4z4/R7b2PnBKu73gvUUyZqBUOOcr
	 8cVBfXQ8gcA5LD0wLNem95tmXgemXK3o5L/j+jFfMypOBoGwkCkoiWRulqfYmylQKJkwK
	 xIs/PRhMYeTOYHgWw1D5gh36ZS7rH0Ir+hZa7ceVaizmrfpz+j5Ok/hd2EWBpOpsuykJc
	 hB1ndVfMSiNYjSxkJfHiNNYdFXcHOz3VJW9TCidLcTTySkQ9dR+gk1wcjatp50ppDjlA/
	 dbdjBOlZufsGkEmV/UeaEKRw6ENVlBr1oXd+WKxNeyL2mHXPh9ohsBsHm1gRQ1Z7yOQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795447296;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer;
	bh=iwsAiO9OeRwcJqZpa6akbJuZXHFjd4eG1osiYUVbJJY=;
	b=HwuDfkoCTNawcLjLmaSWK0szT/MhLXtCyHGVWR+CGz6G4Ahk0olZ3yehuwPOzcG9dOHG
	 dzRH/af+VWZAbub8iKp1lAGNKBCyTmdA700PoNIVg1B7l9mbqC8wTVSNA1P7Z459gaIwx
	 9HR1ioaqjj6DNVcT9uS9zwMAvVwRpUZQsJTOhX9wPifh/AabUTcEk6ECfnqihZI7GnNQJ
	 gjDNCQx5paVEDgqLnP72GZF0C2EbCEmmZHdiSBZvxW/D7f6rA4p78atTJZ2u/Uc6HYaWv
	 1X8dNGejHVBtgeHGC4qI6DwOe/ByS0qezJIKnEW7+xfnE7+bPA7qmvg9TzskNkMm2xA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=Sevo7jMm;
	arc=none smtp.remote-ip=209.85.128.46
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 400D1606A680
	for <arm-scmi@vger.kernel.org>; Mon, 23 Nov 2026 15:21:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 400D1606A680
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=Sevo7jMm
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4bb85e07aadso42048935e9.1
        for <arm-scmi@vger.kernel.org>; Mon, 23 Nov 2026 07:21:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1795447292; x=1796052092; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=iwsAiO9OeRwcJqZpa6akbJuZXHFjd4eG1osiYUVbJJY=;
        b=Sevo7jMm6bksXy8/ba9SBgxeTty3YJuD8V9D7GKyrEZ0QtrcKNwUH5/coJbaxYDgZW
         qc50RSzmYf8z8Oci7vMb5EJi8dzR0M8d+Rz2Vx50+ey59Gzoi540F9sxJ8da3UnVJ47S
         AgDAWZgiYl6r/CKoRuILxpGN1ZlTaqYbySmIqlanUOG8AmflyconG2n4Zs0OGzWjOP9Q
         FZVBXCwhkVdoBNPJ8g+3YKAxXKS+dy+gQrIlXY/PTEejOAa0axYO8CFYl1lhI6kRFm7b
         CH/0MVMoRvSp4uFeEYUpnDbHRh4zmWCdhRCxZw1zFCaTf/pSjPsqulNV4l99PJ4gzo38
         gRPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795447292; x=1796052092;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=iwsAiO9OeRwcJqZpa6akbJuZXHFjd4eG1osiYUVbJJY=;
        b=KbWelVg/4dZVF9Lq01kmymGAly3LGjz3FuPJf5w+K1Uy+SQOESsnce7VzygHkg+BW/
         Oox23ad4AneUfA2MQTNNDr/4OdLWljm9zyG1Qer+Z4uZiYH9wt2dv+OgoA75w6Ugpct4
         NU8q0HkNargScxRAhWGPXiZ4fww3vaS3oOFkDJO7Ay91o2C3vutP8qz/znhx+52U2v/r
         ZxSv5YVHZgsW2B/HgNdJE/xoCWajKAwN5xpOB2fsxYSM9HOqzBdiICa+ZVAqcDvx65ER
         q9cG4DM2Ns775ABgeiMrKHEZw8PrGyOgtkmAZ86/qomdwdTyTQdMJAOOw8Ow3H+HQ7Vs
         6bOw==
X-Gm-Message-State: APuU4Z9LkHcxutHKcXGT17dvmr6lsQBDuToU47GA1bw7+JTvm5rMq/n1
	Ymn5TbOyQsjreaTShboWCHBhrUSJmNpnwDaQqa/VUUcgUm4op2BhK1FkUTTi9IakODU=
X-Gm-Gg: AZFdTZeyjQxMGY7TudroqnEtH8SQoaSb99TlIJM0WY3HbD+apvKaEntxJ3+lxGw0cle
	bC7yHikb2JHj9ZAbaysByTY+agLHe7jZn8nteLaOeld6zn0rl6pCrosAheFxuZa/npa4QzGAsGf
	xQ7DGrS76UV70TfHB7ahx7low985PdO7ss8oXYCuqGtLW+84Yb/w2m7PondjwUZGfNLVsILb+S3
	im5b3uo8AQFcciiBVFhrPWa8HW0gIvau4u9J4JZHaZSL0z/t9aMkujc//jDJ+FvUKaKXHWOy2fg
	MSjx18audrz+3Fq0Fv1PAoIDJwMKB4Ms9FxF9P8ZPGDkFOE5hk54tzq+LbTum2Ytu5T153g+lkS
	srCNZ8xgLpQ0570PqPdS+S8L1Bj/+wRaXBBn47uwNb7Tw10IbAXTKyf0ZoPC2zs3gu7hL0Or8+H
	Ga8QvDjprOaZvH74dD7ALKjjO5X61SVQK6ya6BHWWdQ5fuLp2ym2l0FY6ZuTFJhEpTvClPfNThT
	+LsgDHQbolGKcgLcbjhexDL6zFHU+WuP94bV8mZb3eOQimMgnYVHtPRY3kbUmSDawP2ZpTTYwok
	jOlYQmj7utfLnNbcHTxXC4sDyqaKAOwk8mWDNIeEqkZ3kGVlsw8=
X-Received: by 2002:a05:600c:1d09:b0:4bb:6b59:aac3 with SMTP id 5b1f17b1804b1-4bb88816050mr253067465e9.29.1795447292523;
        Mon, 23 Nov 2026 07:21:32 -0800 (PST)
Received: from localhost (140.30.66.37.rev.sfr.net. [37.66.30.140])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb884865b1sm351526825e9.5.2026.11.23.07.21.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 07:21:32 -0800 (PST)
From: =?utf-8?q?Cl=C3=A9ment_Le_Goffic?= <clegoffic@baylibre.com>
Date: Mon, 23 Nov 2026 16:21:25 +0100
Subject: [PATCH v3 03/10] firmware: arm_scmi: stop reading past
 PINCTRL_LIST_ASSOCIATIONS replies
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
Message-Id: <20261123-clegoffic-pinctrl-scmi-gpio-v3-3-d61f039be008@baylibre.com>
References: <20261123-clegoffic-pinctrl-scmi-gpio-v3-0-d61f039be008@baylibre.com>
In-Reply-To: <20261123-clegoffic-pinctrl-scmi-gpio-v3-0-d61f039be008@baylibre.com>
To: Sudeep Holla <sudeep.holla@kernel.org>, 
 Cristian Marussi <cristian.marussi@arm.com>, 
 Linus Walleij <linusw@kernel.org>, Peng Fan <peng.fan@nxp.com>, 
 Oleksii Moisieiev <oleksii_moisieiev@epam.com>, 
 Andy Shevchenko <andy@kernel.org>, Dhruva Gole <d-gole@ti.com>, 
 Bartosz Golaszewski <brgl@kernel.org>, 
 =?utf-8?q?Cl=C3=A9ment_Le_Goffic?= <clegoffic@baylibre.com>
Cc: arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.17-dev

The transport cuts a reply larger than the receive buffer, but the iterator
still reads every identifier the reply announces. Return an error instead.

Fixes: 2145af01b9cb ("firmware: arm_scmi: Add basic support for SCMI v3.2 pincontrol protocol")
Signed-off-by: Clément Le Goffic <clegoffic@baylibre.com>
---
 drivers/firmware/arm_scmi/pinctrl.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/firmware/arm_scmi/pinctrl.c b/drivers/firmware/arm_scmi/pinctrl.c
index 18761ffbf893..b071d31b5c33 100644
--- a/drivers/firmware/arm_scmi/pinctrl.c
+++ b/drivers/firmware/arm_scmi/pinctrl.c
@@ -265,6 +265,9 @@ static int iter_pinctrl_assoc_update_state(struct scmi_iterator_state *st,
 	st->num_returned = RETURNED(r->flags);
 	st->num_remaining = REMAINING(r->flags);
 
+	if (st->rx_len < sizeof(*r) + sizeof(r->array[0]) * st->num_returned)
+		return -EINVAL;
+
 	return 0;
 }
 

-- 
2.56.1


Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794567967;
	b=48Ctq9XDmj4PffPz86lnNdRFbWYPVuSUeIsrGJG6nbiDTZV5wfFOrAvfnxi6v4T5+Snl
	 FG8j3S64GkOLhNFxO8u6F9TS+qQnNToIqYn6qb/OBVf8HoKWuEz1OqKEAJL7oxY3huXGz
	 0ElyHUMZsr3SEj5GQjHjTHdZqbMviEKl+OZTCxPIOZpq41B3uffFbDmmnTXkL+hNSBnyZ
	 v+jVole+/oxK+5hgkpjSx7KA7rOUz4CQ5PK+S8zK53ihvJTHUJETmEN5hf7xQd1ybyGkK
	 UoCtP+4uBnzqEBZ7ru6MZI8JC3K4gKpIWOayZF+Oe5zcejwi8xtvpUFcEPGsLyUaKQg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794567967;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer;
	bh=XrW7G5FyBzep2SPN1JxS+delxFE3whqu9e2tanyOyU0=;
	b=ilfKNZVwdZaM8KF94GBbosJrgHtlwEqRqrIchZM9GNP0GS9e1Fd/tYN9R9W+y6F5av7H
	 bQp2ETOeF1ZVnpCCv2dkmsju/KWS7BuqgTPAfxZz8x7yXS3hKleJ+SnBxsKj/RolQ5pIF
	 rJQ7lB5AfiHJBw62Km4SYS6vMkuFFd4PUuDuJM8HVJceEYN2zc5C71ea7EfPQvm6NCREC
	 ZsTWpWFV1Z/IRSQeo+Og3WDfE+4ea721QEJmU8h2R5wDAU+Wor42NY5Wc5aN41Ksx4Bs8
	 82C2Vh6Joa5Xtzm6oz/ZeqxT/N2YdUC2qtXIT1xlTForMHYjDOH/J9FcDsBJJEnFfew==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=ZY2nfALx;
	arc=none smtp.remote-ip=209.85.128.41
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5423760A5BE2
	for <arm-scmi@vger.kernel.org>; Fri, 13 Nov 2026 11:06:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5423760A5BE2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=ZY2nfALx
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-49d05d51553so3801125e9.2
        for <arm-scmi@vger.kernel.org>; Fri, 13 Nov 2026 03:06:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1794567966; x=1795172766; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XrW7G5FyBzep2SPN1JxS+delxFE3whqu9e2tanyOyU0=;
        b=ZY2nfALxjoIqtLxDWq+N83+aq2JVAXblAHXir6aFsW98BH9XPWBy4Y1gAQeaeXhRDn
         bjsUR8vRn0SfmxaPk2IvfN8uy87kSzl8GWgcOEf/HmuCQYg2THqN/zT2+GgmA2avUFm5
         Kyr+SBAkEExe5JCwvLzpJzZdFccOn/KAJ/7wwTFO9k0z9jw1ioBZmn6ZpuRhrwNUliT3
         QAqB7Vh35a1o9xUF0akov74l+QM6ziVV1YMuX9PqJ9YEMV02bL2GnWZUhfkfsoAxk+2R
         dI4PBC9AT36vP00ka2prF757t865oXHIrhPyNv3wdRxZj28+o1vZa9bwCFBUZYp3pgny
         ytmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794567966; x=1795172766;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XrW7G5FyBzep2SPN1JxS+delxFE3whqu9e2tanyOyU0=;
        b=TtRg3zYoO01XfnX5N4m/AAWqteOQiMPvuRG40zWTvMldDlqyIWlVBHhRJAZ0MnXJGa
         Cx27r1zHZAQxzwrkITggeB66tedLUNQiK1+Is68GPYDqwDFn/XmLHyPnwE6fUelq2j9j
         iYs4nMK0Q1n4cmU6/bFAc7acKCcfDp+H3J09D+2t5KAiQ2eNwCairEvBb09WMp2mCamC
         jgWhCoP1frsmKnEeqtkBDYv5NCWhJNLiHSXtJthqJkxGus4B50p8NXkWSXH6+uvK1uim
         gVoLrrs79WtszcIVyEbHqGAtuvrrCE69twxKnOAE+Ky5Fhdz1k+8TrGocrnmF3ZnHU5E
         TFuA==
X-Gm-Message-State: APuU4Z9/m+NTGC3AP8NTdsJIkyIA98IvDt4ccGvHhvBHuUz5wdfq7G3x
	w9TL7k5b04aKBGLLIzZNWJtXQ6TepEhz/HU5o4o4Yjw8i9IiyQiEEjG/Dldwrgzq8L4=
X-Gm-Gg: AYBFou3fAB08iUflhjGTx3/QPSygKPKVWHxtDm7pKy8Kd2aM5fhTSYIt7S7kuGpXeIL
	t2eTsohXA5WPd5wLPn2ctS3Cd4ly15qOUmYtrjcN2/UQWn7AyX/8GGd2aJ67SJj88eCJpADdhUh
	IqzSSz2w7/65vYjcNSpcJaJ1isz435OL9S4OBxlz88pbgmNDGcTlLARiIMOvzG+12zs3e1r6rHY
	yrC7PioroFYGFrpkjumU+7hP4Ocnway1TV+M6D4GF0is6UqIyzezQWB9sQ+xz+C+NFZ98YR/LaF
	Nh7G1n0W2up4XvVXn7Tpy3dSWIwgPYzX8/4So25ccE2oTs4xFQCRwHeyHMKl98SR7w0GcYpcSeE
	XIwY0RrJwxFvK5x8lm7GUmNbVJM1j6q2DLLnyr+h8JTppyxrQlzlprQdcE91HST0/BrxZ9Id53n
	eto01It0fKowd2hScQRWLbZWya9vpmOhH89/YUaIAJFJESKBOe0BagOC3tlRxv8UrSnP7Sy6uv6
	RQeW62+5c00xIqWjGMAEYELnH6KfZU5buopawzkd+5KFmb3iNEtjGUQfNINtdR/nyMeqQSAMA0n
	vMRC+3OFG//WJ8wEleE8ZPWYxa3CMGke+LennIqqS97dthrpUmk=
X-Received: by 2002:a05:600c:3b16:b0:4a2:267:25b3 with SMTP id 5b1f17b1804b1-4bb55ab4493mr46428875e9.35.1794567965726;
        Fri, 13 Nov 2026 03:06:05 -0800 (PST)
Received: from localhost (128.33.83.79.rev.sfr.net. [79.83.33.128])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb4e2969e7sm128332475e9.10.2026.11.13.03.06.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 03:06:05 -0800 (PST)
From: =?utf-8?q?Cl=C3=A9ment_Le_Goffic?= <clegoffic@baylibre.com>
Date: Fri, 13 Nov 2026 12:05:31 +0100
Subject: [PATCH v2 05/11] firmware: arm_scmi: stop reading past
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
Message-Id: <20261113-clegoffic-pinctrl-scmi-gpio-v2-5-faccb4685d88@baylibre.com>
References: <20261113-clegoffic-pinctrl-scmi-gpio-v2-0-faccb4685d88@baylibre.com>
In-Reply-To: <20261113-clegoffic-pinctrl-scmi-gpio-v2-0-faccb4685d88@baylibre.com>
To: Sudeep Holla <sudeep.holla@kernel.org>, 
 Cristian Marussi <cristian.marussi@arm.com>, 
 Linus Walleij <linusw@kernel.org>, Peng Fan <peng.fan@nxp.com>, 
 Oleksii Moisieiev <oleksii_moisieiev@epam.com>, 
 Andy Shevchenko <andy@kernel.org>, Dhruva Gole <d-gole@ti.com>, 
 Bartosz Golaszewski <brgl@kernel.org>
Cc: arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 =?utf-8?q?Cl=C3=A9ment_Le_Goffic?= <clegoffic@baylibre.com>
X-Mailer: b4 0.17-dev

The transport cuts a reply larger than the receive buffer, but the iterator
still reads every identifier the reply announces. Return an error instead.

Fixes: 2145af01b9cb ("firmware: arm_scmi: Add basic support for SCMI v3.2 pincontrol protocol")
Signed-off-by: Clément Le Goffic <clegoffic@baylibre.com>
---
 drivers/firmware/arm/scmi/pinctrl.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/firmware/arm/scmi/pinctrl.c b/drivers/firmware/arm/scmi/pinctrl.c
index 18761ffbf893..b071d31b5c33 100644
--- a/drivers/firmware/arm/scmi/pinctrl.c
+++ b/drivers/firmware/arm/scmi/pinctrl.c
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


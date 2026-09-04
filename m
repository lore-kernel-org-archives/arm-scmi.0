Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com [209.85.215.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3AA3391505
	for <arm-scmi@vger.kernel.org>; Fri,  4 Sep 2026 10:37:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788518260; cv=none; b=lbwfGMCBpHml95hY2udoduCGyGU+xY/toKz/RRQVvEX2/E4/dDE4vpgycDizkxlVqwqpLEMfakXgbhNxmnOOE7LBZERu5Z5fuG88MKnPpGNft7sxtP78E9/zkg2UKrCsn0NlEsP9Bas7Ni9Svvqsr6X+LQVebTdlCE+szpszhrg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788518260; c=relaxed/simple;
	bh=eCdrtFx92LOvn3zRMQuQf4je2cLrF15KZh5gW8zQuIE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=SxUmWG072ReaNWZNS5LnnBLy+pIRA94AUzQeMcgTts7bR9Dabv64fPMXv0DwR2eIHtwM4NHk68Eu0n2lPaf2ljNcqorsnjQxdGxqt9huvsjL84I17F4N/MHMrSKUnSu9sBLH+fdf86eJPJe51OSn8ZV/d4kMNCXnj4Uv9au9qvg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SlYxKtj9; arc=none smtp.client-ip=209.85.215.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SlYxKtj9"
Received: by mail-pg1-f171.google.com with SMTP id 41be03b00d2f7-cc1c3d79b9bso754511a12.3
        for <arm-scmi@vger.kernel.org>; Fri, 04 Sep 2026 03:37:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788518258; x=1789123058; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=BZQsFKP4jMyXxxqQrP5SytFPA0wlD3KzFUOMPf1X4dk=;
        b=SlYxKtj94Rab66TfgjWSv/MPtQn2i05vzsOQ6uZOiyHN+oVk7DJH0QGXv/8+P5odLx
         9QPgl3nkGvCTPL9NqvB1MWPOHhAb1fAD7Ol5+fMSMSJjqXCwlasohULQmEpQLBh7G34O
         xFI/P69MFfAToAs4eHJc5eiL288W8Z06rreJyhNDP5uNDuPWrYHTGM+OSjApIFf8NT3Q
         crumnodRjguprXT46p4fh0iZcBAPGtZl/a47meiOdWzDzQ2VTtYuoW/Z80VliWf86N6s
         HuEzsCVl5h3nR3ILxxiMnCOC+mdBPKlsgYGRmYtiZrDu3cH0XkZQwH1auRMH2b01FluZ
         Zj0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788518258; x=1789123058;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BZQsFKP4jMyXxxqQrP5SytFPA0wlD3KzFUOMPf1X4dk=;
        b=HBce+lE+Wim2rueXQEfznwi50NwT0hp4TWcyW2fpNaskZnxs8IfzBqxdGPxcr8adVw
         2WLNSnQruNJjwQ+ViWnCDQAKXkmI2Z5F/g5h+0/CBbiqtdxndNDttaKhxsVVqm4aKfud
         7N3lmpyMfrkarMxZYEmiS1hW38PbTY+t3Mex5WgGdHat7sA+ygZEJWFtjxPU6ymLisVJ
         ikUvZmlx8iBR0YVKgO89+PkshQupOmkmQm6FJvpWqxf+i9199sURmu0DxoaAQoUO9jnm
         zHubtl06msJk0Zl7faykMB+T9dNUL6a6Kh3aH674MDlEA44rBSbebd7GH03bsxoo44JP
         /oxQ==
X-Forwarded-Encrypted: i=1; AKwUvBwx5j6rUR2sad9KYjyMqpO3NDwJxf63mXl4ulbyDK4JFf2UVi/70D7Ge5F4Mr2oPRKVCEKjuINpzg==@vger.kernel.org
X-Gm-Message-State: AFuF++ldmXG2ttGZO6M8GHmZbrpkeaC1vP/TX3uQqCL54Vg2tQfoc9YE
	owEb6sPnQW3D6MIRtmND9peWP/RQ20kywJb124ihP3aEEz0WP8Y4lvf0
X-Gm-Gg: AYBFou20D1kTGq+5+z652AtllOqpNKalgDfYQwwIrpdhTNwBNOGpm6udZUoG0N3LoHE
	z6Wprz5zElAZE+wuBV1IUo2IEVBO/RJU1qpNGk75M8qFR5uU2iJ0b+rLV6kzBLB6UHYB8nXNxWJ
	KFrRmzx6vKDFXCcXyoT4WvWKRizgck5YEhuDC32Hbdzi8IzhJgqnopxI89QDcGK0gsnerfuF5a3
	J0ba3fqfp1KUWlljdCikPP3D8iRgpImchJxiftwjWJYw5+r7/Fj00I0muPC6vxQwNwm/KQ/82rx
	nbRnDzr9WB9TWZ+yXyzgJcL2iz0s5FrJgAuxMJxBY0HXDoF269sL8rJxYaoFLXiLYyUKpTeEcwO
	4wT2gqx5ifEExiiCcqdvEM4f+i2jWQqlScNubw5qiOG4kAF998+veqMR6yK2vHB/IlP8/hBDRpO
	EREcZLvFtl+9D9A0nciBrxPPMEbsgxZ9kCbpUAMMN0m7u/aQr22797WKtFhjnZ5EzmNtRYIkBox
	uceYPvpg50zx5E=
X-Received: by 2002:a17:90b:17cd:b0:38f:aab1:5148 with SMTP id 98e67ed59e1d1-39b26272b4dmr6804930a91.13.1788518257765;
        Fri, 04 Sep 2026 03:37:37 -0700 (PDT)
Received: from volcano9f6e-hostos.amd.com ([165.204.217.251])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3339b9f68e4sm5981325eec.24.2026.09.04.03.37.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Sep 2026 03:37:37 -0700 (PDT)
From: Hemanth Selam <hemanth.selam@gmail.com>
To: Sudeep Holla <sudeep.holla@kernel.org>,
	Cristian Marussi <cristian.marussi@arm.com>
Cc: linux-kernel@vger.kernel.org,
	arm-scmi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH] firmware: arm_scmi: fix typo "upto" in comment
Date: Fri,  4 Sep 2026 16:07:31 +0530
Message-ID: <20260904103732.7320-1-hemanth.selam@gmail.com>
X-Mailer: git-send-email 2.48.1
Precedence: bulk
X-Mailing-List: arm-scmi@vger.kernel.org
List-Id: <arm-scmi.vger.kernel.org>
List-Subscribe: <mailto:arm-scmi+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:arm-scmi+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Correct "upto" to "up to", reported by scripts/checkpatch.pl using the
misspelling list in scripts/spelling.txt.  Only touches comments, no code
changes.

Assisted-by: Cursor:claude-opus-5
Signed-off-by: Hemanth Selam <hemanth.selam@gmail.com>
---
 drivers/firmware/arm_scmi/driver.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/firmware/arm_scmi/driver.c b/drivers/firmware/arm_scmi/driver.c
index ef29fd223287..fb45b8e6459d 100644
--- a/drivers/firmware/arm_scmi/driver.c
+++ b/drivers/firmware/arm_scmi/driver.c
@@ -477,7 +477,7 @@ void *scmi_notification_instance_data_get(const struct scmi_handle *handle)
  *  - exactly 'next_token' may be NOT available so pick xfer_id >= next_token
  *    using find_next_zero_bit() starting from candidate next_token bit
  *
- *  - all tokens ahead upto (MSG_TOKEN_ID_MASK - 1) are used in-flight but we
+ *  - all tokens ahead up to (MSG_TOKEN_ID_MASK - 1) are used in-flight but we
  *    are plenty of free tokens at start, so try a second pass using
  *    find_next_zero_bit() and starting from 0.
  *
-- 
2.48.1


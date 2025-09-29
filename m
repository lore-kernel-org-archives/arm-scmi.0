Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D62F93064BD
	for <arm-scmi@vger.kernel.org>; Mon, 29 Sep 2025 13:14:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759151669; cv=none; b=KN9uJrx05rAtU1tB5QIaSD0H8D6iULquiVa0/Ji8RR+XpYhi8C7UJpaH78yUWNvE1ClyD1c+cgY2y/RjfEQbyeoTdAWlrTM0lPnkdR+12Gmhcyr+1NfSYR6WIWyHSjaRbJNnPJmUqx4V9NUsjqfDEHNkqh1yE6YbphWQGgp2hw8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759151669; c=relaxed/simple;
	bh=Mv/b8aVCVxNhM1F+1VoETRpSIMA8dMlQJBW4BOZFGXQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=n4ARpSn9zUOAxQ0EJV8PqfPfhmEF/eA+kSki8rmK6FmOf+4hCaPzrEkBtPUQiHfXpIYqsApakRFf/4UsU7FA6c7oJxFBLX7vtmJWCh3fQX1GjxAnqldC6Ban8wxpxAhWXGttMjg3bFlpUhovXuTTqJTm6vPPxIinAdy/PkwMiYQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZCA6j1jJ; arc=none smtp.client-ip=209.85.167.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZCA6j1jJ"
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-57db15eeb11so5504615e87.2
        for <arm-scmi@vger.kernel.org>; Mon, 29 Sep 2025 06:14:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759151666; x=1759756466; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=A1TScXo9HlddRXxyVV537w+xJu4r/bR5+Sl4AGG4P1c=;
        b=ZCA6j1jJEElIyVAbgMXM3uSQnJIreXe1usmhSPoGi7D8yRJgbFLE/Yt+/6YgjuDi07
         dvMDC/V12e+aawDPrRngopE5+w5HcuCvbz+/NZ6f3vdlz6B4v8iESF9AIBtah/tNBOdx
         oIBAiVCgeKEf2IvrQ9zQwuW57A3231KnonJE1FSF57BL7usnZMJ6Jo32yN1xkbRzZxtb
         fYmi8frJsnyb5LfX5TmNXXhg5N6GCEm4cKwe65G4peQCCNcEf7KRegAhWazrDcKyk0z5
         0UX+62TjRLR6hau2ZyBqaUgtOsQNzWpLJelw5axw8yApRAWikxoD4Ns5ou/YFaUG/wL/
         +4xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759151666; x=1759756466;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=A1TScXo9HlddRXxyVV537w+xJu4r/bR5+Sl4AGG4P1c=;
        b=WIjt0y78vSR2tHeyjZI/n6iiD0aRtJ9fFSj3AjDNhI6QGF3/3vWJTtoS2icSg5igtA
         eiRepBOjwhnpiPV4qObZdOgzHo/FnljoRlTcjTdeZ7AlBQkDdFTWzxLZnWvaWj+iW/qT
         rnnbYsolFUwbsgn7pZwBtphUSNP5/AyjivptmLeet9EdteIkg1nbv1WqsxrMkm+g4ePB
         nGbgCiAwo5WkmK6KDHyvEU+NZ5+Vph7bbb2oc4Ufi/iahGkniN3U+7wcyNkrs2fds4VV
         OQVUYuqeDIQNMGuodriT7q+2dZRmhIdKRw0sSOir4hV5BjIO+dyuUEgZrDO7DKmVmXTX
         upTQ==
X-Forwarded-Encrypted: i=1; AJvYcCXrLlDpevabuh4SQXA3rfNkNyQ5H69BE1URzk+d89yawbMGagI9lTHAkHqMNxAI/qK/B42H4MOeTw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yzq5FGboGXOK2+tQlYK+KQW2zFsEcLEkqGhS4R7L7wqqO95lXJM
	wpkR3to6Cof8R/hTYTcWdvOLUWpNbsxtPxLC+F08QYwcLCdgVGPNg+ii
X-Gm-Gg: ASbGncvmcYSIocTVb8iLfO4Vj2VakGgN/neXmEOq9JFyJFzNzGajjHuAKkhtJ5ezOUO
	PfS9ydkG+4OBkOWq4jXlZ/ZevX+8kQLTsg2m857hqIx1bmMK4PDV55WdYP1nl9WHoRM4229BKOi
	X68QRrbtCEt3VV9zhs13usPwomukW2e64NjPdFUyEtDCtFfu+J5aGnrxxwCi4L/iYYdMdKl5jFQ
	3ZGfp4XXcVwOS0vf0vFSBhnVzkTY3kj84kUbVY/tgjkuGNr+lpEAycWlLwAKsb99CATkzxtVP79
	mPhiu1wxwnHlgsJfQBVvx++x5OQjHFqIeozVsBvBkPgbWmS6GWDT/QvOGCmJghqyjM6uffwqSkC
	Xot16qX9tefe1qf3PUjnHr/VgtrE9WzZ4I5PqRHak
X-Google-Smtp-Source: AGHT+IFdZvltpHwZV1hUFDUAn+X1LBVfg1iTgq2zM08qx+yjkvQ6KOYUEgmP09Fpq9EwiTOtStUDCw==
X-Received: by 2002:a05:6512:224f:b0:57b:7ca2:f02e with SMTP id 2adb3069b0e04-582d092db20mr5490234e87.12.1759151665722;
        Mon, 29 Sep 2025 06:14:25 -0700 (PDT)
Received: from NB-6746.corp.yadro.com ([188.243.183.84])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-588767b72e3sm461758e87.41.2025.09.29.06.14.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Sep 2025 06:14:25 -0700 (PDT)
From: Artem Shimko <artyom.shimko@gmail.com>
X-Google-Original-From: Artem Shimko <a.shimko.dev@gmail.com>
To: Sudeep Holla <sudeep.holla@arm.com>,
	Cristian Marussi <cristian.marussi@arm.com>
Cc: a.shimko.dev@gmail.com,
	arm-scmi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/1] rivers: scmi: Add completion timeout handling for raw mode transfers
Date: Mon, 29 Sep 2025 16:14:21 +0300
Message-ID: <20250929131422.525315-2-a.shimko.dev@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250929131422.525315-1-a.shimko.dev@gmail.com>
References: <20250929131422.525315-1-a.shimko.dev@gmail.com>
Precedence: bulk
X-Mailing-List: arm-scmi@vger.kernel.org
List-Id: <arm-scmi.vger.kernel.org>
List-Subscribe: <mailto:arm-scmi+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:arm-scmi+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Fix race conditions in SCMI raw mode implementation by adding proper
completion timeout handling. Multiple tests in the SCMI test suite
were failing due to early clearing of SCMI_XFER_FLAG_IS_RAW flag in
scmi_xfer_raw_put() function.

The root cause:
Tests were failing on poll() system calls with this condition:
    if (!raw || (idx == SCMI_RAW_REPLY_QUEUE && !SCMI_XFER_IS_RAW(xfer)))
        return;

The SCMI_XFER_FLAG_IS_RAW flag was being cleared prematurely before
the transfer completion was properly acknowledged, causing the poll
to return on timeout and tests to fail.

Сhanges implemented:
1. Add completion wait with timeout in  scmi_xfer_raw_worker()
2. Signal completion in scmi_raw_message_report()

This ensures:
- Proper synchronization between transfer completion and flag clearing
- Prevention of indefinite blocking with timeout safety mechanism
- Stable test execution by maintaining correct flag states

arm scmi tests: https://gitlab.arm.com/tests/scmi-tests/-/releases

Signed-off-by: Artem Shimko <a.shimko.dev@gmail.com>
---
 drivers/firmware/arm_scmi/raw_mode.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/firmware/arm_scmi/raw_mode.c b/drivers/firmware/arm_scmi/raw_mode.c
index 73db5492ab44..fb83beb42e7b 100644
--- a/drivers/firmware/arm_scmi/raw_mode.c
+++ b/drivers/firmware/arm_scmi/raw_mode.c
@@ -468,6 +468,12 @@ static void scmi_xfer_raw_worker(struct work_struct *work)
 
 		ret = scmi_xfer_raw_wait_for_message_response(cinfo, xfer,
 							      timeout_ms);
+		if (!ret)
+			if (!wait_for_completion_timeout(&xfer->done, timeout_ms))
+				dev_err(dev,
+					"timed out in RAW resp - HDR:%08X\n",
+					pack_scmi_header(&xfer->hdr));
+
 		if (!ret && xfer->hdr.status)
 			ret = scmi_to_linux_errno(xfer->hdr.status);
 
@@ -1381,6 +1387,8 @@ void scmi_raw_message_report(void *r, struct scmi_xfer *xfer,
 	if (!raw || (idx == SCMI_RAW_REPLY_QUEUE && !SCMI_XFER_IS_RAW(xfer)))
 		return;
 
+	complete(&xfer->done);
+
 	dev = raw->handle->dev;
 	q = scmi_raw_queue_select(raw, idx,
 				  SCMI_XFER_IS_CHAN_SET(xfer) ? chan_id : 0);
-- 
2.43.0


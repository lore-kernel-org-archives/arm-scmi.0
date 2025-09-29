Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B0953093BD
	for <arm-scmi@vger.kernel.org>; Mon, 29 Sep 2025 14:29:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759156154; cv=none; b=Q4lEXxo1JR+xYog1zFpib0hO9/BSKg07GZltfOrgDlsxVOPtF9b78vctgNCb0M8wurIJgRbdPhoA1PXHwSalnNfIlMukE4mJg8NzaZO4+Q5cxSgfB+jc1yAm9Km3rmtetMVuEd9GwP239SrZv7tCyj5hSwHIhRqYprJRk8aReec=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759156154; c=relaxed/simple;
	bh=8MLM0Z/ejezW8J70oUiKcw5Ly68QkQHTMKH6VfLq+gY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=N8gytm01IaU8/kzk0Ko1K1ege0Y8700XgwqhZ7k3ab3xguFdobx27cgh5k92QcSHZf9trnUHmZWXxCycF22b7WUDey1K+Mkk9ofrr3v2hZ7Ahfyzxxv1BJTFD4eE3prjgdbm9Dc7Su8LTu/TNK2Vh42vs2G4U/JItbSHa8Q002I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KrU4WGCQ; arc=none smtp.client-ip=209.85.167.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KrU4WGCQ"
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-5821dec0408so3353485e87.1
        for <arm-scmi@vger.kernel.org>; Mon, 29 Sep 2025 07:29:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759156150; x=1759760950; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=PuYIl+8uGgDqehkynFO/d1q3OrzgUTaphIdFn/AeuA0=;
        b=KrU4WGCQYWDT8fZ2Jip0Bp5Hj2YjYvv98oRfz40+jYqjeuK6U8oBH2ugHNUtXC63Y6
         bokF3OFfTIU0WUJZmkBlQxmToCZgHF0HNJnAVIbYN0VaQ8jaeB3nxHbIZbJcnju+Dp0B
         yM0GBbXf1NoZi73hu68TXd0EQ85cK7LlyBPyNWYqYT2f4Dvn4H2ML06emfviFJnwwNs9
         bbpD5fgeVTdvV6twTa4JbTeWFaBJy8udNvzVVVBbE5T2gxeEQIwDOd+7jBzKhgjln2P1
         AkgVP8mcSJJqWo/XaByPq+O0UqT6gaqVn6mp8zl9SAVuPsyI/C5ulWBx4mpxuW7lvDRZ
         V9Gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759156150; x=1759760950;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PuYIl+8uGgDqehkynFO/d1q3OrzgUTaphIdFn/AeuA0=;
        b=eREFfET7RgMpUbLDxEfYvsUZhLxrpeK+JjzW5u2J8OW8CXS1UDOXBOus3sSiXCOAjS
         EaX2UE5rZIf1ayf9sc1UPS7pJi92peNus1jAYeBaShIuJLn0MX55rAM/REffHbxgohY0
         J0PgAMN+evQdEip+hv3ze7wrVAArfJ/OHaQSmrH51/9/7YLAU7z85Wii69QfaSHyeqsU
         GxT3QRYb8HcHXNla06w+IB8umZg/JkaVZH7goMjA2PaPzc8J5MfxPLzSeqbiiknPuXhg
         cU3WmZirfkD9Dusw+/nEwRyBJd9Ok/o1bYvyTSatvacdhje7iZYAMPSkal2jtUqA0YAs
         OFFg==
X-Forwarded-Encrypted: i=1; AJvYcCWgoKV06M2U8UkWFGm9iqNT2VAcrcVmmnQ3dFeGfcml7EWGVGw9ii+p+rac15/iXSqs525Ko//wcg==@vger.kernel.org
X-Gm-Message-State: AOJu0YzoHMQSS9KUKrLlYWEl27qzX7zPmypQuSuDXWWt2Wu2fJDz3us+
	FhaFAbwTpqokOPrGyKXEIWmJzQ7TwTAkZxryJ3tAWgrkmsLsgJFTB2ET
X-Gm-Gg: ASbGncvcJZVUhGRekfOz6q2FsBdZVPCwhlPpUgNQV73vCO+t4kkyERP533cCeOehWwU
	LUYeTfd+i6ykYxkWyiFB+BouQyOLdqE4tQe5CBepnth7I4rcbA5lG2u7p/to+DNGYM4YmqPI9AT
	6hs618GjNXY+Sz0UNg+svD7SFbC7pIaWNrnUGAo+Y8D7tjz9VFhnvKYnrs6jDDW0wQLFQDUDixs
	xW+L+rX3wDHho1uk2PDXrOkwF7t+Zp6gAJmmAUTUDgTrtn8BPnptJxUbiaFsLeZe9J9GfRJXdcX
	ICLEhYz6ezEtn6pg8ksb6vdTPgH7BqY4JlBrvcU2qCNroGkCC7m2G8SdHgmOCmPnj6M7oYeDPey
	006hpgAal7EKJH1gRIKGm/RyGhG4FIEKTV7DTFSfA
X-Google-Smtp-Source: AGHT+IHkQVN+odoYfuINw3uwnog4DYG5PmzCIdc5SPqPqj2wtSm+xS9JNe3lu3XIGJdMoU+kXWnvlw==
X-Received: by 2002:a05:6512:3d08:b0:574:7258:26c0 with SMTP id 2adb3069b0e04-582d0e15ed7mr6023408e87.17.1759156150185;
        Mon, 29 Sep 2025 07:29:10 -0700 (PDT)
Received: from NB-6746.corp.yadro.com ([188.243.183.84])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-586b0c1fc85sm1525737e87.64.2025.09.29.07.29.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Sep 2025 07:29:09 -0700 (PDT)
From: Artem Shimko <artyom.shimko@gmail.com>
X-Google-Original-From: Artem Shimko <a.shimko.dev@gmail.com>
To: Sudeep Holla <sudeep.holla@arm.com>,
	Cristian Marussi <cristian.marussi@arm.com>
Cc: a.shimko.dev@gmail.com,
	arm-scmi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] drivers: scmi: Add completion timeout handling for raw mode transfers
Date: Mon, 29 Sep 2025 17:28:55 +0300
Message-ID: <20250929142856.540590-1-a.shimko.dev@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: arm-scmi@vger.kernel.org
List-Id: <arm-scmi.vger.kernel.org>
List-Subscribe: <mailto:arm-scmi+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:arm-scmi+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Fix race conditions in SCMI raw mode implementation by adding proper
completion timeout handling. Multiple tests[1] in the SCMI test suite
were failing due to early clearing of SCMI_XFER_FLAG_IS_RAW flag in
scmi_xfer_raw_put() function.

TRANS=raw
PROTOCOLS=base,clock,power_domain,performance,system_power,sensor,
voltage,reset,powercap,pin_control VERBOSE=5

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

TRANS=raw
PROTOCOLS=base,clock,power_domain,performance,system_power,sensor,
voltage,reset,powercap,pin_control VERBOSE=5

An example of a random test failure:
 817: Voltage get ext name for invalid domain
     [Check 1] Get extended name for invalid domain
       MSG HDR        : 0x04585c09
       NUM PARAM      : 1
       PARAMETER[00]  : 0x0000000c
       CHECK STATUS   : PASSED [SCMI_NOT_FOUND_ERR]
       CHECK HEADER   : PASSED [0x04585c09]
       RETURN COUNT   : 0
       NUM DOMAINS    : 11
       VOLTAGE DOMAIN : 0
     [Check 2] Get extended name for unsupp. domain
       MSG HDR        : 0x045c5c09
       NUM PARAM      : 1
       PARAMETER[00]  : 0x00000000
       CHECK STATUS   : FAILED
           EXPECTED   : SCMI_NOT_FOUND_ERR
           RECEIVED   : SCMI_GENERIC_ERROR  : NON CONFORMANT 

After making these changes, the tests stopped failing.

mount -t debugfs none /sys/kernel/debug 
scmi_test_agent
[  127.865032] arm-scmi arm-scmi.1.auto: Resetting SCMI Raw stack.
[  128.360503] arm-scmi arm-scmi.1.auto: Using Base channel for protocol 0x12
tail -n 6 arm_scmi_test_log.txt
****************************************************
  TOTAL TESTS: 167    PASSED: 120    FAILED: 0    SKIPPED: 47
****************************************************

Link [1] https://gitlab.arm.com/tests/scmi-tests/-/releases

Signed-off-by: Artem Shimko <a.shimko.dev@gmail.com>
---
Hello maintainers and reviewers,

This patch addresses a race condition in the SCMI raw mode implementation
that was causing multiple test failures in the SCMI test suite.

The issue manifested as poll() timeouts in tests when using raw mode
transfers. The root cause was premature completion signaling and
SCMI_XFER_FLAG_IS_RAW flag clearing before transfers were fully
acknowledged.

Thank you for your consideration.

Best regards,
Artem Shimko

 drivers/firmware/arm_scmi/raw_mode.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/drivers/firmware/arm_scmi/raw_mode.c b/drivers/firmware/arm_scmi/raw_mode.c
index 73db5492ab44..130d45192beb 100644
--- a/drivers/firmware/arm_scmi/raw_mode.c
+++ b/drivers/firmware/arm_scmi/raw_mode.c
@@ -468,6 +468,14 @@ static void scmi_xfer_raw_worker(struct work_struct *work)
 
 		ret = scmi_xfer_raw_wait_for_message_response(cinfo, xfer,
 							      timeout_ms);
+		if (!ret)
+			if (!wait_for_completion_timeout(&xfer->done, timeout_ms)) {
+				dev_err(dev,
+					"timed out in RAW resp - HDR:%08X\n",
+					pack_scmi_header(&xfer->hdr));
+				ret = -ETIMEDOUT;
+			}
+
 		if (!ret && xfer->hdr.status)
 			ret = scmi_to_linux_errno(xfer->hdr.status);
 
@@ -1381,6 +1389,8 @@ void scmi_raw_message_report(void *r, struct scmi_xfer *xfer,
 	if (!raw || (idx == SCMI_RAW_REPLY_QUEUE && !SCMI_XFER_IS_RAW(xfer)))
 		return;
 
+	complete(&xfer->done);
+
 	dev = raw->handle->dev;
 	q = scmi_raw_queue_select(raw, idx,
 				  SCMI_XFER_IS_CHAN_SET(xfer) ? chan_id : 0);
-- 
2.43.0


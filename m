Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCFB01CD15
	for <arm-scmi@vger.kernel.org>; Fri,  3 Oct 2025 19:22:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759519361; cv=none; b=oFAbVOwj2fi9KBzgKxAPQDQlJ9azlYzrZkpnymBVweIuhSxvUG3ltLCYjcpeDbUrbdTG6ydszmdwFU6c4Vs6yKJAYr66MuhcIBlrtuK6cSXVEu4tK/Ba+WR755e1ObP6X0OI2fnD1Q00wjlaTtJiP8X9PxyWKhhawU7T3zeoEQc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759519361; c=relaxed/simple;
	bh=h8dNCnFNX90PLzxiGBBVviNotAJKX5gzk0vLf0A9j+c=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=amItccyfZLZGnsMLul4MujDTrZhtQVNI8UeMkZdH8/dVYYVxxJOCfVLBZioS36je55XeEWgT/OxajR93Hap3tdvZnPgpLUO8qTsz9UI2fNCOq7Q+8NDI+UdkwMkgrQpx0YS91/hMRqcqMPvFBFaKqOgl2m0JwpNsoGuTvtbf+rQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TdKHFat0; arc=none smtp.client-ip=209.85.167.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TdKHFat0"
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-57b8fc6097fso3659145e87.1
        for <arm-scmi@vger.kernel.org>; Fri, 03 Oct 2025 12:22:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759519358; x=1760124158; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SHEdC4q5HOXKpIiXdASgYuczbCo+pyIe2coh3mL3YAQ=;
        b=TdKHFat0xVHdXhQB+CFc3b254Bpgnb4PFdij4vDxdT/NWYLmcE9hepHBJ2dKTjHZFx
         HucAV6LNkOL9z9biUe1F331zUW2TKnSn3DwIed4wI68qibEQDdWhuqxgzwXeb4x94QHT
         jkg5lTAlxhCctxSZ5i39DODzfBUQq2ojvd9Uzi/2A3udXuDHOXh6f8UY0U4mCiFaAd0H
         lAGQWQpaRnzS3OryoHhN7tF0m8HLjeoUj049PjRF/DYm1+UCMHIoNFTP/lyAxiDXGyy5
         XiOsz6sElkOvBEehdVI49KkKKAtCVAAt8i7aklEEGAaswJDp5nPXWz4cs1dy+O8ScbaS
         6ywA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759519358; x=1760124158;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SHEdC4q5HOXKpIiXdASgYuczbCo+pyIe2coh3mL3YAQ=;
        b=u1I/P2PTeP2SovA02AIf+MPNS+Ja8/L6wW43o0szuc7WplEktQjr5lQYSZo2lWu50B
         q0w6G5HL2ZZLh0hdYmYo3hu+t5TG+j2vfTDYflrfdyhpIA0CFvqUzw7noUmrTWgC/PYN
         aOteFN1xcsa45FE1cpdtwyQbfvhLD9EnsZu9lAbHxeS9N2LLj+/EyR4nWeJm9aKTbuOE
         7UDgB8fcKaXdvgBdaa78lxC7NZTz6k4VLHowCaBtLSvyN3JLjt1TCDY9UHQqFbz8FMv4
         2VxPp0IQhqSW6UOPQTe7n3d/fu6OTk8PArWEUJY0FGUSXE/AnpJahovyH6laBZ0z+jFb
         I9Ng==
X-Forwarded-Encrypted: i=1; AJvYcCVAJb2hfbRTjphMyr8FJLSXchq6OmWkaqUQWddqX+1SqMzfSuDWvKPPhDRJoHIaqXT5lVmwikAtAQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Ywuy8VTAiqkfy7+fphkOfessjnBb0nU7FbNfv1uW+PTetkNi3qM
	KJ0wJYBGaRi1N7MP8SyaIXjNcZWQ50eAhHPNsLOinsbB8FU+JDt5b2n+
X-Gm-Gg: ASbGncuzKBNEXrlOnCgXC5VcMrE2MVZ3iQvj1KaXeV6FHXybavUjATH/Co5TPjhebk+
	WPAOWCVEV3FOBaumJ2DT9SGwYoQBh8Gn2CIv8T3Wosv/sGQQG9GrWpSUHQzs6luyjvf/wC1DT0Y
	Hw+LUuPtAJT+LAqClCAMan7OKgDzJkWruUcXy2dHCuMO/6hSoezvPmLWe4VzTnJhv1etjLhp0Jp
	KrMAqr9wqYjVfxGqHjQzi3WGbS5NN6FS+cN9W4m1nVXt22AL7Hrb5E+8Mf/3enso+6xc60LlpWH
	xd7c2Wopk89D9fNXgGlEcz7HwJuDJXicxiG/Oyr8ePKsxR+a4fSlzz86J/feM/7yGUEqXDJzage
	wvp0KHE9SU17uwcpQ5BZg14JIEcg+p2Xsn3Psy6NGHfOo6Q==
X-Google-Smtp-Source: AGHT+IEfPGKgh3f6VXqkifycv9gBhD43sy5btZBZgWTDY0sG+tyqEtREfAfN3cAtFrAeYl/L3dZOXA==
X-Received: by 2002:a05:6512:3a92:b0:586:2e4b:22c5 with SMTP id 2adb3069b0e04-58cbbfc331dmr1195941e87.56.1759519357553;
        Fri, 03 Oct 2025 12:22:37 -0700 (PDT)
Received: from NB-6746.. ([188.243.183.84])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-58b01124438sm2097546e87.4.2025.10.03.12.22.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Oct 2025 12:22:37 -0700 (PDT)
From: Artem Shimko <a.shimko.dev@gmail.com>
To: Sudeep Holla <sudeep.holla@arm.com>,
	Cristian Marussi <cristian.marussi@arm.com>
Cc: a.shimko.dev@gmail.com,
	arm-scmi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2] drivers: scmi: Add completion timeout handling for raw mode transfers
Date: Fri,  3 Oct 2025 22:22:33 +0300
Message-ID: <20251003192233.1618447-1-a.shimko.dev@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250929142856.540590-1-a.shimko.dev@gmail.com>
References: <20250929142856.540590-1-a.shimko.dev@gmail.com>
Precedence: bulk
X-Mailing-List: arm-scmi@vger.kernel.org
List-Id: <arm-scmi.vger.kernel.org>
List-Subscribe: <mailto:arm-scmi+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:arm-scmi+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix race conditions in SCMI raw mode implementation by adding proper
completion timeout handling. Multiple tests in the SCMI test suite
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

Fix ensures:
- Proper synchronization between transfer completion and flag clearing
- Stable test execution by maintaining correct flag states

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

$mount -t debugfs none /sys/kernel/debug
$scmi_test_agent
[  127.865032] arm-scmi arm-scmi.1.auto: Resetting SCMI Raw stack.
[  128.360503] arm-scmi arm-scmi.1.auto: Using Base channel for protocol 0x12
$tail -n 6 arm_scmi_test_log.txt
****************************************************
  TOTAL TESTS: 167    PASSED: 120    FAILED: 0    SKIPPED: 47
****************************************************

An ftrace log with of passed test:
0)               |  scmi_rx_callback()
0)               |    scmi_raw_message_report()
7)               |    scmi_xfer_raw_wait_for_message_response()
7) + 22.000 us   |      scmi_wait_for_reply();
0)               |        /* scmi_raw_message_report*/
7)               |    scmi_xfer_raw_put()

An ftrace log with of failed test:
0)               |  scmi_rx_callback() {
0)               |    scmi_raw_message_report()
5)               |    scmi_xfer_raw_wait_for_message_response()
5) ! 383.000 us  |      scmi_wait_for_reply();
5)               |    scmi_xfer_raw_put() {
0)               |  /* scmi_raw_message_report*/

Link [1] https://gitlab.arm.com/tests/scmi-tests/-/releases

Fixes: 3095a3e25d8f7 (firmware: arm_scmi: Add xfer helpers to provide raw access)
Suggested-by: Cristian Marussi <cristian.marussi@arm.com>
Signed-off-by: Artem Shimko <a.shimko.dev@gmail.com>
---
Hi Cristian,

Good point about CONFIG_ARM_SCMI_RAW_MODE_SUPPORT_COEX. 

I can confirm this setting doesn't impact the test failures in my environment.
The issue reproduces consistently with COEX both enabled and disabled.

Thank you!

Best regards,
Artem Shimko

ChangeLog:
  v1:
    * https://lore.kernel.org/arm-scmi/20250929142856.540590-1-a.shimko.dev@gmail.com/
  v2:
    * Use simpler approach suggested by Cristian Marussi
    * Clear all xfer flags in __scmi_xfer_put() under spinlock protection  
    * Add Fixes tag as requested
    * Drop completion timeout mechanism from v1

 drivers/firmware/arm_scmi/driver.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/firmware/arm_scmi/driver.c b/drivers/firmware/arm_scmi/driver.c
index bd56a877fdfc..0976bfdbb44b 100644
--- a/drivers/firmware/arm_scmi/driver.c
+++ b/drivers/firmware/arm_scmi/driver.c
@@ -821,6 +821,7 @@ __scmi_xfer_put(struct scmi_xfers_info *minfo, struct scmi_xfer *xfer)
 
 			scmi_dec_count(info->dbg->counters, XFERS_INFLIGHT);
 		}
+		xfer->flags = 0;
 		hlist_add_head(&xfer->node, &minfo->free_xfers);
 	}
 	spin_unlock_irqrestore(&minfo->xfer_lock, flags);
@@ -839,8 +840,6 @@ void scmi_xfer_raw_put(const struct scmi_handle *handle, struct scmi_xfer *xfer)
 {
 	struct scmi_info *info = handle_to_scmi_info(handle);
 
-	xfer->flags &= ~SCMI_XFER_FLAG_IS_RAW;
-	xfer->flags &= ~SCMI_XFER_FLAG_CHAN_SET;
 	return __scmi_xfer_put(&info->tx_minfo, xfer);
 }
 
-- 
2.43.0


Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22B1B3C1979;
	Mon, 23 Mar 2026 16:56:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774284980; cv=none; b=ch6/vUhYzigrAEiwNF9AtQhPqCkmFpypbQLfGqw7/7DnVjIAT35BZX7u3bs6cmgLQbWVQCBpIEDP5rvMP9cE45nz7RKi8Fx3zUW+Ij1IEplREk4UnrTdvais3oT6s+5idrScnEujGDmgdJRnm4ZxDJFnH97pGiHK9yd0p8bRnIo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774284980; c=relaxed/simple;
	bh=XCEil2lJ9uatdL21iFJ//WE04pfJLH2pZc1geIn4+gs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=NkrsBMkzyxIyY5fc3nrtba0LoZyekFvPAzoBMtrlGcFtAPcm+JbOnyum2pPHIhIa9Z8nWPx0Ex0gX0zeqLj91IOSlKxYPRJi0ZmeO5cZ1j53P6Lhydf8HQ0onvm0P63RGWtBy276F9kQNNxuhOAL7QV1B6ljgxeEooRsPhh8Eig=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 18083C2BC9E;
	Mon, 23 Mar 2026 16:56:17 +0000 (UTC)
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Sudeep Holla <sudeep.holla@kernel.org>,
	Cristian Marussi <cristian.marussi@arm.com>,
	Marek Vasut <marek.vasut+renesas@mailbox.org>
Cc: arm-scmi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-renesas-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 1/3] firmware: arm_scmi: Fix OOB in scmi_clock_describe_rates_get_lazy()
Date: Mon, 23 Mar 2026 17:56:10 +0100
Message-ID: <9928133be47a09af0c568bcee0f9a987381a1c15.1774283748.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1774283748.git.geert+renesas@glider.be>
References: <cover.1774283748.git.geert+renesas@glider.be>
Precedence: bulk
X-Mailing-List: arm-scmi@vger.kernel.org
List-Id: <arm-scmi.vger.kernel.org>
List-Subscribe: <mailto:arm-scmi+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:arm-scmi+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Lazy discovery of discrete rates works as follows:
  A. Grab the first three rates,
  B. Grab the last rate, if there are more than three rates.

It is up to the SCMI provider implementation to decide how many rates
are returned in response to a single CLOCK_DESCRIBE_RATES command.  Each
rate received is stored in the scmi_clock_rates.rates[] array, and
.num_rates is updated accordingly.

When more than 3 rates have been received after step A, the last rate
may have been received already, and stored in scmi_clock_rates.rates[]
(which has space for scmi_clock_desc.tot_rates entries).  Hence grabbing
the last rate again will store it a second time, beyond the end of the
array.

Fix this by only grabbing the last rate when we don't already have it.

Fixes: a78da552c6f3bff5 ("firmware: arm_scmi: Use bound iterators to minimize discovered rates")
Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
This bug caused random "kernel BUG at drivers/base/devres.c:135!"
crashes during boot on R-Car X5H.

Example for a clock with 8 rates, which are all returned in response to
a single CLOCK_DESCRIBE_RATES command:

    scmi_clock_describe_rates_get_lazy: Grabbing rates 0..2
    iter_clk_describe_update_state: Returned 8 remaining 0
    iter_clk_describe_update_state: Allocating 8 rates
    iter_clk_describe_process_response: rates[0] = 33333333
    iter_clk_describe_process_response: rates[1] = 66666666
    iter_clk_describe_process_response: rates[2] = 133333333
    iter_clk_describe_process_response: rates[3] = 266666666
    iter_clk_describe_process_response: rates[4] = 355555555
    iter_clk_describe_process_response: rates[5] = 533333333
    iter_clk_describe_process_response: rates[6] = 711111111
    iter_clk_describe_process_response: rates[7] = 1066666666
                                                   ^^^^^^^^^^
    scmi_clock_describe_rates_get_lazy: Grabbing rates 7..7
    iter_clk_describe_update_state: Returned 1 remaining 0
    iter_clk_describe_process_response: rates[8] = 1066666666
                                              ^    ^^^^^^^^^^
Out of bounds access! ------------------------+    |
Same value as [7] ---------------------------------+
 drivers/firmware/arm_scmi/clock.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/firmware/arm_scmi/clock.c b/drivers/firmware/arm_scmi/clock.c
index 0e7e341171aad829..623dbc2f1e09303d 100644
--- a/drivers/firmware/arm_scmi/clock.c
+++ b/drivers/firmware/arm_scmi/clock.c
@@ -593,8 +593,11 @@ scmi_clock_describe_rates_get_lazy(const struct scmi_protocol_handle *ph,
 	if (ret)
 		goto out;
 
-	/* If discrete grab the last value, which should be the max */
-	if (clkd->r.rate_discrete && clkd->tot_rates > 3) {
+	/*
+	 * If discrete and we don't already have it, grab the last value, which
+	 * should be the max
+	 */
+	if (clkd->r.rate_discrete && clkd->tot_rates > clkd->r.num_rates) {
 		first = clkd->tot_rates - 1;
 		last = clkd->tot_rates - 1;
 		ret = ph->hops->iter_response_run_bound(iter, &first, &last);
-- 
2.43.0


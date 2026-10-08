Received: from mail-dy1-f176.google.com (mail-dy1-f176.google.com [74.125.82.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 878B93C9EE8
	for <arm-scmi@vger.kernel.org>; Thu,  8 Oct 2026 19:16:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791486996; cv=none; b=CWx8X8bc7LreJznQndPDFptpzSk0WoaAJDR+zD92TmtO64HWfa/PVtblWhqdVoV9PjQTx4c+WUHoNdPKmgI5YTI2DsGUYqtSGfF03eYaVlqKc+HFQjodGx6iagMk3Dl95fKDB1jSzv++TIvLqbTxlI/wGBhpOlaehFQ2uQ6oJek=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791486996; c=relaxed/simple;
	bh=+Oha/BDktDBvSM0qKOsrcxoAtAeACCyuZWbGHvWchTA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=RbrL7sowdi/hnCypjwgLcFenCtOWBLHbcfVVBG2W43rFRpg1F94L1oAmJngCylX9qM7a3FxfiIqQQUMB9wwaJKTTowV4s2EAd3RuKj2iqIhpDtguG4WXpBpmhaJHN6tCm+6JZjDdTsqJ+fQ8iZhvSlXqbyAx58JIQKsM/VR4t3E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=trailofbits.com; spf=pass smtp.mailfrom=trailofbits.com; dkim=pass (2048-bit key) header.d=trailofbits.com header.i=@trailofbits.com header.b=Mc2Atbnb; arc=none smtp.client-ip=74.125.82.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=trailofbits.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=trailofbits.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=trailofbits.com header.i=@trailofbits.com header.b="Mc2Atbnb"
Received: by mail-dy1-f176.google.com with SMTP id 5a478bee46e88-34bb8b31647so8756706eec.0
        for <arm-scmi@vger.kernel.org>; Thu, 08 Oct 2026 12:16:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=trailofbits.com; s=google; t=1791486995; x=1792091795; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/gKBBoh6HIExyZfgEBELC4DDNErGf2q0ik6xe/8PDlI=;
        b=Mc2Atbnb0fJjJ5xSmjpqTK0q8pSBlWFH9lnGG/Q8u1WZOUAUXbgVcayVdOmEnY5OII
         IAM7GHq0yawIIhW2ysyPMcuOsJJAtf1uX5pdBE0cQ6jJUU57Ln6NaVsq88pFyrz2Jrnv
         XRMvaoqexSheSdMsjw7rSDJRH6Dmeans322HDim4lem/9DqPokwwS3FwmahGihpxqmv3
         g5vXP9Qm5QbsO2jd6Ecve80GnERSCMgfbYOKdz+JDEmt14ez3cZa7W/Cuk6f5FUbYT3t
         K0DaUrnBFUI+eOOCz01MxFkP1gZOtY4TuwxwU1wK9x/mM6H/fDvCIwuCZ1cj6/FiMuhD
         F44g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791486995; x=1792091795;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=/gKBBoh6HIExyZfgEBELC4DDNErGf2q0ik6xe/8PDlI=;
        b=xM5Y9bRhHPutRTEnmpngvBlbullCURa92ilLI60SmBy9vzhTKJGJZ9a8LUaLjWM95A
         aJpgeuiBScpBXQiPtzxDdukNvEmIltn+qC71wn9zweS7m8XB3Xef/qR6TCtm34MtRqMZ
         hh276z5Gs6n7p1dKWmnNEk34urhesdb0k1s2wcUH/ADEUjmArt9JXdsN92OkkJMOl289
         sIjhCT6KSc3YjOqIaJQyNj+PkEiFIRdEzHg6pRYAbwjKx+li/5XOUHDVSvA+chy4qYj5
         v1iOEwQG3tzPFXUA+50v0ocCu5Wc98ECLBziRibQc7QLDVwAtInItXYhkOmcAKjXQPCW
         3YXQ==
X-Forwarded-Encrypted: i=1; AKwUvBxtw5o4MTKpcl2UJdh9RUvZHAN+lVVG56WhWY02MZuvhayhcUJEr9/RBgLWqgB9atFRWvv4trNf1Q==@vger.kernel.org
X-Gm-Message-State: AFq9FYKMdcCev9QQLmrEdT051YM2LUwzSlaqkfuso63XrgnBd3d1Uyxy
	44Yyyvx48SOiSi3nKIDsRZyU9XfD8fuGraS84r/++QkwzzWGhrIqFmju0KeySDW6NbQ=
X-Gm-Gg: AYBFou02sokoJKLLkbCHFCmfmU5x2jYKh0kNxK/ANICCsuLhuqgkbg5pkjHCycjkei3
	ny2NSYEN8mm4JrgE84hz4jUN7MpApfFtH0UDcZtzAZyt++fBJyr3vBdh3c4UXSc0gMmXce1AXEL
	pjWuZ5c07U2Z8Kxn53GqTH6sOQDzToh7C+zR52LnEjN57eNT+fJlgMlV3n9JF8gaMJ8vOltiFZR
	6uFa3w1T0npj05/ci0qp9kl+ZH4jCDfW6Zd2+k70CGyssEk5uJpnY2ptLFb2GzeobSScU+VJm40
	p/9euEoEuW8pDXLDjpT8BMB5Zqfj5e9MqZd5WZ/YQ5M1+euvTFiytAaxB33l5tSxGHXDO2y8pbc
	3j2ngY2ay//Sb+ssAOk2fXOfiHORGvPt96+Pr2UbXmAsobsSIT3ET8oH4rY1Lsko96BbD/M7GsN
	5hylCHHsOBbGqwVfApZfySbIVd8T9TKviq35jPa7yOvjClbsRw5/ZvJc7kj+tKjQQc7ILGiE9Sf
	Knwx8r1cu1STxqBxoPjwi7Eou6XbA3iDJDYMFZBggqr+0tohzMWkzU70N8VT5MG+FwdHwI=
X-Received: by 2002:a05:7301:678f:b0:351:5af1:f53e with SMTP id 5a478bee46e88-3515df405e2mr11468951eec.29.1791486994632;
        Thu, 08 Oct 2026 12:16:34 -0700 (PDT)
Received: from localhost.localdomain ([2603:8001:5f01:8bab:bc88:5ec1:4f8a:5b23])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3537cacb5e9sm54053eec.20.2026.10.08.12.16.33
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 08 Oct 2026 12:16:34 -0700 (PDT)
From: Artem Dinaburg <artem@trailofbits.com>
To: stable@vger.kernel.org
Cc: Artem Dinaburg <artem@trailofbits.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Sasha Levin <sashal@kernel.org>,
	Sudeep Holla <sudeep.holla@kernel.org>,
	Sashiko <sashiko-bot@kernel.org>,
	Sudeep Holla <sudeep.holla@arm.com>,
	Cristian Marussi <cristian.marussi@arm.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	arm-scmi@vger.kernel.org
Subject: [PATCH 6.6.y 2/2] firmware: arm_scmi: Unwind TX receiver mailbox setup failure
Date: Thu,  8 Oct 2026 15:16:21 -0400
Message-ID: <20261008191624.98532-3-artem@trailofbits.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261008191624.98532-1-artem@trailofbits.com>
References: <20261008191624.98532-1-artem@trailofbits.com>
Precedence: bulk
X-Mailing-List: arm-scmi@vger.kernel.org
List-Id: <arm-scmi.vger.kernel.org>
List-Subscribe: <mailto:arm-scmi+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:arm-scmi+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Sudeep Holla <sudeep.holla@kernel.org>

[ Upstream commit 6f7c06744d53dc8e047725d411d7f915d9ec35ae ]

mailbox_chan_setup() can request an additional unidirectional TX
receiver channel after successfully acquiring the primary channel. If
that second request fails, the function returns immediately and leaves
the primary channel allocated.

Unwind the primary mailbox channel before returning the error so probe
deferral or other setup failures do not leave the channel busy for later
probe attempts.

[ Backport to 6.6.y: apply the same failure unwind to the pre-transport-
  split mailbox source. ]

Fixes: 9f68ff79ec2c ("firmware: arm_scmi: Add support for unidirectional mailbox channels")
Reported-by: Sashiko <sashiko-bot@kernel.org>
Link: https://patch.msgid.link/20260714-scmi_core_fixes-v6-13-3afe499d46e3@kernel.org
Signed-off-by: Sudeep Holla <sudeep.holla@kernel.org>
Assisted-by: LLM
Signed-off-by: Artem Dinaburg <artem@trailofbits.com>
---
This is patch 2 of 2 in the ordered 6.6.y backport series.
This change addresses CVE-2026-93083. The receiver-mailbox setup can fail
after callbacks become reachable; the unwind has real effect, but it is
safe only after channel setup state is published in the order fixed by
CVE-2026-93093.
This needed a target-specific adjustment; I called it out in the bracketed
backport note above.

The fix is already present in 6.12.y, 6.18.y, and 7.2.y, but not in 6.6.y.

 drivers/firmware/arm_scmi/mailbox.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/firmware/arm_scmi/mailbox.c b/drivers/firmware/arm_scmi/mailbox.c
index 80b67f46a4d1..a34a3c693e15 100644
--- a/drivers/firmware/arm_scmi/mailbox.c
+++ b/drivers/firmware/arm_scmi/mailbox.c
@@ -230,14 +230,17 @@ static int mailbox_chan_setup(struct scmi_chan_info *cinfo, struct device *dev,
 		smbox->chan_receiver = mbox_request_channel(cl, a2p_rx_chan);
 		if (IS_ERR(smbox->chan_receiver)) {
 			ret = PTR_ERR(smbox->chan_receiver);
+			smbox->chan_receiver = NULL;
 			if (ret != -EPROBE_DEFER)
 				dev_err(cdev, "failed to request SCMI Tx Receiver mailbox\n");
-			return ret;
+			goto err_free_chan;
 		}
 	}
 
 	return 0;
 
+err_free_chan:
+	mbox_free_channel(smbox->chan);
 err_clear_cinfo:
 	cinfo->transport_info = NULL;
 	smbox->cinfo = NULL;
-- 
2.39.5


Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793878033;
	b=HfAFrU3plgi7491yEBrhcH2qSEP3B7BHz/4pSGzugOQL1iShuycPLhOTar3TwOM7hKFq
	 PosH9IjrHRdTwhaLsydt5MbnvenUexRlFTyR5+y6IFVr06ciYkNuaOYbF6nRDFegL/HSi
	 uy+GfMJg79F3XaYBeGq50rVIzyh1QHflS5Tj8mrznOdN2oJClV5rUWe1yMQWK54UhfXJB
	 iRos+3KX+vrthXb7vHeoQL+fhFT/1bZ4IyMwQEjqgHbLr/JxcFJFYwGylr2Egut2QsAnf
	 vZFCGbMcysYWfvCqOlXtX+zMLN4ScuCZTsLnSD2ggZ3GrYoRg8kzGcK/TlEjxDGjEYQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793878033;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 MIME-Version:Content-Transfer-Encoding;
	bh=4Ws7TqmU4/IeBwBBpZCt1tOlLLbXCOSbAUzKGumP7dA=;
	b=opad8L4cbazkDt4227LoD75ozbYyeGCMp+jm6nGRI9J3PJi6rlGYmYsngBAVxzEmUaER
	 0kBTzlUyIvQam6DEpCkIo69lRnqFbdALoRYxGBWxK6PGP9pQ1VjdfFp3/nqvkdLtBYB37
	 jqOVdFlwU8VF8+uUc+4wJrGuPHNpZ5oG9tiVny1VOch2XGq/6H65VZc1/btkFPQGpI23e
	 QVnyMoqING4k97HSY2ypb4+6IDKA0izbuHrODqBsF4W7I/tLiiWJ7GLOUhtFT7MCI9cnS
	 edKGZhkQMNsAw69+tWzcqRvQIQGaGxQL7Ru49/39pmRI99GdR7BAlZukO1uduEtFl/Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=dzu7lZrR;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8201F606A31B
	for <arm-scmi@vger.kernel.org>; Thu,  5 Nov 2026 11:27:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=dzu7lZrR
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 46B0C1F00A16;
	Thu,  5 Nov 2026 11:27:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793878033;
	bh=4Ws7TqmU4/IeBwBBpZCt1tOlLLbXCOSbAUzKGumP7dA=;
	h=From:To:Cc:Subject:Date;
	b=dzu7lZrRotT8ZDOhIyjiwczcaEui94p5+LJFguUCdLTd2Jf2vz7Kr1i8Ii9PkpHGY
	 gZaRBNSnLazMlOZUX7Co1YUy3uoUzErY+BhUExeRgBSFk5uBxNc085uTweHePifpOv
	 ZbtJ/Z8Q7oCJ+5NVMLjSbANfGXPidY6xkD7R8fE6PmKcj9PjWG2TDOK/WHUl/YUndM
	 cCO8jaebPduBfVreQShHez4TnVgt2/Mqd3HGDpuL1YewPEOaGF3d8rFB17T5qBe9VY
	 uv6SkewgpaZVESiK+m5r+I0wlTN6z7/HsFeqOcvVKgJIKtTPAI4DBrjR4i8mLtwZB6
	 8MV43iwF5BWhg==
From: Sudeep Holla <sudeep.holla@kernel.org>
To: arm-scmi@vger.kernel.org
Cc: Sudeep Holla <sudeep.holla@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	Peng Fan <peng.fan@nxp.com>,
	Cristian Marussi <cristian.marussi@arm.com>,
	Sashiko <sashiko-bot@kernel.org>
Subject: [PATCH] firmware: arm_scmi: Fix fallback to short name in scmi_pinctrl_attributes()
Date: Thu,  5 Nov 2026 11:27:05 +0000
Message-ID: <20261105112705.3045759-1-sudeep.holla@kernel.org>
X-Mailer: git-send-email 2.43.0
X-Mailing-List: arm-scmi@vger.kernel.org
List-Id: <arm-scmi.vger.kernel.org>
List-Post: <mailto:arm-scmi@vger.kernel.org>
List-Help: <mailto:arm-scmi+help@vger.kernel.org>
List-Subscribe: <mailto:arm-scmi+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:arm-scmi+unsubscribe@vger.kernel.org>
List-Owner: <mailto:arm-scmi+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In scmi_pinctrl_attributes(), the return value of extended_name_get()
is returned directly. If PINCTRL_NAME_GET failed, the error propagated
to callers -  aborting pin/group/function descriptor initialization,
despite the short name already being available in name.

Discard the return value of extended_name_get() and return success as
intended unconditionally after the successful PINCTRL_ATTRIBUTES
transfer. On failure, extended_name_get() won't have overwritten name,
so the short name copied from rx->name remains intact, which is exactly
the fallback behavior described by the existing comment.

Reported-by: Sashiko <sashiko-bot@kernel.org>
Closes: https://sashiko.dev/#/bug/linux-8ef1b8d2-695d-41e8-8b54-5f45fbb5eb1b
Fixes: 2145af01b9cb ("firmware: arm_scmi: Add basic support for SCMI v3.2 pincontrol protocol")
Signed-off-by: Sudeep Holla <sudeep.holla@kernel.org>
---
 drivers/firmware/arm_scmi/pinctrl.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/firmware/arm_scmi/pinctrl.c b/drivers/firmware/arm_scmi/pinctrl.c
index 42cb1aef1fe1..c8e26168a8a4 100644
--- a/drivers/firmware/arm_scmi/pinctrl.c
+++ b/drivers/firmware/arm_scmi/pinctrl.c
@@ -233,10 +233,10 @@ static int scmi_pinctrl_attributes(const struct scmi_protocol_handle *ph,
 	 * on error just carry on and use already provided short name.
 	 */
 	if (ext_name_flag)
-		ret = ph->hops->extended_name_get(ph, PINCTRL_NAME_GET,
-						  selector, (u32 *)&type, name,
-						  SCMI_MAX_STR_SIZE);
-	return ret;
+		ph->hops->extended_name_get(ph, PINCTRL_NAME_GET,
+					    selector, (u32 *)&type, name,
+					    SCMI_MAX_STR_SIZE);
+	return 0;
 }
 
 struct scmi_pinctrl_ipriv {
-- 
2.43.0


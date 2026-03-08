Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4150C37DEBF
	for <arm-scmi@vger.kernel.org>; Sun,  8 Mar 2026 13:01:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772974894; cv=none; b=AEq4JHuirLycBvX/FASwlMTtnKEfTh/P1jpucSUDoacTs62KzTu3F2DC5fVyRmSIwO59EkqrBcvsc5xXcrknbdcikGl7n7hK3YILO9/rr8tru/8wq/KdftuxownZ3F0VybPW+2xAvYeJBWbyhW9Vtna5WfGmop7hAVMgo/u+TaU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772974894; c=relaxed/simple;
	bh=PegtPUAx1ynhrJYgVNPAky69gIj62ODvpNtpEi7eu6g=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=NE9Vr3gOhIXykk2hhht5jesRyMwxR/SWtm9fttmJf8On3tOdQaBKfOId2fhcQZcY/Evdf+WpqJqz4GoLIXNNos2BcrthQ6NEXztREhCPY99ILu2Qsvy1ZEOLQBdpxzCco6VohuRaMXR6EDeOmCcpb718yO2ZkFwLbdHWYPMC0Co=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dDRVSEtK; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dDRVSEtK"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CF22CC116C6;
	Sun,  8 Mar 2026 13:01:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772974893;
	bh=PegtPUAx1ynhrJYgVNPAky69gIj62ODvpNtpEi7eu6g=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=dDRVSEtKDHf48WEJjRDU36s45dZxbWqf2Yjm4IumQCnV1VCv7XGZQ2w7uad9MAJ4W
	 ciZaPHn8roZ2eg60VTfL5zEP/rAPuI3WNPEnEH+jMTZYocNdy0OIaxLU43jrlqXwKP
	 dCV3Mv9ZNOPLdXOU0SXWDtoQBC+YpPoh1f6/xblNndYDGMmSN7zmcdWnZqVZZRrhLS
	 t7m+qvzDuXPEDH3etOABm3WCw/KlwskZzwaaYkKkBmSpwellBp834OHojHqnxQhw51
	 66VK8OeIsQaFbW8eC1anhsC5EzyDXjBiFiNYv1E0cxb/drLgn5XPGdb5bXgBtyqEqd
	 U0PQmbqLEfpoA==
From: Sudeep Holla <sudeep.holla@kernel.org>
To: Cristian Marussi <cristian.marussi@arm.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Sudeep Holla <sudeep.holla@kernel.org>,
	arm-scmi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH] firmware: arm_scmi: Spelling s/mulit/multi/, s/currenly/currently/
Date: Sun,  8 Mar 2026 13:01:28 +0000
Message-ID: <177297485599.1088487.13156698600769816077.b4-ty@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <6735401861e0c2f3e5e680533cd6f71c4d6fd5eb.1771581270.git.geert+renesas@glider.be>
References: <6735401861e0c2f3e5e680533cd6f71c4d6fd5eb.1771581270.git.geert+renesas@glider.be>
Precedence: bulk
X-Mailing-List: arm-scmi@vger.kernel.org
List-Id: <arm-scmi.vger.kernel.org>
List-Subscribe: <mailto:arm-scmi+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:arm-scmi+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

On Fri, 20 Feb 2026 10:55:15 +0100, Geert Uytterhoeven wrote:
> Fix misspellings of "multi" and "currently".
> 
> 

Applied to sudeep.holla/linux (for-next/scmi/fixes), thanks!

[1/1] firmware: arm_scmi: Spelling s/mulit/multi/, s/currenly/currently/
      https://git.kernel.org/sudeep.holla/c/4e701b47c3ba
--
Regards,
Sudeep


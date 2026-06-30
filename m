Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DAB8F38657D;
	Tue, 30 Jun 2026 09:40:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782812440; cv=none; b=Xc0RjQFoRVoj1SWrmXxnN1d/n124C82WUAFIhgD5K3r66QT6UT0eMG9IU03e0Hj88xicMlpMgobAYdQsT10cnnhRmvU7Bd2ozxLicNjwYW6u1qsaMJhR1GOqn+cU8FAVLphDFIvn+0CLZNyPls315+Oj1RtLQJYEvJ+TZBk35lU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782812440; c=relaxed/simple;
	bh=xjJ6Y/m0Zg8oMRCGKqWPMzsC7nAUvLii6T3TlLeERwI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=pooISk+2Prhg2+TpQv5j/54Hd8IH+q4U5QlFjO6edGbExlZM2ODFijaVYrHHUDochLVrSLc/+8qKccQ7NTABu1drPkJmF/dpd5GRsx0RiPZZZKWfeiUWkjQs8O9TVZtiB0GL6rpk96R+94HRtYbaSE+e23fR2wFXUklxaG6dPUM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HC1tDAtQ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HC1tDAtQ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 640781F00A3A;
	Tue, 30 Jun 2026 09:40:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782812439;
	bh=k3WZwEHEb85ZkRCrbpTyDX+sXwXVVXCmTst5tFt0WoU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=HC1tDAtQwTeLR20Q7tlypDNUahVsP6GoZML8KiCmjS2Bbh1qXa6ZdIRxfB/xxZPql
	 Ct35gO4cqBYt/+KBr7UwSf1MfTgcosVRAZDwBOnVa4wEKEzMm2ofFvia7O1L/Qo8HS
	 sGQFBpwGoTAO3ihceg7QTAkfbS/Mjy1vPUbVjH0JZ+xL23POZtDcAIm/EhA4w+dQR5
	 YxBDeKrc28Yc2ku/mE5ellBt4mkpcQc7jbzdY/EqQSamuSr1JucNh8b71x2uU3ZxFM
	 1sehHBhcBEDMwsroKZ1ZKWFnW9wW7NwAUTmgka3RFRt2hN+gsc7fi14uV/I18eAd1o
	 5/XOfsgW4Bdgg==
From: Sudeep Holla <sudeep.holla@kernel.org>
To: Cristian Marussi <cristian.marussi@arm.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Sudeep Holla <sudeep.holla@kernel.org>,
	arm-scmi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] firmware: arm_scmi: Grammar s/may needed/may be needed/
Date: Tue, 30 Jun 2026 10:40:35 +0100
Message-ID: <178281184461.1094562.13812254750966468739.b4-ty@b4>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <5180d04abfb8e3074a321e2eb73bacfdd61c30c5.1780499850.git.geert+renesas@glider.be>
References: <5180d04abfb8e3074a321e2eb73bacfdd61c30c5.1780499850.git.geert+renesas@glider.be>
Precedence: bulk
X-Mailing-List: arm-scmi@vger.kernel.org
List-Id: <arm-scmi.vger.kernel.org>
List-Subscribe: <mailto:arm-scmi+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:arm-scmi+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

On Wed, 03 Jun 2026 17:17:51 +0200, Geert Uytterhoeven wrote:
> Fix grammar in the help text for the ARM_SCMI_POWER_CONTROL symbol.

Applied to sudeep.holla/linux (for-next/scmi/fixes), thanks!

[1/1] firmware: arm_scmi: Grammar s/may needed/may be needed/
      https://git.kernel.org/sudeep.holla/c/05e5ffde9b666
-- 
Regards,
Sudeep


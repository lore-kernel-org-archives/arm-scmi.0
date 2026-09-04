Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 760F3314B66;
	Fri,  4 Sep 2026 13:22:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788528123; cv=none; b=BBJp8B/M4fj/h1U6VVTt4CnHdZDxa9Or5oJWFKnKwUn3+qKXbHhN9UsfXy0rF+1ZWD9btdxIRc0KSYJUN6MnQyaYAt08oRerERlV6/APj1lDDmRVPEU9iRdsdBsUebqQWF99nN1ovrA6JHJmybxqgl73Q4Wx+N22RDi3IeTB5gM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788528123; c=relaxed/simple;
	bh=3IgsMSMJtkfbSZ6jI7v3Pt6+i682HZ6OkwWxO9ZGfI4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=rTi2jfQxOBEyExY3xQltDvkEXoYr0Q2WbA8KCpgMbwqrHn1zlSuYFywwSVsrl13kUpAicwnJRvCpH5bjXERB1K+3FEC1JClDToxIhB+UB+2FrUdNQPjdJ1VZnB/lEBp5Pc37wMG/ne+7rVUslGSe7UgCWTNDATel6MAE0C3ux2k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=B6PmqizP; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="B6PmqizP"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 991851F00A3D;
	Fri,  4 Sep 2026 13:22:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788528121;
	bh=v7pDuV/Jf/i3qKGKWxIBonJVYIXnOz5csNFqkw/ubSY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=B6PmqizP828Mtb3D+WRROf1OoLbIhnqUF7IfT4QVq+fsaKr76SlAW0gD1lyLn/T+D
	 hkYjVHoyfGGocaIkvodwQ7F6OTFbNwWqk7ppOqPd6Z9ywbA3pbMbODWj5w5hkanzgL
	 hjRHc3mdn0oziY1EVmzm0G5/W7ztOKIvxSb+XhDishw+gMV6IvkY+tt6zgps7z7yTg
	 d4LNBT/5h4XHM4rL0imbIh0GPkqTuSl/ewJCl2M3qdJjn7WEKEwek9UT8tlwDg6jS8
	 uOvG7l5DNqyJGdomZ/f5rsMz/i2B1GjM4+gC6ir2jpp3gShYHaBKZdUr1ewl4OMH1T
	 nZLrTrIwJIh1A==
From: Sudeep Holla <sudeep.holla@kernel.org>
To: Cristian Marussi <cristian.marussi@arm.com>,
	Hemanth Selam <hemanth.selam@gmail.com>
Cc: Sudeep Holla <sudeep.holla@kernel.org>,
	linux-kernel@vger.kernel.org,
	arm-scmi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH] firmware: arm_scmi: fix typo "upto" in comment
Date: Fri,  4 Sep 2026 14:21:55 +0100
Message-ID: <178852808698.331840.17304144326321992215.b4-ty@b4>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260904103732.7320-1-hemanth.selam@gmail.com>
References: <20260904103732.7320-1-hemanth.selam@gmail.com>
Precedence: bulk
X-Mailing-List: arm-scmi@vger.kernel.org
List-Id: <arm-scmi.vger.kernel.org>
List-Subscribe: <mailto:arm-scmi+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:arm-scmi+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

On Fri, 04 Sep 2026 16:07:31 +0530, Hemanth Selam wrote:
> Correct "upto" to "up to", reported by scripts/checkpatch.pl using the
> misspelling list in scripts/spelling.txt.  Only touches comments, no code
> changes.

Applied to sudeep.holla/linux (for-next/scmi/fixes), thanks!

[1/1] firmware: arm_scmi: fix typo "upto" in comment
      https://git.kernel.org/sudeep.holla/c/44caf1844a25
-- 
Regards,
Sudeep


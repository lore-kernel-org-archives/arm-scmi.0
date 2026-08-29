Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4849435975
	for <arm-scmi@vger.kernel.org>; Sat, 29 Aug 2026 17:53:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788025997; cv=none; b=p/yIzVdxtxzPh69hF1ZS5UgzbzrNJnJdkBVBknOYY1IWL0P1dUI4UjMnfiBzdgpQLIICCGWZXWLyMdq36PCTkSKLNuLWjoW/0ubOk1yD4xBT7RLis4WnpcK1Ka+cwvG7Z3osi9ZVmZI2SSgccgkMLGeqGfzSyevcNaU1C+HCyAQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788025997; c=relaxed/simple;
	bh=AGDArOvVArVKUmPEAtnxyA3zzxKgJY7DNkkyhH3xZbo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=KgII0PmrEhzQuzZmD01J5EnL6fRVfP8Bqibn6BAp1mvcR6xBIxKxESKzeBd9zH9YjaNClM42rNZsFtn3L3l+CK87I3FOrOAi/xLGeC/GhfSbfbzk6NCqf7ojCsFFQUpQcuzluYjwqXX74xXPBqSnF9Xkei86nQdamhhobXYrAy8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=rivian.com; spf=pass smtp.mailfrom=rivian.com; dkim=pass (2048-bit key) header.d=rivian.com header.i=@rivian.com header.b=CjtLUJMn; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=rivian.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivian.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivian.com header.i=@rivian.com header.b="CjtLUJMn"
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-2d715f4a587so29031535ad.2
        for <arm-scmi@vger.kernel.org>; Sat, 29 Aug 2026 10:53:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivian.com; s=google; t=1788025995; x=1788630795; darn=vger.kernel.org;
        h=content-type:mime-version:references:in-reply-to:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hBbzW+U1XX2evPmEKqq7snt9OxQ5avJUWLwD2vkYuH0=;
        b=CjtLUJMnBjtlZ7BM07bJ+RZZsN25+YUjBOlQzBSnlWn+RS747FJ7uXEGr5Iz2rdkyv
         irwr5kS6x4OfSB5Nb3lsoI0SPEXdC6cWxiNTzdIyc+BmiqLt88jaXXztyg45x58eXqgU
         Ykn/AanSKKG8cNYYmcIYZ5FsqTmu9WejNIosqNPIZ0LBGaOm7fKnjUzcy4aLE7CQ3SDE
         ghM6FaTjL7ko0wLyvXJWkaWPfQgBEwGkiRH4o3ocya3qQzfMsl83T+2TdhdRXG5+ozOD
         WOjK59OFfj31a92x7sLvOTERKFGNQrbtlKfUwBCa5Fxu2Lrq9hMhyg2xhAFCOuShMZAJ
         Sqiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788025995; x=1788630795;
        h=content-type:mime-version:references:in-reply-to:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=hBbzW+U1XX2evPmEKqq7snt9OxQ5avJUWLwD2vkYuH0=;
        b=ZERn9am/usFD7WLWf6f8Q2HwDBxpdLduQJINB+smzKxAA4G4aMiZ5i3Z+yZ8wNftZy
         D0LpW51cZAV7X+lmuwe1Tkfb0cuY3soxOWJnWKAhLhUK2N5qYleaZKs72PcqshpvTgqV
         Gzv4neDZN2YwVZdh1wS4KTVtMbU3tAYXDsAZ1ABzAUO/7zzQ18WcOIv4teu+MPAMRYGw
         Dp1wHlbsCN93sHobTUPZI9tVFGm+39hgFPOTp82j7MN08sVYFU2nWQQppc63WA6k/bM1
         coP6RB2utjU12bsV6SGcEXX9OHg0MpkEszH/fvUCSy6saKreTZAfYg380RhvDQS38JcZ
         Vr6A==
X-Forwarded-Encrypted: i=1; AKwUvBz5+Und8GR9S36vjGXXjES/3NLYRDy1b6AyDRC5FFNfqlEuetqC78mvdQe5SDLTOyQwOQoMIUXd0g==@vger.kernel.org
X-Gm-Message-State: AFuF++l+LTSiPfwScVsDCqfEqkjIZIqg4JmwKFL2PKdV8J79y4c0xL5V
	7CzQ3GXxGI5VWjKF9mif9CLUv0R85OVco/i05M0MFmOtKFm7SiTCNEFT4onMV9Pba8KRXcFnqNT
	RUTHE7aYBKx2cUXMddmmRkO9zIzL2+amBBgZI4VvyuPft+iu6vZraasL35cZjkews5Hw=
X-Gm-Gg: AYBFou3zzpAsq/WiLa8/ALU1Z4em0AomhH9jzFl0P0S3ZCZb6nusA3ffLg3UG1k90EB
	LJDxl6AgAp6TzAx2L8mwMiRaeoKnN4c74Npp1OPbasOXEvps3iaOnVz5zna863pemUUEr6VVpO3
	FblJlOl4AFOJx8ecChicMURA+nv9LlAfi9lzOS3lb5JFRVXC2w5pxcMssVUjvsfsqRYlMD+D8/O
	K84i46cc3AGApC0AbSwGKFcSRfEPLmYFFliUjlkocC3x/6QqU4qlLiP6FZbZcJ5EYmE9cKW9uRr
	i3WJgB5aKAS+Zu5mUp0akm0F/T+nURyaRFGfcZ4w0kG62+7JWiWEKVD+T08rhmgLKZsI8CpTGWK
	RZTWKFDXBgBqCu5o42cZevwE+jG/38bD7zjXHocqyI4D4PrT+tX1+CbJuD6wI8WW8r89KGbdYsP
	KGERGd4sSjvLaUai/zfYEvCa3MjLsQsM1bTmZeprTbjmygevOpnHbAfubVCb93zag0Iqcu1ClZ7
	2rP43kTy9AJA71cPmWPWb2Aj+8brOshxOY5qHhvTa1ElLNQ4p0GA/Z06Rr5k7bT8ZuwTmCXs/HF
	i+p598E0gmrTCbuH
X-Received: by 2002:a17:902:d588:b0:2d7:1e07:4859 with SMTP id d9443c01a7336-2d74dbe40e6mr273366975ad.2.1788025995458;
        Sat, 29 Aug 2026 10:53:15 -0700 (PDT)
Received: from ip-10-198-159-19.us-west-2.compute.internal (ec2-44-232-128-107.us-west-2.compute.amazonaws.com. [44.232.128.107])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d8fdf63db8sm2159795ad.27.2026.08.29.10.53.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 29 Aug 2026 10:53:15 -0700 (PDT)
From: Roland Dreier <rolanddreier@rivian.com>
To: Sudeep Holla <sudeep.holla@kernel.org>,
	Cristian Marussi <cristian.marussi@arm.com>
Cc: linux-kernel@vger.kernel.org,
	arm-scmi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 0/2] Couple of SCMI race fixes
Date: Sat, 29 Aug 2026 17:53:14 +0000
Message-ID: <20260829175314.4067393-1-rolanddreier@rivian.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260814-scmi-async-done-race-v1-0-335b163d77ee@rivian.com>
References: <20260814-scmi-async-done-race-v1-0-335b163d77ee@rivian.com>
Precedence: bulk
X-Mailing-List: arm-scmi@vger.kernel.org
List-Id: <arm-scmi.vger.kernel.org>
List-Subscribe: <mailto:arm-scmi+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:arm-scmi+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"

> Noticed a couple of races in SCMI code around delayed responses that
> time out. These are probably nearly impossible to hit in practice but
> the fixes are pretty straightforward and it seems worth having the
> code be sound.

Hi, just wondering if you had a chance to look at these patches, let me
know if there are any questions or fixes needed.

Thanks!
  Roland

                        |||
Ignore any footer below vvv

-- 
*CONFIDENTIALITY NOTE:* This electronic message (including any attachments) 
may contain information that is privileged, confidential, and proprietary. 
If you are not the intended recipient, you are hereby notified that any 
disclosure, copying, distribution, or use of the information contained 
herein (including any reliance thereon) is strictly prohibited. If you 
received this electronic message in error, please immediately reply to the 
sender that you have received this communication and destroy the material 
in its entirety, whether in electronic or hard copy format. Although Rivian 
has taken reasonable precautions to ensure no viruses are present in this 
email, Rivian accepts no responsibility for any loss or damage arising from 
the use of this email or attachments.

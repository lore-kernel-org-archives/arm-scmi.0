Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.214.170
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794936917;
	b=TE1MBDfSXDGAZApDIPDQ23F5eKLmj7giAPx/UMD7MhZihZpaTil6YZ3hth8wVKasnpjY
	 l/W7MRnHviUqZd44HZMWZf2m5EZErmeCZRRJQMEJCJCgJNPm41YTmVhnHpqx0CYy+Qjuf
	 e9RadsiCBlcdLyTk3ER6GdTSo2jacthpBuvXZjrUCJNwulStMgynZuhcvRDAorMWiddES
	 7PpMNVuq1jBO5O7lebSKahTU9kOhk2Nyswe4RSp+85tRmKWVOB30HNIlIfoCRs54IFSgU
	 DSz7pX0AqBAN1iW4UufCsvN8Jk/YjQ5Hg+98I65wOJy0Jad2Uvvj3963TYXmB07DCAg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794936917;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=+iEPT4fOLUy2C57JftfFB6MsPWk0QDV4EEMGYI+go7Q=;
	b=X+FS+9FobUs5kTgvLlmAIGE/OIqyYw4kb0mSOvt/n8d9a2X1C0qjYlkrsI+couT1b5iO
	 8Jn5tXa+7XEEjkw0+sWm0t4r1qjXTCNBtCJmZzGIKedD95RMtXp2AOBjufE6Juazhh2YY
	 sCU8Cw1wOBEr74jv/t2rQqP9p/MY3oM3SGGBvb/5nj4w2uBA4MKY1Ma4+4Cp6Ujr0Rz5A
	 4Fp+O9wkvPXGGxA4VS3OCSDQkn77zD4fLap75XDvtuymzw4qomUBpDkRW4YwQP1cNrVrr
	 kUKq4UNGceP6zotTrDZERq2pxn6/cal4qndvygx6jWnlrBq4uWKqVWShTtV4jtZ1K9g==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=YPiE5lyO;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.214.170
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D9C1606A338
	for <arm-scmi@vger.kernel.org>; Tue, 17 Nov 2026 17:35:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5D9C1606A338
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=YPiE5lyO
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-2efb772d4c0so1628855ad.2
        for <arm-scmi@vger.kernel.org>; Tue, 17 Nov 2026 09:35:17 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794936917; cv=none;
        d=google.com; s=arc-20260327;
        b=iaUp4z8eR72J0usrxdSBE13n/Sm8Ae7m7NLdjNGStOrP2cnPQncV3Vh5FBS0o/hy4B
         F/FuIbzE9LDmx++FCPEwTCvYeI5h/yOTdb7od0oVFP/BylcIxnWnNTcPx19z7cFERSol
         zdwzIprxp3VaFMnyKtZg39GPPj53WUEGwUiqi5kv0K08Q1L2OvjNwkg6Z2yYLHLiqdB9
         L+dC4UAnmSLUG6vQ2c2GqPyF3GHOe9Gh7v/2ZUn6Bcimj+qxaDdHkOW+xZi7WtbAExr9
         5gP3qlWji1GAtwkfKO/eU8/5wFEImPbslz+ZXn1KpOQN7Vz04L0q7ZhdIFIV9S1/2RVU
         kQOw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=+iEPT4fOLUy2C57JftfFB6MsPWk0QDV4EEMGYI+go7Q=;
        fh=ylr7b6nQ9GNhUQ2sA0+/Pdep6PJPqOb/WXCCRD1bN5U=;
        b=Q93r/qDVfS/FfWJo2u4u7w6rzUEe0Tm6E/JI4uhnVBSpTEt1GDymiaNkrdRjr5jeHk
         0UsgH5iTi+ZNVPjkudH0GzbE6iWs0ehD6OuAgFfsCEIUrcSm6PzSDdSXgL5lsbiK/d0N
         YWKx2kREjPwyOUacwOIThSeX4BYGg0c4MUHwk3bCwgohSscJfeLm3QLWtRXWqAkqwr+E
         H8vHuO2h2GH5AgeEEwZMUAWkTCAWc23FpBepyNbcww1GRFoFaGhDUwS4ChfhOHfT/qcM
         xE+PHwQOfYbQrIG01OgDXappWMMwaBHjaI/6D2ya1IfFPRC1vb07oprCSzKHGBXjI1W1
         vRZw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794936917; x=1795541717; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+iEPT4fOLUy2C57JftfFB6MsPWk0QDV4EEMGYI+go7Q=;
        b=YPiE5lyO+qDn7QvlOgjPIJqviO6zK9UEeMs074eOxfruV0I9O7vf/ajZk7U7508YXN
         OfChmUxxF51tf/PwQbFetcAv0Xr14ORMQFEwzlFU87wl66TfB9uo1zd1MSt0F1Wt49xs
         nkgCqN7PdNwCOJv0j1zetrtDFKLhZO2nzwxVC+M7ZQ6TWvRqJqAPtgGEK3Gt3GpA1Sc2
         oBnXRXeEy+RuUJmt60z/EPZfT8jj4nR7TxTVGUesPbJKkNB8zOZK9qg3rnYHAh5l1rMf
         wb8zBzrske8iwbuOFhcUyimAE7SYNsKZd8CQLXrqVIyLIJA6TKtYLF4uFrhW9Ax5X5qv
         gurg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794936917; x=1795541717;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=+iEPT4fOLUy2C57JftfFB6MsPWk0QDV4EEMGYI+go7Q=;
        b=0CjhVS3w+bg+iiN6ULOWNDeI9NqGrVhXT8hb1FbwpckqhO46JWk83THn+vgFQtRkJE
         hpF1oESabiOPJ+Xek85maaQ6rnLRaLFYjs1u3FuYVg5Q8DPx+9hvuL5Njr2Kl9DlXC5p
         BUC77WX9ikEwkGLrbSFYd2KAbUO8cQSIxU+nu15N5VXwj3Mrn0KrsQZufkg6gYvgtNdu
         ZWqgHElBCyhNhydiBFeorEANVB7RYJZPynGCwP9h/24vWMuQFlNE2P5H6y/YKJnC+VsN
         is/Bo6e322LodjnMID5jBiXRAHCcWlDidROSlVaTXRatdWCEfGghJJg/JomEZvuQqxDw
         SC7g==
X-Forwarded-Encrypted: i=1; AL+hErHv8vbZfoc1dzcp6LGeSVx8eSrooCBu/PZ4II5B+IA1o4jGDC2Sh0LhN2Kw7uSQaWiOc+SN9gKOdA==@vger.kernel.org
X-Gm-Message-State: APuU4Z9/QhuPtZ81Z1dGDpafFwDsxQCiDs6RDELHhdjHxX1YA2LVqAI2
	aBe9PjY6ZmLRBWZB3fA9DVqupz86vy1hgJ6z4In2VF8/CbKq3BhlFTLLvZdIWWXW+0ltPtXIL3e
	cD1/2Mi56n5J789BvFV9a/wP/lXYi8oM=
X-Gm-Gg: AZFdTZeVguOmaNFtjCYZ5A7gPFbqxF5A3j9yHRjHugm4xPJdP/eKxa72kuFiKbAt6gn
	y/oZzyjP2PXaBmJaIicW4f4f+8cgVwuw7CDy71RcMAkXugySyWymgyQZU5UqIMORAwcg9pmD88a
	hF9KRWJ4c17yBf/FTfJ5hH230mGUSqEEoBrH4SuhmxJ3+dUnF9PV08I/3OhH3ArkigeIB1Q+Je8
	SI757lvNqLA9DjfknDaUIookoVX2WG4JfGpbxojZKbLtRP1R8nNZzt/0Hoq+HGOMDiofhLiVkaM
	Sc1LafdE7WwNL8/kyUzOUtmiPu2vtcTLJsg755fac3VMBpEPjr79SzDRVZ9KtBcUpksfYH0Q2Ly
	WHShmQou+2NrFRLLw8CgRiRg1OuIo8NO/ibL83Q==
X-Received: by 2002:a17:903:41ca:b0:2df:8ab7:fe3a with SMTP id
 d9443c01a7336-2eff751fc0cmr213765ad.4.1794936916611; Tue, 17 Nov 2026
 09:35:16 -0800 (PST)
X-Mailing-List: arm-scmi@vger.kernel.org
List-Id: <arm-scmi.vger.kernel.org>
List-Post: <mailto:arm-scmi@vger.kernel.org>
List-Help: <mailto:arm-scmi+help@vger.kernel.org>
List-Subscribe: <mailto:arm-scmi+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:arm-scmi+unsubscribe@vger.kernel.org>
List-Owner: <mailto:arm-scmi+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261116084211.3066460-1-cristian.marussi@arm.com>
 <20261116084211.3066460-2-cristian.marussi@arm.com> <20261116-astonishing-urchin-from-jupiter-838cfc@sudeepholla>
 <avw5o7sTyriZ2ZiX@pluto> <20261117-prodigious-limpet-of-fame-3d72e6@sudeepholla>
In-Reply-To: <20261117-prodigious-limpet-of-fame-3d72e6@sudeepholla>
From: Chengyu Liu <lui2012qwq@gmail.com>
Date: Wed, 18 Nov 2026 01:35:04 +0800
X-Gm-Features: AclHuK-3dP_RVRp9S7UU3KZcH-t0O4kwljf1AMinJpV8gpEOTdKcRjWE-9zLE7Q
Message-ID: <CAE=Q7=4+HMtqbiK9v3jw4t31TQOYUfRXKRurZ7KcMi7GTi1v2A@mail.gmail.com>
Subject: Re: [PATCH 1/2] firmware: arm_scmi: Fix deadlock between reboot
 notifier and forceful work
To: Sudeep Holla <sudeep.holla@kernel.org>
Cc: Cristian Marussi <cristian.marussi@arm.com>, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, arm-scmi@vger.kernel.org, 
	philip.radford@arm.com, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi,

I think the current v2 may have reintroduced the second deadlock
described in my original commit message.

scmi_forceful_work_func() still calls unregister_reboot_notifier()
while holding sc->state_mtx. Could you also check the potential lock
inversion between state_mtx and reboot_notifier_list.rwsem?

The reboot path holds the rwsem read lock while executing the notifier
callback, which then waits for state_mtx. Meanwhile, the worker holds
state_mtx while trying to unregister the notifier, which requires the
rwsem write lock.

Thanks,
Chengyu

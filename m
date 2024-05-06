Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com [209.85.208.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C940F15533A
	for <arm-scmi@vger.kernel.org>; Mon,  6 May 2024 15:32:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715009576; cv=none; b=PzGfZXhXQ+YKTCxGRyebro82k68++bAgOjS0pnYscYjN7YZg0rpUfI65o+ID/s+ERjCUHIQXmf7lCN/tWtKfMYDcN7MrdlPQGIcZaUz6fmhzEuoA+cm4hgQHV6gtUXE7GcK+AnWOSXbHNBB0m1C3PVWulwM9Y0kFsWip+T4VLng=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715009576; c=relaxed/simple;
	bh=fItUQ8dE0EJZQ8oYF5nKUlZ+h4iYEjoc9oVMhOngj/s=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Content-Type; b=UCMCfpG3MnFw3bVigMYFf2rpJ9HH1h2pLz7fB1/g4SbgS22063F7pJWBKb59thGa23H2PdJbLOZxgnL3zKkzMdOXXYTAnRYwj9XxOn94yIaSm0vb7VfUNlCQkAa/R0MvrN9q2rPY1zAHWu5grKKnhOGcqKCv73moVZGGwvRvIP0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=contractor.linuxfoundation.org; spf=pass smtp.mailfrom=contractor.linuxfoundation.org; dkim=pass (2048-bit key) header.d=contractor.linuxfoundation.org header.i=@contractor.linuxfoundation.org header.b=kB1ZcZcu; arc=none smtp.client-ip=209.85.208.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=contractor.linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=contractor.linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=contractor.linuxfoundation.org header.i=@contractor.linuxfoundation.org header.b="kB1ZcZcu"
Received: by mail-lj1-f179.google.com with SMTP id 38308e7fff4ca-2e1fa824504so30018171fa.0
        for <arm-scmi@vger.kernel.org>; Mon, 06 May 2024 08:32:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=contractor.linuxfoundation.org; s=google; t=1715009571; x=1715614371; darn=vger.kernel.org;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=fItUQ8dE0EJZQ8oYF5nKUlZ+h4iYEjoc9oVMhOngj/s=;
        b=kB1ZcZcu5Z9rUMSK7445/XEklsw+A9ulK7zRglckgaQA0HOXzkptKvoOeTBhOSLVyM
         rLsTXe6ih5sw4P+A2mJSkM/JXsnPicVOroaX3FNspo5uQnqgbiCkzRhWnJ3DMeHguIC0
         ONhPx+wsJLNsfy6X7ifnPFdZghRM5e9p6L+/B/htKdTGzTpWOvQ2KZsl18/1/RwpwMK3
         EjJytQ2xV+6eY6SEVuHNrR924f875mEROnlPg99AaBqIw4k1K0+0lgMUuOU2r8wbRc1u
         I42L+oP7jzKm4FvZVpmCYeZlMujTa2Bo/vYA5d8EmBs+zqsac4YaaM/pNry78WHFdO0+
         07JA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715009571; x=1715614371;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=fItUQ8dE0EJZQ8oYF5nKUlZ+h4iYEjoc9oVMhOngj/s=;
        b=TyTTBLJSQOiuyz2EzG1r1EcHGjx91aNdo2F/NTlflkEik4R9+iDQAcga83t4jKuHM6
         Y7mv/rI4+i0cgT4OgdXFRaPTCLxESwx35eTcaSmYejyWmW4R/Wwa6+C5N4HbGfxMWxBX
         lvkGJUoKVKnJPxdNtdwr+Hx36nmpc+mOgPSI6FTh4aALEgPE60hiLD38lERP1bIRKp6N
         Bli7Q0uhVqxQyDLPHdYBIY/cRxAt7W3z+A8/9LGj6fiQ+9mal1kJeTBFTRz9VOQU8bH8
         vHqIuAC+7KGNbGqhpJLFbI2M4jx4Mk1tfvcVn9F7FS6BN4rQRoT1plfbGxzzICNooNj3
         PRAg==
X-Gm-Message-State: AOJu0YzxKr0G9jwJG3ewDhS2XKLSJBsuB0aAYn6DrHU8txZA+u4nHhmQ
	1V6O3G/LCraXv6PjT5Hlu4ovqbyWIQM7HULJ+Ikfn258ZZAhWJK+r58GRw40zC7D8yCLGC7lVrE
	57NCkNzuUSKIrDhL6kFOufZwsfedqxbq0Ko68/yzhWd8ie0QMvcZ9Pw==
X-Google-Smtp-Source: AGHT+IF3egQ62DFGgVjMslzM2pfNOhPB+iJpwL646o9Eht0QUkLN9yCndmo6shKU24oMWZyiZNOW+XSd/mPExe0KiVQ=
X-Received: by 2002:a2e:9059:0:b0:2e3:3eaa:ac92 with SMTP id
 n25-20020a2e9059000000b002e33eaaac92mr2304444ljg.53.1715009571404; Mon, 06
 May 2024 08:32:51 -0700 (PDT)
Precedence: bulk
X-Mailing-List: arm-scmi@vger.kernel.org
List-Id: <arm-scmi.vger.kernel.org>
List-Subscribe: <mailto:arm-scmi+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:arm-scmi+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Shyam Kumar <skachukattu@contractor.linuxfoundation.org>
Date: Mon, 6 May 2024 21:02:40 +0530
Message-ID: <CAH=dH9-qAt=jNjqdy_rVnq7+bHsY-PXXThLF4VRGHUzEibuYuA@mail.gmail.com>
Subject: Test Mail
To: arm-scmi@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hello:

 This is a test message to test successful delivery and start the
 archive for the list. Please ignore.


Regards
Shyam Kumar
The Linux Foundation Core Projects

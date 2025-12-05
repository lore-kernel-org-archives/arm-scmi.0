Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B4592C15AA
	for <arm-scmi@vger.kernel.org>; Fri,  5 Dec 2025 14:16:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764944209; cv=none; b=NO6Q8jaQ7FADKFD+vFWGHWzIH1mFDSLcJ5zGcIZB0d6BPqmRT7PQOIW4g24IZzMUVT9JuwgJxMe4SPovKyq7Bw1+KI33zVpGr+/NVSwloaOXiKc1X4lP/w0mToglgCLiptMNB5NetM5gz/lKo1kbZ7PbJcbvcJ+Jr0WpWakRq8k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764944209; c=relaxed/simple;
	bh=R2g5UQqK/xohmelVeTB9J/O7YssHoDCD3YBN0y3wfbQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Ir3ZYKNfz/wgXL5wzOboKxmohCNQFQimetzBgEA6tM/EfTXb6ganYrDQCGoKDQ7FQNrWqA2PGEHpuFJiYDmXGOJNwo+dDXYxbdy7wMoUXi9KEx/at3dZ7jp/8h0tm+NDRNLzHLYUDGKRPpGT3gf7DEzHuiDd7o/TtuUXcPxCJ0M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PCXT4SZa; arc=none smtp.client-ip=209.85.208.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PCXT4SZa"
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-640aaa89697so3038243a12.3
        for <arm-scmi@vger.kernel.org>; Fri, 05 Dec 2025 06:16:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764944204; x=1765549004; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=R2g5UQqK/xohmelVeTB9J/O7YssHoDCD3YBN0y3wfbQ=;
        b=PCXT4SZa3a+6TMw0GauDbnUwMvkWmcAW/VNMwGAlhIGOw9Q1Xkg0yQVgm/3ktzWggh
         fg08WRqn3nngBPEIrYF210n6YK0iLHaMu/wqhhhUFQmyCIBq1DK2I/pPmo1l+eOVLIVF
         nVMRVfUKOMiFThna7T0evrBtshIJVikS0VNesqApfLxYZPiCoJ71Xx2o8vfj030Bamf3
         uYD5N/gGIHU0iA/+NaEYCRM97zZj+MRWHShEUx7cFyyf9fyGOJRqEHZe/Of3eRmrcw4G
         1DIHAkdxPio5qbVsTR/Avsjik0dYsihHLjUZpFGqjxwA+BBH4tLwPNxeKs9HuRgYVGrQ
         K5Ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764944204; x=1765549004;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=R2g5UQqK/xohmelVeTB9J/O7YssHoDCD3YBN0y3wfbQ=;
        b=ZubfAcmkWZZtxuZeiDUK2qC6DKT8S5zRUk7bkFcEyuGWH07lua8/5IAUfpm8t9fAJS
         rYbzcyfiBswYQOxZu19VyX3Sl3TX6KY9QM077FW5IWqg0UyaXv4Y9XD+7uGPPAUBD9F9
         B1WdZnmmbY6OVQCbKyKNDK/Y9siIBNlt82Er2kXuhSlfNfobxj81igbBnBO7+uUcJ1l+
         q0kWc6ml6nGpxjnxRbD8kRz0L4hErxHn177fEZZZHJSI4YGhsNOOboyqhuepFySnXkq9
         Jdg7BQ9O8klCz2KNLNUiqZF7wQ3DyJbVZ8AgEY2sXQMQTNEB5C/X3i0KAC1dWsDBk1dK
         yhgg==
X-Forwarded-Encrypted: i=1; AJvYcCW/0B5BLhXgQQbkBnxVco6S3TtRryhWOH137qWSc16hUoywo8D9gOBRSloxChuvzPCXHt5CXEiHrg==@vger.kernel.org
X-Gm-Message-State: AOJu0YyfgV/uijGM7nGs4rtmjfzBJ4AtsfbsY+RS2GK1KbpxDYVU6aNR
	KoaUZCSwZQomlnc+sMuUUDfbspHht9tXTKN88kJB2dogXNk68/c8KAueU1aBoLJbs5pOm2Gbmsf
	f+zzMx5WnLaoUFrsjcO4R5ex1aC8vFJs=
X-Gm-Gg: ASbGncsRhZfriw4G3dPQnlPfA49qgeNOAWsqZrMq6avxZZYs7QlsGk1Z8bpk19fQo1O
	TxOLQNt9VMev4ME8xFDCXHkMzZLP1ji1xquusLQ/5L7/KrFgqajVrUbPBPQc5IumYyuhJzK3wu+
	u1qJ5+vZEyA8k70x2Xnpy7zzGx5n6z640zWCR1NSohy7qviq+GPEufo3OqBYi9c45hkAZBxwf8j
	Vkv1U7L7mAelzTvPMb8XEM53KvCLdVgExHehJA/QdpwzfVD0k74CvYealq08e/fousQs+Ks
X-Google-Smtp-Source: AGHT+IHceS+AcOZ5dW8w0Qbihdbu6HTr3XGszoy5BRb8+hd9e12iZk925rUFbcfaGYdUXSUHXwpDuM7CTOkXnm9/rB8=
X-Received: by 2002:a05:6402:35cb:b0:63c:690d:6a46 with SMTP id
 4fb4d7f45d1cf-6479c497fdfmr9553716a12.13.1764944203595; Fri, 05 Dec 2025
 06:16:43 -0800 (PST)
Precedence: bulk
X-Mailing-List: arm-scmi@vger.kernel.org
List-Id: <arm-scmi.vger.kernel.org>
List-Subscribe: <mailto:arm-scmi+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:arm-scmi+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <aRW4PpPjVw1-melm@pluto> <20251123163557.230530-1-a.shimko.dev@gmail.com>
 <20251204-slick-granite-chameleon-58ebc2@sudeepholla> <CAOPX747pTsnTzKnaai-ytnmcf6reraTTSk+mssvHri4GMhCsOA@mail.gmail.com>
 <20251205-calculating-unique-ibex-de824e@sudeepholla>
In-Reply-To: <20251205-calculating-unique-ibex-de824e@sudeepholla>
From: Artem Shimko <a.shimko.dev@gmail.com>
Date: Fri, 5 Dec 2025 17:16:32 +0300
X-Gm-Features: AQt7F2o6ZhdTfprtpRS_RXzzsEVCCZ1t3NBhD4shQ8_Ku4ZiRAv8S5HC5LZ7bEI
Message-ID: <CAOPX747Nk5jOYREOYKO2=Zn0C-Zb=TY-nDbL_LzxbR2qcteexQ@mail.gmail.com>
Subject: Re: [PATCH v4] firmware: arm_scmi: refactor reset domain handling
To: Sudeep Holla <sudeep.holla@arm.com>
Cc: cristian.marussi@arm.com, arm-scmi@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Dec 5, 2025 at 3:14=E2=80=AFPM Sudeep Holla <sudeep.holla@arm.com> =
wrote:

> Let me know if you are happy too with that change.
Yes, sure, I'm happy with the change. Thank you!

--
Regards,
Artem

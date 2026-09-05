Received: from mail-244117.protonmail.ch (mail-244117.protonmail.ch [109.224.244.117])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBCB43B27C6;
	Sat,  5 Sep 2026 21:48:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=109.224.244.117
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788644907; cv=none; b=XPk+p/Rs1nk+7JaLMQKJqRNVqw3BAfK6VOc5WJNB2V2qvOwZQgrRjsXjJ7+T7lSKGX3whSHU7Gm6NArTP+LQvY9m6THJUKC4OPfSrCqh1PJnOqzkiMb7KwNqA6cItnOe45lNIlxNOOt9xV2RfDklxILYvz94t+80WQtMrBpO8iw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788644907; c=relaxed/simple;
	bh=P9hwRrRYyg+oS+IK/yluG4pfKNXTMsQDn5knIgkzfW4=;
	h=Date:To:From:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=YRk9lu/wkKihwdfT4UU6Cq5MZfDRHyHkYSgd18e6m0bFbNrwBd6++UAso8nPxkgTQQFUzeGov/Pgn+IqPjZBxxCISQwQ1gphVV8wIHkwvjXjgYKFlpSbdT7HbVj7ley4SdzN2WWRHCciLmPY5SfrGxBblK5N6c1jdIm2MIsN7Ic=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pouliot.me; spf=pass smtp.mailfrom=pouliot.me; dkim=pass (2048-bit key) header.d=pouliot.me header.i=@pouliot.me header.b=Ugfw1d9Z; arc=none smtp.client-ip=109.224.244.117
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pouliot.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pouliot.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=pouliot.me header.i=@pouliot.me header.b="Ugfw1d9Z"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pouliot.me;
	s=protonmail; t=1788644895; x=1788904095;
	bh=P9hwRrRYyg+oS+IK/yluG4pfKNXTMsQDn5knIgkzfW4=;
	h=Date:To:From:Cc:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
	 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=Ugfw1d9Zdt9U4RzTQsC7zjCiq6I7dEQmBfJbqp15U/M7NR7K5TieBJtplFrPHKM57
	 wO8POpeFV60HovNLCYcApHS2mRBB8PvcI7zuGkZm/Q3eE4aeEkiZjL1TCu4LLt/ACK
	 ZPcO4wA6ieHgbBwIdytFYADjDG29RJg0RW/BPYpfLje2UGBl2S3CKJzmJtCp7/rY2t
	 HOMV7vc+Ffpo+yqBcXy7Y6ehr2Mp7UmHe+bIvvtlfPZnozl6cm1Dt57PZzePdKhHb9
	 7feBa2WjkE++/y/K9xjNf0gh//+BHEFvtYrvdkTc2f/ONJvXr8gbNmnaI3/kfnPKUE
	 HB0fCjrI+FFHw==
Date: Sat, 05 Sep 2026 21:48:12 +0000
To: "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>
From: Chris Pouliot <chris@pouliot.me>
Cc: "arm-scmi@vger.kernel.org" <arm-scmi@vger.kernel.org>, "sibi.sankar@oss.qualcomm.com" <sibi.sankar@oss.qualcomm.com>
Subject: [BUG] ASUS UX3407NA / Glymur: CPU6 performance does not follow SCMI frequency requests
Message-ID: <uRKznjYXnWIYd6NxkpJjmLKZfw5gc8lTsAu2Is_Z7XAyYcZwj6fJdKmVjpzUsXFc2JYL1oWux7dXVKQR0KAz3HFcXcYb7Bm4VELFCWykEg8=@pouliot.me>
Feedback-ID: 216858851:user:proton
X-Pm-Message-ID: 8022a61aaadb89566e8e53347bf517d62a6534b2
Precedence: bulk
X-Mailing-List: arm-scmi@vger.kernel.org
List-Id: <arm-scmi.vger.kernel.org>
List-Subscribe: <mailto:arm-scmi+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:arm-scmi+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Hello,

I hope this is the appropriate place to report this. I am investigating low=
er single-core performance on an ASUS Zenbook A14 UX3407NA ARM X2E running =
NixOS with the linux-msm Glymur kernel (7.2.0-rc5-next-20260731 commit=
=C2=A051231839d5ef007638bd1c3500e6a76b337a66f3) and local patches.

Geekbench 7 scores around 2400 single-core on Linux versus 3000 on Windows,=
 while multicore is around 19000 on both. Enabling boost and switching from=
 schedutil to performance didn=E2=80=99t resolve the issue.

With a diagnostic patch routing SCMI performance-level writes through mailb=
ox messages, a fixed workload pinned to CPU0 takes roughly half as long whe=
n its requested frequency doubles. The same workload pinned to CPU6 takes a=
bout 1.80 seconds at both 1.594 and 4.032 GHz requests (low/high/low freque=
ncy test). The SCMI writes return success.

I also tested a firmware maximum-limit change on CPU6=E2=80=99s domain. Tha=
t returned success, but the limits readback stayed unchanged.=C2=A0

Frequency reporting also looks inconsistent. With boost enabled, policies 6=
 and 12 expose a 4.723 GHz maximum, and Linux=E2=80=99s requested frequency=
 reaches that value. However, I never observed 4.723 GHz in the firmware-re=
ported or averaged frequency readings I captured. The fast-channel readback=
 repeatedly reports 3.437 GHz, while averaged readings sometimes differ sub=
stantially. Mailbox current-level queries return index 0 even with a worklo=
ad pinned to CPU6, so I=E2=80=99m unsure which readings accurately reflect =
the running clock.

Does this suggest a missing initialization step or a known firmware limitat=
ion on Glymur? I have the traces, test scripts, and kernel patches availabl=
e.

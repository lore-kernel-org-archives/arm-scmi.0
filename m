Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24ED53BB689
	for <arm-scmi@vger.kernel.org>; Sun,  6 Sep 2026 16:45:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788713122; cv=none; b=P3WTba6j6zavlyQKZvxp/H0H0u3GKtUfPMgeD+AJmVNGn977Z0ZVCK/mV4231UQ0cKvt0Q4CjhZfBnd8EuzDMsL6Sks4yTbQu6dPahre9m4qfb4lIZhGfy48IeNvUdFdWd1jhQR61OlJwbgh+ur+MNdYIwa0GRf2Yd8fz8GXIQA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788713122; c=relaxed/simple;
	bh=qpQrFPhAVZ3kbIgppnX2o7cpwHwHfLlSJgvbn4dIoko=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=CaSOqy+DToV/8AUX11SW6CXhzN4juSVWwIyskaGbiph+jhFI2Ic6eIzHB8hFCTQwldKVnUQIBOeyRwTG7ezxEXgcZ3RbYwvo48o5SJQyJ2JcKbWtbE2tLbXO/89JQE/IXc/4A/5FLW0C2pKJX1BlGr+kqWeuc1HjahOvKD83xrE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SJBZsYEm; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SJBZsYEm"
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-485850cf499so1576894f8f.3
        for <arm-scmi@vger.kernel.org>; Sun, 06 Sep 2026 09:45:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788713116; x=1789317916; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=4cZMS/1hrm5NiSZxF7UP63IPAMHy9oKaLuo9s5Qa9JY=;
        b=SJBZsYEm/sooOhck9VFIMi1Ftx2rwlavRhdIwe6yXwzGMInCgSGgeDLPpYyBe4/Hvj
         4hiNKoZoLHz3FKRclwGXcTxAb7Inqi9A6faGDzaaSnt52gbSMl4jRgZkCoUWBi3IbumA
         +zzd8xUkJF83ZZV9VxEHOK+qim6sS3LaQxdVWHj1+tYySATi74lQdk7k3EW+IFF+6s3v
         vzDIoHbbhSM1lBOJ58ox1GuZOLMOEMsJMkOyBwYjt9sUZDfq8y173mhio3EiEfHoe7LC
         3GWWLXI6MeZ1zZlomPuGLcQdM0Ums7U9kCFWycLWt3aXIzh0uLa2r1h/69jUm4ZAx9+y
         pCGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788713116; x=1789317916;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4cZMS/1hrm5NiSZxF7UP63IPAMHy9oKaLuo9s5Qa9JY=;
        b=NgF1fGxKEeOUBULKtwSHO+UJnUVVHofnAvtxR6JbGsu57lhVjWn7U5dynM+KFMVfOy
         UfJXMd/OUrkSRe+Hz8Hqlgu9HOcrH3E3jLwNaCUCyhRc9JTtVZOiJua1K0vk5UUcn0Wy
         VQOt5tZCqeNz/KhEU+gN8XSC0pFpYgOzGwtoelcMHLqjTK6/xFWLOdMKkxATo6gZMF02
         a6uvHnzsUUw2IvO0TVWHBOzaY4sxloIkIkNCH4J6BS286+YTLukZmtFwQbrp/o0H1mks
         NtOPj/oS4uF1dBXzHGhyHQf2AnoZfdb1yyLZxq1I5Sx/nBvyCP03RZ1equLFD33JzzGJ
         Ee5A==
X-Gm-Message-State: AFuF++ktRHT5pzh0LjMzHeHceBQNfjD5Yik0J+afqZWlq8wr2G4XghqZ
	nLXM8POL4rVmWB/AZ+t/rdpcOWawmRnzlaWriXvDYAB6M44Y6FeiOt7t
X-Gm-Gg: AYBFou0zHbVNz9uCQnqLFLxQPOx3nKz/FFrg2TfBGtSNOY6FeqGzOG6sQ2PR9OGFWJ4
	pxLgFUWFmKN+iY1m8XgsVlnUHMZOUU8K8Fhkh2Dl3E20tZ6iXc4iJZS/DJMW0m+YTw4sQBUJ9gV
	psjpQDhtA3zu/qCwKLoRS+XLFpLFwoZJBaUfHeYDkjiLUEdMw2aRDZ0ctiVNECYpo1H7hX4ks2V
	AcIVdaanwqfn7YSmB8x1qu0Aj8EFSbYlAibk3HcV9Td1CEpSmOC9AeTZPFV+iXR+RfB6SgBlfA9
	3YCYjsx8Xbc9koDAslWoEIJ2YIcsr9ISWnKtBt3nEdcCiEMsGlLUE2gB4ny/xyOPXx2eU/xJdAW
	BwMmbDM20iVcX36PgSHJsqYdrA7bH5pozGZGeqabAdem5eGHw23PtaEjr22V0bJH+dE8WciOoD0
	GsSKPN/+AuuxRnw1E0Nku0LhZ5cDCopWbVFMsG/jTUZv2eADr50M7ItI7Z3YqF1s3DSv1kjf6SR
	sul5o7tpxje+JTdGNwAKyzVvzlW
X-Received: by 2002:a05:6000:178e:b0:485:8c17:9770 with SMTP id ffacd0b85a97d-4858c1799a8mr14116443f8f.50.1788713116368;
        Sun, 06 Sep 2026 09:45:16 -0700 (PDT)
Received: from localhost.localdomain (mob-5-93-26-136.net.vodafone.it. [5.93.26.136])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-485885be01bsm22085063f8f.31.2026.09.06.09.45.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Sep 2026 09:45:15 -0700 (PDT)
From: Oleg Keri <okerixx@gmail.com>
To: linux-arm-msm@vger.kernel.org
Cc: arm-scmi@vger.kernel.org,
	Sibi Sankar <sibi.sankar@oss.qualcomm.com>
Subject: Re: [BUG] ASUS UX3407NA / Glymur: CPU6 performance does not follow SCMI frequency requests
Date: Sun,  6 Sep 2026 18:45:02 +0200
Message-ID: <178871310238.4950.15573737485584011697@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <uRKznjYXnWIYd6NxkpJjmLKZfw5gc8lTsAu2Is_Z7XAyYcZwj6fJdKmVjpzUsXFc2JYL1oWux7dXVKQR0KAz3HFcXcYb7Bm4VELFCWykEg8=@pouliot.me>
References: <uRKznjYXnWIYd6NxkpJjmLKZfw5gc8lTsAu2Is_Z7XAyYcZwj6fJdKmVjpzUsXFc2JYL1oWux7dXVKQR0KAz3HFcXcYb7Bm4VELFCWykEg8=@pouliot.me>
Precedence: bulk
X-Mailing-List: arm-scmi@vger.kernel.org
List-Id: <arm-scmi.vger.kernel.org>
List-Subscribe: <mailto:arm-scmi+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:arm-scmi+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi Chris,

I have a Lenovo Yoga Slim 7x Gen 11: same SoC, different board: on
next-20260903 with no local patches under drivers/firmware/arm_scmi or
drivers/cpufreq.  Some of what you describe reproduces here and some
does not.

Frequency requests are honoured.  Pinning a policy to a single OPP with
the performance governor and timing a fixed workload:

  cpu0  (policy0, 3417600 max)  1516800 kHz: 5.354s   3417600 kHz: 2.374s
  cpu6  (policy6, 4032000 max)  1593600 kHz: 5.090s   4032000 kHz: 2.011s
  cpu12 (policy12, 4032000 max) 1593600 kHz: 5.089s   4032000 kHz: 2.010s

5.090 / 2.011 = 2.531 against a frequency ratio of 4032000 / 1593600 =
2.530.  cpu6 tracks its requested frequency exactly, so whatever stops
it on your machine is not generic to Glymur.

The one difference I would look at first is your own diagnostic patch.
Glymur drives performance levels over SCMI fast channels; if you have
replaced that with mailbox messages, then "the SCMI writes return
success" and "mailbox current-level queries return index 0" are both
consistent with the commands being accepted and dropped, and with one
domain behaving differently from another.  Worth re-measuring on an
unpatched tree before assuming a firmware limitation.

Your second observation does reproduce, and it turned out to be two
kernel bugs.  I never saw 4723200 kHz reported either, even though the
CPU really does run at it: the same fixed workload takes 1.726s at the
boost OPP versus 2.011s at 4032000, a ratio of 1.165 against the 1.171
the frequencies imply.

  1. arch_freq_get_on_cpu() truncates the u64 product of the frequency
     scale and the reference frequency into an unsigned int before
     shifting it back down, so it wraps for any reference frequency
     above 2^32 / SCHED_CAPACITY_SCALE = 4194304 kHz.

  2. capacity_freq_ref is latched once on CPUFREQ_CREATE_POLICY and
     never updated.  Boost OPPs are excluded from cpuinfo.max_freq while
     boost is off, so booting with boost disabled leaves it at the
     sustained maximum forever.  On arm64 that saturates the AMU
     frequency scale at SCHED_CAPACITY_SCALE, so cpuinfo_avg_freq cannot
     report above the sustained maximum: and the scheduler cannot tell
     a boosted CPU from one at the sustained maximum either.

With both fixed, cpuinfo_avg_freq reads 4718587 at the 4723200 OPP.
Patches:

  https://lore.kernel.org/all/cover.1788712186.git.okerixx@gmail.com/

They should apply to your tree; please say if they change what you see.

cpuinfo_cur_freq still reports 4032000 at the boost OPP here, which
matches your "the fast-channel readback repeatedly reports 3.437 GHz".
That is a different path: scmi_dvfs_freq_get() asking firmware for the
current performance level: with no clamp anywhere in the kernel, so I
suspect firmware reports the sustained level.  I have not tried to fix
it.

One more thing worth checking: the UX3407NA DT series you are building
on has been in "changes requested" since June and is not upstream, and
you are on next-20260731.  Rebasing onto a current linux-next would at
least tell you whether you are chasing something already fixed.

Thanks,
Oleg

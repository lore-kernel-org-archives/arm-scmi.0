Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=109.224.244.16
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794366345;
	b=Te3t4sKVhmTZSwCMhBN6IlWFRDXvhKzBzsTTdkUo3CEyFDo1pn4qMILFwfFsdMIov8VQ
	 5ZnPR7Y4SHraRZR5aIiAUOTqBh/f1wsSc5vsxJ4YoCt2e70cAHVH2ZkjkJr1Ob2wGx7/T
	 OFvCBOnL/Jd3+feRhgm+SJtNRFrZZDrcUUxkFLd5QrH9uT1BHrmGh2BD5VFquI6uofG6x
	 nEpWWaEfTjIT7USKFv9hlm/QhCDdOw3sLCgsX+BVq8ZuuH5UgwAwGLMAAVP408SLzWxCR
	 X/VxfJ/bZJwEVWrX8bVcdbBOPBHprm6QOPDNdLGnUxrWZ0jUdoj0xrdaY8WAek9l9jw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794366345;
	h=DMARC-Filter:DKIM-Signature:Date:To:From:Cc:Subject:Message-ID:
	 In-Reply-To:References:Feedback-ID:X-Pm-Message-ID:MIME-Version:
	 Content-Type:Content-Transfer-Encoding;
	bh=uMTNYUkii6qLQJ9ZEEqnYSkjnjc4c5VnVsIGkdlEd14=;
	b=XItl/AxGn5YpA48d6MJCFTTI9MwSDtV1xFMDEhdfRSbV5+BnWvLtP45tlrlV6ypahmHB
	 IhHC4FTRFHG2lb5dPMkanKltXltpOgoKeLZ7xck9W6xVE7aqXOJ5rUJu0MwhEB53C5Z1h
	 D0929aidl9MKJWjedz4jXV7wWVlso2Y33vDGv4feZveYpvPHKjJBKUkNPfA2iVGqMz+eC
	 aqXaXQwyH3P2/bw3Rbx74XU5owklDOhbyZIbDUcWxoNegi4rgehJ9Xdt1o2zkQnhcxQX4
	 jLO1t/c2uRogLGPGQEorwUYSjEKfHMCY7mgOL6dw2QqIKuED3+C3UMCKcGitB0HxSCw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=pm.me;
	spf=pass smtp.mailfrom=pm.me;
	dkim=pass header.d=pm.me header.i=@pm.me header.a=rsa-sha256 header.s=protonmail3 header.b=mAJk9qXe;
	arc=none smtp.remote-ip=109.224.244.16
Received: from mail-24416.protonmail.ch (mail-24416.protonmail.ch [109.224.244.16])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C20060A2604
	for <arm-scmi@vger.kernel.org>; Wed, 11 Nov 2026 03:05:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9C20060A2604
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pm.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.a=rsa-sha256 header.s=protonmail3 header.b=mAJk9qXe
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pm.me;
	s=protonmail3; t=1794366339; x=1794625539;
	bh=uMTNYUkii6qLQJ9ZEEqnYSkjnjc4c5VnVsIGkdlEd14=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=mAJk9qXef5Dg92eNFgL1RRe5OnKLf1i0HsXA+8ARikr6+LWggcz8YnnZ0V5PncB/t
	 Ojz8P7QUm+rYOjpXVaXOBSXbULCSXHtp8DZFqLMZ/sQenvK1IonhyF3/cUdqIAnvVS
	 8+O+JPUmuhPnDxxe9oBKZbhEKkEh6+v1bVQ8UHsG6ur5t0UsRPKiTHkYNxRTlBxC/p
	 TtePKLvBY0Bu+YbefdTscuwyWQmglSmWFHFbiaQUptV8Qn+zHzGG1TqazMQQ5t2wqT
	 0ZAm0lJWuakoyuB2b8ydv+poW7XTlRIthyO3ZgNh1VVTu78b/8C0BsFhvM/OMGW5Y/
	 d25vK0KqGLdwA==
Date: Wed, 11 Nov 2026 03:05:33 +0000
To: Pragnesh Papaniya <pragnesh.papaniya@oss.qualcomm.com>, Sibi Sankar <sibi.sankar@oss.qualcomm.com>
From: Birk Skyum <birk.skyum@pm.me>
Cc: sudeep.holla@kernel.org, cristian.marussi@arm.com, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, myungjoo.ham@samsung.com, kyungmin.park@samsung.com, cw00.choi@samsung.com, digetx@gmail.com, thierry.reding@kernel.org, jonathanh@nvidia.com, andersson@kernel.org, konradybcio@kernel.org, rajendra.nayak@oss.qualcomm.com, pankaj.patil@oss.qualcomm.com, linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-pm@vger.kernel.org, linux-tegra@vger.kernel.org
Subject: Re: [PATCH RFC 09/10] arm64: dts: qcom: hamoa: Enable LLCC/DDR/DDR_QOS DVFS
Message-ID: <179436632843.48104.13255943696510307622@pm.me>
In-Reply-To: <20260724-rfc_v8_scmi_memlat-v1-9-cb732bcff1f4@oss.qualcomm.com>
References: <20260724-rfc_v8_scmi_memlat-v1-0-cb732bcff1f4@oss.qualcomm.com> <20260724-rfc_v8_scmi_memlat-v1-9-cb732bcff1f4@oss.qualcomm.com>
Feedback-ID: 21326998:user:proton
X-Pm-Message-ID: 4df2f6e52051d98663eb4d196577dc26e996a70d
X-Mailing-List: arm-scmi@vger.kernel.org
List-Id: <arm-scmi.vger.kernel.org>
List-Post: <mailto:arm-scmi@vger.kernel.org>
List-Help: <mailto:arm-scmi+help@vger.kernel.org>
List-Subscribe: <mailto:arm-scmi+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:arm-scmi+unsubscribe@vger.kernel.org>
List-Owner: <mailto:arm-scmi+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Hi Pragnesh, Sibi,

I tried this on a Lenovo Yoga Slim 7x (X1E80100, 83ED, firmware
NHCN62WW) running 7.3 with patches 1-8 of this series and the
protocol@80 node from this patch added to the board's DTB.

Memlat probes, and the ddr, llcc and ddr-qos devfreq devices come up
under the remote governor. CPU read bandwidth goes from about 51 GB/s
to 117 GB/s with six threads, and suspend and resume work.

Under GPU load it isn't stable here, though. I ran Speedometer 3.1 in
Chrome twice with memlat active:

- The first time the run finished, but after a warm reboot into a
  kernel whose DTB lacks protocol@80, the GPU never came up:

  adreno_gmu 3d6a000.gmu: [drm:a6xx_hfi_wait_for_msg_interrupt [msm]] *ERRO=
R* Message HFI_H2F_MSG_GX_BW_PERF_VOTE id 34 timed out waiting for response
  adreno_gmu 3d6a000.gmu: [drm:a6xx_gmu_set_oob [msm]] *ERROR* Timeout wait=
ing for GMU OOB set GPU_SET: 0x4

  A cold boot of the same kernel was fine.

- The second time the machine reset partway through the run, with
  nothing in pstore.

Four runs without the GPU load (a CPU bandwidth test, with and without
a suspend), each followed by the same warm reboot, were clean, as were
about ten boots without memlat.

Separately, the memlat driver sends MEMLAT_STOP_TIMER only from its
.remove callback, and the SCMI bus has no shutdown hook, so on a
reboot the monitors keep running on the CPUCP into whatever boots
next. That would fit the first failure if the GMU's GX bandwidth votes
and the CPUCP's DDR votes get in each other's way. Would it make sense
to stop the timers from a reboot notifier as well?

I'm happy to test a follow-up on this machine.

Thanks,
Birk


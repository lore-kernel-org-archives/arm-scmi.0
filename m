Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795222572;
	b=zuqX+xywPSiAuvm4KH6T55OGDcUY+3CLjX1FE40H3Ljl+G9cPWdUKdNaBeAQe+KkZhWc
	 AnIwSv/Kr6L8p20LexB5bRUsYPizbPrO89InHJQhNC862kcPX6UljkjZVOR4+VYQv0QWA
	 L0Ii7GiCmZyH95GG7WakaMFgvuimQhBx0rHc/x4V4OD+odPTMaBckwJR7A5HqESh14MsR
	 SnVnP1RcLRaR1uMB4JKd+J2UcCKycjcM414PtQfiPZlG2fJ8NpJgZQdCHWTwrblR2pRua
	 WQOpzR92jaxxWEKgNN7xmpThlyJ8i5bBLOFzwBKDYJGAlvdX8ZiphHQk4tqZIzKsxdA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795222572;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=i3GTOPnQyWclBIu+6MA2Oe59A19a3zhTv3uiRFaf8C0=;
	b=xov5QEMS66pcUc4qx4E1wyVzCoS3CyU0S5EocUphffGScXkXd0UHpgkGPB0Ryr49WC0h
	 0WxyYaJu0qq2VdAjCW+XwWD8cY2qAqf3K3X1FhrSpsyiZ9G39cKqzhmDjkQ37iYQPpQHC
	 hZminstkctGClNjVne9iA9Lp8LuhUM8747NbAgj0PKcVGNfKkuVqOZB++S+lvKzT3XSy7
	 Qq1MDBS/swEVcKbrejI3Bn/97ywvuYhLERmazHJtQ5+KM3IuC/HB8aklCoIqcjSfcWksJ
	 6c0W6UNq9lErXo9GKODFgJC+eRKgd1TivFVKbX9475wy3UvfQSEL9FUOeHlpFMGzuLg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ofGMIfmj;
	arc=none smtp.remote-ip=209.85.128.51
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 211C7606A68C
	for <arm-scmi@vger.kernel.org>; Sat, 21 Nov 2026 00:56:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 211C7606A68C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ofGMIfmj
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4bb6c7b6dbdso14185815e9.0
        for <arm-scmi@vger.kernel.org>; Fri, 20 Nov 2026 16:56:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795222567; x=1795827367; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=i3GTOPnQyWclBIu+6MA2Oe59A19a3zhTv3uiRFaf8C0=;
        b=ofGMIfmjUmPZDpbiK6zzZMK5vFaD59tJ4YjxAYXxfl+KJD+gDOdi0nIWE0DDLYzNPV
         NSpufJVrv1sdgw/vRTDF8nkZ5Qg42Lfw0TxabFiDMmhTaD3/tFkPGKnDindJHhv6+thi
         Rt+50uQUnNYolC3Rpj/0VvgeXe3p0nK6MmOYK3bHcGVoTDFC5v2BGfKFabtqnuRaFNog
         7nkJhKDchbITOleWddiXZWAC7aRJC/qc8DqfjmCH99H+TSiinqLsDKCvoaDPLUqykw0B
         KCwlK4+nBTVzCxX3d9uS+xWfQyAY+uhuLZ2RLiXwKH608nOKEmEq7m2f3xZJqgMELpbb
         UVfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795222567; x=1795827367;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=i3GTOPnQyWclBIu+6MA2Oe59A19a3zhTv3uiRFaf8C0=;
        b=2LtyMnIvb1c5CqawYtfR84d5ZQjOZZzCv5VnYUSHlQeypRRyBYgEK36xPZ/EVz9a3j
         IaI0htss0MvfNp/J2iVBchAOOjeLCZq4uXqmHPobANvlfjBSo1q1zcPnC4QQdeqrAMTH
         sN8vlhin9It/VVVSLGIJ8I2MsAZCOUX8vFbBhiPSbSc5Gsu63Zk9dUCe4d3y6OAudPa+
         TQRQ2mXJp84qGve594qxnMQT3Uqs1de+dNd/uI9OS3AKaFRdRmTnjRsmE4hezTF6VsW8
         PdqlZ2hZd3M6YjZsncNHvbIbtDcYnG0wHZptnrxRl1di0TbmZUVJtBAnHZbjvjMFsuP4
         SZ5g==
X-Forwarded-Encrypted: i=1; AL+hErFwiLgRWEWkhXsfGQ2ApWBwyhk/oZsuEMSV1Qh9wLUiXTt5duDQmIlfhcBOuCgLtnqnF+H4qrFliw==@vger.kernel.org
X-Gm-Message-State: APuU4Z/P7xSw8QnwUNzGOJ1Bt7YZaFxwum+9V9t3OcIpnGTfYvg891fL
	wgxcaBWJR9VPHcIIOI76wHsK0N/cR4VYUbTzXFahcTOzqDBp6oKVzjIl
X-Gm-Gg: AYBFou0vSASaNQAKikh+Kc3J/aw3MzqMPI9z2hwOM3qAItcY8j2tm3X8ZZ0w91R/jtV
	BeV5UMzwTmDrPXmUhaG1krFjPWb4JjJaVjTfbwDQ3HFIzu9zXNmQOIHtG/0duVlFedsmsBAuw4t
	f4n+lBo6P+s5vw+t3Xb9L1AuyU2lVtjankq0ruFhIlIQAgZAEnYzo9rWZ35EUZTN00DMeeEPA3q
	sOEujeBgNvNF02IESg55nmzFUYt+C7alRbZ4erXotPT5OZvt/OBZ4ut0VXn7pzagkbx0iXNt/x3
	24z9DoXAuBg5j+Ls4VOZE0FyISKFwThLKtraYEyZZcUtqpxv9kA07D9BNU1QOh+3iRBJlrdUJ24
	s+difmr3S2wG6/YjmAfMG+frsinqEafj+aKZWM6sWpB21Fo1QizTPwg1CsQA6JJ0WF4MjLkMq3N
	rDQ7hbtre5edlmXydIhJtYBJyiCsFOi+CueEfV9dZri4xPreft+mHiEznvSk3mZvX3yEzpt7eqb
	nRkUn3AcbUtcvw5DwwVowTKmvWxk7nrCtyDyW5xbCX0rUZTNRS0VJ0vg656v0TrShcPnBKW9N1R
	Ai4gyHz6Pg5guNkrBzs57yN1mNtgrJJPhh9IfiXKJaUCjgWSotyqKxzvN5Q9+0IHhIUjx52mbkr
	ew+tO
X-Received: by 2002:a05:600c:8184:b0:4a3:5a7b:6002 with SMTP id 5b1f17b1804b1-4bb8881e969mr101042085e9.28.1795222567564;
        Fri, 20 Nov 2026 16:56:07 -0800 (PST)
Received: from [192.168.1.15] ([185.69.144.65])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb8538b2c5sm152290885e9.5.2026.11.20.16.56.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 16:56:07 -0800 (PST)
From: Dale Whinham <daleyo@gmail.com>
Date: Sat, 21 Nov 2026 00:56:02 +0000
Subject: [PATCH] firmware: arm_scmi: Don't mark OPPs as turbo without a
 sustained frequency
X-Mailing-List: arm-scmi@vger.kernel.org
List-Id: <arm-scmi.vger.kernel.org>
List-Post: <mailto:arm-scmi@vger.kernel.org>
List-Help: <mailto:arm-scmi+help@vger.kernel.org>
List-Subscribe: <mailto:arm-scmi+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:arm-scmi+unsubscribe@vger.kernel.org>
List-Owner: <mailto:arm-scmi+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261121-sp11-noturbo-v1-1-37e1083cec5b@gmail.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMMQ6DMAxG4asgz0SqDerQqyAGEn5ad0hQDAgJc
 XdSOn7DewcZssLoVR2UsalpigVcVxQ+Q3zD6VhM8pAns7CzmdnFtKzZJ+cRRogENNxSSeaMSfd
 71/V/2+q/CMvvQed5Abh+Od5wAAAA
X-Change-ID: 20261121-sp11-noturbo-becde22ce314
To: Sudeep Holla <sudeep.holla@kernel.org>, 
 Cristian Marussi <cristian.marussi@arm.com>, 
 Viresh Kumar <viresh.kumar@linaro.org>, 
 Sibi Sankar <sibi.sankar@oss.qualcomm.com>, Dhruva Gole <d-gole@ti.com>
Cc: Haipeng Lin <jimmie.lin@gmail.com>, arm-scmi@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 stable@vger.kernel.org, Dale Whinham <daleyo@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795222566; l=2027;
 i=daleyo@gmail.com; s=20251214; h=from:subject:message-id;
 bh=zMtLMtQ+dyPR6vWexg5Efr75uQzulLUBjfV4ysHWXLI=;
 b=/0FvWqPNrFnVvgEwryZLXaamwpG38yrLu4Qie4Ux5eNj5z8zCxsJo8BFsvWf6INyW31eItzll
 jyRFhEZ4DfrCE7Lnvk3W36ChLSg6Ia9sphAiI9nIjeD6SMTLbxVZlRk
X-Developer-Key: i=daleyo@gmail.com; a=ed25519;
 pk=M4mvgx1TB2TniKaedTDsO3PbLKgFosJuegXRXPbn2Ds=

If the firmware reports a sustained frequency of 0, every OPP is marked
as turbo. With boost disabled, cpufreq then has no usable frequencies and
fails to create a policy for the domain.

The Surface Pro 11 (X1P64100) CPUCP firmware does this for the two
clusters that have a core fused off.

Treat 0 as "not provided" and don't mark any OPPs as turbo.

Fixes: a897575e79d7 ("firmware: arm_scmi: Add support for marking certain frequencies as turbo")
Cc: stable@vger.kernel.org
Tested-by: Haipeng Lin <jimmie.lin@gmail.com>
Signed-off-by: Dale Whinham <daleyo@gmail.com>
---
From decompiling the CPUCP firmware: it reports as sustained the first
LUT entry rated for exactly the cluster's fused core count, or 0 if
there is none. On X1P64100, clusters 1 and 2 have 3 cores but only
4-core LUT entries, so they get 0. X1E80100 reports non-zero values and
is unaffected.
---
 drivers/firmware/arm_scmi/perf.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/drivers/firmware/arm_scmi/perf.c b/drivers/firmware/arm_scmi/perf.c
index 0116ffb2b279..d4394984a0f5 100644
--- a/drivers/firmware/arm_scmi/perf.c
+++ b/drivers/firmware/arm_scmi/perf.c
@@ -879,8 +879,13 @@ static int scmi_dvfs_device_opps_add(const struct scmi_protocol_handle *ph,
 		else
 			freq = dom->opp[idx].indicative_freq * dom->mult_factor;
 
-		/* All OPPs above the sustained frequency are treated as turbo */
-		data.turbo = freq > dom->sustained_freq_khz * 1000UL;
+		/*
+		 * All OPPs above the sustained frequency are treated as turbo.
+		 * A sustained frequency of 0 means the firmware didn't provide
+		 * one, so don't mark anything as turbo in that case.
+		 */
+		data.turbo = dom->sustained_freq_khz &&
+			     freq > dom->sustained_freq_khz * 1000UL;
 
 		data.level = dom->opp[idx].perf;
 		data.freq = freq;

---
base-commit: aebb7274476403040d582c61478df8f4a7bf9cd3
change-id: 20261121-sp11-noturbo-becde22ce314

Best regards,
--  
Dale Whinham <daleyo@gmail.com>


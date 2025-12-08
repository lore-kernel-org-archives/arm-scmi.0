Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B22E02ED16B
	for <arm-scmi@vger.kernel.org>; Mon,  8 Dec 2025 02:09:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765159761; cv=none; b=QO0CdEhO/1SEYtNoqjEVnZLJRe41PTdsMvyF2C/vWed7uiPAikaB+zHTAeLqpMyxOF+Ot+kZoZ8G90lmZlc0cI9vK4OcKVvTr+uVpo/yeQZG1Vy9f0+9aQr3M4ojPnZtxHbdvC/weoBIRbSL4rs/SUHmF1B2nOlJ2Xy45eLeuHw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765159761; c=relaxed/simple;
	bh=6yRJxC7IlUvXmP61EM44dgOk28FMi/N4dd0IPIqh/gI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=WIfUT1gnv5UMOyNnLNveM8M+JM0Mo6TwdjVdF6/7303Fs6RJflrW1hTqSrmRTFUzT3eE/Av8cN5Wlko5+A7txgfqRTeCPExiyjdLtqha1iqEuyPispGc+d+0NJoMyHTTd1qSYUz+IBx/dTd4NOLi/H4zo3Ubwim0DTtR+qc4u5c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=nRe4253X; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=RFDCCYOJ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="nRe4253X";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="RFDCCYOJ"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5B7MRG9e3423126
	for <arm-scmi@vger.kernel.org>; Mon, 8 Dec 2025 02:09:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=kIxJHveJ43O
	Rw/a2qSJOZSHCa20m7AbfTGH30DPRWSY=; b=nRe4253X+m9PPH61/hZsdvJAxjW
	Ux6GcQpwt/rbmNEpWYyNclztFmysY0MS9x9s4mEaLS3S+fNktF8zC0qFYSf3RTm3
	GKIhhOPT8fDWr1w19gEoAo/sfGrAc8w1S309WhvKfVNUQMsSvNw+eLX4s8Rzk0z4
	8bAKWMtXnoHoGXLh6LJcvOjWitFrj4zRnpYBwoa68tavIABesNFLBkaVbId4EprR
	znY8RQyRerkrUBn0d3mZwfuNLEPQIcnwNtHIwsVzrodkSJ64cn+El4hAPcwCp6J4
	I/XEnLjMbgRyYNJ0OXHnq3t7wXXGTrsZ51jCO4RzG4dEiqD0e8DRX7we81g==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4avcjvb991-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <arm-scmi@vger.kernel.org>; Mon, 08 Dec 2025 02:09:18 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-295595cd102so74909015ad.3
        for <arm-scmi@vger.kernel.org>; Sun, 07 Dec 2025 18:09:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1765159758; x=1765764558; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kIxJHveJ43ORw/a2qSJOZSHCa20m7AbfTGH30DPRWSY=;
        b=RFDCCYOJCy4eOTVCIKRvY3ElYUhG/W1fMSZ7PsL30hTYAVLU2C70VbRInnFLP9rMXv
         RTVQd7bYQPGFl8cnsDm5u3ZIatARiXLkEUEodsw/ASjZeLb2OorBIqa5+AlQ3UL5ID8a
         tfUkdAj6956r6+7PAjnTkVJNKVfWW+wXlCdjRJeosTWOhTl/8wM8nF8XrMrTzH6w81Z5
         OO241puEmHMUHFX2TktTJwwGnvZt8NpzFP8J0mpwkVvJsiNEMFQRGRVBJYBiGfDFqA+0
         7dhsdTlNqgJxV5O8z1oB/VaobNyIzzMGmXM/ZMOUyM6tkIqSImDp4YES9I0RhAFopTxd
         MdEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765159758; x=1765764558;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=kIxJHveJ43ORw/a2qSJOZSHCa20m7AbfTGH30DPRWSY=;
        b=RIjn3kdjYL8h/sHV1nwN74lmUwExljn5aOCO88BhkeXwMGRcbkTVcYESlf54H+CJ/I
         qbpvDYHBXPKkKJh8fcklU3Jcqhmb/nds4TstXJiM7PVWZjdwP8FzZO7T25/af3sWlMoH
         Y8PfhYuumZV/fBdiKvSWsgrE7vU1V7UidqXcoz4pqKzIjLNZfVrOOWr5A0/dMu1tQ2Eb
         MDZBvjGva5TYbXgdnXF7WGnQPLVJDszDvpSqJVQD5FBLf6TIYOXH3r635nd7GCc8HnSH
         xKOvpZWW+BSXs4GYmJpD6T84v4Qrka5nPyREIX8YMdGkPgo8dyB7xCdMh2ylGDcfo/uF
         UwFA==
X-Forwarded-Encrypted: i=1; AJvYcCU8H8q/faa0kwyB75lYEZZW/VWPc+J2AyXWd2Z1GOvLzpyCLCL5pL15wCm1h7FeoYgz24wIOwtTHw==@vger.kernel.org
X-Gm-Message-State: AOJu0YxGpKHE26SFcOr0E2a+qGYJ126pIkOF6Vlt+4LMhKlmNeH9QJx4
	u8+aGwyOvAqO/L4wfBDl29JOSIiXT0WZ5tQDO0SOMRlyUUwdOVPf5GV7Ln0b05RGZyfol9xJoaD
	OE8pkIHqHiiHI1LJ17wFYqJSIHz+64UurOQ6UZygWGkkyajgb3sJn83Vne8dGtA==
X-Gm-Gg: ASbGncu441teBkjrP5cM5P+y/KAxrWRc8yqvY2iHoXrCw+5GaQ4VCvQDA3hU0xz0tMO
	QCLuWpmKgFd8RrCHglKcwYCNE0d6oRpsS0SzV3uZNrHGlnZ1h/aYn9g2LC8u09NvjA7LseEIX8i
	KLvm5fVZ00Hnd8eAzErdsmtH7ZMhvXVuRhZhk9RwZchVYqz08Xz+3P/7tc2mB5vXda6Jae9yWY5
	OvYIxFm5XK1BfytgJ/lVrSKs07E7ka0N3Zdccv7RY7WODOYl5E+vGhmEGeonabeL/Ku2stI5o8O
	EYJFeOo6dsVGr9UAwgdmBsRTXcZck6JP4MZDEGc+1d6H7EFTLyg2cbuBfmUDaBBY3/43Pp/HNNo
	J0qPUIVFNxei1kAqq2RtgMv6W+4LtOx92jmZo6xjyAaGwSNGgzdCkEAVk
X-Received: by 2002:a17:903:2f91:b0:295:745a:8016 with SMTP id d9443c01a7336-29df5676d56mr54513805ad.11.1765159757642;
        Sun, 07 Dec 2025 18:09:17 -0800 (PST)
X-Google-Smtp-Source: AGHT+IENSDeJBY4zviQImrpnarZvkPxNzeZekd06zEmZ+O5Ue8s5qwUKtOx7iGg12/FzdgPwxpsKBQ==
X-Received: by 2002:a17:903:2f91:b0:295:745a:8016 with SMTP id d9443c01a7336-29df5676d56mr54513565ad.11.1765159757194;
        Sun, 07 Dec 2025 18:09:17 -0800 (PST)
Received: from quoll (fs98a57d9d.tkyc007.ap.nuro.jp. [152.165.125.157])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29daeae2552sm105933945ad.88.2025.12.07.18.09.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 Dec 2025 18:09:16 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
To: Sudeep Holla <sudeep.holla@arm.com>,
        Cristian Marussi <cristian.marussi@arm.com>,
        Simon Trimmer <simont@opensource.cirrus.com>,
        Charles Keepax <ckeepax@opensource.cirrus.com>,
        Richard Fitzgerald <rf@opensource.cirrus.com>,
        arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, patches@opensource.cirrus.com
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH 2/2] firmware: cirrus: Fix confusing cleanup.h syntax
Date: Mon,  8 Dec 2025 03:09:09 +0100
Message-ID: <20251208020907.5476-4-krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251208020907.5476-3-krzysztof.kozlowski@oss.qualcomm.com>
References: <20251208020907.5476-3-krzysztof.kozlowski@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: arm-scmi@vger.kernel.org
List-Id: <arm-scmi.vger.kernel.org>
List-Subscribe: <mailto:arm-scmi+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:arm-scmi+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1484; i=krzysztof.kozlowski@oss.qualcomm.com;
 h=from:subject; bh=6yRJxC7IlUvXmP61EM44dgOk28FMi/N4dd0IPIqh/gI=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpNjNEAr7khnPipEGOjI2elkT/JnWui7m5ssgr9
 TeFAq3fDW6JAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaTYzRAAKCRDBN2bmhouD
 16nmD/oCYgq1qa5I1ugGeS4GNxewBc32IfFr1Eb0nzgK5U6WUwWoqOm7ZwjNShAa1AZmSS3ns+b
 8Kn6RWcT7rbma/f4La1T4dzPyaGIVcFvS1hjL1wGW3VEw713q1ilnO2Lf1+hbnPMVRhCAwknYS/
 9GIoZY2sb5CL9NDKbxoF+iupux9evaxpLVSjk4a4Qo2fs7PnCz8lG36G3GxgKWJxEK7Rqw+hizi
 4lwWzyTf2IgQ/2mGNdRRNQLyrQ82BL/MacHYHqtGV9+uxXCfNMYvXe2FgeQ+QKcEIgenzuxE4Q5
 QkWfbjUO//8f3Y7wD6aODLbFYafFZ4jyOUq2KqDgdBMFu2Yqx4WSnTmXhDp+UwTh6SCkMzhjbkl
 7R7hIQp5L8tvgWGXmrAYpJCLA8VV53VsvnB/X+kcycpH65aXpHf3KKoLmjxjNTmD+poxqsnHROe
 JhxBTT0K8s5clCEi29uds8eLiXDP4YYs/KHymootkEXkOlBAhKn2Jfp+yuavGFUiuIu6JlwcJCQ
 whMlYTxSr++Y0urUHWoIJ2TkDK6LSj9u4yldAu+tXawnx3b1OR4pZ2l2ycQWiu2CtFAikcXbtfS
 nHr9wg301kbV6R7Q8AyttLdRunKbyV5N0jGY1v/Ov6ReYu0n94sxrhjfhA7y5B1HPHDaTJ0VZMi j768YUd5L7aKZ2Q==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=Dccaa/tW c=1 sm=1 tr=0 ts=6936334e cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=vTE1kzb4AqIx7XBf0Bkr0A==:17
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=UT6wT1bYNktT3YwyLxwA:9 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjA4MDAxNiBTYWx0ZWRfX2JNQ7iny2gnK
 YFEQNLn+G/xmrmVmZj7993/bJT2pkLKDJJj9tt1uGuSnOUuImE9obkY3obqcvVX6JEQQkaxTI1f
 E9pkjLRgveQvUpQYvm2j6Koupkh+Srv95HqtwKHfRifYbRtoZr8E4/VFbHbhdJ87WZ81ikDkxjX
 oFQjkoE84LD1KIK2bryotPC+vTi9Zo3ZEJMJGot2XtskiY4CdNc2+r+6+C8a3T1zen1DpfS3/S1
 MN7BWNJGATa6cYEvA3jIOShrWQdkoonb+2K1GPj+AAZGbhD4kzQ8KBUH9xGCZK6MohkYvFWEL2X
 MWcDwhQRpJpYgQTR/38V7HtvMa4i29uv8xE/ZoSYNZanto6tmwSh/3Wk35nppUHIlCfKxnXqmjH
 ZLXwwH6b0RnoeekeexZ9DmQFH6seBw==
X-Proofpoint-ORIG-GUID: _xy6Eireg7Jjy3_42UM4r_zVmugDICFS
X-Proofpoint-GUID: _xy6Eireg7Jjy3_42UM4r_zVmugDICFS
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-06_02,2025-12-04_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 impostorscore=0 suspectscore=0 clxscore=1011 malwarescore=0
 lowpriorityscore=0 priorityscore=1501 adultscore=0 phishscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512080016

Initializing automatic __free variables to NULL without need (e.g.
branches with different allocations), followed by actual allocation is
in contrary to explicit coding rules guiding cleanup.h:

"Given that the "__free(...) = NULL" pattern for variables defined at
the top of the function poses this potential interdependency problem the
recommendation is to always define and assign variables in one statement
and not group variable definitions at the top of the function when
__free() is used."

Code does not have a bug, but is less readable and uses discouraged
coding practice, so fix that by moving declaration to the place of
assignment.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 drivers/firmware/cirrus/cs_dsp.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/firmware/cirrus/cs_dsp.c b/drivers/firmware/cirrus/cs_dsp.c
index 525ac0f0a75d..86d49dbc6fa6 100644
--- a/drivers/firmware/cirrus/cs_dsp.c
+++ b/drivers/firmware/cirrus/cs_dsp.c
@@ -375,13 +375,11 @@ static ssize_t cs_dsp_debugfs_string_read(struct cs_dsp *dsp,
 					  size_t count, loff_t *ppos,
 					  const char **pstr)
 {
-	const char *str __free(kfree) = NULL;
-
 	scoped_guard(mutex, &dsp->pwr_lock) {
 		if (!*pstr)
 			return 0;
 
-		str = kasprintf(GFP_KERNEL, "%s\n", *pstr);
+		const char *str __free(kfree) = kasprintf(GFP_KERNEL, "%s\n", *pstr);
 		if (!str)
 			return -ENOMEM;
 
-- 
2.51.0


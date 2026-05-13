Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADF7A47DFB3
	for <arm-scmi@vger.kernel.org>; Wed, 13 May 2026 17:17:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778692638; cv=none; b=Qy3p5SYo9kS8KGYjf+/Oayu+jM5+r53q1twZN0SbmyU088w0xm+tNGhwlhzZXrwg5u7/6RxyaeztBwc9JCTuQHF+f1ZBwHe+3gXNkk5HatcEc2ccoGbR9biob4Icev+qjFcmcmHrl+O9EE4pGjmrw/D4l0b7f8YUivFIxaozDr0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778692638; c=relaxed/simple;
	bh=O7ZY1AdiQuRGIWpyaBs7jFB0+sTG7KoUgEQpHyRFuKM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=elZTK5jOmi+gXJYCwuCi13tkbpeXdqOhm6N8/OfPchtAQJp+s5aYVsztxZLvJbv6uEIshNcwwDPQ2fLi1gmMZbcjW3iDc8OVBEsy/tnS8B4I46YF5hKadbCj3tQgcpCgVx4SMJ94h+nT4D0zM1FplGh2GUjr+lFekon57XRW2OQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=a/Ber0gZ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=aTGc/y5R; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="a/Ber0gZ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="aTGc/y5R"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64DF32be2887841
	for <arm-scmi@vger.kernel.org>; Wed, 13 May 2026 17:17:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	mphgcl1+U0NC2VWtzWc6ce3S3u0PqqqNtDbXw6C9h80=; b=a/Ber0gZAjGFbcyA
	DcLnT3cvWA0zHeuNw4CkdOV9sEaTHQ/CC5QhPsSiBi0HD/gY+hUW42xDhJmRWHr6
	DK7/4Qt+fclHFLvyZXWSuA23qblGmuo8QNq7M0vhEkaF9NZCBHKAKdreKyf4tpep
	9YZEw+OxxdKy8jFsPUIQhmdBlueZ1UXJCZ+aL8DByt4dO3SgGrp51ypjJfQS9qiy
	iGGcIlr2wWoqGp3TnDLw/f5mpt5kgXvR76/zbPTo63RfRtrPH1v3fPErVKt07jtH
	seb8k8GGNF4ttDv15ylzVPG/Yt6I1fkP/N147zI5Wl7OIHVQL/vxs111nUqC3pv9
	Y8hhEg==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e4p4gj1nr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <arm-scmi@vger.kernel.org>; Wed, 13 May 2026 17:17:05 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-2ee5b73c5f2so14226710eec.0
        for <arm-scmi@vger.kernel.org>; Wed, 13 May 2026 10:17:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778692625; x=1779297425; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mphgcl1+U0NC2VWtzWc6ce3S3u0PqqqNtDbXw6C9h80=;
        b=aTGc/y5RfbNYvSnddW4ZatQyEy/Z2ZfzC6xyzHkm9VFfOUsi6tdubGOpoICmSz06TA
         py8zTZuMdlVtwCyFF1JW9V38Gy9pd9fa0ofR8FhIYzg/Y8nHkuyVu/iAQ0B7b+0SkJac
         DrCQzUL/KX4aFUK/xF3VjdUFbh7LGEPHsEkQuKTzpaAvZOGqFpFjYkS99mG5HoMnjtSu
         dI9FVrhxQVpw5PBqJf+fwL9zSfYahLjY0K3OAKMTquEt5i9EkoS9S/KMkQ6cAhAhfYEK
         YIU+RpHZltw348Tj4jadh2RKdQ3XaWsRaelvKbt1hqIk92lOewjWfC6uvV6EQrJV7vBr
         ZPRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778692625; x=1779297425;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=mphgcl1+U0NC2VWtzWc6ce3S3u0PqqqNtDbXw6C9h80=;
        b=dTfN8pgwcTtCZK/Ovo1oDSJOvOnBcjygr1U2NtarIGaCDamED/1132PEkH5HRPyxKU
         WYoGEobMM9Lx07Wogx2wZPgqbbUL0tZsruLnPN+BiQlslqYgnbed86P88jHsipdzsyOK
         emgp4rBtT9U+MrM3y55IqF1od6Nw0b1OP3wha/kwFOVEMJ3nEsmpA2mJvxlSFVeyjS3C
         ZBRSVwASpO4eSjLiTXi7OEUeqbzYS+CgHVU0Awbxh6lKAK1WHDDr0xSyRZPUR+y1P6a4
         NHW8mWTY6MZgRSuqREYqWxxv4rviw02nxdf/mVSSD1mRjxpmzE9yDV4AYyBMD2iOOYjG
         WoDw==
X-Forwarded-Encrypted: i=1; AFNElJ8/nuCZUX123dfqslpruVAQYWSiT1AfrCgbL61Tn+D8yOC3vVvHOw/gyBlWUTtzFHlRkaXFDb/UZg==@vger.kernel.org
X-Gm-Message-State: AOJu0YwGZZZ+wR5pqi72yphga618s1nPgWK95RelOx3+9RYTKX/+m4AX
	EtiORVpDO7W5LcXZqS2qjGIcAZDLiMnUlrSofQ6a9n5yIi7UWagrXIsjkovsZW75K+6PxdFH5fp
	RM2lybbd7WB+w36LBL0o+QFrtRhknalyXUmyIx9xfwJ2iQC7HdjTYPIA1lJDSlQ==
X-Gm-Gg: Acq92OH8Woik+ZjSyPKdyb8bDMVWoiA1hGZQX5xnle1GkZKOGAnx78wZwtmJ4iNvj+s
	KGYAMD6E1NQ/4lKxnVKgbSlwHaQmVkFpFJ6RkWMQMYXcbf4HNGS21YZJo7XxjI1XJNWFEHnUeIv
	ysVoVfi/ZJn836mqA3OJBBQ/ZwY/eDY1gP0sB0LWCCydNZddRT1eZo/akpOn/zllZvKymJ3U9rl
	kOHBIlf/UwJQhbQRQB/z4O/YHIkg1T5sPPw+QZ6u3Hk4nGfnotHnOeStubNcaYZ0m3hWzl1DQ1i
	y9mse+De0z1bBg7IlEIiaW6zIMV7mO5pv3cmAzl4wUS0fjzgCsqu0g3NBi6zjsTrn/YOJymOb55
	dN5gvDEoqCH9gCto5DWsFS0ChpTd8E6abQRs5KwMOPLHmVgQHh6ghTFSpSTkpwoKyVJ2a/yqgga
	7zEO0J+w==
X-Received: by 2002:a05:7300:d706:b0:2f1:6252:f8ef with SMTP id 5a478bee46e88-30116f8cbdfmr2657874eec.1.1778692624710;
        Wed, 13 May 2026 10:17:04 -0700 (PDT)
X-Received: by 2002:a05:7300:d706:b0:2f1:6252:f8ef with SMTP id 5a478bee46e88-30116f8cbdfmr2657833eec.1.1778692624174;
        Wed, 13 May 2026 10:17:04 -0700 (PDT)
Received: from hu-aletran-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2f888d3af4esm23075939eec.25.2026.05.13.10.17.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 May 2026 10:17:03 -0700 (PDT)
From: Alex Tran <alex.tran@oss.qualcomm.com>
Date: Wed, 13 May 2026 10:16:57 -0700
Subject: [PATCH v2 4/5] reset: reset-scmi: Log number of reset domains
Precedence: bulk
X-Mailing-List: arm-scmi@vger.kernel.org
List-Id: <arm-scmi.vger.kernel.org>
List-Subscribe: <mailto:arm-scmi+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:arm-scmi+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260513-scmi-client-probe-log-v2-4-36607e9dd540@oss.qualcomm.com>
References: <20260513-scmi-client-probe-log-v2-0-36607e9dd540@oss.qualcomm.com>
In-Reply-To: <20260513-scmi-client-probe-log-v2-0-36607e9dd540@oss.qualcomm.com>
To: Jyoti Bhayana <jbhayana@google.com>, Jonathan Cameron <jic23@kernel.org>,
        David Lechner <dlechner@baylibre.com>,
        =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>,
        Andy Shevchenko <andy@kernel.org>,
        Sudeep Holla <sudeep.holla@kernel.org>,
        Cristian Marussi <cristian.marussi@arm.com>,
        Linus Walleij <linusw@kernel.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Viresh Kumar <viresh.kumar@linaro.org>,
        Guenter Roeck <linux@roeck-us.net>
Cc: linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org,
        arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-gpio@vger.kernel.org, linux-pm@vger.kernel.org,
        linux-hwmon@vger.kernel.org, Alex Tran <alex.tran@oss.qualcomm.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1778692619; l=1390;
 i=alex.tran@oss.qualcomm.com; h=from:subject:message-id;
 bh=O7ZY1AdiQuRGIWpyaBs7jFB0+sTG7KoUgEQpHyRFuKM=;
 b=jxL4jV0oBZIyrWaKzHWraW6cLXO/KQj3WbcU2TE/4/0plegLFbNVGLvl0thcoqS0D2Btudgxl
 UpfJ6sQLaoJDGpSTD2IgN9J/pGAioz38x5frXs1rnPofpkMniCZtxas
X-Developer-Key: i=alex.tran@oss.qualcomm.com; a=ed25519;
 pk=vKab/gw1fXij5UviWoglv+ho+H/oOiTHyETCLfayPE0=
X-Proofpoint-GUID: VEvUeYohh4JdYOURaZr3H2rkVqOnIpuL
X-Authority-Analysis: v=2.4 cv=DOS/JSNb c=1 sm=1 tr=0 ts=6a04b211 cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=wud5Z5ZUIjVBoUaN5zEA:9 a=QEXdDO2ut3YA:10
 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-ORIG-GUID: VEvUeYohh4JdYOURaZr3H2rkVqOnIpuL
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTEzMDE3NCBTYWx0ZWRfXzqigVd1Bovu8
 ClOCtr8wKxKLAGlPwq2+pX6dg5q5e1PmxPhbN+DC2c5jlYgn2mf1JPbP546KE5V9NGwgbhK2QNt
 eJj94nOjtawsuIRUzshzSL3GN3UzLtM5Q83hy5TjETqFxZTz8zmkMwkPv5UwgPNMYG36BAqsF86
 YNTkHVvTaAFgx1Q59AZk8+AGKPJVvPm+kPYTF6dJIdk8Y1hf7irc5ea4DyvqHw5LXJ4tHAOpDOs
 NDJSiI23+aESTW42/DrNS5V/AxsbcX+STnjj5ICH+jyudFEvXcQfZ5LK0FyykWpnbaXGyU/pXE9
 UTpNQjLEYZ4R1mExJfRxMIxYIQnwI0gDi9IF0544Gv48VMoQEAhs7qvOkx+9XhSmLUDGSRz5L/n
 sqQkdPLsGF2D59Zjxouv84PsgZMqqxoPNiDuS1olfyGGge2R9pFQV+JQKXvMmclCmmrRQJ2YVYY
 2ncGyv3n+/kfFPjvnXA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-13_01,2026-05-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 impostorscore=0 bulkscore=0 clxscore=1015
 priorityscore=1501 phishscore=0 suspectscore=0 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605050000 definitions=main-2605130174

The SCMI reset driver does not currently report how many reset domains
were discovered from firmware during probe. This makes it harder to
confirm the firmware reset resources during debugging.

Log the reset domain count after a successful probe, aligning the driver
with the existing SCMI client driver logging pattern.

Signed-off-by: Alex Tran <alex.tran@oss.qualcomm.com>
---
 drivers/reset/reset-scmi.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/drivers/reset/reset-scmi.c b/drivers/reset/reset-scmi.c
index 4335811e0cfa..114470c12931 100644
--- a/drivers/reset/reset-scmi.c
+++ b/drivers/reset/reset-scmi.c
@@ -93,6 +93,7 @@ static int scmi_reset_probe(struct scmi_device *sdev)
 	struct device_node *np = dev->of_node;
 	const struct scmi_handle *handle = sdev->handle;
 	struct scmi_protocol_handle *ph;
+	int ret;
 
 	if (!handle)
 		return -ENODEV;
@@ -111,7 +112,12 @@ static int scmi_reset_probe(struct scmi_device *sdev)
 	data->rcdev.nr_resets = reset_ops->num_domains_get(ph);
 	data->ph = ph;
 
-	return devm_reset_controller_register(dev, &data->rcdev);
+	ret = devm_reset_controller_register(dev, &data->rcdev);
+	if (ret)
+		return ret;
+
+	dev_dbg(dev, "Initialized %d reset domains\n", data->rcdev.nr_resets);
+	return 0;
 }
 
 static const struct scmi_device_id scmi_id_table[] = {

-- 
2.43.0


Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 041635304DF
	for <arm-scmi@vger.kernel.org>; Thu, 15 Oct 2026 12:59:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792069149; cv=none; b=Vt9WT0Rk3dUL0Q1Bcg+K1CvDybfoXUliYEiOrTb6pRmsqg1N9qkJ3JiXV7G3rAi2dNdmNZc/e/11JpE5qxOixBdv1U2TjBVv1/ucPnkrPB+lhcZeag+FF78CeliSFJbjqIro8PUxk3KCqHA5cIqf8Bs1UIxVLhs/4AMoKlHFoHs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792069149; c=relaxed/simple;
	bh=D5hDXPqe2PtFIqZaUJ2ZeOjQJToEsTsjm2AhJE0Nzdk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Cbv7HRAcT+bb9BZ4mawl48/lPZsNPJiwH4hHBftsHyW4vGY0331J7vbKBH8PRehXLmbkwnPVt2aRE+B82zAfssKR6pElxLwEBrjv0rf6h4iQ9cUiPrcPYYuxdiz64QwdMnJX/bK+2zEKGsG2pLI9M22fQXm0hr3V6g/7mUZ30Ms=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=dqQmgL6v; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=db73wnT/; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="dqQmgL6v";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="db73wnT/"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69F9jIvL4077486
	for <arm-scmi@vger.kernel.org>; Thu, 15 Oct 2026 12:59:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	NS2pUTAJCmRHLkgfAwlsRgGb53nRJ44v/R3W8FvO4mI=; b=dqQmgL6vp4PFkhuC
	CS6MnN8QxsWP5+oi+CL+5Ppxaz4VgR15olqIliTcpLSHquVdu11wWamEaJH6X+rJ
	HzrazjJTKFCvmdZvh8csqzLkKmCOBQp5NSHtkqOAzUuODetnSsZ/3+ABPXvy2rHN
	gqObXhNofizvk/gbrmj4ZdvOk09vzjc2nqsBQKBdbsEreJfQ1EuMl4FFjuWrSTq8
	8f1HUkFWJ64sf3o3A0sMe36CJVq6yzqLpWE8h0lymf3YOptc7M5xsfw6LId/IxMW
	ae6qZaW+Cfqp9n4HCpJ6ImhMUnWkQuxGaCYVOLYdeWWnju42jcpUVT06qMDuifuL
	Sezoyg==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4havbc0sqw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <arm-scmi@vger.kernel.org>; Thu, 15 Oct 2026 12:59:07 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2e93f67358eso17930835ad.1
        for <arm-scmi@vger.kernel.org>; Thu, 15 Oct 2026 05:59:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792069147; x=1792673947; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NS2pUTAJCmRHLkgfAwlsRgGb53nRJ44v/R3W8FvO4mI=;
        b=db73wnT/uuP+90kf7sGFPyGPHDHjnNRmNo8Co2twePQA8nH7NNyxPvofLiKrHAoAbF
         D+qecMkPe5oxXw5EavFHD6daPEu5GrOO8DWnwgUgOJmoBjzgi+D/kiFQZvSkH1LuYZ9x
         hczetNS+CKyYbvbSZ1pulgD9Lmq5RynAWRZl3SQfFjg8WkM0l9s3vr07Owf85ByTrUC0
         u1elPmLBIu/I4hy4zyTy5Y7FNr0YP81yqkKQgq3j1YSIDkC2qZDClSGNU/5MX3IKgrAN
         XQ/LOeaLnYPkYhqZ9R4T9JTBZLwPZUoDSoAn1i2K2psQ0Amp2blSgq9LNRkZRqbQwXIG
         qTrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792069147; x=1792673947;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=NS2pUTAJCmRHLkgfAwlsRgGb53nRJ44v/R3W8FvO4mI=;
        b=mipK5zMmQkjxSC1eFaNVemIRee6crPS6twYhP7FMSdR+SKxuhY/qHg3NlMUa8i0NjS
         Y3IiFZELHgJDgg6zfUs0vFbCVxTHUwjG8264V6SBvj8fa8CVH+YmWXi/vIzjhdw5+KAE
         DUhXB7XgqEsT+ABnvD5rgmHxv/wDkzKC6d1ANQrdB5T9ZHMJ7N4TC63Pnl31Mbzjx6Mc
         akjTX5+j1JhMgdeqgzSwr6vl8yE0S/gfe/NJa7Xy/Z/j0o1sMHaG/os5eEshUZ8rAAxv
         6hiGDxnOHsM43xiScg3AalCX1LWigUOM1XaakaF9ygP/WIhVkw3QTXoLn5k4/DYJ9N25
         gOMw==
X-Forwarded-Encrypted: i=1; AKwUvBwH5bs0JHBpuNb+Yh28O9lmsOpmgFoz6xuRXdk8IkUkVi4f67NqeaAb0BNMwcifG39VrNcn83wivQ==@vger.kernel.org
X-Gm-Message-State: AFq9FYIjhBpnARensLlBLph2sVGrNMEDDMPyBS4bkSzlLdDQ7paFSTc+
	egpxwy9ITik37tT8SVDG0K3XpR5ayDLhbLc0h+Ek8xIBGkx+cdSZ7nyP2UVk69vNNrwRHBDDlaE
	5wUUlnmHStb1O1LdgjqsBQr1FcMrP8gwtKd+w2cfWfVdun+QcPB3+2Hclas8G/w==
X-Gm-Gg: AYBFou1v+hisW/Vhb1CvNIohXB+LO/HFQQcUcJhbtXVLrRryG0KGBxaFjLe6d8adgFd
	s6eXlEzKt9HuR0mUbgIr5ParOUsCsY5WZZatSPyUawfMwDDyo7JqTfd3G2454AJLbZaXH7N8jKX
	2hmjusQb3pT3/OoztL3eG+XZ1vWwBkyqvKrHIRWMwFV8Fs+rFaYKcIywqfz0GiBdCtxIvpESwyt
	G9T1qlw/mlHG8J3qEok+LlrFyG+UMT8bZuVoA5CAH8EUVxoLN8pfzKqAN0qNd6ZIuUsoP6jpJFo
	QFltQ2OPln6g2X0OOBd357yX4KydwryVJPn99qdtt9E7jzpo2uzCvUO8NDaG0nlhVSA+FQ11hES
	/qoQkT2Jo92qN41vA+FDSQ58OWoKPzXJZxA==
X-Received: by 2002:a17:903:950:b0:2e6:136e:f264 with SMTP id d9443c01a7336-2e842dfd193mr157615515ad.50.1792069145958;
        Thu, 15 Oct 2026 05:59:05 -0700 (PDT)
X-Received: by 2002:a17:903:950:b0:2e6:136e:f264 with SMTP id d9443c01a7336-2e842dfd193mr157615175ad.50.1792069145289;
        Thu, 15 Oct 2026 05:59:05 -0700 (PDT)
Received: from hu-ptalari-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e8422b8d8dsm79691705ad.52.2026.10.15.05.58.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 05:59:04 -0700 (PDT)
From: Praveen Talari <praveen.talari@oss.qualcomm.com>
Date: Thu, 15 Oct 2026 18:28:24 +0530
Subject: [PATCH v3 4/8] serial: qcom-geni: Use geni_se_set_rate() for
 source clock configuration
Precedence: bulk
X-Mailing-List: arm-scmi@vger.kernel.org
List-Id: <arm-scmi.vger.kernel.org>
List-Subscribe: <mailto:arm-scmi+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:arm-scmi+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261015-derive_clk_perf_tbl_from_perf_domain_opp_table-v3-4-5da1096243c9@oss.qualcomm.com>
References: <20261015-derive_clk_perf_tbl_from_perf_domain_opp_table-v3-0-5da1096243c9@oss.qualcomm.com>
In-Reply-To: <20261015-derive_clk_perf_tbl_from_perf_domain_opp_table-v3-0-5da1096243c9@oss.qualcomm.com>
To: konrad.dybcio@oss.qualcomm.com, Sudeep Holla <sudeep.holla@kernel.org>,
        Cristian Marussi <cristian.marussi@arm.com>,
        Ulf Hansson <ulfh@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jiri Slaby <jirislaby@kernel.org>, Mark Brown <broonie@kernel.org>,
        Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>,
        Andi Shyti <andi.shyti@kernel.org>
Cc: mukesh.savaliya@oss.qualcomm.com, chandana.chiluveru@oss.qualcomm.com,
        arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-serial@vger.kernel.org,
        linux-spi@vger.kernel.org, linux-i2c@vger.kernel.org,
        Praveen Talari <praveen.talari@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792069108; l=4422;
 i=praveen.talari@oss.qualcomm.com; s=20251114; h=from:subject:message-id;
 bh=D5hDXPqe2PtFIqZaUJ2ZeOjQJToEsTsjm2AhJE0Nzdk=;
 b=Q4kkifXtTtFt+/FI1kJOZPyXpAvkQJINudlhQ791bX1hDNv6w8bQVqILWfb0Sqwd3nTpWAdio
 zufOgeYtOUXCyNV78WhYHNUkCWyL9FbCQlPQV+thGdv3SeN3VsB8W0L
X-Developer-Key: i=praveen.talari@oss.qualcomm.com; a=ed25519;
 pk=NGK/88fjyHXgfhIKwag7+uIytOmyOypvZ/hDFaYPEss=
X-Authority-Analysis: v=2.4 cv=QbvzLcbv c=1 sm=1 tr=0 ts=6ad0ce1b cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=_eeGUSGHzPgYkwSUgSAA:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE1MDA1MSBTYWx0ZWRfX/xi8hZSfE/Hh
 5PPXSP9/SrMqHf1Gr75/v9EjePKdJkEFrUUB0GmkJ4Xm0fyj0ViGkLpn5nKA42NLFWksHoGf7wL
 UYkJ6MS6o+UrSs8WFLRV9PcCVWe55WU=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE1MDA1MSBTYWx0ZWRfX1d97qaxIWxGD
 PjA6Zr0L5MINdTWVwPKx+7fl+zciAEUiPJNuq2TBv+uQAuCcmwS0NGGsnJ6n94ymtBRzP8Sof06
 f6lo8aSfn1yMtIWUJyLDcmzxgoJPCpRzbbwQioD8lcIFKAossx9BMwBIKgpuaLFmtB+MKLXknnR
 2+hlFto2J6810YcRrNIgK85xiTBmAh2BmcD3oyxVfS92HQEUcDJI8cS2qzDKP8PjtXGHc92dWB7
 7NvWGU3uBZ0iFinH/mq+bqYKI2jjynrQayTGfnRRxHB74zp/+nPR83qdlMV/16EvGQqdhDd+1mZ
 +efDul/CebkhQidQ6J7Opu13LYa2STqKIrikV2c1y0kLXlQ9cujFmjggUwvHmj5f8YIbTeFkh5W
 3KLpVkafAjywK/eX0qFdiLSZ8feuyHke806BNEcHgb+6h3vm/bogdfvxVWKhZBvg0AX0hnmfwqF
 IHuK1+0LHpVOMIF/B5Q==
X-Proofpoint-ORIG-GUID: JudJMZx3UyxwAfy0uo92TZk7Geq6MFrs
X-Proofpoint-GUID: JudJMZx3UyxwAfy0uo92TZk7Geq6MFrs
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-14_01,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 malwarescore=0 lowpriorityscore=0
 priorityscore=1501 spamscore=0 bulkscore=0 phishscore=0 suspectscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610080000
 definitions=main-2610150051

On the SA8255P platform there is no Linux clock handler for the SE
source clock, so the driver has no way to compute the divider needed
for a requested baud rate. To work around this, firmware instead
exposes the SE HW supported source clock frequencies as OPPs on the
perf domain device.

geni_se_domain_attach() now populates clk_perf_tbl from
the performance-domain OPP table, allowing firmware-managed
platforms to use geni_se_clk_freq_match().

Call geni_serial_set_rate() unconditionally from
qcom_geni_serial_set_termios(), and use geni_se_set_rate() instead of
dev_pm_opp_set_rate() so clock programming is handled centrally by
the GENI core, independent of the underlying clock-control mechanism.

Reviewed-by: Mukesh Kumar Savaliya <mukesh.savaliya@oss.qualcomm.com>
Signed-off-by: Praveen Talari <praveen.talari@oss.qualcomm.com>
---
 drivers/tty/serial/qcom_geni_serial.c | 26 ++++++++++++++------------
 1 file changed, 14 insertions(+), 12 deletions(-)

diff --git a/drivers/tty/serial/qcom_geni_serial.c b/drivers/tty/serial/qcom_geni_serial.c
index 4a6f526340b8..23e423009255 100644
--- a/drivers/tty/serial/qcom_geni_serial.c
+++ b/drivers/tty/serial/qcom_geni_serial.c
@@ -113,7 +113,6 @@ struct qcom_geni_device_data {
 	bool console;
 	enum geni_se_xfer_mode mode;
 	int (*resources_init)(struct geni_se *se);
-	int (*set_rate)(struct geni_se *se, unsigned long baud);
 	int (*power_on)(struct geni_se *se);
 	int (*power_off)(struct geni_se *se);
 };
@@ -1461,7 +1460,10 @@ static int geni_serial_set_rate(struct geni_se *se, unsigned long baud)
 
 	uport->uartclk = clk_rate;
 	port->clk_rate = clk_rate;
-	dev_pm_opp_set_rate(uport->dev, clk_rate);
+	ret = geni_se_set_rate(&port->se, clk_rate);
+	if (ret)
+		return ret;
+
 	ser_clk_cfg = SER_CLK_EN;
 	ser_clk_cfg |= clk_div << CLK_DIV_SHFT;
 
@@ -1499,7 +1501,7 @@ static void qcom_geni_serial_set_termios(struct uart_port *uport,
 	/* baud rate */
 	baud = uart_get_baud_rate(uport, termios, old, 300, 8000000);
 
-	ret = port->dev_data->set_rate(&port->se, baud);
+	ret = geni_serial_set_rate(&port->se, baud);
 	if (ret)
 		return;
 
@@ -2051,15 +2053,19 @@ static void qcom_geni_serial_remove(struct platform_device *pdev)
 static int __maybe_unused qcom_geni_serial_runtime_suspend(struct device *dev)
 {
 	struct qcom_geni_serial_port *port = dev_get_drvdata(dev);
+	int ret;
 
-	return port->dev_data->power_off ?
-	       port->dev_data->power_off(&port->se) : 0;
+	ret = port->dev_data->power_off ?
+	      port->dev_data->power_off(&port->se) : 0;
+	if (ret)
+		return ret;
+
+	return geni_se_set_rate(&port->se, 0);
 }
 
 static int __maybe_unused qcom_geni_serial_runtime_resume(struct device *dev)
 {
 	struct qcom_geni_serial_port *port = dev_get_drvdata(dev);
-	struct uart_port *uport = &port->uport;
 	int ret;
 
 	if (port->dev_data->power_on) {
@@ -2068,8 +2074,8 @@ static int __maybe_unused qcom_geni_serial_runtime_resume(struct device *dev)
 			return ret;
 	}
 
-	if (port->se.has_opp && port->clk_rate)
-		return dev_pm_opp_set_rate(uport->dev, port->clk_rate);
+	if (port->clk_rate)
+		return geni_se_set_rate(&port->se, port->clk_rate);
 
 	return 0;
 }
@@ -2130,7 +2136,6 @@ static const struct qcom_geni_device_data qcom_geni_console_data = {
 	.console = true,
 	.mode = GENI_SE_FIFO,
 	.resources_init = geni_se_resources_init,
-	.set_rate = geni_serial_set_rate,
 	.power_on = geni_se_resources_activate,
 	.power_off = geni_se_resources_deactivate,
 };
@@ -2139,7 +2144,6 @@ static const struct qcom_geni_device_data sa8255p_qcom_geni_console_data = {
 	.console = true,
 	.mode = GENI_SE_FIFO,
 	.resources_init = geni_se_domain_attach,
-	.set_rate = geni_se_set_perf_level,
 };
 #endif
 
@@ -2147,7 +2151,6 @@ static const struct qcom_geni_device_data qcom_geni_uart_data = {
 	.console = false,
 	.mode = GENI_SE_DMA,
 	.resources_init = geni_se_resources_init,
-	.set_rate = geni_serial_set_rate,
 	.power_on = geni_se_resources_activate,
 	.power_off = geni_se_resources_deactivate,
 };
@@ -2156,7 +2159,6 @@ static const struct qcom_geni_device_data sa8255p_qcom_geni_uart_data = {
 	.console = false,
 	.mode = GENI_SE_DMA,
 	.resources_init = geni_se_domain_attach,
-	.set_rate = geni_se_set_perf_level,
 };
 
 static const struct dev_pm_ops qcom_geni_serial_pm_ops = {

-- 
2.34.1


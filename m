Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6ADAF3D8104
	for <arm-scmi@vger.kernel.org>; Tue, 16 Jun 2026 18:09:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781633366; cv=none; b=jicCGBthkn9gD1V283XKGezRRVM6rhqhKARVLeSotiSHK5gRNJy3iaH23CBGsF9dMM1xz89mJKkvJ6aw+GD/7lDq5sbaxrhJJCxuM1YLCYdSJguk0awTKKe4JRF29sqk6RaorsRCCiqTf3xukTFpdLBi5DGvcUKSqycifj6y260=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781633366; c=relaxed/simple;
	bh=QotbZv7vjLrREeiiHMvKmU0dv3R+anoFnJbihk/prqo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=MBgPe++8fsLGbjF42kbt9w/HCgkExOMdiKOHlZRl2jMXt2AMvKIq9v1iyzbg++rY/f616SYbh7tVQlhB8VuT9EtmGRPrrJ3mtQpGBrRtJfgqWn79DBYIPNkhTTGcCiVBuDFskIkgFZI4sYc+H5hTjndhhUabKk0Q/5ZH/Dnoo3c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=esYTsWvE; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=SEzQHRZF; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="esYTsWvE";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="SEzQHRZF"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65GH93EB3798980
	for <arm-scmi@vger.kernel.org>; Tue, 16 Jun 2026 18:09:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	0jagAJ5kWTSod7R143j9Inn4eTzLl+m9fNAglUfCFpo=; b=esYTsWvEh4aOuFSh
	7viw280LQ4FQ+iMiZ3Y15ia3pIAC4sBuchx3OffabSvixwod+V8pzoS6vytuIl2w
	qncsz8k5xextFHajpYa+ZeoHtcso8KJGhMWOeheYa56XsMRDGZCHVog+5TigKwNZ
	PbpcNaklhblOajAKAcRKxffNAKMJn8H1vUd6NVkDQgjv7qvBfSn1vpdtAmJ3/biS
	NUf/eUz4L0/IvgURbN0AjagvbEgNYTU842Q/Tk2IKqrOf/MT9YiC1zwqEZd+UpIa
	PMsrJNrBSkKkWisiu/UJrhu5lQVaVFQzb/TxJXCfbMUKRDeYWHS4rysm8+Znb8fl
	1nU1Ow==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4etx8kc2kr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <arm-scmi@vger.kernel.org>; Tue, 16 Jun 2026 18:09:24 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-30761ab3483so3268647eec.0
        for <arm-scmi@vger.kernel.org>; Tue, 16 Jun 2026 11:09:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781633364; x=1782238164; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0jagAJ5kWTSod7R143j9Inn4eTzLl+m9fNAglUfCFpo=;
        b=SEzQHRZFV4BJSqX35BHEzmUKN8V8wqTvXFbuAeORQuybVfoORg1RwVJv262ODETifc
         ZUCWlkmHA8GATM/ydvYugQYxZFj/h0SXD9brfQ6v8/5vYm4DxnWbcgyb4RvhBtWW4J8a
         EZK7wDKM5SdY4ShnB1vBUZT2wzyMIqWaQypc7RjdWVN8Z5jZCl6AwjPzdcz7/A30QB2i
         kjXX7c2uILkMTaI+9QioHUCa5JF7olKvCQ2e4GuF+pWtGAQlLcHALRTqhdfL+LeeYZ74
         +xbBkgozLYZinFB/bI4s3LjUXOgV5Cww3TA+/soNiqu4hjX0zh0GuDyjSj5OhR7bl78w
         1USQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781633364; x=1782238164;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=0jagAJ5kWTSod7R143j9Inn4eTzLl+m9fNAglUfCFpo=;
        b=Fi2R5DqTSoKp2c7InnzcnlNLYdLw3INod0b99JsGCVDtVhu0taDN0ZY/K+y244AytZ
         /tbXANeRhmPUBpi1yC4WwxMmZz7t5SfX7ibVzZrOVbcsXwU5emGeTZ/JNRh9ywNY5mhI
         kRP3+CtIScq/N3lnjhlwlSsKZ4b/zlT+PTRtS4AA6WGKUQHu8l5xqKLQ9JSha1M2MsnZ
         aNwVuaTyX9VGBbHdQwtqOxRIhZvy+xLvIWxe9Ng375l7dZCG2f04kWLmxW8N2tIjbz1r
         QElsy42XaQ6FW1yg247YE9QJPkiNZyhWE+FRiijJ8xMOeW2BxrtjeKpz3sWtk2imbIzD
         nw5w==
X-Gm-Message-State: AOJu0YzthYW/UAE+YiFbGur7KWluDhmPoNc5Ik3pK2Uxeo+X6QKsr3hO
	BS/VCx1GoeLFQsxzT+JDyf3VDPCci82jEa15Aa4moHKCNKTThjRnFr3/YzhETjCsd9D6Ojrm4LN
	oaEKAp4MaJHncEiB3YOJE5HhsAIFO84eSXPSu2uUa43XSEXP6k5xG2T3+em+erw==
X-Gm-Gg: Acq92OEuLOXZ9M69yZeMouXCDATU7joh90pRe3LWn4IaFsBk6eWcYGLB7WKuRK12/tr
	F9JOsHXjeqTGfPHLk4OYeiDNGwj+Z/ZHs36oQogRFRGlZ3FkGfmtEQpl60z/biSGGwQuqiRKaZ6
	aZ87TvsVWhT0K7lenNsZNYuUVs94TUumwVe2N51tr5le5xQLxRXjzYUNMGOwz5TKPycReic9QMI
	zMMgSqrSFubD6WkyXspXoajK4qC3Q41OkbKH5QhrkYPjDWC/cUBAMFmhDEXlpzJS9JZIVzXCm3H
	wxd0ni/phXyV+mcDuO7uYTxFUFHwgk9K1gVC5yLxfp6PBs6Q7XQ7Ct85c4Iabq9ONK0UkS80xLZ
	R4QXEqY7+S6iGNdFjJ3wrSov9ePqdeiMt/JqAtw8g9gTYEUI34ImVSTfRmHg9emY=
X-Received: by 2002:a05:7022:112:b0:138:4f8f:e2f3 with SMTP id a92af1059eb24-1398f6df39bmr14535c88.32.1781633364106;
        Tue, 16 Jun 2026 11:09:24 -0700 (PDT)
X-Received: by 2002:a05:7022:112:b0:138:4f8f:e2f3 with SMTP id a92af1059eb24-1398f6df39bmr14514c88.32.1781633363605;
        Tue, 16 Jun 2026 11:09:23 -0700 (PDT)
Received: from [169.254.0.13] (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1384b916b2bsm13747124c88.6.2026.06.16.11.09.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Jun 2026 11:09:23 -0700 (PDT)
From: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
Date: Tue, 16 Jun 2026 18:09:16 +0000
Subject: [PATCH 2/2] firmware: arm_scmi: request modules for discovered
 protocols
Precedence: bulk
X-Mailing-List: arm-scmi@vger.kernel.org
List-Id: <arm-scmi.vger.kernel.org>
List-Subscribe: <mailto:arm-scmi+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:arm-scmi+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260616-scmi-modalias-v1-2-662b8dd52ab2@oss.qualcomm.com>
References: <20260616-scmi-modalias-v1-0-662b8dd52ab2@oss.qualcomm.com>
In-Reply-To: <20260616-scmi-modalias-v1-0-662b8dd52ab2@oss.qualcomm.com>
To: Sudeep Holla <sudeep.holla@kernel.org>,
        Cristian Marussi <cristian.marussi@arm.com>,
        Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>
Cc: arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org,
        Hans de Goede <johannes.goede@oss.qualcomm.com>,
        Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1781633360; l=3049;
 i=bjorn.andersson@oss.qualcomm.com; s=20230915; h=from:subject:message-id;
 bh=QotbZv7vjLrREeiiHMvKmU0dv3R+anoFnJbihk/prqo=;
 b=mB3teymLVnjogVQ6ExoR0B8j71yObnhG9+mpy3G/YKYbRRmaxd/rbtwdNPct9ZL7MkcP9BRiV
 D/b62Do9yGlCbNRbysR8nEk0uZCXaj60e9kojVb6CI+ua3aIcERljQj
X-Developer-Key: i=bjorn.andersson@oss.qualcomm.com; a=ed25519;
 pk=VkhObtljigy9k0ZUIE1Mvr0Y+E1dgBEH9WoLQnUtbIM=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE2MDE4NiBTYWx0ZWRfXxyb6lDxvqt+h
 9RDkV3u9PDxeCXi35KxObiWLka9zJIEPRrZkB4jzKaWAngEqyYTCvpT13gINlLhwwQDKzSrPxGD
 aU5qOIJZ83LfPSNdPeZyrXBSn2cJNKeZ6811DVJ5xmN7wBFHwy5hDSXtGRonC0M850pq6mstEFA
 jp6zcfI6shDdfyEWD9iFhDP2PkohRvcxzbSTAMouLB/4GWULxH2hs+yOluh1eMXFDhbSL7GuB2l
 RzR/dR5U+KnfG7h1H3a2/Ctq71rYPMApovbzDFqUa6wXOkvxr2XnejPhIN96kL7ir/hZnmLQAAq
 hrSggbTvwRTrmKEzC3UBKRZgAszGHd9sThBhotygds0RX2bF0TqB4ttMfZKwnMh5dZ5ghMZQiUD
 CXZlTIJHPYKQNUt+GSulKqJ5MW6MR2LKJpnMyvqz2o8/yRSonRV07ReqhDTOHRqLKWAFPWL3rqK
 7yAfmnd0Ly33aToIBFw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE2MDE4NiBTYWx0ZWRfXx0gd6byCOKlY
 ViEVOASFp+Am73udBJDmAtNgahvKoCopJbTUHNnPHVZU/0cHIsPDe+BarbWQAs9oIQcm3a4uS1X
 t4B4wBym/Q29s0vXoZt2mStdOUTWu94=
X-Proofpoint-ORIG-GUID: c2rn0_z9bzJtarI-9vzJkzCSj27QX4Z5
X-Authority-Analysis: v=2.4 cv=dZawG3Xe c=1 sm=1 tr=0 ts=6a319154 cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=pziBBDB2UT3EZnJ0EPMA:9 a=QEXdDO2ut3YA:10
 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-GUID: c2rn0_z9bzJtarI-9vzJkzCSj27QX4Z5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-16_05,2026-06-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 clxscore=1011 impostorscore=0 suspectscore=0
 phishscore=0 priorityscore=1501 malwarescore=0 bulkscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606040000 definitions=main-2606160186

SCMI client devices are created from SCMI driver id tables. If such a
driver is modular, the core does not know the driver's client name until
the module has already loaded, so normal device uevent based autoloading
cannot break the dependency cycle.

Emit a protocol-level alias for each SCMI device id table entry and
request that alias when the SCMI core discovers an implemented protocol.
This loads modules that have registered interest in the protocol; their
normal SCMI driver registration then requests the concrete client device
and the SCMI bus matches it by protocol and name.

This allows e.g. ARM_SCMI_CPUFREQ=m to autoload on systems that expose
only the SCMI Performance protocol node, where the cpufreq client name
is Linux-internal and not available from firmware before loading the
module.

Assisted-by: Codex:GPT-5.5
Signed-off-by: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
---
 drivers/firmware/arm_scmi/driver.c | 2 ++
 include/linux/mod_devicetable.h    | 1 +
 scripts/mod/file2alias.c           | 4 +++-
 3 files changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/firmware/arm_scmi/driver.c b/drivers/firmware/arm_scmi/driver.c
index 3e0d975ec94c..8538eedc7c3a 100644
--- a/drivers/firmware/arm_scmi/driver.c
+++ b/drivers/firmware/arm_scmi/driver.c
@@ -47,6 +47,7 @@
 #include <trace/events/scmi.h>
 
 #define SCMI_VENDOR_MODULE_ALIAS_FMT	"scmi-protocol-0x%02x-%s"
+#define SCMI_MODULE_ALIAS_FMT		SCMI_PROTOCOL_MODULE_PREFIX "0x%02x"
 
 static DEFINE_IDA(scmi_id);
 
@@ -3362,6 +3363,7 @@ static int scmi_probe(struct platform_device *pdev)
 		}
 
 		of_node_get(child);
+		request_module(SCMI_MODULE_ALIAS_FMT, prot_id);
 		scmi_create_protocol_devices(child, info, prot_id, NULL);
 	}
 
diff --git a/include/linux/mod_devicetable.h b/include/linux/mod_devicetable.h
index 769382f2eadd..2cc7e78e35a3 100644
--- a/include/linux/mod_devicetable.h
+++ b/include/linux/mod_devicetable.h
@@ -477,6 +477,7 @@ struct rpmsg_device_id {
 
 #define SCMI_NAME_SIZE		32
 #define SCMI_MODULE_PREFIX	"scmi:"
+#define SCMI_PROTOCOL_MODULE_PREFIX	"scmi-protocol-"
 
 struct scmi_device_id {
 	__u8 protocol_id;
diff --git a/scripts/mod/file2alias.c b/scripts/mod/file2alias.c
index a5283f4c8e6f..40a37b6bf1ad 100644
--- a/scripts/mod/file2alias.c
+++ b/scripts/mod/file2alias.c
@@ -852,7 +852,7 @@ static void do_rpmsg_entry(struct module *mod, void *symval)
 	module_alias_printf(mod, false, RPMSG_DEVICE_MODALIAS_FMT, *name);
 }
 
-/* Looks like: scmi:NN:S */
+/* Looks like: scmi:NN:S and scmi-protocol-0xNN */
 static void do_scmi_entry(struct module *mod, void *symval)
 {
 	DEF_FIELD(symval, scmi_device_id, protocol_id);
@@ -860,6 +860,8 @@ static void do_scmi_entry(struct module *mod, void *symval)
 
 	module_alias_printf(mod, false, SCMI_MODULE_PREFIX "%02x:%s",
 			    protocol_id, *name);
+	module_alias_printf(mod, false, SCMI_PROTOCOL_MODULE_PREFIX "0x%02x",
+			    protocol_id);
 }
 
 /* Looks like: i2c:S */

-- 
2.53.0


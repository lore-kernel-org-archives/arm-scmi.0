Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78EC831AA8F
	for <arm-scmi@vger.kernel.org>; Wed, 24 Dec 2025 11:22:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766575369; cv=none; b=tV8JmTDWQP61g0EdM5WIRKfglbhVCMQjuDws5+ppfg4i1uS3+jQ+H2BdUBlENbKPL+ZEzygE955SZ9DuMNA3vfeftEMg4x5UGnAoiMr8yRAgK2KwRyj4k+tPPdbjqAys58RvPYdecfmvAjwQMBXcgmmSEj5qzGXR2ob+G/WXTow=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766575369; c=relaxed/simple;
	bh=eSn/vrPVAqLMf1mV0uK3MSO7Bl5fYmwa8QbVWqjzQNs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ec3qizEN3ITWJdbFXsX7Yo0gxBMq3034ZufjinxdyLNGFnwcyYF/QP4bUV+FTu3TB0bC4fkqItxB6qvKSV5kLJliba9IVJDUPmNJl2Yf9Q0BDOoxtqUJydWRR+bgZmG/ObnTFRkE7umD8+2DoZXTqccOyWS4v7hwBM45PLe5KFQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YePYMZ/J; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=LVTORfmi; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="YePYMZ/J";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="LVTORfmi"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BO83Xbr1056453
	for <arm-scmi@vger.kernel.org>; Wed, 24 Dec 2025 11:22:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=O0HiHNgdvKr1KcFvLRFA3WtKpSYqNZAj02s
	mGoT+36g=; b=YePYMZ/JOSPFk2ZIO94JsJgGsxkjxHxUuWKp0TFaN749LWeRXjc
	A7rc3kI4UlNqbw5DnwdUMKKvVUge5BJXe8zyKQIOHYtbogsuhHh4j3uYG14brEZw
	7pe5k9kmn0/Lf4ol+FK9IoviY60qcFQ4j90JZ2mkN7/KEMk6M4bX3+TEtzbyk4Tp
	9Drt4a9mDnNnvWjcvcPGZ6i8YWl2lQXzPalwarOEHbemABiTDFu8n65qBXHB7Vfy
	Fm3CKZ/h8Ln0EW/+lHWQh5MYwW1y0kscv3EK7phXhK5qtjBqOqA3yJU6j7FH7G1S
	CeJQsEarYBOvUicmtLfA5LJ7tv3H1VElY5A==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b811v29rk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <arm-scmi@vger.kernel.org>; Wed, 24 Dec 2025 11:22:46 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-4f1d26abbd8so158737431cf.1
        for <arm-scmi@vger.kernel.org>; Wed, 24 Dec 2025 03:22:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766575366; x=1767180166; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=O0HiHNgdvKr1KcFvLRFA3WtKpSYqNZAj02smGoT+36g=;
        b=LVTORfmiwo2R3Y3p2HDS8dkn0HFgNV+WWhQ1F/vY2AdfeR73wFJMvvmVvVGqYqGBNv
         +B2ux6WdWWgphloyWq5D2sU85don0pq3fNONUJ/1JcIy0mlu8EEkjcQIzOn/AtUIGnUB
         0s6M1/YVNjS4isH/7V8bobJg2oJf/UNtNXEFDfTZctOmllDY+Ay0Z/jZ2lPsnsmbaKXV
         IrEPKWYJQ9I0j+OpJ42Jyo3oT+aLnPJaye4qHb7M/xsqXuX75pvZpVSIqe66Wi419yYe
         STS6NSLEvIdXwx2hjbKHp0ZKp0A7UAw0CBTQH42hyCbxQrPuBG75OjcoDNGqtThcGx88
         wkCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766575366; x=1767180166;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=O0HiHNgdvKr1KcFvLRFA3WtKpSYqNZAj02smGoT+36g=;
        b=Nfn07Ld92BMj69KTL1YY9szpaH9Lw1WoS2yGNJ1WfJJVqohmaTrQU4abZxRZ5g+bN2
         B6wxBySiFrZW297b2o2O1CdutLMVNOggvt1U8oaeYUtCwHVLnlMptmv/99UbgFh2i8bg
         oQu0LbANFLlfthtC0IrO7fQK6hG7uRJv8RLYOnEgPXS8RRi1FjRfkUxDc0o241Pt8aLc
         7q+NN2w3BKEpJvoqRe51FcUTGaDFgB/KSSGG7t5GHdknrIYIel6Pip78YWuS5vMxe3iP
         rL9tLAonxkZGntSfF6xi+9G7hBlMzlogwp1fHxG58I67oWmbWbefBqqz1PkvWrwWYLz3
         pr7A==
X-Forwarded-Encrypted: i=1; AJvYcCXWiQfFxnDiflOODXR9fttw0Gzo9fre1oH17W7N47BDkKw2cPnEQO2DJDKarxSH1Sv/uQJqCS7DxQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Ywqd3au5SpQSX8uec64trWQ0x4WHm6I+up8okzQtcYsHyJEamYl
	oeRpys2L4MWr16GoeDI0JN+3LV8tsh8upXYlt8xmsdcWc0jHHgYxu0fs8KKaTA3gG92Rzt5ytKE
	mA4Ms6osvVZCqxl/HCFMphCPDC/mwLIJAvTFHUn59KHFt3kmDuYin9pzFsEfrDA==
X-Gm-Gg: AY/fxX4ctHAL6gU+N/VC+FJlkDPbWPdyp/2ivvvOVSparVyIlv5ctBPCbnGo+ajyJJs
	VFSPVXVieLtFDmk7epDxIID0DZKDRluckN004qW2LEClpJp7Nxya0l5Gw1q3ORhQfcohOTIAcuv
	cOrPVD6l4H6+b2V7H4YLJL4+gzTiLF/59WCAWTsbReJcaAgiWfZBbe/55VNNOXT7OYOLUkKsuyq
	347Tg6R6yLUzEDT8s594USUi0llojJmvSow/zeA8g5hSCaS2UJ/4wjmk210L5dhGRtmdhilwyOk
	hw3e+xEXumvalqcvOa8FJ9u0SdugTjDjGWherLhVD8UUPjOAH/xTP2tKa8Hym0O93tQygMc9BT/
	PjoN6mjMaCLmkuVMWy8St4BUlZsuY+Ji9a23Pu2J5UI4CRibWIXil2uOBFlwH+sQ2Yeb0dA==
X-Received: by 2002:ac8:5742:0:b0:4ed:66df:8023 with SMTP id d75a77b69052e-4f4abd06713mr254006641cf.30.1766575365738;
        Wed, 24 Dec 2025 03:22:45 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHIEyJuzFxKiRo26Yf+z+QYqxvtMHQvuEuAVwz/3TiONO7aYne3WRyXt3VVXkH0ZPT1PxurgQ==
X-Received: by 2002:ac8:5742:0:b0:4ed:66df:8023 with SMTP id d75a77b69052e-4f4abd06713mr254006421cf.30.1766575365333;
        Wed, 24 Dec 2025 03:22:45 -0800 (PST)
Received: from quoll.home (83.5.187.232.ipv4.supernova.orange.pl. [83.5.187.232])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-64de4798077sm2042514a12.7.2025.12.24.03.22.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Dec 2025 03:22:44 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
To: Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Sudeep Holla <sudeep.holla@arm.com>,
        Cristian Marussi <cristian.marussi@arm.com>,
        Linus Walleij <linusw@kernel.org>, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, arm-scmi@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH 1/3] clk: lmk04832: Simplify with scoped for each OF child loop
Date: Wed, 24 Dec 2025 12:22:40 +0100
Message-ID: <20251224112239.83735-4-krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: arm-scmi@vger.kernel.org
List-Id: <arm-scmi.vger.kernel.org>
List-Subscribe: <mailto:arm-scmi+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:arm-scmi+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1197; i=krzysztof.kozlowski@oss.qualcomm.com;
 h=from:subject; bh=eSn/vrPVAqLMf1mV0uK3MSO7Bl5fYmwa8QbVWqjzQNs=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpS8z/zWNdvmw1CsJTUQVKXfpHncn4h8LFXYkal
 FiGiWnektWJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaUvM/wAKCRDBN2bmhouD
 15aGD/9er+6080n1ivVaVbeXYztVbuBmdlFk04FD5W29D148S8a2VPReYd5iiL6SeJ+ujJrCtE0
 y1//W1akaUv+UqcCf4w/v93WfF8J7f5BAbW0sOtswGvVo9tPUvQWS6GCfTjimsydbLP1UJPvnzk
 qxIhkvGQHo79shSdec5gfonmEdoNjsCyzgsx37cjuJKVRJxjwJY26Pm5V8k6ndxbZpSEXJ3xWoD
 45I63qBY+ypRxSYsVFdaitgiMbUY8hB4I1FQ77To3W4JMg+DjpDSRyDhE8LtZ7jREwz6SBbQQ7d
 N1Z8Yh7VNzhK6+eMjOk4kiqJLW3jWkcHa0ehsVPSk3D7cPC2fBVnkrQHXbxiJKa5ofzeZc1GAx/
 O0Dz8XE6VYAfIEzpSB8p5JPhwV5lsd73uRgv4+dFVGHk9ILtV16yFBPwzgX3Vs5GQZ7UcTI2ctb
 WQInzqMhSWdOXtsTRRrvDBx2iuqIQO4iO7AWd3Uizu9bcc1AebT4aSoq75YhqMNGKmMA7lEFVLc
 0g5K+y0EaVgWzHfDFXyiZRdG7PVEH/dxHdI+KPufXva+WaiGwT1hWNWyLLXi1+m4yM+6s7sIpEy
 3NAzgTJygQsfrmzqMhf3f5hu8ekDXS1geJG9Y9tWahNhfn3RgaV+qhBjbYTgSZgc9zPdJrGuLh1 Y49fvpxM7EApjuw==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjI0MDA5OCBTYWx0ZWRfX+5a+SrSSi3g/
 sPfvqTJeFLkZz4GuCKTEULG7dGXiyy6bwnpnEDOdB0fsMZ5ALgLp2Smo7XrWgBCp3Ce44REO9Cq
 UzW46oNm+D+lzr+U2hFdeTQ71e50WdO/YJLzd6ECDsk7yfByTzrMEVl7KL1gPJ5gs+Fr/yIHOxL
 t5JaUIqigyAPbkubgHUPaX2tUV11qsM6nPhwx9TuhscKcMs/Qy0hXkm4EO0fSTZnd0bCantidFf
 uRvbr/6nZYINGuNV1u/xouhtLYD+SqG8F72XmyummyBYZZNamjC0yB6QNB5oGoTeDlMmYvt7fWL
 h6pub+q8AxdXij8QfoH6oZEB4zd8ku+BFs0otjh8q8LTaP1Wl8p9qcm1P8nDoIeQWEBneU27nvt
 fQkWjHu4mpXTyy249qHhEHtQqSxWhsPUuGmdft6HYQyiYJboSfdt7whPDucOmbFYfnOK0g5gZOP
 d0qWwrP2sEdX4pEPBnw==
X-Proofpoint-ORIG-GUID: 5oS5FDR4xCmQyEwoLKEpth6RIi3aiEmV
X-Authority-Analysis: v=2.4 cv=WegBqkhX c=1 sm=1 tr=0 ts=694bcd06 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=urQ9wjG1USoGuMoDBEOPbA==:17
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=bDIXTv4lkq2VoA6JDjQA:9 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-GUID: 5oS5FDR4xCmQyEwoLKEpth6RIi3aiEmV
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-24_03,2025-12-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 impostorscore=0 bulkscore=0 adultscore=0 spamscore=0
 phishscore=0 lowpriorityscore=0 suspectscore=0 clxscore=1015
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2512240098

Use scoped for-each loop when iterating over device nodes to make code a
bit simpler.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 drivers/clk/clk-lmk04832.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/clk/clk-lmk04832.c b/drivers/clk/clk-lmk04832.c
index b2107b31efa2..9bf86caad829 100644
--- a/drivers/clk/clk-lmk04832.c
+++ b/drivers/clk/clk-lmk04832.c
@@ -1400,7 +1400,6 @@ static int lmk04832_probe(struct spi_device *spi)
 {
 	const struct lmk04832_device_info *info;
 	int rdbk_pin = RDBK_CLKIN_SEL1;
-	struct device_node *child;
 	struct lmk04832 *lmk;
 	u8 tmp[3];
 	int ret;
@@ -1462,14 +1461,13 @@ static int lmk04832_probe(struct spi_device *spi)
 	device_property_read_u32(lmk->dev, "ti,sysref-pulse-count",
 				 &lmk->sysref_pulse_cnt);
 
-	for_each_child_of_node(lmk->dev->of_node, child) {
+	for_each_child_of_node_scoped(lmk->dev->of_node, child) {
 		int reg;
 
 		ret = of_property_read_u32(child, "reg", &reg);
 		if (ret) {
 			dev_err(lmk->dev, "missing reg property in child: %s\n",
 				child->full_name);
-			of_node_put(child);
 			return ret;
 		}
 
-- 
2.51.0


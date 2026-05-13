Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92A1644DB73
	for <arm-scmi@vger.kernel.org>; Wed, 13 May 2026 16:44:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778690672; cv=none; b=X17Pj/b87i16EbjWDmf+Mv45wTVmv/ylc/Up4F4F+Z9CLKsA8v56yAvsTkTSbZqXHbkHVnrwtDmOCPgqjoMv7mfqv8MEKNqd8sINi0HvIPlZYcAPDfwM0rLme6bRh2YVSNMVOJsCIHRNkrKlxSJ+Yxh2TXpdcajAZ20FDr7Vm6s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778690672; c=relaxed/simple;
	bh=b1XEOyYfA71ulQFPRY4KVUwTd8I87LzQvOwhzVXsPXc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=uGhIQFYppe2r8BhE2jVjDFLEHEv3mjgii+pb9t3RGeMCPYXqH3i2egy+ui/Vxm8uHc3XIL8+wZdsttYR+dpYqXVs7n/xPrkD/aOza4Pa0zI5uTipvNa8j4RbvOZXP1WMWtldu+wssIuAaJCAA97ptq6ruFdjxjRjhf8PfpII1yg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=C8KHt1JE; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=HeBTh80I; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="C8KHt1JE";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="HeBTh80I"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64DGQRti2338760
	for <arm-scmi@vger.kernel.org>; Wed, 13 May 2026 16:44:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	NqpHbTw5SrTogkQ6SExJKQySRSNYlZPHGNncVU5RI/Y=; b=C8KHt1JE0kglxy4D
	vqNfiYBPgRn5k5qtEg7Xr6aFGruSU4sdGDOCBqf4i78qfDWAA0bNToyL18FGM7ky
	FEPa20P7r2uCs7vhZJAaF6al91MtG0Oc2IdOah2c86KlWHKFAHOaitfQiOk69anJ
	be43IJEtSroB048evvO37sKIa7ZHNTskDrWESICr1MsaoaCE3Dj0IHflfiyMkJL2
	cOvKqPy6eSAOGrSfu2pj51F29MQvE4AOeR/I8+ZCMW5EAgLpqjCyvHdvweGr04tY
	yZxR7Lqbm35Y/M8Y2JGepKDU7/zl0/eevgeZNNtIFhS9qazYy7Uf4oCevSXZojeT
	hwrjQQ==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e49vxcfys-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <arm-scmi@vger.kernel.org>; Wed, 13 May 2026 16:44:29 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-2ef62078ee7so9261959eec.0
        for <arm-scmi@vger.kernel.org>; Wed, 13 May 2026 09:44:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778690669; x=1779295469; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NqpHbTw5SrTogkQ6SExJKQySRSNYlZPHGNncVU5RI/Y=;
        b=HeBTh80I3nhN3y31XaaZzvyPWOJEhp4zRggAmnVb59MqIvZrb4gjrOQdz3lp16h89c
         JyGumgAUzLyYbDlNMhVIdoE5RUikVawkxATPkLV/GIz1ZzmFPUrWlGI1uN5d87u3247K
         ozNv7RZuikPbruzmZBTEV/CD0MCqNjniDwMempsptBzcfWb9LM5zGefHjs+DmWHGDKLB
         w8qwKAxWkJAXrtSKwW61ygdhtdvaiI0bhZUu6RkrJuD/5vyJLny3utJfbI8Nmb+l2+Aj
         ddSHD67yHb+3bQ8PSSzz1vtI10LZiTPu+dk+9E70phBW54D6K5N+ca6rmv7D+Gjfi4Wq
         OpTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778690669; x=1779295469;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=NqpHbTw5SrTogkQ6SExJKQySRSNYlZPHGNncVU5RI/Y=;
        b=rHBx0wBavkow0oZ4EwNXH+D/cWSiz5qqHg1pUjwpuwO1jcIMwb1ZmFLkXHFiTWsz6p
         Z+GiEXUx0L7BGhmTUWqLUXSGERH5ftoXBAe1l64cLp9FXpom/pTKtHth305Pyo+jPPpH
         C9o8zjWMqmLazVmAjHlaZNbditGvg/5jS4EUtYc+aYdk7S71KLxOTIoGq2YobdxIQIz8
         tq+ZrghR2X/J2Nn/75TgGdMc3VR6zl2zYSmsP969S4OwKvFvFE1rGJ2E4xB4euLq9pb8
         QrrXzWBEpoY7E/yiyPTbiqOHiz01AEagSMwepBHRayzqlq1GzfTq1ApOUy/W8UMo7McL
         gZyg==
X-Forwarded-Encrypted: i=1; AFNElJ9wGxKr9I3vRIEltYX0XgbXk6rZjPYES5LyyxzKVqSfSb12DH4klFeH0aGg7pKulvA+WQI7bcSdDg==@vger.kernel.org
X-Gm-Message-State: AOJu0YwbPgyC3gYRNr0ZTHtqZZhPZ7nQ2AEXLnnRprmZPqR3NGIlt7yp
	GjhYzUZu9v37ufewK8P5imGc2SBSWzamVGyvCvFUDbbDaRVMYR/KOphG6Kl85TlGFxK1cBslzOO
	3Kq5055ldOSNx3mZGj9mN7x7GvWwoTkPhHiTB0LutdTurFc98MMCQiP6gsdUVxQ==
X-Gm-Gg: Acq92OEIYD8ZilvbR9E3PHFUKXxn3oHrFXJNkEeDf8lJnLDMK6WV281HUIEIS0H12k/
	WPaxNoq1S1qUajeN+4kDyYk45WgxVvlwq6lvqlQ6bvlnQ62g2+KvpDAlAZi6kImH3acXK2svvti
	Sw3+3cvaoBTxBRnYAd1urNYQIoPBBIbKIkejddiK6GOyXDTiQJu+WY6ZW3YqXIUkx4tcC8b0LsH
	UFF5NjJ/RVYa+qgFDwoagE0nqwgnEQWnjgy4q8zUm28ZYTPBDFsL/jJu0q4JsyXIUjAZWqQlSNr
	5xnhjZl338X2HAAv4CqEA8Iql6KMrBqwC+gz7ydqq17SFcIjhYfNXXKywsOkGeZdL2BuvLoY3QA
	uxC1sc1+9R1UiqlL2s+uT0q3MN2cg6hQSM58c8HEBE1PgwYb6f5pOA1/R+GZ04NCBxNXXk9k=
X-Received: by 2002:a05:7300:a50b:b0:2ee:f85:ec3c with SMTP id 5a478bee46e88-3011a369c25mr2262191eec.30.1778690668590;
        Wed, 13 May 2026 09:44:28 -0700 (PDT)
X-Received: by 2002:a05:7300:a50b:b0:2ee:f85:ec3c with SMTP id 5a478bee46e88-3011a369c25mr2262156eec.30.1778690668042;
        Wed, 13 May 2026 09:44:28 -0700 (PDT)
Received: from hu-aletran-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2f8864c37basm22570076eec.13.2026.05.13.09.44.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 May 2026 09:44:27 -0700 (PDT)
From: Alex Tran <alex.tran@oss.qualcomm.com>
Date: Wed, 13 May 2026 09:44:19 -0700
Subject: [PATCH 1/5] powercap: arm_scmi_powercap: Log number of powercap
 domains
Precedence: bulk
X-Mailing-List: arm-scmi@vger.kernel.org
List-Id: <arm-scmi.vger.kernel.org>
List-Subscribe: <mailto:arm-scmi+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:arm-scmi+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260513-scmi-client-probe-log-v1-1-00b47b1be009@oss.qualcomm.com>
References: <20260513-scmi-client-probe-log-v1-0-00b47b1be009@oss.qualcomm.com>
In-Reply-To: <20260513-scmi-client-probe-log-v1-0-00b47b1be009@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1778690665; l=942;
 i=alex.tran@oss.qualcomm.com; h=from:subject:message-id;
 bh=b1XEOyYfA71ulQFPRY4KVUwTd8I87LzQvOwhzVXsPXc=;
 b=My5DR7z1/2KIWwHKe0cIBTddjrYizysbTmiPqsKJxVjsb26CE5501wqsIcvFi+92wv43QWc7p
 CdUopfQLwVqBg3dE2T/aTJ84vQpNT7/PK79MNjb/MZXiXtast982sre
X-Developer-Key: i=alex.tran@oss.qualcomm.com; a=ed25519;
 pk=vKab/gw1fXij5UviWoglv+ho+H/oOiTHyETCLfayPE0=
X-Proofpoint-ORIG-GUID: qqybdQBs_Mg8zFpviJyvR_FqMCFdbI7X
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTEzMDE2OSBTYWx0ZWRfX/Gikp+oYU2d3
 ja6lJZv6W6tD3fQ9RtlwtPkLaWhjI8fsneoUUCEfE2C5RxUXUid63K/2nLQsb2KiZEYkwDD6cXC
 gw6GrDx6V/AaHRG00Z0l9S2MrDRRz6fHMffQ4BG4F9kXC0DkKG6LQtfppm944C3WVpPuBqwtlLJ
 kAavDHQM0OztiAKLgNhhgj1pSsGYHqumB0ZlzdDbGVX0DCMXMI7r0n9LeEQwM+Cp8u0KRyUxrtB
 71r0CVf2/WmTbQXb9xYWD4v0HKN5pX2A+CqkNLgpByndcMJ9Qy1YLoD+tLCAu+ZWURZQxj9eZul
 Ase4RVznWjQ6wNgKSW4Xh/LvoGHw6F1hFKmMwueTC8vcy2Gc+6sGEgE5AHND5Zt0k8Az2byD9aN
 Y4xwk49TuatzJcannbWtkJDOe1PLEV5eZhfdD4J9ch2gvf6w71n60Jq0534UxHXu4mTEasV+Hw9
 vPsIuxMZPVD667kfbSg==
X-Proofpoint-GUID: qqybdQBs_Mg8zFpviJyvR_FqMCFdbI7X
X-Authority-Analysis: v=2.4 cv=A8Fc+aWG c=1 sm=1 tr=0 ts=6a04aa6d cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=Bjf1dfg4zo7KOAcPRCoA:9 a=QEXdDO2ut3YA:10 a=zZCYzV9kfG8A:10
 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-13_01,2026-05-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 impostorscore=0 bulkscore=0 phishscore=0
 clxscore=1015 priorityscore=1501 spamscore=0 lowpriorityscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605050000 definitions=main-2605130169

The SCMI powercap driver does not currently report how many powercap
domains were discovered from firmware during probe. This makes it harder
to confirm the firmware exposed powercap resources during debugging.

Log the powercap domain count after a successful probe, aligning the
driver with the existing SCMI client driver logging pattern.

Signed-off-by: Alex Tran <alex.tran@oss.qualcomm.com>
---
 drivers/powercap/arm_scmi_powercap.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/powercap/arm_scmi_powercap.c b/drivers/powercap/arm_scmi_powercap.c
index ab66e9a3b1e2..48d721385f94 100644
--- a/drivers/powercap/arm_scmi_powercap.c
+++ b/drivers/powercap/arm_scmi_powercap.c
@@ -496,6 +496,7 @@ static int scmi_powercap_probe(struct scmi_device *sdev)
 		return ret;
 
 	dev_set_drvdata(dev, pr);
+	dev_info(dev, "Initialized %d powercap domains\n", pr->num_zones);
 
 	return ret;
 }

-- 
2.43.0


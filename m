Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B3604C6EF0
	for <arm-scmi@vger.kernel.org>; Wed, 13 May 2026 17:17:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778692637; cv=none; b=PTk2CFyT2qeYqxH8cNuViNaNNznFrTuv8r41HZbus1pwBombnvNw86ExOC4L/U5d+GVYczgNV4SCTErYSbaTLky9g3KAow1+099YuPaImLiGiE9EAYbnCnL/qrxCYWLb9YUCSLvnHV+MHDRo6ixwFMhtLgvQYbgr22ABzllqtj8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778692637; c=relaxed/simple;
	bh=3u12ZFfeWx/fiqk59TYJupRQ0n5DvmJHNYpFAAetJB8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=CN+pOnSE4Ip6bnRknYdDNEXz61RnuBPzNLJBfW6NGhEi5jdAmJAnudnqTx0it6QLvOkU9MgmUgVLr3hQk239qX85D5c/itFQBNVxmy8cCMtQsFlQuYuVRKiSImkIGD94fsPEQXMHH8TcugaQAzKTfqu63o12EZV++ak8qXJY+3Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=b0Z3rieG; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=fv7QtOPY; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="b0Z3rieG";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="fv7QtOPY"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64DH0JST2321422
	for <arm-scmi@vger.kernel.org>; Wed, 13 May 2026 17:17:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	8jMP2TqROTeV+TiFaVGks9cJcMR3oF9GuGRUSfBYhhM=; b=b0Z3rieG2EfD/BoZ
	T3kWa4Z0iSk71q8mvLzrcE/5+q6RWrATg2PHtZdT4gEXnfEpd2ifpFK/OhLkyJM1
	jKezqu4feWh5iy1I+CwZ4dftZq6yX0cRVolF5xvYpCKhe36Y673sXn3pEqbp6wLY
	IlqTG02j4opHoogiL+oLpj1BjrBhcZUTaYr3G5Z3JH2fW04iXVDSAYft+h9dZpqM
	2FtDN3qAbdComPMRGgMWKGmKTwP51dbpEBsXuy8gWuIrGkKSlYT8tcx2WY6i3EBs
	kHLoJj4/VfbweYqOPzdeaU79oGddXe24hjTHMv14niTiQFEc1oHFFQPuLWsmvK4v
	3jOxTQ==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e4hgub531-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <arm-scmi@vger.kernel.org>; Wed, 13 May 2026 17:17:04 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-2bda35eab74so5515060eec.0
        for <arm-scmi@vger.kernel.org>; Wed, 13 May 2026 10:17:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778692624; x=1779297424; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8jMP2TqROTeV+TiFaVGks9cJcMR3oF9GuGRUSfBYhhM=;
        b=fv7QtOPYZoxiA3g9m1d1hStkFN9D5om/e2bxi0+krSblX3o9/AGlEZRuwAJw7h2oIb
         DrmK6kj/EcSIlHLJZEmD/l/o4w3s0dvgvy3Na+T6346srpIDs0rjXGM6fRR7G+lB8NCa
         BUZMnj0rtt00RjwTjIj2EJZ5qXSDD/ZeDJk/NTZSBuk9mtGHXFjlyzcnVrYRY+VbyFhL
         olvKY1/BpVvwBhD0u6UXqU5sUuw7g/3PPJ+xqFObrsa1ldl7MZBYbgA2WDusJZw605TV
         aNXAwNgchDxs5CG0lwXHCUnn97hW91bIlCBUd6gPGymAzt1PoC2yStm5wmRqQrvtFifr
         8ZsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778692624; x=1779297424;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=8jMP2TqROTeV+TiFaVGks9cJcMR3oF9GuGRUSfBYhhM=;
        b=hp0CDinEh0oCWmoQhqALVxNeqBuX2GnJ0ZaEe/4UIthtXL6IA4Dzoyuiv3ofAGTxn5
         JtWNQz+dgunwrAHGHrZGklCcyB7ed5uizQslLSj5qw1IudlehsS8aWZJIRTQIry27roM
         dDUUVGSqpw/1iNC4w7OQXQW6Bneo07QcJtjprG7vnwQIzcHifKQw+UpsRHOfajIe3c1n
         TBf12Rh2haQjbRbUN9TGmKRbyluaBB6awJYGd5XrYGHQ1qgT54+O/oO2riPjo1i+ni8c
         8OsqGtSx5o7oA83KC9jAj/MBBr1ruOlS57TrtcLUPjHoUbQfEAG5zbnKIrdJSbsLfJSy
         hcdg==
X-Forwarded-Encrypted: i=1; AFNElJ+dTeqXMiiWJ6NzV12Q5G+IpHN9SX3lOMIM/zdmD8Za/7jTklCztGLixSqSWKZK4v8rNXPZkpKaRg==@vger.kernel.org
X-Gm-Message-State: AOJu0YwMoPivP73GV5RUz+5wZM8YpK99L0mda5XPBWU1rftfPHozswOf
	ntKg8Kfyl8StKOCWmLmcAt7zCaqxE4m7pNp+eN3ktx+0ofJIng3TEwiQ6ct+dfYEsOzGf9+v7Fd
	xyLSD1KduBP1b2Cq5X+YLy6Ik0wl5AMPHaGLVm6x5wILXQW/Y58Tqwyaj755/7Q==
X-Gm-Gg: Acq92OHRLEEIFTsr5xbnG7B6XzbHThvfEQeLqHHIVKIUqv90jua1E2SviQgR7Yq2ChU
	kAp2754rI/XTKKiLeuAiday34tiFyzZcRdfjaN7J/zBlu0LUKG0D95mNuqk88PMr/zWXc00lKAc
	FbOmoCaNiIdrSV4qqEvpOcRohVvBp6/w7JPxM/W3EfXbY+osHV+2x54UYLU/dp8YmBJvL37iK9P
	fHK4Jdl5ldR+20i4hfge+gTefDfKsrMWpF+NBf61oY5hz/tdxer+7P7iXtv7Elu3k5yYmIfHycq
	oGQoiz9X0wDV9AH7NrQFpji4JUmpXYN9sL0MUjTjP0hCabSDd6611SPuOIxfAvP2rAnOlpU2MT9
	K9uvB99kwq4aGd3jT1qlRNSJ9r1S2slIO9Q7wL6HUfmKePDUj+sMOuexRexSZ88/Z7BZcfWo=
X-Received: by 2002:a05:7300:d511:b0:2f9:1004:b2cd with SMTP id 5a478bee46e88-30262f3895emr226685eec.20.1778692623900;
        Wed, 13 May 2026 10:17:03 -0700 (PDT)
X-Received: by 2002:a05:7300:d511:b0:2f9:1004:b2cd with SMTP id 5a478bee46e88-30262f3895emr226653eec.20.1778692623279;
        Wed, 13 May 2026 10:17:03 -0700 (PDT)
Received: from hu-aletran-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2f888d3af4esm23075939eec.25.2026.05.13.10.17.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 May 2026 10:17:02 -0700 (PDT)
From: Alex Tran <alex.tran@oss.qualcomm.com>
Date: Wed, 13 May 2026 10:16:56 -0700
Subject: [PATCH v2 3/5] hwmon: scmi-hwmon: Log number of sensors
Precedence: bulk
X-Mailing-List: arm-scmi@vger.kernel.org
List-Id: <arm-scmi.vger.kernel.org>
List-Subscribe: <mailto:arm-scmi+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:arm-scmi+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260513-scmi-client-probe-log-v2-3-36607e9dd540@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1778692619; l=817;
 i=alex.tran@oss.qualcomm.com; h=from:subject:message-id;
 bh=3u12ZFfeWx/fiqk59TYJupRQ0n5DvmJHNYpFAAetJB8=;
 b=drMsL9zyJtm9O0u5u71mfEb7eSjVSIhSmM0g7YOeZ35sVG8AknsYYy0u0vN6Wrm6jfxOHGdtg
 gHPXVlMeN7JCUSGfnbjCErOB7V68Chpm7qkXicucNIo/rWqXvEyxQR9
X-Developer-Key: i=alex.tran@oss.qualcomm.com; a=ed25519;
 pk=vKab/gw1fXij5UviWoglv+ho+H/oOiTHyETCLfayPE0=
X-Authority-Analysis: v=2.4 cv=X4di7mTe c=1 sm=1 tr=0 ts=6a04b210 cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=U6dIrDiPZIM1rF_tHS4A:9 a=QEXdDO2ut3YA:10 a=zZCYzV9kfG8A:10
 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-GUID: IheO658xlnB9lQYGB_4gato4XcZuPts6
X-Proofpoint-ORIG-GUID: IheO658xlnB9lQYGB_4gato4XcZuPts6
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTEzMDE3NCBTYWx0ZWRfX6abX3DAlYJAr
 tw7X9lQO4/i8saQEEj15OT+es5FGl54FjyyBlq1EEqW5FxrSII0qfaif7h/bZ3UhfkU0QA+g/DA
 3ygBb7NqsMkEGJAtlTXV3r+KHPFVKbSGQF7S/VQwOhbOsw5WbvHTQUA76eNMRSpO/oBhdWHaw38
 3x6L6jb2/tbMSvrIstEV4Ly2FolmPo+U3A7zOXBKLvWASoA2FeJqBvD+8ex46AvuhlQEvA0DO0s
 xvuXJOMFXx972FIsZA+51Lqh/g/QrvJQNZ43I1upDP72HO2FY5yKhUiUxbzkMvUL0QGcL+AtNbJ
 NDairXJ1r0vvLBjVdE2SSx4nn0OuiqzSV7fYTeWQIqh9FbhUuspX3nZdDMa5wJR8I3MW8YuwTYW
 frBGd6AI2+7PhpHQ355QHwc0EaUDyp2m+vQq0dbFP1CVMWq/VQs2/MhmFbG43hVClbWVXMw5Nkw
 +M7jmxhBtfVQNWfU+UA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-13_01,2026-05-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 lowpriorityscore=0 adultscore=0
 phishscore=0 malwarescore=0 suspectscore=0 spamscore=0 clxscore=1015
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2605050000
 definitions=main-2605130174

The SCMI hwmon driver does not currently report how many sensors were
discovered from firmware during probe. This makes it harder to confirm
the firmware exposed sensor resources during debugging.

Log the sensor count after a successful probe, aligning the driver with
the existing SCMI client driver logging pattern.

Signed-off-by: Alex Tran <alex.tran@oss.qualcomm.com>
---
 drivers/hwmon/scmi-hwmon.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/hwmon/scmi-hwmon.c b/drivers/hwmon/scmi-hwmon.c
index eec223d174c0..456ce11d050c 100644
--- a/drivers/hwmon/scmi-hwmon.c
+++ b/drivers/hwmon/scmi-hwmon.c
@@ -362,6 +362,7 @@ static int scmi_hwmon_probe(struct scmi_device *sdev)
 		}
 	}
 
+	dev_dbg(dev, "Initialized %d sensors\n", nr_sensors);
 	return 0;
 }
 

-- 
2.43.0


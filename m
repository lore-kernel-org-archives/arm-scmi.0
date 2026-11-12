Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794506531;
	b=XSog4+mkhU24fzgbN2B4BW/ZajIkSqloI1nXA7osQU+OqO1nlyInpr96jEVkxomYQK7W
	 q/IJVJnfWjOexX1SKkt11YrWh/8LAeLyD+gx/Rz94UXGnBSh2Zq2kKkzDneBvw+Fl4fXx
	 2NidtLH+/8CK1JK988rECgJC0OxrwHFAfhk0kC0EG9XnbnEmh1Q9aJue2/aZMXvs2Icpx
	 pB9E+KyxcMKVDA306hFgJRUdj4Wzvy6lMLDmW1o/wfRBx2RMTERleidZWxlpHDCdbmPcX
	 X+z7F1p1y8CF3CjfNdKA2wHjsQYS/889HWEJ8Q6M7h2dcWMmXloz/a1AmbCU7H03Vlg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794506531;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:In-Reply-To:References:Organization:X-Mailer:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=/q+HZAXO33VdMbT6NBmFvKukVr7avEJ3PXxPK7OsNsg=;
	b=V3KTY2gvalEMMTG7IlX+oIEB0CK7qZaGHbQBa4dhUW7rtqzOg9kQmeIIb3AcGhf1X7Td
	 +tMo2i0oECTeLnLiV2yLUl9gFF+ZfhmRdjRBcFrYIrO912Yms03WAgvg+pMliTmFE/hi7
	 79CB3t6s3lCPmrEOoaqZ6j9+FizIYBbO0ec+N/j0xFX4GKD+M0JZZiEfawRl3W4zKJaxy
	 yy29XdYhINX0t13G8jjbSl7j9CLiGgKacnDKp8ls4PpDZ0uaCdksP6ZTqTVAZ2Wyisfwo
	 EWJt1fW95LoAdAlO35r1ORosCld9GFpsfT3DCrPJWyi1F5nzThvt1gZDSnHDVbrKpQQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="A2/jZtNk";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=IWIJzLY8;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7007606A321
	for <arm-scmi@vger.kernel.org>; Thu, 12 Nov 2026 18:02:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B7007606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=A2/jZtNk;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=IWIJzLY8
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ACFa0D2012045
	for <arm-scmi@vger.kernel.org>; Thu, 12 Nov 2026 18:02:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	/q+HZAXO33VdMbT6NBmFvKukVr7avEJ3PXxPK7OsNsg=; b=A2/jZtNklLwEH3VF
	MjxWSGKtysNcngnLz9nCc5sc7/gnGbaGuYZ7zGqVOcKlM3AKsHIhmaDNdYQI4ZWi
	az0VQuSJZy2CM9eerFUxN61c5NsUuQzxiT8gItwg263EYYQpvSe2OFTk1hHyIHWv
	zj2A5PMIXu8TmQfB+bV94iuGZi7aE2RXG7j/lEkQz0san5pM0oxql7aDbK002WSr
	q3YACElXm56wWe+/r/V6oMS73GNwJk13I7nFJ22sdQaxoLFya70HPeAgeXEJhP2C
	IZFSFwkvlw+nRnbXeumYkkoleNslYC3xwOyapsv/o/316CYMF4zOohQxHMX4w/kE
	hE54bQ==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hwg1b8p56-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <arm-scmi@vger.kernel.org>; Thu, 12 Nov 2026 18:02:09 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-36d1353fdcdso453226eec.0
        for <arm-scmi@vger.kernel.org>; Thu, 12 Nov 2026 10:02:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794506529; x=1795111329; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:organization
         :references:in-reply-to:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=/q+HZAXO33VdMbT6NBmFvKukVr7avEJ3PXxPK7OsNsg=;
        b=IWIJzLY82eJhjx1LDl4M8p9/EuzkwvdbjMobocgD6rzIEUFY9Jlhrk4mbqisvSR+wa
         i7kH9LefCVY8pMurhzyEs1l/69Jr/TsmFZNIPhXQtUPfWyUOKAIVszNpiYuMgWy0UNd2
         8F5Gw7EUhEwypI5N2ByJFGSZu9sAhLoIc1TAIymdH3mzzPADwFALm1txD5H6igR5sopO
         UGXmX62Vb33o9/Oww3gqrXidBn9azUhzCyExF6CEEF5M0NMNAphUnCBjs5n3MecOFgd0
         Ip7yOElPuVXvhHFn7gfDpP+TpJNQ5fFnzyJDK1Mt3eXkuPUEl55GsGol65FtvMbS05tu
         TWtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794506529; x=1795111329;
        h=content-transfer-encoding:content-type:mime-version:organization
         :references:in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/q+HZAXO33VdMbT6NBmFvKukVr7avEJ3PXxPK7OsNsg=;
        b=P6e70E5iV1M6oGmYISAUTf25bmVjh51QPWLO81ZQ2/8cACI+plo4LWPQ3NaRIK9OB8
         c8dLI0EGtu+W38qLjkL2kIOJx49qcCy65aqD+TcjigpFHRfVN/YlOBXIkEz0QOd+VNOT
         ahS69IjO4VV+3Om+3T43bBsk0IYQqQ1TH/cRuCOM6mSI/6NGWA6qmmR7bObNnQKu+6a7
         hGgpY4Ccf9y/JXTwpF6X8TgZbX+CKC2QYbibYc/5t4W24my8GPZU6dulPT4ElhBv6u1Q
         DwqA2LHhKpsyw8ZW/2X4jq5BvNqrslQO3+w/DzRS609dP2FpCylNJ3qwSdPtLEjyC2e8
         PwoA==
X-Forwarded-Encrypted: i=1; AL+hErECojRBb2puoj4TkU5Al4BMA+jnSibCzoNmB/OfiuJfQ8yBLGksO1rpOo4w26crGHiyMqbSioiYXQ==@vger.kernel.org
X-Gm-Message-State: APuU4Z/74f+3ppd8ruu0NUw9bRMpVsE3jY/3/sLYxIRqANJd9Dk59llD
	1d2uuX/9/YSjFGySkLUj4S4ElWO7SNJ/Ipgs5pW6dixI/KcMTfwKpKowxfqGrfaoqxUpGoEZ/J5
	zJmyEZXp5nwaq7oiyHYj/0HmrBaOEYbpAybuP5qKzyqdX5ApLFshbP56fybFmbg==
X-Gm-Gg: AYBFou1vd7mrUgRFwAP9K1RwY8TSr2dPATP/KeLAjHEy3j/pKEXdZbZ++iw2a3QqSuQ
	hs3i4mTqCrWySz0Mbgab042TSXk8C2ARjBkO/k9GFt8mK53jUgHWb4GHJiY/RhtkCCOgsR+Saw9
	baDsqpsgWns9lq4UOrc/2EJMtmb6kWsPRltKVZ3s+r6HuavVGwmQC2rep+dkP2hkTaxFIfLOQAq
	EkT9dOzGtwKs1Lud11gT2eZP2N95fUpby7PExY0COPoNtWvdlGrCkT1wfoOJLE+FSt9V8KmtG45
	+uZdSA1ciPC5hh4TMcMx1otCzTdum1bM9xe27IV6Er6/5Wm6PL6aaOSxQxbGnvXviM8ia8lX/2q
	/+Bz0fZwm4Zt9r8ogG4XGa3Nh5iaDVO9TrJM93PwGU84PySIglDPovgtcHt/KjrGdBv373fPmFY
	BgDKA91CEiNY93RwCW1Zp/osobRw4=
X-Received: by 2002:a05:7300:fc0e:b0:376:9e80:2bf5 with SMTP id 5a478bee46e88-3769e8f760amr6022193eec.38.1794506528711;
        Thu, 12 Nov 2026 10:02:08 -0800 (PST)
X-Received: by 2002:a05:7300:fc0e:b0:376:9e80:2bf5 with SMTP id 5a478bee46e88-3769e8f760amr6021582eec.38.1794506510251;
        Thu, 12 Nov 2026 10:01:50 -0800 (PST)
Received: from localhost (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-37955332ae7sm510064eec.8.2026.11.12.10.01.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 10:01:49 -0800 (PST)
Date: Thu, 12 Nov 2026 10:01:45 -0800
From: Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>
To: Cristian Marussi <cristian.marussi@arm.com>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        arm-scmi@vger.kernel.org, linux-doc@vger.kernel.org,
        sudeep.holla@kernel.org, james.quinlan@broadcom.com,
        f.fainelli@gmail.com, vincent.guittot@linaro.org,
        etienne.carriere@st.com, peng.fan@oss.nxp.com, michal.simek@amd.com,
        d-gole@ti.com, elif.topuz@arm.com, lukasz.luba@arm.com,
        philip.radford@arm.com, david@kernel.org, souvik.chakravarty@arm.com,
        leitao@kernel.org, kas@kernel.org, puranjay@kernel.org,
        usama.arif@linux.dev, kernel-team@meta.com
Subject: Re: [PATCH v15 10/35] firmware: arm_scmi: Add Telemetry resources
 enumeration
Message-ID: <20261112100145.00000560@oss.qualcomm.com>
In-Reply-To: <20261109091221.2532706-11-cristian.marussi@arm.com>
References: <20261109091221.2532706-1-cristian.marussi@arm.com>
	<20261109091221.2532706-11-cristian.marussi@arm.com>
Organization: Qualcomm
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.51; x86_64-w64-mingw32)
X-Mailing-List: arm-scmi@vger.kernel.org
List-Id: <arm-scmi.vger.kernel.org>
List-Post: <mailto:arm-scmi@vger.kernel.org>
List-Help: <mailto:arm-scmi+help@vger.kernel.org>
List-Subscribe: <mailto:arm-scmi+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:arm-scmi+unsubscribe@vger.kernel.org>
List-Owner: <mailto:arm-scmi+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=c6Q+0h9l c=1 sm=1 tr=0 ts=6af5ff21 cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=7CQSdrXTAAAA:8 a=eWwvBSKlxOWLqK439NMA:9 a=CjuIK1q_8ugA:10
 a=6Ab_bkdmUrQuMsNx7PHu:22 a=a-qgeE7W1pNrGK8U0ZQC:22
X-Proofpoint-GUID: pmoWMEmoMGF7MM3Zt-YgaP99nhE3V2-a
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEyMDA3MSBTYWx0ZWRfX+iI8cXvnmHHK
 d6LC60wzCcm4K5w2TLnS3ZwQAaq4IgueSUVI6x+KArMmlYrmb0q3i+4uCt8jq81PsFU1JE/rREp
 iSibFwRK2B2/UUrUzjaWFURkZsAK1bIEgEmLYmgybWIk3aMN5O9PCToFIyFEPdE12tul79nV1He
 g+viKZ07XW4uPtqaZjY7b7HFcEc6kgujQET5k2mwgmSO8Yk131TuMXI0TNNCmTucXPEjuW5Ct6i
 p+YlYzkk7Fk8p+HtmCCvpmw2C8QYQ+Fd3XqoEOqnBnbdvB8cCIu/3cEzqAwQ3jsJg9axAFUKXPG
 u2TE9+j63bLTXRYoCMzYZxSDMQ4OnB4D33YD/TNmYP60Udbb7zvEdEViw3w0/Wg57jXGBgdw9Q2
 C/bNLSXls9Op3Tas/NaIm+OLwrNHS12WQbUE+D2lUeVa+7Ci3kCn7HEDlihW16UR8Op7XpTlnYU
 viBFB7pglrL3VSH62PQ==
X-Proofpoint-ORIG-GUID: pmoWMEmoMGF7MM3Zt-YgaP99nhE3V2-a
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEyMDA3MSBTYWx0ZWRfX6s+KttWcXjfp
 vzvXWsFxIPNTDxiFgGf5k4ZHMUXhGCI1To816Ha0Zqp35qeIuavLbRsSvqGmCWh70Q101xqGe6B
 4rYzLMz0b76Pa0ZLnlMqmSHnSvY3uNw=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-12_02,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 bulkscore=0 suspectscore=0 priorityscore=1501 phishscore=0
 impostorscore=0 malwarescore=0 clxscore=1015 spamscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611120071

On Mon,  9 Nov 2026 09:11:56 +0000
Cristian Marussi <cristian.marussi@arm.com> wrote:

> Add basic Telemetry allocation and initialization routines, introducing and
> wiring-up the logic needed to enumerate all the SCMI Telemetry resources
> optionally using a lazy on-demand scheme: this approach factors in the
> flexibility needed to minimize the amount of initialization work based on
> the effective access pattern used by the upper layer ABI.
> 
> Signed-off-by: Cristian Marussi <cristian.marussi@arm.com>

Hi Cristian,

This stretches across the patch set but first elements related to it are
in this patch.  How do we handle larger values of de_data_sz?

The spec allows (and it's useful for things like histograms)
DEs to have an integer multiple of 64 bits for a single element.
In the shared memory buffer that just ends up with a bunch of matching
IDs with discovery via the parsing done in this patch.

The only (I think) today to dump that from this patch set is
to use the shmti dump interface.  That's not exactly nice!

I messed around with (well chatted with an LLM about) a couple of
options.

1. Make the whole stack aware of multi line DEs. So all the requests
   get to return more data.
2. Adding indexing so you can get a multi line DE in multiple calls.
   That makes the interface for a bulk read a bit odd.  Userspace will
   have to be cleverer given variable sized elements.

Given this is a ABI related aspect, needs figuring out sooner rather
than later I think.

Which way do you think makes more sense?  Or am I missing something?

Jonathan




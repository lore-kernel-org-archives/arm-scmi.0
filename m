Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792443850;
	b=f34chDKe89x7SkknJ4qnaf6icc2xyh+OzlEejTXYzijN47yoOJfRSEHk0CyNAZ06SG4+
	 54ZREo0Wbj46hcK0qFaF9UW6nunhzdC7Fv9M08rDXLXKyLueTtmcPDkq7QqrDflAxLKZx
	 n4o9YwEjzc2rQ8Hs+QjgYjAGlvlCMkAiCMbqeCdQu3LeGQp70qrqRLFyKbA+ii0DO7Y70
	 3x9vvtXIaKvsvJVOJae4gyRvQ6OvMa79jvxJKkiB3BKdRRNujK7QELyRbUYiBLf8ak8i5
	 ky0V6HzJ1CEJZgRRhRQjAJ8JKaFZX2Nb7qC3jMBWmelyGzgEQpwxHFrDkCobPneTekA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792443850;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:In-Reply-To:References:Organization:X-Mailer:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=blTjjTu968skKectCc+Yq/rOfNGyGv4vOrqn0909Bn0=;
	b=S2jcpjwAuZUScXfeL+Zk+Yk8yg7dF7Tr6QpCEbAUrasFTghwVwor2/xh1l2d9/Kzu3ZE
	 Y5ZT0h4mQ3yKi+Ri3GhLIZpsCUU3h+wyHkLM9uLzsWyzEk+ny7KLKbJG57UJRqwNcqz6Y
	 I96Fj7c6D633l0la5jpWCPevZppyc7I9N8pLPhuRLlPOu/GgydWSeRiSKy3eusotj25up
	 B9c7u4z+HPbrb37M1NfPGqmWwMwvwwCyS+8/bmgNU9hrz1p4yGVlkLihNj4CXll00W2CH
	 UpWo8Ud7zstlcABJddN5kN/VsPq49+U6PG4uNOGcy1xyubGTbYXbWn/rrC1BTWSAIsA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=NG9cy6sQ;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=JT1aN1lc;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A951606A319
	for <arm-scmi@vger.kernel.org>; Mon, 19 Oct 2026 21:04:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1A951606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=NG9cy6sQ;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=JT1aN1lc
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69JJK1RG3627888
	for <arm-scmi@vger.kernel.org>; Mon, 19 Oct 2026 21:04:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	blTjjTu968skKectCc+Yq/rOfNGyGv4vOrqn0909Bn0=; b=NG9cy6sQH8ZkfYkG
	H9XN29jQrzjrkPwM97s7ROfLzJ4085SGyOHFIPYfqOFgmvx18QlIM0mcN9CYhPR0
	lue6R7/7a1g+mterYAsZMRmHr77CAYcI7npMB6EjJbssC693Zq1Dgft4FBKZ+pGW
	R8uaqXhv2dxCpxnGl9RyG5AiFjj70fIjWTTn1O/jkMac8LvkKK+TwE459/mC3jGF
	FgkHFmnEbMaz9Oii/9Ivak9rluRfdDSoIwYppb2L1XtOFhQ3gIxzPzU4Sz0tWjjU
	lpqbfoeTwgUWv9F2G72fc6SuuXQLTWQejgRRQcA2gOjnexmsSwV5f2k6o0lJYANE
	+uz8Fg==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hdr42gn57-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <arm-scmi@vger.kernel.org>; Mon, 19 Oct 2026 21:04:08 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-3592749a017so82566eec.1
        for <arm-scmi@vger.kernel.org>; Mon, 19 Oct 2026 14:04:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792443848; x=1793048648; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:organization
         :references:in-reply-to:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=blTjjTu968skKectCc+Yq/rOfNGyGv4vOrqn0909Bn0=;
        b=JT1aN1lcDHBfZRx7o6UNu5YnLK5/JhnqH/T2m3MR6E33x/Yv4aECubt3RVguI40KJq
         2fVRsmJ4UgEw+0Ao3xuSr/LBYVTmLYQKYWmue9Fny82eidZJ7MVyBTPIIFjlrQlDXja1
         t0hFniZoLMZ0LGVQxEVgmIigH4M0Yri8ioLidolqYbHioG7HDT/Q+JSbODjVB3hMICAv
         oQnBToWUc9nWQCMUnVwtVj8TyT0DO/SYqL7CyBOQiXZ8/7FtZ/C6xB3X0rp9nMKFjcVB
         YXWDUElofcC12XHjglaYjDbfDpDjBBNCacLc7SW6WnWJmNxK1y1WX7Np/OGTU7li7r5E
         avIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792443848; x=1793048648;
        h=content-transfer-encoding:content-type:mime-version:organization
         :references:in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=blTjjTu968skKectCc+Yq/rOfNGyGv4vOrqn0909Bn0=;
        b=qDXLh9iltsyHIcEjLlJgASMziclvizz1NjNtkCXCzby34OTQvwjfWrXlFtqHMDAbHF
         r6w7x0aQbLjpIEp8LFSFpju/EhHKs9sbyjMCR/1igk68yTaKnNUJPlAHUuc/5zT1CCgR
         4VZfdSg8rN5lcPo1WIciZ8px2qhue8izLu4yaGzngp1uFAkm5kwIV1ck9/z1e/y7kqjr
         7XkFP7JItnlxTv5GlB5sK+ecbHSMVrzexGccSgVqxyicmWVHMfKsrXxZrzulIsnkjAa6
         +c6p5uHkWlkeIt8yH4RoOsfbh1cJ75ZinN/wbFuAWtQp4SJzKCvvThwIdBh9m0logu43
         CKiw==
X-Forwarded-Encrypted: i=1; AKwUvBwf6XAxaPgU5OfvmpubpZHCrybJgVLZBZX6xJyTscSqToLpqfqpPEnwmOhl1WfW57FRPznjqQYAZQ==@vger.kernel.org
X-Gm-Message-State: AFq9FYLXl+l+tTj80PwCBicIJM5uMMv7Jgd5g1mRQDQ1AEqkFQJzhgMn
	D9300A10ySOboV8CugmW0Y+kaQ2NYox1VIrZ/rgTViMQqbkcPgKPfpbYdsNYy0bCeqeaieWPNpd
	E+pOdL1kYAD0wZOyrcm3FgFBiso6SNgJaJ5scdncnJMP3Y3bsG0X238jDlr+/vg==
X-Gm-Gg: AYBFou3s+4AHxLGdb8+upWaHRVz0dtBH6MApa1g/gpjpX1mGpjLTsmnT9S4nph1lZZL
	QCl9p/6c5pvEt3tLoInnDKW1YN7PszFy1MH4zU6NMxlSyH4T4DijkcPTJSgcSHqSPlFWrEaKZw9
	j/RZPIlaIMKijznn+vB3Lill+ta/yTsCoGOgaCMbdwZmxBGETaQkYZg/QMT4y7B3QtnExkMEVn3
	QdcNrB9HY1Wld5D9qZYlKbyErMHeHNmZyq95AXHHjiOr/fV6oBVMn1ZSycv6YCgjjN/sr+l1zo5
	RyJoffRQzAzFaJ8Ox2FJ6RJKxzSnRxP0Wj1qptSNzc335TGoS4D9eZoRGGxo5sAtXsi9uJgyVPe
	JS/Gy49xfqb0cUDAe3OpiNjy/M0PaZG8naS5j2XX6Fw==
X-Received: by 2002:a05:693c:8214:b0:361:a195:c46e with SMTP id 5a478bee46e88-365f83a0701mr382411eec.1.1792443847710;
        Mon, 19 Oct 2026 14:04:07 -0700 (PDT)
X-Received: by 2002:a05:693c:8214:b0:361:a195:c46e with SMTP id 5a478bee46e88-365f83a0701mr382370eec.1.1792443847154;
        Mon, 19 Oct 2026 14:04:07 -0700 (PDT)
Received: from localhost (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-360826875b3sm36508652eec.21.2026.10.19.14.04.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 14:04:06 -0700 (PDT)
Date: Mon, 19 Oct 2026 14:03:57 -0700
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
Subject: Re: [PATCH v14 06/32] include: trace: Add Telemetry trace events
Message-ID: <20261019140357.000075d3@oss.qualcomm.com>
In-Reply-To: <20261016185553.2794459-7-cristian.marussi@arm.com>
References: <20261016185553.2794459-1-cristian.marussi@arm.com>
	<20261016185553.2794459-7-cristian.marussi@arm.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE5MDA4MyBTYWx0ZWRfXyisaxKhE9wl3
 qWmx+sIiPU+2ySEzaK1rGQzuYzvSUqDPTh3fZos7wuNoiOMGGY+XTZBgZ1dV4bgDk3KOWvdw2mh
 ZOSkCMxFNaFdIqhr2xM7zq5Knvfv46ORyoUbHdcxsIgBaLjFvNdC+fSiWP4zi7WPC2lkGeZcdjm
 v0tBoccKlZrkaopdQ4y5j96/nKoVSMcKWYCeitrSj3odRKy8TI0S6jV5mRqGwHN2jnyCVx/F+cM
 rEdobdpNRiOo+3bjAD1Mz0TL4irxx6RHOWk/66GNY3ppVP3lfTwHH3noyPTuQNDtjb1TVNUgY/a
 i/bWbCbDrDQX3Bln6Y1TCxnPy/+JIWFS57aPXemAYwrcewXoG9CQh6P5xOT5Ft0qwlO9JV3mVN8
 nTiaSZ2IpFxbeO1YQf2AdlCZlDrefk9pgzwZhW6VCa+DsbrKJ7EEqKIuajHQKCforg6T34RcU3O
 yZlNkqUcdlCcDx726hw==
X-Authority-Analysis: v=2.4 cv=Ve9ir1p9 c=1 sm=1 tr=0 ts=6ad685c8 cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=kj9zAlcOel0A:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=7CQSdrXTAAAA:8 a=EUspDBNiAAAA:8 a=qlR7w6QO3uULSQa8ePQA:9 a=CjuIK1q_8ugA:10
 a=6Ab_bkdmUrQuMsNx7PHu:22 a=a-qgeE7W1pNrGK8U0ZQC:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE5MDA4MyBTYWx0ZWRfX32d8YiTdZlaQ
 ovsCeM/XkCWj5vLgQHA9DuYPF5DlptVpQQxiv4t9GYSlzqOifppDkguBica+kFoim+/15FWLCbh
 jvRYMW2bS7gRL3qaZhjqbGXkwX9QcYY=
X-Proofpoint-ORIG-GUID: tpBO1bwSr-ShYToidaZLshK69QtgI6NA
X-Proofpoint-GUID: tpBO1bwSr-ShYToidaZLshK69QtgI6NA
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-19_05,2026-10-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 impostorscore=0 adultscore=0
 lowpriorityscore=0 suspectscore=0 clxscore=1015 bulkscore=0 spamscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610080000
 definitions=main-2610190083

On Fri, 16 Oct 2026 19:55:27 +0100
Cristian Marussi <cristian.marussi@arm.com> wrote:

> Add custom traces to report Telemetry accesses and collection events.
> 
> Signed-off-by: Cristian Marussi <cristian.marussi@arm.com>
Fairly standard looking simple tracepoints so FWIW
Reviewed-by: Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>


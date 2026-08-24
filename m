Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EAA2823EAB3
	for <arm-scmi@vger.kernel.org>; Mon, 24 Aug 2026 20:21:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787602869; cv=none; b=tednPs3Na47Qw6xTUBGjGjPdCCia0SU+13NfrCLpdFdctCDmetqc3tV9a3VO0NcNf7AoP3nDlM69A8v2+qbCaCfOJohbkE/LmejZMpoSBghh8R1AztVof27XZqBXt8K58V8CrRUfzItcsN1ACNjHkebNgdPE0QZLb+M/R9mhLY8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787602869; c=relaxed/simple;
	bh=abNmrT8/771QWnk9H5eMuoKq4fMdG5Dn9JS2KsM8apQ=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=sLNMINLqL3xW0rv2ow8ydRA9dF6RbdSIzvChNISmFUgKHkv0biicDS5+VjJEanQTBudsQtfjlQjCkpZZ7vrcGJw8i8grsO78/RiDKUdGzmfUjyrInCR5rtnONdIVXWzcf+ErmYclRGYi0D1bZ7+BxmiIvbRIPZ1ZFUDMaI1FfJ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=oyxZr08H; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=QpWMpHEY; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="oyxZr08H";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="QpWMpHEY"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67OJH05b728688
	for <arm-scmi@vger.kernel.org>; Mon, 24 Aug 2026 20:21:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	EWHnkrfDXtB/l+0+YcoAv8lTzyFJOx55lU4lIaBBSvc=; b=oyxZr08HEoyfaHiA
	NAMNWGiuoED2I6bsweLfrcrbK1ZYuUVm0wv3scdNyVXKwDLRS4B2M6zJ3qto1bZ/
	yuyaZj2l7q6sNKkWunirRf49YkTFIQO2jAiD3MJtOtVhLaVTehR5ar5Vykqnvb4z
	as2/H6LGmAPg9ubM7UCOehg1cRaz2tGrit0QBqM7qRHtM0MXk/HFquQzTcuKBVGf
	/VFDR+m2l+v0yEuGAR6cLth9KObNgUqk8s8pxHMP0mxitThgrF9xBD0ibKUJdj5N
	ay7pSITqAfJJpL66zS8UuMFeXp1PAOywsX5BwHN8nIV9x0twWmo83/5IJ36U3iYn
	aPrndQ==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g8swr8tbd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <arm-scmi@vger.kernel.org>; Mon, 24 Aug 2026 20:21:06 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-38f5ac7416eso4063766a91.3
        for <arm-scmi@vger.kernel.org>; Mon, 24 Aug 2026 13:21:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787602866; x=1788207666; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:organization
         :references:in-reply-to:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=EWHnkrfDXtB/l+0+YcoAv8lTzyFJOx55lU4lIaBBSvc=;
        b=QpWMpHEY7EYXOdbE2y+yqzLln9HBeClzyMWr/iSh2W7nTY/Ue0gHMlT0iC4P/5VEcg
         EdsdALjvpuouW9xYXDgVflshKpm2nZQ9EuP4wWfBx+pZejKiDuHoEB0fsmpMfDlomTHy
         aDsBQp3EGv4WCFU41t8/0WhTbOS2dBSrF/KxLw8AVjZW8SODcOnQrtJtQPfIBcZKlIMb
         9OU+wJyGcOhxRnAn5NQVVqKHtiPYVq6KdCfGsWVsgSZlzSRUUgu4ig8NK6XNziQaOCx6
         STxHl8A3UB3OpNNvmr2bLvi/zcCNMgOA9H0zx245iR19T4SYZ6yZlZOzRi3xshLari3t
         W+5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787602866; x=1788207666;
        h=content-transfer-encoding:content-type:mime-version:organization
         :references:in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=EWHnkrfDXtB/l+0+YcoAv8lTzyFJOx55lU4lIaBBSvc=;
        b=lNv2sxJgMrTXwteba2hhIRgVtwufEqTuMmyP/uLy4GOQojZjoOVeJCa+0XfHLAO0y8
         otD10DXOTnsPbBUhoQoht/wKMrUpawWWg4MMF/lQU/dp5duJ+y2naSH2PQ/K+U0yH52y
         o+EW7rRmPGDmdfUgRd8GhRjtiHEEgWmOfEnQ9LnLHwC+Du8fwSVZdZqM8eTMtIolh67l
         mQMKHTTZLGCA+lSGZ1/XAzic2iY+saVdbOYCsBu+ec0p3z+iAIxYUnAgkVDX5+GZIrsr
         YSCHRgaMjz0naoxvAkYBrvM4O6KmFnwDQOH1lilvyXgvFghG0UTFbRnDi6O6MII9AjBY
         QSmg==
X-Gm-Message-State: AFuF++nN0YmZnheTC1cWIJAIoAj3RNH4VPB/TG1da7+2x3U12McTkmeT
	3Ewdz4XDAdHW54BK9lwUKgCtCxEfuL3LSGxE6TFJSojnE0qL8ERwhUXojRskujKGPpwOsB2dOKB
	wbilG6vtgszrE2M6FRVlye+5CK7b4PgruSr4LhFVbwF2tDmr6jqA3wjsFKTTrbw==
X-Gm-Gg: AR+sD12aWKHyIwtQBpSR1HItqyyGc+1kzFHSJGuENobJi4uCghZkQIhB2E2qA8gDmqt
	AMumvHgymmifgSqX4UMVgItGFIE89+cRJbxvPMI4PzlurapAu+LVrbSvlT16sjTrJXwF3unPYQC
	jgnNsvww/wBnhuHozArPJy9KdJbFxqbEtya5v8AAsfuYLGl3pF0TnAkn3imil8MXuKyRQGE+VS3
	ec+GLy1CLU9Z6LElDhJjqWsJi4+wheThVxrnWatymDX2SfhtTU1Sljh+xk6HqPLpBxoLvqKjnxW
	jjRrkNvIJIjrAWjfe0MaWlSAZLyhmAB1aIHCVFQ++9hX7aQdjYv8GKcxCIyZGC0sUT6BabDpjuO
	1yBkG7WhyD+qbWm8vvKSitFAQ0Q==
X-Received: by 2002:a17:90b:2e4b:b0:38e:7168:281 with SMTP id 98e67ed59e1d1-396464a18c5mr2844844a91.10.1787602866093;
        Mon, 24 Aug 2026 13:21:06 -0700 (PDT)
X-Received: by 2002:a17:90b:2e4b:b0:38e:7168:281 with SMTP id 98e67ed59e1d1-396464a18c5mr2844738a91.10.1787602865654;
        Mon, 24 Aug 2026 13:21:05 -0700 (PDT)
Received: from localhost ([50.35.46.84])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-327f8e2a730sm30617617eec.0.2026.08.24.13.21.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Aug 2026 13:21:05 -0700 (PDT)
Date: Mon, 24 Aug 2026 13:21:02 -0700
From: Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>
To: Sudeep Holla <sudeep.holla@kernel.org>
Cc: arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        kernel-team@meta.com, Cristian Marussi <cristian.marussi@arm.com>,
        Breno
 Leitao <leitao@debian.org>
Subject: Re: [PATCH v3 8/9] firmware: arm_scmi: Initialise known ACPI
 protocol devices and channels
Message-ID: <20260824132102.00006822@oss.qualcomm.com>
In-Reply-To: <20260813-acpi_scmi_pcc-v3-8-cb6b88b4ebb3@kernel.org>
References: <20260813-acpi_scmi_pcc-v3-0-cb6b88b4ebb3@kernel.org>
	<20260813-acpi_scmi_pcc-v3-8-cb6b88b4ebb3@kernel.org>
Organization: Qualcomm
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.51; x86_64-w64-mingw32)
Precedence: bulk
X-Mailing-List: arm-scmi@vger.kernel.org
List-Id: <arm-scmi.vger.kernel.org>
List-Subscribe: <mailto:arm-scmi+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:arm-scmi+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: -EIFfymKufMJqQApy-394Y6FxigYwFzB
X-Proofpoint-GUID: -EIFfymKufMJqQApy-394Y6FxigYwFzB
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI0MDE3MSBTYWx0ZWRfX++BvxPj19U8f
 AxO4PXI1DeSYeusLw87dUpHjkzjwW3LOMz4q94cRPqP2Cg7bZycRd00sCNX8fq4rzAzfTnJzyJi
 0uaYqUK78gFSJqxZa6s4uyL5y3AW1GM=
X-Authority-Analysis: v=2.4 cv=TqPWQjXh c=1 sm=1 tr=0 ts=6a8ca7b2 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=qC1CW/w66vtJz1P9yTJxNA==:17
 a=kj9zAlcOel0A:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=WWDN7_Rpj_YlblzOS3IA:9 a=CjuIK1q_8ugA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI0MDE3MSBTYWx0ZWRfX0YRgAkiMyqGk
 9yB4t9O0MH+jBOTcLz25rN6HzU62XVXHLSmEMAvq4rE1hijg6bNcHb9pLJhkoklEiC5+Wu440Qh
 7EmMGqaoNqGOHJP7+rd4dGegTQyDuS4iM74ABkOImDv57kRJtBXRLHfkKYJ7smgRjLAIuBCs3PS
 pqwThSImn6BF+W0oi5t3U99RBDO2hW527t1dwWW97CBS1vV2xLwNgQsnYyxvWwWM9CD/YKV7fUB
 RxcOaUdGcf5YggOdDcrtF1NLx1McQeQ+cDGa2l4K5Cc5qJOeec0h7HlWN6FJXgWSrnwYHqNgB+5
 oTkyCIHuCWJycbbz3MGqHbjcUX+OoRnaEnMU2tXdboVehh/QeyAfigtJ2kTMAtm1O0B4jnUJI9L
 EsPOjlcS47+OLMOw69OBC9XY4RgrBuv8ZsI+tKXyczE1xEQEE1MNhN7gO4/QZ0dpiBMWDAP6bxv
 D7t5/qH9SneGC+WH+Hg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-24_06,2026-08-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 impostorscore=0 malwarescore=0 spamscore=0 phishscore=0
 lowpriorityscore=0 clxscore=1015 suspectscore=0 priorityscore=1501
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608240171

On Thu, 13 Aug 2026 12:33:03 +0100
Sudeep Holla <sudeep.holla@kernel.org> wrote:

> Unlike Device Tree, the ACPI SCMI namespace device does not provide
> child fwnodes to represent each protocol. Iterate over the non-BASE
> entries in scmi_dsd_info_list to initialize their protocol devices and
> transport channels. The BASE channel and device are handled by the
> common setup path.
> 
> Let the transport channel-availability and SCMI protocol implementation
> checks decide which of the known protocols are usable on the platform.
> 
> Signed-off-by: Sudeep Holla <sudeep.holla@kernel.org>

Reviewed-by: Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>

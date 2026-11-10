Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794351375;
	b=sjoJfaJmDUCzqJVrLx/CSSyKfhNPHG1SMX0BexT3Y99YREaJ7fiKBwFyF+rvBYs+IW7P
	 n0phcZheY8nNs+4Gy1dVjyfVgEYl15KDVvAkYS2zouVI//rBaw6K2f7MEUPkSkX64eDX9
	 IL20tf1vIyj/KVbpXD9eHqjCLKbr/b71AdN6s0UZLk0JwU6wG+5odddfqO++5HbqxYWta
	 L5nlRCObhoxEjb8bWjurmcoCb82MzWgDxs6oFYPMh3vnzTqSKXG6WRV31S531LBGEqrWz
	 l6d7B7wDhEqnVdsV0cexfpDB8b9DGvYXyrUyBJKvVyQYEKD0+eoGNLqfBdlJykJoZ+A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794351375;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:In-Reply-To:References:Organization:X-Mailer:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:
	 X-Authority-Analysis:X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=2pVLYAyFt8ENqb3WmPKl43dt9zgX8q4AFgrY+mBvlXo=;
	b=GfQrkFu8qtAMhTRfOZzGKf0YwWPuXPx9zuWJfgWw8DKX2jyzvuWKDX1OJUiDLW+aEXTr
	 mCl4WhVE99wlmAY3kAiqjWO6rbsocNx/7TV7Wl4vw/Uhpgyk9DS/9+DmG5pdgkVbKUk0F
	 0mCUvaYjQqghFcyEpqREXgSRbopZv3Dg13urdWWpIq1VQN7FJPgD6N0CCvVBeklKhePP+
	 b5BzWRp3gs3tZ+Uz0fLzwrXh9KG8sCQbO4AmA7NM91Vrr5YjEqikT89vncXVa0lSduee6
	 MXr7E9QZXzXHEAmuVne+jQS5xEdFtXLozUcv/xOCEFpQy+Vjc07gDGaScRkEjH3y4DA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Ov6BeQNz;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=E5KoheuG;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C882606A321
	for <arm-scmi@vger.kernel.org>; Tue, 10 Nov 2026 22:56:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5C882606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Ov6BeQNz;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=E5KoheuG
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AAMKSKG3060799
	for <arm-scmi@vger.kernel.org>; Tue, 10 Nov 2026 22:56:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	2pVLYAyFt8ENqb3WmPKl43dt9zgX8q4AFgrY+mBvlXo=; b=Ov6BeQNzTntj9HcW
	wbs4O2yz17+nev0I4Zd5vxZlzzZtk9gqz5vw72UU8/FduBZai+HCNmoZocFCUA5s
	u9rb+1OyEbTBlNF8Cmjd7PNJN+KlNR8pczs0gRhBi2F4HNZpak+794p2jD563TD8
	I0yjV1Pw2o9hIjrxuFZPJ70za+rgiAe8ASscdlTOqbq0paRAIBO9qY4DuCrDi8c6
	9l7AoNMDmJZru9h8CZJGq+cfZuR1H9N0oje+9uZdjfwA8pSRNvdZ07EE94zB3g7C
	LB3uZ+nA0hq3rbqVOz6za0oM7/67rt3nYpyOm+GxVvikxiEY2j96ba/3xIomdfoI
	GMy+5A==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hv9b30ryg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <arm-scmi@vger.kernel.org>; Tue, 10 Nov 2026 22:56:13 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-36d1353fdcdso125888eec.0
        for <arm-scmi@vger.kernel.org>; Tue, 10 Nov 2026 14:56:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794351373; x=1794956173; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:organization
         :references:in-reply-to:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=2pVLYAyFt8ENqb3WmPKl43dt9zgX8q4AFgrY+mBvlXo=;
        b=E5KoheuGMu/1v4l6p/P8PKK1MePjq7B7iZ8axetPCSs3x9f142Wy8e3KlYejrOcMXK
         N0tbHPF06vhA5DhHNzxwiGl+DER69VcilOZkQXObgRMqChfo4KcfIKNJKvCe36uXAkHp
         ebPeTaFPYjKikxBZif04r9NVXqh900LXs0jjafBBASQnb2kNxIZ9meTLGbZFfhHjQbww
         2lzD2IXSQl2O6IfxTOob7ZGiPtpBvDJoSAIhwKLSzjIDihjYKI6LV+oeyPHVTJ/G2jiQ
         3JsfbD2PyuEHOqcqF1i9zM7lUlFkd6l+0nqkOzsdeSzjxIk0YBz7LbbEh1pMmxOcVrZF
         zXrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794351373; x=1794956173;
        h=content-transfer-encoding:content-type:mime-version:organization
         :references:in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2pVLYAyFt8ENqb3WmPKl43dt9zgX8q4AFgrY+mBvlXo=;
        b=kYI1qmGZqsmJQbjlOvqsgw2EsTNaSMNkTHgSOWp8xvz46FkmwWgXyQO94PzsrKdrN/
         hQuFkZ3qAJMrw2A6gRpiUG62ljxQfF9PUQ3o1ZKuTVIQrWwlbIvzOm/O9xktIGvjNGL5
         IfV5Dzq4CEvhh/6atZhfHZnwfz8hx3A1QDGcP1j4tL4Lgtydz1Qgl/m5kqED0jrQ00LR
         64m6eLx77rQ2NSA0kyFeGmP4ukbUMF89YVi7CM3QpZy/GY5WpVfVyHO3swwUZlcnJO7W
         alNXeVukoVdyYuNUeO3mJ9DNvNG71oNDWP8oprWj+KVwfrqOrBGgO3Pc1ysH7A4CDEBd
         xRyg==
X-Forwarded-Encrypted: i=1; AL+hErGrh5mLE8NCC72+Q2XJYRUMyMgIxWk9B3+IV3bbiuRY+bBu7pSzc3M3gqOEAJsVSvGiuQi2tBunhA==@vger.kernel.org
X-Gm-Message-State: APuU4Z/0vv+RnKTpHLzxC/QIYU9cUDVlUVzsry3yFLUfeEOsDuxiC30/
	B30qQ82T2/1lIIWj446jzBFIoL4kb1ZZDIa4nzk4svWjqX2m2oRi0orW0djP8Sknk5WErEuj2Av
	Ex85+iC7aCD6f9yXYIAYSx1AhQJFzNeni1JvuERo+Rhiypex81ZzxnGGLz89t6g==
X-Gm-Gg: AYBFou0cx9GtDV/5OocsVmJk+mBjC6KX3AAgPX9SMYfsPPWAi1d7NoSos+KNvMUGfbQ
	Zv920JS3JpJuUhyrzM8uMB6nPzMoSoKWNj7rxvnTw4KX3YeVYWRO8fgJ5ZfvI/iymjmEYe049BH
	9XnUrdw8PQGWDJz755Nfx86qRCtSX2rT06vqSRNpmKH1KJbBR3aj4tg3Gua/KwlmM4flR09uNGZ
	cNmh3utv7yqmQLKK0VqZUSjVtZAjDnRPt1InYTrkXPbQKmucWIXzsdqW2ubfQCqAorDzK2a49QW
	DYTDCyrf3WlhTaMyipa1Y5zY4/YRmqrapMAKDEkwv0i3UUCWujqjDcX3vDW32Qeaa1OLV/1GjDy
	aVZz6D6IiiwcPBDI1L4BbwVhnE1XFaP97+v1RjEh8QwfS0kwv7GB9lMHcRbFwb4eA12H9wOh5RP
	LuF/piK1sfElBPiNiN5avxVtB/LiIU
X-Received: by 2002:a05:693c:401c:b0:36c:a281:1bc with SMTP id 5a478bee46e88-37685896901mr1135982eec.16.1794351372659;
        Tue, 10 Nov 2026 14:56:12 -0800 (PST)
X-Received: by 2002:a05:693c:401c:b0:36c:a281:1bc with SMTP id 5a478bee46e88-37685896901mr1135938eec.16.1794351372085;
        Tue, 10 Nov 2026 14:56:12 -0800 (PST)
Received: from localhost (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-37520608b52sm8943607eec.13.2026.11.10.14.56.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 14:56:11 -0800 (PST)
Date: Tue, 10 Nov 2026 14:55:48 -0800
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
Subject: Re: [PATCH v15 26/35] firmware: arm_scmi: Add Telemetry debugfs ABI
 documentation
Message-ID: <20261110145548.0000663b@oss.qualcomm.com>
In-Reply-To: <20261109091221.2532706-27-cristian.marussi@arm.com>
References: <20261109091221.2532706-1-cristian.marussi@arm.com>
	<20261109091221.2532706-27-cristian.marussi@arm.com>
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
X-Authority-Analysis: v=2.4 cv=GKGdgeNK c=1 sm=1 tr=0 ts=6af3a10d cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=7CQSdrXTAAAA:8 a=Z4ki0kIUKxbu2UUS7qYA:9 a=CjuIK1q_8ugA:10
 a=bBxd6f-gb0O0v-kibOvt:22 a=a-qgeE7W1pNrGK8U0ZQC:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEwMDA5MSBTYWx0ZWRfX6MA8vBcSbvNc
 ad6uBY/o5eVQ8V66KUJ4IpkzHYvFEedP15i8/WQ+XcCQKmG0GgCDJNvwn2slSpvG994jCFMLXbe
 KKlxud6CnRIvxr2a227QtpbfOAt/Y1MjIGMip7z2UXBIjrcuTohwNI3qgNy4B970FmYbxnxivhg
 BQO3F/hhh3GANVdr4n+r+jXrilheaTSBU50vDAzE4Bt0i6Llzn/RH0VSwr4rwNV/gi7Kohnoyhs
 5RaVmbNVfQr64rYkolcclInDh6PkFHd79xtn/DD6MKAuaT17bjtzgd5GMbs1nBkJAzKi2Oh15ee
 AUcHF3YwXMScvtG5RR8rKzK95B9Kuh+NTg1WoT09CrIcAYLDCSI+YijQMCXyERcHVLJHRykDeCG
 dKfHz2+j7YsldFaY8lTGF1q3qQpEgKQZ8/ZtAjp4BtiKLKsjDlx4d5gmxyYMmdgWTfYLtVpNX7R
 UjbQ6iFy7VtUZ+xBz/g==
X-Proofpoint-GUID: TZi32AAAzL9AY1TZRLa_MwwDebMibvnY
X-Proofpoint-ORIG-GUID: TZi32AAAzL9AY1TZRLa_MwwDebMibvnY
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEwMDA5MSBTYWx0ZWRfX/GYas+p2x74M
 dw2hXBgXPokCWENBnrs/kfsavHD4xdG0wUOTzv11VJr+vm1DB3/nX0gZDAGXeMgkCKcxwm3p/DD
 Gh1kRLEvcrRpwsEdJ5byMfaA5IqOXAw=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-10_07,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 lowpriorityscore=0 priorityscore=1501 phishscore=0
 spamscore=0 bulkscore=0 suspectscore=0 impostorscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611100091

On Mon,  9 Nov 2026 09:12:12 +0000
Cristian Marussi <cristian.marussi@arm.com> wrote:

> Add description of the debugfs SCMI Telemetry protocol ABI.
> 
> Signed-off-by: Cristian Marussi <cristian.marussi@arm.com>
> ---
> v5 --> v6
>  - fixed typos
> ---
>  Documentation/ABI/testing/debugfs-scmi | 22 ++++++++++++++++++++++
>  1 file changed, 22 insertions(+)
> 
> diff --git a/Documentation/ABI/testing/debugfs-scmi b/Documentation/ABI/testing/debugfs-scmi
> index ee7179ab2edf..edbbe360321d 100644
> --- a/Documentation/ABI/testing/debugfs-scmi
> +++ b/Documentation/ABI/testing/debugfs-scmi
> @@ -68,3 +68,25 @@ Description:	Max number of concurrently allowed in-flight SCMI messages for
>  		the currently configured SCMI transport for instance <n> on the
>  		RX channels.
>  Users:		Debugging, any userspace test suite
> +
> +What:		/sys/kernel/debug/scmi/<n>/protocols/0x<m>/
> +Date:		Nov 2026
> +KernelVersion:	7.3

Overly optimistic use of time travel.

> +Contact:	cristian.marussi@arm.com
> +Description:	A subdirectory grouping debug entries related to protocol <m>
> +		for instance <n>. Each protocol owns and defines the subtree
> +		of entries rooted under this directory.
> +Users:		Debugging, any userspace test suite
> +
> +What:		/sys/kernel/debug/scmi/<n>/protocols/0x1B/shmtis/<m>
> +Date:		Nov 2026
> +KernelVersion:	7.3
> +Contact:	cristian.marussi@arm.com
> +Description:	A set of RO files exposed by the Telemetry protocol (0x1B) in
> +		order to dump the latest snapshot of each SHMTI memory area in
> +		binary format: each file is named by its SHMTI id.
> +		File is seekable and a seek to position zero on an open file
> +		causes the SHMTI snapshot to be refreshed; file timestamps are
> +		updated after each snapshot.
> +		This directory reports SHMTIs for instance <n>.
> +Users:		Debugging, any userspace test suite


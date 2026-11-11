Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794422370;
	b=TzJLWedvIltu7zr4DwYBG/T9v7obKpw9vFORSWg192WDalF4P8DDpWJSIHITiZjQmDxb
	 6tVVQnDW24TUOkj+3ZfN98r1osq+VA5dCqJ8dBeCu+dgobYWuBzcSj/SoRZMi9GnvJzIZ
	 jOXQPG3FuJrbxzw2ffaTHvCyBwZiGyQL3ubts/s2UOyk1dEXUcxW5Nw04q+mEEYoSbLDH
	 mHHdY4Oi5CLEMofnjSfi5JVYsKTEqBzLL7PvioaukVwTw+pK8/dC3GjjGgXKvEtaLVMao
	 g+AtS/NWZqdPb/3aMwiJ03pIKUHGiOvKhnONUeYaCc2U0tyJodxhWR7s4kjMfKiI+0w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794422370;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:In-Reply-To:References:Organization:X-Mailer:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=YRLMEN7xwMYs3ZpUgHAtG1UwTe/c78BkMK0uijF6N4M=;
	b=RjIQ+UX7TArnitgqlmRkTI3r7zjFzrl2J70I3uhZbel/TD6nVXCuWfqVbgAsVIo7S2oc
	 3bb5eqN4Afhz4Oek2ooJVrVvLXZ3sQv+236JZjO3u7YBMwAfa/YUqNzGde/DYefWLFjFb
	 p6C6C50d+pCrb57f8OKKGm5fqF3qqIg9QV2GdpzTy6N+eq1eBQ8SAQ+hgoBE+uPODrCj0
	 rQu6plfoV1dNcUNKA9WfbB4E7cwhXKc44BL7PF99MGMFnBAe+qv0CS+H3QxRuqZV3sbrz
	 A2OK0fKsxt1BiNft3cdHAJsvG+jGA5OdMz8oSYg2bRMSoLH4Ziy3954sU9NjNTr9Lgw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=BhHsZnpy;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Tg+A7O3E;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD16D606A32E
	for <arm-scmi@vger.kernel.org>; Wed, 11 Nov 2026 18:39:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AD16D606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=BhHsZnpy;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Tg+A7O3E
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ABIYx3k2042118
	for <arm-scmi@vger.kernel.org>; Wed, 11 Nov 2026 18:39:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	YRLMEN7xwMYs3ZpUgHAtG1UwTe/c78BkMK0uijF6N4M=; b=BhHsZnpyTizIvQNY
	Bpf9ADagu3a4kkxcvWRuGy/1uacyZjlq1SPZDqr1f981IisEhxXc+Km2rw6SWJa/
	B/Lyxbak5Jcqu6v3omddg6Ibx9i2+7+EcrCRWLoenZiDOWHGHYrPlBGlsZ1W3Fis
	lXGpOJ1MDRSXy8v/Sdt7mUPhCD/zW/bMJNX0fqEinAdk0kLFx/qhHIRmlYR0s9/z
	9qdsZOVu1QHii5KPlPptE+ZCJvOMsEPH1X+XrfEEEhA1RYR1S0Dd1CFDi9ORqT9Q
	36jtCPbZhj7jGoxgMcn5fll2goWlMsZIDKfeK7XmIhaEiKk1DIz9x4LI+Oe+7Hp7
	iQPUXg==
Received: from mail-dl1-f72.google.com (mail-dl1-f72.google.com [74.125.82.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hvs4m1eqn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <arm-scmi@vger.kernel.org>; Wed, 11 Nov 2026 18:39:28 +0000 (GMT)
Received: by mail-dl1-f72.google.com with SMTP id a92af1059eb24-14373747468so4081029c88.1
        for <arm-scmi@vger.kernel.org>; Wed, 11 Nov 2026 10:39:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794422368; x=1795027168; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:organization
         :references:in-reply-to:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=YRLMEN7xwMYs3ZpUgHAtG1UwTe/c78BkMK0uijF6N4M=;
        b=Tg+A7O3E6Sj6L5e6OTbangZV2ksIHwTIenp+qdlgcdYhavU7xfJ3td50Ck+KnIUMuW
         bxZk5zIyrGiasC0UYY8pac6naeXqQdRjzGsqXhyqAHdHlvS1/KBqDi4KcdLv1pmdjNnb
         1zaeZmo7vRnnrybQjzyGg4ADze3WWmM7U1FnvEzVyx5CL/4Yp7PBvHYC5oCNTWIckh63
         5rXzsQEDc6HObsembe6YJgaw/mVoI1YzIu3fmNQJF9Dqhd/M+3KHT6hE1Mr6DaGLxLFi
         VcM4xxhjFbRPBMpjVJeRd1ZOmAwx9GFbNYQtEYewJvSXActaIXOd1obRW4wxwIZzSga4
         xVaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794422368; x=1795027168;
        h=content-transfer-encoding:content-type:mime-version:organization
         :references:in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YRLMEN7xwMYs3ZpUgHAtG1UwTe/c78BkMK0uijF6N4M=;
        b=NEIUPV1KYOuQrAc5LMyliNQoUbYvK/jMsGui9novDlsgTd2slrXyx4I0dnnq59XfeX
         WqOQ0b0INVAvLKnnFFmjlAT0d2q6Wq/oNMu8YCK8x22Ix649qgEqd6J3y57IsrYlP2kV
         EwXsdITdRFgLEeuviNKMmUsNjZRPGQTVLuycVwAeOH5sjTOfjwDVXz0YF9Uzp3RgKjnV
         wAvWlo9dsoeF5NpFR2ED+PJsXlEm+UH/bepxRX87OOSv/UdHG39SpOexw7vz+iqVKPsZ
         iVt2e5RDSsj/Gk1XJFZY33mWSguphi294f27+7ibf4xEXDy8/wvlhI3fyYqVM+Jw9Lnj
         xyng==
X-Forwarded-Encrypted: i=1; AL+hErHrGgIk7nscAtVl4j3j/l3+Apzg1EGLKGyqWBsVPFFK4BkG0CpJuTN7hyg1aT7/WT4LfXoQT0PSJQ==@vger.kernel.org
X-Gm-Message-State: APuU4Z8Q2EhyYieW15iJ1AczdTCSHz6qBZw/NwrGjIjXXmfhnEDHxHFJ
	+tlsbcurelWfU7mPk/0znTQo3wQOtBBcly2Uw4OQlSUU+sxzzt4+WM7vp7wYvJ/WdQpddMtXXBs
	aenp7MusME+LU/711VnjbLfmRDlcFA/1pJMLegsUWmqBRf3SE/RSXq2qYyT0CvLStjxfirw==
X-Gm-Gg: AYBFou2G+3/meXAPKfdLih/xiGwA1r+RzaCe1uxcNI77i25tee4xu6EuNFCjcF+5TuF
	xQBqrsiuW9QuCFpeQExWai+9IjI54EfTM7l6ySfNRJxBCx7jZCtyeB91GS9vY/vZ6kIKK220XJt
	2F6hrhscTnoX6PF6tOx0aUF4rbfp6/vTOIU5w+Gi+Ihv4T8fH05mDf5nOAXn55yLo/keeDfDgL1
	pCHNg/fJf7uJDT0wGm7UnlhD4cJ5OoM45sDzFmdMrA8DEdHgL0mcSEdgm/RCsqUqSGnvuy87A2u
	42Eh3it41IzVwge9etoVp+Mv5/broVUdbTlDzbH6t1+GHr06+gHxoIwBI21SJWy9qQfHK/gzg29
	ykqwXi6jQucfl5ka03A/nnmpmqcclyd9zbGMDJcvYiTWZj6h7roEQMPkUb1XQBbYtOcMi4HbDD1
	ff1jWqrrjnC+Zm1CEpl9XCIz0Eeb0=
X-Received: by 2002:a05:7022:f519:b0:1b3:a881:4d9f with SMTP id a92af1059eb24-1b3c0312e9bmr2813251c88.20.1794422367228;
        Wed, 11 Nov 2026 10:39:27 -0800 (PST)
X-Received: by 2002:a05:7022:f519:b0:1b3:a881:4d9f with SMTP id a92af1059eb24-1b3c0312e9bmr2813221c88.20.1794422366523;
        Wed, 11 Nov 2026 10:39:26 -0800 (PST)
Received: from localhost (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b3b5b1003fsm16392776c88.6.2026.11.11.10.39.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 10:39:26 -0800 (PST)
Date: Wed, 11 Nov 2026 10:39:20 -0800
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
Subject: Re: [PATCH v15 00/35] Introduce SCMI Telemetry support
Message-ID: <20261111103920.00004f75@oss.qualcomm.com>
In-Reply-To: <avRANKPwp-r-QSR4@pluto>
References: <20261109091221.2532706-1-cristian.marussi@arm.com>
	<20261110163809.000070d6@oss.qualcomm.com>
	<avRANKPwp-r-QSR4@pluto>
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
X-Proofpoint-ORIG-GUID: IDqthJknY3tlkRhx5II9mrMf6UlacQPu
X-Authority-Analysis: v=2.4 cv=OYANnRTY c=1 sm=1 tr=0 ts=6af4b660 cx=c_pps
 a=bS7HVuBVfinNPG3f6cIo3Q==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=7CQSdrXTAAAA:8 a=XOA6F6MpoYfF4Vds9coA:9 a=CjuIK1q_8ugA:10
 a=vBUdepa8ALXHeOFLBtFW:22 a=a-qgeE7W1pNrGK8U0ZQC:22
X-Proofpoint-GUID: IDqthJknY3tlkRhx5II9mrMf6UlacQPu
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTExMDA3NCBTYWx0ZWRfX1FV1Q2UcZzPX
 HyyxjjUgeM4w7kYaG7OuzBbGwO+nZyaQNWbHk1FUYUOZz9Cuw4xOL8doOv27JA6RaraBcFqJ7OU
 7sbDd3Dsswf9ixRW3EBftRQK2q1hpfWY/6x6LLIVy6Bc8y3B2pLv8aClzFJRP2tL9jBTnJVqtjY
 LOYxLST9VU5QM3VTpH5UbBD0k8DtcYOwLctF3D8lAzhdXnmCkTuiDdBdImEEQu1q/1Y+g6RkSfy
 1VklMIp4/2M6CEJBnT6zW4u0OO5RYjZGQhnhXXuYt42InfH961isr1h1oO5JT1jt4+xIRwBsl27
 ncau1TdrwPnSC3Ih+JH/LrR5gLwdnDi+09Wu2lkWNdfUqkADWYPcvghMt8ORNxGR2KkSHf8tyrQ
 e99BmWZm9+Nt1KCHynxQbYX1ILY/Z2PO/4HhlbivoPdKUSBJKz29rzT/k7VqlHlKA2sg8qEBMLl
 DYlLOQOXioIiSx1l6iQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTExMDA3NCBTYWx0ZWRfXypfW4jrvNXgs
 gcy2RQcqMFkyKDGKoMizlldb92upzSbBcRbqB7qaHTHj8lWFBvxIgKJ0mm8UUj/GFhPHphEgcSB
 JhIAs22OlwapC7VEfRT34Pd4Zzx3VHc=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-11_05,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0 adultscore=0 clxscore=1015 lowpriorityscore=0
 phishscore=0 priorityscore=1501 suspectscore=0 bulkscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611110074

On Wed, 11 Nov 2026 10:15:16 +0000
Cristian Marussi <cristian.marussi@arm.com> wrote:

> On Tue, Nov 10, 2026 at 04:38:09PM -0800, Jonathan Cameron wrote:
> > > The upcoming SCMI v4.0 specification [0] introduces a new SCMI protocol
> > > dedicated to System Telemetry.
> > >   
> > 
> > Hi Cristian,  
> 
> Hi Jonathan,
> 
> thanks for your time...I sincerely hope you're travelling abroad on some
> remote timezone given the time these reviews came in :D

I'm based in Pacific time these days so was only 4pm ;)

> 
> > 
> > So, the main issue here is pretty much summarized by:
> > 
> >  28 files changed, 12801 insertions(+), 99 deletions(-)
> > (obviously there are tests etc, but it's still > 10k lines)
> >  
> 
> Usually I try to implement the complete set of features of a new protocol
> but indeed this new Telemetry thing is huge by itself so it became quickly
> overwhelming to review...imagine to code and test it.
> 
> > There are relatively few reviewers who would even consider taking that on.
> > I foolishly thought it wouldn't be too bad (and I review a lot of code).
> > By about 3/4 of the way though, probably much earlier, I know the quality
> > of review went down considerably. Honestly it was probably a waste of
> > time continuing but I'm stubborn like that.
> > 
> > So, unless you have a path to bribing or sweet talking various folk to
> > deal with reviewing this with each having to set aside multiple days
> > to do it, likely repeating for a couple of versions yet, I think you've
> > got to figure out out how to make the first patch set more manageable.
> > Probably don't split it up as much as the mpam or CCA folk have had to,
> > but you have a lot of colleagues who are experiencing the same problem
> > at the moment. They may be able to advise.
> > 
> > So it would be nice if what was in that first patch set was 'functional'
> > but I don't think it needs to function on every systems or support more
> > than an absolutely minimal feature set.  Just fail to probe when you see
> > something that isn't supported by that minimal set if that means
> > the thing won't be functional.
> > 
> > Once that's in place, over a couple of additional patch sets you can
> > get to everything you have here.
> > 
> > So what if you choose one data path (shmti perhaps), no notifications,
> > events, maybe even simplify to one of the readback paths.
> > Maybe even drop event groups initially.   
> 
> Based on our real world initial customer of this I can certainly drop a
> few features that are not supported anyway by the real FW and move it to
> a later patchset, stuff like groups, notifications and single sample
> reads, but all of the rest is hardly removable while keeping the system
> functional and usable.

For purposes of upstream. I'm not sure we care if a particular implementation
is useable with the feature set initially supported.  We just care if
there is a path to test the subset supported (hacks / emulation, whatever is fine).

> 
> > Possibly even drop timestamps.  Definitely drop things like boot-on
> > support and debugfs (unless you are using that as a cheeky 'functional'
> > test ahead of the main userspace interface.  
> 
> Not sure what you mean by drop timestamps, definitelly cannot drop
> boot-on (it is how systems are configured indeed) neither debugfs used
> for bring-up and FW debug.

Timestamp variety is complex. Fairly sure you are allowed to report no
timestamps at all as one option. If you pretend they all look like that
initially it might bring some simplifications. Anyhow, you know this
code better than I do, so maybe that is harder than I'm thinking.

I'd still push boot-on out for a follow on patch set.  Sure can
aim to land that one quickly! Sure customers will
get irritated by lack of support for what they have. Taking equivalent
of MPAM.  The initial support for that covered pretty much nothing on
real platforms. Customers were (and still are) irritated. But that
allowed progress in the right direction.

> 
> > 
> > How much would that slim things down?  It doesn't even have to be
> > useful, just testable.  Realistically I think the hope of getting
> > enough review doubles if you can halve the size of what you are asking
> > people to look at.  
> 
> I am not sure how many lines I can shed with the above features drops but
> I'll give it a go anyway at slimming down the series after I have gone
> through this round of Sashiko pains.

If we have to fallback to breaking it into steps that don't do much
more than print a message to say 'stuff found' then do that. It's ugly
but MPAM did that, RME is doing that. No one likes dead code, but it
does allow progress to be made.  Ideal is end to end with subset of
features then add features but not always achievable.

Normal rule of thumb for landing a feature is sub 2k lines of code
because that is about what a reviewer can digest in one go.

Very rare anything above 5k makes progress. As Sudeep mentioned, a
lot of folk will open the cover letter, see loc and close it again unread.

Jonathan


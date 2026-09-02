Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BBB142A175
	for <arm-scmi@vger.kernel.org>; Wed,  2 Sep 2026 23:26:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788391610; cv=none; b=C9RH7rqf90oJ1vZX3XkyGjJpPIXyyDn+dGTTcG8Rf1VKZMBkvLk8Xyh+SWKoEzAM0T22rcOmMq4GKl/hpUY68uo8xrY/NRFduyRWFRcJf1rElbhKlPMyxkEkIxYjQ8VwQ1DNmuhDkBCeaZtwq+4DUbEkjVDn2PwW1epfy9UAOO8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788391610; c=relaxed/simple;
	bh=x14xxxXEyedysVMarKCU2RwnTnnBwI+jsGvRcK08qmM=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=uYnrZxnLveL2ctmi36bPtwFBmfk9WS148Iy+GG1379tfg0Gd361LUi6wxKqaXffT3YG5vn0QWks38hEZrGFMRQ3htNTlFJjw64bXsoSJ9l6oAB7vbf2mF1TL2kWdEiyDjaVoiNw1urUepBWjvcz4qDeRfXl7xiOJafnVQZaWF4U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gaV05CQD; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=XpoTDtxH; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="gaV05CQD";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="XpoTDtxH"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 682NHgS82411915
	for <arm-scmi@vger.kernel.org>; Wed, 2 Sep 2026 23:26:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	3njgz9rqLz/snE4bZmzziBWQoLAdqrbyVgCfoTyS8RU=; b=gaV05CQDIXeIayc6
	ArOpHeepH7gPfPDdzosrDr8iw8RcGHvjqK19NpSh1Ddq8qG0nYa32PjRJ6h4jnMr
	hUf8BxUkjIOwvuYCCKGHjaITgMuefrqHTNsoKI4hCy7lJDhw3tkfUvLCuDlp4rn1
	yfc+T8bSaawf+fD1CmHY0siB5JqOH35ouoySDYkGgoFJ5akdHpcutFRmIf2p+mjx
	y5mriJKXEYRAkgGSYTrXX1KLut9qZO5SKmfGGklTYNvN4xqpcLi9SbXh8L89WQvo
	gXx/uBl76tMjHvOTj5VROfncD6aFIR//Ypt+yk3pzov9WydMOKY4jblJXLhDearT
	VVPdhA==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gemceat5h-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <arm-scmi@vger.kernel.org>; Wed, 02 Sep 2026 23:26:48 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-398dc3d8f0fso450357a91.0
        for <arm-scmi@vger.kernel.org>; Wed, 02 Sep 2026 16:26:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788391607; x=1788996407; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:organization
         :references:in-reply-to:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=3njgz9rqLz/snE4bZmzziBWQoLAdqrbyVgCfoTyS8RU=;
        b=XpoTDtxHAYVRC/dwxtN5PvbGAKDgbJ+SkmOExstLQgRwDvnzIq8erJCuO5sDyKbeGw
         wO+u6GhRXYG0WZU4GuhTYZQ2ETchml/zAdN09/cTaUBCXPS9JGHocKvcvGriv51+SEFu
         ngnvaNm3/saeXD4laVqrTuVzkFOztYMBkpfxA5iaBNaKtT4W/n3P4g5xOE9jddQ3AEJf
         lpnu7V9qlYBdqEGrkpLMRwJzxZWzJkBgC+/kRkGYnTxWlZ2qzZit+qNWN5O0RpgwsXhQ
         H3jFVIa9AImdGbQ2iSAkzpsCJNYr43dVHq4qN/qpyb1kcC2umeVQw1XigbGfgPDDfY+E
         ySLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788391607; x=1788996407;
        h=content-transfer-encoding:content-type:mime-version:organization
         :references:in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3njgz9rqLz/snE4bZmzziBWQoLAdqrbyVgCfoTyS8RU=;
        b=XUGiKbgIouxj0Q1GfWod3m4Ii2/QjY+rPiM2YtEuztfrk2cXqSR65aCZhvE7lSXVHD
         VZPRNbzLaR9GVdCPnH4ZKqP59ujx/l+Q+t6b+lJ0SJgofA1E7B2CeSn3oc839JQvvbAr
         4AN/UIb7nNwEkhKFOox0dPktTN8DgMK6ggwO/OWW0U3UkorPPa4vzs6cZ8sqPivpXKwY
         t6Fva1rdCgV+8dsAI0aHWUoqTiRD9ZKyyhPpK+N/J5Nt3fiPT0VNPAlNndiesYGVqlKa
         hnpwVRINKTD7622RYgoX25Lzc0U72Fetg2iDyJSQAEWE29hUX+k5pYz4XDP2O2LfZywn
         KoVA==
X-Gm-Message-State: AFuF++mzB/NMzpR3S1hKYNbf0PUvs6CsdaEZM/ocV2p8MXLs3OcPKZCG
	goXwL4XK/fNVr6JhJSaLp9zmePL1jDL6QrF3DJHkwGCmeHdSx380icfz7ItfuOOSQtObfhq42oB
	NfG3Mbxk3Us8r6eyf7tpN3rDSlDxAXcFL9mlSyjJLZ8kKr7ZSC7aVTZMiU9BVLw==
X-Gm-Gg: AYBFou2ZjtDnMxCqtN0NR3ZaEIc1G5xYvS/1V/+7LHAyi14Q/DVR6X2kLQWivWWZNJq
	4bp8D7X5gusf0z0yUwR5F3JlnvdnnDbUgc6vDcrlfN4L5hj2QQ+rIxDWg8/L9IHHM4UChn+dWSP
	vvR9Gqi+Or5d9Ivm4gQkASnWnJxws4aKHNeQ03yKJKt7F7peP9GlL2hBhT6988ZkUBk1XkglgRG
	+6ih7F9phkAwFkU/Y58IxJl+0c+SAuzw3CsS40pNa6TH9RsoSLQDhODi+5tpsWf2MqJIMdXQWGW
	St26fTD4NDU7aNqLGic1MhfyvKA4gbKw2W2wL+hO21GuMF+YzaqTmaYy30nkjtbEBNe5XxeAHF0
	CNSfm0Lofnu6tFXBtCD9S4T+57VM=
X-Received: by 2002:a17:90b:2249:b0:396:d28e:b53 with SMTP id 98e67ed59e1d1-39b0865350amr2327202a91.20.1788391607402;
        Wed, 02 Sep 2026 16:26:47 -0700 (PDT)
X-Received: by 2002:a17:90b:2249:b0:396:d28e:b53 with SMTP id 98e67ed59e1d1-39b0865350amr2327172a91.20.1788391606962;
        Wed, 02 Sep 2026 16:26:46 -0700 (PDT)
Received: from localhost ([50.35.44.179])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33256414c60sm1332213eec.24.2026.09.02.16.26.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2026 16:26:46 -0700 (PDT)
Date: Wed, 2 Sep 2026 16:26:42 -0700
From: Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>
To: Sudeep Holla <sudeep.holla@kernel.org>
Cc: arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        kernel-team@meta.com, Cristian Marussi <cristian.marussi@arm.com>,
        Breno
 Leitao <leitao@debian.org>,
        Andy Shevchenko
 <andriy.shevchenko@linux.intel.com>,
        Daniel Scally <djrscally@gmail.com>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Sakari Ailus
 <sakari.ailus@linux.intel.com>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Greg
 Kroah-Hartman <gregkh@linuxfoundation.org>,
        "=?UTF-8?Q?=E2=80=9CRafael?= J.
 =?UTF-8?Q?Wysocki=E2=80=9D?=" <rafael@kernel.org>,
        Danilo Krummrich
 <dakr@kernel.org>
Subject: Re: [PATCH v3 1/9] firmware: arm_scmi: Set fwnode for the generated
 SCMI platform device
Message-ID: <20260902162642.000008d9@oss.qualcomm.com>
In-Reply-To: <20260902-tireless-steadfast-mongoose-cccac7@sudeepholla>
References: <20260813-acpi_scmi_pcc-v3-0-cb6b88b4ebb3@kernel.org>
	<20260813-acpi_scmi_pcc-v3-1-cb6b88b4ebb3@kernel.org>
	<20260824095121.00001b9c@oss.qualcomm.com>
	<20260902-tireless-steadfast-mongoose-cccac7@sudeepholla>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAyMDIwOCBTYWx0ZWRfXwrl+Z8UV5Oe1
 ZE7YPq5Oq+tpR0chKB4l6/4MCJL7NzkiPseGzncKPPx5x7/1pruzy0QGBxABXeNIyrhP7OwjgCB
 aq+NC7iCJGMLzD+T6xeeLGskbMSjZOVTv9TQCNBEiQV51nZ3u949fz3JiIizoJC5xaqYAvZb94P
 1nXXrLwXc6cIy+wXgDHNS6/y6ilE1LD1DbaTq3g8s4TknUT5+kk3CDS8RxsX7iX818Yv2DfycQF
 axsoeqUWmc/T5XSyCPH9dfSs5xosd6JE4hGzedYpaJJGWW5l+3Hfnl88PvbO5yeRQ3dnNGxs+im
 bVExif/pv4whZWol59y52a7xIQtQ9nkeDeAfxkSlxxIAeVOP9XkZq5zXAFh/9xrzOCFb1w5qlvz
 3UCcRpC9SIn5aUIVyDPhtkRWmu0Wt4WqySZO+sz2rHhPL2P9QqMdBJCZHCoOB/TisVgtTtH9/fJ
 J5rOjH3y2Bk7g/5+fxQ==
X-Proofpoint-ORIG-GUID: YrvjUXg_8kcWtHqha_QYmmsDbE9OHjmb
X-Authority-Analysis: v=2.4 cv=QfpWeMbv c=1 sm=1 tr=0 ts=6a98b0b8 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=aNnz9XPx1a4JIXSYt2cE/A==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=VwQbUJbxAAAA:8 a=bmWpZdXelV54CUJQUpYA:9 a=CjuIK1q_8ugA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-GUID: YrvjUXg_8kcWtHqha_QYmmsDbE9OHjmb
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAyMDIwOCBTYWx0ZWRfX8IiSgfd+Y0Ci
 XSRK/me9uHEMokOEAPpAPnQ97hmhXNj9hK5zwAyIo9YGWI9iMAdqymaVJpfUvR4v7hvrXs08PVg
 7n3jSGb+c2ylAN18Ha1fSSDKRXNwW0s=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-02_06,2026-09-02_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 bulkscore=0 phishscore=0 suspectscore=0
 lowpriorityscore=0 malwarescore=0 adultscore=0 clxscore=1015 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609020208

On Wed, 2 Sep 2026 08:51:10 +0100
Sudeep Holla <sudeep.holla@kernel.org> wrote:

> On Mon, Aug 24, 2026 at 09:51:33AM -0700, Jonathan Cameron wrote:
> > On Thu, 13 Aug 2026 12:32:56 +0100
> > Sudeep Holla <sudeep.holla@kernel.org> wrote:
> >   
> > > Add a call to device_set_node() in the SCMI probe helper to associate
> > > generated SCMI platform device with the firmware node of its supplier
> > > transport device.
> > > 
> > > This complements device_set_of_node_from_dev() and ensures that
> > > firmware node information is propagated correctly for both Device Tree
> > > and non-DT (e.g. ACPI) based systems.  
> > 
> > Hi Sudeep,
> >   
> 
> Hi Jonathan,
> 
> Thanks for all the reviews. I was away for a while and started to look at
> addressing these now.
> 
> > When you say 'complement' I'd like to see a little more.  The guts
> > of both calls includes setting dev->ofnode() adn the extra bit
> > in device_set_of_node_from_dev() is about ensuring we drop existing
> > node reference (there isn't one) and increment the reference for what
> > is the parent of_node.
> >   
> 
> Yes I agree. At the time, when I hacked this up, I was supposed to take
> a look at it again which I never did.
> 
> > I may be wrong, but I think that is unnecessary and if I'm wrong I'd
> > like to see more info here on why it is needed.
> >   
> 
> No your concerns are valid. For reference-counted non-OF fwnodes like ACPI or
> software node, platform_device_release() drops the fwnode reference,
> but device_set_node() does not acquire one.
> 
> > Also, if this is commonly needed why doesn't device_set_node() include
> > that dance?
> >   
> 
> I think there are new helpers added recently in the tree, thinking of using
> then. See below.
> 
> > Unless I fumbled the command, a grep suggests there are no instances
> > in tree of these both being called near each other.
> >   
> 
> I did that too before adding but somehow kept it for future investigation.
> 
> 
> > Jonathan
> >   
> > > 
> > > Signed-off-by: Sudeep Holla <sudeep.holla@kernel.org>
> > > ---
> > >  drivers/firmware/arm_scmi/common.h | 1 +
> > >  1 file changed, 1 insertion(+)
> > > 
> > > diff --git a/drivers/firmware/arm_scmi/common.h b/drivers/firmware/arm_scmi/common.h
> > > index fe8c22cfb9f7..cc7d11c3c1f3 100644
> > > --- a/drivers/firmware/arm_scmi/common.h
> > > +++ b/drivers/firmware/arm_scmi/common.h
> > > @@ -650,6 +650,7 @@ static int __tag##_probe(struct platform_device *pdev)			       \
> > >  	}								       \
> > >  									       \
> > >  	device_set_of_node_from_dev(&spdev->dev, dev);			       \
> > > +	device_set_node(&spdev->dev, dev_fwnode(dev));			       \  
> 
> How about something like this instead of above 2 lines:
> 
> if (is_of_node(dev_fwnode(dev)))
> 	platform_device_set_of_node_from_dev(spdev, dev);
> else
> 	platform_device_set_fwnode(spdev, dev_fwnode(dev));
> 

To me, if the reference counting is useful (and I'm a bit doubtful about that)
platform_device_set_fwnode() should be doing it. +CC those who might have
more insight on this.

Jonathan


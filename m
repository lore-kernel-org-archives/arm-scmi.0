Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5511646F498
	for <arm-scmi@vger.kernel.org>; Mon, 24 Aug 2026 17:39:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787593191; cv=none; b=WT8rIyarcB9AaAFjALTD3cfrjdOUNkxh8z9MxDbi6NgLE+ilzi0fG8FxruG0Qa5R0G4t1Vb34ahvt9gH7k7cDtrlKWHEGhqXE5IF5WqTKlQPUrTGcxP4Li4CJQqQYI3H1+vJvT/ZvEcZSDmhBShV3ss3rME7LgjXLy4m8EIZSZ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787593191; c=relaxed/simple;
	bh=Xny/hrOqD1oEOxq6NIoNkjcerRA2pTiW+g9rdfhNFYE=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=SXlKbSAR8gAN1epvVq0IfTY1E6P0Iuqf/2ogzrkl9rPWV4RljtYgYf3ZrQhXmMPHAY4ce+mhTkC4PZnS4EEX0OdyRHaZm4MfXISjU/mulQsf1qEb80oiyfTC7BUrZmiMZeWq5ziMIRtkP7VeJnZuVnlxtY+ECFxMPxxuYTNsXHw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ldK4Y3rd; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=dH1sjykb; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ldK4Y3rd";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="dH1sjykb"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67OFnSSs2385103
	for <arm-scmi@vger.kernel.org>; Mon, 24 Aug 2026 17:39:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ZTqqyfXlrQZR+tgPwNCuQ6Puz8jpiT3Xr8JYooQceTg=; b=ldK4Y3rdqqT+6swR
	AiN/73jPFhP9uGIrKnBXEfOYfm1WKjw7XlcyVFrCPlnSwxMx1BUNTmI8zH8rU83q
	NEQ/Dw2G4QyDzIrTnppp8ho4HdZQNckqq6B6ae4rK1IpqDhzSIQ/TVAgcHojebji
	TSe+E0RAbAqvNBxKQd1/XKv+TdiLDpaCpbSr2Xjcj5Snhl/8iZVzfNfvCSdydN1I
	mXHjSKELL2SqjtvNiZWE2z34UHE+ol612e9Mmbe7TrqZgrbHmMjQoQ5cUcCLWpzA
	h6RO0L89F5pNpbVsu79VLNLtnRUamja0kSs/1JaPl3MoGzOS8hJUXNy5Zwnr7o2H
	cqGpLw==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g8kv7a0ck-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <arm-scmi@vger.kernel.org>; Mon, 24 Aug 2026 17:39:35 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-cbee5bab340so5153004a12.2
        for <arm-scmi@vger.kernel.org>; Mon, 24 Aug 2026 10:39:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787593175; x=1788197975; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:organization
         :references:in-reply-to:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=ZTqqyfXlrQZR+tgPwNCuQ6Puz8jpiT3Xr8JYooQceTg=;
        b=dH1sjykbJfjfZC1naFeL9IAXhS1UnD0ax5TqGabLidDXNfIUd5bTjD5xzvob4srxpA
         hry0izaYn+fLpP4Z5cdy8j6hh+rOBGVKByDj1r9SavvZMSecGfy8qClWz8AftV9dcXKa
         eLVgy9Fb8wi30J2PqgpBrjC1bIVxg4H+mqTQcaxlNPy8kK23Or+H/g2VlHOUzrYpH8ci
         9XcK4Bb10am2rtP5ZMOAlHDe8XWynkcUaPkkqyUysD8/fymFDFRp6fiWnNzdJ0AMvue2
         Zwxh7uXUeW+cwadnpwuxO+L7/cBfIQNgTgGaUXoL/URKCnKhrGYeaczvjG/pfdvGgSAu
         aKmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787593175; x=1788197975;
        h=content-transfer-encoding:content-type:mime-version:organization
         :references:in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZTqqyfXlrQZR+tgPwNCuQ6Puz8jpiT3Xr8JYooQceTg=;
        b=R2ynxgNRzJ3bJxJ9fzC5ck0dyUNgXY0PZdGJYHzB0GtRbeUUDTUJv3X5XZvikUlwJY
         MKGXzdN92aoycdaR+tUdzu3MviN7bI3d7/EQ/bXfrpOUWi9racBEW4eRFvT5fueKbdqy
         eT9+VaXPssgDymNREdvQjJ+pDTkn49LBPP3b8M2ypAryKAeDQOKM0aOyvKZk9MXshVWV
         d7norCbdbqKHCxE9YOUn7OzXTN8VNtJp7Q7prR1cXO+zMXuJ7wRZSSGAQct0flLKEVI4
         3DedYRziNAbNqLJ1+zNevfui/ZN5s/jVoZ6t6de+VXjYdqV17l7BNCMcVbqcQvO3F6/m
         uzYg==
X-Gm-Message-State: AFuF++lMjlgyhHvCy8qgs2wio6bGFZAxFuNAy5JON8hl1IPbUBXI5iGt
	egD65dzSQ7f0e6OEeK+uvKo8M9SzEO64Lwixkr3WgNxiwZ75H3MO2CgZinEEzwGXrb+VpuS8qtC
	u9yKqPgiRIJ9i4bSa8kH8j6pUZSpIt14w90RgnOzsxGTS0Sr+YcBF2K6U8259LA==
X-Gm-Gg: AR+sD1198zr32qYb7Q8MQxPlIwnQjaX1LJkJn/GVlv24UKCIb8Ko6fv+hEIYAWGx2e+
	lVST4QjRqy4I4CPnQcpRG3Q9j+nb4W32agGvwIe0mDE7vJ0CMGFwXp5J09BrI3GGbeUuGl0TJ6w
	j5Ge8LXwo8y494RsatO93Hp8DTl9KWYtOcUWet27zVOjt/NRMuOoRX1NttXsImiTcAoL9NUs+Po
	il6B30AnV6pKU86GyLh9HIsenh6rWE6sxK1g2gIZ+osdAXd5ruxzNtm1hXgDYPWDe+pTNP+wI9D
	T65SFtNXT2lzewLwcZnHTNp0xQPBh8WopzyzwHo5gVz1i7EZjTyzkawUrHAjXzxbkDjm2yW5rVN
	6jKDxpdbAeqdrcMqD1KQyaHsrAg==
X-Received: by 2002:a05:6a20:43ac:b0:3cb:8810:631d with SMTP id adf61e73a8af0-3cd2fdb913emr52171326637.1.1787593175193;
        Mon, 24 Aug 2026 10:39:35 -0700 (PDT)
X-Received: by 2002:a05:6a20:43ac:b0:3cb:8810:631d with SMTP id adf61e73a8af0-3cd2fdb913emr52171228637.1.1787593174717;
        Mon, 24 Aug 2026 10:39:34 -0700 (PDT)
Received: from localhost ([50.35.46.84])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-141860fe08csm41944772c88.8.2026.08.24.10.39.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Aug 2026 10:39:34 -0700 (PDT)
Date: Mon, 24 Aug 2026 10:39:29 -0700
From: Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>
To: Sudeep Holla <sudeep.holla@kernel.org>
Cc: arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        kernel-team@meta.com, Cristian Marussi <cristian.marussi@arm.com>,
        Breno
 Leitao <leitao@debian.org>
Subject: Re: [PATCH v3 3/9] firmware: arm_scmi: Convert OF-only paths to
 generic fwnode in SCMI core
Message-ID: <20260824103929.00004912@oss.qualcomm.com>
In-Reply-To: <20260813-acpi_scmi_pcc-v3-3-cb6b88b4ebb3@kernel.org>
References: <20260813-acpi_scmi_pcc-v3-0-cb6b88b4ebb3@kernel.org>
	<20260813-acpi_scmi_pcc-v3-3-cb6b88b4ebb3@kernel.org>
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
X-Authority-Analysis: v=2.4 cv=Cfg4Irrl c=1 sm=1 tr=0 ts=6a8c81d7 cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=qC1CW/w66vtJz1P9yTJxNA==:17
 a=kj9zAlcOel0A:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=v8xRkvQOyyHsUIWQxGAA:9 a=CjuIK1q_8ugA:10
 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI0MDE0OCBTYWx0ZWRfX/3tZ/9Bc+gY3
 iKEwlCho8+VzYAobexpnvhWi3y38DOq/kFVUENAa1eF2beRW9R6FRY349hwYXbHLZvxGNxu2hUB
 IHao2tg8G0Ok247V/Ltr+ZwBQOt4+VQ=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI0MDE0OCBTYWx0ZWRfX7Zl7DjwFeiyA
 WPoWnxQNsMqvbW8Eb+3AJ4Jfy4D+mdmdxxiMJA6XvD+8fILW2qJpZkcqJttw7e/29OF+so3jMDc
 aTSPWCyLaqLEAICi/u6PQwu4FxUNIuIKBKmQhAdOKYP/1w13XSbuZbKit8k/VdhPa+hFbYv73vS
 icWn4tZXVLXHuYPng7TnEgBZnAWKBS9KiScgLQ4vNjjRECOtfPYmMMNl2uOWWlawy7qWdaZ6Q2o
 6Pm342PEPd60eum5gexSEah5u0rS7Kx/zLLnE8lr8PqOri3JANAorlCUXnLnkLGiJLWKyY5RSR8
 NCFqq526FKrlMBKVXKO8AzQnBCsU0HjuhU4YnkiQ52dA+u3kMEDL9UO6iapqOQL4KmLYjixBqgw
 9tWPc2iIGQsp+ny7C27ZoMRcTuszOOROgQLIFKLTB9R8aR4EAcHRkK98fHV7Zexr4EDpPvsgBfq
 vHw8OwXGZ4e9nV+3RRQ==
X-Proofpoint-ORIG-GUID: lPmZWu5Vn_oAXCmnA-bjhJw0bEoLNlag
X-Proofpoint-GUID: lPmZWu5Vn_oAXCmnA-bjhJw0bEoLNlag
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-24_05,2026-08-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 phishscore=0 impostorscore=0 spamscore=0 suspectscore=0
 priorityscore=1501 malwarescore=0 clxscore=1015 lowpriorityscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608240148

On Thu, 13 Aug 2026 12:32:58 +0100
Sudeep Holla <sudeep.holla@kernel.org> wrote:

> Switch SCMI core plumbing from struct device_node * to struct
> fwnode_handle * so the core can describe SCMI instances and protocols using
> firmware nodes rather than OF nodes directly.
> 
> This change:
>   - Replaces core OF property lookups with fwnode_property_*() helpers.
>   - Switches child enumeration to
>     fwnode_for_each_available_child_node_scoped().

Why the scoped version? See inline for more on this.  Probably just needs
a comment here (or use the non _scoped variant)

>   - Plumbs fwnode through the SCMI device creation and channel setup paths.
>   - Updates transport ->chan_available() callbacks to take a fwnode.
>   - Stores per-protocol child fwnodes in info->active_protocols so the core
>     can later locate the descriptor for a given protocol ID.
>   - Updates mailbox/optee/smc/virtio transports to accept fwnodes and map
>     back to OF nodes where their existing parsing remains DT-specific.
> 
> DT-only transports such as mailbox, OP-TEE and SMC still parse DT
> properties by mapping the fwnode back to an OF node. On non-DT systems
> these transports report no channel available.
> 
> This is a mechanical step towards firmware-node neutrality and prepares the
> SCMI core for non-DT transports, such as an ACPI/PCC transport. DT users
> continue to work unchanged; no non-DT transport is enabled by this patch.
> 
> Signed-off-by: Sudeep Holla <sudeep.holla@kernel.org>

A few minor things - with those cleaned up.  Only the cleanup.h one really
matters.

Reviewed-by: Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>

> diff --git a/drivers/firmware/arm_scmi/driver.c b/drivers/firmware/arm_scmi/driver.c
> index ef29fd223287..9014723e0f7f 100644
> --- a/drivers/firmware/arm_scmi/driver.c
> +++ b/drivers/firmware/arm_scmi/driver.c

...

> @@ -3352,10 +3354,10 @@ static int scmi_probe(struct platform_device *pdev)
>  
>  	scmi_enable_matching_quirks(info);
>  
> -	for_each_available_child_of_node(np, child) {
> +	fwnode_for_each_available_child_node_scoped(dev_fwnode(dev), child) {

There are no early exits yet and I can't see any added later in the series.
So the scoped bit is irrelevant.  I don't mind the change on basis of
hardening or similar but it needs a comment in the patch description to 
justify that.

>  		u32 prot_id;
>  
> -		if (of_property_read_u32(child, "reg", &prot_id))
> +		if (fwnode_property_read_u32(child, "reg", &prot_id))
>  			continue;
>  
>  		if (!FIELD_FIT(MSG_PROTOCOL_ID_MASK, prot_id)) {
> @@ -3370,8 +3372,8 @@ static int scmi_probe(struct platform_device *pdev)
>  		}
>  
>  		/*
> -		 * Save this valid DT protocol descriptor amongst
> -		 * @active_protocols for this SCMI instance/
> +		 * Save this valid fwnode protocol descriptor amongst
> +		 * @active_protocols for this SCMI instance.
>  		 */
>  		ret = idr_alloc(&info->active_protocols, child,
>  				prot_id, prot_id + 1, GFP_KERNEL);
> @@ -3381,7 +3383,7 @@ static int scmi_probe(struct platform_device *pdev)
>  			continue;
>  		}
>  
> -		of_node_get(child);
> +		fwnode_handle_get(child);
>  		scmi_create_protocol_devices(child, info, prot_id, NULL);

Give this is handing over ownership I'd make that explicit and do

		scmi_create_protcol_devices(fwnode_handle_get(child), info,
					    prot_id, NULL);
but that is a slightly unrelated change - so I don't mind if you don't change
this one.

>  	}
>  
...



> diff --git a/drivers/firmware/arm_scmi/transports/smc.c b/drivers/firmware/arm_scmi/transports/smc.c
> index 1fce3ccdeb7f..1079cd01190b 100644
> --- a/drivers/firmware/arm_scmi/transports/smc.c
> +++ b/drivers/firmware/arm_scmi/transports/smc.c
> @@ -84,10 +84,15 @@ static irqreturn_t smc_msg_done_isr(int irq, void *data)
>  	return IRQ_HANDLED;
>  }
>  
> -static bool smc_chan_available(struct device_node *of_node, int idx)
> +static bool smc_chan_available(struct fwnode_handle *fwnode, int idx)
>  {
> -	struct device_node *np __free(device_node) =
> -					of_parse_phandle(of_node, "shmem", 0);
> +	struct device_node *of_node = to_of_node(fwnode);
> +	struct device_node *np __free(device_node) = NULL;

See guidance in cleanup.h.  Basically says constructor and destructor
must be together (that was after some grumpy replies from Linus to early
cleanup.h users!)

> +
> +	if (!of_node)
> +		return false;
> +
> +	np = of_parse_phandle(of_node, "shmem", 0);
	struct device_node *np __free(device_node) =
		of_parse_phandle(of_node, "shmem", 0);

And don't worry about the inline declaration - this case is specifically
allowed.

>  	if (!np)
>  		return false;


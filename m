Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7844C376BF4
	for <arm-scmi@vger.kernel.org>; Tue, 16 Jun 2026 19:50:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781639407; cv=none; b=V0qS8yFQUacvJ7F0kNHnex+dPA2TZvXLiKidi1+ZmqqWCE3nGhTXA5H9rPkEBQRA9CW8SMDoGsEr7Wm3NDdwWYcYyP7zqfGovJhm3AdDujOVcJ1frc7Z0DgeoG9OFnHr1ECOPaS6fnamnOALaeqG35860qTJwR2PoKOrCf7k21A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781639407; c=relaxed/simple;
	bh=d/rR3KtKS/aaSnkoWjt4cb/cgXgvu6Q/qT/rtiSARWU=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=fkek1vD6HG8ViNWpJpUGHz0AdrGSwI8KhR8BH/MlFwRBE6rausw43RgnbO1bGvy3WweKnpW47fSg2uStXbUTMBzyu8CmrLfTr07n5EbEsovoOYIRumq9LJcLH7IPP7ilPx9byf4AHdVAx2krvk92tP9Ul8RflTRORUJpBwpE7Mk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=OG0bAwod; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Af+GXLbj; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="OG0bAwod";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Af+GXLbj"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65GIOkGV140009
	for <arm-scmi@vger.kernel.org>; Tue, 16 Jun 2026 19:50:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	mGsMkJgam8EBung0dk0OiaiHmA1xJP7v0n8Hj/9uW6Q=; b=OG0bAwodm9r6cATx
	NnKo8aUVOXegxwYWnumlVvfKZ8nOYJH96M6iigIy8xmBq8FNuJKt2x1F1RghWfCQ
	FcsbPHBwkD0oQ4lqKLewTxrgNhChXGvL34KyDj0+ZIwYJck7Bdz+dgrrgK2t2zHn
	Bq1YrL7dMpVuLZ1j14SC9L8J+/nSw/bVfyady2aCl3TnmSbmTK8+Bsv1qDOCgXMT
	thNi5F/oYfo6KLP1rOZESomGUvvyFLSE2F5ySXSwOi3eDyd6wJKFYCcyABpdvz62
	taeAkJkiRxRKEKc/W3pYpko4C0V47sjhDoVRDh3ndU5jxJCL5eLmCBX7Y9Ak8lLG
	tVwFDg==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eu1ysuejs-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <arm-scmi@vger.kernel.org>; Tue, 16 Jun 2026 19:50:04 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-91931144870so648070385a.1
        for <arm-scmi@vger.kernel.org>; Tue, 16 Jun 2026 12:50:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781639404; x=1782244204; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=mGsMkJgam8EBung0dk0OiaiHmA1xJP7v0n8Hj/9uW6Q=;
        b=Af+GXLbj36NidpelER32gJa9D5a/AL8rME5h7esIh7vUo7QqAtFM7UZ3lUkkvErTMy
         FnzxLsN7MJDZS8IX0s28sFZSwI5eFE415UXguBKXEWRyzSOMA+NTdJNETx7W8zHabXEb
         Jw+7YxkctXzDi0apgGo79TZxvOBkFPc61Pc1MWDQQdGYdDv1RdFrqJaIzbgo4Q8wX9Oq
         8LwfkjPKswj0Z8dtc6PCumqsgY36OL3TY8IeweR0BB6Ndsc5Ud0Sbys9KN5xF2mopRxP
         FGnAzzo7m97A7p138DzBZreyz5QTFixzrJWiNqoceCxr2T/2owKhDiT2hFqLgtTon1Rm
         xOnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781639404; x=1782244204;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=mGsMkJgam8EBung0dk0OiaiHmA1xJP7v0n8Hj/9uW6Q=;
        b=SV8oNdMcnqoePlESx3wVmh7h8sEvh9NfqXmVOrMNSnOSbAC4WTq2kWs1T3hXWEZe5Y
         W1RavCgw9FETNACHCkECTswO8VA32P0+AKqYEjQRjniuPs4SPPt8ve9bng0HPHEwgc5G
         VyDPGL5qKexBHb/x0zTyixPY4Ik+xHb3yGrQSf2jQWHmPiBa6qIrIxZmTcLRbBLhfCJz
         BfzJwWTPrHXVo6wnefMZIaAt9qvcTa3KZDdlY/hSHBNK7MIR9JoZ/THmZqPgj5ICGO7n
         sTzf48FNF6MxTjTSMcPd1WEDrhY0aSdWiOHAlcgSU20hRnyAhuULzFp0mlzLoGIFlgJB
         THVQ==
X-Gm-Message-State: AOJu0YwX7LG/tm1hyFyUfJ7zqrc64zOCJMz0wU5V7pfvVptLrVybaGu0
	w4aWFFzwBA0/1jGpITPeYQQJWPNRd2OkBGpRWt5T5JFu8YpO2JCNUvgLpJAaUYxQN3XqWDmQkJT
	XnvY2Sx3X5Kqe/Y3+oWc+OtHWxBYRGs3yTqTpIfZ7w+m13qiHkTXV3usQJXo6Kg==
X-Gm-Gg: Acq92OFSB2BSu4NmUDSfr80hfIJsLaawBgxQzETDeJKARKdrTZke29YHBVOEJvGhsCQ
	GFSlWInKOpXABtvvwREDIkfu/9F2ozvylPodr7zgk7bvak9Y9FYJKExCqNeBFZLy3CeMYdGzFzY
	I5fB+lbbW2jG1Xrr8UE4Yi3NyU/VQKcy3uO5f1msRCtRmZKQWuiba3yuYK9+HokkH4NZgj1iad7
	kkyAj2ufeHqmMMn8T7T4+vF3bFoWFtWXQYKYJjkrlmlh0o6N1kIO1GJOXrUpHKRmImF7CVVU4ni
	Dqc0KIDv9qaCVihBrDvcxnKWWp6Om1fgvNbm2tUURezBUrHgqCHDUm44O1KkHZIZ9d+EF/gc0nq
	D1gedqZe6mxzijVYU+64bmIiEbM073DX1Eog/iow+QhyoSZrWSChTMovX6m/RbaENNM9XnK2IFa
	nSoybOq2Obtn0vRw9pt3YP2TWdbyVCWjLaRl+pVNEXHGioN8ZQKpAd7daaxong3cehITy0GG9az
	k7wKYOR809HZ9fC
X-Received: by 2002:a05:620a:2908:b0:915:d32a:1cba with SMTP id af79cd13be357-91dbc52c4damr54820985a.27.1781639403565;
        Tue, 16 Jun 2026 12:50:03 -0700 (PDT)
X-Received: by 2002:a05:620a:2908:b0:915:d32a:1cba with SMTP id af79cd13be357-91dbc52c4damr54813385a.27.1781639402784;
        Tue, 16 Jun 2026 12:50:02 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-693791c5d33sm5431930a12.8.2026.06.16.12.49.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 16 Jun 2026 12:50:01 -0700 (PDT)
Message-ID: <38433aed-dafa-4275-ba0a-237a1db645d9@oss.qualcomm.com>
Date: Tue, 16 Jun 2026 21:49:58 +0200
Precedence: bulk
X-Mailing-List: arm-scmi@vger.kernel.org
List-Id: <arm-scmi.vger.kernel.org>
List-Subscribe: <mailto:arm-scmi+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:arm-scmi+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Hans de Goede <johannes.goede@oss.qualcomm.com>
Subject: Re: [PATCH 1/2] module: add SCMI device table alias support
To: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>,
        Sudeep Holla <sudeep.holla@kernel.org>,
        Cristian Marussi <cristian.marussi@arm.com>,
        Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>
Cc: arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org
References: <20260616-scmi-modalias-v1-0-662b8dd52ab2@oss.qualcomm.com>
 <20260616-scmi-modalias-v1-1-662b8dd52ab2@oss.qualcomm.com>
Content-Language: en-US, nl
In-Reply-To: <20260616-scmi-modalias-v1-1-662b8dd52ab2@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: fofzC7ajySryuVHxhQqQIm5pxxijt4Q9
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE2MDIwMSBTYWx0ZWRfX0RFVYJF1I5ti
 8twj59hRU/ILzcOs2M/TcEq+ql4Sn8YIvtctsK7a0p0U4HdbqF3XA7gPTu4eZOKRRc9k5dMfxwZ
 e4okUSlclNW8tmKcwknQU7X0PV3488E=
X-Proofpoint-ORIG-GUID: fofzC7ajySryuVHxhQqQIm5pxxijt4Q9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE2MDIwMSBTYWx0ZWRfX+gcKBdLSe8yz
 181DpiCcCQsIBax4Cnj9zN+pB73NapHYQ+CDorcRBZr6PO0PgK54qShw3k6iOp9NoDgeB8qP/DW
 Zz3i1eEHomTDa4pruggObYZaEpHnF6CcNe/tVchL49DuRnMopIQeglMUuKYsNbR5zTUsSlbcbio
 vC8lfcP4sWPMrot48Wd2QLzxevKZ9oYz+qaN2Ktdsm4KjAbhfdkF2Exuo7gkbZC2XkggE8dub21
 0WswK14DdTRxKLkKQEwbrgQ/f9weIbH5jcxvRnSdboTNoWnxLxjNcGWdGlyOOkAbhZwIsO9G2fB
 jRwkJ+fDfmJdOEXT2dJ5GFBwHHavYaxv6uOEnT58JnlO7skWN2803LuBbmdbmM9pKNNAMRc5SqK
 9DuMnAae78ptC8zoss5jraCe1cIrM6giag0aqFLup2IeSf4Ey4YLIGDVwMRttYj2WIlAW4cakrE
 XaOSCkKsl2BaB/uEm5g==
X-Authority-Analysis: v=2.4 cv=JJcLdcKb c=1 sm=1 tr=0 ts=6a31a8ec cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8
 a=W37sn8zWFLRx4f5Wf2kA:9 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-16_05,2026-06-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 clxscore=1011 bulkscore=0 malwarescore=0 suspectscore=0
 phishscore=0 priorityscore=1501 adultscore=0 impostorscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606040000
 definitions=main-2606160201

Hi,

On 16-Jun-26 20:09, Bjorn Andersson wrote:
> SCMI client drivers already describe their bus match data with
> MODULE_DEVICE_TABLE(scmi, ...), but modpost does not know how to consume
> SCMI device tables. As a result, SCMI modules do not get generated module
> aliases from their id tables.
> 
> Move struct scmi_device_id to mod_devicetable.h so it has a fixed layout
> visible to modpost, add the corresponding generated offsets and teach
> file2alias to emit scmi:<protocol>:<name> aliases.
> 
> Use the same stable alias format for SCMI device uevents and sysfs
> modaliases. The previous string included the instance-specific device
> name, which is not useful for matching modules.
> 
> Assisted-by: Codex:GPT-5.5
> Signed-off-by: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>

Thank you for this. One small nit, you add:

#include <linux/mod_devicetable.h>

to include/linux/scmi_protocol.h

But that header only declares pointers to struct scmi_device_id.
so you can just forward declare the struct type there and
then only include linux/mod_devicetable.h in places which actually
need it, rather then dragging all of linux/mod_devicetable.h
into any file which includes linux/scmi_protocol.h .

Some people are working on untangling the kernel headers for
faster compile times. So IMHO it would be good to not introduce
new cases of headers unnecessary including other headers.

Either way the patch looks good to me:

Reviewed-by: Hans de Goede <johannes.goede@oss.qualcomm.com>

Regards,

Hans





> ---
>  drivers/firmware/arm_scmi/bus.c   | 19 +++++++++----------
>  include/linux/mod_devicetable.h   | 11 +++++++++++
>  include/linux/scmi_protocol.h     |  6 +-----
>  scripts/mod/devicetable-offsets.c |  4 ++++
>  scripts/mod/file2alias.c          | 11 +++++++++++
>  5 files changed, 36 insertions(+), 15 deletions(-)
> 
> diff --git a/drivers/firmware/arm_scmi/bus.c b/drivers/firmware/arm_scmi/bus.c
> index 793be9eabaed..7e344f2ee18d 100644
> --- a/drivers/firmware/arm_scmi/bus.c
> +++ b/drivers/firmware/arm_scmi/bus.c
> @@ -13,11 +13,12 @@
>  #include <linux/of.h>
>  #include <linux/kernel.h>
>  #include <linux/slab.h>
> +#include <linux/string.h>
>  #include <linux/device.h>
>  
>  #include "common.h"
>  
> -#define SCMI_UEVENT_MODALIAS_FMT	"%s:%02x:%s"
> +#define SCMI_UEVENT_MODALIAS_FMT	SCMI_MODULE_PREFIX "%02x:%s"
>  
>  BLOCKING_NOTIFIER_HEAD(scmi_requested_devices_nh);
>  EXPORT_SYMBOL_GPL(scmi_requested_devices_nh);
> @@ -141,7 +142,7 @@ static int scmi_protocol_table_register(const struct scmi_device_id *id_table)
>  	int ret = 0;
>  	const struct scmi_device_id *entry;
>  
> -	for (entry = id_table; entry->name && ret == 0; entry++)
> +	for (entry = id_table; entry->name[0] && ret == 0; entry++)
>  		ret = scmi_protocol_device_request(entry);
>  
>  	return ret;
> @@ -197,18 +198,18 @@ scmi_protocol_table_unregister(const struct scmi_device_id *id_table)
>  {
>  	const struct scmi_device_id *entry;
>  
> -	for (entry = id_table; entry->name; entry++)
> +	for (entry = id_table; entry->name[0]; entry++)
>  		scmi_protocol_device_unrequest(entry);
>  }
>  
>  static int scmi_dev_match_by_id_table(struct scmi_device *scmi_dev,
>  				      const struct scmi_device_id *id_table)
>  {
> -	if (!id_table || !id_table->name)
> +	if (!id_table || !id_table->name[0])
>  		return 0;
>  
>  	/* Always skip transport devices from matching */
> -	for (; id_table->protocol_id && id_table->name; id_table++)
> +	for (; id_table->protocol_id && id_table->name[0]; id_table++)
>  		if (id_table->protocol_id == scmi_dev->protocol_id &&
>  		    strncmp(scmi_dev->name, "__scmi_transport_device", 23) &&
>  		    !strcmp(id_table->name, scmi_dev->name))
> @@ -245,7 +246,7 @@ static struct scmi_device *scmi_child_dev_find(struct device *parent,
>  	struct device *dev;
>  
>  	id_table[0].protocol_id = prot_id;
> -	id_table[0].name = name;
> +	strscpy(id_table[0].name, name, sizeof(id_table[0].name));
>  
>  	dev = device_find_child(parent, &id_table, scmi_match_by_id_table);
>  	if (!dev)
> @@ -282,8 +283,7 @@ static int scmi_device_uevent(const struct device *dev, struct kobj_uevent_env *
>  	const struct scmi_device *scmi_dev = to_scmi_dev(dev);
>  
>  	return add_uevent_var(env, "MODALIAS=" SCMI_UEVENT_MODALIAS_FMT,
> -			      dev_name(&scmi_dev->dev), scmi_dev->protocol_id,
> -			      scmi_dev->name);
> +			      scmi_dev->protocol_id, scmi_dev->name);
>  }
>  
>  static ssize_t modalias_show(struct device *dev,
> @@ -292,8 +292,7 @@ static ssize_t modalias_show(struct device *dev,
>  	struct scmi_device *scmi_dev = to_scmi_dev(dev);
>  
>  	return sysfs_emit(buf, SCMI_UEVENT_MODALIAS_FMT,
> -			  dev_name(&scmi_dev->dev), scmi_dev->protocol_id,
> -			  scmi_dev->name);
> +			  scmi_dev->protocol_id, scmi_dev->name);
>  }
>  static DEVICE_ATTR_RO(modalias);
>  
> diff --git a/include/linux/mod_devicetable.h b/include/linux/mod_devicetable.h
> index 3b0c9a251a2e..769382f2eadd 100644
> --- a/include/linux/mod_devicetable.h
> +++ b/include/linux/mod_devicetable.h
> @@ -473,6 +473,17 @@ struct rpmsg_device_id {
>  	kernel_ulong_t driver_data;
>  };
>  
> +/* scmi */
> +
> +#define SCMI_NAME_SIZE		32
> +#define SCMI_MODULE_PREFIX	"scmi:"
> +
> +struct scmi_device_id {
> +	__u8 protocol_id;
> +	char name[SCMI_NAME_SIZE];
> +	kernel_ulong_t driver_data;
> +};
> +
>  /* i2c */
>  
>  #define I2C_NAME_SIZE	20
> diff --git a/include/linux/scmi_protocol.h b/include/linux/scmi_protocol.h
> index 5ab73b1ab9aa..48b346a26068 100644
> --- a/include/linux/scmi_protocol.h
> +++ b/include/linux/scmi_protocol.h
> @@ -10,6 +10,7 @@
>  
>  #include <linux/bitfield.h>
>  #include <linux/device.h>
> +#include <linux/mod_devicetable.h>
>  #include <linux/notifier.h>
>  #include <linux/types.h>
>  
> @@ -951,11 +952,6 @@ struct scmi_device {
>  
>  #define to_scmi_dev(d) container_of_const(d, struct scmi_device, dev)
>  
> -struct scmi_device_id {
> -	u8 protocol_id;
> -	const char *name;
> -};
> -
>  struct scmi_driver {
>  	const char *name;
>  	int (*probe)(struct scmi_device *sdev);
> diff --git a/scripts/mod/devicetable-offsets.c b/scripts/mod/devicetable-offsets.c
> index b4178c42d08f..da5bd712c8da 100644
> --- a/scripts/mod/devicetable-offsets.c
> +++ b/scripts/mod/devicetable-offsets.c
> @@ -144,6 +144,10 @@ int main(void)
>  	DEVID(rpmsg_device_id);
>  	DEVID_FIELD(rpmsg_device_id, name);
>  
> +	DEVID(scmi_device_id);
> +	DEVID_FIELD(scmi_device_id, protocol_id);
> +	DEVID_FIELD(scmi_device_id, name);
> +
>  	DEVID(i2c_device_id);
>  	DEVID_FIELD(i2c_device_id, name);
>  
> diff --git a/scripts/mod/file2alias.c b/scripts/mod/file2alias.c
> index 8d36c74dec2d..a5283f4c8e6f 100644
> --- a/scripts/mod/file2alias.c
> +++ b/scripts/mod/file2alias.c
> @@ -852,6 +852,16 @@ static void do_rpmsg_entry(struct module *mod, void *symval)
>  	module_alias_printf(mod, false, RPMSG_DEVICE_MODALIAS_FMT, *name);
>  }
>  
> +/* Looks like: scmi:NN:S */
> +static void do_scmi_entry(struct module *mod, void *symval)
> +{
> +	DEF_FIELD(symval, scmi_device_id, protocol_id);
> +	DEF_FIELD_ADDR(symval, scmi_device_id, name);
> +
> +	module_alias_printf(mod, false, SCMI_MODULE_PREFIX "%02x:%s",
> +			    protocol_id, *name);
> +}
> +
>  /* Looks like: i2c:S */
>  static void do_i2c_entry(struct module *mod, void *symval)
>  {
> @@ -1491,6 +1501,7 @@ static const struct devtable devtable[] = {
>  	{"virtio", SIZE_virtio_device_id, do_virtio_entry},
>  	{"vmbus", SIZE_hv_vmbus_device_id, do_vmbus_entry},
>  	{"rpmsg", SIZE_rpmsg_device_id, do_rpmsg_entry},
> +	{"scmi", SIZE_scmi_device_id, do_scmi_entry},
>  	{"i2c", SIZE_i2c_device_id, do_i2c_entry},
>  	{"i3c", SIZE_i3c_device_id, do_i3c_entry},
>  	{"slim", SIZE_slim_device_id, do_slim_entry},
> 


Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.182
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794836734;
	b=1kRwPseDwXOP3DRvEomU9eZynVyvcfOUTEdYfVL19TuqV9DGOrLXdWTA4sNur29VCmnC
	 e5XBCWticCmjXCmlzbHhfjk8msGnjMpaKlBVoCr9ciRM7pPe4+1obhbKydgBJjRHJjz8p
	 WuS+SjLLkd3gUw7H7Ff3oBFj6MzxxxXZ9GkJTwljT07VLg45nG++nsHnPlVSeGOJB1gtv
	 PZmx+6mDXvT0P01n3xmKqk0BLOW80HA8vMJj9HXC+E8nL6UivD7UMSPsnCPBs5Nvut4oH
	 hIpQgchh6LtpZHtXCvwDIXvTIgBlu9XWKV57ewT+Xstsai02tAPGoYKg/G8LDPlW0UA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794836734;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Reply-To:Subject:
	 Content-Language:To:Cc:References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=HHhT6Qo81+qqfHiAP1aXCUEzb0E+3rfD32/ByjPjT00=;
	b=rQ+FuXdxfXQSF3QqNQsGCIllQAlySJQM3WIOPVMxNYKLCW3P0mKgVJr8nN8gFEXNJcer
	 lzURtT1r0pnxsK96OV7fwASEW1x6p6e8p53Z0oehnArXH9xGVaaxF1lOThBnWcBjlsQNP
	 OvQHe6EGbfEisBH5+dH5zEYJg18dbRIOXegjhOm8FGPKMcJKSNqqcUnXgv9Lf6e6/bM5C
	 xvD9+YtH94Q6ipbmVq9dMFW9cakTRpsbiECLB3qfXT5g1tcUZg2J4BgEeNswz7TY9YwDW
	 ca/eRW1oNfCbcXwZC9Y2QxWcM+rnsmS0O8JJDjJUoInbJlPRvQiwmT/rZlwWKc9JaMg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=s4f+gDhB;
	arc=none smtp.remote-ip=209.85.214.182
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BB72606A336
	for <arm-scmi@vger.kernel.org>; Mon, 16 Nov 2026 13:45:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8BB72606A336
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=s4f+gDhB
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-2ed06b725fdso30763105ad.0
        for <arm-scmi@vger.kernel.org>; Mon, 16 Nov 2026 05:45:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794836733; x=1795441533; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:content-language:subject:reply-to:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HHhT6Qo81+qqfHiAP1aXCUEzb0E+3rfD32/ByjPjT00=;
        b=s4f+gDhBscXhRooJhch5qxUAkSkZypQ1goeVJZx+HOFbJYpHs8fPkyx92QifmChYgj
         s5WBjf+4JvxkQFmcPHnpAMpEu1obLMXSYIcrcWhmGpOYeQa7ZeWd8jje0esSFl7GiBhd
         pgjKIW23MhZM76HZ0nUOrlTr/C2nfdOuFbZQuN6lGPgn7iEIH83PTPi2sYzbMiyaRg1N
         9EtdOnjVB8cuKpFHmojQxmSOgS32yaXZZDaK49mUobqsi+Awk5duYQ5VswQH2NNvty9l
         N4MfNqz8hYXYG642iytGPbEVl4czycrL6yAHfypNNR6ieZk1j/AegJUeGqzMbfGoiBv2
         DVyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794836733; x=1795441533;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:content-language:subject:reply-to:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HHhT6Qo81+qqfHiAP1aXCUEzb0E+3rfD32/ByjPjT00=;
        b=GL8d05HXSxrKW9O40WAHA2jGOug3hLrBUEpQ/hZZUxxZbg/W9VZDJY4KCIAbUib2TZ
         7kM+FQ9K3YJBhIcXvI4rUTlva9+whjPEAnF6rmyddsOaYzDCL24brxxdRx0WKECckIb2
         JTrQvEonN0C7v87CldF7/3Zi4nfaXxmrPnNL12nxNHANqNPPlGSHKwYOgk24iYikixzP
         Mh755786WDkkmlKGos/bPWnjZYdkLt4tRAgwZgiK2cj0YT68A60b8IkzjJm/4liSo7Jt
         +yYi25iubbnwRh9NOBoSS60942NoxncXW3bpBLjOCXfP0ch0+u/Ydze8MjbmQco5sd3I
         b90w==
X-Forwarded-Encrypted: i=1; AL+hErH9GMyv4Z9TvRnPOjq/LbkiM+eMRDN1h9DItma2RfLBLhEBt92kQlN6f+hq3fA9XfWLrGlkavgS+w==@vger.kernel.org
X-Gm-Message-State: APuU4Z9kFu0V27+VqBpcaPf/tDlyjgGrRf1IbqRNMriHaGkwZYu2qF7Q
	Yashbxdw6dj0ic+me//o2zyrsOdHnoWcVDVAOujoHpcMU87MaAwomH50
X-Gm-Gg: AZFdTZcESse+osM4hrKMRE/6ZcNuhMGaE4jGiMDqyTBzt8ufs+kZ7CsEz3pA1rL88Fh
	tZj4IIeDlmsZjBbkEQzqX6MgJQdcR8VQ1IWxNPFG3dvSmYxxAVZOzYn7OOmkbSfjSDyfZhohIyC
	IglUKsSFVdR/T8AUY4SLSsJenDSpzjCWwjJYekbxkegcrxfShKHIrOfxqXpuFL9LDmzCuQ6+Uo2
	aODakp6PnS9rLNVjinrGtVHKXEFTF7J4ASWOivEOXDISDv2YONEyysdkwlu6U5+FCK6CDKdNB/q
	xGNSsas0dCioRATyxHyzJ7UPZbNZ3+34guo/Pu6F56AWMM+JS4Um0x64BCetZcP6PfYwsgoiFMq
	ZwCiB9apZlRZxiFMXnJo0mqks/RFFGFDR67NOmW0E+ztW06r6EiVhNCe7qu94pk1ewi7yzzuEVi
	7KOahEaaMFOZVwfSxylyJvoJ06EzO5Di3IN7wEB9bxtHdf8fA8EJdzzh9ZmA0NpKEa6RcbNWjBp
	FAXipzkBo0a2eCMs3sf2xdAfQts7A0YaIuWqEPas3jrIXd8BTVPUnqC1H0HLwXbvDONqMYcMK1j
	R38M62A1iQtFXWUfMt/jTCBgmztliAjskTmmL3Lxb8coMoEEsd/Szgt+HkN4ac2NiAI=
X-Received: by 2002:a17:903:1c9:b0:2ed:238b:7db1 with SMTP id d9443c01a7336-2ee0dd2a2admr72241505ad.13.1794836732598;
        Mon, 16 Nov 2026 05:45:32 -0800 (PST)
Received: from [192.168.35.99] ([218.50.238.131])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ee0f868203sm37637585ad.49.2026.11.16.05.45.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Nov 2026 05:45:32 -0800 (PST)
Message-ID: <9fbd4a2a-d28a-4dc0-a4e3-0e91e7c160f7@gmail.com>
Date: Mon, 16 Nov 2026 22:45:25 +0900
X-Mailing-List: arm-scmi@vger.kernel.org
List-Id: <arm-scmi.vger.kernel.org>
List-Post: <mailto:arm-scmi@vger.kernel.org>
List-Help: <mailto:arm-scmi+help@vger.kernel.org>
List-Subscribe: <mailto:arm-scmi+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:arm-scmi+unsubscribe@vger.kernel.org>
List-Owner: <mailto:arm-scmi+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Reply-To: chanwoo@kernel.org
Subject: Re: [PATCH RFC v7 4/9] PM / devfreq: Add new target_freq attribute
 flag for governors
Content-Language: ko
To: Pragnesh Papaniya <pragnesh.papaniya@oss.qualcomm.com>,
 Sudeep Holla <sudeep.holla@kernel.org>,
 Cristian Marussi <cristian.marussi@arm.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Sibi Sankar <sibi.sankar@oss.qualcomm.com>,
 MyungJoo Ham <myungjoo.ham@samsung.com>,
 Kyungmin Park <kyungmin.park@samsung.com>,
 Chanwoo Choi <cw00.choi@samsung.com>, Dmitry Osipenko <digetx@gmail.com>,
 Thierry Reding <thierry.reding@kernel.org>,
 Jonathan Hunter <jonathanh@nvidia.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>
Cc: Rajendra Nayak <rajendra.nayak@oss.qualcomm.com>,
 Pankaj Patil <pankaj.patil@oss.qualcomm.com>, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, arm-scmi@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
 linux-pm@vger.kernel.org, linux-tegra@vger.kernel.org
References: <20260610-rfc_v7_scmi_memlat-v7-0-f3f68c608f25@oss.qualcomm.com>
 <20260610-rfc_v7_scmi_memlat-v7-4-f3f68c608f25@oss.qualcomm.com>
From: Chanwoo Choi <cwchoi00@gmail.com>
In-Reply-To: <20260610-rfc_v7_scmi_memlat-v7-4-f3f68c608f25@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 6/10/2026 5:51 PM, Pragnesh Papaniya wrote:
> From: Sibi Sankar <sibi.sankar@oss.qualcomm.com>
> 
> The target_freq sysfs attribute exposes a governor's predicted next
> target frequency. Not every devfreq governor has a meaningful value
> to report there; some merely observe an externally-driven device.
> 
> Add a DEVFREQ_GOV_ATTR_TARGET_FREQ attribute flag that governors with
> a meaningful target frequency must opt in to. Gate the existing
> target_freq sysfs read on the flag and return -EINVAL when the active
> governor does not advertise it.
> 
> Tag all in-tree governors that already populate previous_freq via
> get_target_freq() so visible behaviour stays unchanged for in-tree
> users. Out-of-tree governors that drive frequency updates and want
> to keep target_freq readable need to set the new flag.
> 
> Signed-off-by: Sibi Sankar <sibi.sankar@oss.qualcomm.com>
> Signed-off-by: Pragnesh Papaniya <pragnesh.papaniya@oss.qualcomm.com>
> ---
>  Documentation/ABI/testing/sysfs-class-devfreq | 8 ++++++++
>  drivers/devfreq/devfreq.c                     | 6 ++++++
>  drivers/devfreq/governor_passive.c            | 1 +
>  drivers/devfreq/governor_performance.c        | 1 +
>  drivers/devfreq/governor_powersave.c          | 1 +
>  drivers/devfreq/governor_simpleondemand.c     | 1 +
>  drivers/devfreq/governor_userspace.c          | 1 +
>  drivers/devfreq/hisi_uncore_freq.c            | 1 +
>  drivers/devfreq/tegra30-devfreq.c             | 3 ++-
>  include/linux/devfreq-governor.h              | 3 +++
>  10 files changed, 25 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/ABI/testing/sysfs-class-devfreq b/Documentation/ABI/testing/sysfs-class-devfreq
> index df8ba88b9f6a..5be9940a5853 100644
> --- a/Documentation/ABI/testing/sysfs-class-devfreq
> +++ b/Documentation/ABI/testing/sysfs-class-devfreq
> @@ -37,6 +37,14 @@ Description:
>  		The /sys/class/devfreq/.../target_freq shows the next governor
>  		predicted target frequency of the corresponding devfreq object.
>  
> +		Reading this attribute returns -EINVAL when the active
> +		governor does not advertise DEVFREQ_GOV_ATTR_TARGET_FREQ.
> +		All in-tree governors that drive frequency transitions tag
> +		this attribute, so existing in-tree behaviour is unchanged.
> +		Out-of-tree governors that previously relied on the
> +		unconditional read of df->previous_freq must opt in by
> +		setting DEVFREQ_GOV_ATTR_TARGET_FREQ in their attrs field.
> +
>  What:		/sys/class/devfreq/.../trans_stat
>  Date:		October 2012
>  Contact:	MyungJoo Ham <myungjoo.ham@samsung.com>
> diff --git a/drivers/devfreq/devfreq.c b/drivers/devfreq/devfreq.c
> index f08fc6966eae..2f27a239e34a 100644
> --- a/drivers/devfreq/devfreq.c
> +++ b/drivers/devfreq/devfreq.c
> @@ -1530,6 +1530,12 @@ static ssize_t target_freq_show(struct device *dev,
>  {
>  	struct devfreq *df = to_devfreq(dev);
>  
> +	guard(mutex)(&devfreq_list_lock);
> +
> +	if (!df->profile || !df->governor ||
> +	    !IS_SUPPORTED_ATTR(df->governor->attrs, TARGET_FREQ))
> +		return -EINVAL;
> +
>  	return sprintf(buf, "%lu\n", df->previous_freq);
>  }
>  static DEVICE_ATTR_RO(target_freq);
> diff --git a/drivers/devfreq/governor_passive.c b/drivers/devfreq/governor_passive.c
> index d7feecd900f1..b75e4bbee4b1 100644
> --- a/drivers/devfreq/governor_passive.c
> +++ b/drivers/devfreq/governor_passive.c
> @@ -448,6 +448,7 @@ static int devfreq_passive_event_handler(struct devfreq *devfreq,
>  
>  static struct devfreq_governor devfreq_passive = {
>  	.name = DEVFREQ_GOV_PASSIVE,
> +	.attrs = DEVFREQ_GOV_ATTR_TARGET_FREQ,
>  	.flags = DEVFREQ_GOV_FLAG_IMMUTABLE,
>  	.get_target_freq = devfreq_passive_get_target_freq,
>  	.event_handler = devfreq_passive_event_handler,
> diff --git a/drivers/devfreq/governor_performance.c b/drivers/devfreq/governor_performance.c
> index fdb22bf512cf..b9ec587f582c 100644
> --- a/drivers/devfreq/governor_performance.c
> +++ b/drivers/devfreq/governor_performance.c
> @@ -37,6 +37,7 @@ static int devfreq_performance_handler(struct devfreq *devfreq,
>  
>  static struct devfreq_governor devfreq_performance = {
>  	.name = DEVFREQ_GOV_PERFORMANCE,
> +	.attrs = DEVFREQ_GOV_ATTR_TARGET_FREQ,
>  	.get_target_freq = devfreq_performance_func,
>  	.event_handler = devfreq_performance_handler,
>  };
> diff --git a/drivers/devfreq/governor_powersave.c b/drivers/devfreq/governor_powersave.c
> index ee2d6ec8a512..69eab1d0a7fc 100644
> --- a/drivers/devfreq/governor_powersave.c
> +++ b/drivers/devfreq/governor_powersave.c
> @@ -37,6 +37,7 @@ static int devfreq_powersave_handler(struct devfreq *devfreq,
>  
>  static struct devfreq_governor devfreq_powersave = {
>  	.name = DEVFREQ_GOV_POWERSAVE,
> +	.attrs = DEVFREQ_GOV_ATTR_TARGET_FREQ,
>  	.get_target_freq = devfreq_powersave_func,
>  	.event_handler = devfreq_powersave_handler,
>  };
> diff --git a/drivers/devfreq/governor_simpleondemand.c b/drivers/devfreq/governor_simpleondemand.c
> index ac9c5e9e51a4..65ff9d912ef9 100644
> --- a/drivers/devfreq/governor_simpleondemand.c
> +++ b/drivers/devfreq/governor_simpleondemand.c
> @@ -118,6 +118,7 @@ static int devfreq_simple_ondemand_handler(struct devfreq *devfreq,
>  static struct devfreq_governor devfreq_simple_ondemand = {
>  	.name = DEVFREQ_GOV_SIMPLE_ONDEMAND,
>  	.attrs = DEVFREQ_GOV_ATTR_POLLING_INTERVAL
> +		| DEVFREQ_GOV_ATTR_TARGET_FREQ
>  		| DEVFREQ_GOV_ATTR_TIMER,
>  	.get_target_freq = devfreq_simple_ondemand_func,
>  	.event_handler = devfreq_simple_ondemand_handler,
> diff --git a/drivers/devfreq/governor_userspace.c b/drivers/devfreq/governor_userspace.c
> index 3906ebedbae8..d1b765a7b8e5 100644
> --- a/drivers/devfreq/governor_userspace.c
> +++ b/drivers/devfreq/governor_userspace.c
> @@ -135,6 +135,7 @@ static int devfreq_userspace_handler(struct devfreq *devfreq,
>  
>  static struct devfreq_governor devfreq_userspace = {
>  	.name = DEVFREQ_GOV_USERSPACE,
> +	.attrs = DEVFREQ_GOV_ATTR_TARGET_FREQ,
>  	.get_target_freq = devfreq_userspace_func,
>  	.event_handler = devfreq_userspace_handler,
>  };
> diff --git a/drivers/devfreq/hisi_uncore_freq.c b/drivers/devfreq/hisi_uncore_freq.c
> index 4d00d813c8ac..0800116e3334 100644
> --- a/drivers/devfreq/hisi_uncore_freq.c
> +++ b/drivers/devfreq/hisi_uncore_freq.c
> @@ -399,6 +399,7 @@ static struct devfreq_governor hisi_platform_governor = {
>  	 * Set interrupt_driven to skip the devfreq monitor mechanism, though
>  	 * this governor is not interrupt-driven.
>  	 */
> +	.attrs = DEVFREQ_GOV_ATTR_TARGET_FREQ,
>  	.flags = DEVFREQ_GOV_FLAG_IRQ_DRIVEN,
>  	.get_target_freq = hisi_platform_gov_func,
>  	.event_handler = hisi_platform_gov_handler,
> diff --git a/drivers/devfreq/tegra30-devfreq.c b/drivers/devfreq/tegra30-devfreq.c
> index 401aac6a9f07..fcb278c4a74c 100644
> --- a/drivers/devfreq/tegra30-devfreq.c
> +++ b/drivers/devfreq/tegra30-devfreq.c
> @@ -776,7 +776,8 @@ static int tegra_governor_event_handler(struct devfreq *devfreq,
>  
>  static struct devfreq_governor tegra_devfreq_governor = {
>  	.name = "tegra_actmon",
> -	.attrs = DEVFREQ_GOV_ATTR_POLLING_INTERVAL,
> +	.attrs = DEVFREQ_GOV_ATTR_POLLING_INTERVAL
> +		| DEVFREQ_GOV_ATTR_TARGET_FREQ,
>  	.flags = DEVFREQ_GOV_FLAG_IMMUTABLE
>  		| DEVFREQ_GOV_FLAG_IRQ_DRIVEN,
>  	.get_target_freq = tegra_governor_get_target,
> diff --git a/include/linux/devfreq-governor.h b/include/linux/devfreq-governor.h
> index dfdd0160a29f..2853f571dfdf 100644
> --- a/include/linux/devfreq-governor.h
> +++ b/include/linux/devfreq-governor.h
> @@ -43,9 +43,12 @@
>   *   : Indicate polling_interval sysfs attribute
>   * - DEVFREQ_GOV_ATTR_TIMER
>   *   : Indicate timer sysfs attribute
> + * - DEVFREQ_GOV_ATTR_TARGET_FREQ
> + *   : Indicate the target freq sysfs attribute
>   */
>  #define DEVFREQ_GOV_ATTR_POLLING_INTERVAL		BIT(0)
>  #define DEVFREQ_GOV_ATTR_TIMER				BIT(1)
> +#define DEVFREQ_GOV_ATTR_TARGET_FREQ			BIT(2)
>  
>  /**
>   * struct devfreq_governor - Devfreq policy governor
> 

Hi,

I agree this approach. But, this patches doesn't include devicetree binding for device
and driver has included OPP information. It might be not acceptable for dt maintainer on device binding side.
And are there no problem with short polling period?

-- 
Best Regards,
Chanwoo Choi
Principal Engineer, Samsung Electronics

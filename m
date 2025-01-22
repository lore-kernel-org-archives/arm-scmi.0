Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE7F3153824
	for <arm-scmi@vger.kernel.org>; Wed, 22 Jan 2025 08:48:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737535741; cv=none; b=qZn/cJqQq67YyLERSYSCmDiFwdLDS64ppvZ8ugRzYuitsJ/mUw/jLxhDVJf6YKUiHwy0wXWHZWDjjspHP8LgG1BUJzrMCzWZPFhWQ+N4vQaDq6oyMNMT8VXpRs+BZ+wWcFZ2Mr07F8vt8oVMoVsyvbSAsd+49X022b5Ws2RHkoc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737535741; c=relaxed/simple;
	bh=8PHIgrQZeo8GwWqLbADYlL7NlWtuwVKaha55ZI/7k8o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uexPya/2QeYKekGagAlEs0c2e1F3A4ISf1T+wQu8Drx+mXhR+1gO/ufc/WhC7O+JsiXg9oLH44jJPLz2VRz9qyApYfQ79FIoXZCxXiYixtbgTBQMCymfAqpPz3SBwTYwGFrv7ySvmHvuXCNLF/xJM2TEd3ZD1X2roupmWsWPtw8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=fFXywIu9; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="fFXywIu9"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4361f664af5so75806335e9.1
        for <arm-scmi@vger.kernel.org>; Wed, 22 Jan 2025 00:48:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1737535736; x=1738140536; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ahcAYxKCW2/TnZTsjnNnWROYjAukoakSCPj81fATNcw=;
        b=fFXywIu9Z8+LYdq9VjFb+W7mimd1Zu80S7c2qZWDo0bUjBIcI+D+9Ldvy0mBVbSzQq
         0PIfqrZcxEdol3LvuzlBtufLi+xt+/yy/BFbxJk4wUGwx6eWHCNALS9erl+HHbswJA7G
         oI1WX1y4Su+WMWSPxWtycpnofnuWfD8Cdwv9DN5w0oKhVHhL8wtrDkyiOS0BqNjfYUJa
         Kz1jFIuih25KDXzYY+zMeaSk9UtvBd9oPw0mqTTRKnNdN5wJsCx3twF09umGOlpgUkku
         GK1BUtz5XDsZHVqtGCGCMgiNnnO9wA4murO42ctNIo2OAvZz1W6encY1tReWQ9Nw05yu
         dQtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737535736; x=1738140536;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ahcAYxKCW2/TnZTsjnNnWROYjAukoakSCPj81fATNcw=;
        b=SZVTJUAtZ+uS90XQ9Z+ebgW5oKro74RX4JOszVZyaeY7VOCCX1rI1BL1W2Z6EbjDmQ
         TCdNB34NmAlrzPAgeaVCq8UgRxgvP7ojRz0ojKOphRV3pvr9EvOspmH7xQC6FFP6wPiq
         dYCeBeaIXGgtLcBm/kkoiLMik8KnZX+BBqJWqaN/BLK8+MQniCDdHQVUC8mo8AwJ20wc
         dqSLEjhcOQlYU+WUTpu10M+g5caNZwbgboDv2nY60k+7lJuIbRXRjEMOhlWGmCFb9aLq
         4hvhy3qKyPpcltXChYBShgskaHcmtDcmYduJZZtj2k2cz6ogqOukF8mC8J4k07zr/TxM
         hsWQ==
X-Forwarded-Encrypted: i=1; AJvYcCVjhJ4kw+JUYExFFY8m5h7qTlsaQ9P64Wd3nIhgRi/VrlsnrAe3n/yhsqdN6V+Psz7EgC92OrpwlA==@vger.kernel.org
X-Gm-Message-State: AOJu0YyTYu7HhLuaNhe1beNvt2EjBCU3dXWPJzFLKFY0Q6qJQdUOxFMb
	d1rC04EkONKerA5x6LKJNp/j6yrJgjGcvrv/c8JylaJ6TfSkGafvPxny54Aiir0=
X-Gm-Gg: ASbGncuQ4sZxKbbL0JO5DqgxqJUwY+gMJ8F3yItrLllQakMKWrqiaLwmIl+dyPACwYj
	yuzQPXughJLhsrM5gBMFJmcvVTmu157BxUCG6nHnIbpnToHGnMdUQSWlKBrsHiLukqSzOGjZzrf
	nCbdQPnWVGVgwHVfHUSDu1lOOBO8XVd38LiQrDMGcF1Z+ewNYD90G4AzAaUm19a6rzlfe2+Eg26
	tVi4NlLpm7VWmgCp8XZ8KGgXFIxdsEGHtMvjNtOFMW6rdEYu1ZiUt1iZX5ddsCpYN50eHJw1gI=
X-Google-Smtp-Source: AGHT+IHq3PpoCGSQdzJWDJkxvFTv6ixwaU5LzRSfdsLCE0QsOxCCYnY482OJuMYLEl9P4UbO7C0N0g==
X-Received: by 2002:a05:600c:458a:b0:436:faeb:2a18 with SMTP id 5b1f17b1804b1-438913bed3fmr178285215e9.6.1737535735986;
        Wed, 22 Jan 2025 00:48:55 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-438b1d904cbsm12331605e9.1.2025.01.22.00.48.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Jan 2025 00:48:55 -0800 (PST)
Date: Wed, 22 Jan 2025 11:48:52 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Cc: Sudeep Holla <sudeep.holla@arm.com>,
	Cristian Marussi <cristian.marussi@arm.com>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, linux-kernel@vger.kernel.org,
	arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	imx@lists.linux.dev, Peng Fan <peng.fan@nxp.com>
Subject: Re: [PATCH 2/5] firmware: arm_scmi: imx: Add i.MX95 CPU Protocol
Message-ID: <3b9a7392-8ebe-4d43-a111-68bb6d2f93b6@stanley.mountain>
References: <20250121-imx-lmm-cpu-v1-0-0eab7e073e4e@nxp.com>
 <20250121-imx-lmm-cpu-v1-2-0eab7e073e4e@nxp.com>
Precedence: bulk
X-Mailing-List: arm-scmi@vger.kernel.org
List-Id: <arm-scmi.vger.kernel.org>
List-Subscribe: <mailto:arm-scmi+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:arm-scmi+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250121-imx-lmm-cpu-v1-2-0eab7e073e4e@nxp.com>

On Tue, Jan 21, 2025 at 11:08:12PM +0800, Peng Fan (OSS) wrote:
> From: Peng Fan <peng.fan@nxp.com>
> 
> This protocol allows an agent to start, stop a CPU or set reset vector. It
> is used to manage auxiliary CPUs in an LM (e.g. additional cores in an AP
> cluster).
> 
> Signed-off-by: Peng Fan <peng.fan@nxp.com>
> ---
>  drivers/firmware/arm_scmi/vendors/imx/Kconfig      |  13 +-
>  drivers/firmware/arm_scmi/vendors/imx/Makefile     |   1 +
>  drivers/firmware/arm_scmi/vendors/imx/imx-sm-cpu.c | 283 +++++++++++++++++++++
>  include/linux/scmi_imx_protocol.h                  |  10 +
>  4 files changed, 306 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/firmware/arm_scmi/vendors/imx/Kconfig b/drivers/firmware/arm_scmi/vendors/imx/Kconfig
> index 1a936fc87d2350e2a21bccd45dfbeebfa3b90286..9070522510e4d3f3d7276a7581f8676006d20f90 100644
> --- a/drivers/firmware/arm_scmi/vendors/imx/Kconfig
> +++ b/drivers/firmware/arm_scmi/vendors/imx/Kconfig
> @@ -12,6 +12,17 @@ config IMX_SCMI_BBM_EXT
>  	  To compile this driver as a module, choose M here: the
>  	  module will be called imx-sm-bbm.
>  
> +config IMX_SCMI_CPU_EXT
> +	tristate "i.MX SCMI CPU EXTENSION"
> +	depends on ARM_SCMI_PROTOCOL || (COMPILE_TEST && OF)
> +	default y if ARCH_MXC
> +	help
> +	  This enables i.MX System CPU Protocol to manage cpu
> +	  start, stop and etc.
> +
> +	  To compile this driver as a module, choose M here: the
> +	  module will be called imx-sm-cpu.
> +
>  config IMX_SCMI_LMM_EXT
>  	tristate "i.MX SCMI LMM EXTENSION"
>  	depends on ARM_SCMI_PROTOCOL || (COMPILE_TEST && OF)
> @@ -21,7 +32,7 @@ config IMX_SCMI_LMM_EXT
>  	  manage Logical Machines boot, shutdown and etc.
>  
>  	  To compile this driver as a module, choose M here: the
> -	  module will be called imx-sm-lmm.
> +	  module will be called imx-sm-cpu.
>  

It's supposed to be called imx-sm-lmm.

>  config IMX_SCMI_MISC_EXT
>  	tristate "i.MX SCMI MISC EXTENSION"
> diff --git a/drivers/firmware/arm_scmi/vendors/imx/Makefile b/drivers/firmware/arm_scmi/vendors/imx/Makefile
> index f39a99ccaf9af757475e8b112d224669444d7ddc..e3a5ea46345c89da1afae25e55698044672b7c28 100644
> --- a/drivers/firmware/arm_scmi/vendors/imx/Makefile
> +++ b/drivers/firmware/arm_scmi/vendors/imx/Makefile
> @@ -1,4 +1,5 @@
>  # SPDX-License-Identifier: GPL-2.0-only
>  obj-$(CONFIG_IMX_SCMI_BBM_EXT) += imx-sm-bbm.o
> +obj-$(CONFIG_IMX_SCMI_CPU_EXT) += imx-sm-cpu.o
>  obj-$(CONFIG_IMX_SCMI_LMM_EXT) += imx-sm-lmm.o
>  obj-$(CONFIG_IMX_SCMI_MISC_EXT) += imx-sm-misc.o
> diff --git a/drivers/firmware/arm_scmi/vendors/imx/imx-sm-cpu.c b/drivers/firmware/arm_scmi/vendors/imx/imx-sm-cpu.c
> new file mode 100644
> index 0000000000000000000000000000000000000000..e3f294c2cb69a5b5a916d55984f4a63539937d02
> --- /dev/null
> +++ b/drivers/firmware/arm_scmi/vendors/imx/imx-sm-cpu.c
> @@ -0,0 +1,283 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * System control and Management Interface (SCMI) NXP CPU Protocol
> + *
> + * Copyright 2025 NXP
> + */
> +
> +#include <linux/bits.h>
> +#include <linux/io.h>
> +#include <linux/module.h>
> +#include <linux/of.h>
> +#include <linux/platform_device.h>
> +#include <linux/scmi_protocol.h>
> +#include <linux/scmi_imx_protocol.h>
> +
> +#include "../../protocols.h"
> +#include "../../notify.h"
> +
> +#define SCMI_PROTOCOL_SUPPORTED_VERSION		0x10000
> +
> +enum scmi_imx_cpu_protocol_cmd {
> +	SCMI_IMX_CPU_ATTRIBUTES	= 0x3,
> +	SCMI_IMX_CPU_START = 0x4,
> +	SCMI_IMX_CPU_STOP = 0x5,
> +	SCMI_IMX_CPU_RESET_VECTOR_SET = 0x6,
> +	SCMI_IMX_CPU_INFO_GET = 0xC,
> +};
> +
> +struct scmi_imx_cpu_info {
> +	u32 nr_cpu;
> +};
> +
> +#define SCMI_IMX_CPU_PROTO_ATTR_NUM_CPUS(x)  ((x) & 0xFFFF)
> +struct scmi_msg_imx_cpu_protocol_attributes {
> +	__le32 attributes;
> +};
> +
> +struct scmi_msg_imx_cpu_attributes_out {
> +	__le32 attributes;
> +#define	CPU_MAX_NAME	16
> +	u8 name[CPU_MAX_NAME];

char is always unsigned in the kernel these days but strings should
still always be char.  Same thing in patch 1, there were a couple u8
names.

> +};
> +
> +struct scmi_imx_cpu_reset_vector_set_in {
> +	__le32 cpuid;
> +#define	CPU_VEC_FLAGS_RESUME	BIT(31)
> +#define	CPU_VEC_FLAGS_START	BIT(30)
> +#define	CPU_VEC_FLAGS_BOOT	BIT(29)
> +	__le32 flags;
> +	__le32 resetvectorlow;
> +	__le32 resetvectorhigh;
> +};
> +
> +struct scmi_imx_cpu_info_get_out {
> +#define	CPU_RUN_MODE_START	0
> +#define	CPU_RUN_MODE_HOLD	1
> +#define	CPU_RUN_MODE_STOP	2
> +#define	CPU_RUN_MODE_SLEEP	3
> +	__le32 runmode;
> +	__le32 sleepmode;
> +	__le32 resetvectorlow;
> +	__le32 resetvectorhigh;
> +};
> +
> +static int scmi_imx_cpu_validate_cpuid(const struct scmi_protocol_handle *ph,
> +				       u32 cpuid)
> +{
> +	struct scmi_imx_cpu_info *info = ph->get_priv(ph);
> +
> +	if (cpuid >= info->nr_cpu)
> +		return -EINVAL;
> +
> +	return 0;
> +}
> +
> +static int scmi_imx_cpu_start(const struct scmi_protocol_handle *ph, u32 cpuid)
> +{
> +	struct scmi_xfer *t;
> +	int ret;
> +
> +	ret = scmi_imx_cpu_validate_cpuid(ph, cpuid);
> +	if (ret)
> +		return ret;
> +
> +	ret = ph->xops->xfer_get_init(ph, SCMI_IMX_CPU_START, sizeof(u32),
> +				      0, &t);
> +	if (ret)
> +		return ret;
> +
> +	put_unaligned_le32(cpuid, t->tx.buf);
> +	ret = ph->xops->do_xfer(ph, t);
> +
> +	ph->xops->xfer_put(ph, t);
> +
> +	return ret;
> +}
> +
> +static int scmi_imx_cpu_stop(const struct scmi_protocol_handle *ph, u32 cpuid)
> +{
> +	struct scmi_xfer *t;
> +	int ret;
> +
> +	ret = scmi_imx_cpu_validate_cpuid(ph, cpuid);
> +	if (ret)
> +		return ret;
> +
> +	ret = ph->xops->xfer_get_init(ph, SCMI_IMX_CPU_STOP, sizeof(u32),
> +				      0, &t);
> +	if (ret)
> +		return ret;
> +
> +	put_unaligned_le32(cpuid, t->tx.buf);
> +	ret = ph->xops->do_xfer(ph, t);
> +
> +	ph->xops->xfer_put(ph, t);
> +
> +	return ret;
> +}
> +
> +static int scmi_imx_cpu_reset_vector_set(const struct scmi_protocol_handle *ph,
> +					 u32 cpuid, u64 vector, bool start,
> +					 bool boot, bool resume)
> +{
> +	struct scmi_imx_cpu_reset_vector_set_in *in;
> +	struct scmi_xfer *t;
> +	int ret;
> +
> +	ret = scmi_imx_cpu_validate_cpuid(ph, cpuid);
> +	if (ret)
> +		return ret;
> +
> +	ret = ph->xops->xfer_get_init(ph, SCMI_IMX_CPU_RESET_VECTOR_SET, sizeof(*in),
> +				      0, &t);
> +	if (ret)
> +		return ret;
> +
> +	in = t->tx.buf;
> +	in->cpuid = cpu_to_le32(cpuid);
> +	in->flags = start ? CPU_VEC_FLAGS_START : 0;
> +	in->flags |= boot ? CPU_VEC_FLAGS_BOOT : 0;
> +	in->flags |= resume ? CPU_VEC_FLAGS_BOOT : 0;

s/CPU_VEC_FLAGS_BOOT/CPU_VEC_FLAGS_RESUME/

> +	in->resetvectorlow = cpu_to_le32(lower_32_bits(vector));
> +	in->resetvectorhigh = cpu_to_le32(upper_32_bits(vector));
> +	ret = ph->xops->do_xfer(ph, t);
> +
> +	ph->xops->xfer_put(ph, t);
> +
> +	return ret;
> +}
> +
> +static int scmi_imx_cpu_started(const struct scmi_protocol_handle *ph, u32 cpuid,
> +				bool *started)
> +{
> +	struct scmi_imx_cpu_info_get_out *out;
> +	struct scmi_xfer *t;
> +	int ret;
> +
> +	*started = false;
> +	ret = scmi_imx_cpu_validate_cpuid(ph, cpuid);
> +	if (ret)
> +		return ret;
> +
> +	ret = ph->xops->xfer_get_init(ph, SCMI_IMX_CPU_INFO_GET, sizeof(u32),
> +				      0, &t);
> +	if (ret)
> +		return ret;
> +
> +	put_unaligned_le32(cpuid, t->tx.buf);
> +	ret = ph->xops->do_xfer(ph, t);
> +	if (!ret) {
> +		out = t->rx.buf;
> +		if ((out->runmode == CPU_RUN_MODE_START) ||
> +		    (out->runmode == CPU_RUN_MODE_SLEEP))
> +			*started = true;
> +	}
> +
> +	ph->xops->xfer_put(ph, t);
> +
> +	return ret;
> +}
> +
> +static const struct scmi_imx_cpu_proto_ops scmi_imx_cpu_proto_ops = {
> +	.cpu_reset_vector_set = scmi_imx_cpu_reset_vector_set,
> +	.cpu_start = scmi_imx_cpu_start,
> +	.cpu_started = scmi_imx_cpu_started,
> +	.cpu_stop = scmi_imx_cpu_stop,
> +};
> +
> +static int scmi_imx_cpu_protocol_attributes_get(const struct scmi_protocol_handle *ph,
> +						struct scmi_imx_cpu_info *info)
> +{
> +	struct scmi_msg_imx_cpu_protocol_attributes *attr;
> +	struct scmi_xfer *t;
> +	int ret;
> +
> +	ret = ph->xops->xfer_get_init(ph, PROTOCOL_ATTRIBUTES, 0,
> +				      sizeof(*attr), &t);
> +	if (ret)
> +		return ret;
> +
> +	attr = t->rx.buf;
> +
> +	ret = ph->xops->do_xfer(ph, t);
> +	if (!ret) {
> +		info->nr_cpu = SCMI_IMX_CPU_PROTO_ATTR_NUM_CPUS(attr->attributes);
> +		dev_info(ph->dev, "i.MX SM CPU: %d cpus\n",
> +			 info->nr_cpu);

This can fit in 80 characters:

		dev_info(ph->dev, "i.MX SM CPU: %d cpus\n", info->nr_cpu);

> +	}
> +
> +	ph->xops->xfer_put(ph, t);
> +
> +	return ret;
> +}
> +
> +static int scmi_imx_cpu_attributes_get(const struct scmi_protocol_handle *ph,
> +				       u32 cpuid, struct scmi_imx_cpu_info *info)

No need to pass the "info" pointer.

> +{
> +	struct scmi_msg_imx_cpu_attributes_out *out;
> +	struct scmi_xfer *t;
> +	int ret;
> +
> +	ret = ph->xops->xfer_get_init(ph, SCMI_IMX_CPU_ATTRIBUTES, sizeof(u32), 0, &t);
> +	if (ret)
> +		return ret;
> +
> +	put_unaligned_le32(cpuid, t->tx.buf);
> +	ret = ph->xops->do_xfer(ph, t);
> +	if (!ret) {
> +		out = t->rx.buf;
> +		dev_info(ph->dev, "i.MX CPU: name: %s\n", out->name);
> +	} else {
> +		dev_err(ph->dev, "i.MX cpu: Failed to get info of cpu(%u)\n", cpuid);
> +	}
> +
> +	ph->xops->xfer_put(ph, t);
> +
> +	return ret;
> +}
> +
> +

Multiple blank lines (checkpatch.pl --strict).

> +static int scmi_imx_cpu_protocol_init(const struct scmi_protocol_handle *ph)
> +{

regards,
dan carpenter


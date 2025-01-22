Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 230FD211711;
	Wed, 22 Jan 2025 12:22:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737548546; cv=none; b=nQDXtfNGjeu+D0xqdb06vivxZFYKRSa8X2I0af/4C3PC7NdvDUlEKqQ6ZEQBJoztmMIu/E56HB3zNIaJtnpvaZYf260yeEH9pvhElO9GQ9W131onnBMTGdmPfu+QccOrpFmjavbX0WOZMFM1S8Mg5zpIZRQ3sIVFuEJoXMXs3YM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737548546; c=relaxed/simple;
	bh=f4yEwPpbLS1jjrGQpVr38b703hsKQBWNv6qaHdJoFhg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=aOP20VNAOW2fDu9i1jVQPhBA/tBFxFCCpmVV5wZ/pg7rLdZIIitx6hsP4GD13KLgOzNJKZIq6dAYaTvURKuz+JVw9MaZMhe82Fq/dNpUV337AwVVaB+XZADRyB2ssMF06RUPhmK0OF/wBQW0sbIDQe8Uzn6Jjtv3Hl+A+AKgCOo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E5C851007;
	Wed, 22 Jan 2025 04:22:51 -0800 (PST)
Received: from pluto (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 522203F738;
	Wed, 22 Jan 2025 04:22:21 -0800 (PST)
Date: Wed, 22 Jan 2025 12:22:18 +0000
From: Cristian Marussi <cristian.marussi@arm.com>
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>,
	Sudeep Holla <sudeep.holla@arm.com>,
	Cristian Marussi <cristian.marussi@arm.com>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, linux-kernel@vger.kernel.org,
	arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	imx@lists.linux.dev, Peng Fan <peng.fan@nxp.com>
Subject: Re: [PATCH 2/5] firmware: arm_scmi: imx: Add i.MX95 CPU Protocol
Message-ID: <Z5Di-uU52aejU-U8@pluto>
References: <20250121-imx-lmm-cpu-v1-0-0eab7e073e4e@nxp.com>
 <20250121-imx-lmm-cpu-v1-2-0eab7e073e4e@nxp.com>
 <3b9a7392-8ebe-4d43-a111-68bb6d2f93b6@stanley.mountain>
Precedence: bulk
X-Mailing-List: arm-scmi@vger.kernel.org
List-Id: <arm-scmi.vger.kernel.org>
List-Subscribe: <mailto:arm-scmi+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:arm-scmi+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3b9a7392-8ebe-4d43-a111-68bb6d2f93b6@stanley.mountain>

On Wed, Jan 22, 2025 at 11:48:52AM +0300, Dan Carpenter wrote:
> On Tue, Jan 21, 2025 at 11:08:12PM +0800, Peng Fan (OSS) wrote:
> > From: Peng Fan <peng.fan@nxp.com>
> > 
> > This protocol allows an agent to start, stop a CPU or set reset vector. It
> > is used to manage auxiliary CPUs in an LM (e.g. additional cores in an AP
> > cluster).
> > 

Hi,

just a quick one down below.

> > Signed-off-by: Peng Fan <peng.fan@nxp.com>
> > ---
> >  drivers/firmware/arm_scmi/vendors/imx/Kconfig      |  13 +-
> >  drivers/firmware/arm_scmi/vendors/imx/Makefile     |   1 +
> >  drivers/firmware/arm_scmi/vendors/imx/imx-sm-cpu.c | 283 +++++++++++++++++++++
> >  include/linux/scmi_imx_protocol.h                  |  10 +
> >  4 files changed, 306 insertions(+), 1 deletion(-)
> > 
> > diff --git a/drivers/firmware/arm_scmi/vendors/imx/Kconfig b/drivers/firmware/arm_scmi/vendors/imx/Kconfig
> > index 1a936fc87d2350e2a21bccd45dfbeebfa3b90286..9070522510e4d3f3d7276a7581f8676006d20f90 100644
> > --- a/drivers/firmware/arm_scmi/vendors/imx/Kconfig
> > +++ b/drivers/firmware/arm_scmi/vendors/imx/Kconfig
> > @@ -12,6 +12,17 @@ config IMX_SCMI_BBM_EXT
> >  	  To compile this driver as a module, choose M here: the
> >  	  module will be called imx-sm-bbm.
> >  
> > +config IMX_SCMI_CPU_EXT
> > +	tristate "i.MX SCMI CPU EXTENSION"
> > +	depends on ARM_SCMI_PROTOCOL || (COMPILE_TEST && OF)
> > +	default y if ARCH_MXC
> > +	help
> > +	  This enables i.MX System CPU Protocol to manage cpu
> > +	  start, stop and etc.
> > +
> > +	  To compile this driver as a module, choose M here: the
> > +	  module will be called imx-sm-cpu.
> > +
> >  config IMX_SCMI_LMM_EXT
> >  	tristate "i.MX SCMI LMM EXTENSION"
> >  	depends on ARM_SCMI_PROTOCOL || (COMPILE_TEST && OF)
> > @@ -21,7 +32,7 @@ config IMX_SCMI_LMM_EXT
> >  	  manage Logical Machines boot, shutdown and etc.
> >  
> >  	  To compile this driver as a module, choose M here: the
> > -	  module will be called imx-sm-lmm.
> > +	  module will be called imx-sm-cpu.
> >  
> 
> It's supposed to be called imx-sm-lmm.
> 
> >  config IMX_SCMI_MISC_EXT
> >  	tristate "i.MX SCMI MISC EXTENSION"
> > diff --git a/drivers/firmware/arm_scmi/vendors/imx/Makefile b/drivers/firmware/arm_scmi/vendors/imx/Makefile
> > index f39a99ccaf9af757475e8b112d224669444d7ddc..e3a5ea46345c89da1afae25e55698044672b7c28 100644
> > --- a/drivers/firmware/arm_scmi/vendors/imx/Makefile
> > +++ b/drivers/firmware/arm_scmi/vendors/imx/Makefile
> > @@ -1,4 +1,5 @@
> >  # SPDX-License-Identifier: GPL-2.0-only
> >  obj-$(CONFIG_IMX_SCMI_BBM_EXT) += imx-sm-bbm.o
> > +obj-$(CONFIG_IMX_SCMI_CPU_EXT) += imx-sm-cpu.o
> >  obj-$(CONFIG_IMX_SCMI_LMM_EXT) += imx-sm-lmm.o
> >  obj-$(CONFIG_IMX_SCMI_MISC_EXT) += imx-sm-misc.o
> > diff --git a/drivers/firmware/arm_scmi/vendors/imx/imx-sm-cpu.c b/drivers/firmware/arm_scmi/vendors/imx/imx-sm-cpu.c
> > new file mode 100644
> > index 0000000000000000000000000000000000000000..e3f294c2cb69a5b5a916d55984f4a63539937d02
> > --- /dev/null
> > +++ b/drivers/firmware/arm_scmi/vendors/imx/imx-sm-cpu.c
> > @@ -0,0 +1,283 @@
> > +// SPDX-License-Identifier: GPL-2.0
> > +/*
> > + * System control and Management Interface (SCMI) NXP CPU Protocol
> > + *
> > + * Copyright 2025 NXP
> > + */
> > +
> > +#include <linux/bits.h>
> > +#include <linux/io.h>
> > +#include <linux/module.h>
> > +#include <linux/of.h>
> > +#include <linux/platform_device.h>
> > +#include <linux/scmi_protocol.h>
> > +#include <linux/scmi_imx_protocol.h>
> > +
> > +#include "../../protocols.h"
> > +#include "../../notify.h"
> > +
> > +#define SCMI_PROTOCOL_SUPPORTED_VERSION		0x10000
> > +
> > +enum scmi_imx_cpu_protocol_cmd {
> > +	SCMI_IMX_CPU_ATTRIBUTES	= 0x3,
> > +	SCMI_IMX_CPU_START = 0x4,
> > +	SCMI_IMX_CPU_STOP = 0x5,
> > +	SCMI_IMX_CPU_RESET_VECTOR_SET = 0x6,
> > +	SCMI_IMX_CPU_INFO_GET = 0xC,
> > +};
> > +
> > +struct scmi_imx_cpu_info {
> > +	u32 nr_cpu;
> > +};
> > +
> > +#define SCMI_IMX_CPU_PROTO_ATTR_NUM_CPUS(x)  ((x) & 0xFFFF)
> > +struct scmi_msg_imx_cpu_protocol_attributes {
> > +	__le32 attributes;
> > +};
> > +
> > +struct scmi_msg_imx_cpu_attributes_out {
> > +	__le32 attributes;
> > +#define	CPU_MAX_NAME	16
> > +	u8 name[CPU_MAX_NAME];
> 
> char is always unsigned in the kernel these days but strings should
> still always be char.  Same thing in patch 1, there were a couple u8
> names.
> 

While it is certainly true that char is the way to go for strings and, as
such, it is used elsewhere to hold the resource names across all SCMI
protocols, in this context it is a field of structure representing
exactly the layout of message reply coming from the server, and defined
in the SCMI spec as a uint8 array, so, we have generally preferred to
used u8 to represent such fixed size array all across the SCMI stack
protocols implementation....

.... not saying that it is necessarily completelt right, but that is the
reason we are guilty :D

Thanks,
Cristian


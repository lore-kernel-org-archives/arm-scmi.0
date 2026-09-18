Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1B0A50AC38;
	Fri, 18 Sep 2026 13:32:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789738336; cv=none; b=c4yWRg8uSTLPunoIrOysNqdTXsESldNBd41h/TvXyB+Wza8YUws2JW00zyMO1GT6jXepVXrT1DATzAb25XexECoMI1Yi7ZKfMaO0bGpiv73Apvey0WTsSpEXRrO4lnUF4VQyY+7iMpNlp9WB5VPks5oLpurD6kSpwW5tB3Yk+N8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789738336; c=relaxed/simple;
	bh=eeXFZp1Ow+hjFsG2ohtQcE9sG4CIuFQ8OZ64ILIzSEc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KQDpUYZZHn0ix9tYILfVuhlNCOdnZR8K6BIydeYDeOWrCvqKaHFwNyl+BpQys/MTfOKo1i3N+cysayQzbsMm3VBPp4b67BfNzgMQF4wd4y0rpILKEjst4gKJuzARRMpZmrA4oA2k9LfpLo26s1s/olLn7vnn5U6AEKZwdNqctio=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JgoKnDJT; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JgoKnDJT"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9C2851F000FF;
	Fri, 18 Sep 2026 13:32:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789738330;
	bh=SBA0E8AODEBadx1kh06AjWaY/QYpRulbt0rkULl2OkQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=JgoKnDJTFyKqWWSymRW9iF2B8lN//StBJtI/lM5LftfwpC/oAuS2Fg0k/8O4JRcwf
	 Tl7mBtu4h+LQRuWG0cPoWRV1dBwXHLGe9mclufmEq3resy0LAp8ku49P2lG5/qU+9e
	 ydZZbffbURfmQDXNwMq0V4Po/IbbKyQUdkGQBwmX7YWlrVsKOoIh8QXofE1j20kVxQ
	 PHx54Jc/GgLFS7u/pPAOhPkRtNTOFFSFIvRrcpilGtw/NeSRLgfZxxB5B91F+sdb54
	 VOw5poxNzPjxBrYZUU/iqcRsR5EqZii55rwBeRJr2ZsWYHJILgt1L+1x/ZGFD2RFe8
	 0wa6jemDP32qQ==
Date: Fri, 18 Sep 2026 14:32:06 +0100
From: Sudeep Holla <sudeep.holla@kernel.org>
To: Hans de Goede <johannes.goede@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
	Cristian Marussi <cristian.marussi@arm.com>,
	Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>,
	Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>,
	Frank.Li@kernel.org, arm-scmi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
	imx@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v7 1/2] module: add SCMI device table alias support
Message-ID: <20260918-impetuous-daring-barnacle-1ea4d0@sudeepholla>
References: <20260918092951.5656-1-johannes.goede@oss.qualcomm.com>
 <20260918092951.5656-2-johannes.goede@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: arm-scmi@vger.kernel.org
List-Id: <arm-scmi.vger.kernel.org>
List-Subscribe: <mailto:arm-scmi+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:arm-scmi+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260918092951.5656-2-johannes.goede@oss.qualcomm.com>

On Fri, Sep 18, 2026 at 11:29:50AM +0200, Hans de Goede wrote:
> From: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
> 
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
> Reviewed-by: Hans de Goede <johannes.goede@oss.qualcomm.com>
> Tested-by: Hans de Goede <johannes.goede@oss.qualcomm.com>
> Signed-off-by: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
> Signed-off-by: Hans de Goede <johannes.goede@oss.qualcomm.com>
> ---
> Changes in v7:
> - Rebase on top of v7.3-rc3
> 
> Changes in v4:
> - Drop unused driver_data member from struct scmi_device_id (Uwe)
> - Drop device-id/scmi.h include from mod_devicetable.h (Uwe)
> - Add device-id/scmi.h to devicetable-offsets.c and file2alias.c (Uwe)
> 
> Changes in v3:
> - Adjust for ad428f5811bd ("mod_devicetable.h: Split into per subsystem
>   headers")
> - Add '\n' to modalias_show() output, matching other subsystems' modalias
> 
> Changes in v2:
> - Drop #include <linux/mod_devicetable.h> from scmi_protocol.h
> - Link to v1: https://patch.msgid.link/20260616-scmi-modalias-v1-0-662b8dd52ab2@oss.qualcomm.com
> ---
>  MAINTAINERS                       |  1 +
>  drivers/firmware/arm_scmi/bus.c   | 21 ++++++++++-----------
>  include/linux/device-id/scmi.h    | 17 +++++++++++++++++
>  include/linux/scmi_protocol.h     |  6 +-----
>  scripts/mod/devicetable-offsets.c |  5 +++++
>  scripts/mod/file2alias.c          | 12 ++++++++++++
>  6 files changed, 46 insertions(+), 16 deletions(-)
>  create mode 100644 include/linux/device-id/scmi.h
> 

[...]

> diff --git a/include/linux/device-id/scmi.h b/include/linux/device-id/scmi.h
> new file mode 100644
> index 000000000000..1b4ccfa9dcc5
> --- /dev/null
> +++ b/include/linux/device-id/scmi.h
> @@ -0,0 +1,17 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +#ifndef LINUX_DEVICE_ID_SCMI_H
> +#define LINUX_DEVICE_ID_SCMI_H
> +
> +#ifdef __KERNEL__
> +#include <linux/types.h>
> +#endif
> +
> +#define SCMI_NAME_SIZE		32
> +#define SCMI_MODULE_PREFIX	"scmi:"
> +
> +struct scmi_device_id {
> +	__u8 protocol_id;
> +	char name[SCMI_NAME_SIZE];
> +};
> +
> +#endif /* ifndef LINUX_DEVICE_ID_SCMI_H */

You need to include this above file in include/linux/mod_devicetable.h
to avoid duplication of its inclusion elsewhere. That's the pattern followed
I see.

> diff --git a/include/linux/scmi_protocol.h b/include/linux/scmi_protocol.h
> index 5ab73b1ab9aa..ba53302d95f5 100644
> --- a/include/linux/scmi_protocol.h
> +++ b/include/linux/scmi_protocol.h
> @@ -9,6 +9,7 @@
>  #define _LINUX_SCMI_PROTOCOL_H
>  
>  #include <linux/bitfield.h>
> +#include <linux/device-id/scmi.h>
>  #include <linux/device.h>
>  #include <linux/notifier.h>
>  #include <linux/types.h>
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
> index b4178c42d08f..91ec3704ee2b 100644
> --- a/scripts/mod/devicetable-offsets.c
> +++ b/scripts/mod/devicetable-offsets.c
> @@ -1,5 +1,6 @@
>  // SPDX-License-Identifier: GPL-2.0
>  #define COMPILE_OFFSETS
> +#include <linux/device-id/scmi.h>

Drop this for above mentioned reason.

>  #include <linux/kbuild.h>
>  #include <linux/mod_devicetable.h>
>  
> @@ -144,6 +145,10 @@ int main(void)
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
> index 8d36c74dec2d..5379b1def07b 100644
> --- a/scripts/mod/file2alias.c
> +++ b/scripts/mod/file2alias.c
> @@ -121,6 +121,7 @@ typedef struct {
>  /* Big exception to the "don't include kernel headers into userspace, which
>   * even potentially has different endianness and word sizes, since
>   * we handle those differences explicitly below */
> +#include "../../include/linux/device-id/scmi.h"

Drop this for above mentioned reason.

-- 
Regards,
Sudeep

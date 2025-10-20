Received: from frasgout.his.huawei.com (frasgout.his.huawei.com [185.176.79.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 515EE330D34
	for <arm-scmi@vger.kernel.org>; Mon, 20 Oct 2025 17:11:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.176.79.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760980274; cv=none; b=GSiz7eGhyyBS7/7j9H4ojlEq95t22FiUKOPNMsUaf2V9UALME6B5kujkUVuaEio7mf2WZpYj66XfQWN+v7SD31jQZUQZnTCUvonLyAoUDIv/iypWGKE9XuN13qNUUX26kCj3Ns12sPalkL6cKQB+kn2iNVCBrQD44S89h1Lb+ro=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760980274; c=relaxed/simple;
	bh=uPS9xZSO+wClT1vryY16mNrmM/ilV4PvyfmCeTkVz1E=;
	h=Date:From:To:CC:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=FWnS5cj/L8YT+eVqSNu2hDCtRSW+iwsZx4zErK/Edmv9B9sgMagGnkSg8jTQRd/5PDYvL5g7H7Iua2wi+q8AgnK21oKP4eQpvS5YWG0Shrgmgf+XVzUqOo1dPGpJcEF37HhjGzTFIMjI/gB7E2V6NGi2ITiIYeRHEU5fui2ppjU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; arc=none smtp.client-ip=185.176.79.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Received: from mail.maildlp.com (unknown [172.18.186.231])
	by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4cr21X5Vstz6L4vM;
	Tue, 21 Oct 2025 01:08:00 +0800 (CST)
Received: from dubpeml100005.china.huawei.com (unknown [7.214.146.113])
	by mail.maildlp.com (Postfix) with ESMTPS id 3EB39140275;
	Tue, 21 Oct 2025 01:11:08 +0800 (CST)
Received: from localhost (10.48.157.75) by dubpeml100005.china.huawei.com
 (7.214.146.113) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Mon, 20 Oct
 2025 18:11:07 +0100
Date: Mon, 20 Oct 2025 18:11:06 +0100
From: Jonathan Cameron <jonathan.cameron@huawei.com>
To: Sudeep Holla <sudeep.holla@arm.com>
CC: Cristian Marussi <cristian.marussi@arm.com>, <arm-scmi@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH 2/8] firmware: arm_scmi: Extend transport driver macro
 to support ACPI
Message-ID: <20251020181106.0000724f@huawei.com>
In-Reply-To: <20251017-acpi_scmi_pcc-v1-2-0adbab7709d9@arm.com>
References: <20251017-acpi_scmi_pcc-v1-0-0adbab7709d9@arm.com>
	<20251017-acpi_scmi_pcc-v1-2-0adbab7709d9@arm.com>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.42; x86_64-w64-mingw32)
Precedence: bulk
X-Mailing-List: arm-scmi@vger.kernel.org
List-Id: <arm-scmi.vger.kernel.org>
List-Subscribe: <mailto:arm-scmi+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:arm-scmi+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: lhrpeml500011.china.huawei.com (7.191.174.215) To
 dubpeml100005.china.huawei.com (7.214.146.113)

On Fri, 17 Oct 2025 14:23:45 +0100
Sudeep Holla <sudeep.holla@arm.com> wrote:

> Extend the SCMI transport driver helper to also support ACPI-based
> systems. Introduce an internal helper macro that accepts both OF and
> ACPI match tables, and expose two wrappers:
>=20
>   - DEFINE_SCMI_TRANSPORT_DRIVER(...)      -> DT/OF wrapper (unchanged AB=
I)
>   - DEFINE_SCMI_ACPI_TRANSPORT_DRIVER(...) -> ACPI wrapper
>=20
> For ACPI, the generated platform_driver now sets .acpi_match_table via
> ACPI_PTR() so that builds without CONFIG_ACPI remain safe (becomes NULL).
In general it doesn't normally matter if ACPI_PTR() isn't used.

What specifically is this preventing?  If CONFIG_ACPI isn't set then we'll =
never
use those paths anyway.  Using ACPI_PTR() tends to need ifdef magic or
__maybe_unused markings that are rarely worth the effort for these tiny
tables.

> The spawned platform_device inherits the parent device=E2=80=99s ACPI com=
panion
> to ensure proper firmware-node association (i.e.subsequent lookups or
> fwnode use see the correct firmware node).
>=20
> This keeps existing DT users unchanged and continues to function as
> expected while allowing transports to be probed using the structure
> `acpi_device_id` tables on ACPI platforms.
>=20
> Signed-off-by: Sudeep Holla <sudeep.holla@arm.com>
> ---
>  drivers/firmware/arm_scmi/common.h | 14 ++++++++++++--
>  1 file changed, 12 insertions(+), 2 deletions(-)
>=20
> diff --git a/drivers/firmware/arm_scmi/common.h b/drivers/firmware/arm_sc=
mi/common.h
> index 911941e6885d..d038fec72360 100644
> --- a/drivers/firmware/arm_scmi/common.h
> +++ b/drivers/firmware/arm_scmi/common.h
> @@ -9,6 +9,7 @@
>  #ifndef _SCMI_COMMON_H
>  #define _SCMI_COMMON_H
> =20
> +#include <linux/acpi.h>
>  #include <linux/bitfield.h>
>  #include <linux/completion.h>
>  #include <linux/device.h>
> @@ -453,7 +454,8 @@ struct scmi_transport {
>  	struct scmi_transport_core_operations **core_ops;
>  };
> =20
> -#define DEFINE_SCMI_TRANSPORT_DRIVER(__tag, __drv, __desc, __match, __co=
re_ops)\
> +#define __DEFINE_SCMI_TRANSPORT_DRIVER(__tag, __drv, __desc, __of_match,=
       \
> +					__acpi_match, __core_ops)	       \
>  static void __tag##_dev_free(void *data)				       \
>  {									       \
>  	struct platform_device *spdev =3D data;				       \
> @@ -474,6 +476,7 @@ static int __tag##_probe(struct platform_device *pdev=
)			       \
>  									       \
>  	device_set_of_node_from_dev(&spdev->dev, dev);			       \
>  	device_set_node(&spdev->dev, dev_fwnode(dev));			       \
> +	ACPI_COMPANION_SET(&spdev->dev, ACPI_COMPANION(dev));		       \
>  									       \
>  	strans.supplier =3D dev;						       \
>  	memcpy(&strans.desc, &(__desc), sizeof(strans.desc));		       \
> @@ -498,11 +501,18 @@ err:									       \
>  static struct platform_driver __drv =3D {					       \
>  	.driver =3D {							       \
>  		   .name =3D #__tag "_transport",				       \
> -		   .of_match_table =3D __match,				       \
> +		   .of_match_table =3D __of_match,			       \
> +		   .acpi_match_table =3D ACPI_PTR(__acpi_match),		       \
>  		   },							       \
>  	.probe =3D __tag##_probe,						       \
>  }
> =20
> +#define DEFINE_SCMI_TRANSPORT_DRIVER(__tag, __drv, __desc, __match, __co=
re_ops)\
> +	__DEFINE_SCMI_TRANSPORT_DRIVER(__tag, __drv, __desc, __match, NULL, __c=
ore_ops)
> +
> +#define DEFINE_SCMI_ACPI_TRANSPORT_DRIVER(__tag, __drv, __desc, __match,=
 __core_ops)\
> +	__DEFINE_SCMI_TRANSPORT_DRIVER(__tag, __drv, __desc, NULL, __match, __c=
ore_ops)
> +
>  void scmi_notification_instance_data_set(const struct scmi_handle *handl=
e,
>  					 void *priv);
>  void *scmi_notification_instance_data_get(const struct scmi_handle *hand=
le);
>=20


Received: from mail-wr2-f26.google.com (mail-wr2-f26.google.com [74.125.225.90])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 582C8481647
	for <arm-scmi@vger.kernel.org>; Mon, 21 Sep 2026 15:19:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.90
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790003993; cv=none; b=U5lpcdmC63ArDE4LyL4BBdOfCAkgLesZ3rEEm/sxAeETN4YFVnBYkm3BLZ0lymkCK3ewJ+FyviQ8iBy47mWGc68U0RWbxlxPcYaNjXsa+d6JxWb/3pr3TJUb2D+GjzsFPfQAC8K5aEMIUvhHn7zg6ElmA/ZdSLDIUWDt4rnenS8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790003993; c=relaxed/simple;
	bh=T5uPgrfVPAdy5ijPsKrIrWo36pCK6jIM4tGNt0BFMlo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=f9s9mII1QHbzS3+dN4SpS1rGJ1LO8NNlS/MB6mR8+LNoX7gv9QCxmjW5+VuCSAudVK7c9FbptHmqCgES0wq5cJ88/LV+dIhnNh2GvkLAGCfZy7ovlBRJXdu4l5DY38RIb4WJienBc20JxM7Dty21w3gDquevn34DoEkhOzq5eJU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=MB/RkZOs; arc=none smtp.client-ip=74.125.225.90
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="MB/RkZOs"
Received: by mail-wr2-f26.google.com with SMTP id ffacd0b85a97d-4843f22dc83so2265797f8f.1
        for <arm-scmi@vger.kernel.org>; Mon, 21 Sep 2026 08:19:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1790003987; x=1790608787; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=vV/yPDzhsjcBqB0No8n/B1gnDkpysOLtRQGRvwg7ZOw=;
        b=MB/RkZOsAc8s+8K60hWxusTb9d998BLyw6pNj3KIlywhjqPEAbfau0BdIo/Y58L3W7
         0tD/XREtYE+OhrM3m4MBR8w5n0YDNqZnD5EWshuiOzQvY9JpWf2hFyxmBAYe1KncL5X2
         j4w8E2WmjQsSACQaOdtIJgwFqMPS0ZyFiVtFLedlUp8iorxw69RCah6FaZJZnRfcH6nP
         QKNQ0ntJ7b5hMW2YluAWZWXMCdSqmNB5EXNIJjdEqcmJRfsHhg2eSOgx30MZJqorvUtU
         qc50AcJh53Ol5PoRJlHL6bGqywZtx2d67yonc5UWZqyR4o1nrmQgF4V4VwMSYA8sQ84B
         rGAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790003987; x=1790608787;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vV/yPDzhsjcBqB0No8n/B1gnDkpysOLtRQGRvwg7ZOw=;
        b=lOZkJRNOqRZkKHdepW9+XsBP1+HMjx+v0SqcjJwttpyyGxon5UcuXXOFLsBysdWkCa
         /ZO9UypMmoLPHNFYncE2LC6SfxwlMXd3lgPYJKAS1o8Cmad4uHrZ/S1A/micvUsnPwhN
         Gpui5kfZ3Pa9ToMcchhF1cfCgCOjqj1tfyn7kIGIKn3YIp381XvLasZarATNFDmTeOAZ
         UPHE7/k1ALL19xBHFOIkAfmC7W3tRaOyadB+X8e5V+vlc9WL7KMa4Fa+zMpyAdTTGJzg
         eiuMIYBNOXW/g3lBILJI6wxV7llUqNHaNSdHnaFMAOZMz/eaCExDu3N3YxIdWJK2+2xp
         Xp/g==
X-Forwarded-Encrypted: i=1; AKwUvBxakcJJZWXWfIDkm5B4irNo3Mn86JgdAcbjGwoKBb+4MVV2OSSnLlF7eE4sfpQpXFXQkLxxIQAFBg==@vger.kernel.org
X-Gm-Message-State: AFuF++kSIEXA5eZASvZkE7BcXy2Aazati4qDoxERcTVWlguoCc47hyD0
	BV0DxU5QX8evcxZcIf0r4FxIrdBuVr27liD0ooIXLrHmwd9OGMbSld238OPcUX+YAbw=
X-Gm-Gg: AYBFou0+w9hfP/FZN4hyzXosOOgZMYucKTsdaApf3rWAX6vLh6yTbFYN+MF5THFpmBV
	441hSSscwmttdHRxlFDeyFtCqnr7rWCV4vFT3GNURMjJR/JwzsGnRHafJRRB8zh6VsuPOx8QAcL
	k0GLU+FYVH5G3qn6uxZ8SSLhXGr8mOByA7QzTevog/HuFPdwy984xUcF4yfB5lcwb+C2UpFdIp3
	0wntpXJO+VQnyfxf86K9TQP7gF5pto3gkqFuxhxPi0BioAgnVjcWi5GNhvlWs/44uc/YkZFWL1r
	rtiax6M6Z+N2wI2acjt3cEubxYZWx5Pj4h+AjaVxcq1TlWpG9lFAOmLGQJ+5SAuYuBucfq92y8S
	LpctpqJh1S7vkD604iUn4HnGIxWY36fp8Lyt+9BL6iVbk0oIXgVoeXu/OjiZbPhr10P5f9e/8R3
	huHpBImpwg36fFkK9MD9wXwmFciOBfXEwPBKisdjcVIcVTDOHzew1PKVIplNNM9g9Su/sf56xpK
	mRQRXYrpT8Z4k3PYkiYZ11ePrKuRZa7a0R33iY0h/jliMAtCNo1xPCRfUFa2w==
X-Received: by 2002:a05:6000:420a:b0:487:35c:6e6b with SMTP id ffacd0b85a97d-4871e244c95mr16766538f8f.12.1790003987507;
        Mon, 21 Sep 2026 08:19:47 -0700 (PDT)
Received: from localhost (p200300f65f19a904d4f76eed31f2ef79.dip0.t-ipconnect.de. [2003:f6:5f19:a904:d4f7:6eed:31f2:ef79])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-48724591eaasm23509562f8f.26.2026.09.21.08.19.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2026 08:19:46 -0700 (PDT)
Date: Mon, 21 Sep 2026 17:19:45 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Hans de Goede <johannes.goede@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Cristian Marussi <cristian.marussi@arm.com>, Sudeep Holla <sudeep.holla@kernel.org>, 
	Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>, Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>, 
	Frank.Li@kernel.org, arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-arm-msm@vger.kernel.org, imx@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v7 1/2] module: add SCMI device table alias support
Message-ID: <arFKVhlgJge5EZyj@monoceros>
References: <20260918092951.5656-1-johannes.goede@oss.qualcomm.com>
 <20260918092951.5656-2-johannes.goede@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: arm-scmi@vger.kernel.org
List-Id: <arm-scmi.vger.kernel.org>
List-Subscribe: <mailto:arm-scmi+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:arm-scmi+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="x3f53yyge7gbc6ag"
Content-Disposition: inline
In-Reply-To: <20260918092951.5656-2-johannes.goede@oss.qualcomm.com>


--x3f53yyge7gbc6ag
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v7 1/2] module: add SCMI device table alias support
MIME-Version: 1.0

On Fri, Sep 18, 2026 at 11:29:50AM +0200, Hans de Goede wrote:
> From: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
>=20
> SCMI client drivers already describe their bus match data with
> MODULE_DEVICE_TABLE(scmi, ...), but modpost does not know how to consume
> SCMI device tables. As a result, SCMI modules do not get generated module
> aliases from their id tables.
>=20
> Move struct scmi_device_id to mod_devicetable.h so it has a fixed layout
> visible to modpost, add the corresponding generated offsets and teach
> file2alias to emit scmi:<protocol>:<name> aliases.
>=20
> Use the same stable alias format for SCMI device uevents and sysfs
> modaliases. The previous string included the instance-specific device
> name, which is not useful for matching modules.
>=20
> Assisted-by: Codex:GPT-5.5
> Reviewed-by: Hans de Goede <johannes.goede@oss.qualcomm.com>
> Tested-by: Hans de Goede <johannes.goede@oss.qualcomm.com>
> Signed-off-by: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
> Signed-off-by: Hans de Goede <johannes.goede@oss.qualcomm.com>
> ---
> Changes in v7:
> - Rebase on top of v7.3-rc3
>=20
> Changes in v4:
> - Drop unused driver_data member from struct scmi_device_id (Uwe)
> - Drop device-id/scmi.h include from mod_devicetable.h (Uwe)
> - Add device-id/scmi.h to devicetable-offsets.c and file2alias.c (Uwe)
>=20
> Changes in v3:
> - Adjust for ad428f5811bd ("mod_devicetable.h: Split into per subsystem
>   headers")
> - Add '\n' to modalias_show() output, matching other subsystems' modalias
>=20
> Changes in v2:
> - Drop #include <linux/mod_devicetable.h> from scmi_protocol.h
> - Link to v1: https://patch.msgid.link/20260616-scmi-modalias-v1-0-662b8d=
d52ab2@oss.qualcomm.com
> ---
>  MAINTAINERS                       |  1 +
>  drivers/firmware/arm_scmi/bus.c   | 21 ++++++++++-----------
>  include/linux/device-id/scmi.h    | 17 +++++++++++++++++
>  include/linux/scmi_protocol.h     |  6 +-----
>  scripts/mod/devicetable-offsets.c |  5 +++++
>  scripts/mod/file2alias.c          | 12 ++++++++++++
>  6 files changed, 46 insertions(+), 16 deletions(-)
>  create mode 100644 include/linux/device-id/scmi.h
>=20
> diff --git a/MAINTAINERS b/MAINTAINERS
> index c2414447892c..f351ec56a2ec 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -26604,6 +26604,7 @@ F:	drivers/pmdomain/arm/
>  F:	drivers/powercap/arm_scmi_powercap.c
>  F:	drivers/regulator/scmi-regulator.c
>  F:	drivers/reset/reset-scmi.c
> +F:	include/linux/device-id/scmi.h
>  F:	include/linux/sc[mp]i_protocol.h
>  F:	include/trace/events/scmi.h
>  F:	include/uapi/linux/virtio_scmi.h
> diff --git a/drivers/firmware/arm_scmi/bus.c b/drivers/firmware/arm_scmi/=
bus.c
> index e060edbe7e83..51de50fbc382 100644
> --- a/drivers/firmware/arm_scmi/bus.c
> +++ b/drivers/firmware/arm_scmi/bus.c
> @@ -12,11 +12,12 @@
>  #include <linux/of.h>
>  #include <linux/kernel.h>
>  #include <linux/slab.h>
> +#include <linux/string.h>
>  #include <linux/device.h>
> =20
>  #include "common.h"
> =20
> -#define SCMI_UEVENT_MODALIAS_FMT	"%s:%02x:%s"
> +#define SCMI_UEVENT_MODALIAS_FMT	SCMI_MODULE_PREFIX "%02x:%s"
> =20
>  BLOCKING_NOTIFIER_HEAD(scmi_requested_devices_nh);
>  EXPORT_SYMBOL_GPL(scmi_requested_devices_nh);
> @@ -185,7 +186,7 @@ static int scmi_protocol_table_register(const struct =
scmi_device_id *id_table)
>  	const struct scmi_device_id *entry;
>  	int ret;
> =20
> -	for (entry =3D id_table; entry->name; entry++) {
> +	for (entry =3D id_table; entry->name[0]; entry++) {
>  		ret =3D scmi_protocol_device_request(entry);
>  		if (ret)
>  			goto err_unrequest;
> @@ -205,7 +206,7 @@ scmi_protocol_table_unregister(const struct scmi_devi=
ce_id *id_table)
>  {
>  	const struct scmi_device_id *entry;
> =20
> -	for (entry =3D id_table; entry->name; entry++)
> +	for (entry =3D id_table; entry->name[0]; entry++)
>  		scmi_protocol_device_unrequest(entry);
>  }
> =20
> @@ -219,10 +220,10 @@ static int __scmi_dev_match_by_id_table(struct scmi=
_device *scmi_dev,
>  					const struct scmi_device_id *id_table,
>  					bool skip_transport)
>  {
> -	if (!id_table || !id_table->name)
> +	if (!id_table || !id_table->name[0])
>  		return 0;
> =20
> -	for (; id_table->protocol_id && id_table->name; id_table++)
> +	for (; id_table->protocol_id && id_table->name[0]; id_table++)
>  		if (id_table->protocol_id =3D=3D scmi_dev->protocol_id &&
>  		    !(skip_transport && scmi_device_is_transport(scmi_dev)) &&
>  		    !strcmp(id_table->name, scmi_dev->name))
> @@ -266,7 +267,7 @@ scmi_child_dev_find_get(struct device *parent, int pr=
ot_id, const char *name)
>  	struct device *dev;
> =20
>  	id_table[0].protocol_id =3D prot_id;
> -	id_table[0].name =3D name;
> +	strscpy(id_table[0].name, name, sizeof(id_table[0].name));
> =20
>  	dev =3D device_find_child(parent, &id_table, scmi_match_by_id_table);
>  	if (!dev)
> @@ -300,8 +301,7 @@ static int scmi_device_uevent(const struct device *de=
v, struct kobj_uevent_env *
>  	const struct scmi_device *scmi_dev =3D to_scmi_dev(dev);
> =20
>  	return add_uevent_var(env, "MODALIAS=3D" SCMI_UEVENT_MODALIAS_FMT,
> -			      dev_name(&scmi_dev->dev), scmi_dev->protocol_id,
> -			      scmi_dev->name);
> +			      scmi_dev->protocol_id, scmi_dev->name);
>  }
> =20
>  static ssize_t modalias_show(struct device *dev,
> @@ -309,9 +309,8 @@ static ssize_t modalias_show(struct device *dev,
>  {
>  	struct scmi_device *scmi_dev =3D to_scmi_dev(dev);
> =20
> -	return sysfs_emit(buf, SCMI_UEVENT_MODALIAS_FMT,
> -			  dev_name(&scmi_dev->dev), scmi_dev->protocol_id,
> -			  scmi_dev->name);
> +	return sysfs_emit(buf, SCMI_UEVENT_MODALIAS_FMT "\n",
> +			  scmi_dev->protocol_id, scmi_dev->name);
>  }
>  static DEVICE_ATTR_RO(modalias);
> =20
> diff --git a/include/linux/device-id/scmi.h b/include/linux/device-id/scm=
i.h
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

I wonder if you tried to keep this a char *. ISTR someone did something
similar recently and they claimed it worked. That would get rid of the
artificial name size limit and simplify this patch.

> +};
> +
> +#endif /* ifndef LINUX_DEVICE_ID_SCMI_H */
> diff --git a/include/linux/scmi_protocol.h b/include/linux/scmi_protocol.h
> index 5ab73b1ab9aa..ba53302d95f5 100644
> --- a/include/linux/scmi_protocol.h
> +++ b/include/linux/scmi_protocol.h
> @@ -9,6 +9,7 @@
>  #define _LINUX_SCMI_PROTOCOL_H
> =20
>  #include <linux/bitfield.h>
> +#include <linux/device-id/scmi.h>
>  #include <linux/device.h>
>  #include <linux/notifier.h>
>  #include <linux/types.h>
> @@ -951,11 +952,6 @@ struct scmi_device {
> =20
>  #define to_scmi_dev(d) container_of_const(d, struct scmi_device, dev)
> =20
> -struct scmi_device_id {
> -	u8 protocol_id;
> -	const char *name;
> -};
> -
>  struct scmi_driver {
>  	const char *name;
>  	int (*probe)(struct scmi_device *sdev);
> diff --git a/scripts/mod/devicetable-offsets.c b/scripts/mod/devicetable-=
offsets.c
> index b4178c42d08f..91ec3704ee2b 100644
> --- a/scripts/mod/devicetable-offsets.c
> +++ b/scripts/mod/devicetable-offsets.c
> @@ -1,5 +1,6 @@
>  // SPDX-License-Identifier: GPL-2.0
>  #define COMPILE_OFFSETS
> +#include <linux/device-id/scmi.h>
>  #include <linux/kbuild.h>
>  #include <linux/mod_devicetable.h>
> =20
> @@ -144,6 +145,10 @@ int main(void)
>  	DEVID(rpmsg_device_id);
>  	DEVID_FIELD(rpmsg_device_id, name);
> =20
> +	DEVID(scmi_device_id);
> +	DEVID_FIELD(scmi_device_id, protocol_id);
> +	DEVID_FIELD(scmi_device_id, name);
> +
>  	DEVID(i2c_device_id);
>  	DEVID_FIELD(i2c_device_id, name);
> =20
> diff --git a/scripts/mod/file2alias.c b/scripts/mod/file2alias.c
> index 8d36c74dec2d..5379b1def07b 100644
> --- a/scripts/mod/file2alias.c
> +++ b/scripts/mod/file2alias.c
> @@ -121,6 +121,7 @@ typedef struct {
>  /* Big exception to the "don't include kernel headers into userspace, wh=
ich
>   * even potentially has different endianness and word sizes, since
>   * we handle those differences explicitly below */
> +#include "../../include/linux/device-id/scmi.h"
>  #include "../../include/linux/mod_devicetable.h"
> =20
>  struct devtable {
> @@ -852,6 +853,16 @@ static void do_rpmsg_entry(struct module *mod, void =
*symval)
>  	module_alias_printf(mod, false, RPMSG_DEVICE_MODALIAS_FMT, *name);
>  }
> =20
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
> @@ -1491,6 +1502,7 @@ static const struct devtable devtable[] =3D {
>  	{"virtio", SIZE_virtio_device_id, do_virtio_entry},
>  	{"vmbus", SIZE_hv_vmbus_device_id, do_vmbus_entry},
>  	{"rpmsg", SIZE_rpmsg_device_id, do_rpmsg_entry},
> +	{"scmi", SIZE_scmi_device_id, do_scmi_entry},
>  	{"i2c", SIZE_i2c_device_id, do_i2c_entry},
>  	{"i3c", SIZE_i3c_device_id, do_i3c_entry},
>  	{"slim", SIZE_slim_device_id, do_slim_entry},

I wonder if this is supposed to be ordered alphabetically ...

Best regards
Uwe

--x3f53yyge7gbc6ag
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmqxSw8ACgkQj4D7WH0S
/k5lIQf+Pk0pBFCMv2UlNFoYrcnt7sDd37qCqzSchh+C4VDUQJUrS+U3++VDP+w9
qQ1uz0pIZ08N7xrsAvI2b21w1QjBsVGfuA2K79Q66sHHNPWk2x4jLyXebehylwj7
RqUjmFBRQ6OlpZtdOfcLG0mCopgIcOa+3LMWCkac4VENvzFOQ8aHkYLCM6F8Zr3T
QHSpbWMHoPvXSbjW2ZgFDgQZbr9fVvHMcCiX1ronBbv2mqBXRzAOrjcR0IS4fqjM
0Wt+9Tibbskx3/E7EaOFar9w+dVwvg89nGCWvz9ke6FgJhqfsM9UFyz0Vv7R1kbz
gnmskjzm0NxgGlfZSipyOdiObLtMnw==
=ZEo+
-----END PGP SIGNATURE-----

--x3f53yyge7gbc6ag--

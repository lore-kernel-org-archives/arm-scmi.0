Received: from mx-relay09-hz2.antispameurope.com (mx-relay09-hz2.antispameurope.com [83.246.65.95])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 685E132720D
	for <arm-scmi@vger.kernel.org>; Thu,  5 Mar 2026 07:45:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=83.246.65.95
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772696707; cv=pass; b=YJs6yLDBi7NqpzQp99pVwWVgy/532s7zXppTPkjGMeaux5aiqRZh5qV6KtnxhMJkOnzuoN3Qg2zUugsJ6P0okGaErviudbYxSrt8SLr33kGPvg7eCyd5fchRhVeVwTHOWIPjft84Ty9gb6WrYVTOHmkn48g9oLO0TOQtGEafB0Q=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772696707; c=relaxed/simple;
	bh=VkfXdhFkXXGCFaGF/PKuBChEyHWQEoWfG/+cE8foJMI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=HdOqTtexps/9tEgThv+Znkh6tx76kmfB+w9HNxTIZTsVCDlLGjoalGlNGdSYN3HBPSi7NBua49npwecOvfXkJbqVIyCYNJjIMVwkoDxVBB8rLZ5mbzeLICm/l/hkVwp+kFC3h6Kxi6vkY+PjIcLsmAvIel928xwYL18yUUbsqL4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ew.tq-group.com; spf=pass smtp.mailfrom=ew.tq-group.com; dkim=pass (2048-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b=eo8aeDd6; arc=pass smtp.client-ip=83.246.65.95
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b="eo8aeDd6"
ARC-Authentication-Results: i=1; mx-gate09-hz2.hornetsecurity.com 1; spf=pass
 reason=mailfrom (ip=94.100.132.6, headerfrom=ew.tq-group.com)
 smtp.mailfrom=ew.tq-group.com
 smtp.helo=hmail-p-smtp01-out03-hz1.hornetsecurity.com; dmarc=pass
 header.from=ew.tq-group.com orig.disposition=pass
ARC-Message-Signature: a=rsa-sha256;
 bh=OdvhvZ4bHSo/yG9FNjUp1pK4DykQel3I0Di4UK28igI=; c=relaxed/relaxed;
 d=hornetsecurity.com; h=from:to:date:subject:mime-version:; i=1; s=hse1;
 t=1772696670;
 b=LHO29hIfidHXVE5jFHLBynSbVM45GgXgtnEV0LCHD1OLTAo/O83qps5qCWp0seSF7SCs+PQF
 ApvkqPuZX2nJd3iteMRiZ/9bhzcv/ApVFvbSc6NjV6zsSCHGvqLneU+HRhTYUNY4IAiGDIInQl+
 SfZ0y8a/q5ykBjn0OaUf6KSHG+AIlKPjDWy6PkNkBf8BO/5PzkRfdiFQLIHrnx0i6ZDi/g08x5n
 nczQp+MMwfJ7DiiCy++7rW0Xo6KH21igFTSvyPLxEu5k9MdcdZVl8GBupumn8vztpwbm+JAILQw
 SNGTZHCm/vZMQ3XwjYSmSOLaPaWwy6fcAwY4K3pcxCIkA==
ARC-Seal: a=rsa-sha256; cv=none; d=hornetsecurity.com; i=1; s=hse1;
 t=1772696670;
 b=pMXPKwNWxDttMJKE4nXH+r9yBfd2EwKr/XxkkHfrS20qsuC0RAzche7x/uplBXNY5l6fsNuW
 tJn4ANJtsKkCRFPmOEOjIG6+74Gqk7H2rHyufhjlaVqg2oNGL3zMNyiHGhjmCBk/wrmGLCoHTiN
 /SEKGIC8F94fuvvLuCVBjQ6cLZ325YNEq3WfjrTgoOy0X4HW6pzIGSOpcfvuVGu81J7c5oPdcZy
 sCZHpenBCTS+YPhi5dUT3rUe6F8BbPLEFo746d35JZj6m5wkwTFHm+4Sjjgh5wDyUHeZGOj+mRZ
 sIyHhlBd2Fyjwd6nUnCFa1mtlQodAPKYAAuRo609dBDnw==
Received: from he-nlb01-hz1.hornetsecurity.com ([94.100.132.6]) by mx-relay09-hz2.antispameurope.com;
 Thu, 05 Mar 2026 08:44:30 +0100
Received: from steina-w.localnet (host-82-135-125-110.customer.m-online.net [82.135.125.110])
	(Authenticated sender: alexander.stein@ew.tq-group.com)
	by hmail-p-smtp01-out03-hz1.hornetsecurity.com (Postfix) with ESMTPSA id A6767CC0E88;
	Thu,  5 Mar 2026 08:44:26 +0100 (CET)
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Sudeep Holla <sudeep.holla@kernel.org>,
 Cristian Marussi <cristian.marussi@arm.com>, Frank Li <Frank.Li@nxp.com>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, linux-arm-kernel@lists.infradead.org
Cc: arm-scmi@vger.kernel.org, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 Peng Fan <peng.fan@nxp.com>, "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Subject: Re: [PATCH 2/2] firmware: imx: sm-misc: Print boot/shutdown reasons
Date: Thu, 05 Mar 2026 08:44:26 +0100
Message-ID: <24409695.EfDdHjke4D@steina-w>
Organization: TQ-Systems GmbH
In-Reply-To: <20260305-scmi-imx-reset-v1-2-18de78978ba9@nxp.com>
References:
 <20260305-scmi-imx-reset-v1-0-18de78978ba9@nxp.com>
 <20260305-scmi-imx-reset-v1-2-18de78978ba9@nxp.com>
Precedence: bulk
X-Mailing-List: arm-scmi@vger.kernel.org
List-Id: <arm-scmi.vger.kernel.org>
List-Subscribe: <mailto:arm-scmi+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:arm-scmi+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"
X-cloud-security-sender:alexander.stein@ew.tq-group.com
X-cloud-security-recipient:arm-scmi@vger.kernel.org
X-cloud-security-crypt: load encryption module
X-cloud-security-Mailarchiv: E-Mail archived for: alexander.stein@ew.tq-group.com
X-cloud-security-Mailarchivtype:outbound
X-cloud-security-Virusscan:CLEAN
X-cloud-security-disclaimer: This E-Mail was scanned by E-Mailservice on mx-relay09-hz2.antispameurope.com with 4fRM4W2hZhz20nLZ
X-cloud-security-connect: he-nlb01-hz1.hornetsecurity.com[94.100.132.6], TLS=1, IP=94.100.132.6
X-cloud-security-Digest:135cf0209f1aa8681b8239cf7f35b7f4
X-cloud-security:scantime:1.604
DKIM-Signature: a=rsa-sha256;
 bh=OdvhvZ4bHSo/yG9FNjUp1pK4DykQel3I0Di4UK28igI=; c=relaxed/relaxed;
 d=ew.tq-group.com;
 h=content-type:mime-version:subject:from:to:message-id:date; s=hse1;
 t=1772696670; v=1;
 b=eo8aeDd6Pk8yIO0ZVi8TIcLkITp89Xl0xYIiBFtzCfFFu02sYq8wRJ5leMxxh1B1Pv0dEWdx
 QqjsVWHi8M/GyIdyUdLunIA5Tr+P7Xtyye67HEWkUJiHobdzyMLY93GoSrw/D6PeS6QXd3EiTvw
 k2DlPoiAoToVMq2suQIkvf+KLF2Jms1JjFl3fkXIzZ/d7lMc0slbLm2ks/r4phyZkhLaYJsSY9h
 iwVANDNLR0NQamleAHgTHBTXIdAEct2wRO9lxnExyNg8HAj66iBdulbSNZoYWDM5+QFNA3r4FHR
 uHAlSqNfDJUz4tA60Zq1kZ+18tGn4Tbcvk2pnrTbApFsw==

Hi,

Am Donnerstag, 5. M=E4rz 2026, 02:56:45 CET schrieb Peng Fan (OSS):
> From: Peng Fan <peng.fan@nxp.com>
>=20
> Add reset reason string table for i.MX95 and introduce a helper
> (scmi_imx_misc_get_reason) to query and print both system and LM
> (Logical Machine) reset reasons via the SCMI MISC protocol.
>=20
> Signed-off-by: Peng Fan <peng.fan@nxp.com>
> ---
>  drivers/firmware/imx/sm-misc.c | 73 ++++++++++++++++++++++++++++++++++++=
++++++
>  1 file changed, 73 insertions(+)
>=20
> diff --git a/drivers/firmware/imx/sm-misc.c b/drivers/firmware/imx/sm-mis=
c.c
> index 0a8ada329c9de3c1627da241bf142fa91a8085d7..16b5ff833d21274403a4c55ab=
e2fa1f49fce3e73 100644
> --- a/drivers/firmware/imx/sm-misc.c
> +++ b/drivers/firmware/imx/sm-misc.c
> @@ -18,6 +18,29 @@ static const struct scmi_imx_misc_proto_ops *imx_misc_=
ctrl_ops;
>  static struct scmi_protocol_handle *ph;
>  struct notifier_block scmi_imx_misc_ctrl_nb;
> =20
> +static const char * const rst_imx95[] =3D {
> +	"cm33_lockup", "cm33_swreq", "cm7_lockup", "cm7_swreq", "fccu",
> +	"jtag_sw", "ele", "tempsense", "wdog1", "wdog2", "wdog3", "wdog4",
> +	"wdog5", "jtag", "cm33_exc", "bbm", "sw", "sm_err", "fusa_sreco",
> +	"pmic", "unused", "unused", "unused", "unused", "unused", "unused",
> +	"unused", "unused", "unused", "unused", "unused", "por",
> +};
> +
> +static const char * const rst_imx94[] =3D {
> +	"cm33_lockup", "cm33_swreq", "cm70_lockup", "cm70_swreq", "fccu",
> +	"jtag_sw", "ele", "tempsense", "wdog1", "wdog2", "wdog3", "wdog4",
> +	"wdog5", "jtag", "wdog6", "wdog7", "wdog8", "wo_netc", "cm33s_lockup",
> +	"cm33s_swreq", "cm71_lockup", "cm71_swreq", "cm33_exc", "bbm", "sw",
> +	"sm_err", "fusa_sreco", "pmic", "unused", "unused", "unused", "por",
> +};
> +
> +static const struct of_device_id allowlist[] =3D {
> +	{ .compatible =3D "fsl,imx952", .data =3D rst_imx95 },
> +	{ .compatible =3D "fsl,imx95", .data =3D rst_imx95 },
> +	{ .compatible =3D "fsl,imx94", .data =3D rst_imx94 },
> +	{ /* Sentinel */ }
> +};
> +
>  int scmi_imx_misc_ctrl_set(u32 id, u32 val)
>  {
>  	if (!ph)
> @@ -75,6 +98,54 @@ static void scmi_imx_misc_put(void *p)
>  	debugfs_remove((struct dentry *)p);
>  }
> =20
> +static int scmi_imx_misc_get_reason(struct scmi_device *sdev)
> +{
> +	struct scmi_imx_misc_reset_reason boot, shutdown;
> +	const char **rst;
> +	bool system =3D true;
> +	int ret;
> +
> +	if (!of_machine_device_match(allowlist))
> +		return 0;
> +
> +	rst =3D (const char **)of_machine_get_match_data(allowlist);
> +
> +	ret =3D imx_misc_ctrl_ops->misc_reset_reason(ph, system, &boot, &shutdo=
wn, NULL);
> +	if (!ret) {
> +		if (boot.valid)
> +			dev_info(&sdev->dev, "%s Boot reason: %s, origin: %d, errid: %d\n",
> +				 system ? "SYS" : "LM", rst[boot.reason],
> +				 boot.orig_valid ? boot.origin : -1,
> +				 boot.err_valid ? boot.errid : -1);
> +		if (shutdown.valid)
> +			dev_info(&sdev->dev, "%s shutdown reason: %s, origin: %d, errid: %d\n=
",
> +				 system ? "SYS" : "LM", rst[shutdown.reason],
> +				 shutdown.orig_valid ? shutdown.origin : -1,
> +				 shutdown.err_valid ? shutdown.errid : -1);
> +	} else {
> +		dev_err(&sdev->dev, "Failed to get system reset reason: %d\n", ret);
> +	}
> +
> +	system =3D false;
> +	ret =3D imx_misc_ctrl_ops->misc_reset_reason(ph, system, &boot, &shutdo=
wn, NULL);
> +	if (!ret) {
> +		if (boot.valid)
> +			dev_info(&sdev->dev, "%s Boot reason: %s, origin: %d, errid: %d\n",
> +				 system ? "SYS" : "LM", rst[boot.reason],
> +				 boot.orig_valid ? boot.origin : -1,
> +				 boot.err_valid ? boot.errid : -1);
> +		if (shutdown.valid)
> +			dev_info(&sdev->dev, "%s shutdown reason: %s, origin: %d, errid: %d\n=
",
> +				 system ? "SYS" : "LM", rst[shutdown.reason],
> +				 shutdown.orig_valid ? shutdown.origin : -1,
> +				 shutdown.err_valid ? shutdown.errid : -1);

Is there a way to query this from userspace programs instead of printing in=
to kernel log?

Best regards,
Alexander

> +	} else {
> +		dev_err(&sdev->dev, "Failed to get lm reset reason: %d\n", ret);
> +	}
> +
> +	return 0;
> +}
> +
>  static int scmi_imx_misc_ctrl_probe(struct scmi_device *sdev)
>  {
>  	const struct scmi_handle *handle =3D sdev->handle;
> @@ -133,6 +204,8 @@ static int scmi_imx_misc_ctrl_probe(struct scmi_devic=
e *sdev)
>  	scmi_imx_dentry =3D debugfs_create_dir("scmi_imx", NULL);
>  	debugfs_create_file("syslog", 0444, scmi_imx_dentry, &sdev->dev, &syslo=
g_fops);
> =20
> +	scmi_imx_misc_get_reason(sdev);
> +
>  	return devm_add_action_or_reset(&sdev->dev, scmi_imx_misc_put, scmi_imx=
_dentry);
>  }
> =20
>=20
>=20


=2D-=20
TQ-Systems GmbH | M=FChlstra=DFe 2, Gut Delling | 82229 Seefeld, Germany
Amtsgericht M=FCnchen, HRB 105018
Gesch=E4ftsf=FChrer: Detlef Schneider, R=FCdiger Stahl, Stefan Schneider
http://www.tq-group.com/



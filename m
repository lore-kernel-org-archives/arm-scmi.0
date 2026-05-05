Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B18B8481246;
	Tue,  5 May 2026 15:36:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777995361; cv=none; b=QeO6LXDEsMn9p7ObYY+bwGlpnoV7k4OGAxgkkk1Us2W9+ebYA31YYAxN7K4KGZaJZ2W9nDXMs7vjHsjBlAUrNoeIelyH+4ngPt5dzxTNa3t742+rPSxo+nNoTYl5kYA/wj5XhgWErTJOQLS11gw7SYy1alyiVxlTJFdoIWY0RHw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777995361; c=relaxed/simple;
	bh=XfXn5vFpNRL3BzSGTKkMxL3IKOMOJehLm1MshbVDa3Y=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=S9ZRI1NLTVUzfN9sbHmuUrxqiHe8HI7BhzTaC5xemm+nC0/eRniEfaXYsgiaYyy0KVG6yqBk+CrO24a/TlEnkmaPOPsJH6j9xShPDgk/sJ/2D9ynOREHuPweE92PZj4K2Yvo4APRq4h5+mim+r1agU9ooEF1r7DtebAQRFA3QC8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=AWDQxVrn; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="AWDQxVrn"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6E8A7C2BCB4;
	Tue,  5 May 2026 15:35:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777995361;
	bh=XfXn5vFpNRL3BzSGTKkMxL3IKOMOJehLm1MshbVDa3Y=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=AWDQxVrn13Dvi2p5cBg7DvmBVJECkUW4KGkAuj/2mzPUAQ8/5XITfB8CAIlIVBWup
	 Ym7PULgVTijEOvsO5cJYpCZ6r6ErO8w+MlMtnc4xgvFx+znUvTZIIwWkwN0p4jfzoG
	 LWo5oINKYkWM9mX1HRZM1eRfgzgHIaJqbHlKSuEvQH11CNmV5fWMtpVELw+9aATTME
	 MKcN+LLmXSoPDoOUATagrCgsxKkmqNBJGEegbhF0Bm4+DtxHhEC3oOzhX7JvYvO8kI
	 QJL8T3MzE6XL3k2JjgzSMpsry6FmGG6iE5SPeLAMDZCdqVufAMdkK02Xn+AHz97wwt
	 yB7BwDwIaOx/w==
From: Sudeep Holla <sudeep.holla@kernel.org>
To: Cristian Marussi <cristian.marussi@arm.com>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	"Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Cc: Sudeep Holla <sudeep.holla@kernel.org>,
	arm-scmi@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Peng Fan <peng.fan@nxp.com>
Subject: Re: [PATCH 0/2] firmware: arm_scmi: imx: Support getting reset reason
Date: Tue,  5 May 2026 16:35:53 +0100
Message-ID: <177799528962.2896536.13143365004665388354.b4-ty@b4>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260305-scmi-imx-reset-v1-0-18de78978ba9@nxp.com>
References: <20260305-scmi-imx-reset-v1-0-18de78978ba9@nxp.com>
Precedence: bulk
X-Mailing-List: arm-scmi@vger.kernel.org
List-Id: <arm-scmi.vger.kernel.org>
List-Subscribe: <mailto:arm-scmi+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:arm-scmi+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

On Thu, 05 Mar 2026 09:56:43 +0800, Peng Fan (OSS) wrote:
> i.MX SCMI MISC protocol supports getting reset reason per Logical Machine
> or System. Add the API for user to retrieve the information from System
> Manager.
> 
> Documentation: drivers/firmware/arm_scmi/vendors/imx/imx95.rst +1542
> 
> 
> [...]

Applied to sudeep.holla/linux (for-next/scmi/updates), thanks!

[1/2] firmware: arm_scmi: imx: Support getting reset reason of MISC protocol
      https://git.kernel.org/sudeep.holla/c/dc7ccfc86c1a
[2/2] firmware: imx: sm-misc: Print boot/shutdown reasons
      https://git.kernel.org/sudeep.holla/c/c17216c1a922

--
Regards,
Sudeep


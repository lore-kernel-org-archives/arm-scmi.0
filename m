Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08A471552E0
	for <arm-scmi@vger.kernel.org>; Mon,  3 Mar 2025 08:03:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740989006; cv=none; b=Z9hDOxPPb85o6ljnASzm6au9QBAUmNqlpR3msHvXatYEod2j4QdYq+lR+DIbMewN+qOu0c/H/Yjh9eVt6bn2mxVme05iml1DKa38Mkpu1ZqpGisxUhzlDxpty2z+mB7KrntOyPTj+JDZx9AXK0J3KV4QZ6hEO8vYAy+JD6alkQY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740989006; c=relaxed/simple;
	bh=jXmABgKlTV2rT+eRZ9rrvS2Qs32wSTbnbdHdyY3i1zI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lYL2oI/0nawxXT/vT0QDJVot3EzXRyLMf7w0Cl6oW9O7ZaozLuZE7qGeQuLZal/Tn+qfJDK53RX4ClcwZCt85w0cjzTi7sp0lueVupj0tQOz/i2WBM6+1Wwh8Ax43BcNR/2RnKACC+QuVPBwX0JzYi9XuV4DjOlND6Dqh/vp6xk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=qw4KkNK3; arc=none smtp.client-ip=209.85.208.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="qw4KkNK3"
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-5e56b229d60so492130a12.0
        for <arm-scmi@vger.kernel.org>; Mon, 03 Mar 2025 00:03:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1740989003; x=1741593803; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=L/kOfm+NCxRWU3KiubFOyYUQosuGisbp/XscJHpDiwI=;
        b=qw4KkNK39YKUf3BeGHAcfRXZoWAhW4zvxMF/3RstXU/gmsOdO5I1kxey0L9liwXCNt
         3klQAZSP5No7NUOvzdi4KdhZjXTFD7+cn19gSdJi/hA46S5UmrTjSxjL9RS9b2q/a7KV
         vEbcW32gK0Gm9nA+bvBH2v8u0wlB3Jw6w0QlO4nXHFyY6tRlCXYmCZwvtDGWRzaSa9JS
         yN+rOjDqxnvjRXv3TommK6PeSaDOHW60d3vigc/Qoq6DC6eP1/07J8r3aOQDBxN6CfVb
         8TaDnJh3Mg4i3ik3V4AtTZr3Ne89cosBKIPxkFUfkf119BKRkLBHoJcv8RTiZPI7s2Lx
         rTTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740989003; x=1741593803;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=L/kOfm+NCxRWU3KiubFOyYUQosuGisbp/XscJHpDiwI=;
        b=gDVObRmV3QbOM3TdwPisGNKamoRcSp+JYd0ec3zqacOtn8xs+QLyaZLPFJ5btIhDoV
         99XQx9QPNQNJHZVIvEDmpyNYJIyaNH+NBK6loieoJ6eSmmUsTWm3JXLDGuVO+7DgIaJX
         bVDdFx9Zh3UoxM1qWdCYpWVF+9ap/wA0x6cmXJtLWoPEMZ3n5E3CMNxNMqH/xkwxpydU
         btzOvhvdJun7SdCoYJwY4ccwmeclIYK9WUBzLUZto3Q9yJlmUGJTSYeL70SeSI7SLb1e
         ZJHblJlVRAXj75RevpaMQS13WX95fl7Z5JwCvquzxaodWILCB+9O9oa4pEfAvLGciy/U
         HaOA==
X-Forwarded-Encrypted: i=1; AJvYcCV8y5A3SoclGadWy1hZFACha0WEMFMMaZcGMVaWaH9WptsVSHQ03YbTDBhVL2KcWfCB3lQgACNolQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwUdSlKCQGqQJmuI3/lsJTesHhIq342OXLB01ZsqZA4WBg+buSR
	hndjsLLdMhTaylKrh6myXBAhBwmcm1x0aV1p7ZDMdhA6bYIpb4fT9fIKJ0agFsQ=
X-Gm-Gg: ASbGnctlg4+3x62CEcvv9mCKrm2CxBpERJBUmcqvBQ1x1sT7vm5oIU457iPJzcbCi2K
	GqymnrRnFzv59UcYQgvm0BB82+GGaTy6y4Du7LdY3C89Z4avs36675BSOzpaDvq6hq8MGtcm2IZ
	MwIbegkXsPu8rbRq2ST/mrGB8VF99VnnLtA/z8vRQRucMIR2+1Kq4qpn23a3nxEZOK2uO6HmFiN
	EvgQvuJE1zNnd9k3NlQPGQkpaBvQqclL+pXrEc3yt7qQ/6xPY8t3CSq/C5UDAcBHygGsyFwa0qT
	eS+XpB3YecPAFxxc1w8a2CWwl+RfdaJK/k+Y3rDBAYXXGQt1AQ==
X-Google-Smtp-Source: AGHT+IHSJwyoyFbSkRa1UEg1HQ8PZPp0oWijLI/xxUyJmjC4df5Zae4YdAsynhyaSb+1Hid60bmPNw==
X-Received: by 2002:a17:907:7f26:b0:ab7:f853:1445 with SMTP id a640c23a62f3a-abf26883e80mr1335907866b.26.1740989002624;
        Mon, 03 Mar 2025 00:03:22 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id a640c23a62f3a-abf0c6ee730sm764757766b.104.2025.03.03.00.03.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Mar 2025 00:03:22 -0800 (PST)
Date: Mon, 3 Mar 2025 11:03:18 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Cc: Sudeep Holla <sudeep.holla@arm.com>,
	Cristian Marussi <cristian.marussi@arm.com>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-kernel@vger.kernel.org,
	arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	imx@lists.linux.dev, devicetree@vger.kernel.org,
	Peng Fan <peng.fan@nxp.com>
Subject: Re: [PATCH v3 3/7] firmware: arm_scmi: imx: Add i.MX95 LMM protocol
Message-ID: <2c8e8e93-4ce7-4260-94bd-eabba0b7732d@stanley.mountain>
References: <20250303-imx-lmm-cpu-v3-0-7695f6f61cfc@nxp.com>
 <20250303-imx-lmm-cpu-v3-3-7695f6f61cfc@nxp.com>
Precedence: bulk
X-Mailing-List: arm-scmi@vger.kernel.org
List-Id: <arm-scmi.vger.kernel.org>
List-Subscribe: <mailto:arm-scmi+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:arm-scmi+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250303-imx-lmm-cpu-v3-3-7695f6f61cfc@nxp.com>

On Mon, Mar 03, 2025 at 10:53:24AM +0800, Peng Fan (OSS) wrote:
> +static int scmi_imx_lmm_attributes(const struct scmi_protocol_handle *ph,
> +				   u32 lmid, struct scmi_imx_lmm_info *info)
> +{
> +	struct scmi_msg_imx_lmm_attributes_out *out;
> +	struct scmi_xfer *t;
> +	int ret;
> +
> +	ret = ph->xops->xfer_get_init(ph, SCMI_IMX_LMM_ATTRIBUTES, sizeof(u32), 0, &t);
> +	if (ret)
> +		return ret;
> +
> +	put_unaligned_le32(lmid, t->tx.buf);
> +	ret = ph->xops->do_xfer(ph, t);
> +	if (!ret) {
> +		out = t->rx.buf;
> +		info->lmid = le32_to_cpu(out->lmid);
> +		info->state = le32_to_cpu(out->state);
> +		info->errstatus = le32_to_cpu(out->errstatus);
> +		strscpy(info->name, out->name);
> +		dev_dbg(ph->dev, "i.MX LMM: Logical Machine(%d), name: %s\n",
> +			info->lmid, out->name);

Print info->name instead of out->name.

> +	} else {
> +		dev_err(ph->dev, "i.MX LMM: Failed to get info of Logical Machine(%u)\n", lmid);
> +	}
> +
> +	ph->xops->xfer_put(ph, t);
> +
> +	return ret;
> +}

regards,
dan carpenter


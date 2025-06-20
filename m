Received: from mail-ot1-f43.google.com (mail-ot1-f43.google.com [209.85.210.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2FB1137E
	for <arm-scmi@vger.kernel.org>; Fri, 20 Jun 2025 21:01:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750453289; cv=none; b=DKB7JcrTlwZx/W2IYPugxSB2i5FzGjSJVnxRRwlgh4UR2KsK2Nj3bOvBE2IVZPASBo2d35kSWnG/t/sKfSRcQFIl5wbVtPmWCq5OaVvjuTK1TNeM8GWb4367cYFzLJOhz8A5M9xd0c7CxvrQpxzDQUWUilLPTfOkjfFp5yVtg9o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750453289; c=relaxed/simple;
	bh=tHyk3t0CuXdNhj2Iwn8cdQiUUp8AeSUXGMFoEDsSqHs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HdVJu+9IuNPBWYTBMvBGeAiCnaMizAyhPjy1OZPw5mW31voCmxTMsLYs9k64AEso+bWx711ghPDK+sRQBzf7bg9A0tMBTJaCTf5RDgAZN7cSW4EHcjhLNcTNmn0rArgAReqxE+0eXNXvgZseufSW50Z6yKkHzXFMxLUz91pGZb0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=YmzK5i6s; arc=none smtp.client-ip=209.85.210.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="YmzK5i6s"
Received: by mail-ot1-f43.google.com with SMTP id 46e09a7af769-72c13802133so679633a34.3
        for <arm-scmi@vger.kernel.org>; Fri, 20 Jun 2025 14:01:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1750453287; x=1751058087; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=bPfdrJsc6SyDgZhcqK06/DS6CQf5yfjgO3ypGfImvDI=;
        b=YmzK5i6sdPBi6dpr0Fr9y3DXCHKwl/zmKaqukVCGT/eEYzP+bvtTdqh2GtB9N4O0Vg
         zR0u5kEc599Jgi+NxEE7QM4MT9bZDZqObdQ4P7rXWdhUMKuv5H9uiV2epAFgaMxgoc8Q
         aYFUcwBys1W0waL7Y+7dXpLyUu84dd3RXwflXrJSen2D8QBAKp7Ri3db5N4xEyU09pmp
         wf8gAm15RpV5f/hJ7WZxrgln2o5tP6dYbxrBqtDN9r1PZ9Nowxf1waikLJChYYtEXr77
         ge37kWrzofm+B+F2sTayvtS8n5LTgmNGVnbcjs7ArFN5mFmOU1NG0pHMCV0qFDbKANkM
         IBuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750453287; x=1751058087;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bPfdrJsc6SyDgZhcqK06/DS6CQf5yfjgO3ypGfImvDI=;
        b=MUYdl0l5XQnWTvWctZbXdBD2n+1fDu+fzhMjXAlnJas2HBN5ikOlIvRHflgisF1GqL
         5Aapp+1wOagBADlq3E5TuwclUM+ZBm+sZyuP052iy1l+vGhZqFYFneo54gcnDpDOHbVs
         fotkOYVideOTjnqQd4j/renll2OoGZbu4qhAih3jqrztJ9aHNunxXK9id+XYZxkt8vH1
         AwNwENnZd5Ct3gPGOXUdyvv7X0/4maaCUTxLDufrs3hZ22ouct0UoU5pUOEalc69CLSE
         jHG7rBOHc+SaXg2zsO6BdlW6602YvGu5wUVRTxa+4IVp8W/pfgpNur1n9NmkzNy2vtBn
         WZQA==
X-Forwarded-Encrypted: i=1; AJvYcCV5kysBF4OjWxzWgwAz6t/mYsbCagqSnUNWdhrxpjto9QOeZ+OPAJdmzhO18LyprP2ygmuyUFVKxw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw3FVgZN19APxBKC7o+fGg43Dr2B8Q7HOwAP8O9czA6SQgF5X4p
	1mg6z84ZA5gmKlNtOQ3AaV/+rTiGNALJUbG2FNHkyOm4qs9eOAcKPGFbbXF9eBSMFSM=
X-Gm-Gg: ASbGnctIT3W9ianeKGamYsIqU9Far2DMisZYrtHvESqkk3owanZuhi4QIAZhuUjwRTC
	oOrqxXO3uf6sIgFPbv7QpPvBCJj7f3bXDSfrwCXwAU/Hk7T6x8D6YVpkNw5bUgUxkgC09dBvgSz
	npBooqdNxP1qNADfKqgfaVWfmLb6fqJvYdBPfYMKxPOA70rJ9r9Fv6rmyOGBpz9aoshUDWMQ31b
	gw7d/QiLu6VxGrhcuRA5q8R1VAm2d27bv5lUYS+TSuS9Y/s3lpmFoUJG/3PKAnqzAlp0IqWfhXh
	rkI+MH5pCRugMA2P0x3q1/++a0lwNCH60QvvCBfUZvLrnbzRgk5DpjYYz4Ip2r8W/kom+g==
X-Google-Smtp-Source: AGHT+IHKvI+mlOijqo3udRWnDlycAVvVSoeM8zvft6XIXbrw2Mbg1ujBAm0ngTbxYas49+aqilccLQ==
X-Received: by 2002:a05:6871:7393:b0:2d9:3868:b324 with SMTP id 586e51a60fabf-2eeee4e0080mr2955071fac.23.1750453286668;
        Fri, 20 Jun 2025 14:01:26 -0700 (PDT)
Received: from localhost ([2603:8080:b800:f700:35a7:a70f:9610:a99b])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-2eead967b86sm543589fac.50.2025.06.20.14.01.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Jun 2025 14:01:25 -0700 (PDT)
Date: Sat, 21 Jun 2025 00:01:23 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Cristian Marussi <cristian.marussi@arm.com>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	arm-scmi@vger.kernel.org, sudeep.holla@arm.com,
	james.quinlan@broadcom.com, f.fainelli@gmail.com,
	vincent.guittot@linaro.org, etienne.carriere@st.com,
	peng.fan@oss.nxp.com, michal.simek@amd.com, quic_sibis@quicinc.com,
	d-gole@ti.com, souvik.chakravarty@arm.com
Subject: Re: [RFC PATCH 3/7] firmware: arm_scmi: Add Telemetry protocol
 support
Message-ID: <b33a0c18-2850-453f-8ee6-5574330b3670@suswa.mountain>
References: <20250620192813.2463367-1-cristian.marussi@arm.com>
 <20250620192813.2463367-4-cristian.marussi@arm.com>
Precedence: bulk
X-Mailing-List: arm-scmi@vger.kernel.org
List-Id: <arm-scmi.vger.kernel.org>
List-Subscribe: <mailto:arm-scmi+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:arm-scmi+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250620192813.2463367-4-cristian.marussi@arm.com>

On Fri, Jun 20, 2025 at 08:28:09PM +0100, Cristian Marussi wrote:
> +	/* Build compsing DES string */
> +	for (int i = 0; i < ti->info.num_groups; i++) {
> +		struct scmi_telemetry_group *grp = &ti->info.des_groups[i];
> +		char *buf = grp->des_str;
> +		size_t bufsize = grp->des_str_sz;
> +
> +		for (int j = 0; j < grp->num_de; j++) {
> +			char term = j != (grp->num_de - 1) ? ' ' : '\0';
> +			int len;
> +
> +			len = snprintf(buf, bufsize, "0x%04X%c",
> +				       ti->info.des[grp->des[j]]->id, term);

Please use scnprintf() btw.  Otherwise if there is an overflow the
next iteration will complain that bufsize is negative.

> +
> +			buf += len;
> +			bufsize -= len;
> +		}
> +	}
> +
> +	return 0;
> +}

regards,
dan carpenter


Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 010341B4F24
	for <arm-scmi@vger.kernel.org>; Wed, 23 Oct 2024 13:20:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729689660; cv=none; b=SzbSN8ywB9/3fz3z2TBKAx6hFhl1NLBQNsVpyKstUerylccyC5Vj83ywA7H6muFdxPC3Zo+ZdgIgnpVAjwdMGTH4jzvE5IrFXmB9e/EjtkkrWbMEpM3eVfA7nH0WYQtraEPeHro/PCsh2Ei30C6j+ZEcD0ZXvoClVxSh9OJUZaw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729689660; c=relaxed/simple;
	bh=8Gv5zYotgfvO+78Ky3rG0NouXkSI+CJACE4ys8HBOWE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sXZoCyqE/WlEzRV1Z/T7avhuSXIWNp4ex61FT/74SgHPsOGOScISb3r3T3jwdWnbt+RP35/M8lDu31Sl0f99WW6aOlV6igbiwq3hi6iJbz8WNCUKb/UM9nreQqeKH36heGsBvPahWFzXWToD1Fp61hHZyqtFvDmlBZjDsMxKuyw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=uXYTTsNZ; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="uXYTTsNZ"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4315eeb2601so82106235e9.2
        for <arm-scmi@vger.kernel.org>; Wed, 23 Oct 2024 06:20:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1729689657; x=1730294457; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=UkWfUv09D9iUXWfVB7KgOzAtutIbQ7s0/zKVBfDXje8=;
        b=uXYTTsNZmqF75TsPexwobaY+GAidt6O/yzHd0FTgT1mso8cGyz4AZ3WFkSuIJYUjxQ
         nVL7xd2LOAscxm0AaOQKlLdHWWuTnpqOQX+bYR9ZfSZ7ITGh5snIz2OObk34FVBjtKdh
         Cq+rS9GA/D5mSO7/5Pbs+RALa1hXqmbsYCb9GrAjBDm76sD7MMOcBVSLDlXFawU76Ssm
         sYBz9p/1jiZNMmv3YHZpi4VY3QsT/8YeYLhT8DYPuKwEzsMElNwb0ugX1qVI7TTSObf2
         +usoaaexA8wBjsCJIy6j2R0o27UZ25eoLHGeWjqneiQTFW+IK+IgxZp/DRdDNQclyAdz
         Qm1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729689657; x=1730294457;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UkWfUv09D9iUXWfVB7KgOzAtutIbQ7s0/zKVBfDXje8=;
        b=SMLAK91cpidaIb3Bb/Ujxl+f9cZQvx7z84gs1pKSM8GzQ+cn6FwMIvSaz0t0dRVozE
         Ue5BffJizZ7CJZp2jd2yVl/ehuM92Dx5wle22Z8S/Cf2ml6yShzhp/CJ0pdg7RQXgHrM
         P6w5OPdOBkcbAqH8R3WeV4BRo/wBrBYvqrk9JHqWe3k7N6q71Y/LLh7PAAQdCUmYn5Vu
         fV5weiYS2bUBkUa4nZVTyZLaaBxIrAHV2a+m+1Z9lN4o0OXhjmFpWijeDbqTsXE9gSKn
         TlLaafrJKahM1Pz/GctXcURJmFiOPYSFz5z98klMBzwvgcxDJIoQW1aDgejluB+7/ihp
         ws6A==
X-Forwarded-Encrypted: i=1; AJvYcCWUIGRR/1xzKHs129lL1BisSwwUUV6p10MUVtW3KiVb+davhQWnEfv7NhELNs6dBF7Wpt88y7oBJw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy9mkz4cdqRaL380QbmuK5aw/MNdHvlGFR4qEoMCz1kTkQlylG6
	ZpPafQSKmUXArlzcU0EEzniBrDRJAXnEtpaeLhJxS5X52kyZfebAqU0dKNIXCwg=
X-Google-Smtp-Source: AGHT+IFkJC5LCeC/OCfK9E7SoXfc1mApx4rYBSl4BC0ZjGuuqRljVVpZPb0eEsRBT2XGEsXc1k04qg==
X-Received: by 2002:a05:600c:1ca4:b0:431:5f8c:ccb9 with SMTP id 5b1f17b1804b1-431842115ddmr29502525e9.17.1729689657368;
        Wed, 23 Oct 2024 06:20:57 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43186bfb2f5sm16424265e9.21.2024.10.23.06.20.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Oct 2024 06:20:56 -0700 (PDT)
Date: Wed, 23 Oct 2024 16:20:53 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Cristian Marussi <cristian.marussi@arm.com>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	arm-scmi@vger.kernel.org, sudeep.holla@arm.com,
	james.quinlan@broadcom.com, f.fainelli@gmail.com,
	vincent.guittot@linaro.org, etienne.carriere@st.com,
	peng.fan@oss.nxp.com, michal.simek@amd.com, quic_sibis@quicinc.com,
	quic_nkela@quicinc.com
Subject: Re: [PATCH 5/5] firmware: arm_scmi: Relocate atomic_threshold to
 scmi_desc
Message-ID: <842a9844-ac89-4972-9024-72ed0e08c2d3@stanley.mountain>
References: <20241018080602.3952869-1-cristian.marussi@arm.com>
 <20241018080602.3952869-6-cristian.marussi@arm.com>
Precedence: bulk
X-Mailing-List: arm-scmi@vger.kernel.org
List-Id: <arm-scmi.vger.kernel.org>
List-Subscribe: <mailto:arm-scmi+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:arm-scmi+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241018080602.3952869-6-cristian.marussi@arm.com>

On Fri, Oct 18, 2024 at 09:06:02AM +0100, Cristian Marussi wrote:
> @@ -2959,7 +2952,7 @@ static struct scmi_debug_info *scmi_debugfs_common_setup(struct scmi_info *info)
>  			   (char **)&dbg->name);
>  
>  	debugfs_create_u32("atomic_threshold_us", 0400, top_dentry,
> -			   &info->atomic_threshold);
> +			   (u32 *)&info->desc->atomic_threshold);

This cast is unnecessary.

>  
>  	debugfs_create_str("type", 0400, trans, (char **)&dbg->type);
>  
> @@ -3071,6 +3064,13 @@ static const struct scmi_desc *scmi_transport_setup(struct device *dev)
>  		 trans->desc->max_rx_timeout_ms, trans->desc->max_msg_size,
>  		 trans->desc->max_msg);
>  
> +	/* System wide atomic threshold for atomic ops .. if any */
> +	if (!of_property_read_u32(dev->of_node, "atomic-threshold-us",
> +				  &trans->desc->atomic_threshold))
> +		dev_info(dev,
> +			 "SCMI System wide atomic threshold set to %d us\n",
                                                                   ^^
%u for unsigned int.

> +			 trans->desc->atomic_threshold);
> +
>  	return trans->desc;
>  }

regards,
dan carpenter

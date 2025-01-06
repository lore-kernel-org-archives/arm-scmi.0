Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA1D01369B4
	for <arm-scmi@vger.kernel.org>; Mon,  6 Jan 2025 15:09:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736176165; cv=none; b=lpYfdQ1AGErlCD4cOpOF/XUmsJnDxX3XygLbIDN7Km+7gGateqx6RMU4Klp2EPaW/p1i6FfoLMhkaO6XWFiZMonpQYRrYrCv48CJvlyrjlk3woesP3TcC4ihg0VevWWdiZ4kaHSxLag9v2f1WB4KmVd7ghEr9C00+2li5vNPBEw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736176165; c=relaxed/simple;
	bh=Z2MmPOz9+s/qbV7eaz9mfHyDBq0mruXfbCaFgpqbQ/s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LuwZjRBoQNaKm9yWxN20kzYtLQrmIMEVnvMZiRJrvxXg5hcO+OGpKh+PQZF2EadOI6Ki/KTDrEi19wsNzokbR5vmb5MyGrw38hItv2hqnc/gtN87fLCc17upSZzriIsdSZsCAuh1xPK4vaWyAVuD4o8H3Wql2YrCuQnXYq0lEh0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=gpwScsDr; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="gpwScsDr"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-436341f575fso149984735e9.1
        for <arm-scmi@vger.kernel.org>; Mon, 06 Jan 2025 07:09:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1736176161; x=1736780961; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=bL3T+Fs+bH74d3/naEWqUYxBOE9ylMC4ULJhqo87sek=;
        b=gpwScsDrm7/jwiHXvOfkkoDUKA3Rh/FFI+swXcC55Ok9B92ew926l365TuSKMydzj+
         rGFmtqz57iTXsiCDcc42Kih/z+UAa5ULKIboLxZPpnovD/S0rEX9FvUQ+owGClrBB0qs
         6MuaMvADXKh5x5QLubF8lDhv9AB9H8Z+8lwFMoqqCxQbfJtHOhcc3GzlLCUtoubnLOb7
         C20a5e3ZyRjZPiqiChmzGRCKD4AS04IHFXhTqd63rYmUkkVKy4HBmG0Y6p+/E6SZ2PqL
         9Fk4WqRs/LD4dnpoXPYBvCf1tE7ZDCU/+7QVCsW1NWmNbEHUVfGbxMtBMnMVnXwTy4ec
         1clQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736176161; x=1736780961;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bL3T+Fs+bH74d3/naEWqUYxBOE9ylMC4ULJhqo87sek=;
        b=FKW3+Sz9h3Wc9ClZ/kInV2ctn7JBC+VVLSscjjuDQSW6WtHXUvWmf+FG6LqGxO0Rdp
         /RTUFMNRfqv/4tOuu2CkTAc9pkdkSaNkxU4vSvWJaRI5E7PG+on4dFaRw4n5OzIAGfOW
         Jeo7zk8x8TvyIbi6BmgbbBqh6evzt1Smwxrp1FfI+pTbe2doHiVo+/TlEoSHFHMT7d/l
         ExW0Y7PLVbRT60FhMGDeYeNvCO9iv3v0B8cQrdH8Bb/n6IkpTgCffrg0L4lWNY78yqNL
         ArqAoIFkCbGkxBH4H4CT2mduBNB59boI+at7/8xZc4pOU1QlrprZcKbuvfZbwzs0saVY
         vSUA==
X-Forwarded-Encrypted: i=1; AJvYcCVOl0dzbivyXUX0c2bWI1UXPI7txIUG5O20YgqtM0cSr8UKqbRdG82I3UVYCSn/pShWz5EDqr/0FA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxlypCSirrUOCxG9OLqtYsf+lkhnn8xJSu1Qc5s6FM0jjWu0AXG
	B5QcTSJIBHThynkgmluVzkltkrxuyQDjhYobzA0rgUVoN2er3OsG8sQNyk4WuWM=
X-Gm-Gg: ASbGncuOhkaty3Hs/gF+S4HjnIzd9GMUsOjlFICzgDSXY8q83uUrdPMW0Z6rgKU3wMy
	QSZsGg9VM2Rq9VtrvsAQG+74aYzJD24hABIckoEOd2aSmoraH0VmFlTn9WE/b5rnFIVlVKjcmKf
	7qsWm7tefCHVV19GKu37npijiYcKOljBQvewQGKLWJfvx9G3+fuLhm1ovElEzVrQG1aezgKPggw
	8dm5WXKGlck8d0gfI3nP4qXfz5T3cI6XiAw/uMsRT6NpAgKiSY4UUEOoW5NXQ==
X-Google-Smtp-Source: AGHT+IFYelyfnSD2yeDmiaHwuqRIu9gXypTjBqor/UZSJjgFrJJkIb6sEFAfDAMbDxcUvBHRw9qztA==
X-Received: by 2002:a5d:6d84:0:b0:382:46ea:113f with SMTP id ffacd0b85a97d-38a221e2799mr60383379f8f.10.1736176161213;
        Mon, 06 Jan 2025 07:09:21 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38a1c8475cesm47793698f8f.57.2025.01.06.07.09.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jan 2025 07:09:20 -0800 (PST)
Date: Mon, 6 Jan 2025 18:09:17 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Cc: sudeep.holla@arm.com, cristian.marussi@arm.com,
	arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, Peng Fan <peng.fan@nxp.com>
Subject: Re: [RFC] firmware: arm_scmi: Optimize the iteration of
 scmi_requested_devices
Message-ID: <094fc69e-a7b3-41bc-b5a7-cdc8a8deeef2@stanley.mountain>
References: <20250106065724.3674510-1-peng.fan@oss.nxp.com>
Precedence: bulk
X-Mailing-List: arm-scmi@vger.kernel.org
List-Id: <arm-scmi.vger.kernel.org>
List-Subscribe: <mailto:arm-scmi+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:arm-scmi+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250106065724.3674510-1-peng.fan@oss.nxp.com>

On Mon, Jan 06, 2025 at 02:57:24PM +0800, Peng Fan (OSS) wrote:
> From: Peng Fan <peng.fan@nxp.com>
> 
> scmi_requested_devices is organized in IDR based link lists, so only
> need to search the link lists when there is a match protocol_id.
> 
> Back to search the next id with 'continue' to save cpu cycles, if
> protocol_id does not match.
> 
> Signed-off-by: Peng Fan <peng.fan@nxp.com>
> ---
> 
> RFC:
>  Tested on i.MX95.
> 
>  drivers/firmware/arm_scmi/bus.c | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/drivers/firmware/arm_scmi/bus.c b/drivers/firmware/arm_scmi/bus.c
> index 157172a5f2b5..42deab5903fb 100644
> --- a/drivers/firmware/arm_scmi/bus.c
> +++ b/drivers/firmware/arm_scmi/bus.c
> @@ -79,6 +79,8 @@ static int scmi_protocol_device_request(const struct scmi_device_id *id_table)
>  			if (rdev->id_table->protocol_id ==
>  			    id_table->protocol_id)
>  				phead = head;
> +			else
> +				continue;
>  		}
>  		list_for_each_entry(rdev, head, node) {
>  			if (!strcmp(rdev->id_table->name, id_table->name)) {
> @@ -89,6 +91,7 @@ static int scmi_protocol_device_request(const struct scmi_device_id *id_table)
>  				goto out;
>  			}
>  		}
> +		break;
>  	}

I suspect your patch is correct but we could go further.  Removing the
test for if (!phead) really helps readability.

regards,
dan carpenter

diff --git a/drivers/firmware/arm_scmi/bus.c b/drivers/firmware/arm_scmi/bus.c
index a3386bf36de5..2c853c84b58f 100644
--- a/drivers/firmware/arm_scmi/bus.c
+++ b/drivers/firmware/arm_scmi/bus.c
@@ -72,14 +72,11 @@ static int scmi_protocol_device_request(const struct scmi_device_id *id_table)
 	 */
 	mutex_lock(&scmi_requested_devices_mtx);
 	idr_for_each_entry(&scmi_requested_devices, head, id) {
-		if (!phead) {
-			/* A list found registered in the IDR is never empty */
-			rdev = list_first_entry(head, struct scmi_requested_dev,
-						node);
-			if (rdev->id_table->protocol_id ==
-			    id_table->protocol_id)
-				phead = head;
-		}
+		/* A list found registered in the IDR is never empty */
+		rdev = list_first_entry(head, struct scmi_requested_dev, node);
+		if (rdev->id_table->protocol_id != id_table->protocol_id)
+			continue;
+
 		list_for_each_entry(rdev, head, node) {
 			if (!strcmp(rdev->id_table->name, id_table->name)) {
 				pr_err("Ignoring duplicate request [%d] %s\n",
@@ -89,6 +86,8 @@ static int scmi_protocol_device_request(const struct scmi_device_id *id_table)
 				goto out;
 			}
 		}
+		phead = head;
+		break;
 	}
 
 	/*

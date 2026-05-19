Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9E8373E16B6
	for <arm-scmi@vger.kernel.org>; Tue, 19 May 2026 08:38:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779179893; cv=none; b=QvyodRqNdVjmjEadFZZo8A4eYLZr87mh5K89UTZUwjKAyBZRbcwMVksqZxQWp+bqIhQb6cIlYxnXNE8VfxNI5i2LutNAFCl5fii1bJX/dVd1o0vrAT9w5x8ttuNMfK3voKKASqOPienS1J47Q3+PvK6/ZrAXkgVEh/PZKqtywXY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779179893; c=relaxed/simple;
	bh=m/IZzX8K/zDKGw1QKwD/kJgkxjUXp+cyXlYYXszD6zE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VkzwV8OuAY4MliKj4Rawwe5U5E+GQrQzKfhPnCcdlzclYJnt+5yt5lYagojbWnezBPVQj4KmJ/5ovaHwAdpCVLD5aryUYxB7BppRp6ABbM5zMw2caamyGh44YFSJnl32YR8vRI/MJ62+LZWrAf8uknjUFSk8FGwFxVK8bsn68SA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=NCpXbeDi; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="NCpXbeDi"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id CA73334FC;
	Tue, 19 May 2026 01:38:06 -0700 (PDT)
Received: from pluto (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id DBE763F85F;
	Tue, 19 May 2026 01:38:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1779179891; bh=m/IZzX8K/zDKGw1QKwD/kJgkxjUXp+cyXlYYXszD6zE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=NCpXbeDiE5zv83JOlhsVwe3fjcNwBoQZ2s7MxJ2d906/vAA9adgN5JbKYtvtwS7xx
	 LCHX08O5Sgn8ReRpjp1SphC3MmmDq79RxsjNYyXhL5SEbylGomhfhF//P4cXpXwjmn
	 5OJQs+9i8gH1fTSxe8Au1sSjg3CGH7kLTyVXq+Dg=
Date: Tue, 19 May 2026 09:38:03 +0100
From: Cristian Marussi <cristian.marussi@arm.com>
To: Sudeep Holla <sudeep.holla@kernel.org>
Cc: Cristian Marussi <cristian.marussi@arm.com>, arm-scmi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 1/4] firmware: arm_scmi: Read sensor config as 32-bit
 value
Message-ID: <agwha4a1nzG8btl3@pluto>
References: <20260517-scmi_fixes-v1-0-d86daec4defd@kernel.org>
 <20260517-scmi_fixes-v1-1-d86daec4defd@kernel.org>
Precedence: bulk
X-Mailing-List: arm-scmi@vger.kernel.org
List-Id: <arm-scmi.vger.kernel.org>
List-Subscribe: <mailto:arm-scmi+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:arm-scmi+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260517-scmi_fixes-v1-1-d86daec4defd@kernel.org>

On Sun, May 17, 2026 at 08:02:40PM +0100, Sudeep Holla wrote:
> The SENSOR_CONFIG_GET response contains a 32-bit sensor_config field,
> and the xfer is initialized with a 4-byte RX buffer. Reading it with
> get_unaligned_le64() can consume bytes past the returned payload.
> 
> Use get_unaligned_le32() to match the protocol layout and the allocated
> response size.
> 
> Fixes: 7b83c5f41088 ("firmware: arm_scmi: Add SCMI v3.0 sensor configuration support")
> Signed-off-by: Sudeep Holla <sudeep.holla@kernel.org>
> ---
>  drivers/firmware/arm_scmi/sensors.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/firmware/arm_scmi/sensors.c b/drivers/firmware/arm_scmi/sensors.c
> index 882d55f987d2..836c294a9f42 100644
> --- a/drivers/firmware/arm_scmi/sensors.c
> +++ b/drivers/firmware/arm_scmi/sensors.c
> @@ -793,7 +793,7 @@ static int scmi_sensor_config_get(const struct scmi_protocol_handle *ph,
>  	if (!ret) {
>  		struct scmi_sensor_info *s = si->sensors + sensor_id;
>  
> -		*sensor_config = get_unaligned_le64(t->rx.buf);
> +		*sensor_config = get_unaligned_le32(t->rx.buf);
>  		s->sensor_config = *sensor_config;
>  	}

Reviewed-by: Cristian Marussi <cristian.marussi@arm.com>

Thanks,
Cristian

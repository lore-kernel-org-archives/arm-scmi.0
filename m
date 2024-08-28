Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A09F742067
	for <arm-scmi@vger.kernel.org>; Wed, 28 Aug 2024 04:44:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.23.248
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724820292; cv=none; b=FObKwnMhUWPHTgTkM0UywqNssr6b2OpCgqkwBZn9UCN8HwXiBByEq+WCZuX51D8gpqxuU34rxvC7u30W+cV8aeFtDtnEaqr3EBH2/Uyor4pumbZrLDVjvKQQRzq9Ckour0Zfsmcm/finm3hMmHPs4T9ZtWMtinBPFWvZS9tuHAg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724820292; c=relaxed/simple;
	bh=XXsuTwHj0vpWAkO1DnUp2SAY3YrNQTJaQwlftrtgmRQ=;
	h=Date:From:To:CC:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uRL9BMZWOlUG2PVITUEIwbJLoM1WGZItWASXhEd2LNZWV8EkB4uyN4/OobAEREdiXUUbTX1wdUJvBeXfezBu+s5v4jGo49zZXIinvOxkNViH/O6FqsqIQVuLJBd3bD3KmFYN/YYues+Dzpq8I9FnhXmJpHFuHLsehgC4Vpd8U+s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=K5GAnLNg; arc=none smtp.client-ip=198.47.23.248
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="K5GAnLNg"
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 47S4ijs4038817;
	Tue, 27 Aug 2024 23:44:45 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1724820285;
	bh=YUO+G9+a/de4GOZ2wxKtbL35wA4lrYjjML9qJ+ULB7U=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=K5GAnLNgHwaog3WB0Qdmgew/IPHpDmlGN5GX5h8psOXgU5ds84/CuSfH0lRHDQktR
	 dfpXyhL3zePwQBacCdi3y4NfUPZf7K9AFEtjz3q3Anxpxx2xin9gUl9DR9RZGtgg3v
	 okPCKiJHe/72hQXFL60BlchFtjLD/4mhw2g284+s=
Received: from DLEE109.ent.ti.com (dlee109.ent.ti.com [157.170.170.41])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 47S4ijnj095124
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 27 Aug 2024 23:44:45 -0500
Received: from DLEE102.ent.ti.com (157.170.170.32) by DLEE109.ent.ti.com
 (157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Tue, 27
 Aug 2024 23:44:44 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DLEE102.ent.ti.com
 (157.170.170.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Tue, 27 Aug 2024 23:44:44 -0500
Received: from localhost (lcpd911.dhcp.ti.com [172.24.227.68])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 47S4ihAQ065364;
	Tue, 27 Aug 2024 23:44:44 -0500
Date: Wed, 28 Aug 2024 10:14:43 +0530
From: Dhruva Gole <d-gole@ti.com>
To: Sudeep Holla <sudeep.holla@arm.com>
CC: <arm-scmi@vger.kernel.org>, Cristian Marussi <cristian.marussi@arm.com>
Subject: Re: [PATCH 3/3] firmware: arm_scmi: Replace comma with the semicolon
Message-ID: <20240828044443.6lyd6way3jcmyjn7@lcpd911>
References: <20240827143838.1465913-1-sudeep.holla@arm.com>
 <20240827143838.1465913-4-sudeep.holla@arm.com>
Precedence: bulk
X-Mailing-List: arm-scmi@vger.kernel.org
List-Id: <arm-scmi.vger.kernel.org>
List-Subscribe: <mailto:arm-scmi+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:arm-scmi+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20240827143838.1465913-4-sudeep.holla@arm.com>
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180

Hi Sudeep,

On Aug 27, 2024 at 15:38:38 +0100, Sudeep Holla wrote:
> Replace the typo comma with the semicolon. No functional change.
> 
> Signed-off-by: Sudeep Holla <sudeep.holla@arm.com>
> ---
>  drivers/firmware/arm_scmi/base.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/firmware/arm_scmi/base.c b/drivers/firmware/arm_scmi/base.c
> index d52873523cd2..86b376c50a13 100644
> --- a/drivers/firmware/arm_scmi/base.c
> +++ b/drivers/firmware/arm_scmi/base.c
> @@ -384,7 +384,7 @@ static int scmi_base_protocol_init(const struct scmi_protocol_handle *ph)
>  	if (ret)
>  		return ret;
>  
> -	rev->major_ver = PROTOCOL_REV_MAJOR(version),
> +	rev->major_ver = PROTOCOL_REV_MAJOR(version);

Wouldn't this have caused a compile error?? /me-is-confused/

Maybe we should use Fixes: b6f20ff8bd94a .... anyway?

-- 
Best regards,
Dhruva Gole <d-gole@ti.com>

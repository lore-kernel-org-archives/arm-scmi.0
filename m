Received: from fllvem-ot04.ext.ti.com (fllvem-ot04.ext.ti.com [198.47.19.246])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2C8C4502F
	for <arm-scmi@vger.kernel.org>; Mon,  3 Feb 2025 06:36:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.19.246
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738564576; cv=none; b=t1nHmSJz8XRqxDB/R+z7aWKA9H02K6Ly/lT/G48xWP33vSMsJUF9QMHZejxY95PZWaU+rWDy8dZnBwx0/Z/DNMRmkCC15T4wgTCduBj73es1CZB4Tl3pXEROMkI/u+iI1Z03UuZghtf33Jt3784YPvFwlSNPdglq+HO26Er1bq8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738564576; c=relaxed/simple;
	bh=8jPCvxMiVCZbDp1aRulTbobbRj4IXWMZIzg3yknyqSo=;
	h=Date:From:To:CC:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BGk0luqubvPQC2YGaZN6gPAgYXKY9N3IDjIQkWRjIHeIT4lIoUSrWDA1XRKzNOGfj9QDCtQg2y00PvPLVc/pTVwLR3sYhfOCBPz7ASWHYtSA8dPMsQoctj72XWWgBqWLsh3edZUxt/Xf81O5AneaxEzGcL6m/eWWsj1h8SrxOxM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=JJGtx4qL; arc=none smtp.client-ip=198.47.19.246
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="JJGtx4qL"
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllvem-ot04.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 5136PBJ52086375
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 3 Feb 2025 00:25:11 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1738563911;
	bh=VSjDSLuuBopyN87tQrBtshxN58JXONqfLOG2XA7UUGg=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=JJGtx4qLPqo2tt7GEDKNUlN8+CY1y56gNtoib0a7sMJ5i4O/xg8n44y3mxcDmF7BD
	 sqT2xU7JZskSAGXfdv0GSQ5qKggSAyij/YzECVzU25RJ7zRTQQertSRTyWQzlTeALR
	 a9oFVKoPG1FuQrn5FYFeOn6+f0MaLUuE8ahAYkNs=
Received: from DLEE107.ent.ti.com (dlee107.ent.ti.com [157.170.170.37])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 5136PBF7106159
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 3 Feb 2025 00:25:11 -0600
Received: from DLEE114.ent.ti.com (157.170.170.25) by DLEE107.ent.ti.com
 (157.170.170.37) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Mon, 3
 Feb 2025 00:25:10 -0600
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DLEE114.ent.ti.com
 (157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Mon, 3 Feb 2025 00:25:11 -0600
Received: from localhost (lcpd911.dhcp.ti.com [172.24.227.226])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 5136PAtv015127;
	Mon, 3 Feb 2025 00:25:10 -0600
Date: Mon, 3 Feb 2025 11:55:09 +0530
From: Dhruva Gole <d-gole@ti.com>
To: Sudeep Holla <sudeep.holla@arm.com>
CC: <arm-scmi@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
        Cristian Marussi <cristian.marussi@arm.com>,
        Xinqi Zhang
	<quic_xinqzhan@quicinc.com>, Peng Fan <peng.fan@nxp.com>,
        Guomin Chen
	<guomin_chen@sina.com>
Subject: Re: [PATCH 2/3] firmware: arm_scmi: Add name and protocol id
 attributes
Message-ID: <20250203062509.rm64fr2dpil6x7y5@lcpd911>
References: <20250131141822.514342-1-sudeep.holla@arm.com>
 <20250131141822.514342-2-sudeep.holla@arm.com>
Precedence: bulk
X-Mailing-List: arm-scmi@vger.kernel.org
List-Id: <arm-scmi.vger.kernel.org>
List-Subscribe: <mailto:arm-scmi+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:arm-scmi+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20250131141822.514342-2-sudeep.holla@arm.com>
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea

On Jan 31, 2025 at 14:18:21 +0000, Sudeep Holla wrote:
> Add the name and the protocol id attributes to the SCMI devices on the
> bus so that they are exposed to the user-space via the sysfs.
> 
> Signed-off-by: Sudeep Holla <sudeep.holla@arm.com>
> ---
>  drivers/firmware/arm_scmi/bus.c | 38 +++++++++++++++++++++++++++++++++
>  1 file changed, 38 insertions(+)
> 

Reviewed-by: Dhruva Gole <d-gole@ti.com>

-- 
Best regards,
Dhruva Gole
Texas Instruments Incorporated

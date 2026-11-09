Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=44.202.169.37
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794240379;
	b=NU0+YRM8SUFRgJrhFkHkwsi7jmCKI1ZDkdRAL0sfO5NyaYJjpDtfU5F988nfSrXFWzFO
	 djJdtHLQ1KjKa87/IrMNm95aPOenLJxMo0Kht2qqWVpC9DwsS8gByMz7tAnslLxfGDGmN
	 7/tl0NeFgmtMyz7RI8Xf3qgJgG6RiG2cDLyh4tXVOxiwFs3ERmpMGpv1fykAxgEK6AOD4
	 IQzsECBwIcqbweixKTEQgWGdphwU7B+6K9wyOBzktkHG4OqbbuI5G9w5YXtDFp94fNYMy
	 0VERpIgoLUvsFXtEkl1NWG8JN016XibO3KKo/z+zTOiBdnBFwePdpqh8UAvyocVM1AA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794240379;
	h=DMARC-Filter:Received:Received:X-Authority-Analysis:DKIM-Signature:
	 Received:Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To:X-AntiAbuse:X-AntiAbuse:
	 X-AntiAbuse:X-AntiAbuse:X-AntiAbuse:X-BWhitelist:X-Source-IP:
	 X-Source-L:X-Exim-ID:X-Source:X-Source-Args:X-Source-Dir:
	 X-Source-Sender:X-Source-Auth:X-Email-Count:X-Org:X-Source-Cap:
	 X-Local-Domain:X-CMAE-Envelope;
	bh=1qt/rgohGANRxm3IrjdgH5lztUYKTM3+/ifRCpRxUyE=;
	b=dS2+rYWrZhzgd3ZXeBRRv7ubLjjJ8HwrjpwgI1O5q/3N6doASxH4wyC1LKJF163fjACe
	 jZIKmXTPvRhxmGc/dvNrSqcJqU6WR84mmWi+SuYkyEMXKUNZB5ODLWzOPJEoeaYYvI+gY
	 0glrILhJl7ThQLyl8WaC50bIyVZG6pWLa2lbS4nfsFY7sGSk67/rVZFxxojYj9Z9zJSBq
	 9L1XN5Ni9p3bci+z0ZpizlTdnpq7ntycna3bew44INEw6HAFdG5aasORd9W99or37v6Fp
	 SUCEBD5FW3akJT//xMXpYANn9zJcRmWmd2hokKRaELL/s6xA1qFitOf/mRTntYATHKw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=roeck-us.net;
	spf=fail smtp.mailfrom=roeck-us.net;
	dkim=pass header.d=roeck-us.net header.i=@roeck-us.net header.a=rsa-sha256 header.s=default header.b=ExbcyR3L;
	arc=none smtp.remote-ip=44.202.169.37
Received: from omta038.useast.a.cloudfilter.net (omta038.useast.a.cloudfilter.net [44.202.169.37])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE425606A330
	for <arm-scmi@vger.kernel.org>; Mon,  9 Nov 2026 16:06:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DE425606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=roeck-us.net header.i=@roeck-us.net header.a=rsa-sha256 header.s=default header.b=ExbcyR3L
Received: from eig-obgw-6003b.ext.cloudfilter.net ([10.0.30.175])
	by cmsmtp with ESMTPS
	id PzcAxSV2jJFmFQRspx4EQq; Mon, 09 Nov 2026 16:06:11 +0000
Received: from 162-215-252-36.unifiedlayer.com ([208.91.199.152])
	by cmsmtp with ESMTPS
	id QRsoxEfcdGh2BQRspxskuF; Mon, 09 Nov 2026 16:06:11 +0000
X-Authority-Analysis: v=2.4 cv=Aszu3P9P c=1 sm=1 tr=0 ts=6af1ef73
 a=QNED+QcLUkoL9qulTODnwA==:117 a=2cfIYNtKkjgZNaOwnGXpGw==:17
 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=M0FbrtG7MMAA:10 a=c92rfblmAAAA:8
 a=VwQbUJbxAAAA:8 a=pYUB3rPNxVkG2UVf4jEA:9 a=CjuIK1q_8ugA:10
 a=GvGzcOZaWPEFPQC_NcjD:22 a=KPbNTLLc3YvdawN95zVk:22
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=roeck-us.net; s=default; h=In-Reply-To:Content-Type:MIME-Version:References
	:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding
	:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Unsubscribe-Post:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=1qt/rgohGANRxm3IrjdgH5lztUYKTM3+/ifRCpRxUyE=; b=ExbcyR3LgI8UtmDIXkwDwpOSpg
	4abeGKaE/ESLcrfix4hndnO19d5Cvvy2UmoM6SPNB1hTMbQFdkl9RSH5Pw3ZV2GQ5HyO9iYbeEPVY
	60RrUevEyrYkFy/Lx2L4vNoibJ0fGbE9m2as68ur0ZTaNYFsB1sWPI2OqeoRuvh4hy+iUryFjl5Je
	rYemJckg1Bonp/ACAG2lRQDiX3opCIlcOZSLz/HyDAHMBdnLsrmWVlKTu6hca0+nq+QolhEJ77f3z
	3V8vb3rV6WrO0+pjICXbT8Vo+A2hG4utbpPtSOY6xbjTGaKQ59ch/tPZMSx56oMGGRwpOLIT4SkoU
	hX4IRiiw==;
Received: from 108-223-40-66.lightspeed.sntcca.sbcglobal.net ([108.223.40.66]:36418 helo=server.roeck-us.net)
	by bh-25.webhostbox.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.100.1)
	(envelope-from <linux@roeck-us.net>)
	id 1xQRso-00000001aQ7-2InT;
	Mon, 09 Nov 2026 21:36:10 +0530
Date: Mon, 9 Nov 2026 08:06:09 -0800
From: Guenter Roeck <linux@roeck-us.net>
To: Sudeep Holla <sudeep.holla@kernel.org>
Cc: linux-hwmon@vger.kernel.org, arm-scmi@vger.kernel.org,
	Cristian Marussi <cristian.marussi@arm.com>,
	Sashiko <sashiko-bot@kernel.org>
Subject: Re: [PATCH 1/2] hwmon: (scmi) Check channel config allocation
Message-ID: <1a0ffaaf-6ffd-401a-bae4-f67e82ca151c@roeck-us.net>
References: <20261109151927.1672956-1-sudeep.holla@kernel.org>
X-Mailing-List: arm-scmi@vger.kernel.org
List-Id: <arm-scmi.vger.kernel.org>
List-Post: <mailto:arm-scmi@vger.kernel.org>
List-Help: <mailto:arm-scmi+help@vger.kernel.org>
List-Subscribe: <mailto:arm-scmi+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:arm-scmi+unsubscribe@vger.kernel.org>
List-Owner: <mailto:arm-scmi+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261109151927.1672956-1-sudeep.holla@kernel.org>
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - bh-25.webhostbox.net
X-AntiAbuse: Original Domain - vger.kernel.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - roeck-us.net
X-BWhitelist: no
X-Source-IP: 108.223.40.66
X-Source-L: No
X-Exim-ID: 1xQRso-00000001aQ7-2InT
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: 108-223-40-66.lightspeed.sntcca.sbcglobal.net (server.roeck-us.net) [108.223.40.66]:36418
X-Source-Auth: guenter@roeck-us.net
X-Email-Count: 9
X-Org: HG=direseller_whb_net_legacy;ORG=directi;
X-Source-Cap: cm9lY2s7YWN0aXZzdG07YmgtMjUud2ViaG9zdGJveC5uZXQ=
X-Local-Domain: yes
X-CMAE-Envelope: MS4xfBqU6q0Ryyly1fatiHs5ORgQrqWm+/vyV9srytrtp5iXpsImNcBnvDhM+ONEwT5VE8RcxGap+H3rXSaXdvkaKsJu7pbqPM6uKIsQgObh2pMlvfK6ZmJx
 JexkgLZwswQpsrsvSpzs9dmlERsjd316TxVlBkji2oZn4DmVz6lFwCbatTdm+f2eSKwwcnHKvXX6Cy+gYErp2hibL4AL5VgnhE0nRhgL6cf5z7IMj9e9XhNs

On Mon, Nov 09, 2026 at 03:19:26PM +0000, Sudeep Holla wrote:
> scmi_hwmon_add_chan_info() can fail to allocate a channel's config
> array. Ignoring that error leaves a channel with a NULL config pointer
> in the hwmon chip info, which hwmon dereferences while registering the
> device.
> 
> Check the helper's return value and abort probe on failure.
> 
> Reported-by: Sashiko <sashiko-bot@kernel.org>
> Closes: https://sashiko.dev/#/bug/linux-d10ced6b-a6f0-403b-9619-f5a6573f9e7f
> Fixes: b23688aefb8b ("hwmon: add support for sensors exported via ARM SCMI")
> Signed-off-by: Sudeep Holla <sudeep.holla@kernel.org>

Applied.

Thanks,
Guenter

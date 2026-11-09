Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=35.89.44.35
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794239803;
	b=PfHRWKqW0e7CKVNmkQqFrHKe68Re5fngV50vhzQeRV9S1YftB4AEq5v0isQZQPVegPSt
	 npBkJgq90xfCi1vMBRTyijAGm4K2fcV8/I0BRzjT5kIwMG3VAVWCrDCJQ4bC+x6g6gy/2
	 dPihckSjIBLuHeZqUfWHzQFNrTI4YDsfrIMi1JYUQ81Uu/7++UI1hWW8gxLAX1kzfYAXF
	 oq+tKi5/7s3Wb+7gPRmkyR5p92H4zfKyv9tgoZZJlhtqhOJ+Xi2TNTRQS4btGrENj1wGy
	 Dsorrm6YfLUP7dibsvULregOooDN275TBJHEbFgzyWNwtdtH8PGj98vZX2l6BxWYiFA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794239803;
	h=DMARC-Filter:Received:Received:X-Authority-Analysis:DKIM-Signature:
	 Received:Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To:X-AntiAbuse:X-AntiAbuse:
	 X-AntiAbuse:X-AntiAbuse:X-AntiAbuse:X-BWhitelist:X-Source-IP:
	 X-Source-L:X-Exim-ID:X-Source:X-Source-Args:X-Source-Dir:
	 X-Source-Sender:X-Source-Auth:X-Email-Count:X-Org:X-Source-Cap:
	 X-Local-Domain:X-CMAE-Envelope;
	bh=IiHfMjI5UW1C+sBrl6OK0Tos0QEXOpbHcV5EoY3XjNc=;
	b=API26KXNtujkKQkVgP9Cx1NNCGq19m9GJF/Ir0687pklhNggTw3rbZdEEfCP0Hd+dNbw
	 fgm0iXQjp17fL+RKU6Vesl8zhy5zjkjzuW2tUOM0Ro7q02AWY1KD87xf90xmhhOoDz4bI
	 zOiSpGk6TVNossvOYWXSq9N06MeH+5H+W9uflgvmQFjv9SMcxuGJykklb9awR5192WBCR
	 NdU9fg4rzQYWkrgLOF//bhixRVcv87x52QgjSF7f6pkUGPVNxoNgemrpV1JTHa3akMVxi
	 rIpAqj+GMgrOm9V21j+JWeLRr7PWyyScLZAy1QY7ZO3zdbAoGpTutS5j/M4Y+oY2kQA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=roeck-us.net;
	spf=fail smtp.mailfrom=roeck-us.net;
	dkim=pass header.d=roeck-us.net header.i=@roeck-us.net header.a=rsa-sha256 header.s=default header.b="0DcBLZr/";
	arc=none smtp.remote-ip=35.89.44.35
Received: from omta36.uswest2.a.cloudfilter.net (omta36.uswest2.a.cloudfilter.net [35.89.44.35])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13B0F606A325
	for <arm-scmi@vger.kernel.org>; Mon,  9 Nov 2026 15:56:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 13B0F606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=roeck-us.net header.i=@roeck-us.net header.a=rsa-sha256 header.s=default header.b=0DcBLZr/
Received: from eig-obgw-6006b.ext.cloudfilter.net ([10.0.30.211])
	by cmsmtp with ESMTPS
	id QOFexnbWJRiNxQRjexKEY0; Mon, 09 Nov 2026 15:56:42 +0000
Received: from 162-215-252-36.unifiedlayer.com ([208.91.199.152])
	by cmsmtp with ESMTPS
	id QRjex1fDGFhzrQRjexOMkc; Mon, 09 Nov 2026 15:56:42 +0000
X-Authority-Analysis: v=2.4 cv=JY+8rVKV c=1 sm=1 tr=0 ts=6af1ed3a
 a=QNED+QcLUkoL9qulTODnwA==:117 a=2cfIYNtKkjgZNaOwnGXpGw==:17
 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=M0FbrtG7MMAA:10 a=iHwBjlyiAAAA:8
 a=VwQbUJbxAAAA:8 a=bbxMUrBqG-LWPQ326wMA:9 a=CjuIK1q_8ugA:10
 a=uNSKXYNwxGiU6LD0JREI:22 a=KPbNTLLc3YvdawN95zVk:22
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=roeck-us.net; s=default; h=In-Reply-To:Content-Type:MIME-Version:References
	:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding
	:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Unsubscribe-Post:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=IiHfMjI5UW1C+sBrl6OK0Tos0QEXOpbHcV5EoY3XjNc=; b=0DcBLZr/Skrac/9YuaGppdAFJq
	U4CB7I9WuAnpZlpf5NUrjQGth5l+jsEH1ZZW7/3kuHf/CI1Lp1/3mOZDlnxB4GCnQZYfrQON1aFeJ
	r1cgrB6r23EF/MUjM+b3QUfIi/HqGMotIs//Xrn5CGhx/Rh7JnSIb/+kUuXskx39f8f4Ut83tfE8k
	u70/v0zPbLBLic59c6WLJy4LLGi74o9UTIBOghgeO6zBoo2osWPwOk2v3Ttf0yFSAd0BTuzgVlGz5
	J16JZAT5a8P++Mr+xrR0BKI4bov23ZvgBgKXD0XgMfmFM7QOIvyoWE1no2KLsdo5l0YhVy+glJ4C+
	LI0w7RUg==;
Received: from 108-223-40-66.lightspeed.sntcca.sbcglobal.net ([108.223.40.66]:32976 helo=server.roeck-us.net)
	by bh-25.webhostbox.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.100.1)
	(envelope-from <linux@roeck-us.net>)
	id 1xQRjd-00000001UbS-33TR;
	Mon, 09 Nov 2026 21:26:41 +0530
Date: Mon, 9 Nov 2026 07:56:40 -0800
From: Guenter Roeck <linux@roeck-us.net>
To: raoxu <raoxu@uniontech.com>
Cc: sudeep.holla@kernel.org, cristian.marussi@arm.com,
	marek.vasut@mailbox.org, arm-scmi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] hwmon: (scmi) Enable temperature sensors using their
 sensor IDs
Message-ID: <25506328-5bef-498c-8e9d-00c33bb8b13f@roeck-us.net>
References: <AED18609B941BCFD+20261109082854.3739085-1-raoxu@uniontech.com>
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
In-Reply-To: <AED18609B941BCFD+20261109082854.3739085-1-raoxu@uniontech.com>
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - bh-25.webhostbox.net
X-AntiAbuse: Original Domain - vger.kernel.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - roeck-us.net
X-BWhitelist: no
X-Source-IP: 108.223.40.66
X-Source-L: No
X-Exim-ID: 1xQRjd-00000001UbS-33TR
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: 108-223-40-66.lightspeed.sntcca.sbcglobal.net (server.roeck-us.net) [108.223.40.66]:32976
X-Source-Auth: guenter@roeck-us.net
X-Email-Count: 38
X-Org: HG=direseller_whb_net_legacy;ORG=directi;
X-Source-Cap: cm9lY2s7YWN0aXZzdG07YmgtMjUud2ViaG9zdGJveC5uZXQ=
X-Local-Domain: yes
X-CMAE-Envelope: MS4xfDvt/RZtXO3w3AJbYlb9VBcWqFyifqQ3mdxQLnrfea+CamYDgXkftQXzPpXBQAb9SBM92D8rZyCu8vF2WaTjyu8WS6jBNfZdfl9Ni7nGH5NjRwFSioD9
 5FbqD6e1Bos0oWLI5j1XBE1EtGqTSZ3mb223rwn494ipCO7kPXsisJZksAdgCVsLtRr6wwbLmQgQXNMwK+ms5tS3V2p6jFuMm5FXhRu62DsnCayBspvPzN6X

On Mon, Nov 09, 2026 at 04:28:54PM +0800, raoxu wrote:
> From: Xu Rao <raoxu@uniontech.com>
> 
> scmi_hwmon_probe() groups sensors by hwmon type, so the index in
> scmi_sensors->info[hwmon_temp] is not necessarily the SCMI sensor ID.
> Passing that index to config_set() targets a different sensor if the
> platform exposes non-temperature sensors ahead of temperature sensors.
> The intended temperature sensor can remain disabled, causing subsequent
> readings to fail. If configuring the wrong sensor fails, thermal
> registration of the intended sensor is also skipped.
> 
> Use the firmware sensor ID, as the read and thermal registration paths
> already do, so temperature sensors are enabled correctly.
> 
> The patch was reviewed and the commit message expanded with OpenCode
> AI assistance.
> 
> Fixes: 72804d1631b3 ("hwmon: (scmi) Enable sensors to assure they can be read")
> Signed-off-by: Xu Rao <raoxu@uniontech.com>
> Reviewed-by: Sudeep Holla <sudeep.holla@kernel.org>

Applied.

Thanks,
Guenter

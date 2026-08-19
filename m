Received: from www2881.sakura.ne.jp (www2881.sakura.ne.jp [49.212.198.91])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2313B3D411B
	for <arm-scmi@vger.kernel.org>; Wed, 19 Aug 2026 07:56:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=49.212.198.91
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787126163; cv=none; b=j5N7j+9WIU7FbvGa/+OW/HVZYNgFFtfH7FYchbNXJ7zrAP0i57zy8zvt/uPTzJC0K2vRia0h+AgoOuZKHPiozWe6afwH5axqEuysmSaLPkYAbaKAVgaeBa6XS55FI8xv+Gyhyt8zbAQBfr53KFgGxq0OK6yXP+eVdZDuLNqeQSY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787126163; c=relaxed/simple;
	bh=owIGpNBE0f+3opMEaSi1ARrm2VRHzZIkFS2Hdo8xNPs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZOOnTmapm6tY9l4FBMnsdvqUsupKi+QX9v+illTAfpNHS3Jc5PoBBifxtCvOQ+wHqjvlrltqpF9Z+Zus5xcdMW5x/BV1jWx4mbYFMMNCASwdNF+fcCLnUYeGiKRW0du0DcDpu1c+WHdYvUOebZxjZEVTtK4rPIB/tsX+LFJ1jZ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=enjuk.jp; spf=pass smtp.mailfrom=enjuk.jp; dkim=pass (2048-bit key) header.d=enjuk.jp header.i=@enjuk.jp header.b=KbHCSHSO; arc=none smtp.client-ip=49.212.198.91
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=enjuk.jp
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=enjuk.jp
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=enjuk.jp header.i=@enjuk.jp header.b="KbHCSHSO"
Received: from x1 (KD059132154071.au-net.ne.jp [59.132.154.71])
	(authenticated bits=0)
	by www2881.sakura.ne.jp (8.16.1/8.16.1) with ESMTPSA id 67J7tPHY079161
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
	Wed, 19 Aug 2026 16:55:26 +0900 (JST)
	(envelope-from kohei@enjuk.jp)
DKIM-Signature: a=rsa-sha256; bh=owIGpNBE0f+3opMEaSi1ARrm2VRHzZIkFS2Hdo8xNPs=;
        c=relaxed/relaxed; d=enjuk.jp;
        h=From:Message-ID:To:Subject:Date;
        s=rs20251215; t=1787126127; v=1;
        b=KbHCSHSOSHC4FlZVDv73c2vawGAtjjAnC2BKhxTZBOq8rkQH2k6G6eL+WWKilBwz
         UmEJqkODyrRSpdN4yOzQfleB5f6wMwbfllh5tTSBb11Is5Hk/TyD5STKW8IyQxDg
         VsOugZ+k5JKj+ETQOUz92sLp8tmRBNbKAjS4MjK3fa8C1r3QAInzSLy1eb/4CV4m
         g5HqK+MDW/FyTmHtlFFYT3bUWne+apZ1JmfYE/9gaPzafrM2OboAMdpRs/TwUNdj
         cL2SKTRxgANRc3j2TryR/1x/gek6ot5xuXa1W9/GCJlAaL8tzFRzOvypllD4KXLg
         tiKmiFuXY7+gnBTkM/p+BA==
Date: Wed, 19 Aug 2026 16:55:23 +0900
From: Kohei Enju <kohei@enjuk.jp>
To: Li Jun <lijun01@kylinos.cn>
Cc: sudeep.holla@kernel.org, cristian.marussi@arm.com,
        arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH] firmware: arm_scmi: pm: use SIMPLE_DEV_PM_OPS for pm
 struct
Message-ID: <aoVgAv8iNxPmWsUw@x1>
References: <20260819061530.2391788-1-lijun01@kylinos.cn>
Precedence: bulk
X-Mailing-List: arm-scmi@vger.kernel.org
List-Id: <arm-scmi.vger.kernel.org>
List-Subscribe: <mailto:arm-scmi+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:arm-scmi+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260819061530.2391788-1-lijun01@kylinos.cn>

On 08/19 14:15, Li Jun wrote:
> use SIMPLE_DEV_PM_OPS for scmi_dev_pm_ops,and add the value of
> .freeze .thaw .poweroff .restore.if these address are null, may cause
> error in s4.

Could you elaborate on the S4 error you observed?

Also, the concerns raised by Sashiko look valid to me.

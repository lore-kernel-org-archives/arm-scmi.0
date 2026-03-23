Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DFC5B1B86C7;
	Mon, 23 Mar 2026 18:02:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774288952; cv=none; b=eC2H60lOjBZUOit3fjKERIkv7FinIbPIASMU3pNqfQTWBBvCFC0YT5sUTziKR+/vnr4n832MdDLjOXdXm6P1yLSVJihwDIHuVQ78dWHAZlqq3b10Bh67Jwb4oE+sO4/8pr/BMks1fWqXq4Y/4ECWgPsAg6vhzeItk1R/jhfd1sE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774288952; c=relaxed/simple;
	bh=YJ9N55+1LbnIjsvbxyD8BVXrvl3b4MCCT7hul9aYC7Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YtkSofIPvwtwK5WdsVin+UB6+iMdetHCFTD/zBMN8DEiBvAPMHzTMEskCMPuIQLsYGzs6FBtOjCiE6UNEmerIir5wqdVYJv4f9J9jkTJo/O6494AcAhOPaQPiZ2BW5DbBWfv4t3DPmSyIKo4RAZI/ypsa0jYqY4DbcxsFQneg6w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 0DC711476;
	Mon, 23 Mar 2026 11:02:24 -0700 (PDT)
Received: from pluto (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 669563F694;
	Mon, 23 Mar 2026 11:02:26 -0700 (PDT)
Date: Mon, 23 Mar 2026 18:02:18 +0000
From: Cristian Marussi <cristian.marussi@arm.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Sudeep Holla <sudeep.holla@kernel.org>,
	Cristian Marussi <cristian.marussi@arm.com>,
	Marek Vasut <marek.vasut+renesas@mailbox.org>,
	arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/3] firmware: arm_scmi: Lazy clock rates and bound
 iterator fixes
Message-ID: <acGAKmPkfdmxvMR_@pluto>
References: <cover.1774283748.git.geert+renesas@glider.be>
Precedence: bulk
X-Mailing-List: arm-scmi@vger.kernel.org
List-Id: <arm-scmi.vger.kernel.org>
List-Subscribe: <mailto:arm-scmi+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:arm-scmi+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1774283748.git.geert+renesas@glider.be>

On Mon, Mar 23, 2026 at 05:56:09PM +0100, Geert Uytterhoeven wrote:
> 	Hi all,

Hi Geert,

> 
> This patch series:
>   - Fixes an out-of-bound access in lazy clock rate handling,
>   - Synchronizes bound-iterator cleanup naming between documentation and
>     code.

thanks for this !

I was just chasing down exactly the same issue, since it was flagged by
our CI on a rockchip board (together with some KASAN splat...)...but I had
still to manage to get my hands directly on that board to start
debugging properly ... so ...

... very happy that you beat me at this:P !

While waiting for the board and trying to figure out what could cause
the fatal issue I spotted something more to be rectified in the core of
the iterators, BUT I dont think it would have solved the issue like your
fixes.

In a nutshell, it was the possibility of an integer undeflow due to an
unchecked subtraction between unsigned.

---8<---
commit 65bd4a11333098fbf4c60f3bc59c971be1cd259d (mygitlab/scmi_dev, scmi_dev)
Author: Cristian Marussi <cristian.marussi@arm.com>
Date:   Mon Mar 23 08:19:32 2026 +0000

    [TODO] FIX Iterator boundary checking
    
    [TODO] FIX Iterator boundary checking
    
    Signed-off-by: Cristian Marussi <cristian.marussi@arm.com>

diff --git a/drivers/firmware/arm_scmi/driver.c b/drivers/firmware/arm_scmi/driver.c
index 8b5f477758a0..562977438e60 100644
--- a/drivers/firmware/arm_scmi/driver.c
+++ b/drivers/firmware/arm_scmi/driver.c
@@ -1845,7 +1845,7 @@ static int __scmi_iterator_run(void *iter, unsigned int *start, unsigned int *en
                if (ret)
                        return ret;
 
-               if (st->num_returned > st->max_resources - st->desc_index) {
+               if (st->num_returned + st->desc_index > st->max_resources) {
                        dev_err(ph->dev,
                                "No. of resources can't exceed %d\n",
                                st->max_resources);
---8<----

Anyway, next dsys I will test all of this with your series, but since my
original series indeed was on hold now due to these issues AND because still
lacking clock-MAINTs acks, I am not sure if:
 
 - we'll merge your fixes into my series while maintaining of course your
   authorship (instead of applying the series on top)

 - Sudeep will still queue any of this for this cycle

Thanks a lot for the debug and fixes to my cr...y stuff :P

Cristian

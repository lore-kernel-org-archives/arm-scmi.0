Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793613068;
	b=Ja1FDhXKukgmjamaoPCye6LEpFtjLJ2OevUXfTH2mQUE6IXIjwbSzMqGWfph3/gElZWp
	 XREbMMQNqLcBABAWIzz0WoDtRo5vh2mJ7aCqts+8Ro5oe6PW+7b6TXwgppnqpYhKKqJD+
	 xkY49mCcH10E+GKtKYhTzUVma8q2jUdqy86xQ5TffvCWHAfE9SpULsBVHSVhWyK29gjKt
	 eirTGllLQ1LatcCM5brm/IEUS/61mvJfuCObEUlX0blM3fE2mwX9tqzvaA4v1U7j3Gh4m
	 3jxVsBI4LyTgb82dk/imP7JrCQL3vw6+oi2mcla0zudTMbPOdu/x6mkpcDbAikMP6Vw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793613068;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=q4JV/p8yAsWJM87e2NSRQvq77nvu7u4Q4arA+NaEhHA=;
	b=VIiXYLSV05X7IucDd4Dt4Y1SDV7e2BEwoUHVBK0NJ37dSHnoHkbpDz0GPpPAYFXZky8H
	 NNlm8IRf9Rs/7ps3kt3q2yQef54kk8LIEqwUfkSbGsgsKuGzKryZAQO8LC1Uemf6NTnJ3
	 5QnmTupL2plaU8uL1c4NHi+UZA+VBbxl4uebSegpAZA6zhvWRrHt/kKJQ1fGVV4sOYbXh
	 KyN9OzDmdLxrZ2ialFfxieeWjlV4xq1QnQJI0iRCBhUGJ3JvAIJiKSEtamxZTmHohFNtz
	 UgTqhRNDZ1IH5Hq9BEY8dSM0T8HfIJsK4kZjy3RIvibnsH2pTF7nt5jIdnIPCML6zNw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=S5RHEjXR;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 354F4606A326
	for <arm-scmi@vger.kernel.org>; Mon,  2 Nov 2026 09:51:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=S5RHEjXR
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6E15D1F000C1;
	Mon,  2 Nov 2026 09:51:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793613067;
	bh=q4JV/p8yAsWJM87e2NSRQvq77nvu7u4Q4arA+NaEhHA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=S5RHEjXRv4hz1bBWgTG1B80sGbqis6qCJYXHffrydGcZAhsK47mDSD+iJIIkuxxPf
	 M89T3qLakKRL8kFscmJNOHvIX19O+fA1jNzPRjrYu5F34n8Gz9OWM9hk38ZB3iZ4+d
	 rxfuNWO8ElO7f8oq34KGZrWoRJ52SiBJUSJGh5Btn214pBNMlsxrUkh34rR1CDYOLi
	 V2gdofEkQONAy7aZYVZo77hRQ60SpKK/EJqua8xJ3qSqAdqVYTPd6AouogWVKGyLfy
	 6sSD6db24hceyNWUSN1bBBHR7BXoXKRvYZspoCpkxpeXom7WQtYKlCTGQQ/7VqJb4Z
	 +W28Ybo4iDNQQ==
Date: Mon, 2 Nov 2026 09:51:04 +0000
From: Sudeep Holla <sudeep.holla@kernel.org>
To: Philip Radford <philip.radford@arm.com>
Cc: linux-arm-kernel@lists.infradead.org, arm-scmi@vger.kernel.org,
	Cristian Marussi <cristian.marussi@arm.com>,
	Sudeep Holla <sudeep.holla@kernel.org>, Peng Fan <peng.fan@nxp.com>,
	Sashiko <sashiko-bot@kernel.org>
Subject: Re: [PATCH 2/3] firmware: arm_scmi: imx: Validate MISC control
 response size
Message-ID: <20261102-kickass-formidable-beluga-5eacbe@sudeepholla>
References: <20261028130502.2999676-1-sudeep.holla@kernel.org>
 <20261028130502.2999676-2-sudeep.holla@kernel.org>
 <auPDK9bG/H8GTOK5@e121740.arm.com>
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
In-Reply-To: <auPDK9bG/H8GTOK5@e121740.arm.com>

On Thu, Oct 29, 2026 at 10:05:31PM +0000, Philip Radford wrote:
> On Wed, Oct 28, 2026 at 01:05:01PM +0000, Sudeep Holla wrote:
> > scmi_imx_misc_ctrl_get() uses @num to report the number of
> > values returned by firmware, but it did not retain the caller's value
> > as the capacity of @val.
> > 
> 
> Hi,
> 
> > A response with more values than the caller allocated was copied into
> > @val unchecked. For example, the MQS regmap callback supplies storage
> > for one value. Retain the input capacity and reject responses exceeding
> > it before copying, then update @num only after a successful copy.
> > 
> > Document the in/out @num contract of the exported helper.
> > 
> > Reported-by: Sashiko <sashiko-bot@kernel.org>
> > Closes: https://sashiko.dev/#/bug/linux-6897b44a-57fb-4964-95f8-447d0ce526e4
> > Fixes: 61c9f03e22fc ("firmware: arm_scmi: Add initial support for i.MX MISC protocol")
> > Signed-off-by: Sudeep Holla <sudeep.holla@kernel.org>
> > Reviewed-by: Peng Fan <peng.fan@nxp.com>
> > ---
> >  .../firmware/arm_scmi/vendors/imx/imx-sm-misc.c  | 16 ++++++++++++----
> >  include/linux/firmware/imx/sm.h                  |  6 ++++++
> >  2 files changed, 18 insertions(+), 4 deletions(-)
> > 
> > diff --git a/drivers/firmware/arm_scmi/vendors/imx/imx-sm-misc.c b/drivers/firmware/arm_scmi/vendors/imx/imx-sm-misc.c
> > index 0c708b2dd496..f00f7acba845 100644
> > --- a/drivers/firmware/arm_scmi/vendors/imx/imx-sm-misc.c
> > +++ b/drivers/firmware/arm_scmi/vendors/imx/imx-sm-misc.c
> > @@ -273,10 +273,16 @@ static int scmi_imx_misc_ctrl_get(const struct scmi_protocol_handle *ph,
> >  {
> >  	struct scmi_imx_misc_ctrl_get_out *out;
> >  	struct scmi_xfer *t;
> > +	u32 num_values, max_values;
> >  	int ret, i;
> >  	int max_msg_size = ph->hops->get_max_msg_size(ph);
> >  	int max_num = (max_msg_size - sizeof(*out)) / sizeof(__le32);
> >  
> > +	if (!num || !val || !*num)
> > +		return -EINVAL;
> > +
> > +	max_values = *num;
> > +
> >  	ret = scmi_imx_misc_ctrl_validate_id(ph, ctrl_id);
> >  	if (ret)
> >  		return ret;
> > @@ -290,16 +296,18 @@ static int scmi_imx_misc_ctrl_get(const struct scmi_protocol_handle *ph,
> >  	ret = ph->xops->do_xfer(ph, t);
> >  	if (!ret) {
> >  		out = t->rx.buf;
> > -		*num = le32_to_cpu(out->num);
> > +		num_values = le32_to_cpu(out->num);
> >  
> > -		if (*num >= max_num ||
> > -		    *num * sizeof(__le32) > t->rx.len - sizeof(__le32)) {
> > +		if (num_values > max_values || num_values >= max_num ||
> > +		    num_values * sizeof(__le32) > t->rx.len - sizeof(__le32)) {
> >  			ph->xops->xfer_put(ph, t);
> >  			return -EINVAL;
> >  		}
> 
> Why does num_values have to be less than max_num, can it not be equal to? Isn't max_num
> already smaller than max_msg_size due to the initialisation above?
> 

Good question, I didn't look at that logic as I blindly retained the existing
logic from `*num >= max_num` to `num_values >= max_num`.

The scmi_imx_misc_ctrl_eet() see to allow value equal to max_num. It could
have been overlooked when we reviewed initially.

Peng, thoughts ?

-- 
Regards,
Sudeep

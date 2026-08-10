Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3744D3E9C33;
	Mon, 10 Aug 2026 14:13:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786371212; cv=none; b=gvAMIZyxxnLcztv/nsDKkaqWxgUQFKdE8te5qNkAcKM76SQD+onqQowLvbkcjFr1lTfRJwda30+i79RDcCXDvIuKchnF+WLDOrqH9ZpdxTJAkjbd3dju/vO9jJVu/OCDHnf5MK2eDbWjX01zK01rh0V5RwgzTe3irGjZwfU/aTI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786371212; c=relaxed/simple;
	bh=zYnXF4fid7nru4L+UN6cx73+9ENOxlbLHCYi9e/TLbk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=R1tsMtphBQ4rDuCj3sdwiAp2iCHPmsVAUATa6ZgUubmtrOoukIDZGOHjc/KqHzU1NoyIda8fZNXLPt8O+UcIAN8rXWREo72VSJCyvcHhe4HFqRTfI5tJDmuMrL3L4yiCbo+Z3eN7VpxlpOH4e/S7xSxYTQSOi/+MS+j5z4V67qY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=c4OaKYOd; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="c4OaKYOd"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 71E781516;
	Mon, 10 Aug 2026 07:13:26 -0700 (PDT)
Received: from pluto (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id E145D3F86F;
	Mon, 10 Aug 2026 07:13:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1786371210; bh=zYnXF4fid7nru4L+UN6cx73+9ENOxlbLHCYi9e/TLbk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=c4OaKYOdMrP2zYlAL+9Ck9ytNUdfa4vN23e1uvO8+zr+aIIaVGbiPz8omcY23SsKm
	 69UbHQH7fCfBzAQRXN6684AqVtZFko90HF3FUO0+1yumxbokV6x6NFEDB3De+636G0
	 L1fRQ8tn65V06Wdi/ESvTdQtsPnqOd4UbC6BfEog=
Date: Mon, 10 Aug 2026 15:13:22 +0100
From: Cristian Marussi <cristian.marussi@arm.com>
To: Fayssal Benmlih <Fayssal.Benmlih@arm.com>
Cc: Cristian Marussi <Cristian.Marussi@arm.com>,
	"arm-scmi@vger.kernel.org" <arm-scmi@vger.kernel.org>,
	"d-gole@ti.com" <d-gole@ti.com>,
	"david@kernel.org" <david@kernel.org>,
	Elif Topuz <Elif.Topuz@arm.com>,
	"etienne.carriere@st.com" <etienne.carriere@st.com>,
	"f.fainelli@gmail.com" <f.fainelli@gmail.com>,
	"james.quinlan@broadcom.com" <james.quinlan@broadcom.com>,
	"jic23@kernel.org" <jic23@kernel.org>,
	"kas@kernel.org" <kas@kernel.org>,
	"kernel-team@meta.com" <kernel-team@meta.com>,
	"leitao@kernel.org" <leitao@kernel.org>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	"linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	Lukasz Luba <Lukasz.Luba@arm.com>,
	"michal.simek@amd.com" <michal.simek@amd.com>,
	"peng.fan@oss.nxp.com" <peng.fan@oss.nxp.com>,
	Philip Radford <Philip.Radford@arm.com>,
	"puranjay@kernel.org" <puranjay@kernel.org>,
	Souvik Chakravarty <Souvik.Chakravarty@arm.com>,
	"sudeep.holla@kernel.org" <sudeep.holla@kernel.org>,
	"usama.arif@linux.dev" <usama.arif@linux.dev>,
	"vincent.guittot@linaro.org" <vincent.guittot@linaro.org>
Subject: Re: [PATCH v7 08/23] firmware: arm_scmi: Add Telemetry configuration
 operations
Message-ID: <anncgnjIKCzuBKLL@pluto>
References: <20260802145618.1952804-9-cristian.marussi@arm.com>
 <1E14B66B-A2A3-4FF7-8178-D27433A316B1@contoso.com>
Precedence: bulk
X-Mailing-List: arm-scmi@vger.kernel.org
List-Id: <arm-scmi.vger.kernel.org>
List-Subscribe: <mailto:arm-scmi+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:arm-scmi+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1E14B66B-A2A3-4FF7-8178-D27433A316B1@contoso.com>

On Mon, Aug 03, 2026 at 11:54:30PM +0100, Fayssal Benmlih wrote:
> Hi Cristian,
> 

Hi,

> I found two configuration issues inline.
> 
> > 	if (!is_group) {
> > 		active_update_interval =
> > 			&ti->info.active_update_interval;
> > 		current_mode = &ti->info.current_mode;
> > 	} else {
> > 		struct scmi_telemetry_res_info *rinfo;
> >
> > 		rinfo = ti->res_get(ti);
> > 		active_update_interval =
> > 			&rinfo->grps[res_id].active_update_interval;
> > 		current_mode = &rinfo->grps[res_id].current_mode;
> > 	}
> > [...]
> > 	if (!ret) {
> > 		ti->info.enabled = tlm_enable;
> > 		*current_mode = next_mode;
> > 		ti->info.notif_enabled =
> > 			*current_mode == SCMI_TLM_NOTIFICATION;
> > 		if (update_interval_ms)
> > 			*active_update_interval =
> > 				le32_to_cpu(interval);
> > 	}
> 
> For a group operation, active_update_interval and current_mode point to the
> group, but enabled and notif_enabled are still written into the global
> ti->info state.
> 
> Disabling one group can therefore make the driver believe the entire
> Telemetry instance is disabled, causing reads for unrelated DEs to return
> no data. A group's collection mode can similarly overwrite the global
> notification state.
> 
> Please select group-versus-instance cached state consistently for every
> field updated here.
> 

Yes indeed...fixed in v8.

> > 			de_offs = le32_to_cpu(resp->shmti_de_offset);
> >
> > 			shmti = &ti->shmti[sid];
> > 			payld = shmti->base;
> > 			/* Check boundary first... */
> > 			if (de_offs + LINE_LENGTH_BYTES(payld) >=
> > 			    shmti->info.len)
> > 				return -EPROTO;
> 
> The addition can wrap, and the payload must end before the TDCF epilogue,
> not merely before the end of the entire SHMTI allocation.
> 
> Please use checked addition and verify the complete line against the
> payload boundary, such as len - TDCF_EPLG_SZ. The same boundary rule
> should be used for an explicitly returned block-timestamp offset.
> 

To be further reworked in v9.

Thanks,
Cristian


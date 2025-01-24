Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF1231D5CD4;
	Fri, 24 Jan 2025 02:43:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737686615; cv=none; b=o47HXTJRpPjR6CZ02jCrYHbiFq5+tI009wkNoqLzRVm07Q8zviwi3So8i0b5+moQNgBVgngX0Pc1YnltTikkutzKptBkxs7QpOVkKS1sgt8M8hPTeiwQs6AyKkUVlSeg3M+m8GZ0ZAnmaB2qUXUQZAQRpxcFYg6iyI3wcmxVEf8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737686615; c=relaxed/simple;
	bh=5Jxf1MIkAme+I3DGHNaJEUWbgACy1KWQtq6VUX4R9y8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kI1lNxVZMVlwVhXc90k8V+e7QEPqWpMXLL7/jGaa317ZPwbeAJhxqOOTq5xs0xd2x3KcmMq4C5q5CT1k457J3UndsdJPH9OzKOm6Qkn8kNSTpgcZG18GF+5oqrbDbMCHAuXEfNZKlgL7NAjGHGUPy7ONECASsO0H3j83GnnbMtY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=J2IJKebG; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="J2IJKebG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1737686614; x=1769222614;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=5Jxf1MIkAme+I3DGHNaJEUWbgACy1KWQtq6VUX4R9y8=;
  b=J2IJKebGGD9P5n36muycBUS3Zws9X0ccqbJsAEKBw3QrnD5vz4cq94zg
   9lK6WTbgzC0qprXLf+YfZWLF5taZ2YIpCNga2XPiZ5XAP/JdV1vTsnpBa
   PFXGeyl0MH15RunqZVF4Bc7I1xApXdFOR4KhgKHaEr+DKnB+xljumEmlJ
   AimaEbIBdAPT360sBZ+SHqyqhQuF4onlD+a4653/XZ7g2vCo4h53ZE30F
   i0+abGAs9toGx7tBL7yYksG/dkQgKJnujmuLPgoGL0g1Gw7ZC7mRmQHIO
   YfYQw6ZOt8XDr4Gey8htAzsJVSdS6wJ1Z6jB8uHPQUVkSxhffJNtkcxjH
   Q==;
X-CSE-ConnectionGUID: TzwmcutvSiqy5xqDxZPenw==
X-CSE-MsgGUID: yupif/fNSv++rslqrM08zQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11324"; a="38469254"
X-IronPort-AV: E=Sophos;i="6.13,230,1732608000"; 
   d="scan'208";a="38469254"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jan 2025 18:43:33 -0800
X-CSE-ConnectionGUID: 8pdSFtXJRIKb07fDND+IjQ==
X-CSE-MsgGUID: C4DkUGYDQ9OFFE7AKWijjg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,230,1732608000"; 
   d="scan'208";a="138519430"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 23 Jan 2025 18:43:30 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tb9fL-000c2x-1X;
	Fri, 24 Jan 2025 02:43:27 +0000
Date: Fri, 24 Jan 2025 10:43:12 +0800
From: kernel test robot <lkp@intel.com>
To: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>,
	Sudeep Holla <sudeep.holla@arm.com>,
	Cristian Marussi <cristian.marussi@arm.com>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	imx@lists.linux.dev, Peng Fan <peng.fan@nxp.com>
Subject: Re: [PATCH 1/5] firmware: arm_scmi: imx: Add i.MX95 LMM protocol
Message-ID: <202501241025.6reKesXZ-lkp@intel.com>
References: <20250121-imx-lmm-cpu-v1-1-0eab7e073e4e@nxp.com>
Precedence: bulk
X-Mailing-List: arm-scmi@vger.kernel.org
List-Id: <arm-scmi.vger.kernel.org>
List-Subscribe: <mailto:arm-scmi+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:arm-scmi+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250121-imx-lmm-cpu-v1-1-0eab7e073e4e@nxp.com>

Hi Peng,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 0907e7fb35756464aa34c35d6abb02998418164b]

url:    https://github.com/intel-lab-lkp/linux/commits/Peng-Fan-OSS/firmware-arm_scmi-imx-Add-i-MX95-LMM-protocol/20250121-231254
base:   0907e7fb35756464aa34c35d6abb02998418164b
patch link:    https://lore.kernel.org/r/20250121-imx-lmm-cpu-v1-1-0eab7e073e4e%40nxp.com
patch subject: [PATCH 1/5] firmware: arm_scmi: imx: Add i.MX95 LMM protocol
config: arm64-randconfig-r122-20250124 (https://download.01.org/0day-ci/archive/20250124/202501241025.6reKesXZ-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.2.0
reproduce: (https://download.01.org/0day-ci/archive/20250124/202501241025.6reKesXZ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501241025.6reKesXZ-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/firmware/arm_scmi/vendors/imx/imx-sm-lmm.c:189:32: sparse: sparse: restricted __le32 degrades to integer

vim +189 drivers/firmware/arm_scmi/vendors/imx/imx-sm-lmm.c

   172	
   173	static int scmi_imx_lmm_protocol_attributes_get(const struct scmi_protocol_handle *ph,
   174							struct scmi_imx_lmm_priv *priv)
   175	{
   176		struct scmi_msg_imx_lmm_protocol_attributes *attr;
   177		struct scmi_xfer *t;
   178		int ret;
   179	
   180		ret = ph->xops->xfer_get_init(ph, PROTOCOL_ATTRIBUTES, 0,
   181					      sizeof(*attr), &t);
   182		if (ret)
   183			return ret;
   184	
   185		attr = t->rx.buf;
   186	
   187		ret = ph->xops->do_xfer(ph, t);
   188		if (!ret) {
 > 189			priv->nr_lmm = SCMI_IMX_LMM_PROTO_ATTR_NUM_LM(attr->attributes);
   190			dev_info(ph->dev, "i.MX LMM: %d Logical Machines\n",
   191				 priv->nr_lmm);
   192		}
   193	
   194		ph->xops->xfer_put(ph, t);
   195	
   196		return ret;
   197	}
   198	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

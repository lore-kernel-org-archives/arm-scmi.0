Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C84ED301708;
	Wed, 21 Jan 2026 01:25:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768958718; cv=none; b=T0Y5s4CpUYIpTudKBS/3pIiKGYXkSI9QR2VTVFexDgfUmF6x6CT3T7Mb8Rm07UK0PIRTvkK0CFRWgGqZF5NT0C+YNoBrJXp32RnIiEyM9S3kd1uMNLpVF/9VpsQqZdEIpl7cWvsa54AGmaGSFS1hP9bznNQQVNi29W2R54EHF1U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768958718; c=relaxed/simple;
	bh=jg5BpT5100sdtoSuwQ6SgHaMH0aIdKCiN/KiOpnG2m0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YsIssXrzfvC0bSHkq7OlAJ+dbL45OT8qUP7F8sXSyMb3n1BhW9Bv+kuLbozUKq4mO55ZvTSfD7CjIpk9hVXXwRI0GgE/3E2h4BIHkAArzODTI+A98wmmby6bqUI+zmKZ/Kp4q22abb/LUjUk4kF3aNKg7xh4W57PEI6bZINtgLM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HxNPJ8+J; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HxNPJ8+J"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768958717; x=1800494717;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=jg5BpT5100sdtoSuwQ6SgHaMH0aIdKCiN/KiOpnG2m0=;
  b=HxNPJ8+JTQ/+pcRUcibhIHV7dgTYjsRM4eHBBy98nWlvg1XbT3LGH0mb
   IDwv6OQVprNFpyiNbupg27yIQjeLe2H0tfxmmg4pJx24Zo+DmHKfySow7
   b2nx8OPz6/vZ/fLy0/WVnlyHoLcT/hD1HS437AOcz7ja9vAAKJHKn46ik
   1us7Zr+eH41rVgUnykyLxPjGZp4ewG8pXFYrRrnwWRZaaivcS4absdkAh
   qIET2otqaJ6RoqCcWOrCf5WOrD3pjBt4fO3Ai+XptDwBDowZTcK0fFcxU
   AHPezxYIus4hMfSIo6AQ++ROU+gayQwQj6wTXrdlCQJCpWulUx7YEvkws
   Q==;
X-CSE-ConnectionGUID: jbSkBUqkTeSm5gfFF4a5JA==
X-CSE-MsgGUID: IGDNe/uITxqR2gTzu/hiAg==
X-IronPort-AV: E=McAfee;i="6800,10657,11677"; a="70347495"
X-IronPort-AV: E=Sophos;i="6.21,242,1763452800"; 
   d="scan'208";a="70347495"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Jan 2026 17:25:16 -0800
X-CSE-ConnectionGUID: S68r+NPxRpOmSaCNok0Zvw==
X-CSE-MsgGUID: fQ6N/Ny/ThibSnDZFdoCUQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,242,1763452800"; 
   d="scan'208";a="206197445"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 20 Jan 2026 17:25:14 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1viMy8-00000000PoD-1826;
	Wed, 21 Jan 2026 01:25:12 +0000
Date: Wed, 21 Jan 2026 09:24:25 +0800
From: kernel test robot <lkp@intel.com>
To: Felix Gu <gu_0233@qq.com>, Sudeep Holla <sudeep.holla@arm.com>,
	Cristian Marussi <cristian.marussi@arm.com>
Cc: oe-kbuild-all@lists.linux.dev, arm-scmi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Felix Gu <gu_0233@qq.com>
Subject: Re: [PATCH] firmware: arm_scpi: Fix device_node reference leak in
 scpi_probe()
Message-ID: <202601210817.qdAqWG2J-lkp@intel.com>
References: <tencent_845B889AF1A932F1347EE0C09F350E491009@qq.com>
Precedence: bulk
X-Mailing-List: arm-scmi@vger.kernel.org
List-Id: <arm-scmi.vger.kernel.org>
List-Subscribe: <mailto:arm-scmi+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:arm-scmi+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <tencent_845B889AF1A932F1347EE0C09F350E491009@qq.com>

Hi Felix,

kernel test robot noticed the following build errors:

[auto build test ERROR on d08c85ac8894995d4b0d8fb48d2f6a3e53cd79ab]

url:    https://github.com/intel-lab-lkp/linux/commits/Felix-Gu/firmware-arm_scpi-Fix-device_node-reference-leak-in-scpi_probe/20260120-203159
base:   d08c85ac8894995d4b0d8fb48d2f6a3e53cd79ab
patch link:    https://lore.kernel.org/r/tencent_845B889AF1A932F1347EE0C09F350E491009%40qq.com
patch subject: [PATCH] firmware: arm_scpi: Fix device_node reference leak in scpi_probe()
config: riscv-randconfig-r064-20260121 (https://download.01.org/0day-ci/archive/20260121/202601210817.qdAqWG2J-lkp@intel.com/config)
compiler: riscv32-linux-gcc (GCC) 14.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260121/202601210817.qdAqWG2J-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601210817.qdAqWG2J-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/firmware/arm_scpi.c:21:10: fatal error: linux/clean.h: No such file or directory
      21 | #include <linux/clean.h>
         |          ^~~~~~~~~~~~~~~
   compilation terminated.


vim +21 drivers/firmware/arm_scpi.c

    18	
    19	#include <linux/bitmap.h>
    20	#include <linux/bitfield.h>
  > 21	#include <linux/clean.h>
    22	#include <linux/device.h>
    23	#include <linux/err.h>
    24	#include <linux/export.h>
    25	#include <linux/io.h>
    26	#include <linux/kernel.h>
    27	#include <linux/list.h>
    28	#include <linux/mailbox_client.h>
    29	#include <linux/module.h>
    30	#include <linux/of.h>
    31	#include <linux/of_address.h>
    32	#include <linux/of_platform.h>
    33	#include <linux/platform_device.h>
    34	#include <linux/printk.h>
    35	#include <linux/property.h>
    36	#include <linux/pm_opp.h>
    37	#include <linux/scpi_protocol.h>
    38	#include <linux/slab.h>
    39	#include <linux/sort.h>
    40	#include <linux/spinlock.h>
    41	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

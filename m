Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 595597DA93;
	Tue, 26 Aug 2025 10:37:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756204668; cv=none; b=Brcn0IVehj88sm6476YcEImYR0bC4zK2/fuAnxo82T2RiGWeg+0wPIV5BSxHa64lHl14nGs0H1VJUZoh3dE0VLVjKhwPoDssgfKL3ecj1iBsu6z+6esF9ga17TNNH66i9IoO9syeWI1c6Knnix4kOkMqNrxGTuJv3WVh4RjkeGE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756204668; c=relaxed/simple;
	bh=dmuyjZtLwcLftX2YsOHeaaRsqGgvAIpM3F3PA6tKVxY=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=RM1kM7mhNpIskLtNXU1/2cSb6XPJIw9L/aOmYxwrY6Bn7Drzm+Bd6jRp7PicaqjeZ5sqvVXn+snraKNtB8GDQQYfkwPuW7iO69KYSvVwhm+pPutOQ3MedOr6nHDjBCQRSYr2IFw1DpH77ipA+8lPgWekn5o5WK/maGJZlRhzZcw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=arm.com; spf=none smtp.mailfrom=foss.arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=foss.arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 5E7E31A00;
	Tue, 26 Aug 2025 03:37:37 -0700 (PDT)
Received: from usa.arm.com (e133711.arm.com [10.1.196.55])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 4D8EC3F694;
	Tue, 26 Aug 2025 03:37:44 -0700 (PDT)
From: Sudeep Holla <sudeep.holla@arm.com>
To: Cristian Marussi <cristian.marussi@arm.com>,
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc: Sudeep Holla <sudeep.holla@arm.com>,
	linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org,
	arm-scmi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 1/2] firmware: arm_scmi: Constify struct scmi_voltage_proto_ops
Date: Tue, 26 Aug 2025 11:37:40 +0100
Message-Id: <175620458844.1761583.10265205606346566256.b4-ty@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <2091660c072dd2d5599897243a5d69e89d46ed4d.1753816459.git.christophe.jaillet@wanadoo.fr>
References: <2091660c072dd2d5599897243a5d69e89d46ed4d.1753816459.git.christophe.jaillet@wanadoo.fr>
Precedence: bulk
X-Mailing-List: arm-scmi@vger.kernel.org
List-Id: <arm-scmi.vger.kernel.org>
List-Subscribe: <mailto:arm-scmi+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:arm-scmi+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

On Tue, 29 Jul 2025 21:15:03 +0200, Christophe JAILLET wrote:
> 'struct scmi_voltage_proto_ops' is not modified in this driver.
> 
> Constifying this structure moves some data to a read-only section, so
> increases overall security, especially when the structure holds some
> function pointers.
> 
> On a x86_64, with allmodconfig, as an example:
> Before:
> ======
>    text	   data	    bss	    dec	    hex	filename
>   13142	   1808	      0	  14950	   3a66	drivers/firmware/arm_scmi/voltage.o
> 
> [...]

Applied to sudeep.holla/linux (for-next/scmi/updates), thanks!

[1/2] firmware: arm_scmi: Constify struct scmi_voltage_proto_ops
      https://git.kernel.org/sudeep.holla/c/abd658d3e733
[2/2] firmware: arm_scmi: Constify struct scmi_transport_ops
      https://git.kernel.org/sudeep.holla/c/224dcf2968ca
--
Regards,
Sudeep


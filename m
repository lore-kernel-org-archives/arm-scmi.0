Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 99387192D7B
	for <arm-scmi@vger.kernel.org>; Fri, 30 Aug 2024 11:09:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725016170; cv=none; b=m/ux0kN55Qu61PY8XqqDWUwXdFeLXlcvmQdN+t2NvkDg0nfRbrZv38Nthx26qhQk+AD6PwCQ0ybraoX2JJMzu/Phog8yFUnlnXLZmddo349Ku+3kXcPi8TFwTDXNtfOcfPUMEfitB9OqmSyQkiSRyDQFGmY5sbR+kzT+W+2/Qng=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725016170; c=relaxed/simple;
	bh=abeBVisxyJBVxc9cPOO08vFupqppOGjeuTMM7XtSYH8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=XiMPX9sacZfo2tLdF+Ud29obzf9u6MDzIM8QzMZjVkmw/A/yTczfDG33eYf3tVU3NPMpzTUYx/Rs8pyCtQfeAq8Qld1+e4z0esS5JpAFRwjwiAqXnNqe6O8BqLSLwuqLTFTHEjNqms22OhqMC86gdm+p44mINbCmzbtVIcA7q9A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 0EB111063;
	Fri, 30 Aug 2024 04:09:54 -0700 (PDT)
Received: from usa.arm.com (e107155-lin.cambridge.arm.com [10.1.198.42])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 39AF13F66E;
	Fri, 30 Aug 2024 04:09:27 -0700 (PDT)
From: Sudeep Holla <sudeep.holla@arm.com>
To: arm-scmi@vger.kernel.org,
	Sudeep Holla <sudeep.holla@arm.com>
Cc: Cristian Marussi <cristian.marussi@arm.com>
Subject: Re: [PATCH 0/3] firmware: arm_scmi: Minor coding style cleanups
Date: Fri, 30 Aug 2024 12:09:24 +0100
Message-ID: <172501609487.2361859.9134047703801505112.b4-ty@arm.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20240827143838.1465913-1-sudeep.holla@arm.com>
References: <20240827143838.1465913-1-sudeep.holla@arm.com>
Precedence: bulk
X-Mailing-List: arm-scmi@vger.kernel.org
List-Id: <arm-scmi.vger.kernel.org>
List-Subscribe: <mailto:arm-scmi+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:arm-scmi+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

On Tue, 27 Aug 2024 15:38:35 +0100, Sudeep Holla wrote:
> With the recent changes in the for-next/scmi/updates, the builder raised
> few issues that are also reported by checkpatch. These patches fixes few of
> those issues.
> 
> Sudeep Holla (3):
>   firmware: arm_scmi: Fix trivial whitespace/coding style issues
>   firmware: arm_scmi: Replace the use of of_node_put() to __free(device_node)
>   firmware: arm_scmi: Replace comma with the semicolon
> 
> [...]

Applied to sudeep.holla/linux (for-next/scmi/updates), thanks!

[1/3] firmware: arm_scmi: Fix trivial whitespace/coding style issues
      https://git.kernel.org/sudeep.holla/c/50db2ef5c719
[2/3] firmware: arm_scmi: Replace the use of of_node_put() to __free(device_node)
      https://git.kernel.org/sudeep.holla/c/ccf502193126
[3/3] firmware: arm_scmi: Replace comma with the semicolon
      https://git.kernel.org/sudeep.holla/c/c4b908a23fab
--
Regards,
Sudeep


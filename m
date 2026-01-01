Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 46758224B04;
	Thu,  1 Jan 2026 17:54:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767290053; cv=none; b=dxuE5Ghy5Hj2NRfuIrpjdbGYq3EIX/VSAiYK8qgDg4SYbzpLRF1wlO1V578N+SCWrqzdl8IoHlVHWi6vk5e4PD0LKl104rzIT+6w357YcvHgEpbwdXY7Vj9c4i/Yhcc0NVHQTaA2frB9H0knrlNDTM3xm9bjZQtN8QxxbRgz26Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767290053; c=relaxed/simple;
	bh=xM9V5AAay1IbwJrL/vsE4fbWiqW25d/+fIR3vlk0aJ4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=O8QLuJpgvvb9oy3/Qh9Glm0xpsP0YRo7OieYHJppviWC7zDM4OWM+QxAkToKk5SZlaBW6rJ5jKrOS+Q+6QyGZXJAtMlrR/1kFpGMOxKdHeMctaj9/yEL+hGDN8+M6V4OB6BDvhKrVvSWXzNo4IHbWAVAuxzf95MlQF3Yx/JRstw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=foss.arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D5AAD497;
	Thu,  1 Jan 2026 09:54:04 -0800 (PST)
Received: from usa.arm.com (e133711.arm.com [10.1.197.51])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id B6A473F63F;
	Thu,  1 Jan 2026 09:54:10 -0800 (PST)
From: Sudeep Holla <sudeep.holla@arm.com>
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: Sudeep Holla <sudeep.holla@arm.com>,
	Cristian Marussi <cristian.marussi@arm.com>,
	arm-scmi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] firmware: arm_scmi: move boiler plate code into the get info functions
Date: Thu,  1 Jan 2026 17:54:07 +0000
Message-ID: <176729001152.117348.7354510710977239788.b4-ty@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <287b5302f583e3535d50617ec3b0856e38253171.1761576798.git.dan.carpenter@linaro.org>
References: <cover.1761576798.git.dan.carpenter@linaro.org> <287b5302f583e3535d50617ec3b0856e38253171.1761576798.git.dan.carpenter@linaro.org>
Precedence: bulk
X-Mailing-List: arm-scmi@vger.kernel.org
List-Id: <arm-scmi.vger.kernel.org>
List-Subscribe: <mailto:arm-scmi+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:arm-scmi+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

On Mon, 27 Oct 2025 18:16:06 +0300, Dan Carpenter wrote:
> This code to check whether the selector is valid and if the item has
> already been recorded in the array can be moved to the
> scmi_pinctrl_get_function_info() type functions.  That way it's in
> one place instead of duplicated in each of the callers.
> 
> Remove the check for if "pi->nr_groups == 0" because if that were the
> case then "selector >= pi->nr_groups" would already be true.  It already
> was not checked for the pin case so this makes things a bit more uniform.
> 
> [...]

Applied to sudeep.holla/linux (for-next/scmi/updates), thanks!

[1/1] firmware: arm_scmi: move boiler plate code into the get info functions
      https://git.kernel.org/sudeep.holla/c/a3c46c82d8a2
--
Regards,
Sudeep


Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0A336224B04;
	Thu,  1 Jan 2026 17:55:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767290132; cv=none; b=BrKogaWzZrHXh1vJ4AwmoM/LE4wQL8cnINMQlxcL5LcFP6iUw7VEMvQpwAwE9Y1lVImKwoTGH3jXspa3OfbbBSOJW2i+zJTnjRZCiE5ClEQWb8BdDbNkqklVwDZjb62E4dIph0dG9IIvyVWz1GWC+E7VhtoRH51FDlkVb70LeTo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767290132; c=relaxed/simple;
	bh=tB9GMwqkkTudL+AF6SXjYSYArjuf9HELV3D6SEGM088=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=R692/EYgE9m3cLtbXN1n6g1pI2ZRm5vWYlZMjJuV/W59+ciGjZggY95qTntdNbnDdHoVH08kMctFYh9ccuj9yzzVMWgmm85ueGeW3ARL/R+Zia0iAb379CGTTe6tGDp7TXRZoVgP8Q1m6SlBbmlRyivsig18n+zfyq+U/SyFu74=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=foss.arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 8EE5C497;
	Thu,  1 Jan 2026 09:55:23 -0800 (PST)
Received: from usa.arm.com (e133711.arm.com [10.1.197.51])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 52A1E3F63F;
	Thu,  1 Jan 2026 09:55:29 -0800 (PST)
From: Sudeep Holla <sudeep.holla@arm.com>
To: Cristian Marussi <cristian.marussi@arm.com>,
	Ally Heev <allyheev@gmail.com>
Cc: Sudeep Holla <sudeep.holla@arm.com>,
	arm-scmi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Dan Carpenter <dan.carpenter@linaro.org>
Subject: Re: [PATCH] arm: fix uninitialized pointers with free attr
Date: Thu,  1 Jan 2026 17:55:26 +0000
Message-ID: <176729006197.117434.8934138942645805963.b4-ty@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251105-aheev-uninitialized-free-attr-arm-v1-1-f7b6cb5d3361@gmail.com>
References: <20251105-aheev-uninitialized-free-attr-arm-v1-1-f7b6cb5d3361@gmail.com>
Precedence: bulk
X-Mailing-List: arm-scmi@vger.kernel.org
List-Id: <arm-scmi.vger.kernel.org>
List-Subscribe: <mailto:arm-scmi+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:arm-scmi+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

On Wed, 05 Nov 2025 19:37:52 +0530, Ally Heev wrote:
> Uninitialized pointers with `__free` attribute can cause undefined
> behaviour as the memory assigned(randomly) to the pointer is freed
> automatically when the pointer goes out of scope
> 
> arm doesn't have any bugs related to this as of now, but
> it is better to initialize and assign pointers with `__free` attr
> in one statement to ensure proper scope-based cleanup
> 
> [...]

Applied with $subject changed to sudeep.holla/linux (for-next/scmi/updates), thanks!

[1/1] arm: fix uninitialized pointers with free attr
      https://git.kernel.org/sudeep.holla/c/78b74136affd

--
Regards,
Sudeep


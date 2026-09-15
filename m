Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DB4E3DEFFC;
	Tue, 15 Sep 2026 17:23:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789492988; cv=none; b=XJi1adu6/99L5QTEx4NOHx5qFYNx1XKVrtyfuJCKyigymi0U7uB4QWzz4kd++kJkhtQUzejsMbLooyXEtkCHVUhhtm8n5jPsDzmtV+RmYB9CZt58dmzQjITH4xh5LF+bgGrT69mOWCtyrn/Heg2f1yozYTM1WjHsBST3t6+HArU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789492988; c=relaxed/simple;
	bh=jec2s0CaY0swH11behs+57ph/6bZon+o04zD9lSBsD0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=hwPhSYAqOSx7GIskmD064COOOkDQojwEe6/o2AJxVafsISgaYi0jVzNsKF8xsd4fy89hGge9Xh8GIIuoMjRaDQ5JqILGRRpwEStsyp43LA65kZB/cYloo32M5iqxIvXvMltXz2IT13TC2NeEgwAUfBNsvwRUxQ3t7MGbZtLlZnE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Kx5V19CW; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Kx5V19CW"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CBC381F000FF;
	Tue, 15 Sep 2026 17:23:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789492986;
	bh=YbxCm84oFy10egaK1eu/n39bvCZwRoUJXGeKOhPqLkU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=Kx5V19CWXjLMKxYCN/wNqCY6YFl5N/BmNIk92beOOPBlDUOFhqyjoKjYiVRIw3atI
	 MrrGoHScEGoum8kFw7d5LrP5cdiV+Y4f7vM6zPUuipNFxoNFP5M+k+jbg1R5LRqfzb
	 etZjG/3MSHHSzcgdH91HU+9/wbp+EfyLVy61uRnGMotomNGcrE9Kqy/aAJry4nm8is
	 JwlwCbbAneqfPRGZdiXYxXdvAsJqGscBQ5b2Ir/gq1AEDkkOk7elkv2gFqyDlqigYI
	 O3tLLHFyBrM/vaeBPTjbXunjwXVZZKRHRueDnn5Ixm/MTaOlTRzAd72ltwfU7p4BUr
	 FN+zJHeT9cibQ==
From: Sudeep Holla <sudeep.holla@kernel.org>
To: linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	arm-scmi@vger.kernel.org,
	Cristian Marussi <cristian.marussi@arm.com>
Cc: Sudeep Holla <sudeep.holla@kernel.org>
Subject: Re: [PATCH] include: trace: Use string helpers in msg_dump trace events
Date: Tue, 15 Sep 2026 18:23:01 +0100
Message-ID: <178949289369.3921534.10158871187589954451.b4-ty@b4>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260808191234.402312-1-cristian.marussi@arm.com>
References: <20260808191234.402312-1-cristian.marussi@arm.com>
Precedence: bulk
X-Mailing-List: arm-scmi@vger.kernel.org
List-Id: <arm-scmi.vger.kernel.org>
List-Subscribe: <mailto:arm-scmi+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:arm-scmi+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

On Sat, 08 Aug 2026 20:12:34 +0100, Cristian Marussi wrote:
> Use proper available ftrace macros to handle tag strings of variable size,
> to avoid wasting space using statically oversized arrays while risking to
> expose stale stack data when such array is not properly padded when filled.

Applied to sudeep.holla/linux (for-next/scmi/updates), thanks!

[1/1] include: trace: Use string helpers in msg_dump trace events
      https://git.kernel.org/sudeep.holla/c/7d5b79cd7d59
-- 
Regards,
Sudeep


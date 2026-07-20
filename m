Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F79F3ACA68
	for <arm-scmi@vger.kernel.org>; Mon, 20 Jul 2026 10:31:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784543519; cv=none; b=fU0hxJhySSLtoQAzj6ddZpRIydTpJccaKr+YfHmib+RU+FD9kI4SOanR6FGOF5+stxOcD1mfLkNDDCHjCF+s5cHEpVGBMEYqQ09Jyt9rmBZvbEvqks98Ou2U4U+VFmQXlCzUuQtyL28O5UPI+EKc5n7Tpmy+zSQrml0O81dVR28=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784543519; c=relaxed/simple;
	bh=lzg7/5e8O4HupOH6TnAbhFF6pVoMjrnWcPNJSkY9wLc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=GdeRe6Pj5jFabKqhvC244PnYGWu+vD/Zl5o1Foh/xC7MCk10iQBy27hqFiXa7Zeycf1bQSaHkCV686/i3/m3qcVpKTRialpwAZ3Wfh567YQttl8E5ZnTCcewOBLYXknqngwN1KvTQEC4yFlOkqRD4dbuRXuTqPufaipEEFqK74s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=U6dP3lM3; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="U6dP3lM3"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 55EFF1F000E9;
	Mon, 20 Jul 2026 10:31:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784543517;
	bh=+GIYhUm7qP4hDO//mI2sDZ/wC78YEFXTr75rid4St6w=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=U6dP3lM3+G8gII1NAY3/C/ISB7tM8Qlo1n5nKIzpizl/GOX3zC+6AUlTGWbWqYU5g
	 8fpderYjqJ9OL5b5SiFvke0Y6Oc/lmbYM+4ZarLNU2n7D9m4fMcN310JPW623jBwMW
	 HoKqgk7xvd1HQl/QOmWbdhTRBD1im2Ut5eV5N5IDJAn/ZG6WS9CVyG5SLjE5vePEdq
	 Y2+/EpsRrhY4Sl8VSrDLEWoC6nim58taCPAJhRSnCFmcxm3ai+88cSOeeAWljvK01y
	 L14Rq3u7k/V5DBYQtEZ8msFgSnmQS1rbqHTnkWvqm1ArRMl6Ta1lfKr9T53qeUXqA+
	 RAN6/1pe/fWNg==
From: Sudeep Holla <sudeep.holla@kernel.org>
To: arm-scmi@vger.kernel.org,
	Rosen Penev <rosenp@gmail.com>
Cc: Sudeep Holla <sudeep.holla@kernel.org>,
	Cristian Marussi <cristian.marussi@arm.com>,
	Kees Cook <kees@kernel.org>,
	"Gustavo A. R. Silva" <gustavoars@kernel.org>,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCHv2] firmware: arm_scmi: simplify some allocations
Date: Mon, 20 Jul 2026 11:31:49 +0100
Message-ID: <178454310144.1349369.3756806387017332522.b4-ty@b4>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260630204719.334211-1-rosenp@gmail.com>
References: <20260630204719.334211-1-rosenp@gmail.com>
Precedence: bulk
X-Mailing-List: arm-scmi@vger.kernel.org
List-Id: <arm-scmi.vger.kernel.org>
List-Subscribe: <mailto:arm-scmi+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:arm-scmi+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

On Tue, 30 Jun 2026 13:47:19 -0700, Rosen Penev wrote:
> Use flexible array members to combine allocations and remove kcalloc
> usage.
> 
> Add __counted_by where appropriate for extra runtime analysis. Move
> counting variable assignment after allocation before any potential array
> access.
> 
> [...]

Applied to sudeep.holla/linux (for-next/scmi/updates), thanks!

[1/1] firmware: arm_scmi: simplify some allocations
      https://git.kernel.org/sudeep.holla/c/9c62bb72a5d0
-- 
Regards,
Sudeep


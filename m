Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BEA4335F17A;
	Sun,  8 Mar 2026 12:57:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772974674; cv=none; b=pAGqYLHFH1dT04/WwUXptn9LFV+2UegCXZHP8fih+YhTY964VOLTHCc4uqZ4gpTUtXzXR7sBMoBtnwjwoDOXHEgMnWq9hDXj+nB7mso8yrc4wMFFhSSx/HwxhZfEsG9mP8XANBL3b7RXUQiILl5xZbeGqblokLaebzA70pQX/Us=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772974674; c=relaxed/simple;
	bh=qmerQN/MNFLleJjYoj2ghmUyJS/la0Y4En0Gjn2rpY8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=cbg87uTbly18QEOZi0xfSm6gfWyQX0vHnLIcjq6cnmL/2shmC39GBsc+LsWUbl1e+s5vFrjwVzb9pLHtJqCorZa/HsEsaRT2iV1pVH5cZ/MI6AZfmIz3bYYl1OuxFHd/d8e+2/6gqBdzVLbhPFHsNes+SlqCA4boyEMtIA4uUdc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YE7i7Do6; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YE7i7Do6"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 17629C116C6;
	Sun,  8 Mar 2026 12:57:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772974674;
	bh=qmerQN/MNFLleJjYoj2ghmUyJS/la0Y4En0Gjn2rpY8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=YE7i7Do6PwV0OjY9PQBqV7fBMsfuno9wQwaJzINRw/vBh+USU/V+a/xl4BRnWudNz
	 SQV9dgD2E2V5W65fgJFmX1aTySb0uZr/G8J+V/VgCINuAmzPKoWpPTIsuu7D02ijmp
	 fe4zle+Zv13vqlwYDxKAInufA1FwnhCKO3Cv001T2knPUSJHZLY4LETmIccmUrGnW9
	 ATCUa55rkjhtfvAHhA2xFBWgmrXg8wlapgpQhbEi6hClXs+9ZsQstPiBvadMh0pgDr
	 pbXrj3anI2ER7pDLWmjpFacg9tQ+CXWZkg+lefWT717gg6j7reoVxbMBtlGYPL7e71
	 W9PWo04UWqefw==
From: Sudeep Holla <sudeep.holla@kernel.org>
To: Cristian Marussi <cristian.marussi@arm.com>,
	Sudeep Holla <sudeep.holla@kernel.org>,
	Felix Gu <ustc.gu@gmail.com>
Cc: arm-scmi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] firmware: arm_scpi: Fix device_node reference leak in scpi_probe()
Date: Sun,  8 Mar 2026 12:57:46 +0000
Message-ID: <177297460000.1087540.1235389041649410289.b4-ty@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260121-arm_scpi_2-v2-1-702d7fa84acb@gmail.com>
References: <20260121-arm_scpi_2-v2-1-702d7fa84acb@gmail.com>
Precedence: bulk
X-Mailing-List: arm-scmi@vger.kernel.org
List-Id: <arm-scmi.vger.kernel.org>
List-Subscribe: <mailto:arm-scmi+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:arm-scmi+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

On Wed, 21 Jan 2026 21:08:19 +0800, Felix Gu wrote:
> In scpi_probe(), if of_match_node() fails and the function returns
> early, the shmem reference is not released.
> Use __free(device_node) scope-based cleanup to automatically release
> the reference when the variable goes out of scope.
> 
> 

Applied to sudeep.holla/linux (for-next/scmi/fixes), thanks!


[1/1] firmware: arm_scpi: Fix device_node reference leak in scpi_probe()
      https://git.kernel.org/sudeep.holla/c/879c001afbac

--
Regards,
Sudeep


Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795096523;
	b=yFykgyskwj424rWyPIvac4LWQZ82tTQQh+xRL/lcltl8aoyK4S90mDAcI3RE6HfW40i7
	 AEwmL4Nuwd6rl+w0DPDyZTYZZ4L7mFtk+h2A7aevQEyoIM+6u/ee++f+mlI4ThwRlEn3D
	 VC0tT1qnHxYRleu0VjGoxdovI8wx/aHUtiakBVW6Jec/iEfDGPzj6iEiJhkzeqedvtaEp
	 8tDPpX1VHNO5yn9Jiz6c9B8LxJDVaqzgDRSWO+liY7DFDZVMsN03Sjh8meJ5tr8+5i3W0
	 rNo9GTiKE/DTyqw03TdUYlX5jkzPuBUB6HOmmCG3xMBCDQY+787QT6ULdO3BjAkdw2w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795096523;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=6OcUjZbeewnbF2w76nF4BzgSzm7/aBPsfjvddk/XGKE=;
	b=ASWcSJAJUpBJhpGoma/tCgn26k710NTLGKwUd6Lr/olWWoJUriitOaFTwAB3F1XPk+Wa
	 SCKB0R+BdM+t5iKe/oyA6EbVLHxWpjHFtWxPWbEMriRmnFNvZrct6f/2xyvLw/QCQqkIQ
	 dTmsnmyfJbkMIVO/oJFFOMV/MnmMLq2PzwAzrIzHwojQm0weyoKZs8vHF7PHcmogL5nMG
	 LvjUUCg7HQ7sqTNtLHaSf/sUELkfeRx+fjyWV3BgCzeWMS3DmvZpu1SRHYSU+G78fHYSE
	 +vMBXNUtC8SggKbjXt8iAsSu4uF+5IUf2w/y5B+sRB20YQbK7gJOiVABnVu+lFPaJpQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=hMxP0eev;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B38E4606A320;
	Thu, 19 Nov 2026 13:55:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=hMxP0eev
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 41FF31F000C5;
	Thu, 19 Nov 2026 13:55:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795096523;
	bh=6OcUjZbeewnbF2w76nF4BzgSzm7/aBPsfjvddk/XGKE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=hMxP0eevmtddEQR0d36kdAvQSPcV0SSMj4z4xfc9UZDgUfebbXO/cYiaJ7S8QZr4N
	 p/rouCuF9juLTu0uXk9HyLVl9/3G+rogh9UZTz+yjzTxp/irXWYeFvZhDioX5aaXEs
	 zl1iaU/RDOzlqbB/iBojpGux8uepI91KObo2+KT7VnuY47brIAb0SXwBLM/jYWluNx
	 E4nO8WoJvR0HRyj9CubDbfvOo18nG8LxbGkSEPvXpsPw9CFxYxwqOAEtf98tEjzxEj
	 5jiXYRqeUMQPXiOcC6Nn4k0rz3G4x65UXljm6zYAQdCIpolkkzQRPcJdLXXE2szfR6
	 3AUNSthC7V3qw==
From: Sudeep Holla <sudeep.holla@kernel.org>
To: linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	arm-scmi@vger.kernel.org,
	Philip Radford <philip.radford@arm.com>
Cc: Sudeep Holla <sudeep.holla@kernel.org>,
	cristian.marussi@arm.com
Subject: Re: [PATCH 0/2] firmware: arm_scmi: fix shared memory and protocol table
Date: Thu, 19 Nov 2026 13:55:17 +0000
Message-ID: <179509633637.1254008.1621228754406865513.b4-ty@b4>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261116123153.2672631-1-philip.radford@arm.com>
References: <20261116123153.2672631-1-philip.radford@arm.com>
X-Mailing-List: arm-scmi@vger.kernel.org
List-Id: <arm-scmi.vger.kernel.org>
List-Post: <mailto:arm-scmi@vger.kernel.org>
List-Help: <mailto:arm-scmi+help@vger.kernel.org>
List-Subscribe: <mailto:arm-scmi+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:arm-scmi+unsubscribe@vger.kernel.org>
List-Owner: <mailto:arm-scmi+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

On Mon, 16 Nov 2026 12:31:51 +0000, Philip Radford wrote:
> Here is a short seires to address two SCMI bugs reported by Sashiko.
> 
> Patch [1/2] slightly alters logic to avoid using an uninitialized
> reg_io_width value when selecting shared memory accessors.
> 
> Patch [2/2] handles missing SCMI protocol ID tables in registration and
> unregistration paths.
> 
> [...]

Hi Philip,

Please avoid using bug report as subject line also. I have rebased the
change on for-next/arm_fw/updates as I have moved files. Also I did
rewrite a bit of commit message and kept !id_table check consistent
across register and unregister. Please check the branch and shout if
you disagree.

Applied to sudeep.holla/linux (for-next/arm_fw/updates), thanks!

[1/2] firmware: arm_scmi: uninitialized reg_io_width in shmem_setup_iomap()
      https://git.kernel.org/sudeep.holla/c/8db620083cf2
[2/2] firmware: arm_scmi: null pointer dereference in scmi_protocol_table_register()
      https://git.kernel.org/sudeep.holla/c/99e55aac0f9c
-- 
Regards,
Sudeep


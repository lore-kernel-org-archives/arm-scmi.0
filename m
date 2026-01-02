Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 683998634C;
	Fri,  2 Jan 2026 11:21:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767352895; cv=none; b=uoy+f2+aX5BplsQ6m09DMgy991Kerq2+tpavdYJ/FmVunSMolLE7im50bTTifT73tSWKKl16PnO3j9+WOON26e63vGMHSYcDAxh+hv07zI64FZN2Jj9dDfsVXmeT8+j/arpEj2cJg1EtQR4O54jwy3hg3hi5kzwyTU52gDjx9n0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767352895; c=relaxed/simple;
	bh=MU2G72mF4bTfMUXghJhJUUPVquuGWMYxe7+PoSdCvys=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=WZT/HvbSON/1c9BXPsRmnnOnkB64zjRoZXFtANa3Al1HT1o27wIsiz3BliTibe25jX+071TM2sOwdGm7Ulois7KOFFR1AKJfOJ6mwjIoLmD9Z0O/diz6JTFI5sDxCmEnvrEdLaYmgFo1UQXggbmnopSk66O4m8mBpx9z9xS1OuM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=foss.arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E78E7497;
	Fri,  2 Jan 2026 03:21:25 -0800 (PST)
Received: from usa.arm.com (e133711.arm.com [10.1.197.51])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id A4EA23F63F;
	Fri,  2 Jan 2026 03:21:31 -0800 (PST)
From: Sudeep Holla <sudeep.holla@arm.com>
To: linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	arm-scmi@vger.kernel.org,
	Cristian Marussi <cristian.marussi@arm.com>
Cc: Sudeep Holla <sudeep.holla@arm.com>,
	philip.radford@arm.com,
	peng.fan@oss.nxp.com
Subject: Re: [PATCH 0/2] Rework protocol version negotiation core logic
Date: Fri,  2 Jan 2026 11:21:25 +0000
Message-ID: <176735282490.185874.1375589507295412646.b4-ty@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251227164132.1311988-1-cristian.marussi@arm.com>
References: <20251227164132.1311988-1-cristian.marussi@arm.com>
Precedence: bulk
X-Mailing-List: arm-scmi@vger.kernel.org
List-Id: <arm-scmi.vger.kernel.org>
List-Subscribe: <mailto:arm-scmi+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:arm-scmi+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

On Sat, 27 Dec 2025 16:41:30 +0000, Cristian Marussi wrote:
> this small series rectifies the protocol negotiation logic employed by the
> core SCMI stack when trying to cope with newer unknown protocol versions
> advertised by the platform under any circumstances.
> 
> The existing protocol negotiation logic per-se was fine, but unfortunately
> the whole negotiation process was started at the end of the per-protocol
> initialization phase since it relies on the version querying performed by
> each protocol initialization logic.
> 
> [...]

Applied to sudeep.holla/linux (for-next/scmi/updates), thanks!

[1/2] firmware: arm_scmi: Rework protocol version negotiation logic
      https://git.kernel.org/sudeep.holla/c/0fac05fdd9af
[2/2] firmware: arm_scmi: Remove legacy protocol versioning logic
      https://git.kernel.org/sudeep.holla/c/24a0ffefe3f0
--
Regards,
Sudeep


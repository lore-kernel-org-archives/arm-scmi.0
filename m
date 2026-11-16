Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794832338;
	b=xWp5GoC09/jzCY9gA22q5QeedJzqcuB24HzWxlB3sJNWhGCG0MIOVT22SjtcXLamN/XG
	 b5juOd5bFeZ4UzJFhfVzddtkzm26qs9fwuWNyGVrnIyWS0C1MpI594kBJ0utNc/FTKqHZ
	 iL+JjOeMgW57mDYr+jSfMaY083iIvqqVrI/gE97Julm5s1yWC5L/GV5Tf36zEmFvz5cuP
	 AOcP7CI5LMFgcblxZaFzECWxX//abmud9iLG5SfP5dvJyXgtJia8zaI6+zOTZabYGMGCd
	 1qWjibg2RrZAOQvBHucPnZAGEcjLqZAJvL7E6pd1BDtjz5NF18JyWzx+Li4V4NDYfTQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794832338;
	h=DMARC-Filter:Received:Received:DKIM-Signature:From:To:Cc:Subject:
	 Date:Message-Id:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=7MSC8tyJcCP6adu00VgPv2n65XdQvdHW2V0HxWy2VOE=;
	b=5kHDmPeei85CG021XeeRa8aRvKZU2ZtpazPZ1T97NMEv2IkH0cLTdF8bnDVVTupS777e
	 UrGPwi9wOZ6n9JmZ5pLXY6lBSEEi7jXh2354eyJT0rKOH5/sPUMGvzZ3doRGOE45hWtwa
	 RBuInqEJeMKe6hnPfvJwT8/2UpDjuSsilL/bXpuhV4VoXp0RzPJbT8KW45x74RYvya6RU
	 PPPMH6Q9nn3MGgn87JR5Z5cLBKXWNy8QFX+FQIm6m0hFEKzT4s6Tlum+phWDgef4ADSMp
	 hjNTUx6mt4zBjBXqbc30AfyvXPsTEtTRm9rIwfOkH/R1DN2CdIH/qZ+d5s1HxTHJ63Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=arm.com;
	spf=pass smtp.mailfrom=arm.com;
	dkim=pass header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=Wur+ts2i;
	arc=none smtp.remote-ip=217.140.110.172
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C9E5A606A31C;
	Mon, 16 Nov 2026 12:32:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C9E5A606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=Wur+ts2i
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 585DE1713;
	Mon, 16 Nov 2026 04:32:14 -0800 (PST)
Received: from e121740.manchester.arm.com (e121740.arm.com [10.33.8.69])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 797313F632;
	Mon, 16 Nov 2026 04:32:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1794832337; bh=fsRFKdJGXNGJRXLOPXiRq+GCrSCtMtkgn4mHP2tFsoA=;
	h=From:To:Cc:Subject:Date:From;
	b=Wur+ts2iopVUE3OSA4n29TFEhbXooS8LaNgpIre/Mc70GVQjMF34iZTf8xCFVzWp+
	 yZ6n/Nxetq7aXUkGsIWLpRuSu9xf0zcl5Czc9+iNy+DJCXuLVuD31WL+iBTV6X3aHq
	 4+CjaboBygCmj+u+VXT9fofLfCz2tDJKp9yno8Dw=
From: Philip Radford <philip.radford@arm.com>
To: linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	arm-scmi@vger.kernel.org
Cc: sudeep.holla@arm.com,
	cristian.marussi@arm.com,
	philip.radford@arm.com
Subject: [PATCH 0/2] firmware: arm_scmi: fix shared memory and protocol table
Date: Mon, 16 Nov 2026 12:31:51 +0000
Message-Id: <20261116123153.2672631-1-philip.radford@arm.com>
X-Mailer: git-send-email 2.34.1
X-Mailing-List: arm-scmi@vger.kernel.org
List-Id: <arm-scmi.vger.kernel.org>
List-Post: <mailto:arm-scmi@vger.kernel.org>
List-Help: <mailto:arm-scmi+help@vger.kernel.org>
List-Subscribe: <mailto:arm-scmi+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:arm-scmi+unsubscribe@vger.kernel.org>
List-Owner: <mailto:arm-scmi+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi,

Here is a short seires to address two SCMI bugs reported by Sashiko.

Patch [1/2] slightly alters logic to avoid using an uninitialized
reg_io_width value when selecting shared memory accessors.

Patch [2/2] handles missing SCMI protocol ID tables in registration and
unregistration paths.

Based on V7.4-rc2.

Thank you,
Phil.

Philip Radford (2):
  firmware: arm_scmi: uninitialized reg_io_width in shmem_setup_iomap()
  firmware: arm_scmi: null pointer dereference in
    scmi_protocol_table_register()

 drivers/firmware/arm_scmi/bus.c   | 10 ++++++++--
 drivers/firmware/arm_scmi/shmem.c | 11 +++--------
 2 files changed, 11 insertions(+), 10 deletions(-)

--
2.34.1


Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8AD2619AD71
	for <arm-scmi@vger.kernel.org>; Tue, 22 Oct 2024 11:55:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729598143; cv=none; b=WMbcH3s5CQdfzuTXvkDTV19pr+Pa9xoTysyfn8yE3nY4AdtOVQKeQTG+6+/tQrVsNTM2Z/vXyIW8kOzBC37cZ/5zzcbeltaBgBcCUtfODTOqfpKjPNUhGFG4upR2Su3kR3npG69nt4q/D3ycABPMky2yC8vbhWPxk7YNkUBgrho=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729598143; c=relaxed/simple;
	bh=7uxa91sLETqFIODNwlmSCy6cnHm5zxrbLmXY83hjqO0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=DkaPZ93TvCb5IdQ3yQsEFzx+uEENwEcAVQucPaRldMkKgzCqEqk//pCXhcDRDPGzCELaTE6gJg0fHU7eQKs8WXHm5J5ujzqHp47lnzeXiTglR0D9E8q9Zqz5m9VO9p/xBv+2/l27XE3OaS7eNxkzzJh7o+3wL+85Cm6Wh4bp43M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=sjhwJOue; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=oGyegs1l; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=sjhwJOue; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=oGyegs1l; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="sjhwJOue";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="oGyegs1l";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="sjhwJOue";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="oGyegs1l"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id CCFFE21EE2;
	Tue, 22 Oct 2024 11:55:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1729598139; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=IImWMTMFibvOLJWDD+27+TJeBhZveYmaZIaQq+4whBI=;
	b=sjhwJOuejed5CUgBCa4hAmQhKhhIWsFWaTGEpDlTdKvDeFiICpKFgmP6AbMKxPEzuieYyc
	lRkCBemxxb0oXMdn9CbM17Tx6EQLcLQj4Xo8YPW0BUZH/SbizC9tW/6kNL1nlIB6Uk5ZM/
	559PuLfcNdIcDl/LogIs/X/r1Ntvr9k=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1729598139;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=IImWMTMFibvOLJWDD+27+TJeBhZveYmaZIaQq+4whBI=;
	b=oGyegs1lPILt5uhI003YHFsx+lFq2PuFck7abls3/EafWI2NLBtL12k7BVKsqO+NPaxxtA
	1d2rARjZpS48KKAA==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1729598139; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=IImWMTMFibvOLJWDD+27+TJeBhZveYmaZIaQq+4whBI=;
	b=sjhwJOuejed5CUgBCa4hAmQhKhhIWsFWaTGEpDlTdKvDeFiICpKFgmP6AbMKxPEzuieYyc
	lRkCBemxxb0oXMdn9CbM17Tx6EQLcLQj4Xo8YPW0BUZH/SbizC9tW/6kNL1nlIB6Uk5ZM/
	559PuLfcNdIcDl/LogIs/X/r1Ntvr9k=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1729598139;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=IImWMTMFibvOLJWDD+27+TJeBhZveYmaZIaQq+4whBI=;
	b=oGyegs1lPILt5uhI003YHFsx+lFq2PuFck7abls3/EafWI2NLBtL12k7BVKsqO+NPaxxtA
	1d2rARjZpS48KKAA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 7619613AC9;
	Tue, 22 Oct 2024 11:55:39 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id KBWAGruSF2dmPwAAD6G6ig
	(envelope-from <jdelvare@suse.de>); Tue, 22 Oct 2024 11:55:39 +0000
Date: Tue, 22 Oct 2024 13:55:37 +0200
From: Jean Delvare <jdelvare@suse.de>
To: arm-scmi@vger.kernel.org
Cc: Sudeep Holla <sudeep.holla@arm.com>, Cristian Marussi
 <cristian.marussi@arm.com>, Shawn Guo <shawnguo@kernel.org>, Sascha Hauer
 <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>
Subject: Odd dependency on ARM_SCMI_PROTOCOL
Message-ID: <20241022135537.4a93c5cc@endymion.delvare>
Organization: SUSE Linux
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.34; x86_64-suse-linux-gnu)
Precedence: bulk
X-Mailing-List: arm-scmi@vger.kernel.org
List-Id: <arm-scmi.vger.kernel.org>
List-Subscribe: <mailto:arm-scmi+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:arm-scmi+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Spam-Score: -4.30
X-Spamd-Result: default: False [-4.30 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	RCVD_TLS_ALL(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	HAS_ORG_HEADER(0.00)[];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[arm.com,kernel.org,pengutronix.de,gmail.com];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_EQ_ENVFROM(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	TO_DN_SOME(0.00)[]
X-Spam-Flag: NO
X-Spam-Level: 

Hi all,

I noticed that the following dependency construct is used several times
throughout the kernel tree:

depends on ARM_SCMI_PROTOCOL || (COMPILE_TEST && OF)

Maybe I'm just missing something as I'm not familiar with SCMI, but I
can't really make sense of this. Considering that ARM_SCMI_PROTOCOL
does not depend on OF, I do not understand why it would be OK to build
these drivers under ARM_SCMI_PROTOCOL without OF, but if test-building
under COMPILE_TEST instead, then OF would suddenly be needed. Can
anyone explain the logic?

Considering that ARM_SCMI_PROTOCOL can be enabled through COMPILE_TEST,
and OF is now available on architectures, I think this dependency is
needlessly complex and these drivers could simply use:

depends on ARM_SCMI_PROTOCOL

What do you think?

Thanks,
-- 
Jean Delvare
SUSE L3 Support

Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795102911;
	b=O0jLsantnidAQqNBt9U3MTk1ELmszEvFS0+QloydaWH0x0DgIQJ7jxtTRcqMwUXnvoV3
	 YtF5vgRunoGil0FO0ygvZeNxkVXzVyUpEvnU0Y+ULVDibcZe3oYrSwRRKTwxd9zRZPH7d
	 cPDxqN9JaZgeHSV6lfoNrh69GKYbg2+XbtXTu9qeRRXP5rKRmoYqdDT7++6Qse4nNI+9o
	 +YipgRL015HDfF5FLXHQRc8mL+GzbMWOhkjqoF60uJRf7nTOlufSP7gNJPXZhqE7Ro4pA
	 iwGH3mnVZvvjYt8aUtZC26ulOUxzM4f8MrOkOv6AvTm5cwfa/6fluz2HcEUE0zbEZFw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795102911;
	h=DMARC-Filter:Received:Received:DKIM-Signature:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=mu1GS7zq5v7jKNMibYP5uLcrR4u8HWZVh4sY6q3AL0k=;
	b=2aOVri+9/ak4u7agTDjeeK3kfzczwpUynuOHy/7bvy0QQC7AcqAM46HL/Eu9lsDDRHsP
	 98Vk0hjzdOi9mdrvUImSxqPfzbcswe5biwqz7ykqttdS3LSyF/pUrkRs0YU2t8CvAwpf8
	 F6/HsfACkLrDnvPgQLhbhBdV+xUZb18GxbhV8/++TfHfNY8PO7l03NwwRiXonrwfmqF3w
	 6ZMKQ66+VQ6PXJRj7AY52QCb2aHCxdsfzx8fTXg8DxrAvyI9L8DrX5fwh8pY7A0N62oki
	 cmKIgD6ao+cSmnqmQ0J1Eb1EbLibkuiwVB2Ti8X2QYYM+Sg2XLN56ShXYB3r+rLtRsw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=arm.com;
	spf=pass smtp.mailfrom=arm.com;
	dkim=pass header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b="U9cA8/Ez";
	arc=none smtp.remote-ip=217.140.110.172
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CF886606D6D3;
	Thu, 19 Nov 2026 15:41:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CF886606D6D3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=U9cA8/Ez
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 7E6B31575;
	Thu, 19 Nov 2026 07:41:40 -0800 (PST)
Received: from e121740.arm.com (e121740.arm.com [10.33.8.69])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 8DEC93F882;
	Thu, 19 Nov 2026 07:41:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1795102903; bh=NlRRdYCCJGm99z73/IEGFJszgoLZZ9ZAh8xLUpvPMNU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=U9cA8/EzyyfEhUEXjcHKkfM1oReVxnoPxYcO1CUKzLYOU5C8Ni0vDwbtS8QsL2dwV
	 ninSekApZxfIgtqV5OqNOxuPPVNrU/kTqsXZM2Zvl+YWTD8fuwyEUxVkv5YwbVC32l
	 kqSiWkDHU8eCcTQ1gbJj5e7jiplJektFVP0Pbe3c=
Date: Thu, 19 Nov 2026 15:41:33 +0000
From: Philip Radford <philip.radford@arm.com>
To: Sudeep Holla <sudeep.holla@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	arm-scmi@vger.kernel.org, cristian.marussi@arm.com
Subject: Re: [PATCH 0/2] firmware: arm_scmi: fix shared memory and protocol
 table
Message-ID: <av8YrXYoCi+ov/bK@e121740.arm.com>
References: <20261116123153.2672631-1-philip.radford@arm.com>
 <179509633637.1254008.1621228754406865513.b4-ty@b4>
X-Mailing-List: arm-scmi@vger.kernel.org
List-Id: <arm-scmi.vger.kernel.org>
List-Post: <mailto:arm-scmi@vger.kernel.org>
List-Help: <mailto:arm-scmi+help@vger.kernel.org>
List-Subscribe: <mailto:arm-scmi+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:arm-scmi+unsubscribe@vger.kernel.org>
List-Owner: <mailto:arm-scmi+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <179509633637.1254008.1621228754406865513.b4-ty@b4>

On Thu, Nov 19, 2026 at 01:55:17PM +0000, Sudeep Holla wrote:
> On Mon, 16 Nov 2026 12:31:51 +0000, Philip Radford wrote:
> > Here is a short seires to address two SCMI bugs reported by Sashiko.
> > 
> > Patch [1/2] slightly alters logic to avoid using an uninitialized
> > reg_io_width value when selecting shared memory accessors.
> > 
> > Patch [2/2] handles missing SCMI protocol ID tables in registration and
> > unregistration paths.
> > 
> > [...]
> 
> Hi Philip,
> 

Hi,

> Please avoid using bug report as subject line also. I have rebased the
> change on for-next/arm_fw/updates as I have moved files. Also I did
> rewrite a bit of commit message and kept !id_table check consistent
> across register and unregister. Please check the branch and shout if
> you disagree.
> 
> Applied to sudeep.holla/linux (for-next/arm_fw/updates), thanks!
> 
> [1/2] firmware: arm_scmi: uninitialized reg_io_width in shmem_setup_iomap()
>       https://git.kernel.org/sudeep.holla/c/8db620083cf2
> [2/2] firmware: arm_scmi: null pointer dereference in scmi_protocol_table_register()
>       https://git.kernel.org/sudeep.holla/c/99e55aac0f9c

Noted with regards to the subject line, and I agree your ammendments
look cleaner.

Regards,
Phil

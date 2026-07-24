Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 404F141D226
	for <arm-scmi@vger.kernel.org>; Fri, 24 Jul 2026 09:33:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784885630; cv=none; b=Y0tt3+V1FkTP3h5DDASBbMkVGkUwZNIahx7BDP+4FpVbdhit4+S+Xiue2m/HxxBBVLfT22UAePvyYQs1nzDDRuZDtUgXsFHf5sCJtvkYa2j8Y7vMIfoDT9H+rvOb4L+/Or+Ws80GXq7UUf6eXm8Wh5ij0BP+bE+/T7kMTVKBjPw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784885630; c=relaxed/simple;
	bh=+vP+RWul1HkE7SDwgZHVSBwzUhMiNT/I353yQj+eQkU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=CSXi+iarKFPsUvartCIuiaF+RkyulOdJRTO7/RcnB+Gjqz69Or9PvIs3g0nNk5ZXp5JwgeoceWBzoCw/PaJVdfb4wOhgLieA79SOOQhkilNBkBtxM/oQVD7/bfbLI/weZPl2iSmSnSYx1hFPPE/Chc6sJ0KKN26PiPwII0GBOCU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GDda7O+w; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GDda7O+w"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A4A471F000E9;
	Fri, 24 Jul 2026 09:33:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784885627;
	bh=PtfCD7rb5QO4P/h/6eWSfrh0kaSPmIpDjzbAnfhNxkM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=GDda7O+wEZ81EaozM5gRovWq+RtY0kUukOgDamROaqOXqz/WQCIK9Bd7hV0c0xp0K
	 KxhKYgCs0GwxOkT3WlwPKUpdY/s4C9N96QL3gGf8XFs8MCTwfrC95HA1W14fir+31x
	 mORhDkCOMzuMDljM4/vGVdhWNBrJKzXq8cXVf46C9D0FjeYaUN+D5UzKwDsziqT9yY
	 N/a+1U774RDGCJ9X7fft4CTJciEHRsKBw4X7eeeuhui7q7AJSDUmG1I/uhYAPSnm/X
	 N3AZ0grjZ38K4q1Bg1t5EL/TdciGZ0nkozJSbZHsVU/+VaIxqqwZkER5BcxunDVv9X
	 IAVnp8/33q5Ig==
From: Sudeep Holla <sudeep.holla@kernel.org>
To: arm-scmi@vger.kernel.org,
	Sudeep Holla <sudeep.holla@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org,
	Cristian Marussi <cristian.marussi@arm.com>
Subject: Re: [PATCH 1/2] firmware: arm_scmi: Roll back partial protocol table registration
Date: Fri, 24 Jul 2026 10:33:42 +0100
Message-ID: <178488559184.2847802.3631237341330785871.b4-ty@b4>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260722173521.2184378-1-sudeep.holla@kernel.org>
References: <20260722173521.2184378-1-sudeep.holla@kernel.org>
Precedence: bulk
X-Mailing-List: arm-scmi@vger.kernel.org
List-Id: <arm-scmi.vger.kernel.org>
List-Subscribe: <mailto:arm-scmi+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:arm-scmi+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

On Wed, 22 Jul 2026 18:35:20 +0100, Sudeep Holla wrote:
> scmi_protocol_table_register() can leave earlier requests registered when
> a later entry in the same ID table fails. Each request retains a pointer
> to the driver's ID table, so a failed module load can leave a dangling
> pointer after the module storage is released.
> 
> Unrequest only the successfully registered prefix, in reverse order,
> before returning the failure. Leave the failed entry and the remaining
> entries untouched because matching requests can be owned by another
> driver.
> 
> [...]

Applied to sudeep.holla/linux (for-next/scmi/updates), thanks!

[1/2] firmware: arm_scmi: Roll back partial protocol table registration
      https://git.kernel.org/sudeep.holla/c/2224b622260b
[2/2] firmware: arm_scmi: Unrequest devices if driver registration fails
      https://git.kernel.org/sudeep.holla/c/9f7cd6a62aa7
-- 
Regards,
Sudeep


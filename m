Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793636201;
	b=qx/VXc4hToLhv+L6YFsRnY8G7AcltZHpibH00ZWXu91wCqB2fxEscPoO4jkzgl5FP6hn
	 HhLUoqn7SY6Nv/OClnxbbLEzWvoyIprh9ID9VafhZk8JxclU4ijNEoUJTHkL5GcsRUsPt
	 +/kx1A5+ThmaABQEAB16/eQNjZQh43aUm2GRKX3nk0fnYoQ0j6hBcxB5QSkvbOfebduNc
	 XULs0lPSyaMlLoEf7X78VX1g5N9gjIqKczBcZoqX9rK4u7dybIjoRt8GXzD+DSZiaAYv2
	 DE7URL7vsJ0JMtv9f7LuE6Qzgkp1OVTn0cOtfXDJoQwvLAwxtuye0GUzdk172KTdVuw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793636201;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=/d04P7S4R4uaa3tzPbK1YyRGjqH3Qefze+gmw7FCDXw=;
	b=QEuUubMe866GYJyWs536IZABCVuxLqRPjyMOWVMxTnWtHjaPIgBxOvdxxSqRhO6bAsNK
	 B2kWfskMp6VvSBQevzNDCbov0B5EBjKOAL2R9UGp/R5a9etRpBRVfCQuK5H3aGjmuHFmg
	 Pf2prF5ZTkGHOJ3AWasUrsYLK3AfNd0PSIO1t8oXAhoHl99O+5B85wXRml7pI/+SMU7Tl
	 TIAcZyVFsT5pgjmSfmECCbC5mB0gWDW56pikmvFLEIFLnU2AwFwH1dLdgz33q/+o8eASY
	 0Jd9xDdb8Slye2UHhHczM+fbeoJhrBAfRpkx3R0nOpjLb/YsHETeEEN3RNghpew+IrA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=kqBsiQ1Q;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC25F60716D9
	for <arm-scmi@vger.kernel.org>; Mon,  2 Nov 2026 16:16:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=kqBsiQ1Q
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C37A61F00A16;
	Mon,  2 Nov 2026 16:16:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793636200;
	bh=/d04P7S4R4uaa3tzPbK1YyRGjqH3Qefze+gmw7FCDXw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=kqBsiQ1QN6C3Vb4asC/cgub7kRSShib0CU07BdFzh9kqRijeGLE3yBjRX8K40f51v
	 JIHB00H3vViHslAlyEekWDDy0JnKksExBQcNmAgu+M7q0VeOSt++lYoBl2GQihBAbq
	 NorqKUjMHhaq3IKKGpLtV7dzDRfI3j8ELoMeM7Q4FjcLmpzx2l2LsebJ7UZSmgGDaI
	 URSH/XZKtYpiUask68RTD0zR7FyeudW3WentmA4PH5Z73lv0Vb4+lMgjezcqVvTj35
	 cyKt/bipZXEnH5OZA9dmtschflh7yNqxvzNUXIdZlt83z3m+8L5Hrn+wg61nYohGNU
	 IqU+PRKewHVeg==
From: Sudeep Holla <sudeep.holla@kernel.org>
To: linux-arm-kernel@lists.infradead.org,
	arm-scmi@vger.kernel.org,
	Sudeep Holla <sudeep.holla@kernel.org>
Cc: Cristian Marussi <cristian.marussi@arm.com>
Subject: Re: [PATCH] firmware: arm_scmi: Drop redundant ACPI configuration guard
Date: Mon,  2 Nov 2026 16:16:32 +0000
Message-ID: <179363613954.1025050.12993200940988359381.b4-ty@b4>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261026105510.1778073-1-sudeep.holla@kernel.org>
References: <20261026105510.1778073-1-sudeep.holla@kernel.org>
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

On Mon, 26 Oct 2026 10:55:10 +0000, Sudeep Holla wrote:
> Commit 98b9bfb659a9 ("ACPI: bus: Use acpi/acpi_bus.h without
> CONFIG_ACPI") makes the ACPI bus helpers and their stubs available
> through linux/acpi.h for all configurations.
> 
> Drop the local CONFIG_ACPI conditional around scmi_acpi_device_hid().
> ACPI_COMPANION() returns NULL when ACPI is disabled, so the existing
> "unknown" fallback preserves the current behavior.
> 
> [...]

Applied to sudeep.holla/linux (for-next/scmi/fixes), thanks!

[1/1] firmware: arm_scmi: Drop redundant ACPI configuration guard
      https://git.kernel.org/sudeep.holla/c/7f73b4cb4b3a
-- 
Regards,
Sudeep


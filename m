Received: from mail-qk1-f171.google.com (mail-qk1-f171.google.com [209.85.222.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D2021EBA07
	for <arm-scmi@vger.kernel.org>; Mon, 21 Oct 2024 17:20:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729531204; cv=none; b=RPqg/BYTbxSw8wqRuBVBWHKX6eauZJPHplpSH2phORsIeU71/zeEld9VONtFRdwJzO5Jh2mdV6ySJIT4cQQe3hfuNy/13rm84aZ7GNN5ldhNg286hTCjqT2QIDiwPq8TVtIDFmd6pqEVOYiiLnVOko/LVmq0KN8ZRxZ7I3JCJsA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729531204; c=relaxed/simple;
	bh=JWV/i5zojTJx6bQIp+jvd7rWWLcZj80OVaXS4jHHGyY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=RkGUPiXV1EOfaXT66qlk+NH9pQ3wMA8xhSyFhiAknS2uCZDdkp8BTarJW/sAWYqpqFQLpNPbM2580kHPhso8Vt5KWlzmGEK5DIjSlMbb1xWRDufKxWgfaGS56r/ZYU/p3sCpPyUhGks1sR7LpXxohn1R8Te6Md/afTMlavo+Fxk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=XIRXOy6o; arc=none smtp.client-ip=209.85.222.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="XIRXOy6o"
Received: by mail-qk1-f171.google.com with SMTP id af79cd13be357-7ac83a98e5eso382567585a.0
        for <arm-scmi@vger.kernel.org>; Mon, 21 Oct 2024 10:20:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1729531201; x=1730136001; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=ctC8fXiNy6wpA6bkFpNb4LVNQhiHNx14q8X5vVW7V5g=;
        b=XIRXOy6oAydS1qXZa732cGkR930q71diIsD25Olckg9wBWpTzltIEk9efDF710fWB5
         Y5I3anr87GIoa+rfmoR/8UuIQ9yHlY8kEWbcdM81p6VFZKOxFPxdkI3fkEo71XpkkFgJ
         HTQucAaYrMwUb47GvoAE04+69jiRIVrWhJmhE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729531201; x=1730136001;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ctC8fXiNy6wpA6bkFpNb4LVNQhiHNx14q8X5vVW7V5g=;
        b=JKA/xt1sxqJLvs4455YaH5vJdffWOjvJApi4Org6ZSsfTqda7j8wasFWKkFaOatdD7
         wiHDyvu0U8tc83x75uj34MIK1vesMNiH3zWl+fC23ohkz920MgwWVG37d7aM4umdPLXt
         fMeoU7QbgmODWbdz9KgI1+brMZ63/9qCOtQ+QixrrMUaODqovBD4uPtuK61+utwfyJzv
         kk7Sz5YdfHNo0jYt3VekUJHYTU8g1fTt8lScuyduG2RlV4CDTW2teTwOwP+OOaePuram
         bRhbb1tYac+kmRPGZbvPEuhZJcWZKdei4FO8fcMG9TyQwqn5Pss9cwywTE408F8D0yUH
         FUjw==
X-Forwarded-Encrypted: i=1; AJvYcCXyaX0Ri3inR94RUJ5LkPuecVTnyTmzNpmOgB5C5+9pZsvjH9eco1PKn2/gIzSBgyvQV6vv4I1xug==@vger.kernel.org
X-Gm-Message-State: AOJu0Ywgsq0PV6vbTbOT4YiJ3SDTWWF//lVTvuVy2O/xkz61fayVjmVx
	aN+Bz+cS5jFoKsb+hSD6y/uw32JitiDxFX/MuTnByuDrSqYLtK/j17TsfVaOFw==
X-Google-Smtp-Source: AGHT+IGzW2tSYa2m++C/zBRvZuTFeit4VPfjeqE7fUScjmZlnHGxWvynb3Yf5laqjfFCytvDFtou4Q==
X-Received: by 2002:a05:620a:4691:b0:7b1:4222:b385 with SMTP id af79cd13be357-7b175589eb5mr66421685a.11.1729531201315;
        Mon, 21 Oct 2024 10:20:01 -0700 (PDT)
Received: from [10.67.48.245] ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6ce008ac8e6sm19444216d6.17.2024.10.21.10.19.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 21 Oct 2024 10:20:00 -0700 (PDT)
Message-ID: <b5c0a524-51e0-4b65-8db5-c7416837351a@broadcom.com>
Date: Mon, 21 Oct 2024 10:19:57 -0700
Precedence: bulk
X-Mailing-List: arm-scmi@vger.kernel.org
List-Id: <arm-scmi.vger.kernel.org>
List-Subscribe: <mailto:arm-scmi+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:arm-scmi+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/5] firmware: arm_scmi: Calculate virtio PDU max size
 dynamically
To: Cristian Marussi <cristian.marussi@arm.com>,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 arm-scmi@vger.kernel.org
Cc: sudeep.holla@arm.com, james.quinlan@broadcom.com,
 vincent.guittot@linaro.org, etienne.carriere@st.com, peng.fan@oss.nxp.com,
 michal.simek@amd.com, quic_sibis@quicinc.com, quic_nkela@quicinc.com,
 dan.carpenter@linaro.org
References: <20241021170726.2564329-1-cristian.marussi@arm.com>
 <20241021170726.2564329-3-cristian.marussi@arm.com>
Content-Language: en-US
From: Florian Fainelli <florian.fainelli@broadcom.com>
Autocrypt: addr=florian.fainelli@broadcom.com; keydata=
 xsBNBFPAG8ABCAC3EO02urEwipgbUNJ1r6oI2Vr/+uE389lSEShN2PmL3MVnzhViSAtrYxeT
 M0Txqn1tOWoIc4QUl6Ggqf5KP6FoRkCrgMMTnUAINsINYXK+3OLe7HjP10h2jDRX4Ajs4Ghs
 JrZOBru6rH0YrgAhr6O5gG7NE1jhly+EsOa2MpwOiXO4DE/YKZGuVe6Bh87WqmILs9KvnNrQ
 PcycQnYKTVpqE95d4M824M5cuRB6D1GrYovCsjA9uxo22kPdOoQRAu5gBBn3AdtALFyQj9DQ
 KQuc39/i/Kt6XLZ/RsBc6qLs+p+JnEuPJngTSfWvzGjpx0nkwCMi4yBb+xk7Hki4kEslABEB
 AAHNMEZsb3JpYW4gRmFpbmVsbGkgPGZsb3JpYW4uZmFpbmVsbGlAYnJvYWRjb20uY29tPsLB
 IQQQAQgAywUCZWl41AUJI+Jo+hcKAAG/SMv+fS3xUQWa0NryPuoRGjsA3SAUAAAAAAAWAAFr
 ZXktdXNhZ2UtbWFza0BwZ3AuY29tjDAUgAAAAAAgAAdwcmVmZXJyZWQtZW1haWwtZW5jb2Rp
 bmdAcGdwLmNvbXBncG1pbWUICwkIBwMCAQoFF4AAAAAZGGxkYXA6Ly9rZXlzLmJyb2FkY29t
 Lm5ldAUbAwAAAAMWAgEFHgEAAAAEFQgJChYhBNXZKpfnkVze1+R8aIExtcQpvGagAAoJEIEx
 tcQpvGagWPEH/2l0DNr9QkTwJUxOoP9wgHfmVhqc0ZlDsBFv91I3BbhGKI5UATbipKNqG13Z
 TsBrJHcrnCqnTRS+8n9/myOF0ng2A4YT0EJnayzHugXm+hrkO5O9UEPJ8a+0553VqyoFhHqA
 zjxj8fUu1px5cbb4R9G4UAySqyeLLeqnYLCKb4+GklGSBGsLMYvLmIDNYlkhMdnnzsSUAS61
 WJYW6jjnzMwuKJ0ZHv7xZvSHyhIsFRiYiEs44kiYjbUUMcXor/uLEuTIazGrE3MahuGdjpT2
 IOjoMiTsbMc0yfhHp6G/2E769oDXMVxCCbMVpA+LUtVIQEA+8Zr6mX0Yk4nDS7OiBlvOwE0E
 U8AbwQEIAKxr71oqe+0+MYCc7WafWEcpQHFUwvYLcdBoOnmJPxDwDRpvU5LhqSPvk/yJdh9k
 4xUDQu3rm1qIW2I9Puk5n/Jz/lZsqGw8T13DKyu8eMcvaA/irm9lX9El27DPHy/0qsxmxVmU
 pu9y9S+BmaMb2CM9IuyxMWEl9ruWFS2jAWh/R8CrdnL6+zLk60R7XGzmSJqF09vYNlJ6Bdbs
 MWDXkYWWP5Ub1ZJGNJQ4qT7g8IN0qXxzLQsmz6tbgLMEHYBGx80bBF8AkdThd6SLhreCN7Uh
 IR/5NXGqotAZao2xlDpJLuOMQtoH9WVNuuxQQZHVd8if+yp6yRJ5DAmIUt5CCPcAEQEAAcLB
 gQQYAQIBKwUCU8AbwgUbDAAAAMBdIAQZAQgABgUCU8AbwQAKCRCTYAaomC8PVQ0VCACWk3n+
 obFABEp5Rg6Qvspi9kWXcwCcfZV41OIYWhXMoc57ssjCand5noZi8bKg0bxw4qsg+9cNgZ3P
 N/DFWcNKcAT3Z2/4fTnJqdJS//YcEhlr8uGs+ZWFcqAPbteFCM4dGDRruo69IrHfyyQGx16s
 CcFlrN8vD066RKevFepb/ml7eYEdN5SRALyEdQMKeCSf3mectdoECEqdF/MWpfWIYQ1hEfdm
 C2Kztm+h3Nkt9ZQLqc3wsPJZmbD9T0c9Rphfypgw/SfTf2/CHoYVkKqwUIzI59itl5Lze+R5
 wDByhWHx2Ud2R7SudmT9XK1e0x7W7a5z11Q6vrzuED5nQvkhAAoJEIExtcQpvGagugcIAJd5
 EYe6KM6Y6RvI6TvHp+QgbU5dxvjqSiSvam0Ms3QrLidCtantcGT2Wz/2PlbZqkoJxMQc40rb
 fXa4xQSvJYj0GWpadrDJUvUu3LEsunDCxdWrmbmwGRKqZraV2oG7YEddmDqOe0Xm/NxeSobc
 MIlnaE6V0U8f5zNHB7Y46yJjjYT/Ds1TJo3pvwevDWPvv6rdBeV07D9s43frUS6xYd1uFxHC
 7dZYWJjZmyUf5evr1W1gCgwLXG0PEi9n3qmz1lelQ8lSocmvxBKtMbX/OKhAfuP/iIwnTsww
 95A2SaPiQZA51NywV8OFgsN0ITl2PlZ4Tp9hHERDe6nQCsNI/Us=
In-Reply-To: <20241021170726.2564329-3-cristian.marussi@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/21/24 10:07, Cristian Marussi wrote:
> SCMI virtio transport maximum PDU size is currently hardcoded at build
> time; this will not play well with the possibile retrieval of a different
> size at run-time.
> 
> Make the virtio transport derive the maximum PDU size from the max_msg_size
> provided by the SCMI core.
> 
> No functional change.
> 
> Signed-off-by: Cristian Marussi <cristian.marussi@arm.com>

Reviewed-by: Florian Fainelli <florian.fainelli@broadcom.com>
-- 
Florian


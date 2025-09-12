Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 338CE3128C0
	for <arm-scmi@vger.kernel.org>; Fri, 12 Sep 2025 14:51:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757688681; cv=none; b=ggNj1nAsCEngLcnqI8rzeMdzjX0+IG3pW6hd6sONTcJTSpU1nKzhyqdHYPldFU1IQulwgYvc3orNdgyK/0cyI8CjtPZK1F40Ph1xBonIoYGDmTRNssVzBYWjWEra8Q7wNOe6uVorvlg23romSL3p1HnKGg/cqmw7ixOeBZ2agnQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757688681; c=relaxed/simple;
	bh=uk6E5Paty7fp1wof3TD0JBLDuNVPgNqH8AUiWEIMf+4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=q5aM9UxtJI0Brpe9S/lMQat2VC7W3GU7xRnoL/uVx3VEQBqwB6hXLxMUvjkeebFT8Y3pn1dq6Ezc6M8uD3fMqILHlay/4NrPRh7EabZam9jNxsSd4vh55wWhXMarCFXGG5Uq/ZuWpubzAaX6A7UWYoHwP/qcB6Pnqgw29ewDglI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=DRKNsoeM; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="DRKNsoeM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1757688678;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=NU+SVzKeTWD0+BhYK3td1Pqzo+tTZOjwzHuyU7qJoZg=;
	b=DRKNsoeMJfIrrb70N9hn3bj8gHWf6tP8wmV5c+2Fq0XJL5WF+J5vdnkVMhHaGD26jsMjp+
	jM71e17OlaLF/Ox3NiFoBMDjcBVYdaabrfjCjiB46z32Y3H3TbaiSe3QIPVTttF055W46p
	ZNrEAI/BI38szi/iPXXdPFcHCa50S/Y=
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-529-O6tao0xXP8mdQp7ibjODWQ-1; Fri, 12 Sep 2025 10:51:17 -0400
X-MC-Unique: O6tao0xXP8mdQp7ibjODWQ-1
X-Mimecast-MFC-AGG-ID: O6tao0xXP8mdQp7ibjODWQ_1757688677
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-4b5ecf597acso48447271cf.1
        for <arm-scmi@vger.kernel.org>; Fri, 12 Sep 2025 07:51:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757688676; x=1758293476;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NU+SVzKeTWD0+BhYK3td1Pqzo+tTZOjwzHuyU7qJoZg=;
        b=ZUcRWQuaUroY8hFvNiCnDOUzb8ISOOiaB0hpC1GsMg28QmDK1LcODJJeZ9t65cdbEl
         +EDCNJNnu3lNcsV33ZTp6bSbC2+k/aHP7q7Tbst60kVwbiywYgCEmb1BlcIpkEmO7ML1
         yjT/tFUzWLcoDozTR3J287bG/dKnMaYo6XlR90yEY8cDlHxcBc2Fhq4tFEnRZtipPG4/
         rDFce8y0JU0oE1BJHUipmIfkkCoIevCofaRNOMTyvR9+QCvP4up8sWdWmJH6Pue5tVIz
         XJ7zqb5qDE+uOVbpFHsRu+VwVzWA30HQRcWAPO+aBaRuP4Fj+xDr4Fgrza7Q5scwq+7b
         3doA==
X-Forwarded-Encrypted: i=1; AJvYcCU6z6ub0nTaQYMQvw9emc0vihz6driApKK0V5Qg+v7sYLbccpZh0nI5UHIoAOUzU1EQ8OUXDh4sZw==@vger.kernel.org
X-Gm-Message-State: AOJu0YxkLWgMDO93YPyAr0M1UwCzPbyJsaH4rqAN5mDgB3fW3P1gZ7mc
	MqZHr36bftCJew6JMYuI9XomV8lJ3Fv5Wr7/1t1US0eIihWhXZqkWTLvG3W6+bYKc0F5ePjNwRR
	NtDiwV9VbYKTaPV2L/TeEokrVk4x+/6JjKvhxoeqemXP1whalrYjwkDKuEiQN
X-Gm-Gg: ASbGncsBtD3rGwJKEmuBi/+UiT0HnYooffDllgBgmk2EBFsCLki61YVs1CUbFOQ5dtl
	nZ3A0jqGytxEGNEUaucPqAYbN8qGyATYTe0MnDKTQ0Jn6W0AlehEiqAbpQDbpX2MYmLoNt9dzEn
	fIghtd8ie0184YbPapjSBhmtC5xlQZlzYvGeXGyqENANPeIQcCzQENZuCLqMN7nXRrWXzHnuZFb
	HTbm45ydwqlR55ZZPOK7/yWGdWAtjHEwPHnUDaf+jOC/2EzQILyZVa0GiHAUq7WRQkFdYgQHnde
	pxKa14AQDTeJQbE57Ze+YeSXqUeI1KS7fxFGU4Tf9CH3kuRukhcKYQ6o4ztukIkKt2NpT9W8bGb
	UPHNQ/7+8cwSmUXJm2kOsKp4t0aFrVw==
X-Received: by 2002:a05:622a:1803:b0:4b3:4b6d:ec52 with SMTP id d75a77b69052e-4b77d0cc905mr42168501cf.32.1757688674190;
        Fri, 12 Sep 2025 07:51:14 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEKHaF5tvFQHHNEZPu3AfsN41wRwe2BP++0UPlIuNaDPH6QWUiaDDqVyOq53mlk8SSAOAXHkw==
X-Received: by 2002:a05:622a:1803:b0:4b3:4b6d:ec52 with SMTP id d75a77b69052e-4b77d0cc905mr42167931cf.32.1757688673567;
        Fri, 12 Sep 2025 07:51:13 -0700 (PDT)
Received: from redhat.com (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4b639dcae6dsm25920811cf.39.2025.09.12.07.51.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Sep 2025 07:51:12 -0700 (PDT)
Date: Fri, 12 Sep 2025 10:51:09 -0400
From: Brian Masney <bmasney@redhat.com>
To: Peng Fan <peng.fan@nxp.com>
Cc: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Sudeep Holla <sudeep.holla@arm.com>,
	Cristian Marussi <cristian.marussi@arm.com>,
	Marco Felsch <m.felsch@pengutronix.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Dan Carpenter <dan.carpenter@linaro.org>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
	arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org
Subject: Re: [PATCH v3 1/5] dt-bindings: clock: Add spread spectrum definition
Message-ID: <aMQzXdVHOGoT9y4C@redhat.com>
References: <20250912-clk-ssc-version1-v3-0-fd1e07476ba1@nxp.com>
 <20250912-clk-ssc-version1-v3-1-fd1e07476ba1@nxp.com>
Precedence: bulk
X-Mailing-List: arm-scmi@vger.kernel.org
List-Id: <arm-scmi.vger.kernel.org>
List-Subscribe: <mailto:arm-scmi+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:arm-scmi+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
In-Reply-To: <20250912-clk-ssc-version1-v3-1-fd1e07476ba1@nxp.com>
User-Agent: Mutt/2.2.14 (2025-02-20)
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: Ba7qYLgYmzSKCn-MttetwVbTzS1q9B010KzugFFwDdA_1757688677
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Sep 12, 2025 at 11:35:50AM +0800, Peng Fan wrote:
> Per dt-schema, the modulation methods are: down-spread(3), up-spread(2),
> center-spread(1), no-spread(0). So define them in dt-bindings to avoid
> write the magic number in device tree.
> 
> Signed-off-by: Peng Fan <peng.fan@nxp.com>

Reviewed-by: Brian Masney <bmasney@redhat.com>


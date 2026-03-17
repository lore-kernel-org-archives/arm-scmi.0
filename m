Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E727D3B9DB2
	for <arm-scmi@vger.kernel.org>; Tue, 17 Mar 2026 12:06:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773749175; cv=pass; b=mQCsONroAmyN79/PDy75KpU2OaESobVoyxt0bNqNb6hUGwe/qOtw5+1J5naW8t+CNPrmYxbQFHO6HlDINMN5xvfgoPgYu0021whaWFAdLW2H3n/EvYFbedg9v3ptMCgNyLzxBbqbj/a2T4ltGZrpVYOCq1LvMrmefqXqVHcBk7s=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773749175; c=relaxed/simple;
	bh=V3HmASpcIa5ux1z3MhV6eeiA+/gxK1vLeVS0bO7i/68=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ifXP98PU408mPIx5yvkKEjWvsl2acESVCfy6RAODa7vzyFccO9MCqU9mS0yQMiyt5yXRbnct89ZtDCIXsLMefhv+XjEfxI/zNFyVEnkcR14XtIDpK0PCeIgSj2XK3gbGeCYhctBbpUmwbvolZSXhLqhI504Bu+RGPC8ilyegMgE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=e3+LTaMl; arc=pass smtp.client-ip=209.85.208.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="e3+LTaMl"
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-666f73217baso982323a12.1
        for <arm-scmi@vger.kernel.org>; Tue, 17 Mar 2026 05:06:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773749171; cv=none;
        d=google.com; s=arc-20240605;
        b=FmLl35P3ZkjzvbT8NPfVEBN02EX+y5O3Zwy2apkrPdox/6NzKHihYqHRdaOg1HxpHT
         GvnOk3gidX6/ekUeP9iqsbQ9j7mb96/Q7V+8FiXPl2ffb6W7XgpreIJL7dC3bO3eBMVQ
         QXqcIv9ivDqT0/ob2fcaQxCfQb0sgsX1IT8hv1uCUt8wRTfatfFsCxEm+jO+tI9MdP1n
         4DnL9zmPUHm9bpnbDP3HGDagsvI+xkQhxvGcP6OtXZDWjynu73D+X+D65NT+AUFtMUP5
         qWvoZ2bQ6VhH9TGKI6TWb0xcTAgdYaLNHoiNa4uWRk04apGv+BlIpBZIVyn4RCA+maz2
         kVmQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=V3HmASpcIa5ux1z3MhV6eeiA+/gxK1vLeVS0bO7i/68=;
        fh=zsDzaVaUxq1rZeJT08lFmuGraMJgYNmrG/R37BMdTsI=;
        b=bR4mp127On8XJVPJVAZFv2MdcYVs1dv7CFZurSnY+Y2fIm9nYhbOlBnAAUpbZ9FKlD
         lCS3Fw/bQZA4xYELvBm4pzPX/ic86xr9ZAntyQitFOTlZBbD9jSKb2sect71KrISEFkL
         IDBIBg/843YaZkEJpad8gbIVjMz0adzspVnpCegcdoOiSHcx8fwkNmssuazj14wzv4Zi
         /oDsUvE5FFcMWvE6X0q8bmDgEwHCr5N2LFmrvAPCzZItG6f60Uo9LD7antlhON5Ufoaj
         QxPqMWx7pTnbnU1F5tk1iQx37oN7Q5agDGhJ2DMJOVIOQhP4j+nuUFpcmeg7KfmPlaG8
         s7SA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773749171; x=1774353971; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=V3HmASpcIa5ux1z3MhV6eeiA+/gxK1vLeVS0bO7i/68=;
        b=e3+LTaMl1qcAr2oct6n+AA5ANj1zu817Hmhp5D2ejZ35sWuZoTjQwqtycNAdPrkkdV
         S07mEPnGkCb/BosRhBw598wvpCDsPA8waaqprnF6WGSFVp4hpTQOPgEpUKE6UerAlP8H
         NQkA0ram5tYD0SgCT1LJqOMJafyoT190KJ6/U9idiNgQtiOxUOw7pcNh1sO4zU+a270J
         21rU3y9mn/zAMNVCagRW2leMF9a0qeROuHPrsslecYSDVQ4mgED+jTyx018DR30ync6p
         7oWzsnM8vQKMsWWGWE8/3SMVzG5sNOOMTOp/D4U7VJE4YYef76nPZ7tGn6CqNWbueABQ
         DHWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773749171; x=1774353971;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=V3HmASpcIa5ux1z3MhV6eeiA+/gxK1vLeVS0bO7i/68=;
        b=i4hc4WgaONzpzaI6kWAIEr7HrcLs1fg6me0eRWpy3TKJedywl9YEheFqgHFLyev6hv
         P9s/bgEKBA5b95zdmjOqJ80QAx1t7stZ7bZtSQjrcy9WGvqNW+/LX3W+NO9jAe34Uwml
         8dOAumpoFgE0qWh9YippzRDdwpGfB+o9g3XQjgxP6lSy3Lk8AbnP9OET3zbMr2wlv0OS
         Tc75otX6Yb8s1RNc4lOO2SQdp9s27Rf364pqgBw/6tkr+DNl27sN02nRncMS93GszRx/
         uxjwILc4wQppT2MmJi1lMesldqmeBaHuZ179gt+17GK1Lng1hWVyMRJvgp7r5VILipOo
         WgXw==
X-Gm-Message-State: AOJu0Yw9xMdcCjDWHWb0HkxGAss5FUnfId83CgWBMZ6oL4c1FtOBCf9N
	G+ud4fRLp2Sn4zju+VtgUgZSbaPb7zcDoV3QSV3wD4nXZQgF2t5kPOfo4HdFeMvStOxFhr1ep8Q
	TIZJcjO0ppI8zPBU6sVh2mDHRoQGorKE=
X-Gm-Gg: ATEYQzxuPTZd1WxNquT+t4EVCLXKELf7OimrM3193SnDy/Ih6bkKJUzesC6hrSU1m3D
	XR+RnNNw/+HCt0/6vPa2t3vZ0PO+hhxDmzCU4eRZxncrjtw6GEejUtuzDDppMy3E+uFN2CCOKHe
	lLLLvW0XiyljtGviqgWzBofY4l4koymytLqUxmELHv3e3JfA/5GfwsXbxwim2Ga8CbR8BCkbMzr
	8LBd4SgNUxKNCKJZFFFYBqJrzFscwBUiFpAaltRE0CyaVstO1xt2L2EAv62LmnbEsJxR/+Z3+l7
	wnvn/tNdnQ==
X-Received: by 2002:a05:6402:4388:b0:665:3cea:9864 with SMTP id
 4fb4d7f45d1cf-667084b7dd2mr1856880a12.12.1773749170872; Tue, 17 Mar 2026
 05:06:10 -0700 (PDT)
Precedence: bulk
X-Mailing-List: arm-scmi@vger.kernel.org
List-Id: <arm-scmi.vger.kernel.org>
List-Subscribe: <mailto:arm-scmi+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:arm-scmi+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260122161728.1225583-1-a.shimko.dev@gmail.com>
In-Reply-To: <20260122161728.1225583-1-a.shimko.dev@gmail.com>
From: Artem Shimko <a.shimko.dev@gmail.com>
Date: Tue, 17 Mar 2026 15:05:59 +0300
X-Gm-Features: AaiRm50X5bYR6KKbPpG7gMkacOOuXi9pnRaXYxydKG7ZNhHVXhBAB3-X3-8ex2w
Message-ID: <CAOPX745OsSOuZirpvW5nXDEbjpZXbmXtgQ6zB=dMX2tP+jhgaw@mail.gmail.com>
Subject: Re: [PATCH] firmware: arm_scmi: extract domain ID validation helpers
To: Sudeep Holla <sudeep.holla@arm.com>, Cristian Marussi <cristian.marussi@arm.com>
Cc: arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 22, 2026 at 7:17=E2=80=AFPM Artem Shimko <a.shimko.dev@gmail.co=
m> wrote:
>
> Refactor the voltage protocol implementation by moving repeated domain
> ID boundary checks into dedicated inline functions. This reduces code
> duplication and improves maintainability.
>
> The new helpers are scmi_voltage_domain_validate_id() which validates
> a domain ID and returns an error code, and scmi_voltage_domain_lookup()
> which returns a pointer to the domain structure or an error pointer.
> These are used consistently across the voltage operations.
> No functional changes are introduced - the validation logic remains
> identical to the original inline checks.
>

Hello maintainers,

Just a gentle ping.

Do you have any thoughts or feedback on this approach, or are these
changes even irrelevant?

I'm happy to respond to any comments or prepare a new version if needed.

Thank you for your time and for reviewing this patch.
--
Regards,
Artem

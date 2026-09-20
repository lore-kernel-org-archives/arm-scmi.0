Received: from mail-wr2-f12.google.com (mail-wr2-f12.google.com [74.125.225.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C19A633F8BC
	for <arm-scmi@vger.kernel.org>; Sun, 20 Sep 2026 10:18:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789899534; cv=none; b=ILhuwsTr2YVEWUJfJd2ldB4IsoZzCb7V2KH+HAnu62K8h5ckKkIjT5vVkwLBJ+BmipinlLRswLhnQJzCVtIqxQjBWOHo1pc2RIQhwm330v7BJ/+RV98mgBXIcHdQjoAZWPbwUlfpwIshaRcxWeHnc/nh4jvrkY2qZXFFjj093qs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789899534; c=relaxed/simple;
	bh=HqP7BQVzVu/qEMR55V44Bfd8uKv6sm747Y9t+oz3hvE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hueErx3oVPYAgyi94JAu1sUMe+72b4G3ejcZWcaOHu92SifkqTv9aKPp5lCtC7iItjOd5ODJOe1m0rHTY1MVDWe2o1xLor8qcy01J3zTmcCkj5dixusRqrjvYB99SybA5Qfevp6oTCYJyt724lfZq7bFCc7NNnLl25Y8Ry2vzBY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=V5KgARmi; arc=none smtp.client-ip=74.125.225.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="V5KgARmi"
Received: by mail-wr2-f12.google.com with SMTP id ffacd0b85a97d-482f6356f6bso1640688f8f.2
        for <arm-scmi@vger.kernel.org>; Sun, 20 Sep 2026 03:18:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1789899530; x=1790504330; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=AqS01F0fHUCNlMjJzLaTQZMMSglpdCcpPbBa80dW1pk=;
        b=V5KgARmi1zCn7xG7bajNWyLH2Wzdwl/vEdFsokMYQiqSfAfCymePN1UxEZ56hTrWGO
         x1F9ljrjkH0nqyOjUyegzw5lomDnfwe3WjCWLQ5/j9rfcF7v4iR1ky+sK4zmYdor1llo
         rlwX4xbxG22ZT99oE37V9GDUXEnCwFeEX8BlOcXFW8IrHmw1nyRJUa75SuriHpHvi/bI
         5k9He1XcGaicI4cBSRpL0CUWxigVLxJbIcR7N+b92ztMmmy7V6t/HEuSz/g2mgWlXqsW
         Tnf0kGc4QRPrli0iyezvdGzozqSzkCRh3cGp2lVv8r2LhRPs1JxdNIUQI1WTMVMCI5gC
         PKfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789899530; x=1790504330;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=AqS01F0fHUCNlMjJzLaTQZMMSglpdCcpPbBa80dW1pk=;
        b=MR+5IixQIrmPufqaHXfRmaDor3oppmkw92bUi4lYdNFsJzqZhW+0Hi2d/NlHtZ+3nh
         O1c3XaRpGBtXdwaY/yhkWMafcH9ky+MtJJKhJnsnMLJLu1sFkSuHVyQP9+bd7HT1xNvv
         feO+DiBtgoB08x8EQhL0nO1iaLJDdSm9uogHI6C0OFEvvxXNgYEWN3gLRj7HE78eN7kA
         IXPjttqmxLSubQKM7jEHpICChSY4uegu4GPTMMIgKgQDHB8edN7ZoMGKcPelAVYMgMCo
         AFvRvbznkhPSLTgsmbT8/MMydhyAJSrJzLmCer8YJeS+fjkA8vvmHwwfN261cUXo71r2
         +1Og==
X-Forwarded-Encrypted: i=1; AKwUvBwwCQZs+4OtNB0QRAf2OAhGUX7lJCjGxd6eLQtWre4afYvFmqbwAHj5bTheWtMeOOxnZ3Gar5LAjg==@vger.kernel.org
X-Gm-Message-State: AFuF++ns83cGcMgpHY8JYdy5X+KtTCk9sbUxxd8cPocHRzLxT5ixuot4
	5yiVGf4Oen5aG0xxoGMuOv0hitqiaQtG2wKMO5odxPQhhEwTl2xSUwTwMlk0P/R8XIcJiNoHphG
	T7hXJ
X-Gm-Gg: AYBFou0XG/Li5ggbkGer/HyZeFk0E4zmE2G5WnCVMNrc5jZswmZp7REfKGbIMEpK0Tl
	g/3wF3rJuN32i0ecu0CAMexGG/6C5UK8CYqxgIbKoJiY1dXeYaNg29GyxIngHr0q4ERxz9HCOQG
	SqgX3HlPtUIH9YSGM2FB1GfFeyoG2vSYzU3T3ECWsPv743tYwgoxB5lNDgxXpVcw636b0/LwKJK
	BoZX/oNH2M0YjdRPOnaDkMjwyUozqZZ8GnQdOJCOMxHFcT11H5o8N5oVRHa/JfeAOGRpEQ+Odaz
	hgUvjhXO53I2sXaPnBGLBrdSbeXnnYT26HG9ONm2Kw1QuXD86Q4zKFzhKTmoQSNnmiR8d8R/hWC
	B/5fTbsMJnYEtDaR/WUqEC2HdBSwgwhjCvY8T1vUzgzaotZ56kcWFnCnSiP8cYZVqeknfgxVZX2
	99DVHzuI5cVCjIhF67zS4TJgJwxSBCKalmX3hJFEjLV9HgaeJ+fGCNxpbXo17l8oeD7CHMVhXkA
	RI=
X-Received: by 2002:a05:6000:310d:b0:487:27f9:82a with SMTP id ffacd0b85a97d-48727f90ab5mr5715729f8f.31.1789899529909;
        Sun, 20 Sep 2026 03:18:49 -0700 (PDT)
Received: from localhost ([2a02:8071:56d1:2de0:1d24:d58d:2b65:c291])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-4872459f446sm12973334f8f.35.2026.09.20.03.18.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Sep 2026 03:18:49 -0700 (PDT)
Date: Sun, 20 Sep 2026 12:18:47 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Sudeep Holla <sudeep.holla@kernel.org>
Cc: Hans de Goede <johannes.goede@oss.qualcomm.com>, 
	Bjorn Andersson <andersson@kernel.org>, Cristian Marussi <cristian.marussi@arm.com>, 
	Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>, Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>, 
	Frank.Li@kernel.org, arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-arm-msm@vger.kernel.org, imx@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v7 1/2] module: add SCMI device table alias support
Message-ID: <aq-xJE196Skvk2pX@monoceros>
References: <20260918092951.5656-1-johannes.goede@oss.qualcomm.com>
 <20260918092951.5656-2-johannes.goede@oss.qualcomm.com>
 <20260918-impetuous-daring-barnacle-1ea4d0@sudeepholla>
 <dca62a09-2af7-463e-9ba0-1be935a95502@oss.qualcomm.com>
 <aq2g9otvja7xQqJ_@monoceros>
 <20260920-hippo-of-immense-assurance-50a5fd@sudeepholla>
Precedence: bulk
X-Mailing-List: arm-scmi@vger.kernel.org
List-Id: <arm-scmi.vger.kernel.org>
List-Subscribe: <mailto:arm-scmi+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:arm-scmi+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="va5epoaani5qcgwk"
Content-Disposition: inline
In-Reply-To: <20260920-hippo-of-immense-assurance-50a5fd@sudeepholla>


--va5epoaani5qcgwk
Content-Type: text/plain; protected-headers=v1; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v7 1/2] module: add SCMI device table alias support
MIME-Version: 1.0

On Sun, Sep 20, 2026 at 08:36:10AM +0100, Sudeep Holla wrote:
> On Fri, Sep 18, 2026 at 10:39:46PM +0200, Uwe Kleine-K=F6nig wrote:
> > On Fri, Sep 18, 2026 at 04:09:36PM +0200, Hans de Goede wrote:
> > > Hi Sudeep,
> > >=20
> > > On 18-Sep-26 15:32, Sudeep Holla wrote:
> > >=20
> > > [...]
> > >=20
> > > >> diff --git a/include/linux/device-id/scmi.h b/include/linux/device=
-id/scmi.h
> > > >> new file mode 100644
> > > >> index 000000000000..1b4ccfa9dcc5
> > > >> --- /dev/null
> > > >> +++ b/include/linux/device-id/scmi.h
> > > >> @@ -0,0 +1,17 @@
> > > >> +/* SPDX-License-Identifier: GPL-2.0-only */
> > > >> +#ifndef LINUX_DEVICE_ID_SCMI_H
> > > >> +#define LINUX_DEVICE_ID_SCMI_H
> > > >> +
> > > >> +#ifdef __KERNEL__
> > > >> +#include <linux/types.h>
> > > >> +#endif
> > > >> +
> > > >> +#define SCMI_NAME_SIZE		32
> > > >> +#define SCMI_MODULE_PREFIX	"scmi:"
> > > >> +
> > > >> +struct scmi_device_id {
> > > >> +	__u8 protocol_id;
> > > >> +	char name[SCMI_NAME_SIZE];
> > > >> +};
> > > >> +
> > > >> +#endif /* ifndef LINUX_DEVICE_ID_SCMI_H */
> > > >=20
> > > > You need to include this above file in include/linux/mod_devicetabl=
e.h
> > > > to avoid duplication of its inclusion elsewhere. That's the pattern=
 followed
> > > > I see.
> > >=20
> > > That is what I did for v3, but Uwe, who is leading the splitting
> > > of mod_devicetable.h from one large monster include to smaller
> > > per subsystem/bus includes explicitly requested me to follow this
> > > pattern, see:
> > >=20
> > > https://lore.kernel.org/arm-scmi/aow2GFAfy84k-N2B@monoceros/
> > >=20
> > > [...]
> > >=20
> > > >> diff --git a/scripts/mod/devicetable-offsets.c b/scripts/mod/devic=
etable-offsets.c
> > > >> index b4178c42d08f..91ec3704ee2b 100644
> > > >> --- a/scripts/mod/devicetable-offsets.c
> > > >> +++ b/scripts/mod/devicetable-offsets.c
> > > >> @@ -1,5 +1,6 @@
> > > >>  // SPDX-License-Identifier: GPL-2.0
> > > >>  #define COMPILE_OFFSETS
> > > >> +#include <linux/device-id/scmi.h>
> > > >=20
> > > > Drop this for above mentioned reason.
> > >=20
> > > This was explictly added at request of Uwe because the goal is to
> > > get rid of mod_devicetable.h including all the device-id headers
> > > in a big single catch-all include. This is done because currently
> > > many files include mod_devicetable.h and then if any of the device-id
> > > headers changes everything needs to be rebuild, making incremental
> > > kernel builds much slower.
> > >=20
> > > (and the same for the second include you point out)
> >=20
> > FTR: That all sounds right.
> >=20
> > Let's not add the the dependency mess that is mod_devicetable.h.
> >=20
>=20
> I am confused. I am asking to align with what's done in
> Commit ad428f5811bd ("mod_devicetable.h: Split into per subsystem headers=
")
> and you are disagreeing with that ?
>=20
> I am not comfortable taking this patch unless there are other similar
> examples that are agreed upon to break the pattern followed in the above
> mentioned commit.
>=20
> Uwe, please suggest.

I didn't start removing stuff from mod_devicetable.h yet, as changes
there are expensive (regarding build dependencies). So the plan is to
stop drivers consuming mod_devicetable.h and then drop it. (Not sure
this is sensible as new users come in faster than I can fight them, but
I didn't give up yet.)

So while adding new device_id structures to mod_devicetable.h is
consistent with the existing practise, it still makes the situation
worse, as every consumer of mod_devicetable.h then also depends on the
new header for the new structure. That's why I think it's a good idea to
deviate here, even if you're the first one doing so, to not worsen the
already bad situation.

If it helps you, I can propose a patch changing modpost to not use that
catch-(nearly)-all header and use the needed linux/device-id/*.h
instead. I put this on my list for tomorrow.

Best regards
Uwe

--va5epoaani5qcgwk
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmqvswQACgkQj4D7WH0S
/k63ZQf/c1EcLMBypE8L0sxQ62078sgY69oGq5tDdBhnBZ+z4IPNuVUBpEsbf6CY
hV/ZDy6EEWrIof70NynUSSft8Na4sKCCNoUAX0miGwkgyse7NXgu/+kfxKnYamH8
prDFe1BuWUgOnkVQz30liiPP2R54mXHS98TbV36hRU3VaKmT15gSgmQlaPwKiYud
z/8blCaDCvt1oUpT1fLuAd6Ou3zvU9zLm/OpGl5sEMIHcJaTL+/+pJaJOyH34wg/
kfTaQUIXa9gYIwXzC+1IN7VLF1N0CVDKdSABYE1o+07SHdmM4GweLPPNshAaHSN6
N4WYHrSbicQ23mz2Vai55R+WDm/WKA==
=3lua
-----END PGP SIGNATURE-----

--va5epoaani5qcgwk--

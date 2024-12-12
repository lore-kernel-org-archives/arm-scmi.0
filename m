Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63F4E84A35
	for <arm-scmi@vger.kernel.org>; Thu, 12 Dec 2024 02:13:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733969585; cv=none; b=hGeI7lcYKM/VI2TPp/oeXUk+lonr0kqcwIGyZsTPAJHtTYcJ32utwDp+oRDAbRILaMoqu1uKeJ32yNSP8IerT3ED/Z4UH9vsmLN2QAAUkjK+MZqjBcKJ99zdfwdEQhWHQGIWkECwUMWIgZn6jokMFzN+/qGEENlCNVCE9L4XmiQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733969585; c=relaxed/simple;
	bh=7u+cvNWc5zWjt5DLusZyEvN/LBjWF4ZD3de+gwpyeIw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=osHPtdLGnPjloa9ih/281Zp65updH+NURUz4EJo4jyuDdLpGohsFOgajtxtZFcofvV/mdZycitioRYMd4RnmeHFSjyAXgcu6oTaXtR1bmT5xiLLnp8Al7FDOZt9gdtAMZyFAIuXWLmhXMUx5XIkmDZyVvScNbgykfO2JfVmEuQs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BHOQxvR+; arc=none smtp.client-ip=209.85.216.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BHOQxvR+"
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-2ee989553c1so59889a91.3
        for <arm-scmi@vger.kernel.org>; Wed, 11 Dec 2024 18:13:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733969584; x=1734574384; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7u+cvNWc5zWjt5DLusZyEvN/LBjWF4ZD3de+gwpyeIw=;
        b=BHOQxvR+nvaHGWjMQd0P0OPV0FWdNL51R90a9bXqLgUAQIVjhxYZnCi9rypd3o4pEU
         atA+LZdM9i0NPmyoccKNWhcAk/3l7asuXYHeyRUonK2RBDCAlEV1FD+psMjgPeW57sOd
         6BSBe4MqdVfNEURJuN173iGGDiSc7Lk37LpNztppsWeDfR1nUkP2nczNdpGKlwglo2Ty
         bXusbo95KPwUyz678YWL84dA7ZluTcS9NFZh8nRc5V+R2ofKEa2GiQX/yMWISWIM1BbL
         V5aqzsiI28ZxbCrSaknvEeqY+0XI3ogGyOTJTup7NH0I2iUG8ul3G9L0/+HcDnNiqi+5
         wYJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733969584; x=1734574384;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7u+cvNWc5zWjt5DLusZyEvN/LBjWF4ZD3de+gwpyeIw=;
        b=i4DkV6/Ih0kv535dXJGlRHq0duxi/MCUlbP2G5VuxScb3PXFU0KAsbVEe5aCS0w92Q
         biwcsVQa1Nj6I7pbsGMFRiruR7xOfw1mefljhH5MN7CWWFaCfX9eeY4hJbsCQeV3IHw9
         4AtTIonZTIHASWOyiX31kbvx/8VnobFi2C/c5ozeW6iVSlyuZkom7C8fbM5BT/XB0CYI
         1yVxnaChRLK6WLlAC5mLonAud/RugYqryvtIy7BJx3yP7Sg3Vy5ymHHvqrfXuZZP4Kbg
         2AqPF2PcJlacMf+mbJcWU7q0abtFpVxSEfSjHq9KpfSrBSvw7layz2TuiRVjizq+AJ0s
         wRnA==
X-Forwarded-Encrypted: i=1; AJvYcCVL9CUI1lFCBRnRnR87oZzoCmXR79uWbEc+j1NmGS1mQTIGmwgrgKKNRUBHEsHGTYbVULOhoNAslw==@vger.kernel.org
X-Gm-Message-State: AOJu0YxVS+Z20Rm+s1dtHIZjNZQW5Yre8PZWKQfja2NACbZCTasD4L4+
	O2EmNJd14cW/8sLy0hKVQa8EAhPSoN4n40XH63GnCpTg2T6tc7J6AU2xPRRYmSo+gMXmVRiAeYc
	L3DIhWOTYVvwdj+uATBebnFAsmEvP1JY7o1z34jRp
X-Gm-Gg: ASbGncv23pkvocNMROlE/+x8ElTwjs/0/BgMi3N3c5iq9xcLiZhPlgAXjgy1Jdv3fCN
	D0eiHD1moSBH9hixH1UUPirs2I81oWOxEIXRv
X-Google-Smtp-Source: AGHT+IHylWd3Joe5SHF/2a1Y0xiMjxkNMDbIU78QU9/cG9E2ebTopCYzx9g9P+KV7pvtGZ6fNFOJvjBaWzPDrhCsEzI=
X-Received: by 2002:a17:90b:3848:b0:2ee:5bc9:75c3 with SMTP id
 98e67ed59e1d1-2f127f50a6amr8406329a91.5.1733969583724; Wed, 11 Dec 2024
 18:13:03 -0800 (PST)
Precedence: bulk
X-Mailing-List: arm-scmi@vger.kernel.org
List-Id: <arm-scmi.vger.kernel.org>
List-Subscribe: <mailto:arm-scmi+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:arm-scmi+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241211134505.2218386-1-guomin_chen@sina.com_quarantine> <Z1nZPmB7nW7HUdYL@pluto>
In-Reply-To: <Z1nZPmB7nW7HUdYL@pluto>
From: gchen chen <gchen.guomin@gmail.com>
Date: Thu, 12 Dec 2024 10:12:52 +0800
Message-ID: <CAEEwsfT3QikwmiiVKq4p_UU1ph6x1+w7wepkO5ohDA83dXKNmA@mail.gmail.com>
Subject: Re: [PATCH] firmware: arm_scmi: Delete the meaningless scmi_bus_id.
To: Cristian Marussi <cristian.marussi@arm.com>
Cc: guomin_chen@sina.com, Sudeep Holla <sudeep.holla@arm.com>, 
	Xinqi Zhang <quic_xinqzhan@quicinc.com>, arm-scmi@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Cristian Marussi <cristian.marussi@arm.com> =E4=BA=8E2024=E5=B9=B412=E6=9C=
=8812=E6=97=A5=E5=91=A8=E5=9B=9B 02:28=E5=86=99=E9=81=93=EF=BC=9A
>
> On Wed, Dec 11, 2024 at 09:45:05PM +0800, guomin_chen@sina.com wrote:
> > From: guomin chen <guomin_chen@sina.com>
> >
> > Currently, scmi_bus_id is only used to set scmi_dev.id,
> > which in turn sets the SCMI device name. After removing
> > scmi_bus_id, it is clearer and more meaningful to directly
> > use the input parameters name and protocol to set the SCMI
> > device name.
>
> Hi,
>
> even though using progressive IDs in devices is less readable, I agree,
> we need ID in the name to keep the device unique.
>
> It is true that we can have only one protocol/name unique pair amongst
> the *requested* devices BUT it is also true that the SCMI stack as it
> stands can be instantiated multiple times if you define multiple DT SCMI
> top-nodes: this is already used in the wild to sort of represent
> multiple virtual/physical SCMI Server backend (all anyway identified by
> ID-0 as from the spec...)
>
> So if you have defind in the DT 2 SCMI instance with both a protocol@15/H=
WMON,
> as an example, the arm_scmi/driver.c will probe twice and it will try to
> create 2 instances of 'requested' devices for 15/hwmon and both of these
> will be attached to the same *unique* SCMI bus...so we need the uniqe ID
> to differentiate them....same for the transport devices.

Okay, it is true that if two SCMI instances are defined in DT using
the same protocol,
it will result in devices with the same name. Thank you for pointing this o=
ut!

Thanks

> Sorry but NACK for me: regarding the readability, I could agree, but you
> can anyway easily understand which device is which by looking at the
> drivers/ links generated in the scmi_protocol bus directory.
>
> Thanks,
> Cristian

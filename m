Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D95D646C4CD
	for <arm-scmi@vger.kernel.org>; Fri,  2 Oct 2026 10:19:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790936343; cv=none; b=Qz7cRydyWvdwAxgjaM3lBh924NsE19jR1znrKcQwiPWaRePsZXrttDQetAMij5WcHXaxocP4oQ1haja7BZuhLveyEqg13zClnqUMYeGB7I/QE36jQhKLYBV8Ud/gsGX3h49umH/eLjJyDT9ISAYKoRQfOfwXu850IgjdOs1c4cI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790936343; c=relaxed/simple;
	bh=yD7YPMQ/bhrEbIDPvu1oLJ9U8Jjp9tvIYfcSbLo4mfQ=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=bdnk5uaO6SyI5qzdAOISB8WQZU/7uF2sxSfGEIsB5/cSppyblZgpnZskl0+ki4djwrA3UdMsuQKPlgbo3s/CS7ifwkuBehc+5avqlPBEswBm9K1yqfVlcbfXea5w2Hb+5xXfxC1kviLhJBMyGH7t+R/vOTtW1MXyjHAkC/hNwfA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Mllbpz3r; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=IH/pApTh; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Mllbpz3r";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="IH/pApTh"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6929nViB2135555
	for <arm-scmi@vger.kernel.org>; Fri, 2 Oct 2026 10:19:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	k6u7aLem8qmkQJxHb8SzWCXGGnxesHL36LUuoskf1Jg=; b=Mllbpz3rglXFks0O
	JHrX66uhPykK70siakFJhUi+ZgoPbpWcTlLiTcgTDB65MVA3FrJLZ4kJ1p3KOOcQ
	/KcqSAOj1Scrjoir9rv/LGiCKfSP0uYt3I4YDzTbopsI2nXaYYvcuEBzxNh6f2js
	7EDut7We+5aL++c7Y7RVTAbQk1GGNQkzSRMsnOxyzrcl60hpuTcaXViHS+QPi7iX
	dtRiIY6Gp+I/i1R4yGeaEqwE81C8gdKiaZdrdK2nUEPMUHyQB4KFNmuzuo5G7zWh
	PmfKr4VCE28//oTvQ2pj29xUs7RslUJBluKnjB9d6UenH3FOH2bCA2GCV+D1rMOg
	aUDaMA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h26bp0vsb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <arm-scmi@vger.kernel.org>; Fri, 02 Oct 2026 10:19:01 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93bf4c0af4eso366741585a.1
        for <arm-scmi@vger.kernel.org>; Fri, 02 Oct 2026 03:19:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790936340; x=1791541140; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:subject:from:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=k6u7aLem8qmkQJxHb8SzWCXGGnxesHL36LUuoskf1Jg=;
        b=IH/pApThTzfeR7C557DfDMuddrLBhnQJBb0klVkHy8Xu08vkaNXMB0gDEB5VovUWda
         6L2KJcAZFz9CsS/8BctPU0JFj3AV9JTYxzgwKzXBk/N/n6Nja8KbzaI5lhIe6UJqgFab
         X7ERitb+nO0aTStX+keEqj/vjS09oCsxnxyKaIiD8bIrpRHcQ7ejcOD7j/7gV42FY7x7
         j/TTgTLcI5OLPCDvwmtn61LQ7DLpXO+urrHEHOe/TcY7RDA1mWZzQ3cJhtknwZP/u+0n
         /kxF02AAoCi6n9ybPrXZHOePBJpYFCkPQdUyaL3VHKjPaRzfGdcKFl56jSeYUy383fDI
         IBhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790936340; x=1791541140;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:subject:from:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=k6u7aLem8qmkQJxHb8SzWCXGGnxesHL36LUuoskf1Jg=;
        b=pWRX1pUX5uuVQ5xzX9cl2HNVddBfe+TUWTKhxCrGXA9NA3DKwfXri2FRE0E3npmkjg
         YORJjjs4EkcaJEQoObnbtI7FqJciO+BYWfbKPTzXki1+LD94V7fPp0WMCPJ56YgHsO5m
         Z1npeU2oed2e7LS1Iaub+CU17qIYBOD9HjBtqdhPd/cVrQbbcN6OpgvjzIskxFYTDnXV
         h6tBz1ZK0RHfPl3BIZ7txNjB90WNqfeoWJtl/eJEPb0Jf/UVJI+Rro6EXTrFNecSXUNn
         o/aprIk25/U4PyUynfVZGOWNOUL4bDB46+6VU739RPirY2P+YpQZwkzqU7ZXGgYOgjb0
         JM+Q==
X-Forwarded-Encrypted: i=1; AKwUvBxXOXCGRY4ttNtfy/mRD7A8emuQbkOwXF5CB/f8L+8sWFzmTYw/Uiy0Z2R7lvYqqFe9BtGMaGGeMw==@vger.kernel.org
X-Gm-Message-State: AFuF++lCGDfReXDr0va+XNxPMbG9A2Q4RcSvS/l8D1asUAlwhTrJ0P1E
	fdhxnyQ1v6c09ST4z7HTzY24DzSpXCcAcvZO/VIqgkRweDTlJabeLp/QZWM5QQW/QVuQoXMv7UP
	l5vAMOSZOhXjluiQikrd0GeeaohWlg3n0X6XxkpRnrwlhPRCBQUq5Pc3R55x5+wGnL4QA0Q==
X-Gm-Gg: AYBFou2LVht9Jc2AVyGif03jxUZFZYTclIrxLOHsbA4df1qmrzwIX1nSnvwCRJ7g3i2
	/aTK82ZhkluxNFUF8DwhUBGRXScR1szRvpxBDeJot794x2gmqiQvjFYXW0QUMxX48XXPOJ5hLiU
	HD/owCeyukJznpGiYo223HEqzI5Fb5m13DhZwsYip2s/XMmPWc1Bzbxpk4YbUVNqZUCq3SdtLxY
	Fxo8Inz+emvUecqDtkaT+a1mR3KIEXSM83frOb7F8DatJp4Ec5nG2pEQLZ+iwNelQHH1h/Ajwh6
	DVMWcGdQzG9y/vJIQmy7PpB2EoSL8WmVGNne0uUOFKqKh0Rvqmg8naIZBjkC6PpZtI+SQLuQWlF
	uQPnPYNFoywhNgB7laDk9L4NNcDW1ISh7m9IzGsaGuFuiVS1jIqUYf2v3WRnMUq0+BRY/fu2qwf
	Ob61e9JTXFreKwAJlK0MQhlwU+qZpEowxV0c1hmORHnDnyViAAMS6Y6/lsPsgguyu4gw==
X-Received: by 2002:a05:620a:1a22:b0:93c:664e:e205 with SMTP id af79cd13be357-93cb59f3452mr1108851585a.11.1790936339861;
        Fri, 02 Oct 2026 03:18:59 -0700 (PDT)
X-Received: by 2002:a05:620a:1a22:b0:93c:664e:e205 with SMTP id af79cd13be357-93cb59f3452mr1108849185a.11.1790936339272;
        Fri, 02 Oct 2026 03:18:59 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2e4cf86029sm73782466b.60.2026.10.02.03.18.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 02 Oct 2026 03:18:58 -0700 (PDT)
Message-ID: <d1474169-bf2c-486c-91f1-3754638dbe0e@oss.qualcomm.com>
Date: Fri, 2 Oct 2026 12:18:57 +0200
Precedence: bulk
X-Mailing-List: arm-scmi@vger.kernel.org
List-Id: <arm-scmi.vger.kernel.org>
List-Subscribe: <mailto:arm-scmi+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:arm-scmi+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Hans de Goede <johannes.goede@oss.qualcomm.com>
Subject: Re: [PATCH 2/4] firmware: arm_scmi: Skip requests for standard
 protocol devices
To: Sudeep Holla <sudeep.holla@kernel.org>, arm-scmi@vger.kernel.org
Cc: Peng Fan <peng.fan@oss.nxp.com>
References: <20261002-scmi_bus_fixes-v1-0-8695cbab3fe7@kernel.org>
 <20261002-scmi_bus_fixes-v1-2-8695cbab3fe7@kernel.org>
Content-Language: en-US, nl
In-Reply-To: <20261002-scmi_bus_fixes-v1-2-8695cbab3fe7@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=OMqyTiaB c=1 sm=1 tr=0 ts=6abf8515 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=VwQbUJbxAAAA:8
 a=8AirrxEcAAAA:8 a=EUspDBNiAAAA:8 a=6cPqBtvTZHTiIry-ew8A:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22 a=ST-jHhOKWsTCqRlWije3:22
X-Proofpoint-GUID: CZj7eQpt-Mf_09_hno6_vbbEyWZaOSKX
X-Proofpoint-ORIG-GUID: CZj7eQpt-Mf_09_hno6_vbbEyWZaOSKX
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDAyMDA0MCBTYWx0ZWRfX3v8G4C8luIqR
 G12P9UI7LzyQ+MtvJZOuJEfhgIJdu5Y0oyPzKX8nYlChChThbUf2f/jNGbYtn9O67rS/6r8/Akc
 3WBMbpna7aEy3WDJGOSfs8zTOayjHPo=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDAyMDA0MCBTYWx0ZWRfX8FRRdAbo6OHs
 Q/w0X/9+QZFOTfIX7gTqjxk811eMHvkDpO0a9rt2fhbYcEHr6kZ38A+ydllyQzcui9zNrj8G8T9
 snN8pguzjsqNpwjm0Q0BFYXff6XtX1Czmj2Hn1/gosA61IUHauWxT4ULN20LmuDn+PddQsOmTdf
 sRrN7lcyQTGfBnTEJzJJzR2hec/bekt/y44I+xXSKzwX4sfKFexqwwvz4J7/4d6QRxqYVVlaXNs
 7TKu69YI2MPrBbSZ3F+4LMafnZkMlG9KOyO85xpG/Lh+C4gu6wvV+Pdw//tsjIqebnx/zwgNrqd
 b8PCTY4TyEy1rFvFfoOhu7FSX3upBN1PmM/hNsvi80Ij2xltxUvMf9qWNkQzJcfyIodwCOvGLj5
 XgvW2Dz6gsc/qCrsnxVOMGnnJUBx9+yLX7JzbiujXBFK8L0UCyb8VTseStlukJzhd7TuIqLdvB9
 kWQHlbhIicBVmPxjLMg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-02_03,2026-10-01_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 suspectscore=0 impostorscore=0 phishscore=0
 bulkscore=0 clxscore=1015 priorityscore=1501 spamscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610020040

Hi Sudeep,

On 2-Oct-26 11:36, Sudeep Holla wrote:
> The SCMI core creates devices for the standard protocol IDs during
> protocol enumeration, without waiting for an SCMI driver request.
> Recording a request for one of these devices also rejects a second
> driver registering the same protocol/name pair.

Right, but that was also the case before:

aac4e67d6eb9 ("firmware: arm_scmi: Always create devices for standard protocols")

I actually went for the "static" device creation instead of automatically
adding requests to the requested-devices list to keep the behavior
of rejecting a second driver claiming the same device-id in place.

> When the first driver unregisters, unrequesting that pair destroys the
> core-created device.

Correct this was pointed out by Shashiko, but I deemed this ok because
I assumed that if the driver is manually unregistered (rmmod) it will
also be manually insmod-ed again.

This assumes that re-registering the driver recreates the standard
protocol devices as it did before and I do not see why it would not.

Re-registering the driver leads to the following call-chain:

scmi_driver_register()
scmi_protocol_table_register()
scmi_protocol_device_request()
blocking_notifier_call_chain(SCMI_BUS_NOTIFY_DEVICE_REQUEST, id_table)
scmi_device_request_notifier(SCMI_BUS_NOTIFY_DEVICE_REQUEST, id_table)
scmi_create_protocol_devices(id_table->protocol_id, id_table->name)
scmi_device_create(prot_id, name)

And since the name argument to scmi_device_create() is
not NULL we enter this path there:

        if (name)
                return _scmi_device_create(np, parent, protocol, name);

Just as before aac4e67d6eb9 ("firmware: arm_scmi: Always create devices
for standard protocols") and the standard-proto device will be created.

So AFAICT a manual insmod/modprobe should work and I just tested:
rmmod scmi_cpufreq + modprobe scmi_cpufreq with the autoload patches
in place and that makes the cpufreq SCMI bus device go away and
re-appear as expected.

The only thing which won't work is:

rmmod standard-proto-driver
udevadm trigger

to make udev reload the module after a manual rmmod, but I consider
that a case of 'doctor it hurts when I do foo' with as answer:
'Well then do not do foo'.

> No other driver can be bound to it at that point,
> but removing it also removes the device that a later driver could bind
> to or use for module autoloading.

While correct, simply re-registering the driver fixes the device
not being there, see above.

> Skip request tracking for standard devices. Keep request tracking and
> rollback for nonstandard devices unchanged.

This has the downside that it will allow drivers to claim duplicate-ids
for standard-proto devices.

That downside is pretty much why aac4e67d6eb9 ("firmware: arm_scmi:
Always create devices for standard protocols") does things the way
it does.

If we want something like this patch, then my suggestion would be to
make scmi_protocol_device_unrequest() skip the
blocking_notifier_call_chain(SCMI_BUS_NOTIFY_DEVICE_UNREQUEST) call
for standard protocol devices, but otherwise keep them on the request
list to keep the detection of duplicate device-ids.

But I'm not sure even that is necessary, my change deliberately only
touched the scmi_device_create(name = NULL) path to make sure
the devices are initially created. Future driver unregistering leading
to them going away as before is not really a problem IMHO.

Regards,

Hans




> 
> Cc: Hans de Goede <johannes.goede@oss.qualcomm.com>
> Fixes: aac4e67d6eb9 ("firmware: arm_scmi: Always create devices for standard protocols")
> Reported-by: Peng Fan <peng.fan@oss.nxp.com>
> Closes: https://lore.kernel.org/all/20260928-driver-core-v1-1-0846bb8e0f32@nxp.com
> Signed-off-by: Sudeep Holla <sudeep.holla@kernel.org>
> ---
>  drivers/firmware/arm_scmi/bus.c | 73 +++++++++++++++++++++++------------------
>  1 file changed, 41 insertions(+), 32 deletions(-)
> 
> diff --git a/drivers/firmware/arm_scmi/bus.c b/drivers/firmware/arm_scmi/bus.c
> index f2e2ed56bc32..230ee9f6f1aa 100644
> --- a/drivers/firmware/arm_scmi/bus.c
> +++ b/drivers/firmware/arm_scmi/bus.c
> @@ -186,12 +186,44 @@ static void scmi_protocol_device_unrequest(const struct scmi_device_id *id_table
>  	}
>  }
>  
> +/* Standard protocols table */
> +static const struct scmi_device_id scmi_std_id_table[] = {
> +	{ SCMI_PROTOCOL_POWER, "genpd" },
> +	{ SCMI_PROTOCOL_SYSTEM, "syspower" },
> +	{ SCMI_PROTOCOL_PERF, "perf" },
> +	{ SCMI_PROTOCOL_PERF, "cpufreq" },
> +	{ SCMI_PROTOCOL_CLOCK, "clocks" },
> +	{ SCMI_PROTOCOL_SENSOR, "hwmon" },
> +	{ SCMI_PROTOCOL_SENSOR, "iiodev" },
> +	{ SCMI_PROTOCOL_RESET, "reset" },
> +	{ SCMI_PROTOCOL_VOLTAGE, "regulator" },
> +	{ SCMI_PROTOCOL_POWERCAP, "powercap" },
> +	{ SCMI_PROTOCOL_PINCTRL, "pinctrl" },
> +	{ SCMI_PROTOCOL_PINCTRL, "pinctrl-imx" },
> +	{ },
> +};
> +
> +static bool scmi_device_id_in_std_id_table(const struct scmi_device_id *id)
> +{
> +	for (int i = 0; scmi_std_id_table[i].name[0]; i++) {
> +		if (scmi_std_id_table[i].protocol_id == id->protocol_id &&
> +		    !strcmp(scmi_std_id_table[i].name, id->name))
> +			return true;
> +	}
> +
> +	return false;
> +}
> +
>  static int scmi_protocol_table_register(const struct scmi_device_id *id_table)
>  {
>  	const struct scmi_device_id *entry;
>  	int ret;
>  
>  	for (entry = id_table; entry->name[0]; entry++) {
> +		/* Skip standard devices as they are created unconditionally */
> +		if (scmi_device_id_in_std_id_table(entry))
> +			continue;
> +
>  		ret = scmi_protocol_device_request(entry);
>  		if (ret)
>  			goto err_unrequest;
> @@ -200,8 +232,11 @@ static int scmi_protocol_table_register(const struct scmi_device_id *id_table)
>  	return 0;
>  
>  err_unrequest:
> -	while (entry != id_table)
> -		scmi_protocol_device_unrequest(--entry);
> +	while (entry != id_table) {
> +		--entry;
> +		if (!scmi_device_id_in_std_id_table(entry))
> +			scmi_protocol_device_unrequest(entry);
> +	}
>  
>  	return ret;
>  }
> @@ -211,8 +246,10 @@ scmi_protocol_table_unregister(const struct scmi_device_id *id_table)
>  {
>  	const struct scmi_device_id *entry;
>  
> -	for (entry = id_table; entry->name[0]; entry++)
> -		scmi_protocol_device_unrequest(entry);
> +	for (entry = id_table; entry->name[0]; entry++) {
> +		if (!scmi_device_id_in_std_id_table(entry))
> +			scmi_protocol_device_unrequest(entry);
> +	}
>  }
>  
>  static bool scmi_device_name_is_transport(const char *name)
> @@ -542,34 +579,6 @@ _scmi_device_create(struct fwnode_handle *fwnode, struct device *parent,
>  	return sdev;
>  }
>  
> -/* Standard protocols table */
> -static const struct scmi_device_id scmi_std_id_table[] = {
> -	{ SCMI_PROTOCOL_POWER, "genpd" },
> -	{ SCMI_PROTOCOL_SYSTEM, "syspower" },
> -	{ SCMI_PROTOCOL_PERF, "perf" },
> -	{ SCMI_PROTOCOL_PERF, "cpufreq" },
> -	{ SCMI_PROTOCOL_CLOCK, "clocks" },
> -	{ SCMI_PROTOCOL_SENSOR, "hwmon" },
> -	{ SCMI_PROTOCOL_SENSOR, "iiodev" },
> -	{ SCMI_PROTOCOL_RESET, "reset" },
> -	{ SCMI_PROTOCOL_VOLTAGE, "regulator" },
> -	{ SCMI_PROTOCOL_POWERCAP, "powercap" },
> -	{ SCMI_PROTOCOL_PINCTRL, "pinctrl" },
> -	{ SCMI_PROTOCOL_PINCTRL, "pinctrl-imx" },
> -	{ },
> -};
> -
> -static bool scmi_device_id_in_std_id_table(const struct scmi_device_id *id)
> -{
> -	for (int i = 0; scmi_std_id_table[i].name[0]; i++) {
> -		if (scmi_std_id_table[i].protocol_id == id->protocol_id &&
> -		    !strcmp(scmi_std_id_table[i].name, id->name))
> -			return true;
> -	}
> -
> -	return false;
> -}
> -
>  /**
>   * scmi_device_create  - A method to create one or more SCMI devices
>   *
> 


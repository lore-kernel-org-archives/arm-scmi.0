Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7F8733343B
	for <arm-scmi@vger.kernel.org>; Thu,  9 Jul 2026 14:07:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783606044; cv=none; b=a+/F4cJp3JW1walkdClLq7NsG16GXU7X0NNm4u+TJWkg1YnOFJ3JCL0ZUCPFA5a1txqC3WAjhz8cAZU63wbpjGQ+EQDdCfnQt2eMTRJTYeeJhSdFgjNaGZnBIp52Q0eOSe1dSAqVUpv7Bik0dUwQS1GyapNvKVllsjQ202+Xw6Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783606044; c=relaxed/simple;
	bh=/bYHC6ljg2WQE3J+hhPWQjPMOcrXeK0n87YNg5RX++E=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=jBFrEPI/YxUxLZmks2iJMeY4hroSkVhI2c5oRLhWiBxgOLeikEZNXKAyIRDtfDsieJdkBr1h+YjlGn5WmsNtbqtJCTodh4rSrc4SWar2/BLadJ86UObJj5JzBfo+cDEQb5xNxTopGLn+fTReFXRxewbxi1+HkTn/0kjXCaQcfpA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=R9VjSNvC; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=TnyYnpcq; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="R9VjSNvC";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="TnyYnpcq"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 669DwMvl1971845
	for <arm-scmi@vger.kernel.org>; Thu, 9 Jul 2026 14:07:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	/y/ahoOnHj/TUbb1MBrebh+AQ6I/elKTEZ594W2J7GI=; b=R9VjSNvCHGYmCikI
	POz42573KX+Iw8RgVFzKweFwM4uIUVDrleq2QM4u4N63wFSC6y4eafKE9g+j6oJa
	wexGDy5oP/PmZX42bkzmF/XrlxpSS6BX7oIEQZGzCw7j6s4+GtJc0iA1pbPshNHH
	cf5CkhjCw1KEKiXHeOGvqq8Aj1T1lvSY5wZ/8MunyUee7rcn8OuxeqGMjBHWuwtU
	C/DUKHRVGdTyUAlWCTSh1TThGgE0dx7ILNfY7enxMbLzoJiknXW7dZ72gHeDUbrd
	9D7nHt+t+WqUrbC1OrumUCyLK+4XIsL3yVhUniz4wDq5znTasz4NYtkq9CNCHNSO
	VEq2oA==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4facqpg48f-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <arm-scmi@vger.kernel.org>; Thu, 09 Jul 2026 14:07:20 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-8ef18406878so12550206d6.2
        for <arm-scmi@vger.kernel.org>; Thu, 09 Jul 2026 07:07:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783606040; x=1784210840; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:subject:from:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=/y/ahoOnHj/TUbb1MBrebh+AQ6I/elKTEZ594W2J7GI=;
        b=TnyYnpcq2uOXCXCyRwKfEJ2EfLOHmzACzv5GIhZMapicJninlVoDA2CjIa5CNUIgwN
         q3nYKA/F7Ml4ee6ppKVSpWxnE5i6WPQXFHcOnMN4ec7zoUWl+xG4Uzan+yJ1k4caZdHq
         cDVr9byymwYaak9Sv1mgF/v+mCuMnJorLFo7R4118dehJF4mOlLu/PvJp+7z/KrgPHhR
         8Sz/GO3+T6/WCP+i3bZp/26u7er7oQkeSW9LQmS9S5ZL/krGIgxpZOfjuhxsXvlp2xqs
         r6rlBrPZp1iTE8Nfec6ybJBfJsgqJXToPSAJpp3VEzifH6sdy4lqU/SyacE3g+sIszD4
         RtUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783606040; x=1784210840;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:subject:from:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/y/ahoOnHj/TUbb1MBrebh+AQ6I/elKTEZ594W2J7GI=;
        b=cuwZZHsKXjDndv0oZSWkGPn9ln+Bjg5njraK0T//iwmr5kzjF4I18H0teatWby3zhA
         LJOBqSwXx8l6QLw4AWKgq0o8JUAYtbdjCRIaE2WMkYjyl0inYGqQe58tY4Lnamk13tiR
         SRzQQJOzIwjQiZWuGVxZcQ/UIxyzvscWgkMzLocgf9VOR8R2Kn/KnfnMs8oIcwT4XDX0
         1vIXjWJjQPT+Km6IxoKuO79wzMdK4vxbTFcHJRfg79y4TNMBKn/d7kN7choyGL8vM0T/
         BkJ/XIOg6djzyx3KT+E+8A8Ewf3uymL2cMck+1hyqQodyh1jJio3QTOxfnnrUeReEBTH
         41Nw==
X-Forwarded-Encrypted: i=1; AHgh+Rrw12gGbWo/mVD7Yq5YJhxY2qq2kB5q65/KoqN6w4ou9VLmfFoIFTLyl0BapyK8+YcdyoSPwvdkuA==@vger.kernel.org
X-Gm-Message-State: AOJu0YzeruGhqOr+rPzUBLr+PDZJUJlMwYNVHAv650wXyIpC6ERDCwN0
	YiRj7iBdzo93ftYd6XsiVhDP9V9e1eQ23Jqf05hlkJp+J0GcjJBdl/Rc+ULCJJnoolzhaiC0hsz
	UiCLyaZdWkpDV2mTq7Q8smnSOBiiVHg/J6B43hFBn0bMMImw1Hlnmx87f/fO8VQ==
X-Gm-Gg: AfdE7ck7rOgMPvC2Degi7Uuhv+fNTeHJUHlrAbzNGs4Ip0YbNcfJ3wufBH+BI5yCiAB
	DlsEHfPSohpDomLEeYJDN7gIOqncr2RF7r/JLoy4ajU/yIyx+8YmybBi431dthp23z7wIHy0RWQ
	GpoOj1znsGu7Nh7fKyIWI2hGcXkScKWJnNwZDYLIx+kxsEKXLiiOxsGiZPprE4yEukxpiR2RaL/
	NY0z45+1ewkacOm6neB5CVZQVMdhG8m0ozxIrGPpv2QEAJICJvE8UYt2dD4AAW7FUsw+oKVF99n
	T0wQb3qNtBqvYtkLIhdYu3aHh0PuOQ1XeFn0yktBp2wJtrM0du2jP8KDgFZ96KrWpK4UsAzCM0X
	gPNwhWQwGa3JRH0NOy01mWkPPNQsbq9NQpBi/PtJmMO/jLKEH+1XQKvtBvK6j2/pzZoxVr66jqa
	Smo89NPTDNDiuB/ys2D/3MqmHWHTqv93iIViRCgE3cCaLS7UCV89QiJMAR7siPGZpAs5p2IKzLn
	oY49w==
X-Received: by 2002:ac8:5d88:0:b0:51c:667:7e30 with SMTP id d75a77b69052e-51c8b4d60cfmr76151831cf.47.1783606039927;
        Thu, 09 Jul 2026 07:07:19 -0700 (PDT)
X-Received: by 2002:ac8:5d88:0:b0:51c:667:7e30 with SMTP id d75a77b69052e-51c8b4d60cfmr76151081cf.47.1783606039359;
        Thu, 09 Jul 2026 07:07:19 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c15c79f2a3fsm301861766b.49.2026.07.09.07.07.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 09 Jul 2026 07:07:18 -0700 (PDT)
Message-ID: <f05860be-dd75-49f8-b27a-bff7b554e71b@oss.qualcomm.com>
Date: Thu, 9 Jul 2026 16:07:17 +0200
Precedence: bulk
X-Mailing-List: arm-scmi@vger.kernel.org
List-Id: <arm-scmi.vger.kernel.org>
List-Subscribe: <mailto:arm-scmi+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:arm-scmi+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Hans de Goede <johannes.goede@oss.qualcomm.com>
Subject: Re: [PATCH v2 0/2] firmware: arm_scmi: Ensure automatic module
 loading
To: Brian Masney <bmasney@redhat.com>
Cc: Sudeep Holla <sudeep.holla@kernel.org>,
        Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>,
        Cristian Marussi <cristian.marussi@arm.com>,
        Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>, arm-scmi@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-kbuild@vger.kernel.org, Stephen Boyd <sboyd@kernel.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Viresh Kumar <viresh.kumar@linaro.org>, Frank Li <Frank.Li@nxp.com>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>, Guenter Roeck <linux@roeck-us.net>,
        Jyoti Bhayana <jbhayana@google.com>,
        Jonathan Cameron <jic23@kernel.org>,
        David Lechner <dlechner@baylibre.com>,
        =?UTF-8?Q?Nuno_S=C3=A1?=
 <nuno.sa@analog.com>,
        Andy Shevchenko <andy@kernel.org>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Ulf Hansson <ulfh@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        linux-clk@vger.kernel.org, linux-pm@vger.kernel.org,
        imx@lists.linux.dev, linux-hwmon@vger.kernel.org,
        linux-iio@vger.kernel.org, linux-input@vger.kernel.org,
        linux-rtc@vger.kernel.org
References: <20260618-scmi-modalias-v2-0-8c7547c1be21@oss.qualcomm.com>
 <8c2a4ae3-95cc-489a-a7a4-90a3ee2597e9@oss.qualcomm.com>
 <20260709-spicy-fiery-squid-6eec1d@sudeepholla>
 <dae4deba-7e5f-434e-80ae-89033bdeb793@oss.qualcomm.com>
 <ak-h8oPcL69fCUg2@redhat.com>
Content-Language: en-US, nl
In-Reply-To: <ak-h8oPcL69fCUg2@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA5MDEzNyBTYWx0ZWRfX0opp0fcUsWQ5
 +OoSd/ucaA7EFx8JAxQt3+7z8AYryEAzqtsRzXhQ2PxkiusbqXSIvR453isVT6tgrdRthOhBewx
 9VPaH5V1L9oyLWq3O1wf/VXEQn00pge7HRxerhjfAa5qepM/+ZSUhz1YNth5CLmfvU4CV1bMn2k
 ARakvJJTJm+6IVg6A7Lw3K7LY7Zk7RHwZhxB4eA41GUkL0ra2j97p1fmQe+E0UODBSBEhkip308
 nVPZAq48RT89F/kFUyeRbslDI4Krl7wdeyhnMAryleXB4BlX2VHSEC9Z2otJsJG6KIlha+8YPIq
 qDFK6Xv/gK29XQdyfoKlRZKvU58VgCiua1+6uk+oBA39qg6nAwXLMHbRjPsHq87z5CmFbbd9rAz
 2KdXykV7kPKs3/q+U2IjHvAGFs0utLeUK5Tyd61Tf/RrvyJYdlA1bSBJXaFGnmQeSJz6nvC6ONq
 bKlH5vuX1RAN9S5AiMA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA5MDEzNyBTYWx0ZWRfXz/UgjnWuQtp6
 C94qvICVQkqawUJyLC+6qrbTE1xVPGqbU8gr+W63R+lJk4JQLL6l0ca6rlDtYTIWjPOUSE1T9Qz
 zs/1d6b8rs5+XBq0hFrcrVqWt/HJOTE=
X-Proofpoint-GUID: 8OrGZCKMfw_Ob1JaQfvpgN18yArXwYbc
X-Proofpoint-ORIG-GUID: 8OrGZCKMfw_Ob1JaQfvpgN18yArXwYbc
X-Authority-Analysis: v=2.4 cv=GJ441ONK c=1 sm=1 tr=0 ts=6a4fab18 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=1Iq74HBXAAAA:20
 a=EUspDBNiAAAA:8 a=F1v2bmbY3Q6w0W2l7n4A:9 a=QEXdDO2ut3YA:10
 a=1HOtulTD9v-eNWfpl4qZ:22 a=bA3UWDv6hWIuX7UZL3qL:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-09_03,2026-07-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 bulkscore=0 priorityscore=1501
 clxscore=1015 suspectscore=0 spamscore=0 phishscore=0 adultscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607090137

Hi Brian,

On 9-Jul-26 15:28, Brian Masney wrote:
> Hi Hans,
> 
> On Thu, Jul 09, 2026 at 03:22:29PM +0200, Hans de Goede wrote:
>> On 9-Jul-26 12:10, Sudeep Holla wrote:
>>> On Thu, Jun 18, 2026 at 10:31:12PM +0200, Hans de Goede wrote:
>>>> On 18-Jun-26 17:56, Bjorn Andersson wrote:
>>>>> SCMI drivers such as the Arm SCMI CPUfreq driver are allowed to built as
>>>>> modules, but they are then not automatically loaded. Rework the SCMI
>>>>> device table alias support to make modpost consume the information from
>>>>> MODULE_DEVICE_TABLE(scmi, ...) and allow drivers to be loaded based on
>>>>> this information, if known. Also add a protocol-based alias to also
>>>>> trigger driver loading when only the SCMI protocol id is known.
>>>>>
>>>>> Signed-off-by: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
>>>>
>>>> So I just gave this a test spin and unfortunately it does not work.
>>>>
>>>> The problem with Fedora's kernel-config / setup is that the
>>>> request_module() from patch 2/2 runs from the initramfs, but
>>>> the scmi_cpufreq module is only available in the rootfs.
>>>>
>>>> It does work if I explictly add the scmi_cpufreq module to
>>>> the initramfs, then it does get autoloaded.
>>>>
>>>> We really need some place to put a uevent sysfs attr which then
>>>> gets replayed when udev is restarted from the rootfs and then
>>>> re-reads all the uevent files as part of its coldplug
>>>> enumeration.
>>>>
>>>
>>> I don't have much knowledge on uevent to provide any suggestions/help.
>>> But isn't this a generic requirement ? I mean you could have modules
>>> install on the rootfs and not all of them are packed in initramfs ?
>>> Just wondering if that works for other modules, we can examine how
>>> do they work and what are we missing ?
>>
>> scmi is special because the actual devices under /sys/bus/scmi/devices
>> only get created when the module with the driver is loaded because
>> of some funtion/id mapping requiring info from the driver.
>>
>> Patch 2/2 tries to work around this by loading all scmi drivers matching
>> the scmi protocol which is known at bus enumeration time, but this only
>> works if the actual scmi driver is in the initramfs because this done
>> through directly calling modprobe() from the kernel which does not
>> get "replayed" when switching to the real rootfs.
> 
> Should the SCMI drivers be added to the dracut module here?
> 
> https://github.com/dracut-ng/dracut/blob/main/modules.d/70kernel-modules/module-setup.sh#L73
> 
> A few years ago we had to add the interconnect drivers to the list for
> Fedora.

That would be one solution. I first want to understand the problem better
though. The scmi bus not creating the devices until the kmod with the driver
has loaded is weird. I wonder if we can just move a small part of the drivers
(some mapping table) into the bus code and then just have this work as it
does on regular busses. I hope to be able to make some time to look into
this soonish.

Regards,

Hans


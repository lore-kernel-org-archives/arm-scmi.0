Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1D9E21ABD7
	for <arm-scmi@vger.kernel.org>; Mon, 24 Aug 2026 20:17:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787602638; cv=none; b=VCHE2ECopMWq+Le+Ey3MjWit1BIOqlnBULi8Y5ELLNjlBbxEmxehXQ4LMb6dWLskNlc7DT0YbFo08f6Vk1MSaHjre4x6S0x/adED+Y6lWEO88kU2+OtHBHzZCh48sWtmun/3tS/J4eQI2Fynfxo9mjN52Gu9U4ekhlNi8X0qkdw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787602638; c=relaxed/simple;
	bh=FrICCQh5aAfQgi27EtkEMNrE9dT5gMDkJCGwQgRXH1s=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=GVrGtVv0duQ/zBq/rU+U//eCHEIt+BAlAeI7ph/RY/t4yj/ZJweAOzoqz6oFMalTcsxUEA+gnqCSUurKSTePYG+r9GJNpEidAQmXLwAPKHOYhAMQeHHOQV29CFjN6b9DjBl3sA1hNoDWBQRxcYdK9065QvqkX916UfQVjF7dBzw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=e9UrLpcc; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=bNjaBsZi; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="e9UrLpcc";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="bNjaBsZi"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67OJH0eM3914656
	for <arm-scmi@vger.kernel.org>; Mon, 24 Aug 2026 20:17:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	uDfNn6ZkuVUckNcHdWcF1WCAnQ7dEUXe9KWFA34txlQ=; b=e9UrLpccgliA+c0F
	UJjKIkVXqcf4iO3ZYvzvpsn1C3LyanXvpPEGGkuW2CdjbNge31I6Tf9iel+Y6VXU
	Y/oRRI9HPw2ZJRMIsi+BDB9nm4C/DD5CKILk45dUpiVMFIpiMh8X2OM8pKjcQ3XL
	EfaCHbtd0oc6uOyFxj17ZeBkgdnt6FzaWsOILK6IeGkeS9R6cApWSLSfUcLCgKe7
	mbiXhTBfan9l5ujUNPVMa+61SGp0TpzSPMFROY0v4Nm/wFZNKBEOtmDP3O5+WSiW
	kPqG/X/zMigePT6gt9Wl+716WQ5RykG4e5bdBjEcFYsUdKPbJYm0zOnf5cLou6ta
	c2NlXg==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g8pkdhtcd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <arm-scmi@vger.kernel.org>; Mon, 24 Aug 2026 20:17:15 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2cfa4e4684bso39448715ad.2
        for <arm-scmi@vger.kernel.org>; Mon, 24 Aug 2026 13:17:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787602634; x=1788207434; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:organization
         :references:in-reply-to:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=uDfNn6ZkuVUckNcHdWcF1WCAnQ7dEUXe9KWFA34txlQ=;
        b=bNjaBsZiC/8PUp4FA+Qg05h7FMWAitCVUVwMeH2TsvHsvRMq9Y5zfcnUX9k1Xiurrd
         SPFFaF7g/AgMfQW8nTEa7DBDJJRDjbwvAXRCv7DcM1zE9JqjkKSYPteC60aDj097VEW8
         SyMTQpp8DWAxF1ocgV6SlifdPfM8N0O7NdpSBMwtTG17xj72GHYo48K6I+poqwh+Xe44
         lb/zCG+IevXKMam3m7R2sX/5eQZDH6APULNmX7qfzqr/H4bxFM1QMRpGbEWGcjkDuY3Z
         PtH+beCIWrpDpHqtBtKlbgjNKbL8SKdqAxZQGAENJF5+B61etwHU4SnStPGKiK4Y3UIV
         rJ3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787602634; x=1788207434;
        h=content-transfer-encoding:content-type:mime-version:organization
         :references:in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=uDfNn6ZkuVUckNcHdWcF1WCAnQ7dEUXe9KWFA34txlQ=;
        b=I2iw+2E/upG3pqvltkMlkqH+oW1NCeBB9z2FXLSwtI07FPZXCA7Oj25BcuKCgXueIw
         V8h4yI8zjJjc/SzmKn3JHfOzkizb2Chxd50B1DesTuTgxZyzFBDY/t3AO0GR1UA6Cuzt
         4/Mo9e3k/6kPPwx2k7UM0is4cnWkKztJUr4v3hXzzRfVx5H+IXoiDxzDQSd4O2HQiLT9
         Pb/JbOwa+CamC4B66QqzWhGPmlRkL1FaO3VFVoKBnsNDKWIQQK2TlizmeUHT7Z22c6v+
         XTeA1X4H45GIeHUoRtic8UeKESp5iaTYTzDJF8QmGj2VBN/jS9WfSxOKOQoAJT9fouck
         r7ew==
X-Gm-Message-State: AFuF++mtWuV1iBikxle9OZwyJEO2gf0GrymnrOrxW1KEqjcb2O4T18GO
	aBK5te2h3wGMNHDpyngYnImdJ6vysHNxUEgJ5yaSfzk0Khf940KUHl4cBG2ikt8wYE7Lm4HYgWT
	B/XILMZazWSxO0/v699BKp0wE9GOXhvaS+KrjLTyXwiQ8Te85XAAW/MKxiv124LjZNQkglg==
X-Gm-Gg: AR+sD12OXeM18Ubltu9rZv2DVZJR0NMPmo9wDpFsv8swSf00DmtvFccKRko/90pPi9u
	vKFRWwqpTov2I4N5eXZ32UG/Qr5U20fdyeoKTCy8Ga0AzJb+e6M7aYeB2fgcTHVr5I0c+bMQj7D
	pFKoIpxfdMEOz+fc5zi39l9Cf2S/9s6WchFyEeU+wrnWZmm4LVbYMR3lIl/rrsEhhjjU7/lr+Dl
	AbS5/ZWEH9rFQxxgBCK2f2NzgFGgUHjNb+76qaZulc4G9EoPoki9rBg4OPG5IM3gczevj9ZoJj2
	XEiKdSx4DjxjkuVMTsIRi68JyOTx5k1dXTN3EXC5h89HGjJ71IDtEp9Uz6DOv+wjzDJ5oV+oZ7M
	POD6jANePcakSxA/WRqulrpdKHA==
X-Received: by 2002:a17:902:c411:b0:2ca:d9b3:715e with SMTP id d9443c01a7336-2d6dcc5a69dmr24868285ad.9.1787602633932;
        Mon, 24 Aug 2026 13:17:13 -0700 (PDT)
X-Received: by 2002:a17:902:c411:b0:2ca:d9b3:715e with SMTP id d9443c01a7336-2d6dcc5a69dmr24867405ad.9.1787602633395;
        Mon, 24 Aug 2026 13:17:13 -0700 (PDT)
Received: from localhost ([50.35.46.84])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-327f91d33dcsm37323445eec.18.2026.08.24.13.17.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Aug 2026 13:17:13 -0700 (PDT)
Date: Mon, 24 Aug 2026 13:17:09 -0700
From: Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>
To: Sudeep Holla <sudeep.holla@kernel.org>
Cc: arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        kernel-team@meta.com, Cristian Marussi <cristian.marussi@arm.com>,
        Breno
 Leitao <leitao@debian.org>
Subject: Re: [PATCH v3 7/9] firmware: arm_scmi: Add ACPI PCC transport
Message-ID: <20260824131709.00006712@oss.qualcomm.com>
In-Reply-To: <20260813-acpi_scmi_pcc-v3-7-cb6b88b4ebb3@kernel.org>
References: <20260813-acpi_scmi_pcc-v3-0-cb6b88b4ebb3@kernel.org>
	<20260813-acpi_scmi_pcc-v3-7-cb6b88b4ebb3@kernel.org>
Organization: Qualcomm
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.51; x86_64-w64-mingw32)
Precedence: bulk
X-Mailing-List: arm-scmi@vger.kernel.org
List-Id: <arm-scmi.vger.kernel.org>
List-Subscribe: <mailto:arm-scmi+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:arm-scmi+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI0MDE3MSBTYWx0ZWRfX8jt/jQbkA3QJ
 7wU/obmDj5XN4RgPGWX5LQ5mWGPQZEtDJRzS0Dae2GnIfgItrLRfQFBvVM0E+FxBgzynEskleuW
 T2nhAlvOZN4CFKJj6J3+yYJgUGGnbuE=
X-Proofpoint-ORIG-GUID: 237557B0Cr8VLGNAi-b2eGmLcl3xHPuc
X-Proofpoint-GUID: 237557B0Cr8VLGNAi-b2eGmLcl3xHPuc
X-Authority-Analysis: v=2.4 cv=Kq19H2WN c=1 sm=1 tr=0 ts=6a8ca6cb cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=qC1CW/w66vtJz1P9yTJxNA==:17
 a=kj9zAlcOel0A:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=VwQbUJbxAAAA:8 a=gKCm91LoYRcT0GxQChYA:9 a=CjuIK1q_8ugA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI0MDE3MSBTYWx0ZWRfX3UjNzjP9tpDe
 Qv6azsk6jl+L6F87Yz7HAtaqKqLW/wkADrCxp96bc6nAvnCP4jMgdHFerbm5IYtroPipovBw9mn
 Rn6Js6N2zNYmZfy2kWZI9EEQ067+gUrg7SRqvGKHchW2v0jGHYHCAz3XjH4zoRTVU+UJ/czPZY7
 ccM6XZAy8s+prWheUgIuljZD4TE1kruYrRppGJ/LiBLTttxSdb3tVIuaVBZbHFkFM+mdkLS30OY
 1OTxao9DiQMppIgpeb/rJvkzIj5QXSWhqqmGEwXe+t+ArCnLpPgm+DvERhsYqvUKODY5LQ5LAiQ
 Oo1ogBbo+I4dB420+vH0dh1ObshvNFwOUA2wEZKVa9JDXYZ0ijKQvyugNP/jknyS/nHT3xIUMcj
 Z3x63p4kdTKliLezAwlIOEZJ6gxB8LyQCxKGKD3n9lQNbVL3YpDQ0FFkneOfnassaAByzIq5i4P
 AXsCcwA8mXupaI3jSQQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-24_06,2026-08-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 phishscore=0 bulkscore=0 clxscore=1015
 adultscore=0 spamscore=0 priorityscore=1501 malwarescore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608240171

On Thu, 13 Aug 2026 12:33:02 +0100
Sudeep Holla <sudeep.holla@kernel.org> wrote:

> Introduce a new SCMI transport that uses ACPI PCCT (PCC) subspaces via
> the Linux PCC mailbox layer. Parse ACPI _DSD data to map protocol
> associations to PCC transport UIDs. Support common and
> protocol-exclusive A2P channels, plus optional common or
> protocol-exclusive P2A channels for notifications.
> 
> Key points:
> - new CONFIG_ARM_SCMI_TRANSPORT_PCC option
> - integration with SCMI core via scmi_desc and transport ops
> - response and notification fetch from PCC shared memory
> - ACPI device matching and registration via the ACPI transport macro
> 
> This enables SCMI to be exercised over PCC on ACPI platforms.
> 
> Signed-off-by: Sudeep Holla <sudeep.holla@kernel.org>
Hi Sudeep

This is quite dense and ACPI parsing code is always 'interesting'
Anyhow some comments inline

Jonathan

> ---
>  drivers/firmware/arm_scmi/common.h            |  11 +
>  drivers/firmware/arm_scmi/transports/Kconfig  |  13 +
>  drivers/firmware/arm_scmi/transports/Makefile |   2 +
>  drivers/firmware/arm_scmi/transports/pcc.c    | 791 ++++++++++++++++++++++++++
>  include/linux/scmi_protocol.h                 |   1 +
>  5 files changed, 818 insertions(+)
> 
> diff --git a/drivers/firmware/arm_scmi/common.h b/drivers/firmware/arm_scmi/common.h
> index 1ab4543e0f4a..3a49ea40aea5 100644
> --- a/drivers/firmware/arm_scmi/common.h
> +++ b/drivers/firmware/arm_scmi/common.h
> @@ -468,6 +468,17 @@ struct scmi_transport_core_operations {
>  	const struct scmi_message_operations *msg;
>  };
>  
> +struct scmi_dsd_info {
> +	u32 protocol_id;
> +	const char *const property_name;
> +};
> +
> +static const struct scmi_dsd_info scmi_dsd_info_list[] __maybe_unused = {
> +	{ SCMI_PROTOCOL_BASE, "arm-arml0001-transport-pcc"},

For symmetry needs a space before }

> +	{ SCMI_PROTOCOL_POWERCAP, "arm-arml0001-protocol-pcap"},
> +	{ SCMI_PROTOCOL_TELEMETRY, "arm-arml0001-protocol-telemetry"},

I guess it is trivial but I'd have been tempted to add the transport first
then follow up with the new protocol as a separate patch.

> +};
> +
>  /**
>   * struct scmi_transport_handle  - Transport instance handle
>   * @supplier_get: A helper to retrieve the device descriptor, identifying the
> diff --git a/drivers/firmware/arm_scmi/transports/Kconfig b/drivers/firmware/arm_scmi/transports/Kconfig
> index 57eccf316e26..1054165576b3 100644
> --- a/drivers/firmware/arm_scmi/transports/Kconfig
> +++ b/drivers/firmware/arm_scmi/transports/Kconfig
> @@ -77,6 +77,19 @@ config ARM_SCMI_TRANSPORT_OPTEE
>  	  This driver can also be built as a module. If so, the module
>  	  will be called scmi_transport_optee.
>  
> +config ARM_SCMI_TRANSPORT_PCC
> +	tristate "SCMI transport based on ACPI PCC"
> +	depends on PCC
> +	select ARM_SCMI_HAVE_TRANSPORT
> +	default y
We almost never do default y except when papering over new symbols for things

that were always built before.  Why is it appropriate here?

> +	help
> +	  Enable ACPI PCC mailbox based transport for SCMI.
> +
> +	  If you want the ARM SCMI PROTOCOL stack to include support for a
> +	  transport based on mailboxes, answer Y.
> +	  This driver can also be built as a module. If so, the module
> +	  will be called scmi_transport_pcc.
> diff --git a/drivers/firmware/arm_scmi/transports/pcc.c b/drivers/firmware/arm_scmi/transports/pcc.c
> new file mode 100644
> index 000000000000..337d551e3ad8
> --- /dev/null
> +++ b/drivers/firmware/arm_scmi/transports/pcc.c

> +/*
> + * SCMI specification requires all parameters, message headers, return
> + * arguments or any protocol data to be expressed in little endian
> + * format only.
> + */
> +struct pcc_shared_mem {
> +	struct acpi_pcct_ext_pcc_shared_memory header;
> +	u8 msg_payload[];

Can we do __counted_by header.length?
I'm not sure if that works or not.

> +};


...

> +
> +static int
> +acpi_scmi_dsd_parse_transport_package(struct pcc_transport_map *map,
> +				      const union acpi_object *obj)
> +{
> +	const union acpi_object *elems;
> +	u32 revision, pkg_cnt;
> +	unsigned int common_a2p = 0, common_p2a = 0;
> +	int idx;
> +
> +	if (obj->type != ACPI_TYPE_PACKAGE || obj->package.count < 2 ||
> +	    acpi_scmi_pkg_u32(obj, 0, &revision) ||
> +	    acpi_scmi_pkg_u32(obj, 1, &pkg_cnt))
> +		return -EINVAL;
> +	if (revision != SCMI_TRANSPORT_PACKAGE_MAX_VERSION)
> +		return -EINVAL;
> +	if (obj->package.count != pkg_cnt + 2)
> +		return -EINVAL;
> +
> +	for (idx = 0; idx < pkg_cnt; idx++) {

	for (int idx = 0; ...

> +		union acpi_object *pack = &obj->package.elements[idx + 2];
> +		struct pcc_transport *p, *tmp;
> +		u32 pcc_ss_id, uid;
> +		u64 flags;
> +
> +		elems = acpi_scmi_pkg_elements(pack, 3);
> +		if (!elems) {
> +			pr_info("Invalid transport properties pkg %d\n", idx);
> +			return -EINVAL;
> +		}
> +		if (acpi_scmi_pkg_u32(pack, 0, &pcc_ss_id) ||
> +		    acpi_scmi_pkg_u32(pack, 1, &uid) ||
> +		    acpi_scmi_pkg_u64(pack, 2, &flags))
> +			return -EINVAL;
> +		if (flags & ~SCMI_TRANSPORT_FLAGS_MASK)
> +			return -EINVAL;
> +
> +		hash_for_each_possible(map->table, tmp, hnode, uid) {
> +			if (tmp->uid == uid) {
> +				pr_info("Duplicate UID %d\n", uid);
> +				return -EEXIST;
> +			}
> +		}
> +
> +		p = kzalloc(sizeof(*p), GFP_KERNEL);
> +		if (!p)
> +			return -ENOMEM;
> +
> +		p->uid = uid;
> +		p->pcc_ss_id = pcc_ss_id;
> +		p->flags = flags;
> +		if (p->flags & SCMI_TRANSPORT_SHARED_CHANNEL) {
> +			p->protocol_id = SCMI_PROTOCOL_BASE;
> +			if (p->flags & SCMI_TRANSPORT_P2A_CHANNEL)
> +				common_p2a++;
> +			else
> +				common_a2p++;
> +		}
> +
> +		hash_add(map->table, &p->hnode, uid);
> +	}
> +
> +	if (common_a2p != 1 || common_p2a > 1)
> +		return -EINVAL;

If you are just going to fail on larger counts, why not do it earlier
as you do in some of the other similar functions when a repeat is seen?
If they need to be in the hash table anyway add a comment.

> +
> +	return 0;
> +}
> +
> +static int
> +acpi_scmi_dsd_parse_protocol_subpackage(struct pcc_transport_map *map,
> +					const union acpi_object *obj,
> +					int prot_id)
> +{
> +	bool found, tx_found = false, rx_found = false;
> +	u32 uid;
> +	int idx, ret = 0;
> +	struct pcc_transport *p;
> +	unsigned int pkg_cnt = obj->package.count;

Not sure if you've standardized on an ordering I can't spot for declarations.
If not pick one for the whole file.

> +
> +	if (pkg_cnt > 2) {
> +		pr_warn("Only 2 channels: one Tx and one Rx needed\n");
Not sure that's helpful.  "%u channels found, only 2 needed ... 


> +		return -EINVAL;
> +	}
> +

	for (u32 idx = 0; ...

> +	for (idx = 0; idx < pkg_cnt; idx++) {
> +		union acpi_object *pack = &obj->package.elements[idx];
> +		u64 flags;
> +
> +		if (!acpi_scmi_pkg_elements(pack, 2) ||

figure out how to avoid those magic 2s.

> +		    acpi_scmi_pkg_u32(pack, 0, &uid) ||
> +		    acpi_scmi_pkg_u64(pack, 1, &flags))
> +			return -EINVAL;
> +		if (flags)
> +			return -EINVAL;
> +
> +		found = false;
> +		hash_for_each_possible(map->table, p, hnode, uid) {
> +			if (p->uid != uid)
> +				continue;
> +
> +			found = true;
> +			if (p->flags & SCMI_TRANSPORT_SHARED_CHANNEL) {
> +				pr_info("Invalid! %d channel is shared\n",
> +					p->pcc_ss_id);
> +				ret = -EINVAL;
> +				break;
> +			}
> +			if (p->protocol_id && p->protocol_id != prot_id)
> +				return -EINVAL;
> +
> +			if (p->flags & SCMI_TRANSPORT_P2A_CHANNEL) {
> +				if (rx_found)
> +					return -EINVAL;
> +				rx_found = true;
> +			} else {
> +				if (tx_found)
> +					return -EINVAL;
> +				tx_found = true;
> +			}
> +			p->protocol_id = prot_id;
> +			break;
> +		}
> +
> +		if (ret)
> +			return ret;
Might as well return above.  You do in some paths already.

> +		if (!found)
> +			return -ENOENT;
> +	}
> +
> +	return ret;
Can you get here with ret != 0?
	return 0 probably as this is the normal exit path.

> +}
> +
> +static int
> +acpi_scmi_dsd_parse_protocol_package(struct pcc_transport_map *map,
> +				     const union acpi_object *obj, int prot_id)
> +{
> +	const union acpi_object *elems;
> +	const union acpi_object *pack;
> +	u32 revision;
> +	int ret;
> +
> +	elems = acpi_scmi_pkg_elements(obj, 3);
> +	if (!elems || acpi_scmi_pkg_u32(obj, 0, &revision))
> +		return -EINVAL;
> +
> +	pack = &elems[1];
> +
> +	if (revision != SCMI_PROTOCOL_PACKAGE_MAX_VERSION)
> +		return -EINVAL;
> +
> +	if (pack->type != ACPI_TYPE_PACKAGE) {
> +		pr_info("Invalid protocol transport package\n");
> +		return -EINVAL;
> +	}
> +
> +	/* Empty protocol specific transport package allowed */

For a statement like that I'd kind of expect a spec reference.

> +	if (pack->package.count != 0) {
> +		ret = acpi_scmi_dsd_parse_protocol_subpackage(map, pack, prot_id);
> +		if (ret)
> +			return ret;
> +	}
> +
> +	pack = &elems[2];
> +	if (pack->type != ACPI_TYPE_PACKAGE) {
> +		pr_info("Invalid protocol transport association package\n");
> +		return -EINVAL;
> +	}
> +
> +	if (pack->package.count != 0) {
> +		pr_info("Non-empty association package not supported\n");
> +		return -EINVAL;
> +	}
> +
> +	return 0;
> +}

> +
> +static int acpi_scmi_parse_properties(struct pcc_transport_map *map,
> +				      const union acpi_object *properties)
> +{
> +	bool transport_found = false;
> +	int i;
> +
> +	if (properties->type != ACPI_TYPE_PACKAGE)
> +		return -EINVAL;
> +
> +	for (i = 0; i < properties->package.count; i++) {
> +		const union acpi_object *v;
> +		const char *name;
> +		int prot_id, ret;
> +
> +		ret = acpi_scmi_property(properties, i, &name, &v);
> +		if (ret)
> +			return ret;
> +
> +		prot_id = acpi_scmi_lookup_protocol_id(name);
> +		if (prot_id < 0)
> +			continue;
> +		if (prot_id != SCMI_PROTOCOL_BASE)
> +			continue;
> +		if (v->type != ACPI_TYPE_PACKAGE)
> +			return -EINVAL;
> +		if (transport_found)
> +			return -EEXIST;
> +
> +		ret = acpi_scmi_dsd_parse_transport_package(map, v);
> +		if (ret)
> +			return ret;
> +		transport_found = true;
> +	}
> +
> +	if (!transport_found)
> +		return -ENOENT;

This double loop needs a few more comments.  Why do we need to handle
the base protocol completely first? 

Maybe can factor it out to a helper that takes bool unique, bool base?
then we just get 2 calls to that.

> +
> +	for (i = 0; i < properties->package.count; i++) {
> +		const union acpi_object *v;
> +		const char *name;
> +		int prot_id, ret;
> +
> +		ret = acpi_scmi_property(properties, i, &name, &v);
> +		if (ret)
> +			return ret;
> +
> +		prot_id = acpi_scmi_lookup_protocol_id(name);

> +		if (prot_id < 0 || prot_id == SCMI_PROTOCOL_BASE)
> +			continue;
> +		if (v->type != ACPI_TYPE_PACKAGE)
> +			return -EINVAL;
> +
> +		ret = acpi_scmi_dsd_parse_protocol_package(map, v, prot_id);
> +		if (ret)
> +			return ret;
> +	}
> +
> +	return 0;
> +}
> +
> +static int acpi_scmi_namespace_fwnode_parse(struct fwnode_handle *fwnode,
> +					    struct pcc_transport_map *map)
> +{
> +	struct acpi_buffer buf = { ACPI_ALLOCATE_BUFFER, NULL };
> +	struct acpi_device *adev = to_acpi_device_node(fwnode);
> +	union acpi_object *desc;
> +	acpi_status status;
> +	int i, ret = -ENOENT;

ret is always overwritten I think.

> +
> +	if (!adev->handle)
> +		return -EINVAL;
> +
> +	status = acpi_evaluate_object_typed(adev->handle, "_DSD", NULL, &buf,
> +					    ACPI_TYPE_PACKAGE);
> +	if (ACPI_FAILURE(status))
> +		return -EINVAL;
> +
> +	desc = buf.pointer;
> +	if (desc->package.count % 2)

		ret = -EINVAL;
		goto out_free;
	}

> +		goto out_free_inval;
> +
> +	/* Look for the device properties GUID. */
> +	for (i = 0; i < desc->package.count; i += 2) {
	for (int i = 0; i < ...

acceptable in kernel these days and keeps scope tight.
Any way to justify that 2 as sizeof of something?  If not
maybe a define is appropriate.
(applies above as well.)

> +		const union acpi_object *guid;
> +		const union acpi_object *properties;
> +
> +		guid = &desc->package.elements[i];
> +		properties = &desc->package.elements[i + 1];
> +
> +		/*
> +		 * The first element must be a GUID and the second one must be
> +		 * a package.
> +		 */
> +		if (guid->type != ACPI_TYPE_BUFFER ||
> +		    guid->buffer.length != UUID_SIZE ||
> +		    properties->type != ACPI_TYPE_PACKAGE)
> +			continue;
> +
> +		if (!guid_equal((guid_t *)guid->buffer.pointer,
> +				&acpi_scmi_uuid))
> +			continue;
> +
> +		ret = acpi_scmi_parse_properties(map, properties);
> +		goto out_free;

		break maybe if this doesn't get more complex in later
patches.

> +	}
> +
> +out_free:
> +	ACPI_FREE(buf.pointer);
> +	return ret;
> +out_free_inval:
> +	ret = -EINVAL;
> +	goto out_free;

Two different error paths and one that folds back is not a nice to
read code structure.  Particularly as second one only sets a return
value.  Just set that at the callers.

> +}


> +static
> +struct pcc_transport_map *pcc_transport_map_get(struct fwnode_handle *fwnode)
> +{
> +	struct pcc_transport_map *map;
> +	int ret;
> +
> +	map = pcc_transport_map_find(fwnode);
> +	if (map)
> +		return map;
> +
> +	map = kzalloc_obj(*map, GFP_KERNEL);
> +	if (!map)
> +		return ERR_PTR(-ENOMEM);
> +
> +	hash_init(map->table);
> +	ret = acpi_scmi_namespace_fwnode_parse(fwnode, map);
> +	if (ret)
> +		goto err_free_map;
> +
> +	ret = pcc_transport_map_validate(map);
> +	if (ret)
> +		goto err_free_map;
> +
> +	map->fwnode = fwnode_handle_get(fwnode);
> +	list_add_tail(&map->node, &pcc_transport_maps);
> +
> +	return map;
> +
> +err_free_map:
> +	acpi_scmi_destroy_transport_map(map);

Personally I'd prefer seeing each step being unwound only when necessary.
So break it out here as as series of labels.


> +	return ERR_PTR(ret);
> +}
> +
> +static int pcc_lookup_ss_id(struct pcc_transport_map *map, u32 prot_id, bool tx)
> +{
> +	struct pcc_transport *p;
> +	int idx;
> +
> +	hash_for_each(map->table, idx, p, hnode) {
> +		if (p->protocol_id != prot_id)
> +			continue;
> +
> +		if ((!tx && (p->flags & SCMI_TRANSPORT_P2A_CHANNEL)) ||
> +		    (tx && !(p->flags & SCMI_TRANSPORT_P2A_CHANNEL)))
> +			return p->pcc_ss_id;
> +	}
> +
> +	return -ENOENT;
> +}
> +
> +static int pcc_get_ss_id(struct fwnode_handle *fwnode, u32 prot_id, bool tx)
> +{
> +	struct pcc_transport_map *map;
> +	int ret;
> +
> +	if (!fwnode)
> +		return -EINVAL;
> +
> +	mutex_lock(&pcc_transport_maps_lock);
	
	guard(mutex)(&pcc_transport_maps_lock);

> +	map = pcc_transport_map_get(fwnode);
> +	if (IS_ERR(map))
> +		ret = PTR_ERR(map);
		return PTR_ERR(map)

	return pcc_lookup_ss_id(map, prot_id, tx);

> +	else
> +		ret = pcc_lookup_ss_id(map, prot_id, tx);
> +	mutex_unlock(&pcc_transport_maps_lock);
> +
> +	return ret;
> +}

> +
> +static int pcc_chan_free(int id, void *p, void *data)
> +{
> +	struct scmi_chan_info *cinfo = p;
> +	struct scmi_pcc *smbox = cinfo->transport_info;
> +
> +	if (smbox && !IS_ERR(smbox->pchan)) {

Maybe an early exit is neater?

	if (!smbox || IS_ERR(smbox->pchan)
		return 0;

> +		pcc_mbox_free_channel(smbox->pchan);
> +		cinfo->transport_info = NULL;
> +		smbox->pchan = NULL;
> +		smbox->cinfo = NULL;
> +	}
> +
> +	return 0;
> +}

> +static void pcc_fetch_response(struct scmi_chan_info *cinfo,
> +			       struct scmi_xfer *xfer)
> +{
> +	struct scmi_pcc *smbox = cinfo->transport_info;
> +	struct pcc_shared_mem __iomem *shmem = smbox->pchan->shmem;
> +	size_t len = ioread32(&shmem->header.length);
> +
> +	xfer->hdr.status = ioread32(shmem->msg_payload);
> +	/* Skip the length of header and status in shmem area i.e 8 bytes */
> +	xfer->rx.len = min_t(size_t, xfer->rx.len, len > 8 ? len - 8 : 0);
> +
> +	/* Take a copy to the rx buffer.. */

As below - that bit is obvious.

> +	memcpy_fromio(xfer->rx.buf, shmem->msg_payload + 4, xfer->rx.len);

So you compute the length skipping 8 but then copy 4 in.  That needs an explanatory
comment if correct.

> +}
> +
> +static void pcc_fetch_notification(struct scmi_chan_info *cinfo, size_t max_len,
> +				   struct scmi_xfer *xfer)
> +{
> +	struct scmi_pcc *smbox = cinfo->transport_info;
> +	struct pcc_shared_mem __iomem *shmem = smbox->pchan->shmem;
> +	size_t len = ioread32(&shmem->header.length);
> +
> +	/* Skip only the length of header in shmem area i.e 4 bytes */

Ideally get that header size from a define rather than magic 4.

> +	xfer->rx.len = min_t(size_t, max_len, len > 4 ? len - 4 : 0);

min() preferred unless we are hitting one of the weird corner cases (don't think so)

> +
> +	/* Take a copy to the rx buffer.. */

Kind of obvious - maybe say why if that is useful, or drop the comment.

> +	memcpy_fromio(xfer->rx.buf, shmem->msg_payload, xfer->rx.len);
> +}
> +
> +static const struct scmi_transport_ops scmi_pcc_ops = {
> +	.chan_available = pcc_chan_available,
> +	.chan_setup = pcc_chan_setup,
> +	.chan_free = pcc_chan_free,
> +	.send_message = pcc_send_message,
> +	.fetch_response = pcc_fetch_response,
> +	.fetch_notification = pcc_fetch_notification,
> +};
> +
> +static struct scmi_desc scmi_pcc_desc = {
> +	.ops = &scmi_pcc_ops,
> +	.max_rx_timeout_ms = 30,	/* We may increase this if required */

That's always true - so what does the comment bring us?

> +	.max_msg = 20,		/* Limited by MBOX_TX_QUEUE_LEN */

If this is relevant to this driver, why can't see see it via a suitable header?
Feels to me like this is in the wrong place or needs a query interface.

> +	.max_msg_size = SCMI_SHMEM_MAX_PAYLOAD_SIZE - 12,
> +};
> +
> +static const struct acpi_device_id scmi_acpi_ids[] = {
> +	{ "ARML0001", 0 },

Uwe is driving an effort to make these all named initializers. 
+ Don't set anything you don't use as it makes refactors a pain.
Uwe has also been deleting those throughout the kernel!

> +	{ }
> +};
> +
> +MODULE_DEVICE_TABLE(acpi, scmi_acpi_ids);
> +
> +DEFINE_SCMI_ACPI_TRANSPORT_DRIVER(scmi_pcc, scmi_pcc_driver,
> +				  scmi_pcc_desc, scmi_acpi_ids, core);
> +
> +static int __init scmi_pcc_init(void)
> +{
> +	return platform_driver_register(&scmi_pcc_driver);
> +}
> +
> +static void __exit scmi_pcc_exit(void)
> +{
> +	platform_driver_unregister(&scmi_pcc_driver);
> +
> +	mutex_lock(&pcc_transport_maps_lock);

I'd move the locking into acpi_scmi_clear_transport_maps()

I'm not immediately understanding why, when all setup in this
driver is associated with the registered driver, this bit
of tear down can't be done as part of the driver remove.


> +	acpi_scmi_clear_transport_maps();
> +	mutex_unlock(&pcc_transport_maps_lock);
> +}
> +module_init(scmi_pcc_init);
> +module_exit(scmi_pcc_exit);
> +
> +MODULE_AUTHOR("Sudeep Holla <sudeep.holla@kernel.org>");
> +MODULE_DESCRIPTION("SCMI ACPI PCC Transport driver");
> +MODULE_LICENSE("GPL");
> diff --git a/include/linux/scmi_protocol.h b/include/linux/scmi_protocol.h
> index 5ab73b1ab9aa..02cf04543151 100644
> --- a/include/linux/scmi_protocol.h
> +++ b/include/linux/scmi_protocol.h
> @@ -930,6 +930,7 @@ enum scmi_std_protocol {
>  	SCMI_PROTOCOL_VOLTAGE = 0x17,
>  	SCMI_PROTOCOL_POWERCAP = 0x18,
>  	SCMI_PROTOCOL_PINCTRL = 0x19,
> +	SCMI_PROTOCOL_TELEMETRY = 0x1B,
>  };
>  
>  enum scmi_system_events {
> 


Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C8A45212B1F;
	Wed, 22 Jan 2025 12:14:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737548091; cv=none; b=mFfEYX2F1uvUefbalP5Xa3Z/FOROwnLoxFQzmEJSXoQk/Phqgfn3kzXrJWXtAQfMsvQBe4SVJLqt8BiGYY+3BCqtJdV1HuPoJKjI5yWaootN3+xqh/r84H6dYN/ZdjSTKS57cYECW+PSIxC6zAv/2a9pfvTxEEog8IWGXH2QmHM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737548091; c=relaxed/simple;
	bh=/kHv5CzDxTj2bf3cpAjNKraBhwFQz8Nn8HsEKhNiqqU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Y4GuStO+v9Leq1eUhy8eUufg0Ommn5dJqMObHmrwOAc+FHB8ubQowaJAY0jTpSZcE8Zyz03cOKW5bRovkjaYNMOEr/WYOH/cvYuMXvgAa5/zESOEYC5JKnViNW+CGPt9jt1fSE+eoKJkRPZ4n9Y0mTHrPbpLsw0AdeRqhLx8Hjc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A6A3D1007;
	Wed, 22 Jan 2025 04:15:16 -0800 (PST)
Received: from bogus (e133711.arm.com [10.1.196.55])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 037F63F738;
	Wed, 22 Jan 2025 04:14:45 -0800 (PST)
Date: Wed, 22 Jan 2025 12:14:43 +0000
From: Sudeep Holla <sudeep.holla@arm.com>
To: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Cc: Cristian Marussi <cristian.marussi@arm.com>,
	Sudeep Holla <sudeep.holla@arm.com>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, <linux-kernel@vger.kernel.org>,
	<arm-scmi@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<imx@lists.linux.dev>, Peng Fan <peng.fan@nxp.com>
Subject: Re: [PATCH 3/5] firmware: arm_scmi: imx: Add LMM and CPU
 documentation
Message-ID: <Z5DhM1VLv2uCCVwT@bogus>
References: <20250121-imx-lmm-cpu-v1-0-0eab7e073e4e@nxp.com>
 <20250121-imx-lmm-cpu-v1-3-0eab7e073e4e@nxp.com>
Precedence: bulk
X-Mailing-List: arm-scmi@vger.kernel.org
List-Id: <arm-scmi.vger.kernel.org>
List-Subscribe: <mailto:arm-scmi+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:arm-scmi+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250121-imx-lmm-cpu-v1-3-0eab7e073e4e@nxp.com>

On Tue, Jan 21, 2025 at 11:08:13PM +0800, Peng Fan (OSS) wrote:
> From: Peng Fan <peng.fan@nxp.com>
> 
> Add i.MX95 Logical Machine Management and CPU Protocol documentation.
>

Please make this the first patch when you need to respin this(which is
clearly not yet 😁)

> Signed-off-by: Peng Fan <peng.fan@nxp.com>
> ---
>  drivers/firmware/arm_scmi/vendors/imx/imx95.rst | 692 ++++++++++++++++++++++++
>  1 file changed, 692 insertions(+)
> 
> diff --git a/drivers/firmware/arm_scmi/vendors/imx/imx95.rst b/drivers/firmware/arm_scmi/vendors/imx/imx95.rst
> index b2dfd6c46ca2f5f12f0475c24cb54c060e9fa421..384d4f9c27e489a9c54cdde79c9f03a6f5979630 100644
> --- a/drivers/firmware/arm_scmi/vendors/imx/imx95.rst
> +++ b/drivers/firmware/arm_scmi/vendors/imx/imx95.rst
> @@ -32,6 +32,419 @@ port, and deploy the SM on supported processors.
>  The SM implements an interface compliant with the Arm SCMI Specification
>  with additional vendor specific extensions.
>  
> +SCMI_LMM: System Control and Management Logical Machine Management Vendor Protocol
> +==================================================================================
> +
> +This protocol is intended for boot, shutdown, and reset of other logical
> +machines (LM). It is usually used to allow one LM to manager another used
> +as an offload or accelerator engine.

The above statement is very hard to parse. Can it be
"
It is usually used to allow one LM(e.g. OSPM) to manage another LM which
is usually an offload or accelerator engine.
"
if I understood it correctly ?

> Notifications from this protocol can
> +also be used to manage a communication link to another LM. The LMM protocol
> +provides functions to:
> +
> +- Describe the protocol version.
> +- Discover implementation attributes.
> +- Discover the LMs defined in the system.
> +- Boot an LM.
> +- Shut down an LM.
> +- Reset an LM.
> +- Wake an LM from suspend.
> +- Suspend an LM (gracefully).
> +- Request a graceful shutdown or reset of an LM.

Does that mean above "Shut down an LM" and "Reset an LM" are forced ones ?

> +- Allow an agent to forcibly power down or reset an LM.

How is this different from the above ?

> +- Read boot/shutdown/reset information for an LM.
> +- Get notifications when an LM boots or shuts down.
> +
> +Commands:
> +_________
> +
> +PROTOCOL_VERSION
> +~~~~~~~~~~~~~~~~
> +
> +message_id: 0x0
> +protocol_id: 0x80
> +
> ++---------------+--------------------------------------------------------------+
> +|Return values                                                                 |
> ++---------------+--------------------------------------------------------------+
> +|Name           |Description                                                   |
> ++---------------+--------------------------------------------------------------+
> +|int32 status   | See ARM SCMI Specification for status code definitions.      |
> ++---------------+--------------------------------------------------------------+
> +|uint32 version | For this revision of the specification, this value must be   |
> +|               | 0x10000.                                                     |
> ++---------------+--------------------------------------------------------------+
> +
> +PROTOCOL_ATTRIBUTES
> +~~~~~~~~~~~~~~~~~~~
> +
> +message_id: 0x1
> +protocol_id: 0x80
> +
> ++------------------+-----------------------------------------------------------+
> +|Return values                                                                 |
> ++------------------+-----------------------------------------------------------+
> +|Name              |Description                                                |
> ++------------------+-----------------------------------------------------------+
> +|int32 status      | See ARM SCMI Specification for status code definitions.   |
> ++------------------+-----------------------------------------------------------+
> +|uint32 attributes |Protocol attributes:                                       |
> +|                  |Bits[31:8] Reserved, must be zero.                         |
> +|                  |Bits[7:0] Number of Logical Machines                       |
> ++------------------+-----------------------------------------------------------+
> +
> +PROTOCOL_MESSAGE_ATTRIBUTES
> +~~~~~~~~~~~~~~~~~~~~~~~~~~~
> +
> +message_id: 0x2
> +protocol_id: 0x80
> +
> ++------------------+-----------------------------------------------------------+
> +|Return values                                                                 |
> ++------------------+-----------------------------------------------------------+
> +|Name              |Description                                                |
> ++------------------+-----------------------------------------------------------+
> +|int32 status      |SUCCESS: in case the message is implemented and available  |
> +|                  |to use.                                                    |
> +|                  |NOT_FOUND: if the message identified by message_id is      |
> +|                  |invalid or not implemented                                 |
> ++------------------+-----------------------------------------------------------+
> +|uint32 attributes |Flags that are associated with a specific function in the  |
> +|                  |protocol. For all functions in this protocol, this         |
> +|                  |parameter has a value of 0                                 |
> ++------------------+-----------------------------------------------------------+
> +
> +LMM_ATTRIBUTES
> +~~~~~~~~~~~~~~
> +
> +message_id: 0x3
> +protocol_id: 0x80
> +
> ++------------------+-----------------------------------------------------------+
> +|Parameters                                                                    |
> ++------------------+-----------------------------------------------------------+
> +|Name              |Description                                                |
> ++------------------+-----------------------------------------------------------+
> +|uint32 lmid       |ID of the Logical Machine                                  |
> ++------------------+-----------------------------------------------------------+
> +|Return values                                                                 |
> ++------------------+-----------------------------------------------------------+
> +|Name              |Description                                                |
> ++------------------+-----------------------------------------------------------+

Where are the actual attributes returned ?

> +|int32 status      |SUCCESS: if valid attributes are returned.                 |
> +|                  |NOT_FOUND: if lmId not points to a valid logical machine.  |
> +|                  |DENIED: if the agent does not have permission to get info  |
> +|                  |for the LM specified by lmid.                              |
> ++------------------+-----------------------------------------------------------+
> +
> +LMM_BOOT
> +~~~~~~~~
> +
> +message_id: 0x4
> +protocol_id: 0x80
> +
> ++------------------+-----------------------------------------------------------+
> +|Parameters                                                                    |
> ++------------------+-----------------------------------------------------------+
> +|Name              |Description                                                |
> ++------------------+-----------------------------------------------------------+
> +|uint32 lmid       |ID of the Logical Machine                                  |
> ++------------------+-----------------------------------------------------------+
> +|Return values                                                                 |
> ++------------------+-----------------------------------------------------------+
> +|Name              |Description                                                |
> ++------------------+-----------------------------------------------------------+
> +|int32 status      |SUCCESS: if LM successfully booted.                        |
> +|                  |NOT_FOUND: if lmId not points to a valid logical machine.  |
> +|                  |INVALID_PARAMETERS: if lmId is same as the caller.         |
> +|                  |DENIED: if the agent does not have permission to manage the|
> +|                  |the LM specified by lmid.                                  |
> ++------------------+-----------------------------------------------------------+
> +

Is this synchronous boot ? When will the notifications be used then ?

> +LMM_RESET
> +~~~~~~~~~
> +
> +message_id: 0x5
> +protocol_id: 0x80
> +
> ++------------------+-----------------------------------------------------------+
> +|Parameters                                                                    |
> ++------------------+-----------------------------------------------------------+
> +|Name              |Description                                                |
> ++------------------+-----------------------------------------------------------+
> +|uint32 lmid       |ID of the Logical Machine                                  |
> ++------------------+-----------------------------------------------------------+
> +|uint32 flags      |Reset flags:                                               |
> +|                  |Bits[31:1] Reserved, must be zero.                         |
> +|                  |Bit[0] Graceful request:                                   |
> +|                  |Set to 1 if the request is a graceful request.             |
> +|                  |Set to 0 if the request is a forceful request.             |


Ah so you have flag here then. I wonder why you need separate command then ?

> ++------------------+-----------------------------------------------------------+
> +|Return values                                                                 |
> ++------------------+-----------------------------------------------------------+
> +|Name              |Description                                                |
> ++------------------+-----------------------------------------------------------+
> +|int32 status      |SUCCESS: if LM successfully resets.                        |
> +|                  |NOT_FOUND: if lmId not points to a valid logical machine.  |
> +|                  |INVALID_PARAMETERS: if lmId is same as the caller.         |
> +|                  |DENIED: if the agent does not have permission to manage the|
> +|                  |the LM specified by lmid.                                  |
> ++------------------+-----------------------------------------------------------+
> +

Again, is this done synchronously ?

> +LMM_SHUTDOWN
> +~~~~~~~~~~~~
> +
> +message_id: 0x6
> +protocol_id: 0x80
> +
> ++------------------+-----------------------------------------------------------+
> +|Parameters                                                                    |
> ++------------------+-----------------------------------------------------------+
> +|Name              |Description                                                |
> ++------------------+-----------------------------------------------------------+
> +|uint32 lmid       |ID of the Logical Machine                                  |
> ++------------------+-----------------------------------------------------------+
> +|uint32 flags      |Reset flags:                                               |
> +|                  |Bits[31:1] Reserved, must be zero.                         |
> +|                  |Bit[0] Graceful request:                                   |
> +|                  |Set to 1 if the request is a graceful request.             |
> +|                  |Set to 0 if the request is a forceful request.             |
> ++------------------+-----------------------------------------------------------+
> +|Return values                                                                 |
> ++------------------+-----------------------------------------------------------+
> +|Name              |Description                                                |
> ++------------------+-----------------------------------------------------------+
> +|int32 status      |SUCCESS: if LM successfully shutdowns.                     |
> +|                  |NOT_FOUND: if lmId not points to a valid logical machine.  |
> +|                  |INVALID_PARAMETERS: if lmId is same as the caller.         |
> +|                  |DENIED: if the agent does not have permission to manage the|
> +|                  |the LM specified by lmid.                                  |
> ++------------------+-----------------------------------------------------------+
> +

Ditto, sync ?

> +LMM_WAKE
> +~~~~~~~~
> +
> +message_id: 0x7
> +protocol_id: 0x80
> +
> ++------------------+-----------------------------------------------------------+
> +|Parameters                                                                    |
> ++------------------+-----------------------------------------------------------+
> +|Name              |Description                                                |
> ++------------------+-----------------------------------------------------------+
> +|uint32 lmid       |ID of the Logical Machine                                  |
> ++------------------+-----------------------------------------------------------+
> +|Return values                                                                 |
> ++------------------+-----------------------------------------------------------+
> +|Name              |Description                                                |
> ++------------------+-----------------------------------------------------------+
> +|int32 status      |SUCCESS: if LM successfully wakes.                         |
> +|                  |NOT_FOUND: if lmId not points to a valid logical machine.  |
> +|                  |INVALID_PARAMETERS: if lmId is same as the caller.         |
> +|                  |DENIED: if the agent does not have permission to manage the|
> +|                  |the LM specified by lmid.                                  |
> ++------------------+-----------------------------------------------------------+
> +

Ditto, sync ?

> +LMM_SUSPEND
> +~~~~~~~~~~~
> +
> +message_id: 0x8
> +protocol_id: 0x80
> +
> ++------------------+-----------------------------------------------------------+
> +|Parameters                                                                    |
> ++------------------+-----------------------------------------------------------+
> +|Name              |Description                                                |
> ++------------------+-----------------------------------------------------------+
> +|uint32 lmid       |ID of the Logical Machine                                  |
> ++------------------+-----------------------------------------------------------+
> +|Return values                                                                 |
> ++------------------+-----------------------------------------------------------+
> +|Name              |Description                                                |
> ++------------------+-----------------------------------------------------------+
> +|int32 status      |SUCCESS: if LM successfully suspends.                      |
> +|                  |NOT_FOUND: if lmId not points to a valid logical machine.  |
> +|                  |INVALID_PARAMETERS: if lmId is same as the caller.         |
> +|                  |DENIED: if the agent does not have permission to manage the|
> +|                  |the LM specified by lmid.                                  |
> ++------------------+-----------------------------------------------------------+
> +

Ditto, sync ?

> +LMM_NOTIFY
> +~~~~~~~~~~
> +
> +message_id: 0x9
> +protocol_id: 0x80
> +
> ++------------------+-----------------------------------------------------------+
> +|Parameters                                                                    |
> ++------------------+-----------------------------------------------------------+
> +|Name              |Description                                                |
> ++------------------+-----------------------------------------------------------+
> +|uint32 lmid       |ID of the Logical Machine                                  |
> ++------------------+-----------------------------------------------------------+
> +|uint32 flags      |Notification flags:                                        |
> +|                  |Bits[31:3] Reserved, must be zero.                         |
> +|                  |Bit[3] Wake (resume) notification:                         |
> +|                  |Set to 1 to send notification.                             |
> +|                  |Set to 0 if no notification.                               |
> +|                  |Bit[2] Suspend (sleep) notification:                       |
> +|                  |Set to 1 to send notification.                             |
> +|                  |Set to 0 if no notification.                               |
> +|                  |Bit[1] Shutdown (off) notification:                        |
> +|                  |Set to 1 to send notification.                             |
> +|                  |Set to 0 if no notification.                               |
> +|                  |Bit[0] Boot (on) notification:                             |
> +|                  |Set to 1 to send notification.                             |
> +|                  |Set to 0 if no notification                                |

How about reset ?

> ++------------------+-----------------------------------------------------------+
> +|Return values                                                                 |
> ++------------------+-----------------------------------------------------------+
> +|Name              |Description                                                |
> ++------------------+-----------------------------------------------------------+
> +|int32 status      |SUCCESS: if the notification state successfully updated.   |
> +|                  |NOT_FOUND: if lmId not points to a valid logical machine.  |
> +|                  |INVALID_PARAMETERS: if input attributes flag specifies     |
> +|                  |unsupported or invalid configurations.                     |
> +|                  |DENIED: if the agent does not have permission to request   |
> +|                  |the notification.                                          |
> ++------------------+-----------------------------------------------------------+
> +
> +LMM_RESET_REASON
> +~~~~~~~~~~~~~~~~
> +
> +message_id: 0xA
> +protocol_id: 0x80
> +
> ++---------------------+--------------------------------------------------------+
> +|Parameters                                                                    |
> ++---------------------+--------------------------------------------------------+
> +|Name                 |Description                                             |
> ++---------------------+--------------------------------------------------------+
> +|uint32 lmid          |ID of the Logical Machine                               |
> ++---------------------+--------------------------------------------------------+
> +|Return values                                                                 |
> ++---------------------+--------------------------------------------------------+
> +|Name                 |Description                                             |
> ++---------------------+--------------------------------------------------------+
> +|int32 status         |SUCCESS: if LM successfully suspends.                   |
> +|                     |NOT_FOUND: if lmId not points to a valid logical machine|
> +|                     |DENIED: if the agent does not have permission to request|
> +|                     |the reset reason.                                       |
> ++---------------------+--------------------------------------------------------+
> +|uint32 bootflags     |Boot reason flags. This parameter has the format:       |
> +|                     |Bits[31] Valid.                                         |
> +|                     |Set to 1 if the entire reason is valid.                 |
> +|                     |Set to 0 if the entire reason is not valid.             |
> +|                     |Bits[30:29] Reserved, must be zero.                     |
> +|                     |Bit[28] Valid origin:                                   |

Valid with origin ID perhaps ?

> +|                     |Set to 1 if the origin field is valid.                  |
> +|                     |Set to 0 if the origin field is not valid.              |
> +|                     |Bits[27:24] Origin.                                     |
> +|                     |Bit[23] Valid err ID:                                   |
> +|                     |Set to 1 if the error ID field is valid.                |
> +|                     |Set to 0 if the error ID field is not valid.            |
> +|                     |Bits[22:8] Error ID.                                    |
> +|                     |Bit[7:0] Reason                                         |

Reasons definitions are Platform specific ?

> ++---------------------+--------------------------------------------------------+
> +|uint32 shutdownflags |Shutdown reason flags. This parameter has the format:   |
> +|                     |Bits[31] Valid.                                         |
> +|                     |Set to 1 if the entire reason is valid.                 |
> +|                     |Set to 0 if the entire reason is not valid.             |
> +|                     |Bits[30:29] Number of valid extended info words.        |
> +|                     |Bit[28] Valid origin:                                   |
> +|                     |Set to 1 if the origin field is valid.                  |
> +|                     |Set to 0 if the origin field is not valid.              |
> +|                     |Bits[27:24] Origin.                                     |
> +|                     |Bit[23] Valid err ID:                                   |
> +|                     |Set to 1 if the error ID field is valid.                |
> +|                     |Set to 0 if the error ID field is not valid.            |
> +|                     |Bits[22:8] Error ID.                                    |
> +|                     |Bit[7:0] Reason                                         |

Again nothing for reset ? Do you expect reset to be forceful shutdown and
boot in which case both the above are set ?

> ++---------------------+--------------------------------------------------------+
> +|uint32 extinfo[0,20] |Array of extended info words                            |

What are these ?

> ++---------------------+--------------------------------------------------------+
> +
> +LMM_POWER_ON
> +~~~~~~~~~~~~
> +
> +message_id: 0xB
> +protocol_id: 0x80
> +
> ++------------------+-----------------------------------------------------------+
> +|Parameters                                                                    |
> ++------------------+-----------------------------------------------------------+
> +|Name              |Description                                                |
> ++------------------+-----------------------------------------------------------+
> +|uint32 lmid       |ID of the Logical Machine                                  |
> ++------------------+-----------------------------------------------------------+
> +|Return values                                                                 |
> ++------------------+-----------------------------------------------------------+
> +|Name              |Description                                                |
> ++------------------+-----------------------------------------------------------+
> +|int32 status      |SUCCESS: if LM successfully suspends.                      |

/me confused. Is it suspend(which is already defined) ? Or reset(again already
defined) ?

> +|                  |NOT_FOUND: if lmId not points to a valid logical machine.  |
> +|                  |INVALID_PARAMETERS: if lmId is same as the caller.         |
> +|                  |DENIED: if the agent does not have permission to manage the|
> +|                  |the LM specified by lmid.                                  |
> ++------------------+-----------------------------------------------------------+
> +
> +NEGOTIATE_PROTOCOL_VERSION
> +~~~~~~~~~~~~~~~~~~~~~~~~~~~
> +
> +message_id: 0x10
> +protocol_id: 0x80
> +
> ++--------------------+---------------------------------------------------------+
> +|Parameters                                                                    |
> ++--------------------+---------------------------------------------------------+
> +|Name                |Description                                              |
> ++--------------------+---------------------------------------------------------+
> +|uint32 version      |The negotiated protocol version the agent intends to use |
> ++--------------------+---------------------------------------------------------+
> +|Return values                                                                 |
> ++--------------------+---------------------------------------------------------+
> +|Name                |Description                                              |
> ++--------------------+---------------------------------------------------------+
> +|int32 status        |SUCCESS: if the negotiated protocol version is supported |
> +|                    |by the platform. All commands, responses, and            |
> +|                    |notifications post successful return of this command must|
> +|                    |comply with the negotiated version.                      |
> +|                    |NOT_SUPPORTED: if the protocol version is not supported. |
> ++--------------------+---------------------------------------------------------+
> +
> +Notifications
> +_____________
> +
> +LMM_EVENT
> +~~~~~~~~~
> +
> +message_id: 0x0
> +protocol_id: 0x80
> +
> ++------------------+-----------------------------------------------------------+
> +|Parameters                                                                    |
> ++------------------+-----------------------------------------------------------+
> +|Name              |Description                                                |
> ++------------------+-----------------------------------------------------------+
> +|uint32 lmid       |Identifier for the LM that caused the transition.          |
> ++------------------+-----------------------------------------------------------+
> +|uint32 eventlm    |Identifier for the LM the event is for.                    |
> ++------------------+-----------------------------------------------------------+
> +|uint32 flags      |LM events:                                                 |
> +|                  |Bits[31:3] Reserved, must be zero.                         |
> +|                  |Bit[3] Wake (resume) event:                                |
> +|                  |1 LM has awakened.                                         |
> +|                  |0 not a wake event.                                        |
> +|                  |Bit[2] Suspend (sleep) event:                              |
> +|                  |1 LM has suspended.                                        |
> +|                  |0 not a suspend event.                                     |
> +|                  |Bit[1] Shutdown (off) event:                               |
> +|                  |1 LM has shutdown.                                         |
> +|                  |0 not a shutdown event.                                    |
> +|                  |Bit[0] Boot (on) event:                                    |
> +|                  |1 LM has booted.                                           |
> +|                  |0 not a boot event.                                        |
> ++------------------+-----------------------------------------------------------+
> +
>  SCMI_BBM: System Control and Management BBM Vendor Protocol
>  ==============================================================
>  
> @@ -436,6 +849,285 @@ protocol_id: 0x81
>  |                  |0 no button change detected.                               |
>  +------------------+-----------------------------------------------------------+
>  
> +SCMI_CPU: System Control and Management CPU Vendor Protocol
> +==============================================================
> +
> +This protocol allows an agent to start or stop a CPU. It is used to manage
> +auxiliary CPUs in an LM (e.g. additional cores in an AP cluster), The CPU
> +protocol provides functions to:
> +

Additional CPU in AP cluster ? That sounds alarming. Why not use PSCI ?
Also what other CPUs are we talking here. In general I would like to
explore the possibility of collapsing this with LM protocol. CPUs within
LM is LM's responsibility to bring up. And CPU can be seen as an LM for
sake of this vendor protocol. I am not get into details here yet before
I can understand what these CPUs are really in the system and why we need
this.

-- 
Regards,
Sudeep

Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FF8D535BF
	for <arm-scmi@vger.kernel.org>; Mon, 20 May 2024 12:33:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.23.249
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716208437; cv=none; b=i24mt/dJkzZiXVKsBhTHasKubN0VGoPkgUpcQ7jhW/QEiMys1017wM9NXAPmgWf7YaQdvSlvTa4s+p9xHaJjojbfjIvhI44xPEstlI/o844rpZdFL4hNlh3i+LnCy6IwfJmjzZfCMHummbRlCBt14LZzGMiyw2nOp81wGCzF4gg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716208437; c=relaxed/simple;
	bh=kJNG3x3ieNHsGkE0TW+pGlYX4Om8t6093iMIjgymcQQ=;
	h=From:To:CC:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=WbkJOmuSdAT2mgVL1biStnIV56usoGRmPzSaoo+ph2+QqV41qVQu9MDVmry7WyhkEzseqZOpJXsRazdDlc5YKWOYgRkadR9nqIxn2zXNTPKQziFOBcTRQlyuJz647Eo2DjeIkSax5nBJuB43si6Tlp0DT1U26cB5f/jwvkcvm2k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=eKOAQdZn; arc=none smtp.client-ip=198.47.23.249
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="eKOAQdZn"
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 44KCXZ72013168;
	Mon, 20 May 2024 07:33:35 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1716208415;
	bh=AtuhQ3eZS/Y8tj/Ek+phSsIS6EEVwU+nxUAffcUu99E=;
	h=From:To:CC:Subject:In-Reply-To:References:Date;
	b=eKOAQdZn9iUgL7eYOPbZnVWPe+E4p51kWDRKdfE8nJ/5R244gn6KfDUf027/azHIi
	 1O72rBgAJhWQJYSe0Ebit776r2qqSrVL8w8RHBLsfl2nL+1I4Af+s8soMxYWEXhHri
	 Ul0H2/GUBUv2ikQyImHkXbqsMTcxKp7O1BR8VZsQ=
Received: from DLEE110.ent.ti.com (dlee110.ent.ti.com [157.170.170.21])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 44KCXZkh019202
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 20 May 2024 07:33:35 -0500
Received: from DLEE110.ent.ti.com (157.170.170.21) by DLEE110.ent.ti.com
 (157.170.170.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Mon, 20
 May 2024 07:33:34 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DLEE110.ent.ti.com
 (157.170.170.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Mon, 20 May 2024 07:33:34 -0500
Received: from localhost (kamlesh.dhcp.ti.com [172.24.227.123])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 44KCXYcf026360;
	Mon, 20 May 2024 07:33:34 -0500
From: Kamlesh Gurudasani <kamlesh@ti.com>
To: Soby Mathew <Soby.Mathew@arm.com>, Andrew Davis <afd@ti.com>,
        "Achin
 Gupta" <Achin.Gupta@arm.com>,
        "ilias.apalodimas@linaro.org"
	<ilias.apalodimas@linaro.org>,
        "ff@shokubai.tech" <ff@shokubai.tech>, <arm-scmi@vger.kernel.org>
CC: "bb@ti.com" <bb@ti.com>, "vigneshr@ti.com" <vigneshr@ti.com>,
        "tf-a@lists.trustedfirmware.org" <tf-a@lists.trustedfirmware.org>,
        "d-gole@ti.com" <d-gole@ti.com>, "hnagalla@ti.com" <hnagalla@ti.com>
Subject: RE: [TF-A] Re: Make TF-A (bl31) (El3 firmware) preemtible
In-Reply-To: <PAXPR08MB75768C792694C79C45E457B6E0EC2@PAXPR08MB7576.eurprd08.prod.outlook.com>
References: <87msorfmh4.fsf@kamlesh.i-did-not-set--mail-host-address--so-tickle-me>
 <AS8PR08MB99797260825883B8E3076112FFEC2@AS8PR08MB9979.eurprd08.prod.outlook.com>
 <87jzjvfdqx.fsf@kamlesh.i-did-not-set--mail-host-address--so-tickle-me>
 <6DBCFB7D-2BAC-4402-B2D4-C1BEA33717BA@shokubai.tech>
 <b8ad00650c1dad8cc5721c3fc66938d5dd5af3fd.camel@arm.com>
 <912d1b8adb2392d3e9dae4a5e30ea27fc8583f22.camel@arm.com>
 <42f8df2d-d299-4531-9904-f19e2bec5244@ti.com>
 <PAXPR08MB75768C792694C79C45E457B6E0EC2@PAXPR08MB7576.eurprd08.prod.outlook.com>
Date: Mon, 20 May 2024 18:03:33 +0530
Message-ID: <87h6esfysi.fsf@kamlesh.i-did-not-set--mail-host-address--so-tickle-me>
Precedence: bulk
X-Mailing-List: arm-scmi@vger.kernel.org
List-Id: <arm-scmi.vger.kernel.org>
List-Subscribe: <mailto:arm-scmi+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:arm-scmi+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180

Soby Mathew <Soby.Mathew@arm.com> writes:

++arm-scmi@vger.kernel.org list,

Thanks for the suggestions Achin And Soby,

> Hi Everyone,
>
> Generally making EL3 pre-emptible and returning to NS is a hard problem t=
o solve. TF-A does allow SError (controlled via PSTATE.A) to be taken durin=
g EL3 execution, but the end result is a panic() or system shutdown with no=
 prospects of resuming execution.
>
> If EL3 firmware were to return back to NS world, it would have to be prep=
ared to re-enter via a different entry point or a different SMC. This is un=
like an OS handling an interrupt. AFAICS, To allow EL3 to be re-entrant via=
 another entrypoint while having been pre-empted by a NS interrupt, EL3 wou=
ld need to execute SCMI calls in separate C execution context (with its own=
 stack and register context). Perhaps another useful way of thinking about =
this is that the SCMI SMC is run as a separate thread within EL3 firmware.
>
> This separate C context can be pre-empted , stashed and restored appropri=
ately as required.=20
>
> This is doable, but given the tight memory constraints for EL3 firmware, =
it may not be possible to this is as a generic feature and not all SMCs can=
 brought into this fold as would need special error codes to notify the cal=
ler about pre-emption , whether thread limit is hit etc.
>
> What Achin suggested seems to be the straightforward way to implement thi=
s. The SCMI SMC calls would certainly need to be modified (as you mention) =
to cater for suspension and resumption . This would be needed even if EL3 w=
ere to implement pre-emption as once execution is returned back to NS, EL3 =
does not receive control back and NS caller would need to invoke the SMC ag=
ain.
>
> To mitigate concerns on RT performance, I can suggest another variation o=
n Achin's proposal. Within the poll() loop, the code could either :
>
> 1. check for a pending interrupt by reading isr_el1 and return early if t=
here is a NS interrupt pending.
> 2. A bit more risky,  but could unmask PSTATE.I within the poll() loop an=
d if interrupt handler is triggered, can signal via a flag, ensure that PST=
ATE.I is masked again and break out of the loop.

If I summarise this,
1. Problem is specific to SCMI, so keep it constrained to SCMI.

2. Make SCMI calls preemtible like following as per Achin's suggestion,

   1. SCMI SMC comes in from Normal world.
   2. SCMI command is sent to the SCP.
   3. EL3 SCMI logic starts a counter and polls for a response.
   4. When the counter hits 0, if the command has not completed and there
   is a pending interrupt, complete the SMC to return to the Normal world.
   5. Normal world resumes the SMC.
   6. Goto 3 unless the command has completed.

This is doable with addition of RETRY(preempted case) return value from
SCMI calls along with SUCCESS and FAILURE return values.

Also, we'll have to make the SCMI calls re-entrant in a way that they
are smart enough to pick up from where they got preempted last time.

will give us best result with what Soby suggested for polling
>A bit more risky,  but could unmask PSTATE.I within the poll() loop and if=
 interrupt handler is triggered, can signal
>     via a flag, ensure that PSTATE.I is masked again and break out of
>     the loop.
Soby,

Could you please elaborate more on why you feel that it is "bit more
risky", other than the specifics of implementation.=20

Kamlesh

>
> Best Regards
> Soby Mathew
>
>> -----Original Message-----
>> From: Andrew Davis via TF-A <tf-a@lists.trustedfirmware.org>
>> Sent: Wednesday, May 15, 2024 4:37 PM
>> To: Achin Gupta <Achin.Gupta@arm.com>; ilias.apalodimas@linaro.org;
>> kamlesh@ti.com; ff@shokubai.tech
>> Cc: bb@ti.com; vigneshr@ti.com; tf-a@lists.trustedfirmware.org; d-
>> gole@ti.com; hnagalla@ti.com
>> Subject: [TF-A] Re: Make TF-A (bl31) (El3 firmware) preemtible
>>=20
>> On 5/15/24 10:09 AM, Achin Gupta wrote:
>> > Hi Kamlesh,
>> >
>> > Maybe a simpler way out would be to implement cooperative yielding
>> > semantics in the SCMI logic in EL3 such that:
>>=20
>> We had also though about something like this, would require the addition=
 of
>> a some async versions of the standard SCMI calls. Or have the normal cal=
ls
>> return some new return value like "retry" or "check back later" instead =
of
>> pass/fail.
>>=20
>> >
>> > 1. SCMI SMC comes in from Normal world.
>> > 2. SCMI command is sent to the SCP.
>> > 3. EL3 SCMI logic starts a counter and polls for a response.
>> > 4. When the counter hits 0, if the command has not completed and there
>> > is a pending interrupt, complete the SMC to return to the Normal world=
.>
>> 5. Normal world resumes the SMC.
>> > 6. Goto 3 unless the command has completed.
>> >
>> > Yet another option would be to poll in the Normal world i.e. return
>> > immediately to Normal world after 2 above and then invoke an SMC
>> > repeatedly to check if the command has completed.
>> >
>>=20
>> We would want to just return back to normal world immediately for anythi=
ng
>> other than the most simple calls for best RT performance.
>> Otherwise we would need some policy on what the timeout would be, so
>> that should be avoided.
>>=20
>> Andrew
>>=20
>> > Just thinking aloud!
>> >
>> > cheers,
>> > Achin
>> >
>> >
>> > On Wed, 2024-05-15 at 13:48 +0000, Achin Gupta via TF-A wrote:
>> >> Hi Kamlesh and Francois,
>> >>
>> >>
>> >> Please find my comments inline...
>> >>
>> >> On Wed, 2024-05-15 at 13:16 +0000, ff via TF-A wrote:
>> >>>
>> >>>
>> >>>> Le 15 mai 2024 =C3=A0 14:42, Kamlesh Gurudasani via TF-A
>> >>>> <tf-a@lists.trustedfirmware.org> a =C3=A9crit :
>> >>>>
>> >>>> =EF=BB=BFHi Achin,
>> >>>>
>> >>>> Thanks for the suggestion,
>> >>>>
>> >>>>> Instead of adding the complexity of yielding semantics to BL31,
>> >>>>> have you considered migrating the SCMI operations to a S-EL0
>> >>>>> partition that is managed by EL3 firmware? This would be a
>> >>>>> preemptible bare- metal partition and does not require migrating
>> >>>>> the SCMI operations to a TEE.
>> >>>>
>> >>>> As per [0], we can't have a SEL1 firmware at all(e.g. OP-TEE), if
>> >>>> we run S-EL0 partition image.
>> >>>>
>> >>>> "It is not currently possible for BL31 to integrate SPM support and
>> >>>> a Secure Payload Dispatcher (SPD) at the same time; they are
>> >>>> mutually exclusive.
>> >>>
>> >>> It has been possible to run a TEE and UEFI crypto as a separate
>> >>> partition for UEFI SecureBoot with U-Boot. Adding a second partition
>> >>> may be complex but not impossible.
>> >>
>> >> I really don't think we would want to support this upstream but I
>> >> will let the TF-A team comment.=C2=A0It makes EL3 solve a problem that
>> >> should be solved in the TEE. This goes against keeping EL3 simple and
>> >> opens the door for more vendor specific firmware to creep into EL3.
>> >>
>> >> The best bet is to get the TEE to support FF-A and migrate the SCMI
>> >> operations to an FF-A S-EL0 SP. The SP would work with any TEE that
>> >> has a compliant FF-A implementation. On a >=3D v8.4 system, the same =
SP
>> >> would work with Hafnium. It will require some upfront investment but
>> >> is the most scalable approach in the long term.
>> >>
>> >> cheers,
>> >> Achin
>> >>
>> >>>
>> >>> I added Ilias in the to: as he knows alls the details
>> >>>
>> >>>> In the SPM bootflow, a Secure Partition image executing at S-EL0
>> >>>> replaces the Secure Payload image executing at S-EL1 (e.g. a
>> >>>> Trusted OS). Both are referred to as BL32."
>> >>>>
>> >>>> Let me know if you think otherwise.
>> >>>>
>> >>>> What we want is,
>> >>>> 1. Run clock and power management services as well as TEE services
>> >>>> 2. We don't want to put clock and power and management services in
>> >>>> TEE, so that we have liberty to use any TEE we want.
>> >>>> Example, if we put our SCMI operations in OP-TEE, then we'll be
>> >>>> constrained to use OP-TEE and only OP-TEE.
>> >>>>
>> >>>> [0]
>> >>>> https://trustedfirmware-a.readthedocs.io/en/latest/components/secur
>> >>>> e-partition-manager-mm.html#secure-partition-manager-mm
>> >>>>
>> >>>> Regards,
>> >>>> Kamlesh
>> >>>>
>> >>>> Achin Gupta <Achin.Gupta@arm.com> writes:
>> >>>>
>> >>>>> Hi Kamlesh,
>> >>>>>
>> >>>>>> We are aware that ARM v8.4-A onwards arch are having a SEL2 level
>> >>>>>> with which we can run a vendor specific firmware
>> >>>>> parallel to TEE at SEL1 in a secure partition. But how we do
>> >>>>> handle clock and power management for version which doesn't
>> >>>>> support SEL2?
>> >>>>>
>> >>>>> Instead of adding the complexity of yielding semantics to BL31,
>> >>>>> have you considered migrating the SCMI operations to a S-EL0
>> >>>>> partition that is managed by EL3 firmware? This would be a
>> >>>>> preemptible bare-metal partition and does not require migrating
>> >>>>> the SCMI operations to a TEE.
>> >>>>>
>> >>>>> cheers,
>> >>>>> Achin
>> >>>>>
>> >>>>> ________________________________
>> >>>>> From: Kamlesh Gurudasani via TF-A
>> >>>>> <tf-a@lists.trustedfirmware.org>
>> >>>>> Sent: 15 May 2024 10:33
>> >>>>> To:
>> >>>>> tf-a@lists.trustedfirmware.org=C2=A0<tf-a@lists.trustedfirmware.or=
g>
>> >>>>> Cc: bb@ti.com=C2=A0<bb@ti.com>; vigneshr@ti.com=C2=A0<vigneshr@ti.=
com>;
>> >>>>> d-gole@ti.com=C2=A0<d-gole@ti.com>; afd@ti.com=C2=A0<afd@ti.com>;
>> >>>>> hnagalla@ti.com=C2=A0<hnagalla@ti.com>
>> >>>>> Subject: [TF-A] Make TF-A (bl31) (El3 firmware) preemtible
>> >>>>>
>> >>>>> Clock and power management in ATF, preemption issue.
>> >>>>>
>> >>>>> I have seen that multiple Vendors are using arm scmi protocol to
>> >>>>> do clock management in bl31[0][1].
>> >>>>>
>> >>>>> The problem with such implementations is any long running SCMI
>> >>>>> operations (like PLL locking for example) will hold the core in
>> >>>>> EL3 for extended period of time, adding to latency of NS EL1
>> >>>>> interrupt handling as ATF is not preemptible.
>> >>>>>
>> >>>>> This problem can be solved by making ATF preemptible, similar to
>> >>>>> how OP-TEE does it by by implementing a remote procedural call
>> >>>>> after it receives a interrupt.
>> >>>>> [2]How Linux does SMC call with YIELD flag enabled.
>> >>>>> [3]How OP-TEE handles the timer interrupt [4]How Linux receives an
>> >>>>> interrupt which came in EL3->SEL1
>> >>>>>
>> >>>>> As quoted in exception Handling document in ATF docs[5]
>> >>>>>
>> >>>>> "Receive exceptions, but handle part of the exception in EL3, and
>> >>>>> delegate processing of the error to dedicated software stack
>> >>>>> running at lower secure ELs (as above); additionally, the Normal
>> >>>>> world may also be required to participate in the handling, or be
>> >>>>> notified of such events (for example, as an event).
>> >>>>> In this scheme, exception handling potentially and maximally spans
>> >>>>> all ELs in both Secure and Normal worlds."
>> >>>>>
>> >>>>>  From this we can understand that we can delegate the exception to
>> >>>>> EL1 if we are already in EL3.
>> >>>>> (way to preempt)
>> >>>>>
>> >>>>> We are aware that ARM v8.4-A onwards arch are having a SEL2 level
>> >>>>> with which we can run a vendor specific firmware parallel to TEE
>> >>>>> at SEL1 in a secure partition. But how we do handle clock and
>> >>>>> power management for version which doesn't support SEL2?
>> >>>>>
>> >>>>> We don't want to put it in TEE as it will constraint our devices
>> >>>>> to that specific TEE.
>> >>>>>
>> >>>>> I am starting to work on a proposal to make ATF preemptible
>> >>>>> similar to how OP-TEE is doing it.
>> >>>>> a)Will the similar approach from OP-TEE if implemented and working
>> >>>>> be accepted by ATF upstream?
>> >>>>> The SMC call with YIELD option will only be preemtible so will not
>> >>>>> affect the normal flow.
>> >>>>>
>> >>>>> b)As quoted in Trusted Firmware-A Document[6] Page 94, "Yielding
>> >>>>> calls are reserved exclusively for Trusted OS providers"
>> >>>>> "Yielding 0- 1 Reserved for existing Armv7-A calls Yielding 2-63
>> >>>>> Trusted OS Standard Calls"
>> >>>>>
>> >>>>> Can this range be consumed within ATF/bl31 firmware or is it
>> >>>>> necessary to forward all yielding calls to Trusted OS?
>> >>>>>
>> >>>>> [0]
>> >>>>> https://github.com/ARM-software/arm-trusted-firmware/blob/master/
>> >>>>> plat/st/stm32mp1/stm32mp1_scmi.c
>> >>>>> [1]
>> >>>>> https://review.trustedfirmware.org/c/TF-A/trusted-firmware-a/+/21
>> >>>>> 840
>> >>>>> [2]
>> >>>>> https://elixir.bootlin.com/linux/v6.9-rc3/source/drivers/tee/opte
>> >>>>> e/smc_abi.c#L930
>> >>>>> [3]
>> >>>>> https://github.com/OP-
>> TEE/optee_os/blob/fc57019cb35c8c1bad66fc6d8
>> >>>>> 14ace5debde170a/core/arch/arm/kernel/thread_optee_smc_a64.S#L24
>> >>>>> 6
>> >>>>> [4]
>> >>>>> https://elixir.bootlin.com/linux/v6.9-rc3/source/drivers/tee/opte
>> >>>>> e/smc_abi.c#L842
>> >>>>> [5]
>> >>>>> https://github.com/ARM-software/arm-trusted-firmware/blob/master/
>> >>>>> docs/components/exception-handling.rst
>> >>>>> [6]
>> >>>>> https://trustedfirmware-a.readthedocs.io/_/downloads/en/latest/pd
>> >>>>> f/
>> >>>>>
>> >>>>> Regards,
>> >>>>> Kamlesh
>> >>>>> --
>> >>>>> TF-A mailing list -- tf-a@lists.trustedfirmware.org To unsubscribe
>> >>>>> send an email to tf-a-leave@lists.trustedfirmware.org
>> >>>> --
>> >>>> TF-A mailing list -- tf-a@lists.trustedfirmware.org To unsubscribe
>> >>>> send an email to tf-a-leave@lists.trustedfirmware.org
>> >>
>> >
>> --
>> TF-A mailing list -- tf-a@lists.trustedfirmware.org To unsubscribe send =
an
>> email to tf-a-leave@lists.trustedfirmware.org

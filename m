Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C203B430CF8
	for <arm-scmi@vger.kernel.org>; Wed,  2 Sep 2026 23:29:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788391759; cv=none; b=dLR1NPYjhFyCPizAjkc3ZzqAsjcNPDZgKjbO4R0z+OCgfxrXcd9KGdVjM3EBX/vR0WnH55AUTLuXoFf6QR7wLhoUUKa4InLeQQDp2h/TLrxVOmjfE6+QRaN3p8NbsZKcPux4Yl9co7K7l3rpe/giaaShCfzzE1+LotiMHdQELUU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788391759; c=relaxed/simple;
	bh=RkVrWA6bxH+9jfzI7E7KtEfWffmOy5kRQrblD9NndKw=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=OtRVWMI+BkF1onkYMbPBaWeKuWxEKeOgxi87TjlQ66fEnaK1tRf3xM5PJ4DT6RPnrTBDr0+0zJxRIKU/BIQ4BWeeRLeCUFJtGTYCnaLLcP0Dr4hMr0PSUMEJImJRY15da/EQNJVHlnBLeUalVGqKxeV17wi+wQGMIwbbTzZTm6M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=A2DvgDMK; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=cndCXirq; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="A2DvgDMK";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="cndCXirq"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 682NHbXQ2913252
	for <arm-scmi@vger.kernel.org>; Wed, 2 Sep 2026 23:29:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	n6WRl72qX4p4AIksXc6/fkyLqK6Pf1Fvu45PrE/pF5g=; b=A2DvgDMKzHTOt5un
	aO9p6yLPTPDlW/3zYBXyIiUgMEh7OfiyYis2QUDlVvddUfkBpMzgT86R/70Q5NQ+
	F1vUjMI/6iqLi+vkw1yomQhqRVtgvpS9f3EFrvpqPqd7SFgYDIHXGnHQI9k1k5kF
	Bs0UYJpWV1/s7r2yzXQtrGabXjFYFae8Z+rygXt7Xr7nXvLzShYf978t1R6k3hGZ
	KBXq1ZftY3B1E4QefQLvIguplwYSXscH2kwJGg8//bWrK6g8ujJBW5ZGPKwm39Uu
	p8Q8uJMeqMdiYJp2hnTs00iX/MQzMdf4IO7nDT8UME8DEg9JJCl8enzHAg6tEBTj
	TgwXPA==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gepv5sy5p-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <arm-scmi@vger.kernel.org>; Wed, 02 Sep 2026 23:29:16 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-38dbf293831so3874764a91.3
        for <arm-scmi@vger.kernel.org>; Wed, 02 Sep 2026 16:29:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788391755; x=1788996555; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:organization
         :references:in-reply-to:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=n6WRl72qX4p4AIksXc6/fkyLqK6Pf1Fvu45PrE/pF5g=;
        b=cndCXirquxRgYKMJafWJTbUC6oWQBX1xfU+QXk/PhB5quAlJu9Wt6G+6YsMMF1FRDL
         D/Esti6co9iW9SXd/48AQ+g1IYS+AHabtdWdDCEldY4FmDMjG/p9JilJXCfwOE19GvrX
         fisypzPDcNmTgocxqSqssBd9RZD5fkHLRlQDzzuw/ij1+PXK8JQOhvfFJGx2aCCV/CZu
         5HowQ/44t8qj24qqGasfFgs0lWZEWiYunA58dN9DadTgnFE6L/TBfMZoZeCk+hpVdPAW
         Lc3uh0NBqjRuyJG6vOjoQhovJ/cD4HsHSbCp23r75f7l/syFcNx2ic7kxc/jnKrrZCOo
         Gh7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788391755; x=1788996555;
        h=content-transfer-encoding:content-type:mime-version:organization
         :references:in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=n6WRl72qX4p4AIksXc6/fkyLqK6Pf1Fvu45PrE/pF5g=;
        b=gmVowz8CeIroaPyVoyUZj+4+F+sSfVjab1eaNgOJIN7hAsqltdyxbSObAORRjQ2yyM
         NNwrdwM+QMQTRCnfi1MkCwOkW70t6qDPQ/sgJfd290FxJWGKZspVt5XIWtXXviDfKVN9
         8RSXQSO1SytB4A2c1fWKRF83v5N8bDezXHvh3yiu4/BJ++ltuxJPB+3gLYQjHGAdIHz+
         zi5uOgjIq8owFpUfs5s2H8+RH9AkQQwP5l+1hoMq4mtwR7dbU69buBvAE5U8kOhu05kT
         eItuI1SAENoaacR1zHnA4xMS5P2vBZjhqzUk1qnxKB3zWZM4KmazS5zz4NMsTuWZehEK
         nxMQ==
X-Gm-Message-State: AFuF++nzyPV6DAcZBxblyQoat3PFnz/CUdPfMdExXW5kpsccoTHXLTnF
	+Xa9ep1vphLC/RQw8k0/7ta2Mo/dskvpI4K1UIfG7++zIZMz2US9DMbbLfVaCDOHtjbyZIjlVmF
	wgOe4CeNBXjODXsFG2cEAbwomz4aY1yEhtzOtk3PnWhML8r2kTHzQiwufdf7c3Q==
X-Gm-Gg: AYBFou3NV+k4L1oytVMeVudqxoqWLzVMrMtRkAfwI7m2VQwv7jpRg+XGA3os0/6HafV
	goM+hr9+h/j9u0TS9+5f50qF8xpTmlU7WKGBbblo3zM2iRlPuau4jV+iBOch4pLAZFvzF8G+vNP
	gcfL3ZAmxR3gXVKNvYEMRhYQls+IHxkU2Fgq2KWrM85ElE73HdSt1W+K9p0GTi8nZNo+gJQH8xs
	Q47bhDfk0mp8HOPURXNuKuIhN1QGQLImvnqNLeI1PvU/PxXaMbhIAd17AjdadWewsQ5u3D3D3tD
	AVqv84+mxgmYbLqfeLdAhlNBCwGpF+nkO4pr06HS6YpDO5RSu8qqfs/tF/ODn+GyGUFcMkh67a3
	TWvlZed+GC6Bw0a+yr53bmMz04zA=
X-Received: by 2002:a17:90b:2b45:b0:38e:4f41:83df with SMTP id 98e67ed59e1d1-39aee16515bmr12870236a91.15.1788391755208;
        Wed, 02 Sep 2026 16:29:15 -0700 (PDT)
X-Received: by 2002:a17:90b:2b45:b0:38e:4f41:83df with SMTP id 98e67ed59e1d1-39aee16515bmr12870158a91.15.1788391754734;
        Wed, 02 Sep 2026 16:29:14 -0700 (PDT)
Received: from localhost ([50.35.44.179])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3325534c50dsm1363747eec.7.2026.09.02.16.29.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2026 16:29:14 -0700 (PDT)
Date: Wed, 2 Sep 2026 16:29:11 -0700
From: Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>
To: Sudeep Holla <sudeep.holla@kernel.org>
Cc: arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        kernel-team@meta.com, Cristian Marussi <cristian.marussi@arm.com>,
        Breno
 Leitao <leitao@debian.org>
Subject: Re: [PATCH v3 3/9] firmware: arm_scmi: Convert OF-only paths to
 generic fwnode in SCMI core
Message-ID: <20260902162911.0000761f@oss.qualcomm.com>
In-Reply-To: <20260902-funky-tarsier-of-competence-0ae6ab@sudeepholla>
References: <20260813-acpi_scmi_pcc-v3-0-cb6b88b4ebb3@kernel.org>
	<20260813-acpi_scmi_pcc-v3-3-cb6b88b4ebb3@kernel.org>
	<20260824103929.00004912@oss.qualcomm.com>
	<20260902-funky-tarsier-of-competence-0ae6ab@sudeepholla>
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
X-Authority-Analysis: v=2.4 cv=T8y8ifKQ c=1 sm=1 tr=0 ts=6a98b14c cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=aNnz9XPx1a4JIXSYt2cE/A==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=BGMOuxRx6cLfrRdBKbIA:9 a=CjuIK1q_8ugA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-GUID: gsP7iul7oYfvFK7otZby6d6GUb_MjxlV
X-Proofpoint-ORIG-GUID: gsP7iul7oYfvFK7otZby6d6GUb_MjxlV
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAyMDIwOCBTYWx0ZWRfX3FthcHpjufnO
 XnWLfher/PuwBamNT/vUtZpjCfTjfarvy8p8Qvd68/PRwM7uBuD25/QIlLHyL/WW4+TKngSvOg3
 2ucBvGDHBRPHfJxiqG26aWuvyumX8Q1J+u/qU/bIwdnJwWZN7OkwZgQ6CpS7abmrFq8MmvCgnko
 Jd6TIKrizLNIHCya0+9WxArFqt7fDcaIdhLApS/hDPBAxFum357isI0Tp2OzLPbXpzWpr3Zk7+d
 7d+eS+fDw34tiajMfre639aWHyz8bg1ER1Bsd8yAX4bgexYQsggnKZkzkiQjlZDQzzUl6Rdds9M
 CmCQ9phV/T/N8c8XmbHXUNXic4vcNEgvvQhU0GEXl03/IwaiTzgInJMY1WhzEUmGbMydo7Ug99m
 zqnJKSTRdOqYXIfOoy5lThnU7ImQN2wDcNls/P1avtVyzouYmPl5f4Rd3IcvT9rJOQY4LTEF/yn
 ywsyl/3CGhbUajxigBQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAyMDIwOCBTYWx0ZWRfX7qOZbdTVdN34
 fCOkt3x2QbzqlmHuTQtrPulV/AlX1lJvQq0W8xcWb91AqelsEvBBoOkLnaQHdRJAFCXvdbvnEb7
 twyEoV/xb/K0lW8gaNifEcRJRNGJXo8=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-02_06,2026-09-02_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 impostorscore=0 adultscore=0 spamscore=0
 clxscore=1015 suspectscore=0 lowpriorityscore=0 priorityscore=1501
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2609020208

On Wed, 2 Sep 2026 14:39:31 +0100
Sudeep Holla <sudeep.holla@kernel.org> wrote:

> On Mon, Aug 24, 2026 at 10:39:29AM -0700, Jonathan Cameron wrote:
> > On Thu, 13 Aug 2026 12:32:58 +0100
> > Sudeep Holla <sudeep.holla@kernel.org> wrote:
> >   
> > > Switch SCMI core plumbing from struct device_node * to struct
> > > fwnode_handle * so the core can describe SCMI instances and protocols using
> > > firmware nodes rather than OF nodes directly.
> > > 
> > > This change:
> > >   - Replaces core OF property lookups with fwnode_property_*() helpers.
> > >   - Switches child enumeration to
> > >     fwnode_for_each_available_child_node_scoped().  
> > 
> > Why the scoped version? See inline for more on this.  Probably just needs
> > a comment here (or use the non _scoped variant)
> >   
> 
> Sure
> 
> > >   - Plumbs fwnode through the SCMI device creation and channel setup paths.
> > >   - Updates transport ->chan_available() callbacks to take a fwnode.
> > >   - Stores per-protocol child fwnodes in info->active_protocols so the core
> > >     can later locate the descriptor for a given protocol ID.
> > >   - Updates mailbox/optee/smc/virtio transports to accept fwnodes and map
> > >     back to OF nodes where their existing parsing remains DT-specific.
> > > 
> > > DT-only transports such as mailbox, OP-TEE and SMC still parse DT
> > > properties by mapping the fwnode back to an OF node. On non-DT systems
> > > these transports report no channel available.
> > > 
> > > This is a mechanical step towards firmware-node neutrality and prepares the
> > > SCMI core for non-DT transports, such as an ACPI/PCC transport. DT users
> > > continue to work unchanged; no non-DT transport is enabled by this patch.
> > > 
> > > Signed-off-by: Sudeep Holla <sudeep.holla@kernel.org>  
> > 
> > A few minor things - with those cleaned up.  Only the cleanup.h one really
> > matters.
> >   
> 
> Fixed now.
> 
> > Reviewed-by: Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>
> >   
> > > diff --git a/drivers/firmware/arm_scmi/driver.c b/drivers/firmware/arm_scmi/driver.c
> > > index ef29fd223287..9014723e0f7f 100644
> > > --- a/drivers/firmware/arm_scmi/driver.c
> > > +++ b/drivers/firmware/arm_scmi/driver.c  
> > 
> > ...
> >   
> > > @@ -3352,10 +3354,10 @@ static int scmi_probe(struct platform_device *pdev)
> > >  
> > >  	scmi_enable_matching_quirks(info);
> > >  
> > > -	for_each_available_child_of_node(np, child) {
> > > +	fwnode_for_each_available_child_node_scoped(dev_fwnode(dev), child) {  
> > 
> > There are no early exits yet and I can't see any added later in the series.
> > So the scoped bit is irrelevant.  I don't mind the change on basis of
> > hardening or similar but it needs a comment in the patch description to 
> > justify that.
> >   
> 
> This is mainly to release the reference taken in
> fwnode_get_next_available_child_node(). It is taken explicitly via
> fwnode_handle_get() before scmi_create_protocol_devices() as discussed
> below.

When the loop continues to normal termination the puts are all there
anyway as part of the iterators.  The _scoped case just deals with
early exits via break or return.

> 
> > >  		u32 prot_id;
> > >  
> > > -		if (of_property_read_u32(child, "reg", &prot_id))
> > > +		if (fwnode_property_read_u32(child, "reg", &prot_id))
> > >  			continue;
> > >  
> > >  		if (!FIELD_FIT(MSG_PROTOCOL_ID_MASK, prot_id)) {

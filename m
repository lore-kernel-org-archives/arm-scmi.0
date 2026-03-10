Received: from send239.i.mail.ru (send239.i.mail.ru [95.163.59.78])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56DA534B1B4
	for <arm-scmi@vger.kernel.org>; Tue, 10 Mar 2026 08:29:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.163.59.78
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773131374; cv=none; b=ENaqZ1L2e5NbmwZ8iDdI4XObnMVi571okqoGh9XzITLYadIDW/8t60+tounvn2xZVKX61JBFUDNUuQCOVZvPw+jLdKZzz0PC9fOpxkl0yxAINaPFJGjV9LdtWaJgnQ3WG7n1jkDxphGgs8VvtLqhstZ4gV531S7Y1sr4euIT9yI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773131374; c=relaxed/simple;
	bh=s5EHNhYmf9kuC5Yi58o3pgE1VPUgUP2qnoafwZJg/jk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=pDOjgn+t2egJN8esqrAShMtDooZZZQA0dyv1Hq6wj79AHGrEqb88H/dEAboLWyX/Q1+hQef33W355+MhY6mIh1Q2W3dZ1CPE5umfjayb7Lib2Ju8pFX2hacsLaXCOU4RRsBkP2i8yUq1HZp3bzDOEUNGN/ouVwvt0nprHopkPXA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=inbox.ru; spf=pass smtp.mailfrom=inbox.ru; dkim=pass (2048-bit key) header.d=inbox.ru header.i=@inbox.ru header.b=Ijct4oAt; dkim=pass (2048-bit key) header.d=inbox.ru header.i=@inbox.ru header.b=pAdypsbF; arc=none smtp.client-ip=95.163.59.78
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=inbox.ru
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=inbox.ru
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=inbox.ru header.i=@inbox.ru header.b="Ijct4oAt";
	dkim=pass (2048-bit key) header.d=inbox.ru header.i=@inbox.ru header.b="pAdypsbF"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=inbox.ru;
	s=mail4; h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:Cc:
	To:From:Sender:Reply-To:Content-Type:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive:X-Cloud-Ids;
	bh=tiKx9WABxJZt5HkJ9/YI2ataNRBlaoh7xNYzxIvBwSk=; t=1773131370; x=1773221370; 
	b=Ijct4oAtJAqqVdXmf95Oi1hX4sSs4z/XJrVlsXU7OpPfw3WMONJPoQZIvO4Ls0vBp5jY1GG4Ein
	KA8JsxhP2Poj+lsdBMY9vPxrTFXlYT2ite3GiVFryXoXZxyC3cCXzRgdrXIDjneWq68tpb5j1L0J2
	9UOLpIMZRh5prm7kVph2HLd8CYUXVL4ZLIHm0nP94GnX3zK8hzQmKTGOA+yaJM3Tcr6mAB1eEEoEI
	/KTVM7t1NhANq8BfUyBQ/wR4xGyqmkfbetRVk93TqKDsBv2XVXtGM/Bx8R4VUmivmRkI51mcuTvQJ
	tBHijqFRwDc8VWc6gBXjfq7qpHIGeXUcXtkg==;
Received: from [10.113.69.130] (port=50738 helo=send279.i.mail.ru)
	by exim-fallback-cbf6f846c-zmg26 with esmtp (envelope-from <fido_max@inbox.ru>)
	id 1vzsEN-00000000SC6-0TMz
	for arm-scmi@vger.kernel.org; Tue, 10 Mar 2026 11:14:19 +0300
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=inbox.ru;
	s=mail4; h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:Cc:
	To:From:From:Sender:Reply-To:To:Cc:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive:
	X-Cloud-Ids:Disposition-Notification-To;
	bh=tiKx9WABxJZt5HkJ9/YI2ataNRBlaoh7xNYzxIvBwSk=; t=1773130459; x=1773220459; 
	b=pAdypsbFZNZA8CfvhqwTntr7SW65jxJJHGdLM+u6wj5chIktWcnGzyQdRw7ROGHnh2uaRfIt9h2
	OwynfbTHvJt9VGLYpYykHOjxJnHytjWF11znPTik9W1SYkDM+H9zI0H2k+XkHYpfvJqbEgmNXWfks
	gxDV8STvqy4VXZybWmkMC7F7Ppr3fkz0QB1kmaSpLzHZw2p8PtGDJlF+l4Ul8F0jQU3izIXxKBSgD
	czcabeBh2qWqM3SPeTtLHdy9WEgFWaidc4WN2s8wGH4xF8ZUSEY6pBTddXzz36V8MGSi/BF1FHb1Z
	+VuYj9LfZhhWIJfiR7SXLEYi8XHsYhRQqgKw==;
Received: by exim-smtp-695fc89d9f-8whg4 with esmtpa (envelope-from <fido_max@inbox.ru>)
	id 1vzsDa-0000000097K-0091; Tue, 10 Mar 2026 11:13:30 +0300
From: Maxim Kochetkov <fido_max@inbox.ru>
To: arm-scmi@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org,
	Jonathan.Cameron@huawei.com,
	cristian.marussi@arm.com,
	sudeep.holla@kernel.org,
	a.shimko.dev@gmail.com,
	Maxim Kochetkov <fido_max@inbox.ru>
Subject: [PATCH v2] firmware: arm_scmi: move scmi_channels_setup() after SCMI stack init
Date: Tue, 10 Mar 2026 11:12:59 +0300
Message-ID: <20260310081259.36888-1-fido_max@inbox.ru>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: arm-scmi@vger.kernel.org
List-Id: <arm-scmi.vger.kernel.org>
List-Subscribe: <mailto:arm-scmi+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:arm-scmi+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailru-Src: smtp
X-7564579A: B8F34718100C35BD
X-77F55803: 4F1203BC0FB41BD91ABAE9865AC7DC8850146831463F184C5FE898FE311831A4182A05F538085040738ABA0E1B5439943DE06ABAFEAF67051955F2D4F0BBCCE540F3430AE692E2BAB14F0FA0E0289DA8
X-7FA49CB5: FF5795518A3D127A4AD6D5ED66289B5278DA827A17800CE777D9B7C31E2C1495EA1F7E6F0F101C67BD4B6F7A4D31EC0BCC500DACC3FED6E28638F802B75D45FF8AA50765F7900637AC83A81C8FD4AD23D82A6BABE6F325AC2E85FA5F3EDFCBAA7353EFBB553375665A08EF23E7B416ABAA7EACF75EE252DC33579F13381E11F68E578C39FEC72B928EEF46B7454FC60B9742502CCDD46D0D457EE4B4996FC546F6B57BC7E64490618DEB871D839B73339E8FC8737B5C2249A50BD5087FBFCDAACC7F00164DA146DAFE8445B8C89999729449624AB7ADAF37F6B57BC7E64490611E7FA7ABCAF51C92176DF2183F8FC7C0E8801E8C4F941C018941B15DA834481F9449624AB7ADAF372E808ACE2090B5E14AD6D5ED66289B5259CC434672EE63711DD303D21008E298D5E8D9A59859A8B6B372FE9A2E580EFC725E5C173C3A84C315AF0D0D4FC4FA3D35872C767BF85DA2F004C90652538430E4A6367B16DE6309
X-C1DE0DAB: 0D63561A33F958A5B49FB850C1B6C4A25002B1117B3ED69630243DF515AAAFC9F09842853758E9E5277AA237ED671D4372AF3B35EA4094CCA7DFDF579AB090EF9C5DF10A05D560A9D2B5782620B851B7C8C84E951CD0BE2F58C12E6D310A6D53566404C906FA8ADEA71A35648BE338CEED902CAAD3CD6B00BA7CCD254A1CF5E853016C5BF4D76643638A446BE3E5C627BF0CFE790FC11A7261332C5CB50AE517BDAD6C7F3747799A
X-C8649E89: 1C3962B70DF3F0AD73CAD6646DEDE191716CD42B3DD1D34CA0CBE312C330D7D583CD26C36C883521FC0B9F89525902EE6F57B2FD27647F25E66C117BDB76D659E503FAE6DEA603C30664F9266136918D93FAFCD2B52D691A69203ACED7CE61856B6E7495D7D1EF25B8341EE9D5BE9A0AD75C86C2DA17540B0ECF33F1555143A7B90D84CE924CA6D5DABE3362BFED2FD64C41F94D744909CEE921556F0E976A29E6EC0772259F8F8F8815B87D7EC76CB9
X-D57D3AED: 3ZO7eAau8CL7WIMRKs4sN3D3tLDjz0dLbV79QFUyzQ2Ujvy7cMT6pYYqY16iZVKkSc3dCLJ7zSJH7+u4VD18S7Vl4ZUrpaVfd2+vE6kuoey4m4VkSEu53w8ahmwBjZKM/YPHZyZHvz5uv+WouB9+ObcCpyrx6l7KImUglyhkEat/+ysWwi0gdhEs0JGjl6ggRWTy1haxBpVdbIX1nthFXMZebaIdHP2ghjoIc/363UZI6Kf1ptIMVYrk7BQKFwEtn93Sv3gtl/Mmu+clJvSDQw==
X-Mailru-Sender: 689FA8AB762F7393DDD5FD59B456EAD2AFA19C54DC1AFD9C2E8FFDBA3618F8BC733250E5C4543EE790DE4A6105A3658D481B2AED7BCCC0A49AE3A01A4DD0D55C6C99E19F044156F45FEEDEB644C299C0ED14614B50AE0675
X-Mras: Ok
X-Mailru-Src: fallback
X-7564579A: 646B95376F6C166E
X-77F55803: 6242723A09DB00B4A8F96BD43067EAD61675375D802A6BFACC58E300EE2EEC70049FFFDB7839CE9E85E2A6C8184F95412E2AF03222FD2387D8D624316F41C3F859878C39247090EA67E56B32FEC8D838
X-7FA49CB5: 0D63561A33F958A5C47789CEB6AC3A825002B1117B3ED6960533020333CEE9C64E82D2634811542802ED4CEA229C1FA827C277FBC8AE2E8BEECFD4AEF418E5F1
X-D57D3AED: 3ZO7eAau8CL7WIMRKs4sN3D3tLDjz0dLbV79QFUyzQ2Ujvy7cMT6pYYqY16iZVKkSc3dCLJ7zSJH7+u4VD18S7Vl4ZUrpaVfd2+vE6kuoey4m4VkSEu53w8ahmwBjZKM/YPHZyZHvz5uv+WouB9+OYcBso8Zm+oliTz8oZwnDrFsY77LZRcHyw5ht0smWrfSeTW5FiI8avd9v29gUBslpEZ9wIMwqVP4jLQVQ+dVm7x9BpDHadBV9RMjI809PraZfO+dF0zUW/UzAdJHa8MmYQ==
X-Mailru-MI: 20000000020000000000601000
X-Mras: Ok

scmi_channels_setup() makes channels enabled and ready to receive
messages immediately. In some cases channel may receive message from
firmware here (i.e. notification). This message will be passed to
SCMI RX path scmi_rx_callback(). Then in scmi_handle_notification()
scmi_xfer_get() is called to get message buffer to unpack.
scmi_xfer_get() uses xfer_lock spinlock. But xfer_lock init is
located in scmi_xfer_info_init() which is called after
scmi_channels_setup() in scmi_probe().
So here we have trying to access to uninitialized spinlok:

[    9.978360] BUG: spinlock bad magic on CPU#0, irq/16-1e200000/123
[    9.979236]  lock: 0xffffffd6035500c8, .magic: 00000000, .owner: <none>/-1, .owner_cpu: 0
[    9.980633] CPU: 0 UID: 0 PID: 123 Comm: irq/16-1e200000 Not tainted 6.12.0-01250-g7fb379e5f78e-dirty #2
[    9.983157] Call Trace:
[    9.983422] [<ffffffff80007ab4>] dump_backtrace+0x1c/0x24
[    9.983972] [<ffffffff80b5d380>] show_stack+0x2e/0x38
[    9.984523] [<ffffffff80b6e58e>] dump_stack_lvl+0x52/0x74
[    9.985336] [<ffffffff80b6e5c4>] dump_stack+0x14/0x1c
[    9.985556] [<ffffffff80b5dfa8>] spin_dump+0x62/0x6e
[    9.985942] [<ffffffff8007df7a>] do_raw_spin_lock+0xd2/0x12c
[    9.986213] [<ffffffff80b78f16>] _raw_spin_lock_irqsave+0x22/0x2e
[    9.986585] [<ffffffff80823442>] scmi_rx_callback+0x158/0x7ca

So move scmi_channels_setup() after full SCMI stack init to make
sure we are ready to receive messages before enabling channels.
Also drop check to see if the platform supports any receive channels
because chanels are not allocated yet.

Fixes: 4ebd8f6dea81 ("firmware: arm_scmi: Add receive buffer support for notifications")
Signed-off-by: Maxim Kochetkov <fido_max@inbox.ru>
---
Changes in v2:
- Drop check to see if the platform supports any receive channels
---
 drivers/firmware/arm_scmi/driver.c | 29 ++++++++++++++---------------
 1 file changed, 14 insertions(+), 15 deletions(-)

diff --git a/drivers/firmware/arm_scmi/driver.c b/drivers/firmware/arm_scmi/driver.c
index adff81a3d233..4dd4f2d9a9ae 100644
--- a/drivers/firmware/arm_scmi/driver.c
+++ b/drivers/firmware/arm_scmi/driver.c
@@ -2710,7 +2710,7 @@ static int scmi_xfer_info_init(struct scmi_info *sinfo)
 		return ret;
 
 	ret = __scmi_xfer_info_init(sinfo, &sinfo->tx_minfo);
-	if (!ret && !idr_is_empty(&sinfo->rx_idr))
+	if (!ret)
 		ret = __scmi_xfer_info_init(sinfo, &sinfo->rx_minfo);
 
 	return ret;
@@ -3237,17 +3237,10 @@ static int scmi_probe(struct platform_device *pdev)
 	handle->devm_protocol_put = scmi_devm_protocol_put;
 	handle->is_transport_atomic = scmi_is_transport_atomic;
 
-	/* Setup all channels described in the DT at first */
-	ret = scmi_channels_setup(info);
-	if (ret) {
-		err_str = "failed to setup channels\n";
-		goto clear_ida;
-	}
-
 	ret = bus_register_notifier(&scmi_bus_type, &info->bus_nb);
 	if (ret) {
 		err_str = "failed to register bus notifier\n";
-		goto clear_txrx_setup;
+		goto clear_ida;
 	}
 
 	ret = blocking_notifier_chain_register(&scmi_requested_devices_nh,
@@ -3291,6 +3284,12 @@ static int scmi_probe(struct platform_device *pdev)
 		dev_err(dev,
 			"Transport is not polling capable. Atomic mode not supported.\n");
 
+	ret = scmi_channels_setup(info);
+	if (ret) {
+		err_str = "failed to setup channels\n";
+		goto notification_exit;
+	}
+
 	/*
 	 * Trigger SCMI Base protocol initialization.
 	 * It's mandatory and won't be ever released/deinit until the
@@ -3303,7 +3302,7 @@ static int scmi_probe(struct platform_device *pdev)
 			dev_err(dev, "%s", err_str);
 			return 0;
 		}
-		goto notification_exit;
+		goto clear_txrx_setup;
 	}
 
 	mutex_lock(&scmi_list_mutex);
@@ -3345,6 +3344,8 @@ static int scmi_probe(struct platform_device *pdev)
 
 	return 0;
 
+clear_txrx_setup:
+	scmi_cleanup_txrx_channels(info);
 notification_exit:
 	if (IS_ENABLED(CONFIG_ARM_SCMI_RAW_MODE_SUPPORT))
 		scmi_raw_mode_cleanup(info->raw);
@@ -3354,8 +3355,6 @@ static int scmi_probe(struct platform_device *pdev)
 					   &info->dev_req_nb);
 clear_bus_notifier:
 	bus_unregister_notifier(&scmi_bus_type, &info->bus_nb);
-clear_txrx_setup:
-	scmi_cleanup_txrx_channels(info);
 clear_ida:
 	ida_free(&scmi_id, info->id);
 
@@ -3379,6 +3378,9 @@ static void scmi_remove(struct platform_device *pdev)
 	list_del(&info->node);
 	mutex_unlock(&scmi_list_mutex);
 
+	/* Safe to free channels since no more users */
+	scmi_cleanup_txrx_channels(info);
+
 	scmi_notification_exit(&info->handle);
 
 	mutex_lock(&info->protocols_mtx);
@@ -3393,9 +3395,6 @@ static void scmi_remove(struct platform_device *pdev)
 					   &info->dev_req_nb);
 	bus_unregister_notifier(&scmi_bus_type, &info->bus_nb);
 
-	/* Safe to free channels since no more users */
-	scmi_cleanup_txrx_channels(info);
-
 	ida_free(&scmi_id, info->id);
 }
 
-- 
2.53.0


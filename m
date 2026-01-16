Received: from send239.i.mail.ru (send239.i.mail.ru [95.163.59.78])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C50C17A31C;
	Fri, 16 Jan 2026 11:49:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.163.59.78
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768564186; cv=none; b=lcK1o7b4Gw3TLTsDQrCk+VPXWdNGHxbteEMBmJR90lLSXp/6MmwJTCOI07O02df0xDCJ3JKJpYQr4mb9LdTHkgAeFdaTfdMyurpi33AZVBopu2H0mMQJ550CFGBG9PNyhwYOnUFWMf13aPeHc7veQiUa+4FJ67fV88bYhsRCS5s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768564186; c=relaxed/simple;
	bh=dDVmdLMmBq6D4d9qdODFNF/LtQxS4KFNJmK/mfyYUOw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=EpHZFen7nX7uf75rqOYfzngwE1jjLva1z7h/Dhl9BMX+SCj2rHRfweB/xQSY6U6JueLW80jG1aEDl4aDQSR1D99GUI/3Pd0PDgitQ2QoFSk0DHf5Zk8zpEfT4QmBj9jOXjKDNcUeWc+i5SJJK/Q6hkhYIcJ01Z9l1lZgqPh1TFk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=inbox.ru; spf=pass smtp.mailfrom=inbox.ru; dkim=pass (2048-bit key) header.d=inbox.ru header.i=@inbox.ru header.b=EtvDgf7L; dkim=pass (2048-bit key) header.d=inbox.ru header.i=@inbox.ru header.b=Ujs6ZmGE; arc=none smtp.client-ip=95.163.59.78
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=inbox.ru
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=inbox.ru
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=inbox.ru header.i=@inbox.ru header.b="EtvDgf7L";
	dkim=pass (2048-bit key) header.d=inbox.ru header.i=@inbox.ru header.b="Ujs6ZmGE"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=inbox.ru;
	s=mail4; h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:Cc:
	To:From:Sender:Reply-To:Content-Type:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive:X-Cloud-Ids;
	bh=jR1d80OffUV7uTQEpev81sOA3UFu+1WzvTqmM8RGtaQ=; t=1768564182; x=1768654182; 
	b=EtvDgf7LLexkIA1InywLJkxKN+bykB15Dtb0G7Htx2ipdRf1o9lOERQAcDjT1RfAWiJxcE5ae1V
	IsMVuTVB7GxF1nzp7xDkm5c+Q/4V3QkQrVbJO+D2au/Vmb1qpl9TBTGB00u+ht+kolcK0SJ61NTv+
	D2V+c03yga+nv5ZGxUMIiCHT4nG2kgx+V+k3592MxKUnAvHW0Sv5o0hBK2/pfiuA8OeA16XtSxnqg
	cPDugstG4BwAZYiKGDwrmNv42QExXXVJsAtGONijpNdG1Rk5yneGZXFKSHoM8bNyNQM3xnm6hJztn
	Ii1MARffQRhFwAQ+AK9AVa2VVok+6OgPeQiA==;
Received: from [10.113.133.252] (port=48762 helo=send58.i.mail.ru)
	by exim-fallback-7cc5959d8d-l75s5 with esmtp (envelope-from <fido_max@inbox.ru>)
	id 1vgi62-000000005I3-0qXR; Fri, 16 Jan 2026 14:34:30 +0300
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=inbox.ru;
	s=mail4; h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:Cc:
	To:From:From:Sender:Reply-To:To:Cc:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive:
	X-Cloud-Ids:Disposition-Notification-To;
	bh=jR1d80OffUV7uTQEpev81sOA3UFu+1WzvTqmM8RGtaQ=; t=1768563270; x=1768653270; 
	b=Ujs6ZmGEtH//JCWA2B2OIPE2Zvpix0sar2lIcLQgXwCir3ALJEQIraIp9ZflJH2OC5Xg2i+Qz6g
	RSJQWH9+Q8GImQ6zILaSrRxLTLCJBqDPjO644v4YFTHapg58Jp5BzTTCQZ/v2bRdY3+LMrop9XolQ
	qzkQfoCLgaNoCkFbk0lAGP4rIt3bf92N6kmK3ZAKWlxNygXkRprN5/3dZESQmtOub295JrPiTpZ/l
	uFW5uMnVwlnXxJizB5WU/xZBCXdZs8FFHj/vU3b05ODPsuVfBEcZIrw/ULAoFV/T7RmfODcy4lThE
	EDHBiyoPSjAVhrm+sdAO2KOITwagEAZ9UHzA==;
Received: by exim-smtp-7b4fb89df9-67b2p with esmtpa (envelope-from <fido_max@inbox.ru>)
	id 1vgi5Q-00000000BD3-2rha; Fri, 16 Jan 2026 14:33:53 +0300
From: Maxim Kochetkov <fido_max@inbox.ru>
To: arm-scmi@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Jonathan.Cameron@huawei.com,
	cristian.marussi@arm.com,
	sudeep.holla@arm.com,
	Maxim Kochetkov <fido_max@inbox.ru>
Subject: [PATCH 1/1] firmware: arm_scmi: move scmi_channels_setup() after SCMI stack init
Date: Fri, 16 Jan 2026 14:33:22 +0300
Message-ID: <20260116113322.29427-1-fido_max@inbox.ru>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: arm-scmi@vger.kernel.org
List-Id: <arm-scmi.vger.kernel.org>
List-Subscribe: <mailto:arm-scmi+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:arm-scmi+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailru-Src: smtp
X-7564579A: EEAE043A70213CC8
X-77F55803: 4F1203BC0FB41BD915CCE24728BE1C659288DDFB45DD09173BC4D529DAC28AFF182A05F5380850404C228DA9ACA6FE27703FF7A2CA780D5C3DE06ABAFEAF6705FDB245181E5689CA1445013257ED8507EA49DAD9745199E0
X-7FA49CB5: FF5795518A3D127A4AD6D5ED66289B5278DA827A17800CE7F157A19638F32F60EA1F7E6F0F101C67BD4B6F7A4D31EC0BCC500DACC3FED6E28638F802B75D45FF8AA50765F7900637AC83A81C8FD4AD23D82A6BABE6F325AC2E85FA5F3EDFCBAA7353EFBB5533756680939BF45BBEA696D66F1F908B0E0CD669C74E262E6C083C3F5BFD04E3EAC4E88EEF46B7454FC60B9742502CCDD46D0DEDCF5861DED71B2F389733CBF5DBD5E913377AFFFEAFD269176DF2183F8FC7C0AD76BF5943A59ECC8941B15DA834481FCF19DD082D7633A0EF3E4896CB9E6436389733CBF5DBD5E9D5E8D9A59859A8B66EFF71F1B3C06F72CC7F00164DA146DA6F5DAA56C3B73B237318B6A418E8EAB86D1867E19FE14079C09775C1D3CA48CF3D321E7403792E342EB15956EA79C166A417C69337E82CC275ECD9A6C639B01B78DA827A17800CE75A9E79F66F1C28F3731C566533BA786AA5CC5B56E945C8DA
X-C1DE0DAB: 0D63561A33F958A507FC153A179462395002B1117B3ED69695DD9DF6417A798A250A03108B67251B277AA237ED671D4372AF3B35EA4094CC8ED1AC82D843A2BB9C5DF10A05D560A9D2B5782620B851B7C8C84E951CD0BE2F58C12E6D310A6D53566404C906FA8ADEA71A35648BE338CEED902CAAD3CD6B00BA7CCD254A1CF5E8EBBD898635E49373638A446BE3E5C627BF0CFE790FC11A7261332C5CB50AE517BDAD6C7F3747799A
X-C8649E89: 1C3962B70DF3F0AD73CAD6646DEDE191716CD42B3DD1D34CA0CBE312C330D7D583CD26C36C883521FC0B9F89525902EE6F57B2FD27647F25E66C117BDB76D65956BCBECC2AB312DD7BF48E4D43E3283106E5567CD68261AC52A66745F672F67FB5A0969D806867DBB8341EE9D5BE9A0A0F93AFFF416A809940775ABDFBE9C0522475EF7FB0E9BB86DABE3362BFED2FD64C41F94D744909CEE921556F0E976A29E6EC0772259F8F8F8815B87D7EC76CB9
X-D57D3AED: 3ZO7eAau8CL7WIMRKs4sN3D3tLDjz0dLbV79QFUyzQ2Ujvy7cMT6pYYqY16iZVKkSc3dCLJ7zSJH7+u4VD18S7Vl4ZUrpaVfd2+vE6kuoey4m4VkSEu53w8ahmwBjZKM/YPHZyZHvz5uv+WouB9+ObcCpyrx6l7KImUglyhkEat/+ysWwi0gdhEs0JGjl6ggRWTy1haxBpVdbIX1nthFXMZebaIdHP2ghjoIc/363UZI6Kf1ptIMVVt0N+pdRHOZuqP9fAipHsk=
X-Mailru-Sender: 689FA8AB762F7393DDD5FD59B456EAD27B0D6E5CCDD2C5C297605EEF9BC9CED6EA71D86CE574F84B90DE4A6105A3658D481B2AED7BCCC0A49AE3A01A4DD0D55C6C99E19F044156F45FEEDEB644C299C0ED14614B50AE0675
X-Mras: Ok
X-Mailru-Src: fallback
X-7564579A: 78E4E2B564C1792B
X-77F55803: 6242723A09DB00B4FA133F958ACA886329FA42C887D4D75D658C8D760AE41572049FFFDB7839CE9E13A8E46255CC0779BF56414CD77A18189B3571DD18755D0A0A04FE10DD6B6B9772A9E5C308200B2B
X-7FA49CB5: 0D63561A33F958A5913101EA30DD41675002B1117B3ED696871B64F25FCBFD235781FBA1B2D9A3D102ED4CEA229C1FA827C277FBC8AE2E8B54F520D093A0DF28
X-D57D3AED: 3ZO7eAau8CL7WIMRKs4sN3D3tLDjz0dLbV79QFUyzQ2Ujvy7cMT6pYYqY16iZVKkSc3dCLJ7zSJH7+u4VD18S7Vl4ZUrpaVfd2+vE6kuoey4m4VkSEu53w8ahmwBjZKM/YPHZyZHvz5uv+WouB9+OYcBso8Zm+oliTz8oZwnDrFsY77LZRcHyw5ht0smWrfSeTW5FiI8avd9v29gUBslpEZ9wIMwqVP4jLQVQ+dVm7x9BpDHadBV9RMjI809PraZjw7YvTVKomVkNCSOR1fG1A==
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

Fixes: 4ebd8f6dea81 ("firmware: arm_scmi: Add receive buffer support for notifications")
Signed-off-by: Maxim Kochetkov <fido_max@inbox.ru>
---
 drivers/firmware/arm_scmi/driver.c | 27 +++++++++++++--------------
 1 file changed, 13 insertions(+), 14 deletions(-)

diff --git a/drivers/firmware/arm_scmi/driver.c b/drivers/firmware/arm_scmi/driver.c
index 3e76a3204ba4..0c46a9dfaf80 100644
--- a/drivers/firmware/arm_scmi/driver.c
+++ b/drivers/firmware/arm_scmi/driver.c
@@ -3225,17 +3225,10 @@ static int scmi_probe(struct platform_device *pdev)
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
@@ -3279,6 +3272,12 @@ static int scmi_probe(struct platform_device *pdev)
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
@@ -3291,7 +3290,7 @@ static int scmi_probe(struct platform_device *pdev)
 			dev_err(dev, "%s", err_str);
 			return 0;
 		}
-		goto notification_exit;
+		goto clear_txrx_setup;
 	}
 
 	mutex_lock(&scmi_list_mutex);
@@ -3333,6 +3332,8 @@ static int scmi_probe(struct platform_device *pdev)
 
 	return 0;
 
+clear_txrx_setup:
+	scmi_cleanup_txrx_channels(info);
 notification_exit:
 	if (IS_ENABLED(CONFIG_ARM_SCMI_RAW_MODE_SUPPORT))
 		scmi_raw_mode_cleanup(info->raw);
@@ -3342,8 +3343,6 @@ static int scmi_probe(struct platform_device *pdev)
 					   &info->dev_req_nb);
 clear_bus_notifier:
 	bus_unregister_notifier(&scmi_bus_type, &info->bus_nb);
-clear_txrx_setup:
-	scmi_cleanup_txrx_channels(info);
 clear_ida:
 	ida_free(&scmi_id, info->id);
 
@@ -3367,6 +3366,9 @@ static void scmi_remove(struct platform_device *pdev)
 	list_del(&info->node);
 	mutex_unlock(&scmi_list_mutex);
 
+	/* Safe to free channels since no more users */
+	scmi_cleanup_txrx_channels(info);
+
 	scmi_notification_exit(&info->handle);
 
 	mutex_lock(&info->protocols_mtx);
@@ -3381,9 +3383,6 @@ static void scmi_remove(struct platform_device *pdev)
 					   &info->dev_req_nb);
 	bus_unregister_notifier(&scmi_bus_type, &info->bus_nb);
 
-	/* Safe to free channels since no more users */
-	scmi_cleanup_txrx_channels(info);
-
 	ida_free(&scmi_id, info->id);
 }
 
-- 
2.51.0


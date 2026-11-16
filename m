Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794832340;
	b=E2bXYZ3bto9uMlV46oD3wUgCpCExoDnU67OKDTxOTmMVX2Tg+z3NhOw9e2CnO6q67Czk
	 Nq+mlo3t3t/Kbi/quVsIqIEmVoLDB32Mba8HSRJ+uk0/2SQ8ZxkwX+uE9KAOVql0QXuQ5
	 HNmFpYvrnTTPly/HtgzO5ZwwXZN9tFnLs/IgQswFveNOlLoiIRxPlSe8lnCkdZhyK/Dsu
	 lOyQwHROauiQXQ+Br7A8BcB04lqkRYTlXhhPcTsqSEVcnJuGN25GomrpjgDRk3LVDQC6D
	 v4Cow0BZKGvqN96DHcBbDcDQErLd8n5I+NI95Xc2qv9NFByKBsm58gnwseTmYlVk/Ww==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794832340;
	h=DMARC-Filter:Received:Received:DKIM-Signature:From:To:Cc:Subject:
	 Date:Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=POAt59CO+HOObTIBmjiEVtwCoQudsZPbe9vIDZNqOuU=;
	b=aTU1/ANppnSWd0F8gQseaPH/GHruvBbVorHaT7C+jVDx4U9Har9EQjNi2nS11pqxi9IQ
	 YkFldLIOO7gdZ1u0yKY06Eucu54EzsIOLRhn7lJabfUQl7HyAx7eVm5NOHLdX9F3Q7onh
	 /gDD2oF96/JnMnSQCTu1LHFwK3eCFT7P5DwDHwjQB/uQguaeMJtLKKlflQnzt8YLffy13
	 B6J7koQ5SqU1aUK4gN2tcoCgWGtqNQA4dCohr8qVHw0D6/fVQbBFhsjpFso/v4BrgH2V4
	 cek/GrN7mLIsyPrZLjJbEbeWfqvoSzmLClRzFLfzK7yBa83TvbvzicbSuEmdZBFUyUg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=arm.com;
	spf=pass smtp.mailfrom=arm.com;
	dkim=pass header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=XO9Vmy59;
	arc=none smtp.remote-ip=217.140.110.172
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 53B94606A32C;
	Mon, 16 Nov 2026 12:32:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 53B94606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=XO9Vmy59
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id BDC5A1BA8;
	Mon, 16 Nov 2026 04:32:16 -0800 (PST)
Received: from e121740.manchester.arm.com (e121740.arm.com [10.33.8.69])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id C4C4F3F632;
	Mon, 16 Nov 2026 04:32:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1794832339; bh=b1HIH1QS2hnpdXK+KVzLC89n8/AQUCXzJMbaHXVM6Zk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=XO9Vmy591ISO6V329xgF4MnvcaJwM7aTesr7PRZrzuzGCifI78qBxaUXvmt1GNcFt
	 YF1ljIK5+VUs/HwNTz3oql2H9+AebItsNvF2T8On1mQngPmlE2mfllABDviR1HZ5/r
	 OLY/a7ucrDK11uQm3z6fQXgsqUXYzkH2bmh4gQno=
From: Philip Radford <philip.radford@arm.com>
To: linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	arm-scmi@vger.kernel.org
Cc: sudeep.holla@arm.com,
	cristian.marussi@arm.com,
	philip.radford@arm.com,
	Sashiko <sashiko-bot@kernel.org>
Subject: [PATCH 2/2] firmware: arm_scmi: null pointer dereference in scmi_protocol_table_register()
Date: Mon, 16 Nov 2026 12:31:53 +0000
Message-Id: <20261116123153.2672631-3-philip.radford@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261116123153.2672631-1-philip.radford@arm.com>
References: <20261116123153.2672631-1-philip.radford@arm.com>
X-Mailing-List: arm-scmi@vger.kernel.org
List-Id: <arm-scmi.vger.kernel.org>
List-Post: <mailto:arm-scmi@vger.kernel.org>
List-Help: <mailto:arm-scmi+help@vger.kernel.org>
List-Subscribe: <mailto:arm-scmi+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:arm-scmi+unsubscribe@vger.kernel.org>
List-Owner: <mailto:arm-scmi+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add checks to avoid dereferencing a null pointer in
scmi_protocol_table_register() and scmi_protocol_table_unregister()

Reported-by: Sashiko <sashiko-bot@kernel.org>
Closes: https://sashiko.dev/#/bug/linux-7330d90b-8d81-478a-a227-4aa6f19393ba
Fixes: 2858f6e5f064 ("firmware: arm_scmi: Add multiple protocols registration support")
Signed-off-by: Philip Radford <philip.radford@arm.com>
---
 drivers/firmware/arm_scmi/bus.c | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/drivers/firmware/arm_scmi/bus.c b/drivers/firmware/arm_scmi/bus.c
index 25197197db8e..337aa445e42d 100644
--- a/drivers/firmware/arm_scmi/bus.c
+++ b/drivers/firmware/arm_scmi/bus.c
@@ -186,6 +186,9 @@ static int scmi_protocol_table_register(const struct scmi_device_id *id_table)
 	const struct scmi_device_id *entry;
 	int ret;
 
+	if (!id_table)
+		return -ENOENT;
+
 	for (entry = id_table; entry->name[0]; entry++) {
 		ret = scmi_protocol_device_request(entry);
 		if (ret)
@@ -206,8 +209,11 @@ scmi_protocol_table_unregister(const struct scmi_device_id *id_table)
 {
 	const struct scmi_device_id *entry;
 
-	for (entry = id_table; entry->name[0]; entry++)
-		scmi_protocol_device_unrequest(entry);
+	if (id_table) {
+		for (entry = id_table; entry->name[0]; entry++)
+			scmi_protocol_device_unrequest(entry);
+	}
+
 }
 
 static bool scmi_device_is_transport(const struct scmi_device *scmi_dev)
-- 
2.34.1


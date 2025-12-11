Received: from GVXPR05CU001.outbound.protection.outlook.com (mail-swedencentralazon11023102.outbound.protection.outlook.com [52.101.83.102])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3FE9270ED2
	for <arm-scmi@vger.kernel.org>; Thu, 11 Dec 2025 11:50:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.83.102
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765453850; cv=fail; b=Sh6BPpnhMDxyWQX1SGHgbDlzMs3LNlKAUUu0Q0kfpn7KImTA5J/N+ATY0hEbIxvPGS76mhFkdRtrul/Bsbz12gZOssYxkVzAhmwyQoU3D6kQQS5zuJRpX6tyVVhcHNBhfvRHqfnjl1+gimgVEjtQplh5FxBneHM69ydqVGOnZQw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765453850; c=relaxed/simple;
	bh=KqnGfEyeCLRg7gvvrKgfoMl6m+eOQtMUh3o4jCqWvXg=;
	h=From:To:Cc:Subject:Date:Message-Id:Content-Type:MIME-Version; b=te8aLGA5AfKSk1o3JTQ0TIEDvQ2VXrPyx/J2BSTO4LYyoRIXIkKLxTAsXnXP5Ge61PDDIPEI8cfBpFVCHF+2pp6/nN+k6uhRP6emKeyPwJ52tKRH2BwK9d16seuxpNDQ1nDORrOSMCkiJEPlqnGhhilPC89pLSxpZdS4w3RCqyk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=hailo.ai; spf=pass smtp.mailfrom=hailo.ai; dkim=pass (1024-bit key) header.d=hailo.ai header.i=@hailo.ai header.b=kqS20Rnu; arc=fail smtp.client-ip=52.101.83.102
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=hailo.ai
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=hailo.ai
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=hailo.ai header.i=@hailo.ai header.b="kqS20Rnu"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hkJRBXGyzbzpUg2FpudQbsRz0f6C1KRDpeXpe4kCT6smNLA+GORiKrgCZleofPenS95AXd5icO/5caPIjeEwHrwbHPmupMu2vKLqtNeciMZfsdIwlIlLffMhI4Ff2olnHA4lLemzFAY+YT/MEzZdCu9Ags7CvsudrgEyqGpA4IPKYbbzXgI4M2KEslPPME/RrGO7X/dMSkvwpQ/rnYlSIn8r9A1jHkbDoJbbEuHJhslbsB5VgJZvLsuJEJkkrkm9SffJOzsbPWa3SaBTRW9M5Au1X3MUIMpZ62i4R2lgNCjmaJ3YdfeOWp796PwmMi6GmDuYrabDzUB0l0qA1A3roQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Vnh+9M+1gXiTKVtxQEE8umQqc5feXYRqMBQjecYduFU=;
 b=qgukavjn3YADU6SSj+WnPkOI/qb1k0fIC+eVQvzgisdKWxel2Shb9Jkv0o7hmRxz5XKa4VCKhjZYz/j0BufcdSzdif0ZRUDkqRftOv70G0aLMm1RryUZ2RatdKqgJhyluHOmq7uHQMC6pQG0oIJ8cWkdLtxk/wL+qHexhh8b5fuK+CDENmaFl+LshoCSmtJx3Kvm7aa53BB0KiY/W32M9N1uklM7+BtmYFLbjuxpqrczF8waUl27qp7FPlMJnM7ndjAqqwyxdRDjB+jQWtrFUhimjrYOyj1bvbv2kmArBVi6O926gJsXLdOaCQEvRs7QZQ1LYesWNt24IUgpfKZykw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=hailo.ai; dmarc=pass action=none header.from=hailo.ai;
 dkim=pass header.d=hailo.ai; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hailo.ai; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Vnh+9M+1gXiTKVtxQEE8umQqc5feXYRqMBQjecYduFU=;
 b=kqS20Rnu2DXEKxGvJMT7A1MkrSUwVczzbQgIDYyNwOKDCPJFDGUu/J8iOx/mF1VH1Lw3+DGnKuhumIxfdyAzq+cDywUA7wSDstLqHA2/3MK2bUGlHtXDmbJKLnIoztFYdWnQEo+col85rFdc4oH+KSl7KcqKItry+jJgCoWWzZI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=hailo.ai;
Received: from DB9P194MB1356.EURP194.PROD.OUTLOOK.COM (2603:10a6:10:29e::14)
 by PA3P194MB2735.EURP194.PROD.OUTLOOK.COM (2603:10a6:102:4ac::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9412.9; Thu, 11 Dec
 2025 11:50:44 +0000
Received: from DB9P194MB1356.EURP194.PROD.OUTLOOK.COM
 ([fe80::f805:511f:699c:7c1f]) by DB9P194MB1356.EURP194.PROD.OUTLOOK.COM
 ([fe80::f805:511f:699c:7c1f%6]) with mapi id 15.20.9412.005; Thu, 11 Dec 2025
 11:50:44 +0000
From: Amitai Gottlieb <amitaig@hailo.ai>
To: arm-scmi@vger.kernel.org
Cc: Amitai Gottlieb <amitaig@hailo.ai>
Subject: [PATCH] firmware: arm_scmi: Fix unused notifier-block in unregister
Date: Thu, 11 Dec 2025 13:49:27 +0200
Message-Id: <20251211114926.709004-1-amitaig@hailo.ai>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TL2P290CA0004.ISRP290.PROD.OUTLOOK.COM
 (2603:1096:950:2::13) To DB9P194MB1356.EURP194.PROD.OUTLOOK.COM
 (2603:10a6:10:29e::14)
Precedence: bulk
X-Mailing-List: arm-scmi@vger.kernel.org
List-Id: <arm-scmi.vger.kernel.org>
List-Subscribe: <mailto:arm-scmi+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:arm-scmi+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB9P194MB1356:EE_|PA3P194MB2735:EE_
X-MS-Office365-Filtering-Correlation-Id: 2f280052-cfa2-467d-f19e-08de38ab8472
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|52116014|376014|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?oEtjVjfZ1EpXlgM5iOKGn0e8YEcFS94J7G+Q4xTJQL7OQc4RVggLngoXDIn0?=
 =?us-ascii?Q?ePw6uNB469tZK+ftGhGd7wEdLULR6POTz27NA/00gQSUlXUyNt9GrIPZHnlS?=
 =?us-ascii?Q?84xoEkBvurGZmWYXzkl2q1VpHL7f6YUo3063iagABq4brn9wDXQNfYCfOWwH?=
 =?us-ascii?Q?vVUSzJa/4dzaZZp0bAexKhgbbJ2G2MQmcN89E8fdNZoVjzkcks1K9YMdKlRv?=
 =?us-ascii?Q?89te4OF+FO/VVDWgukunxMjA/kf+pRskR/G6sDJ3L6ikVIUsHT8NufoqWLPT?=
 =?us-ascii?Q?ftEtPO8XGnfdw7O5xtbXm7aQu2bArqGtHKsnleXKWNUZ+QAkJR+9ljxYPbD0?=
 =?us-ascii?Q?VqXl/cQFK5HE2274YgLqER63GZEU5RDQwj+9s+WSPvAQ2cZbKYA4Vdy3Fng3?=
 =?us-ascii?Q?G674uQPulJ5gN5iVBIakEeyNawSj7zuRqFfZhc9sHxtZEY4B2RP8nO1eTBhz?=
 =?us-ascii?Q?SDESkSYPoEllyMxJ2ASYyXZ7Im/yeRdaRaibH+VJDBIOLR/OVtTc/xpppAxf?=
 =?us-ascii?Q?jkwqBERf2P/XBiBH3VNn7YA3BTnb35quN1U7yTnGL/QwLjZRbaLRRuUT0aTx?=
 =?us-ascii?Q?LobkVEFY19o4mfgT8RltIzr5Kq4pJfiWSDQxUmlhIMzHRq1OVxXZGus4Wg8K?=
 =?us-ascii?Q?m5KmfKDjTnj17O9LR+Fx+TPFJ1k4msM0xBPZR0R9/v22leFtOsoEFoCeDALn?=
 =?us-ascii?Q?cDr5QVsvNiFu7XFzedBAQuevhrimANO3vaaLw6BEnF0rRB82qj1oJSm5DVCd?=
 =?us-ascii?Q?0GyI6xvsQoR5IpgvN35NJDeijRG6cm6SfUCrLzv15A7+TYb80GUCXUe2E5wR?=
 =?us-ascii?Q?e+c3OEMy1DYnG3rLDbzbDAQd+reSckdjQf6OyKu3OC6C+6cPiYB80vFxFyxU?=
 =?us-ascii?Q?xgU3iRNX625sLqMXVuM2fFRL9O1BiZllK9Z7vKSvomeTf7wTGSx8/qdpis5w?=
 =?us-ascii?Q?Ac7MCPO5kGoj+mYM5y3MPlDsMbBXLa6AI/UQjhA+0aVATCAEJ6o4QUI9EWYy?=
 =?us-ascii?Q?XJqZ3QSbEFlVUC5ZAT8E3273He9Lb6drS3CZkhVCAyruUp+HVBfYuokBMBrB?=
 =?us-ascii?Q?91cOdbLgSwwS4uRsFj6eaGEZsMfYMFKM5kOZGBjFy5wKB8PJT1pep5SEnGUX?=
 =?us-ascii?Q?3D/C8sqwZGhxOcchxwjg8aQzd80EEsvG98zIRtbXphkvynK1NQfK7jEVe1/2?=
 =?us-ascii?Q?UnMYmcVqZ2aQBbSWewFZg+IepjlGXOXzFOmUjOSy2kOZD2X/Iae9NQzLklPK?=
 =?us-ascii?Q?KFMy4PHMNA0ol5950YUZ8gQItEKf1z+fFoRo0R7Mz9pb7caY7pCGTIJPT2lc?=
 =?us-ascii?Q?6GvJIyz1t/uNxl4++WYRxUJ9QzJJP4DfA+iUSKCSRMy/6HhUCRyTEcOntHu6?=
 =?us-ascii?Q?tM9BO8VaZ1+7UowAgMm9Ih+OatRVfa82PBR6Jwsl4dLrZvITvIOTS8frxh7z?=
 =?us-ascii?Q?Exg0FKMkKhI0IN2D5gd4cCJBLvsUca0yImDCPtLxM5T2fwAITc3cLtrCsJEU?=
 =?us-ascii?Q?SYEN4iBSmwQH8oDK7f2OW/a0ELm+Uq/7UayF?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9P194MB1356.EURP194.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(52116014)(376014)(1800799024)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?IwCQrycdGVk+pUjWY8wTbgMq1MFkSd9zaxIEAoB7T/5gbFXSNGPshTyKscYL?=
 =?us-ascii?Q?mTSAX9UPABOz1r+qJTfbeMVghSLK1ftI8Ji2P0Tm89uB8jVUoVVj4P7t1tfD?=
 =?us-ascii?Q?PaEurrjGlPRehkoZzAkPXuYnA5gxKA0juLGClw2HZ/bP+lm4uzGjwLDUcmVp?=
 =?us-ascii?Q?CfwH6oRvr3RdpuF+tz/yV/wUokA4i1AjO57DFYsThPvwMUGK9l9v3YaqYXE9?=
 =?us-ascii?Q?Ab5ITumgY58ruFsYrEQmiTn2UK0etaUalh01/bHvgkQywm2UaKLk+7rmsu6e?=
 =?us-ascii?Q?CKDIYigYp0KRFyzSpDFSb6Q6UtaYRsnrB00f+oxmwavnjxj0VMhn+L+78kEz?=
 =?us-ascii?Q?AcZBkAEbH6vMLv2U3riq+EYI4LyHsaR4LT+SVtgiNy7MDy+PaJrcCOOTedot?=
 =?us-ascii?Q?yY3sPVXmB67oc0kCMrDvbusguOMQ5IiCjEKXIiEhksmwR+LafkdcJGzGYoFV?=
 =?us-ascii?Q?Hrk74CXordaqi1RzalLi26u7ciofuEGNt2GMZWDZ75fyHgEhjZFpo6IsMYfF?=
 =?us-ascii?Q?0rnf6vy8QQaIKcwdJrC+l0WvMChYJwnIoucg8WaVbCjhi1SKDS/Bc7Q2b+0b?=
 =?us-ascii?Q?tZbfai4hN752iHYPq6ZZo0K1fqxiaOIEd1I+AY+R6EZFcC8ZLYlSS+gxwys4?=
 =?us-ascii?Q?YA0zBZy4sK+rG7Cv0CPAFoi/aX1PsbbqiIqUr/HNDuqvXGH+OYmJTTeGzgZ7?=
 =?us-ascii?Q?V/7FzqRJC4uxV9PqZBou2b/6d9jNq+hy6Yv/8bgUx/Zc9RhoIuTpeTYl8QzC?=
 =?us-ascii?Q?lOezlAQjDUdmtPtNyzdsgi1H0Rprjd3c3Ot7sor1/1Q9RmvPV43PggU4YxtG?=
 =?us-ascii?Q?uQk9fcMFVDRm6dOmlUjUmjdDyzUwCDvW9IPt3GTBT9RdWjSD1mmeyCuosFhU?=
 =?us-ascii?Q?jdDk4dtGuh6b6ejS6VKXx5vMUTlN7SHuNlUQHfoKfCys33iNFFP4zDp9XfN8?=
 =?us-ascii?Q?ZevUyr2KaFAWyjdAjAj5If+B6rWjqAn2JcW+oYga18uEnD9cRTyyLtrWXUOF?=
 =?us-ascii?Q?ZAAOb0dYdpCJ03R9JgmwF+TDwmAkj8H2udwxTJK/U+pCd0SMXl4MxjcRojOo?=
 =?us-ascii?Q?lN8YX9HbVTTT8u8U0SSsSVY5vuRESdkVQpZV4qGxwY6B6Hrd11FkxWBTtmLt?=
 =?us-ascii?Q?CPjMyHthVFfyYxgSMPm/PEtea77lIpV4Di4JCsYWUGaaVlnmR93Ced9mDgwb?=
 =?us-ascii?Q?6OoauVwI0tp8Lfwe6eV3S7WPaAYjswu/4xg/smTavZ99Y9+OIXgSr81WFaok?=
 =?us-ascii?Q?i7P2PWxGhQJN+Dvt+S+863z3xdwAR4FDpVp5vM3uWc1xla7cBZejj6nWnnO6?=
 =?us-ascii?Q?/Noe5edleWWzNRY5CkY1BuHOfqYPE3dnBLwIFMQWsTDWFrnUH9vAJl0SghRe?=
 =?us-ascii?Q?GGtQS2VKBfTbJmxJI9vWL4oJgiS3zJ1NTmNTAng8DuHVaB62fdv+5Si5vvHV?=
 =?us-ascii?Q?E7YGMfdnvcEKUA19vgxtbPx03dE2lEAUgUpl0w2NPx7SZfXlduEp95hrVJoL?=
 =?us-ascii?Q?K4OTnVgt0xIzUMaPCbUJZ6uhe6Amddj06AfXmeFv58lA4OSTzKnB/SKR9VlJ?=
 =?us-ascii?Q?70Kj3qunbnZjwzC+s6vfV6YUnTjHMDeLsy+2o8JZ?=
X-OriginatorOrg: hailo.ai
X-MS-Exchange-CrossTenant-Network-Message-Id: 2f280052-cfa2-467d-f19e-08de38ab8472
X-MS-Exchange-CrossTenant-AuthSource: DB9P194MB1356.EURP194.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Dec 2025 11:50:44.8009
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 6ae4a5f7-5467-4189-8f6a-f2928ed536de
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3HVBYIfd64LnK0UMdRAurBR6Jcn5kAbx5hsDH8cns6RqF/Qq63Gmxq7hswLGT2yATtKN3LsKJFp7Nec97qQT2Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA3P194MB2735

In function `scmi_devm_notifier_unregister` the notifier-block parameter
was unused and therefore never passed to `devres_release`. This causes
the function to always return -ENOENT and fail to unregister the
notifier.

In drivers that rely on this function for cleanup this causes
unexpected failures including kernel-panic.

Fixes: 5ad3d1cf7d34 ("firmware: arm_scmi: Introduce new devres
notification ops")
Signed-off-by: Amitai Gottlieb <amitaig@hailo.ai>
---

This is not needed upstream becaues the bug was fixed
in a refactor by commit 264a2c520628 ("firmware: arm_scmi: Simplify
scmi_devm_notifier_unregister").  It is needed for the 5.15, 6.1 and
6.6 kernels.

 drivers/firmware/arm_scmi/notify.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/firmware/arm_scmi/notify.c b/drivers/firmware/arm_scmi/notify.c
index 0efd20cd9d69..4782b115e6ec 100644
--- a/drivers/firmware/arm_scmi/notify.c
+++ b/drivers/firmware/arm_scmi/notify.c
@@ -1539,6 +1539,7 @@ static int scmi_devm_notifier_unregister(struct scmi_device *sdev,
 	dres.handle = sdev->handle;
 	dres.proto_id = proto_id;
 	dres.evt_id = evt_id;
+	dres.nb = nb;
 	if (src_id) {
 		dres.__src_id = *src_id;
 		dres.src_id = &dres.__src_id;
-- 
2.34.1


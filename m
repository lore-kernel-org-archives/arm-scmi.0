Received: from EUR05-DB8-obe.outbound.protection.outlook.com (mail-db8eur05on2066.outbound.protection.outlook.com [40.107.20.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4DEF248BAF
	for <arm-scmi@vger.kernel.org>; Wed, 15 Jan 2025 11:18:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.20.66
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736939909; cv=fail; b=OqFA+ewklON3GNE94JU3lLXt+pdLXkkLLsnluQYQ45KGl9HcPm9zxxHOlqSIcGd3h96zWcjaJyKLZ0T8S8wae4zv7rfHrx6xZELxV4TIGHfto/0trLbskLl9y9+oR/dqcEwROXG/8fqrtnePZ2v1otnlxrzsa267Iu4zYAWTIL0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736939909; c=relaxed/simple;
	bh=YrvhuuTgL3JNyQHCh6FkvPHKoxUfAljLZOgc/KR0b9c=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=Jlje2IszLW1r2vSnEl2hHFRNCca3sXihYsl+GyIiWia62w/nZPDqn3ERd3V7el0bJMNMzqcMbd1gL1Lb8Ase2NgemrBncU5vDwEndhzdB3SgNmE6KycGf0TszEEs8XSd3U9ArfVnJHG/G/2loyJdFto8TQnxUF03vrBue7mO4bc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=PeBZL3UX; arc=fail smtp.client-ip=40.107.20.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="PeBZL3UX"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MJUpyd15tS5fKq/pf+0+v8w88wYCraKsTYGdTq/IEWMyfEHt7t1/rbb934dn/9Sq0CZsC0IZG9emGvvCqB4rid4hjD02DpMG4silkAjKemMbSz+foXEBtqKW1wBLPBZgltLsvwlUbSpQkonVONh2E6stRXOz8FmZtnhYKGxm5BH6aP33e7/pIbzWYCe/DBsJfBXVkZTDXNDUZuH00nuxqyjxZOguYc9AskLDMxZAHErB7eiKHNcYSn8rMiLbezqXhgqaqiIdw2yf7cxDuCtire7WAjHfG7VdnMTfZ7eclUeWwlycuP8Vxt30Wm6aEzeI60thmDiAoGmqfVBEnRBGFQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bCF31bs5AoHoTuZWp0xLv7IdN7zYIqqIh6ApM/uEETk=;
 b=iIETQpDBgO8Q6p+yU7Sv+oGcmqmaLAtUYcuCiDqqzcRsddeeMgZRR5BaP6wy2oC06qXkNYLEUQv5eNZe3qsZ/cRew1tYAqQEah4s0iNkup/nCzTMeXbt4AAjbXszdESMCkDCBhZu+QKlXPiwsc68Xrd7mGsv4gzQ2/bom9y6TMuEP8yH7QYuuUtIusSn+n1t2T4MIgtVf4U5iJby6GHLftImetyc0liVlupCJbHBtQgaC6ApTExS+x30sfoaIWtnuMl4PVTNelLSstVkG086rETcsnvtwc7hO2XxasjeK5vutQiZHdbPKWT1X1w3/hbj2dYmftfB4JqWfaC9rf8l5A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bCF31bs5AoHoTuZWp0xLv7IdN7zYIqqIh6ApM/uEETk=;
 b=PeBZL3UXnKLX3t6+8N4YEsQAHocfGADDTg0LcIu0/HUQ3ii+H0p0cmTtfRcr4ze3p65JU4AH14muNjbbDm5DR/HJ+WpIRQs4gKqlf54LdGTgrorULTtYR7cy1K92Kpm0ormJitf69lc+8ad8Ks6oK8EWo8LEMzffCSeSzoMTd5o=
Received: from GV2PR08MB7955.eurprd08.prod.outlook.com (2603:10a6:150:7f::21)
 by AS2PR08MB8805.eurprd08.prod.outlook.com (2603:10a6:20b:5f5::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8335.16; Wed, 15 Jan
 2025 11:18:21 +0000
Received: from GV2PR08MB7955.eurprd08.prod.outlook.com
 ([fe80::360d:c6b4:e158:bc33]) by GV2PR08MB7955.eurprd08.prod.outlook.com
 ([fe80::360d:c6b4:e158:bc33%5]) with mapi id 15.20.8356.010; Wed, 15 Jan 2025
 11:18:20 +0000
From: Khaled Ali Ahmed <Khaled.AliAhmed@arm.com>
To: Dan Carpenter <dan.carpenter@linaro.org>
CC: "arm-scmi@vger.kernel.org" <arm-scmi@vger.kernel.org>
Subject: Re: [bug report] SCP: memory corruption in
 scmi_pin_control_list_associations_handler()
Thread-Topic: [bug report] SCP: memory corruption in
 scmi_pin_control_list_associations_handler()
Thread-Index: AQHbZzeV+CDngrTrbUCYNR9U12+rHLMXr2nL
Date: Wed, 15 Jan 2025 11:18:20 +0000
Message-ID:
 <GV2PR08MB7955BFCA7C65B71A0E2C72CAEB192@GV2PR08MB7955.eurprd08.prod.outlook.com>
References: <Z4eMsp1jo4zlNmpb@stanley.mountain>
In-Reply-To: <Z4eMsp1jo4zlNmpb@stanley.mountain>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: GV2PR08MB7955:EE_|AS2PR08MB8805:EE_
x-ms-office365-filtering-correlation-id: ad9e5c55-78e7-4779-04a5-08dd3556519e
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|1800799024|366016|38070700018;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?wL0sh2Zs6CV7jh6lv2XeV7EMxfE0wZmq06frAqi62Srw9Lzg4wDwSZGLfe?=
 =?iso-8859-1?Q?+3+g1fqORBeRw0ui+WjZPb9t4nQ9kHix5lZ0OlUvebZ7DMP577zPIAUCy3?=
 =?iso-8859-1?Q?UukKlwauP95CWREp5p0PVdQ5C8eeLiPG1/3gicrp/LGbuwR8Wvoh1Lq15a?=
 =?iso-8859-1?Q?e1EjhTLXm31gzzAj8IW+tnzcuAFIVf3vHPpOGMgj0EOAoJObVkp5vLw0RE?=
 =?iso-8859-1?Q?OrHthg1KfBS8r0Z1AnKnvRadc7fKzaHxpL4cdi/ba1zy23YNi/zVuQNBqd?=
 =?iso-8859-1?Q?qXS7qFQaidBXTHxO/EX+VD0URGfuz1NWgSzjbiPSYUn+bHEO+W5HgC7+3Y?=
 =?iso-8859-1?Q?nOdKHSlDbg+3gqLN+uS/i1+2dwkQ/gd5sVw5PLFH3j4WePn6gKQP+9W/TA?=
 =?iso-8859-1?Q?ajzQTGfI+GASLWmMFo7JgBgIfIe/kD89NQ9+0RVCCTysMDDMyWbhcxK++C?=
 =?iso-8859-1?Q?ohyuOk3FICJ1nAvRD9hpYDDp8TQgwV6THK3PVejxvTKsDDBsC3uECwX8N3?=
 =?iso-8859-1?Q?8E5GBs/vGzXvHrNSCgju2xOElzWC19OOH9y+9z3XWk8VolrFl/y9nqk8ai?=
 =?iso-8859-1?Q?pfQPQrQ1XFMYqk74H7DQQzaBmnwTkcxeC3lbVUPhNBWOpw+EcYRAiDPvGM?=
 =?iso-8859-1?Q?pcen0MPhrXWPFM4DBTXRfDyU7pu2sTCEEjDA9jvD0pvCsNnuZH3A9clyWF?=
 =?iso-8859-1?Q?gh2YE/lIMm3BlFge/rWtRzV3x9T+j1KkQZLReqg7iDimAyNHNIURSv1YFQ?=
 =?iso-8859-1?Q?D6h0tCcofhYwxw3/CRnIDNakeD+IZ/keAd564aD71nTJZskgyCUXptGRWj?=
 =?iso-8859-1?Q?GiMsaPUjBlEMG89DOLXY1pA5bk6kJFhZPWR1lWiJ5c7F+MpKtO0cuLGizc?=
 =?iso-8859-1?Q?9R8QeX0S+xmbUv8YkMyMKWRESypDVug9VMQwtdM4Nx4tS8EPsLeXolZjXt?=
 =?iso-8859-1?Q?a1fXtaDjHk/8QsN1RWd3dEYGGHm+epGTr4lL96Jqr5SC1Wgz1MdTatQ2n1?=
 =?iso-8859-1?Q?Bb3XWDCq6OSzxahg8RzP9kcIHuYm7Hb4J6oIMVpuwAhOAnb1s7NPXrpsEU?=
 =?iso-8859-1?Q?Z+pX3GImdJZJaH/ygFzEkEQTfursqiAJQ2t4mJ+AARpmn2Uq8QSvtXuoXg?=
 =?iso-8859-1?Q?YdDUXjI/nRxdXnXBQyDDxOrkYQWS75G/V/2pA9L7rE9bj+N//HsOsXTl+3?=
 =?iso-8859-1?Q?Hl/sNEpfMqBp2TGSB6GFpAzjoekuAfLjnNExR2K9MrUl3LKpG1sxCkDhtI?=
 =?iso-8859-1?Q?Dd2ljA6XhCiCJUVwbnHRQJL3X/PghRmQtJsB0NwK+LBxCOfAiPxwkuwn1c?=
 =?iso-8859-1?Q?/RPYKB1eGD2LWsrA8bOc6Iv77pkwHXwrwNpQY/LKhdbz9r1nghXA/EjZ9o?=
 =?iso-8859-1?Q?xAdP6GSTNctSBG3J1pITmyDPK1aBxtSB9QdNMTzt5/srijFd3Tt+J/jVob?=
 =?iso-8859-1?Q?ju93dbnfcI2pk3bUVSh8zTwICM14EC6SrMWogNcXQtYOE80EEZIyMx9iaH?=
 =?iso-8859-1?Q?MDnhyzR+Cz6/rwEJSubQHr?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR08MB7955.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?5bwiIAo7bMQG2YzDVvFab5+tl1dMujhigK2p6qq5QrK+0FUzpPNp9oty7d?=
 =?iso-8859-1?Q?zn5h7s2btIGc+Ss7bwkD6HxA0/lYDxuBiLQ+qvdREs78qrvt3yihEqw3wx?=
 =?iso-8859-1?Q?975JcbH8spUBRDbRnK9EN+C6ML7omFjfQ0X93kFrHM2zkRsTPR2FdxbAag?=
 =?iso-8859-1?Q?VyPeZczZsHoTmw+tR3bWoQeYNgYQsaYqHNOeqiwnO8qkVwgR8Db2WceOFL?=
 =?iso-8859-1?Q?mkjFFxFz2dGop6dd/R/EnDrrl0dxY5u6G8CZt+x1a4qKVq47ujrv6FfhG1?=
 =?iso-8859-1?Q?XpIOhGY0+L2aqaELF+llPaNWgAWHx1wyRjECCDEPUfA/QwUK499Z5oG58t?=
 =?iso-8859-1?Q?wqZvO5sdAmtEo6c7FB86TDvp76zTsT4WI8ZqYDRy5giCkkayyNRX4sUkZE?=
 =?iso-8859-1?Q?1BD4lFap/1EqNPIoQlA4G1e+EJEBxviOfhaBSf6rKvbiI9kJZRkMYV+r2f?=
 =?iso-8859-1?Q?/gT4+z1IZTcIw8oKOr+AENOzyzSLDdEPriOdvPRAn9pF9EMk0YrbAG0Hof?=
 =?iso-8859-1?Q?vFxtv98cqxRz2r64Y0MyxI9NsNuWaACTsqioIQO6anIZLGT6w1aTSfEUSx?=
 =?iso-8859-1?Q?3iiMV++vcQai65MjqZ2WhTagXyQuR6604uAIWDMsB5PuY2Tyb3XsLRmx1t?=
 =?iso-8859-1?Q?pkZ7nglXi6W2Bo2OWM2wKFq6jpl+SPtgWyutlvkiKuRZ1O6tkG7kjYrPtx?=
 =?iso-8859-1?Q?Tud8UdMXA3Qxy+2To2bjIq117WxBrQ1C5GgRuGtqyiFVsKeq+1HfpoPlvo?=
 =?iso-8859-1?Q?VfU4ccd1oD7KLfnp/kVvmg94FvOQcz68Ftu8Ise5WIHRZCpPz5EQBKzB2z?=
 =?iso-8859-1?Q?DLm/Iz8vbz0RMo3E/gC8no+W5F++0jW6J+P/OUpYshrEZBhz6vqtZ4WP0E?=
 =?iso-8859-1?Q?+hJpaSGfsRDWVG1exMogF8f9xfOMSklesZgOjPOibhHM5Mlh8WyfJLwlj7?=
 =?iso-8859-1?Q?6vxQKFHnlMDzqzsLSso1iooOswFbXmUzSRsunWeMyzmBGMEi78CQdn1ooE?=
 =?iso-8859-1?Q?EDheL1nZtSfc0lpOjNoJlN8xLOkFlCu/lj2M7okVtSG+LV3NWaUpfAYC+6?=
 =?iso-8859-1?Q?9caGA3n1Q7jd0qKBK518T+cd/gjxqVAXAQE8/mIoOaFh2GlsmW1FMtOWAi?=
 =?iso-8859-1?Q?yQtfdVgu/7XnoHMSSdpX14gyagElq1It/lRWIVjejuntTc/jJbz9qtCwJx?=
 =?iso-8859-1?Q?lBmIELhTaiiJu45Ihn3+ZUPIBu1hEfYIqDz4abvyE47JFmww58+8wvv9Yh?=
 =?iso-8859-1?Q?0PkMcc9Ofk5xQzF76XL82qdPLkXfpzjhRLQmv5LacbnAZXaG3ndBfCNPsV?=
 =?iso-8859-1?Q?N5uboW+R6tSTPxl4y+p/dQvD0vo5A1nSjYvMyv0G/rzFTJXnpGwpPsdhXs?=
 =?iso-8859-1?Q?u+apsT+zCvKKoCRN13rhDBhTOnVK2Gyu7TJbs4r045XL5c3qBrGtEYyhxi?=
 =?iso-8859-1?Q?oLGF3bgB3QaoRlOmjKPTiQz7e1412S71d8fNfc/vxDTOkgfS2Jij5XEThU?=
 =?iso-8859-1?Q?TCBYO5S8deQ6DZxEQqUppSI8hT5H5WjGOaw/4vwGbwHV+OGO5qhx9jEHp6?=
 =?iso-8859-1?Q?9h3KH8wmj90sRrksO7OOQcUddpG+awnNU3PrafOhqlawkc5MYXfo5Cg/KS?=
 =?iso-8859-1?Q?4FnZ1L+PfIQWEB98Z0KGG9VPAHEDp6ojSn?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: arm-scmi@vger.kernel.org
List-Id: <arm-scmi.vger.kernel.org>
List-Subscribe: <mailto:arm-scmi+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:arm-scmi+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: GV2PR08MB7955.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ad9e5c55-78e7-4779-04a5-08dd3556519e
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Jan 2025 11:18:20.9106
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ZAHCj/Q2r/iMK2xQTG27iw2hN9PBUkTrSSEux7ag05LSKK58+5pblEyFKOb7dFM19MTolgDPwzbcEVJUXkOb2w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR08MB8805


Hi Dan,

write_payload API is a helpful function and can lead to easier and more eff=
ective implementation, while we ask the Transport to set an object into a c=
ertain offset in a service_id buffer, the main reason for that is that we d=
on't know if we will continue the loop successfully or not.
after that, we should call respond which will trigger the Transport that th=
e buffer now is completed and please respond whenever you are ready.

regarding the previous description, I encourage you to use write_payload wh=
enever you can.

thanks, Dan so much


________________________________________
From: Dan Carpenter <dan.carpenter@linaro.org>
Sent: Wednesday, January 15, 2025 10:23 AM
To: Khaled Ali Ahmed <Khaled.AliAhmed@arm.com>
Cc: arm-scmi@vger.kernel.org <arm-scmi@vger.kernel.org>
Subject: [bug report] SCP: memory corruption in scmi_pin_control_list_assoc=
iations_handler()

I'm not sure how scmi_api->write_payload() is supposed to work and
I'm getting memory corruption in scmi_pin_control_list_associations_handler=
().

module/scmi_pin_control/src/mod_scmi_pin_control.c
   309  static int scmi_pin_control_list_associations_handler(
   310      fwk_id_t service_id,
   311      const uint32_t *payload)
   312  {
   313      const struct scmi_pin_control_list_associations_a2p *parameters=
;
   314      uint32_t payload_size;
   315      uint16_t identifiers_count;
   316      uint16_t total_number_of_associations;
   317      uint16_t remaining_associations;
   318      uint16_t identifier_index;
   319      size_t buffer_allowed_identifiers;
   320      uint16_t mapped_identifier;
   321
   322      int status;
   323
   324      struct scmi_pin_control_list_associations_p2a return_values =3D=
 {
   325          .status =3D (int32_t)SCMI_GENERIC_ERROR,
   326          .flags =3D 0,
   327      };
   328
   329      payload_size =3D (uint32_t)sizeof(return_values);
   330
   331      parameters =3D (const struct scmi_pin_control_list_associations=
_a2p *)payload;
   332
   333      status =3D map_identifier(parameters->identifier, &mapped_ident=
ifier);
   334
   335      if (status !=3D FWK_SUCCESS) {
   336          return_values.status =3D SCMI_NOT_FOUND;
   337          goto exit;
   338      }
   339
   340      status =3D scmi_pin_control_ctx.pinctrl_api->get_total_number_o=
f_associations(
   341          mapped_identifier, parameters->flags, &total_number_of_asso=
ciations);
   342      if (status !=3D FWK_SUCCESS) {
   343          return_values.status =3D SCMI_NOT_FOUND;
   344          goto exit;
   345      }
   346
   347      if (parameters->index >=3D total_number_of_associations) {
   348          return_values.status =3D SCMI_NOT_FOUND;
   349          goto exit;
   350      }
   351
   352      remaining_associations =3D total_number_of_associations - param=
eters->index;
   353
   354      status =3D number_of_elements_allowed_in_payload(
   355          service_id,
   356          sizeof(struct scmi_pin_control_list_associations_p2a),
   357          sizeof(uint16_t),
   358          (size_t *)&buffer_allowed_identifiers);
   359      if (status !=3D FWK_SUCCESS) {
   360          goto exit;
   361      }
   362
   363      identifiers_count =3D (uint16_t)FWK_MIN(
   364          buffer_allowed_identifiers, remaining_associations);
   365
   366      return_values.flags =3D identifiers_count;
   367      return_values.flags |=3D SHIFT_LEFT_BY_POS(
   368          (remaining_associations - identifiers_count),
   369          NUM_OF_REMAINING_ELEMENTS_POS);
   370
   371      for (identifier_index =3D 0; identifier_index < identifiers_cou=
nt;
   372           identifier_index++) {
   373          uint16_t object_id;
   374
   375          status =3D scmi_pin_control_ctx.pinctrl_api->get_list_assoc=
iations(
   376              mapped_identifier,
   377              parameters->flags,
   378              (parameters->index + identifier_index),
   379              &object_id);
   380          if (status !=3D FWK_SUCCESS) {
   381              return_values.status =3D SCMI_NOT_FOUND;
   382              goto exit;
   383          }
   384
   385          status =3D scmi_pin_control_ctx.scmi_api->write_payload(
   386              service_id, payload_size, &object_id, sizeof(object_id)=
);

This code writes the u16 object id to the correct place.  It happens
in transport_write_payload()

   387          if (status !=3D FWK_SUCCESS) {
   388              goto exit;
   389          }
   390
   391          payload_size +=3D (uint32_t)sizeof(object_id);
   392      }
   393
   394      return_values.status =3D (int32_t)SCMI_SUCCESS;
   395
   396  exit:
   397      return scmi_pin_control_ctx.scmi_api->respond(
   398          service_id,
   399          (return_values.status =3D=3D SCMI_SUCCESS) ? (void *)&retur=
n_values :
   400                                                   (void *)&return_va=
lues.status,
   401          (return_values.status =3D=3D SCMI_SUCCESS) ? payload_size :

But this payload_size will overwrite it again with data from beyond
the end of the return_values struct.  I don't really understand how
write payload is supposed to work.  Maybe we need to create a different
type of ->done() function pointer so that we could call ->write_payload()
in a loop and then call ->done() to actually send the data?

For now, I've just removed the ->write_payload() and done send the
response using ->respond() with an allocated buffer and that solves
my issues.

regards,
dan carpenter

   402                                                   sizeof(return_valu=
es.status));
   403  }


IMPORTANT NOTICE: The contents of this email and any attachments are confid=
ential and may also be privileged. If you are not the intended recipient, p=
lease notify the sender immediately and do not disclose the contents to any=
 other person, use it for any purpose, or store or copy the information in =
any medium. Thank you.

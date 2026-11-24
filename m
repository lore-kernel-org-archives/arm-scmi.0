Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795546294;
	b=g8f9W6YW1wiaePPzD5UYq5bc1GKx15CgGWGKyFnFB4EmOUoEmzWBwEHG28ZJOak5d96n
	 B/ZhCTfOhC00+fsE7GA/hxYymqMJiFbTAT6oKpmcARiQkmuAgetPHzhgCq1FMGyJ2+n1S
	 /w06mqhs/64UztFneXYDNc0nSSmYUyA82tVTWLSB3Bd8PHSq2CObip9qFTevWenGSQjtP
	 +0fkzJnidhXKPBQOqpN8pS9SWaJ8OLa+uSIXt3747oIFvjaaMAZpjUaukcwU2KmEFGO6f
	 p3D37IVtrC4bzATR/+qJyVbZwVh2PpK2xDedEb6NsKKWOIwkF05MD7TfPwuMqzSy/ZQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795546294;
	h=DMARC-Filter:Received:Received:DKIM-Signature:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=MIi4Hjgf0ad8LYLMaOyFuMEZmfNfqGqK7YiBKEuihGs=;
	b=BBoykp/9wqMupBwWGWu0KvqBKDWIKPkXsKR1EkQzt/rFiD7+N4d4lcR+YI9TIZ/fRXDc
	 QWYs9ema49gJ7NhpwJgwWTYwCkfs3k8sgDHFUa6cOZifHfjjvBqayZjKBbNEvtjRfGJgt
	 AANLpRUzqjaMqRCySlJAWuDxfSlD6eedhxCvT2/D/1kNPumexP0zyWL9AA8CjaEcTWSG1
	 wkdrqB4o/FJ89BpuqbEndNSE7V+FkjpKQQKODpZU3i77elSgysVt3TNaxq1qP+bbxPvYA
	 k0QAPI9KjHBf2hpE6Db4/JskkGFabBu3VyW6n7RKH8lRs5twwXBAIHBqOq5XHD3FQAw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=arm.com;
	spf=pass smtp.mailfrom=arm.com;
	dkim=pass header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=FXFV5cLl;
	arc=none smtp.remote-ip=217.140.110.172
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 444BF606A32D;
	Tue, 24 Nov 2026 18:51:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 444BF606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=FXFV5cLl
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 14F33497;
	Tue, 24 Nov 2026 10:51:30 -0800 (PST)
Received: from pluto.guest.local (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 9F5213F86C;
	Tue, 24 Nov 2026 10:51:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1795546292; bh=bw0eKGi+nO4EfAJOpprYf++ygxFHMmD6pckeKCqtn0c=;
	h=From:To:Cc:Subject:Date:From;
	b=FXFV5cLlihW+cnr1GL//DoAx8sQikOfDN5lxwMP97KskoFW7tef36kUJkLQM0ShIi
	 C1v1Kjy5wh1XVLa0AMoN26l05vRuETzO9F8mi7ZdOL1yGoFtTwkI4jEg884UpmGzkm
	 TWv7ld2zWZbNKpR0kaLhT9WTS8DSOHhX7ngRggWc=
From: Cristian Marussi <cristian.marussi@arm.com>
To: linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	arm-scmi@vger.kernel.org
Cc: sudeep.holla@kernel.org,
	philip.radford@arm.com,
	Cristian Marussi <cristian.marussi@arm.com>
Subject: [PATCH 0/2] SCMI protocols fixes and refactor
Date: Tue, 24 Nov 2026 18:51:09 +0000
Message-ID: <20261124185111.1022322-1-cristian.marussi@arm.com>
X-Mailer: git-send-email 2.54.0
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

Hi,

A tiny series addressing a minor protocol initialization issue reported by
Sashiko (patch 1/2) and a general tiny following refactor around that same
protocol initialization/fnalization code.

Note that the refactoring moves around the scmi_protocol_put() calls on the
failure path of initialization AND on the protocol release code flow: this
basicall causes the module_put() where needed to be called after the
protocol devres group release, which is how it should have happened really
all the time to avoid races at unload time. IOW the logic is a bit changed
BUT there should NOT be any functional change...at least intended :P

Moreover this standalone tiny series will be also reposted within the
larger Telemetry series to avoid conflicts and ease merging.

Thanks,
Cristian

Cristian Marussi (2):
  firmware: arm_scmi: Invoke proper protocol cleanup on failure
  firmware: arm_scmi: Refactor protocol allocation

 drivers/firmware/arm_scmi/driver.c | 58 ++++++++++++++----------------
 1 file changed, 26 insertions(+), 32 deletions(-)

-- 
2.54.0


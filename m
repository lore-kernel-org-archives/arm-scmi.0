Received: from mail-qk1-f179.google.com (mail-qk1-f179.google.com [209.85.222.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 404F930C618
	for <arm-scmi@vger.kernel.org>; Thu, 15 Jan 2026 19:34:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768505700; cv=none; b=eUhLQgpLeqcC5rDlCsElyjOKveU609e6PSO81yxdTkLr2z6/rYP56AWGU3Y5jna7BGkMN/pQPyAnDeJNWcyDw0SGksAWNcA+HisFDP7i1KwMc/BKZtPu0MfuEjTI5UJ79rBKRnGnLNct1MR5uEuNhx6+dWkrYMRKDoLs/AaWFBw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768505700; c=relaxed/simple;
	bh=BVuRcIp9C9aDs7YujmRCIsJWyiCOSqmqC7FZNs5wMUU=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Content-Type; b=D/kIwbeWI399j4JP7YPGl7Youx5pZWsP7V+ANv15+7LJzviesfKed+wRXxZFY62IVLj52WKlJXFDuCNruvnSRvW5qF3vFyZPO/EsqFE3uhNGTqhp8Ixipm8Psv5OkIGYM24ETkeEBH154/8tllxKb5yqMF1GIeEGN54xVEUUsrM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oasis-open.org; spf=pass smtp.mailfrom=oasis-open.org; dkim=pass (2048-bit key) header.d=oasis-open-org.20230601.gappssmtp.com header.i=@oasis-open-org.20230601.gappssmtp.com header.b=p4OYThRV; arc=none smtp.client-ip=209.85.222.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oasis-open.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oasis-open.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oasis-open-org.20230601.gappssmtp.com header.i=@oasis-open-org.20230601.gappssmtp.com header.b="p4OYThRV"
Received: by mail-qk1-f179.google.com with SMTP id af79cd13be357-8c6a5c57e01so34277185a.2
        for <arm-scmi@vger.kernel.org>; Thu, 15 Jan 2026 11:34:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oasis-open-org.20230601.gappssmtp.com; s=20230601; t=1768505698; x=1769110498; darn=vger.kernel.org;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=BVuRcIp9C9aDs7YujmRCIsJWyiCOSqmqC7FZNs5wMUU=;
        b=p4OYThRVj7k/VmOV3+W8oZHXQNO5n0JWtMuzBBNNqPZWT4So7IM22zjVksw/X87yVT
         XHYwTS6WmnNL4VlIZwCo49QJjqyQhiNR1TGd7KyErUCsUpDS3of0kOasGJ2wuc3pTikS
         P4gqcWiCerDmA9aCa+7LXyodHoq/wamhZ+FbVM41k2NjoYcYgIXS0PFRd4j5lsMzkBIR
         GIUjRAvgHghfSaQoaqx8zzb6lqsSr1iNFvZOVvVULgbA0prsLObPxHqaWb2ThgOilKmi
         ELy0qCA9F37hSfTcKIbNQUuk3y4vYpYRes9uiJkdlFyG9DNvm54r3AU0h4t9sKIu11pr
         pJfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768505698; x=1769110498;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BVuRcIp9C9aDs7YujmRCIsJWyiCOSqmqC7FZNs5wMUU=;
        b=iwXjPmPbn2asBnENseFqZvBnU7Wuaa9o4NQ7uW/v1pqYcE9p7qreiF0w74XpkQP2Iu
         pM8CAu4R1Gy8Qa+zHRhU+XpyY4Q4FIdjM3aKUbsWo3kl8Qdiojs2YIk6e0TCJmvjP8Rf
         CTEm4gFrJN4jWCut9azDPP+WS3ohY6rjxeHwPpHFyqP5DPN057XRCz3akTYg8+97M5SE
         6AZPhIzJ9runR2AKIicGQzjAkwZsRaKd7EEiK/1IqTBGRz1z0+Yj2cuYhkk8zdYKPHKP
         XUW9+8xvKNwXtYJQyjxgOLSYmLW4EwZsZ57P2TW8UFJ1s1zAqsfAHA7b4UPl5kBRgSG6
         x47g==
X-Gm-Message-State: AOJu0YzmGMR4a6S5AQH6C4hX2ejc/Y1iMBiAeGIDPnnFt4zBJ21Sju+6
	8F9p5LC+UMuan6y3ClKb0RNm8d0dRCbLsMh1NAd3UB+bkSGW2H0HOOlivWrFHJbKlnnjnKSmxub
	D17j0BMKryoF3gWYdku0NNn4lGhWNjkJHMkV95hW3Qlt/n/22bnUO7kc=
X-Gm-Gg: AY/fxX729mbThnmm2EDDldv+C+qLz8BraCl8Ejht4jHJfSs2gPyt+huB1rgei/2PrRK
	KQ90JEiD0g1H5GZNJOVYjDkxQINhjw8dbzl0WIcRlWw+UgIWOtspsEWJMheIfeGsDQcLe7DSua/
	7mc1GpOg4k54vxijHlLtPTJ56S5dzoNP5MSlbH1jCRLN39gdP+KP2Mx4t0CpiB9vwuazI7rjuLl
	hUwfwcb6xRqcbV+36zTA6AAIwyE5OJY4Lldh6mqHSkIkYdCjF0hjOGBLrtAcWft6IJXUZQwJXlA
	pzJfUvA1/6/SWUX1izQdGjVVDsJGEesQI/ZQvylvKHmczjx6Poj3i2Ov84ZC
X-Received: by 2002:a05:620a:1a86:b0:8b2:4a1b:b80a with SMTP id
 af79cd13be357-8c6a66e4ec2mr101238285a.25.1768505697784; Thu, 15 Jan 2026
 11:34:57 -0800 (PST)
Precedence: bulk
X-Mailing-List: arm-scmi@vger.kernel.org
List-Id: <arm-scmi.vger.kernel.org>
List-Subscribe: <mailto:arm-scmi+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:arm-scmi+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Kelly Cullinane <kelly.cullinane@oasis-open.org>
Date: Thu, 15 Jan 2026 14:34:20 -0500
X-Gm-Features: AZwV_QjddGhLjZXCW0Ea6FLX52-iMhg8aSnZxDeDmIlSP0USYQOH1UHFdbcR4XE
Message-ID: <CAAiF60368DpEyCq_ES+7TDZWXwT40-di-N8Aeu0v33NgDvf2jg@mail.gmail.com>
Subject: Invitation to comment on VIRTIO v1.4 CSD01
To: arm-scmi@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

OASIS members and other interested parties,

OASIS and the VIRTIO TC are pleased to announce that VIRTIO v1.4 CSD01
is now available for public review and comment.

VIRTIO TC aims to enhance the performance of virtual devices by
standardizing key features of the VIRTIO (Virtual I/O) Device
Specification.

Virtual I/O Device (VIRTIO) Version 1.4
Committee Specification Draft 01 / Public Review Draft 01
09 December 2025

TEX: https://docs.oasis-open.org/virtio/virtio/v1.4/csprd01/virtio-v1.4-csp=
rd01.html
(Authoritative)
HTML: https://docs.oasis-open.org/virtio/virtio/v1.4/csprd01/virtio-v1.4-cs=
prd01.html
PDF: https://docs.oasis-open.org/virtio/virtio/v1.4/csprd01/virtio-v1.4-csp=
rd01.pdf

The ZIP containing the complete files of this release is found in the direc=
tory:
https://docs.oasis-open.org/virtio/virtio/v1.4/csprd01/virtio-v1.4-csprd01.=
zip

How to Provide Feedback
OASIS and the VIRTIO TC value your feedback. We solicit input from
developers, users and others, whether OASIS members or not, for the
sake of improving the interoperability and quality of its technical
work.

The public review is now open and ends Friday, February 13 2026 at 23:59 UT=
C.

Comments may be submitted to the project=E2=80=99s comment mailing list at
virtio-comment@lists.linux.dev. You can subscribe to the list by
sending an email to
virtio-comment+subscribe@lists.linux.dev.

All comments submitted to OASIS are subject to the OASIS Feedback
License, which ensures that the feedback you provide carries the same
obligations at least as the obligations of the TC members. In
connection with this public review, we call your attention to the
OASIS IPR Policy applicable especially to the work of this technical
committee. All members of the TC should be familiar with this
document, which may create obligations regarding the disclosure and
availability of a member's patent, copyright, trademark and license
rights that read on an approved OASIS specification.

OASIS invites any persons who know of any such claims to disclose
these if they may be essential to the implementation of the above
specification, so that notice of them may be posted to the notice page
for this TC's work.

Additional information about the specification and the VIRTIO TC can
be found at the TC=E2=80=99s public homepage.

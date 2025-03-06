Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5186A209F38
	for <arm-scmi@vger.kernel.org>; Thu,  6 Mar 2025 09:52:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741254768; cv=none; b=FScdka+7/Zyl9OzUFVkDnBkU+spW/PCgS3AT7LYGmFFvBp17+PKdW79ikNRUjojsavxR1fV6HAZFUubL3T59izV1gRd4wdzK1RLaFzlB4UQgUATNIEpuBNQQP0wazYMawinSJzUgrXasTo/R8+cSFKUVtFUoRHCNrV6704mhRI4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741254768; c=relaxed/simple;
	bh=OpP02Odj4k0D2bR+wxP/1tQdJcnhUktBfhiwWEN5cUM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=s7iCi189nOPaMd4L6q+5aYqfBbF6gglhk9ypGViQqEJ0fvwyO/cDa+N8Hmv0Gfi11I20PRc+uk6yggU9z+o7pNGtIcY4Y9Ydcp9o2cvZvVaWPSg6FgLjtwDdERN9P497OlXijQW7tHNKSJ6BwJ/XOzA3LBimzQvcO5bEmPTaYW0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=EWygHXyR; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="EWygHXyR"
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-390e3b3d432so248084f8f.2
        for <arm-scmi@vger.kernel.org>; Thu, 06 Mar 2025 01:52:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741254763; x=1741859563; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=/5YjDLXAFEE2I2agFXCd7ZtfTQqmGL8SET1VkcUfoEo=;
        b=EWygHXyRi1pfklh9BFw6+99pOemvEmMjpf9tXEa4agwsh7pRTTAWqyOYoO3E0Bon0N
         ZPnsIr03uNzAg3AAWYnN/rYiZYN+FmY26CBJdWeWruT5Nrxfd1ukwc+YsfCG0nWmzvR3
         4cicXofRzlRkIxFjTyWV09Dc6p5zLDORlz3TrVnU/RWDspkGPikklkF59nmdncKCa6t7
         2NH4CNggvEGpVJs/JlQTxcxrw4N2Rtr1Ifb6IptiRryanCnpy82ul5I7/ZZo8/cHKYS3
         F/CL8fC22TeDYlavOCILQ13TFpYAojrEpMgMIVW3gWWMOchHRbH3bBtc/6zwWetFDhmS
         k01w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741254763; x=1741859563;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/5YjDLXAFEE2I2agFXCd7ZtfTQqmGL8SET1VkcUfoEo=;
        b=CD7ggFU37zJiT/PDb9AU72ROPPXzOlQBrG6Py764VdhCi6GaYMZgtMJQoBwH4oWPcJ
         AIciWkApar6wqGrFMyhUYYLDzad+NH2gfaMruwRu1h4yYO6hU6C1Xf+52c8DLvj+1waW
         /RyL4Jnew1TsvH29P+bcECauqwCZ1ZDhouvic6xfYeOOPlXugvlyJcTa7/CEt9M73JVh
         jx0Et8swJ9uv5LIK6eNhlOSXElO2AFAs5kCgV63UpfVXjBGsslZT1p6ULh5bAXv234rI
         AffytepXhzI/G+I+qJgCxVmvQlCKWh9GXuFrVa6S62sV+n+rK1EIhgHUsZQBsd96E73P
         gGFQ==
X-Gm-Message-State: AOJu0YxDBrWcVLmkNSEyGbqzNXHHV2Efof7jM+a3vOzcROfb6MT+rplS
	zAMnRc97nbrqnRLDQXWbGdjp5TjxhHFBjtaYJPL9/50Vj8K/Sw1TDqQf8/YHg/jeu5KzngTpv+V
	P
X-Gm-Gg: ASbGncsWkdlQVpVVi0TitoZhR4Jj2XzNy7laRdwgGoKt6nBFysgxVp+U135umJXXIw3
	MHjoVJA7PJKLdvjmi1popc0j0qqCrKQCQzrLjx191aA/LYkxpMee/SwiaZ+PDE/ZLL4ABAowOQi
	++Wf2hsi8qK3R2xJ40A5g4iwfMDRoIorT99YSI8nVFMtPI0tbvDx8MCenrEEQyIHFknsiCa7DGK
	p17gBHcdnTou3Eg8AgKmiZyLBoZNsH0FjCeYW6eHwSzn6vKgKLs/rKAoQDN60H+ItxwMJ5R8Uwm
	Tz6DLQJBo990tSNvXNsCdFrYFwB56uycWjhmOkNuERRCrbYV6g==
X-Google-Smtp-Source: AGHT+IFiji8nF4kCdG28uWs7l7TWqgMF0zrRIL68QQ/MS+5W3OeOVBGi/Am067QLpDTawmbbaMHIhg==
X-Received: by 2002:a05:6000:1f8b:b0:390:f400:2083 with SMTP id ffacd0b85a97d-3911f58fa13mr6439225f8f.0.1741254763399;
        Thu, 06 Mar 2025 01:52:43 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-43bdd93c9d6sm14516525e9.26.2025.03.06.01.52.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Mar 2025 01:52:42 -0800 (PST)
Date: Thu, 6 Mar 2025 12:52:39 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: arm-scmi@vger.kernel.org
Cc: Vincent Guittot <vincent.guittot@linaro.org>
Subject: Testing SCP with vhost and qemu
Message-ID: <e3c246e6-feca-42d9-af27-88a397c39c3f@stanley.mountain>
Precedence: bulk
X-Mailing-List: arm-scmi@vger.kernel.org
List-Id: <arm-scmi.vger.kernel.org>
List-Subscribe: <mailto:arm-scmi+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:arm-scmi+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Vincent actually did all this work, but I've dusted it off a bit and
uploaded it to github.  What this does it lets you test SCP software
with Qemu so it's quite useful for developers.

https://github.com/error27/SCP-firmware

regards,
dan carpenter

How to test SCP over VHOST

1) Download qemu source and build it
2) sudo cp -r ./build/subprojects/libvhost-user/* /usr/local/lib/
3) Edit module/host/vhost/CMakeLists.txt and make this line:

-set(QEMU_SRC_DIR "/home/dcarpenter/progs/qemu/")
+set(QEMU_SRC_DIR "/home/<your username>/your/path/")

4) cmake -B build-vhost -DSCP_FIRMWARE_SOURCE_DIR:PATH=vhost-user/fw -DDISABLE_CPPCHECK=1
5) cmake --build build-vhost/
6) Start the SCP server:

	~/progs/scmi/SCP/build-vhost/bin/vhost-user.elf

7) Run qemu.  You'll want to set virt-8.2,acpi=off and provide a
   qemu.dtb device tree file.

~/progs/qemu/build/qemu-system-aarch64 \
    -nographic \
    -cpu cortex-a57 \
    -smp 2 \
    -machine virt-8.2,acpi=off,memory-backend=mem \
    -m 2G \
    -kernel vmlinux-$VER \
    -initrd initrd.img-$VER \
    -dtb qemu.dtb \
    -drive if=none,file=mantic.img,id=hd0 \
    -drive file=user-data.img,format=raw,id=cloud \
    -device virtio-blk-device,drive=hd0 \
    -net user,hostfwd=tcp::30022-:22 \
    -net nic -vnc :3 \
    -chardev socket,path=vscmi-guest0.sock,id=scmi0 \
    -device vhost-user-scmi-pci,chardev=scmi0,id=scmi \
    -object memory-backend-file,id=mem,size=2G,mem-path=shm,share=on \
    -append 'console=ttyAMA0 '





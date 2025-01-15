Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4ACAF1E7C16
	for <arm-scmi@vger.kernel.org>; Wed, 15 Jan 2025 10:23:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736936634; cv=none; b=AaGVPLigdtEeuIJaKmMvnHfn8nsgGQVTLwkH4/OA9XriOBXVEW2hkv5uFHO4bri3qBlJ7SRA1+kijk0hE5Ah/VfsqZjY2spoIqfQ9He8x84d370hOZKg+AmeVsuR5Sn8hGp5p3O6hXjUza5PgNP/lkip0Bg6vWtknLY6/su3z/Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736936634; c=relaxed/simple;
	bh=aUC4qFVQKiLOyaTvuP1OmDPNLIoiWg60XjyQYi8xfGE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=meCWwwlnasVc9f2qOBY8IMnwD91DSRr/Y9+H3j5eWoTt04OQqOjsl0VWUm5VNYMvkTYYLC+5TQD0Q62EGBskIlisIY/loE7udk2kbwXPl4gwYpxqehjLktnykyc+Vw2y9+BrV4173kB02XHH8yLDfGmyNfsWwGtr4etMZ9X7k3U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=nso73RhA; arc=none smtp.client-ip=209.85.208.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="nso73RhA"
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-5d3cf094768so11298929a12.0
        for <arm-scmi@vger.kernel.org>; Wed, 15 Jan 2025 02:23:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1736936630; x=1737541430; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=0w/at+4EbUycRrIa7IiF/HsXL0UzAxkhc8RC9oWlF18=;
        b=nso73RhAv2iDGmOLkFJ0tqTcJwtGXIGaCYnPpDREnwegAZClEqleTHAkkIzke/FVtj
         4x083IHBTR90/uJXfqbqnKQm4EpVyn4LHaH2rb000KPu5Eyx4wGiMrkjyzV8utYThy9w
         pcQ8OYjuRFHEZZN6uzX/yvhcR5cgzMDcvXDeQJe5cSFiSet7zTA9v4wFBoL93Jr5jd9V
         FXcAvaII/NMl0ZhrMqCE5XiXfOfnAkBfzw1jIn+rctH/p8oHyICJNkepUXKRfjGyJhPv
         m9ZE5EpYAh120YHXSwfuJ5ccS6GY77KN65YnQBVIw4z5YRaX9Mc5aogULzCV6QgEdd92
         sRYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736936630; x=1737541430;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=0w/at+4EbUycRrIa7IiF/HsXL0UzAxkhc8RC9oWlF18=;
        b=lafmQxsbPK+gnvmVmyBW4IHZtcl3YQ65Bt+NFYQxl2T/y05dpr+Gf79SCZhw1Fsx7V
         EvuqE+VKWXID1322JtQLLq9bSIX+tbCmD1oxt6cVuMSzQ0afah91hndG1tGe98PqR8xQ
         CGHoV56QyflUVa5sY25OaZoEC8iNOroAdeatCwlfzvGIEk8MK7qF5UBVbTR6+IU3609B
         m0t4PvtHkPJJEhmkcm6lP8TneioCzaGjIN1IVjK+iob+OT8YgrlNYbfO5lYY0vmdD5IR
         ffj0YqGEBbZx6bMc3fV15FEFLGY32HALvTYwJjSPYZZXP9y7lkqLitm21Oq+43mC8ATa
         2yUQ==
X-Gm-Message-State: AOJu0YzCUPmEg7iaWI8dilp6NNt+uvzJawGNztQvvueUmmvmCKhfImwr
	nwLJ9pga9tyWoGtTq+HQCjizbxAoCQIrEPwuiO/U9bvDMwGyOLm7z++eYfZNML4=
X-Gm-Gg: ASbGncvqKHjKgQ94AHrJzRqHyewB+iEEFRYjTmaoucMZOmoOaISO8HNEEc4pgMIWH8R
	p6iQjpEBS+2igh2udinNO62ma1otklLD6MLH/oY+vEuqBsgpEvDBGdQT+mIOZRzYHd8mJnQOawB
	SmIG51vMit35wPtOatl7V8ggOUpdsyxHKQZOfUq/Qt0YzJZnl+ToMFPVe6PcG9RO9CcIS/aKMqM
	VrEJdVXBqxUj6iyUtblBpqQDZAQq0ujdsr8yYJDkZ0zRbDaxdLgUyvASZ2ImA==
X-Google-Smtp-Source: AGHT+IHu4CVPRf+xzoCevsUM3ypGTYXt7GGx1KRA73S/eBvKJmq2Oi97K7pWp3PvxJR5KbuTHWi8Ag==
X-Received: by 2002:a05:6402:440a:b0:5da:1544:7733 with SMTP id 4fb4d7f45d1cf-5da15447abfmr688882a12.9.1736936630389;
        Wed, 15 Jan 2025 02:23:50 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5d99008c294sm7259402a12.15.2025.01.15.02.23.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jan 2025 02:23:49 -0800 (PST)
Date: Wed, 15 Jan 2025 13:23:46 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Khaled Ali Ahmed <Khaled.AliAhmed@arm.com>
Cc: "arm-scmi@vger.kernel.org" <arm-scmi@vger.kernel.org>
Subject: [bug report] SCP: memory corruption in
 scmi_pin_control_list_associations_handler()
Message-ID: <Z4eMsp1jo4zlNmpb@stanley.mountain>
Precedence: bulk
X-Mailing-List: arm-scmi@vger.kernel.org
List-Id: <arm-scmi.vger.kernel.org>
List-Subscribe: <mailto:arm-scmi+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:arm-scmi+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

I'm not sure how scmi_api->write_payload() is supposed to work and
I'm getting memory corruption in scmi_pin_control_list_associations_handler().

module/scmi_pin_control/src/mod_scmi_pin_control.c
   309  static int scmi_pin_control_list_associations_handler(
   310      fwk_id_t service_id,
   311      const uint32_t *payload)
   312  {
   313      const struct scmi_pin_control_list_associations_a2p *parameters;
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
   324      struct scmi_pin_control_list_associations_p2a return_values = {
   325          .status = (int32_t)SCMI_GENERIC_ERROR,
   326          .flags = 0,
   327      };
   328  
   329      payload_size = (uint32_t)sizeof(return_values);
   330  
   331      parameters = (const struct scmi_pin_control_list_associations_a2p *)payload;
   332  
   333      status = map_identifier(parameters->identifier, &mapped_identifier);
   334  
   335      if (status != FWK_SUCCESS) {
   336          return_values.status = SCMI_NOT_FOUND;
   337          goto exit;
   338      }
   339  
   340      status = scmi_pin_control_ctx.pinctrl_api->get_total_number_of_associations(
   341          mapped_identifier, parameters->flags, &total_number_of_associations);
   342      if (status != FWK_SUCCESS) {
   343          return_values.status = SCMI_NOT_FOUND;
   344          goto exit;
   345      }
   346  
   347      if (parameters->index >= total_number_of_associations) {
   348          return_values.status = SCMI_NOT_FOUND;
   349          goto exit;
   350      }
   351  
   352      remaining_associations = total_number_of_associations - parameters->index;
   353  
   354      status = number_of_elements_allowed_in_payload(
   355          service_id,
   356          sizeof(struct scmi_pin_control_list_associations_p2a),
   357          sizeof(uint16_t),
   358          (size_t *)&buffer_allowed_identifiers);
   359      if (status != FWK_SUCCESS) {
   360          goto exit;
   361      }
   362  
   363      identifiers_count = (uint16_t)FWK_MIN(
   364          buffer_allowed_identifiers, remaining_associations);
   365  
   366      return_values.flags = identifiers_count;
   367      return_values.flags |= SHIFT_LEFT_BY_POS(
   368          (remaining_associations - identifiers_count),
   369          NUM_OF_REMAINING_ELEMENTS_POS);
   370  
   371      for (identifier_index = 0; identifier_index < identifiers_count;
   372           identifier_index++) {
   373          uint16_t object_id;
   374  
   375          status = scmi_pin_control_ctx.pinctrl_api->get_list_associations(
   376              mapped_identifier,
   377              parameters->flags,
   378              (parameters->index + identifier_index),
   379              &object_id);
   380          if (status != FWK_SUCCESS) {
   381              return_values.status = SCMI_NOT_FOUND;
   382              goto exit;
   383          }
   384  
   385          status = scmi_pin_control_ctx.scmi_api->write_payload(
   386              service_id, payload_size, &object_id, sizeof(object_id));

This code writes the u16 object id to the correct place.  It happens
in transport_write_payload()

   387          if (status != FWK_SUCCESS) {
   388              goto exit;
   389          }
   390  
   391          payload_size += (uint32_t)sizeof(object_id);
   392      }
   393  
   394      return_values.status = (int32_t)SCMI_SUCCESS;
   395  
   396  exit:
   397      return scmi_pin_control_ctx.scmi_api->respond(
   398          service_id,
   399          (return_values.status == SCMI_SUCCESS) ? (void *)&return_values :
   400                                                   (void *)&return_values.status,
   401          (return_values.status == SCMI_SUCCESS) ? payload_size :

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

   402                                                   sizeof(return_values.status));
   403  }




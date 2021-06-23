import 'dart:convert';
import 'dart:developer';

import 'package:enstrurent/models/address.dart';
import 'package:enstrurent/models/renter.dart';
import 'package:enstrurent/services/http_request.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:get/get_connect/http/src/status/http_status.dart';

class ProfileController extends GetxController {
  HttpRequest _sender = Get.find();
  Renter? renter;
  Address? renterAddress;

  @override
  onInit() {
    super.onInit();
    getProfileData();
  }

  getProfileData() async {
    var response = await _sender.send("renters", Request.GET);

    if (response.statusCode == HttpStatus.ok)
      renter = Renter.fromJson(json.decode(response.body));
    else
      log("Error on getting renter profile data: ${response.body}");
  }

   getAddress() async {
    if (renter!.address_id != "" && renterAddress == null) {
      var response =
          await _sender.send("addresses/${renter!.address_id}", Request.GET);

      if (response.statusCode == HttpStatus.ok)
        renterAddress = Address.fromJson(response.body);
      else
        log("Error on getting address profile data: ${response.body}");
    } else
      log("There's no registered address");
  }
}

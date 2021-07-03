import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:enstrurent/models/address.dart';
import 'package:enstrurent/models/renter.dart';
import 'package:enstrurent/services/http_request.dart';
import 'package:enstrurent/services/photo_service.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/status/http_status.dart';

enum ProfilePhoto { headers, profile }

class ProfileController extends GetxController {
  HttpRequest _sender = Get.find();
  Renter? renter;
  Address? renterAddress;
  RxString profilePhotoURL = "".obs;
  RxString headerPhotoURL = "".obs;

  @override
  onInit() async {
    super.onInit();
    await getProfileData();
    if (renter!.profile_pic_name != null)
      setProfilePhoto = renter!.profile_pic_name!;

    if (renter!.header_pic_name != null)
      setHeaderPhoto = renter!.header_pic_name!;
  }

  set setProfilePhoto(String value) {
    profilePhotoURL.value = _sender.hostName + "/images/" + value;
  }

  set setHeaderPhoto(String value) {
    headerPhotoURL.value = _sender.hostName + "/images/" + value;
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

  changePhoto(ProfilePhoto type) async {
    var selectedPhoto = await PhotoService.getSelectionDialog();

    if (selectedPhoto is File) {
      try {
        PhotoService photoService = PhotoService();
        var response = await photoService.uploadSinglePhoto(selectedPhoto,
            isThumbnail: false);
        String photoName = List.castFrom(response!.data["image_names"])[0];

        if (type == ProfilePhoto.headers) {
          renter!.header_pic_name = photoName;
          setHeaderPhoto = photoName;
          _sender.send("/renters", Request.PUT,
              body: jsonEncode(renter!.toJson()));
        } else if (type == ProfilePhoto.profile) {
          renter!.profile_pic_name = photoName;
          setProfilePhoto = photoName;
        }
        _sender.send("/renters", Request.PUT,
            body: jsonEncode(renter!.toJson()));
        update();
      } catch (e, stackTrace) {
        log("$e stack trace: $stackTrace", name: "ERROR ON changePhoto");
      }
    }
  }
}

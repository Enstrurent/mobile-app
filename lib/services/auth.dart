import 'package:enstrurent/services/http_request.dart';
import 'package:enstrurent/services/secure_store.dart';

enum Roles { GUEST, RENTER, CLIENT }

Map<Roles, String> roleString = {
  Roles.GUEST: "guest",
  Roles.RENTER: "renter",
  Roles.CLIENT: "client"
};

class Auth {
  Future<Roles> checkCurrentUser() async {
    var secure = SecureStore();

    if (await validateToken()) {
      var role = await secure.readValue("role");
      if (role == roleString[Roles.RENTER]) return Roles.RENTER;
      else if (role == roleString[Roles.CLIENT]) return Roles.CLIENT;

      return Roles.GUEST;
    } else
      return Roles.GUEST;
  }

  Future<bool> validateToken() async {
    HttpRequest reqSender = HttpRequest();
    var response = await reqSender.send("auth/validate", Request.GET); //FIXME

    if (response.statusCode == 200)
      return true;
    else
      return false;
  }
}

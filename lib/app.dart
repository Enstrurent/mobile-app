import 'package:enstrurent/config/themes.dart';
import 'package:enstrurent/pages/client/home/home_view.dart';
import 'package:enstrurent/pages/guest/home/home_view.dart';
import 'package:enstrurent/pages/guest/home/home_bindings.dart';
import 'package:enstrurent/pages/loading/loading_view.dart';
import 'package:enstrurent/pages/login/login_view.dart';
import 'package:enstrurent/config/ui_translations.dart';
import 'package:enstrurent/pages/renter/home/home_view.dart';
import 'package:enstrurent/pages/sign_up/sign_up_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => GetMaterialApp(
    themeMode: ThemeMode.dark,
    darkTheme: Themes.darkTheme,
    debugShowCheckedModeBanner: false,
    translations: UITranslations(),
    locale: Get.deviceLocale,
    initialRoute: "/",
    getPages: [
      GetPage(name: "/", page: () => LoadingView()),
      GetPage(name: "/guest", page: () => GuestHome(), binding: HomeBinding()),
      GetPage(name: "/login", page: () => LoginView()),
      GetPage(name: "/sign_up", page: () => SignUpView()),
      GetPage(name: "/renter", page: () => RenterHome()),
      GetPage(name: "/client", page: () => ClientHome())
    ],
  );
}

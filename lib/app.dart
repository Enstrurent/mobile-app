import 'package:enstrurent/pages/home.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class App extends StatelessWidget {
  const App({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) => GetMaterialApp(
    debugShowCheckedModeBanner: false,
    initialRoute: "/",
    getPages: [
      GetPage(name: "/", page: () => Home())
    ],
  );
}

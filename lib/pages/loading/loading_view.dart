import 'package:enstrurent/pages/loading/loading_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class LoadingView extends StatelessWidget {
  final LoadingController _controller = Get.put(LoadingController());
  @override
  Widget build(BuildContext context) {
    _controller.callNavigate();
    return Scaffold(
      backgroundColor: Get.theme.backgroundColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              margin: EdgeInsets.fromLTRB(0, 0,30, 0),
              child: Text("ENSTRURENT",
                  style: Get.textTheme.headline3),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(190, 0, 0, 0),
              child: Text("RENTER",
                  style: Get.textTheme.headline3!.copyWith(fontSize: 22)),
            ),
            SizedBox(height: 70),
            SpinKitSquareCircle(color: Get.theme.primaryColor, size: 30)
          ],
        ),
      ),
    );
  }
}

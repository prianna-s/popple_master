import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:popple/generated/assets.dart';

import 'splash_controller.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(SplashController());
    return Container(
      color: Colors.white,
      padding: EdgeInsets.all(50),
      child: Image.asset(Assets.imgLogoWithIcon),
    );
  }
}

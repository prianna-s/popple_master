import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyGroupController extends GetxController {
  GlobalKey<ScaffoldState> scaffoldKey =  GlobalKey<ScaffoldState>();
  RxString type=RxString("group");
  RxBool isMyGroup=RxBool(true);
  @override
  void onReady() {
    // TODO: implement onReady
    super.onReady();
    isMyGroup.value=Get.arguments['myGroup']??false;
    update();
  }

  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
  }
}

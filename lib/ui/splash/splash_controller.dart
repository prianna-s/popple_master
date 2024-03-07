import 'package:get/get.dart';

import '../../repos/session_repo.dart';

class SplashController extends GetxController {
  @override
  void onReady() {
    super.onReady();
    Future.delayed(Duration(seconds: 3),() {
      isLogin().then((value){
        Get.offAndToNamed(value?'/dashboard':'/login');
      });
    },);
  }

  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
  }
}

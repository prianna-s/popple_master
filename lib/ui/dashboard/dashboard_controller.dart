import 'package:get/get.dart';
import 'package:popple/repos/session_repo.dart';
import '../../Models/interest_response.dart';
import '../../repos/dashboard_repo.dart';

class DashboardController extends GetxController {
  var currentIndex = 0.obs;
  RxList<Interest>interestList=RxList();
  @override
  void onReady() {
    super.onReady();
    getSession();
  }
@override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    initInterestList();
  }
  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
  }
  void changePage(int index) {
    if(currentIndex.value!=index) {
      currentIndex.value = index;
      Get.toNamed("$index",id: 1);
    }
  }
  void initInterestList(){
    getInterestList().then((value){
      interestList.value=value.result??[];
    });
  }
}

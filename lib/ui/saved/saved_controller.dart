import 'package:get/get.dart';
import '../../Models/event_response.dart';
import '../../repos/event_repo.dart';

class SavedController extends GetxController {
  Rx<EventResponse?> eventResponse=Rx(null);


  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
  }
  void list({catID=""}){
    getSavedEventList(cat_id: catID).then((value){
      eventResponse.value=value;
    });
  }
}

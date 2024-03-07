
import 'package:get/get.dart';
import 'package:get/get_rx/get_rx.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:popple/Models/event_response.dart';
import 'package:popple/repos/setting_repo.dart';
import 'package:popple/ui/dashboard/dashboard_controller.dart';
import '../../repos/event_repo.dart';

class ExploreController extends DashboardController {
  String filterDay="Today";
  Rx<EventResponse?> eventResponse=Rx(null);
  RxList<EventData> feturedEvent=RxList([]);
  @override
  void onReady() {
    super.onReady();
    getList();

  }

  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
  }
  void getList(){
    getAllEventList().then((value){
      eventResponse.value=value;
      for (var element in eventResponse.value!.result!) {
        if(element.feature_event=="YES"){
          feturedEvent.add(element);
        }
      }
    });
  }
  void saveEvent(EventData data){
    Map<String,dynamic>map={};
    map['post_id']=data.id;
    map['user_id']=auth.value.id;
    map['cat_id']=data.catId;
    addSavedListener(map).then((value){

    });
  }
 }

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/get_rx.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:google_maps_places_autocomplete_widgets/address_autocomplete_widgets.dart';
import 'package:image_picker/image_picker.dart';
import 'package:popple/Models/event_response.dart';
import 'package:popple/Utils/tools.dart';
import 'package:popple/repos/setting_repo.dart';
import 'package:popple/ui/my_event/widget/success_event_widget.dart';

import '../../Models/interest_response.dart';
import '../../SnckBar/animated_snack_bar.dart';
import '../../SnckBar/types.dart';
import '../../repos/event_repo.dart';

class MyEventController extends GetxController {
  GlobalKey<FormState> formKey =  GlobalKey<FormState>();
  Rx<EventResponse?> eventResponse=Rx(null);
  RxBool showNext=false.obs;
  RxBool isLoading=false.obs;
  Place? address;
  Rx<DateTime?> date=Rx(null);
  Rx<TimeOfDay?> time=Rx(null);
  TextEditingController title_con=TextEditingController();
  TextEditingController description_con=TextEditingController();
  TextEditingController link_con=TextEditingController();
  final ImagePicker picker = ImagePicker();
  RxList<XFile?>file=RxList([]);
  RxBool anonymousEvent=false.obs;
  Interest? selectedCategory;
  Rx<EventData?> data=Rx(null);
  final Completer<GoogleMapController> map_controller = Completer<GoogleMapController>();
  Rx<Map<MarkerId, Marker>> markers = Rx(<MarkerId, Marker>{});
  CameraPosition kGooglePlex = CameraPosition(
    target: LatLng(37.42796133580664, -122.085749655962),
    zoom: 14.4746,
  );
  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }
  void initMyEvent(){
    getMyEventList().then((value){
      eventResponse.value=value;
    });
  }
  void pickImage(){
    picker.pickMultiImage().then((value){
      file.value=value;
    });
  }
  void addEvent(){
    if(selectedCategory==null){
      AnimatedSnackBar.material(
          'Please select Category',
          type: AnimatedSnackBarType.error,
          mobileSnackBarPosition: MobileSnackBarPosition.bottom
      ).show(Get.context!);
      return;
    }
    if(file.isEmpty){
      AnimatedSnackBar.material(
          'Please select Images',
          type: AnimatedSnackBarType.error,
          mobileSnackBarPosition: MobileSnackBarPosition.bottom
      ).show(Get.context!);
      return;
    }
    isLoading.value=true;
    Map<String,dynamic>map={};
    map['user_id']=auth.value.id;
    map['website_link']=link_con.value.text;
    map['title']=title_con.value.text;
    map['description']=description_con.value.text;
    map['address']=address!.formattedAddress;
    map['lat']=address!.lat;
    map['lon']=address!.lng;
    map['cat_id']=selectedCategory!.id;
    map['cat_name']=selectedCategory!.name;
    map['date']=Tools.changeDateFormat(date.value.toString(), "yyyy-MM-dd");
    map['time']='${time.value!.hour}:${time.value!.minute}';
    addEventListener(map,file).then((value){
      isLoading.value=false;
      showDialog(context: Get.context!, builder: (context) {
        return SuccessEventWidget();
      },);
    });
  }
  Future<void> addMarker() async {
    final MarkerId markerId = MarkerId("24fdff");
    final Marker marker = Marker(
      markerId: markerId,
      icon: BitmapDescriptor.defaultMarker,
      position: LatLng(double.parse(data.value!.lat.toString()),double.parse(data.value!.lon.toString())),
      infoWindow: InfoWindow(title: "${data.value!.address}"),
    );
    markers.value[markerId] = marker;
    map_controller.future.then((value){
      value.animateCamera(CameraUpdate.newCameraPosition(CameraPosition(
          zoom: 14.4746,
          target: LatLng(
              double.parse(data.value!.lat.toString()),
              double.parse(data.value!.lon.toString())))));
    });
  }
}

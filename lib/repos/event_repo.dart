import 'package:dio/dio.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart' as rx;
import 'package:image_picker/image_picker.dart';
import 'package:popple/Constant/api_dio.dart';
import 'package:popple/repos/setting_repo.dart';
import '../Models/basic_response.dart';
import '../Models/event_response.dart';

Future<EventResponse>getMyEventList() async {
  var resp= await httpClient().get("get_my_post_event",queryParameters: {
    "user_id":auth.value.id
  });
  return EventResponse.fromJson(resp.data);
}
Future<EventResponse>getAllEventList({cat_id="",search_text=""}) async {
  var resp= await httpClient().get("get_all_post_event",queryParameters: {
    "cat_id":cat_id,
    "search_text":search_text,
    "lat":"22.2565",
    "lon":"75.2652",
  });
  return EventResponse.fromJson(resp.data);
}
Future<EventResponse>getSavedEventList({cat_id="",search_text=""}) async {
  var resp= await httpClient().get("get_posts_saved",queryParameters: {
    "cat_id":cat_id,
    "user_id":auth.value.id,
    "search_text":search_text,
  });
  return EventResponse.fromJson(resp.data);
}
Future<BasicResponse>addEventListener(Map<String,dynamic> map,rx.RxList<XFile?>file) async {
  List<MultipartFile>fileList=[];
  for (var element in file) {
    MultipartFile file= await MultipartFile.fromFile(element!.path,filename: element!.name);
    fileList.add(file);
  }
  map['post_images[]']=fileList;
  FormData data=FormData.fromMap(map);
  var resp= await httpClient().post("add_post_event",data: data);
  return BasicResponse.fromJson(resp.data);
}
Future<BasicResponse>addSavedListener(Map<String,dynamic> map) async {
  var resp= await httpClient().get("add_to_save_post",queryParameters: map);
  return BasicResponse.fromJson(resp.data);
}

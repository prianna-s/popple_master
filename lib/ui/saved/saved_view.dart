import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:popple/ext/hex_color.dart';
import 'package:popple/ui/explore/widgets/interest_chip_widget.dart';

import '../../generated/assets.dart';
import '../explore/widgets/event_list_widget.dart';
import '../widgets/header_txt_widget.dart';
import '../widgets/loading_widget.dart';
import '../widgets/sub_txt_widget.dart';
import 'saved_controller.dart';
class SavedPage extends StatefulWidget {
  const SavedPage({super.key});

  @override
  State<SavedPage> createState() => _pageState();
}
class _pageState extends State<SavedPage> {

  final _con = Get.put(SavedController());
@override
  void initState() {
    // TODO: implement initState
    super.initState();
    _con.list();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _header(),
          Obx(() => Expanded(child: _eventList())),
        ],
      ),
    );
  }
   Widget _header(){
     return SizedBox(
       height: 250,
       child: Stack(
         fit: StackFit.loose,
         children: [
           Positioned(top: 0,left: 0,right: 0,bottom: 35,child: Container(
             decoration:  BoxDecoration(
                 color: '#615BC9'.toColor(),
                 borderRadius: const BorderRadius.only(
                     bottomRight: Radius.circular(30),
                     bottomLeft: Radius.circular(30))
             ),
           ),),
           Positioned(
             top: 50,left: 0,right: 0,bottom: 0,
             child: Column(
               crossAxisAlignment: CrossAxisAlignment.start,
               children: [
                 Padding(padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 10),
                   child: HeaderTxtWidget('Saved',color: Colors.white,fontWeight: FontWeight.w800,fontSize: 34,),),
                 Padding(padding: const EdgeInsets.symmetric(horizontal: 15),
                   child: SearchBar(
                       backgroundColor:  MaterialStatePropertyAll("#615BC9".toColor()),
                       elevation: const MaterialStatePropertyAll(0),
                       hintText: "Search...",
                       hintStyle: const MaterialStatePropertyAll(TextStyle(
                           color: Colors.white,
                           fontStyle: FontStyle.italic,
                           fontSize: 20,
                           fontWeight: FontWeight.w200
                       )),
                       leading: SvgPicture.asset(Assets.svgSearch),

                   ),),
                 InterestChipWidget(onSelect: (val) {
                   _con.list(catID: val.id);
                 },),
               ],
             ),),
         ],
       ),
     );
   }


   Widget _eventList(){
     if(_con.eventResponse.value==null){
       return LoadingWidget(type: LoadingType.MyEvent,);
     }
     if(_con.eventResponse.value!.result!.isEmpty){
       return Center(
         child: SubTxtWidget('${_con.eventResponse.value!.message}'),
       );
     }
     return  ListView.builder(itemBuilder: (context, index) {
       return EventListWidget(_con.eventResponse.value!.result![index]);
     },itemCount: _con.eventResponse.value!.result!.length,shrinkWrap: true,padding: EdgeInsets.zero,);
   }

}

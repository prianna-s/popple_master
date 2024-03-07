import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:popple/ext/hex_color.dart';
import 'package:popple/ui/my_event/widget/event_widget.dart';
import 'package:popple/ui/widgets/loading_widget.dart';
import 'package:popple/ui/widgets/sub_txt_widget.dart';

import '../../generated/assets.dart';
import '../../generated/l10n.dart';
import '../widgets/app_bar_widget.dart';
import '../widgets/header_txt_widget.dart';
import 'my_event_controller.dart';
class MyEventPage extends StatefulWidget {
  const MyEventPage({super.key});

  @override
  State<MyEventPage> createState() => _pageState();
}
class _pageState extends State<MyEventPage> {
  final _con = Get.put(MyEventController());
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _con.initMyEvent();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBarWidget(
        title: HeaderTxtWidget(S.of(context).myEvents,fontSize: 34,color: Colors.white,),
        showBackButton: true,
        bottom: SearchBar(
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
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 20,),
          Expanded(child: Obx(() => _eventList()))
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
      return EventWidget(_con.eventResponse.value!.result![index]);
    },itemCount: _con.eventResponse.value!.result!.length,shrinkWrap: true,);
  }
}

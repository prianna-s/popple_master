import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:popple/ext/hex_color.dart';
import 'package:popple/ui/my_event/my_event_controller.dart';
import 'package:popple/ui/widgets/sub_txt_widget.dart';
import '../../generated/assets.dart';
import '../widgets/header_txt_widget.dart';
class MyEventDetailsPage extends StatefulWidget {
  const MyEventDetailsPage({super.key});

  @override
  State<MyEventDetailsPage> createState() => _pageState();
}
class _pageState extends State<MyEventDetailsPage> {
  final _con = Get.put(MyEventController());
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _con.data.value=Get.arguments;
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: CustomScrollView(slivers: [
          SliverAppBar(
            pinned: true,
            floating: true,
            snap: true,
            expandedHeight: 235,
            elevation: 1,
            leadingWidth: 50,
            title: HeaderTxtWidget('RSVP Details',color: Colors.white,fontSize: 24,),
            iconTheme: const IconThemeData(
              color: Colors.white
            ),
            flexibleSpace: FlexibleSpaceBar(
              collapseMode: CollapseMode.parallax,
              expandedTitleScale: 1,
              background: Container(
                alignment: AlignmentDirectional.center,
                decoration: BoxDecoration(
                  color: "#F6CCD7".toColor(),
                  borderRadius: const BorderRadius.only(bottomRight: Radius.circular(30),bottomLeft: Radius.circular(30))
                ),
                child: Image.asset(Assets.dummyImg9,fit: BoxFit.cover,height: 235,),
              ),
            ),
          ),
          Obx(() =>_con.data.value==null?const CircularProgressIndicator():SliverList(
              delegate: SliverChildListDelegate.fixed([
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 20,),
                      HeaderTxtWidget('${_con.data.value!.title}',fontSize: 30,
                        fontWeight: FontWeight.w700,),
                      const SizedBox(height: 20,),
                      Row(
                        children: [
                          Container(
                            margin: const EdgeInsets.only(right: 10),
                            decoration: BoxDecoration(
                                color: "#5669FF".toColor().withOpacity(0.1),
                                borderRadius: const BorderRadius.all(Radius.circular(10))
                            ),
                            padding: const EdgeInsets.all(8),
                            child: SvgPicture.asset(Assets.svgUser,height: 22,width: 22,),
                          ),
                          SubTxtWidget('300 Total RSVPs'),
                        ],
                      ),
                      const SizedBox(height: 20,),
                      Row(
                        children: [
                          Expanded(flex: 1,child: Column(
                            children: [
                              HeaderTxtWidget('Group',fontSize: 18,fontWeight: FontWeight.w500),
                              const SizedBox(height: 10,),
                              SubTxtWidget('Just the girls :)',fontSize: 12,),
                            ],
                          ),),
                          Expanded(flex: 1,child: Column(
                            children: [
                              HeaderTxtWidget('Name',fontSize: 18,fontWeight: FontWeight.w500),
                              const SizedBox(height: 10,),
                              SubTxtWidget('Sandra',fontSize: 12,),
                            ],
                          ),),
                          Expanded(flex: 1,child: Column(
                            children: [
                              HeaderTxtWidget('Email',fontSize: 18,fontWeight: FontWeight.w500),
                              const SizedBox(height: 10,),
                              SubTxtWidget('sandra@bu.edu',fontSize: 12,),
                            ],
                          ),),
                        ],
                      )

                    ],
                  ),
                )
              ])))
        ]));
  }

}

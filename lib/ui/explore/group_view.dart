import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:popple/ext/hex_color.dart';
import 'package:popple/ui/my_event/widget/event_widget.dart';

import '../../Constant/color_const.dart';
import '../../generated/assets.dart';
import '../my_event/my_event_controller.dart';
import '../widgets/app_bar_widget.dart';
import '../widgets/header_txt_widget.dart';
import '../widgets/sub_txt_widget.dart';

class GroupPage extends StatelessWidget {
  GroupPage({Key? key}) : super(key: key);
  final _con = Get.put(MyEventController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBarWidget(
        title: HeaderTxtWidget("Popples",fontSize: 24,color: Colors.white,),
        showBackButton: true,
        bottom: SearchBar(
            backgroundColor:  MaterialStatePropertyAll("#615BC9".toColor()),
            elevation: const MaterialStatePropertyAll(0),
            hintText: "Search...",
            hintStyle: MaterialStatePropertyAll(TextStyle(
                color: Colors.white.withOpacity(0.5),
                fontStyle: FontStyle.italic,
                fontSize: 20,
                fontWeight: FontWeight.w200
            )),
            leading: SvgPicture.asset(Assets.svgSearch),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 20,),
            ListView.builder(itemBuilder: (context, index) {
              return _groupTile();
            },itemCount: 5,primary: false,shrinkWrap: true,),
          ],
        ),
      ),
    );
  }
  Widget _groupTile(){
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10),
      child: Card(
        shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(20))),
        color: Colors.white,
        elevation: 0.5,
        child: InkWell(
          child: Padding(
            padding: const EdgeInsets.all(5),
            child: Row(
              children: [
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    color: '#F6C2CC'.toColor(),
                  ),
                  padding: EdgeInsets.all(5),
                  child: Image.asset(Assets.dummyImg4,
                    width: 70,
                    height: 70,
                    fit: BoxFit.fill,),
                ),
                const SizedBox(width: 10,),
                Expanded(child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SubTxtWidget('Just the Girls',fontWeight: FontWeight.w500,fontSize: 16,),
                    SubTxtWidget('A couple cool girls looking for new friends!!! Would love to get ready together  ',fontWeight: FontWeight.w500,fontSize: 14,),
                    SizedBox(height: 5,),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                                borderRadius: const BorderRadius.all(Radius.circular(20)),
                                color: "#273E47".toColor()
                            ),
                            padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 5),
                            margin: const EdgeInsets.symmetric(horizontal: 3),
                            child: SubTxtWidget('Concerts',color: Colors.white,fontWeight: FontWeight.w500,fontSize: 12,),
                          ),
                          Container(
                            decoration: BoxDecoration(
                                borderRadius: const BorderRadius.all(Radius.circular(20)),
                                color: "#46CDFB".toColor()
                            ),
                            padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 5),
                            margin: const EdgeInsets.symmetric(horizontal: 3),
                            child: SubTxtWidget('Art',color: Colors.white,fontWeight: FontWeight.w500,fontSize: 12,),
                          ),
                          Container(
                            decoration: BoxDecoration(
                                borderRadius: const BorderRadius.all(Radius.circular(20)),
                                color: "#EF767A".toColor()
                            ),
                            padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 5),
                            margin: const EdgeInsets.symmetric(horizontal: 3),
                            child: SubTxtWidget('Fashion',color: Colors.white,fontWeight: FontWeight.w500,fontSize: 12,),
                          ),
                          Container(
                            decoration: BoxDecoration(
                                borderRadius: const BorderRadius.all(Radius.circular(20)),
                                color: "#EEB868".toColor()
                            ),
                            padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 5),
                            margin: const EdgeInsets.symmetric(horizontal: 3),
                            child: SubTxtWidget('Love Island',color: Colors.white,fontWeight: FontWeight.w500,fontSize: 12,),
                          ),
                        ],
                      ),
                    ),
                  ],
                ))
              ],
            ),
          ),
          onTap: (){
            Get.toNamed("/group_details",arguments: {
              "myGroup":false
            });
          },
        ),
      ),
    );
  }
}

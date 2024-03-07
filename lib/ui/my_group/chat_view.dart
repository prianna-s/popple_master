import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:popple/Constant/color_const.dart';
import 'package:popple/ext/hex_color.dart';
import 'package:popple/ui/widgets/input_widget.dart';
import 'package:popple/ui/widgets/sub_txt_widget.dart';

import '../../generated/assets.dart';
import '../widgets/app_bar_widget.dart';
import '../widgets/header_txt_widget.dart';
import 'my_group_controller.dart';

class ChatPage extends StatelessWidget {
   ChatPage({Key? key}) : super(key: key);
  final _con = Get.put(MyGroupController());
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: color_615BC9,
      appBar: AppBarWidget(
        showBackButton: true,
        borderRadius: BorderRadius.zero,
        title: HeaderTxtWidget("Just the Girls 🥰🥰",fontSize: 24,color: Colors.white,),
        bottom: Container(
          padding: const EdgeInsets.only(bottom: 10,left: 10),
          child: Row(
            children: [
              Image.asset(Assets.dummyImg5,height: 55,width: 55,),
              const SizedBox(width: 5,),
              Image.asset(Assets.dummyImg6,height: 55,width: 55,),
              const SizedBox(width: 5,),
              Image.asset(Assets.dummyImg7,height: 55,width: 55,),
            ],
          ),
        ),
      ),
      body: Container(
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(topRight: Radius.circular(33),topLeft: Radius.circular(33))
        ),
        child: Column(
          children: [
            Expanded(child: SingleChildScrollView(
              child: Column(
                children: [
                  _leftTile(),
                  _leftTile(),
                ],
              ),
            )),
            Padding(padding: const EdgeInsets.symmetric(horizontal: 5,vertical: 5),child: InputWidget(
              hint: "Message here...",
              radius: 30,
              color: "#E8E8E8".toColor(),
              fillColor: "#F6F6F6".toColor(),
              suffixIcon: IconButton(
                icon: SvgPicture.asset(Assets.svgSend),
                onPressed: (){

                },
              ),
            ),)
          ],
        ),
      ),
    );
  }
  Widget _leftTile(){
    return Container(
      padding: const EdgeInsets.all(10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.asset(Assets.dummyImg7,height: 45,width: 45,),
          const SizedBox(width: 10,),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SubTxtWidget('Lara Smith',fontSize: 10,color: "#000E08".toColor(),),
              Container(
                padding: const EdgeInsets.all(5),
                margin: const EdgeInsets.only(top: 5,bottom: 5),
                decoration: BoxDecoration(
                  color: '#F2F7FB'.toColor(),
                  borderRadius: const BorderRadius.all(Radius.circular(10))
                ),
                child: SubTxtWidget('Hey girlies!! So excited 4 this!!',fontSize: 14,fontWeight: FontWeight.w400,
                color: "#000E08".toColor(),),
              ),
              Center(
                child: SubTxtWidget('09:25 AM',color: "#797C7B".toColor(),fontSize: 10,),
              )
            ],
          )
        ],
      ),
    );
  }
}

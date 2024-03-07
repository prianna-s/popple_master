import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:popple/ext/hex_color.dart';
import 'package:popple/generated/assets.dart';
import 'package:popple/ui/widgets/header_txt_widget.dart';

import '../widgets/app_bar_widget.dart';
import 'profile_controller.dart';

class ProfilePage extends StatelessWidget {
   ProfilePage({Key? key}) : super(key: key);
  final _con = Get.put(ProfileController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBarWidget(
        title: HeaderTxtWidget("My Profile",fontSize: 34,color: Colors.white,),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 20,),
            tile(assetName: Assets.svgUser,name: "Edit Profile",onTap:(){
              Get.toNamed('/edit_profile');
            }),
            tile(assetName: Assets.svgLockClosed,name: "Reset Password",onTap: (){
              Get.toNamed('/reset_password');
            }),
            tile(assetName: Assets.svgFlame,name: "My events",onTap: (){
              Get.toNamed('/my_event');
            }),
            tile(assetName: Assets.svgAdd,name: "Create Event",onTap: (){
              Get.toNamed('/create_event');
            }),
            tile(assetName: Assets.svgAdd,name: "Setting",onTap: (){
              Get.toNamed('/setting');
            }),


          ],
        ),
      ),
    );
  }
  Widget tile({required String assetName,required String name,onTap}){
    return Container(
      padding: const EdgeInsets.all(18),
      margin: const EdgeInsets.symmetric(vertical: 10,horizontal: 10),
      decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(15)),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
                color: "#575C8A0F".toColor(),
                blurRadius: 5,
                offset: const Offset(0.2,0.8)
            )
          ]
      ),
      child: InkWell(
        onTap: onTap,
        child: Row(
          children: [
            Container(
              margin: const EdgeInsets.only(right: 10),
              decoration: BoxDecoration(
                  color: "#5669FF".toColor().withOpacity(0.1),
                  borderRadius: const BorderRadius.all(Radius.circular(10))
              ),
              padding: const EdgeInsets.all(8),
              child: SvgPicture.asset(assetName,height: 22,width: 22,),
            ),
            Expanded(child: HeaderTxtWidget(name,fontSize: 20,fontWeight: FontWeight.w500,)),
            SvgPicture.asset(Assets.svgNext),
          ],
        ),
      ),
    );
  }
}

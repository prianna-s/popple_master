import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:popple/ext/hex_color.dart';
import 'package:popple/generated/assets.dart';
import 'package:popple/repos/setting_repo.dart';
import 'package:popple/ui/widgets/header_txt_widget.dart';
import 'package:popple/ui/widgets/input_widget.dart';
import 'package:popple/ui/widgets/sub_txt_widget.dart';

import '../widgets/app_bar_widget.dart';
import 'profile_controller.dart';

class EditProfilePage extends StatelessWidget {
  EditProfilePage({Key? key}) : super(key: key);
  final _con = Get.put(ProfileController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBarWidget(
        showBackButton: true,
        title: HeaderTxtWidget("Profile",fontSize: 24,color: Colors.white,),
        height: 160,
        bottom: Container(
          child: Row(
            children: [
              Image.asset(Assets.dummyImg7,height: 80,width: 80,fit: BoxFit.cover,),
              const SizedBox(width: 10,),
              HeaderTxtWidget("${auth.value.firstName} ${auth.value.lastName}",fontSize: 24,color: Colors.white,),
            ],
          ),
        ),
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 10),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 10,),
              HeaderTxtWidget('About Us',fontSize: 18,fontWeight: FontWeight.w800),
              InputWidget(
                maxLines: 4,
                fillColor: "#F1F5F9".toColor(),
                color: "#F1F5F9".toColor(),
              ),
              const SizedBox(height: 10,),
              HeaderTxtWidget('Interests',fontSize: 18,fontWeight: FontWeight.w800),
              const SizedBox(height: 10,),
              Wrap(children: [
                Padding(padding: const EdgeInsets.symmetric(horizontal: 3),
                  child: ActionChip(label: SubTxtWidget("Concerts",color: Colors.white,
                    italic: true,fontWeight: FontWeight.w200,fontSize: 13,),
                    backgroundColor: '#EEB868'.toColor(),
                    shape: const StadiumBorder(side: BorderSide(color: Colors.transparent)),
                    elevation: 5,
                    onPressed: (){

                    },),),
                Padding(padding: const EdgeInsets.symmetric(horizontal: 3),
                  child: ActionChip(label: SubTxtWidget("R&B",color: Colors.white,
                    italic: true,fontWeight: FontWeight.w200,fontSize: 13,),
                    backgroundColor: '#EF767A'.toColor(),
                    shape: const StadiumBorder(side: BorderSide(color: Colors.transparent)),
                    elevation: 5,
                    onPressed: (){

                    },),),
                Padding(padding: const EdgeInsets.symmetric(horizontal: 3),
                  child: ActionChip(label: SubTxtWidget("Fashion",color: Colors.white,
                    italic: true,fontWeight: FontWeight.w200,fontSize: 13,),
                    backgroundColor: '#DC42BF'.toColor(),
                    shape: const StadiumBorder(side: BorderSide(color: Colors.transparent)),
                    elevation: 5,
                    onPressed: (){

                    },),),
                Padding(padding: const EdgeInsets.symmetric(horizontal: 3),
                  child: ActionChip(label: SubTxtWidget("Art",color: Colors.white,
                    italic: true,fontWeight: FontWeight.w200,fontSize: 13,),
                    backgroundColor: '#8D85F0'.toColor(),
                    shape: const StadiumBorder(side: BorderSide(color: Colors.transparent)),
                    elevation: 5,
                    onPressed: (){

                    },),),
                Padding(padding: const EdgeInsets.symmetric(horizontal: 3),
                  child: ActionChip(label: SubTxtWidget("Love Island",color: Colors.white,
                    italic: true,fontWeight: FontWeight.w200,fontSize: 13,),
                    backgroundColor: '#273E47'.toColor(),
                    shape: const StadiumBorder(side: BorderSide(color: Colors.transparent)),
                    elevation: 5,
                    onPressed: (){

                    },),),
                Padding(padding: const EdgeInsets.symmetric(horizontal: 3),
                  child: ActionChip(label: SubTxtWidget("Movies",color: Colors.white,
                    italic: true,fontWeight: FontWeight.w200,fontSize: 13,),
                    backgroundColor: '#4A43EC'.toColor(),
                    shape: const StadiumBorder(side: BorderSide(color: Colors.transparent)),
                    elevation: 5,
                    onPressed: (){

                    },),),
              ],),
            ],
          ),
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

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:popple/ext/hex_color.dart';
import 'package:popple/ui/widgets/button_primary_widget.dart';
import 'package:popple/ui/widgets/header_txt_widget.dart';
import 'package:popple/ui/widgets/sub_txt_widget.dart';

import '../../../Constant/color_const.dart';
import '../../../generated/assets.dart';

class GroupWidget extends StatelessWidget {
  GroupWidget();

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(20))),
      color: Colors.white,
      elevation: 0.5,
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
                HeaderTxtWidget('Just the Girls 🥰🥰',fontSize: 17,fontWeight: FontWeight.w500,),
                const SizedBox(height: 5,),
                SubTxtWidget('Is attending Popple Launch Party on ',fontSize: 12,fontWeight: FontWeight.w500,),
                Row(
                  children: [
                    Expanded(child:  ButtonPrimaryWidget('INFO',
                      trailing: SvgPicture.asset(Assets.svgSuffixNext,width: 20,height: 20,),
                      padding: 5,
                      height: 40,
                      onTap: (){
                        Get.toNamed("/group_details",arguments: {
                          "myGroup":true
                        });
                      },),
                    ),
                    Expanded(child:  ButtonPrimaryWidget('CHAT',
                      color: Colors.white,
                      txtColor: color_615BC9,
                      fontSize: 16,
                      height: 40,
                      padding: 5,
                      fontWeight: FontWeight.w600,
                      borderColor: color_615BC9,
                      trailing: SvgPicture.asset(Assets.svgSuffixNext,width: 20,height: 20,),
                      onTap: () {
                        Get.toNamed("/chat");
                      },
                    ),
                    )
                  ],
                ),
              ],
            ))
          ],
        ),
      ),
    );
  }
}

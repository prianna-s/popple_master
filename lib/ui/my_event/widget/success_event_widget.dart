import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:popple/ext/hex_color.dart';
import 'package:popple/ui/widgets/button_primary_widget.dart';
import 'package:popple/ui/widgets/header_txt_widget.dart';
import 'package:popple/ui/widgets/sub_txt_widget.dart';

import '../../../Constant/color_const.dart';
import '../../../Models/event_response.dart';
import '../../../generated/assets.dart';
import '../../../generated/l10n.dart';
import '../../dashboard/dashboard_controller.dart';

class SuccessEventWidget extends StatelessWidget {
  SuccessEventWidget();

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: AlignmentDirectional.center,
      child: Material(
        color: Colors.transparent,
        child: Wrap(
          alignment:WrapAlignment.center,
          children: [
            Container(
              alignment: AlignmentDirectional.center,
              margin: const EdgeInsets.all(20),
              padding: EdgeInsets.all(20),
              decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                  color: Colors.white
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset(Assets.imgSuccess),
                  const SizedBox(height: 10,),
                  HeaderTxtWidget('Congratulations! Group created',
                    color: color_615BC9,fontSize: 24,fontWeight: FontWeight.w800,
                    textAlign: TextAlign.center,),
                  const SizedBox(height: 10,),
                  ButtonPrimaryWidget('VIEW IN GROUPS',
                    trailing: SvgPicture.asset(Assets.svgSuffixNext),onTap: (){
                    Get.back();
                    Get.put(DashboardController()).currentIndex.value=2;
                      Get.offAndToNamed('/dashboard');
                    },),
                  const SizedBox(height: 10,),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

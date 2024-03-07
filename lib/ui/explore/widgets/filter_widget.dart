import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:popple/Models/interest_response.dart';
import 'package:popple/ext/hex_color.dart';
import 'package:popple/ui/explore/explore_controller.dart';
import 'package:popple/ui/widgets/header_txt_widget.dart';
import 'package:popple/ui/widgets/network_image_widget.dart';
import 'package:popple/ui/widgets/sub_txt_widget.dart';

import '../../../Constant/color_const.dart';
import '../../../generated/assets.dart';
import '../../../generated/l10n.dart';
import '../../widgets/button_primary_widget.dart';

class FilterWidget extends StatelessWidget {
  const FilterWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final con = Get.put(ExploreController());
    return StatefulBuilder(
      builder: (context, setState) {
        return Container(
          height: MediaQuery.of(context).size.height*0.8,
          padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Container(
                  width: 50,
                  height: 5,
                  decoration: const BoxDecoration(
                    color: color_E4DFDF,
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                  ),
                ),
              ),
              const SizedBox(height: 10,),
              Expanded(child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  HeaderTxtWidget(S.of(context).filter,fontSize: 25,fontWeight: FontWeight.w600,),
                  const SizedBox(height: 10,),
                  Container(
                    margin: const EdgeInsets.symmetric(vertical: 10),
                    height: 70,
                    child: ListView.builder(
                      itemBuilder: (context, index) {
                        Interest data=con.interestList[index];
                        return Column(
                          children: [
                            Container(
                              height: 50,
                              width: 50,
                              margin: const EdgeInsets.symmetric(horizontal: 8),
                              padding: const EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  border: Border.all(color: data.selected!?primaryColorCode:data.colorCode!.toColor(),width: 2),
                                  color:data.colorCode!.toColor()),
                              child:NetworkImageWidget(url: data.image!,onTap: () {
                                if(data.selected!){
                                  setState((){
                                    data.selected=false;
                                  });
                                }else{
                                for (var element in con.interestList) {
                                  element.selected=false;}
                                setState((){
                                  data.selected=true;
                                });
                              }},),
                            ),
                            SubTxtWidget(
                              data.name!,
                              fontWeight: FontWeight.w600,
                              fontSize: 14,
                            )
                          ],
                        );
                      },
                      itemCount: con.interestList.length,
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                    ),
                  ),
                  const SizedBox(height: 10,),
                  SubTxtWidget('Time & Date'),
                  const SizedBox(
                    height: 10,
                  ),
                  Wrap(
                    children: [
                      InkWell(
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                              vertical: 10, horizontal: 10),
                          margin: const EdgeInsets.symmetric(
                              vertical: 5, horizontal: 5),
                          decoration: BoxDecoration(
                              color: con.filterDay=="Today"?primaryColorCode:Colors.white,
                              borderRadius: const BorderRadius.all(Radius.circular(10)),
                              border: Border.all(color: con.filterDay=="Today"?primaryColorCode:color_E6E6E6, width: 1)),
                          child: SubTxtWidget('Today',color: con.filterDay=="Today"?Colors.white:textColor_12od26,),
                        ),
                        onTap: (){
                          setState((){
                            con.filterDay="Today";
                          });
                        },
                      ),
                      InkWell(
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                              vertical: 10, horizontal: 10),
                          margin: const EdgeInsets.symmetric(
                              vertical: 5, horizontal: 5),
                          decoration: BoxDecoration(
                              color: con.filterDay=="Tomorrow"?primaryColorCode:Colors.white,
                              borderRadius: const BorderRadius.all(Radius.circular(10)),
                              border: Border.all(color: con.filterDay=="Tomorrow"?primaryColorCode:color_E6E6E6, width: 1)),
                          child: SubTxtWidget('Tomorrow',color: con.filterDay=="Tomorrow"?Colors.white:textColor_12od26,),
                        ),
                        onTap: (){
                          setState((){
                            con.filterDay="Tomorrow";
                          });
                        },
                      ),
                      InkWell(
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                              vertical: 10, horizontal: 10),
                          margin: const EdgeInsets.symmetric(
                              vertical: 5, horizontal: 5),
                          decoration: BoxDecoration(
                              color: con.filterDay=="This week"?primaryColorCode:Colors.white,
                              borderRadius: const BorderRadius.all(Radius.circular(10)),
                              border: Border.all(color: con.filterDay=="This week"?primaryColorCode:color_E6E6E6, width: 1)),
                          child: SubTxtWidget('This week',color: con.filterDay=="This week"?Colors.white:textColor_12od26,),
                        ),
                        onTap: (){
                          setState((){
                            con.filterDay="This week";
                          });
                        },
                      ),
                    ],
                  ),
                  Container(
                    width: 250,
                    padding: const EdgeInsets.symmetric(vertical: 6),
                    margin: const EdgeInsets.symmetric(vertical: 10),
                    decoration: BoxDecoration(
                        color: con.filterDay=="calender"?primaryColorCode:Colors.white,
                        borderRadius: const BorderRadius.all(Radius.circular(10)),
                        border: Border.all(color: con.filterDay=="calender"?primaryColorCode:color_E6E6E6, width: 1)),
                    child: InkWell(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SvgPicture.asset(Assets.svgCalender),
                          const SizedBox(
                            width: 10,
                          ),
                          SubTxtWidget('Choose from calender',color: con.filterDay=="calender"?Colors.white:textColor_12od26,),
                          const SizedBox(
                            width: 10,
                          ),
                          const Icon(
                            Icons.arrow_forward_ios,
                            size: 12,
                          )
                        ],
                      ),
                      onTap: (){
                        setState((){
                          con.filterDay="calender";
                        });
                      },
                    ),
                  ),

                ],
              )),
              Row(
                children: [
                  Expanded(flex: 1,child: ButtonPrimaryWidget('RESET',borderColor: color_E4DFDF,
                    color: Colors.white,txtColor: textColor_12od26,
                    padding:5,
                    height: 45,
                  ),),
                  Expanded(flex: 1,child: ButtonPrimaryWidget('Apply',
                    padding:5,
                    height: 45,
                  ),),
                ],
              ),
              const SizedBox(height: 10,),
            ],
          ),
        );
      },
    );
  }
}

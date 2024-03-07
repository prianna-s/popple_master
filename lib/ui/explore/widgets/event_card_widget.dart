import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:popple/ext/date_convert.dart';
import 'package:popple/ui/widgets/header_txt_widget.dart';
import 'package:popple/ui/widgets/network_image_widget.dart';
import 'package:popple/ui/widgets/sub_txt_widget.dart';

import '../../../Constant/color_const.dart';
import '../../../Models/event_response.dart';
import '../../../generated/assets.dart';
import '../../../generated/l10n.dart';
import '../explore_controller.dart';

class EventCardWidget extends StatelessWidget {
  EventData data;
  EventCardWidget(this.data);
  final _con = Get.put(ExploreController());

  @override
  Widget build(BuildContext context) {
    return StatefulBuilder(builder: (context, setState) {
      return Card(
        shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(20))),
        color: Colors.white,
        elevation: 0.5,
        child: InkWell(
          child: Padding(
            padding: const EdgeInsets.all(5),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Stack(
                  children: [
                   ClipRRect(
                     borderRadius: const BorderRadius.only(topRight: Radius.circular(10),topLeft: Radius.circular(10)),
                     child: NetworkImageWidget(url:data.postImages!.isEmpty?"":data.postImages!.first.image.toString(),
                       fit: BoxFit.contain,),
                   ),
                    Positioned(top:5,left:5,child: Container(
                      decoration: const BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                          color: Colors.white
                      ),
                      padding: EdgeInsets.all(5),
                      child: SubTxtWidget(data.date!.toSplitDate(),textAlign: TextAlign.center,color: color_EE4266,),
                    )),
                    Positioned(top:5,right:5,child: InkWell(
                      child: Container(
                        decoration: const BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                            color: Colors.white70
                        ),
                        padding: const EdgeInsets.all(5),
                          child:data.post_saved!="No"?Icon(Icons.bookmark,color: primaryColorCode,):SvgPicture.asset(Assets.svgSaved)
                      ),
                      onTap: (){
                        setState((){
                          data.post_saved=data.post_saved=="No"?"Yes":"No";
                        });
                        _con.saveEvent(data);
                      },
                    )),
                  ],
                ),
                Padding(padding: const EdgeInsets.all(10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      HeaderTxtWidget('${data.title}'),
                      const SizedBox(height: 5,),
                      Wrap(
                        children: [
                          SvgPicture.asset(Assets.svgLocation,width: 18,height: 18,),
                          const SizedBox(width: 5,),
                          SubTxtWidget('${data.address}',fontSize: 12,)
                        ],
                      ),
                      const SizedBox(height: 5,),
                      SubTxtWidget('${data.description}',fontSize: 12,),
                      const SizedBox(height: 5,),
                      Wrap(
                        children: [
                          SvgPicture.asset(Assets.svgProfile,width: 18,height: 18,),
                          const SizedBox(width: 5,),
                          SubTxtWidget(S.of(context).countGroupsInterested(data.no_of_group!),fontSize: 12,)
                        ],
                      ),
                    ],
                  ),)
              ],
            ),
          ),
          onTap: (){
            Get.toNamed("/event_details",arguments: data);
          },
        ),
      );
    },);
  }
}

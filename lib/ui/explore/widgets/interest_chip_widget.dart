import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:popple/Models/interest_response.dart';
import 'package:popple/ext/hex_color.dart';
import 'package:popple/ui/widgets/sub_txt_widget.dart';
import 'package:shimmer/shimmer.dart';
import '../../../Constant/color_const.dart';
import '../../dashboard/dashboard_controller.dart';
import '../../widgets/network_image_widget.dart';

class InterestChipWidget extends StatelessWidget {
  Function(Interest val)? onSelect;
  InterestChipWidget({this.onSelect});
  final _con = Get.put(DashboardController());

  @override
  Widget build(BuildContext context) {
    return Obx(() => _body());
  }
  Widget _body(){
    if(_con.interestList.isEmpty){
      return Container(
        margin: const EdgeInsets.symmetric(vertical: 10),
        height: 50,
        child: ListView.builder(
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 3),
              child: Shimmer.fromColors(
            baseColor: primaryColorCode.withOpacity(0.5),
            highlightColor: Colors.white,
                child: Container(
                  width: 120,
                  height: 40,
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(30)),
                    color: Colors.grey
                  ),
                ),
              ),
            );
          },
          itemCount: 5,
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
        ),
      );
    }
    return StatefulBuilder(builder: (context, setState) {
      return Container(
        margin: const EdgeInsets.symmetric(vertical: 10),
        height: 50,
        child: ListView.builder(
          itemBuilder: (context, index) {
            Interest data=_con.interestList[index];
            return Padding(
              padding: EdgeInsets.symmetric(horizontal: 3),
              child: ActionChip(
                label: SubTxtWidget(
                  data.name!,
                  color: Colors.white,
                  italic: true,
                  fontWeight: FontWeight.w200,
                ),
                avatar:onSelect!=null&&data.selected!?Icon(Icons.check_circle,color:Colors.white,size: 25,):NetworkImageWidget(url: data.image!,height: 30,width: 30,),
                backgroundColor: data.colorCode!.toColor(),
                shape: const StadiumBorder(
                    side: BorderSide(color: Colors.transparent)),
                elevation: 5,
                onPressed: () {
                  if(onSelect!=null){
                    _con.interestList.forEach((element) {element.selected=false;});
                    data.selected=true;
                    onSelect!.call(data);
                    setState((){});
                  }
                },
              ),
            );
          },
          itemCount: _con.interestList.length,
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
        ),
      );
    },);
  }
}

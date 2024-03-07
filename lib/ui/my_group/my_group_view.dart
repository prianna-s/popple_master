import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:popple/ext/hex_color.dart';
import 'package:popple/ui/widgets/sub_txt_widget.dart';

import '../../generated/assets.dart';
import '../widgets/app_bar_widget.dart';
import '../widgets/header_txt_widget.dart';
import 'my_group_controller.dart';

class MyGroupPage extends StatelessWidget {
  const MyGroupPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(MyGroupController());
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBarWidget(
        title: HeaderTxtWidget("My Groups",fontSize: 34,color: Colors.white,),
        bottom: SearchBar(
          backgroundColor:  MaterialStatePropertyAll("#615BC9".toColor()),
          elevation: const MaterialStatePropertyAll(0),
          hintText: "Search...",
          hintStyle: const MaterialStatePropertyAll(TextStyle(
              color: Colors.white,
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
            Center(
              child: SubTxtWidget("No Data Found"),
            )
            /*ListView.builder(itemBuilder: (context, index) {
              return GroupWidget();
            },itemCount: 5,primary: false,shrinkWrap: true,),
          */],
        ),
      ),
    );
  }
}

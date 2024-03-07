import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:popple/ext/hex_color.dart';
import 'package:popple/ui/widgets/sub_txt_widget.dart';
import '../../Constant/color_const.dart';
import '../../generated/assets.dart';
import '../widgets/button_primary_widget.dart';
import '../widgets/header_txt_widget.dart';
import 'my_group_controller.dart';

class GroupDetailsPage extends StatelessWidget {
  GroupDetailsPage({Key? key}) : super(key: key);
  final _con = Get.put(MyGroupController());
  @override
  Widget build(BuildContext context) {

    return Scaffold(
        key: _con.scaffoldKey,
        backgroundColor: Colors.white,
        body: CustomScrollView(slivers: [
          SliverAppBar(
            pinned: true,
            floating: true,
            snap: true,
            expandedHeight: 235,
            elevation: 1,
            leadingWidth: 50,
            title: HeaderTxtWidget('Details',color: Colors.white,fontSize: 24,),
            iconTheme: IconThemeData(
              color: Colors.white
            ),
            flexibleSpace: FlexibleSpaceBar(
              collapseMode: CollapseMode.parallax,
              expandedTitleScale: 1,
              background: Container(
                alignment: AlignmentDirectional.center,
                decoration: BoxDecoration(
                  color: "#F6CCD7".toColor(),
                  borderRadius: const BorderRadius.only(bottomRight: Radius.circular(30),bottomLeft: Radius.circular(30))
                ),
                child: Image.asset(Assets.dummyImg4,width: 100,fit: BoxFit.fill,),
              ),
            ),
          ),
          if(Get.arguments['myGroup'])
          SliverToBoxAdapter(
            child: Obx(() =>Container(
              margin: const EdgeInsets.symmetric(horizontal: 100,vertical: 10),
              padding: const EdgeInsets.all(4),
              decoration: const BoxDecoration(
                  color: Colors.black12,
                  borderRadius: BorderRadius.all(Radius.circular(30))
              ),
              child: Row(
                children: [
                  Expanded(flex: 1,child: InkWell(
                    splashColor: Colors.transparent,
                    onTap: (){
                      _con.type.value="group";
                    },
                    child: Container(
                      padding: const EdgeInsets.symmetric(vertical: 5,horizontal: 5),
                      margin: const EdgeInsets.symmetric(horizontal: 5),
                      alignment: AlignmentDirectional.center,
                      decoration:  BoxDecoration(
                          color: _con.type.value=="group"?Colors.white:Colors.transparent,
                          borderRadius: const BorderRadius.all(Radius.circular(30))
                      ),
                      child: HeaderTxtWidget('GROUP',color: _con.type.value=="group"?"#5669FF".toColor():"#9B9B9B".toColor(),
                        fontWeight: FontWeight.w700,
                      fontSize: 15,),
                    ),
                  ),),
                  Expanded(flex: 1,child: InkWell(
                    splashColor: Colors.transparent,
                    onTap: (){
                      _con.type.value="event";
                    },
                    child: Container(
                      padding: const EdgeInsets.all(5),
                      margin: const EdgeInsets.symmetric(horizontal: 5),
                      alignment: AlignmentDirectional.center,
                      decoration:  BoxDecoration(
                          color: _con.type.value=="event"?Colors.white:Colors.transparent,
                          borderRadius: BorderRadius.all(Radius.circular(30))
                      ),
                      child: HeaderTxtWidget('EVENT',color: _con.type.value=="event"?"#5669FF".toColor():"#9B9B9B".toColor(),
                      fontWeight: FontWeight.w700,),
                    ),
                  ),),
                ],
              ),
            )),
          ),
          SliverList(
              delegate: SliverChildListDelegate.fixed([
                Obx(() => Visibility(visible: _con.type.value=="group",child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 10),
                  child:  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      HeaderTxtWidget('Just the Girls 🥰🥰',fontSize: 30,
                        fontWeight: FontWeight.w700,),
                      Row(
                        children: [
                          Container(
                            margin: EdgeInsets.only(right: 10),
                            decoration: BoxDecoration(
                                color: "#5669FF".toColor().withOpacity(0.1),
                                borderRadius: BorderRadius.all(Radius.circular(10))
                            ),
                            padding: EdgeInsets.all(8),
                            child: SvgPicture.asset(Assets.svgUser,height: 22,width: 22,),
                          ),
                          SubTxtWidget('3 to 6 Members'),
                        ],
                      ),
                      const SizedBox(height: 10,),
                      HeaderTxtWidget('About Us',fontSize: 18,fontWeight: FontWeight.w800),
                      const SizedBox(height: 10,),
                      SubTxtWidget('A couple cool girls looking for new friends!!! Would love to get ready for the party together  ',fontSize: 16,),
                      const SizedBox(height: 10,),
                      HeaderTxtWidget('Interests',fontSize: 18,fontWeight: FontWeight.w800,),
                      Wrap(children: [
                        Padding(padding: EdgeInsets.symmetric(horizontal: 3),
                          child: ActionChip(label: SubTxtWidget("Concerts",color: Colors.white,
                            italic: true,fontWeight: FontWeight.w200,fontSize: 13,),
                            backgroundColor: '#EEB868'.toColor(),
                            shape: const StadiumBorder(side: BorderSide(color: Colors.transparent)),
                            elevation: 5,
                            onPressed: (){

                            },),),
                        Padding(padding: EdgeInsets.symmetric(horizontal: 3),
                          child: ActionChip(label: SubTxtWidget("R&B",color: Colors.white,
                            italic: true,fontWeight: FontWeight.w200,fontSize: 13,),
                            backgroundColor: '#EF767A'.toColor(),
                            shape: const StadiumBorder(side: BorderSide(color: Colors.transparent)),
                            elevation: 5,
                            onPressed: (){

                            },),),
                        Padding(padding: EdgeInsets.symmetric(horizontal: 3),
                          child: ActionChip(label: SubTxtWidget("Fashion",color: Colors.white,
                            italic: true,fontWeight: FontWeight.w200,fontSize: 13,),
                            backgroundColor: '#DC42BF'.toColor(),
                            shape: const StadiumBorder(side: BorderSide(color: Colors.transparent)),
                            elevation: 5,
                            onPressed: (){

                            },),),
                        Padding(padding: EdgeInsets.symmetric(horizontal: 3),
                          child: ActionChip(label: SubTxtWidget("Art",color: Colors.white,
                            italic: true,fontWeight: FontWeight.w200,fontSize: 13,),
                            backgroundColor: '#8D85F0'.toColor(),
                            shape: const StadiumBorder(side: BorderSide(color: Colors.transparent)),
                            elevation: 5,
                            onPressed: (){

                            },),),
                        Padding(padding: EdgeInsets.symmetric(horizontal: 3),
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
                      const SizedBox(height: 10,),
                      HeaderTxtWidget('Members',fontSize: 18,fontWeight: FontWeight.w800,),
                      const SizedBox(height: 10,),
                      Row(
                        children: [
                          Image.asset(Assets.dummyImg5,height: 55,width: 55,),
                          const SizedBox(width: 5,),
                          Image.asset(Assets.dummyImg6,height: 55,width: 55,),
                          const SizedBox(width: 5,),
                          Image.asset(Assets.dummyImg7,height: 55,width: 55,),
                        ],
                      ),
                      const SizedBox(height: 10,),
                      if(Get.arguments['myGroup'])...{
                        ButtonPrimaryWidget('LEAVE GROUP',
                          color: Colors.white,
                          txtColor: "#EF767A".toColor(),
                          fontSize: 16,
                          marginHorizontal: 30,
                          marginVertical: 20,
                          fontWeight: FontWeight.w600,
                          borderColor: "#EF767A".toColor(),
                          trailing: SvgPicture.asset(Assets.svgNextRed),),
                      }else
                      ButtonPrimaryWidget('JOIN GROUP',
                        fontSize: 16,
                        marginHorizontal: 30,
                        marginVertical: 20,
                        fontWeight: FontWeight.w600,
                        trailing: SvgPicture.asset(Assets.svgSuffixNext),
                        onTap: (){
                          success(context);
                        },
                      ),
                      const SizedBox(height: 100,),
                    ],
                  ),
                ),),),
                Obx(() => Visibility(visible: _con.type.value=="event",child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child:  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      HeaderTxtWidget('Just the Girls 🥰🥰',fontSize: 30,
                        fontWeight: FontWeight.w700,),
                      ListTile(
                        contentPadding: EdgeInsets.zero,
                        leading: Container(
                          decoration: BoxDecoration(
                              color: "#5669FF".toColor().withOpacity(0.1),
                              borderRadius: BorderRadius.all(Radius.circular(10))
                          ),
                          padding: EdgeInsets.all(8),
                          child: SvgPicture.asset(Assets.svgCalender,height: 32,width: 32,),
                        ),
                        title: SubTxtWidget('13 April, 2023',color: "#120D26".toColor(),
                          fontSize: 16,fontWeight: FontWeight.w500,),
                        subtitle: SubTxtWidget('Tuesday, 4:00PM - 9:00PM',fontSize: 12,fontWeight: FontWeight.w400,),
                      ),
                      ListTile(
                        contentPadding: EdgeInsets.zero,
                        leading: Container(
                          decoration: BoxDecoration(
                              color: "#5669FF".toColor().withOpacity(0.1),
                              borderRadius: BorderRadius.all(Radius.circular(10))
                          ),
                          padding: EdgeInsets.all(8),
                          child: SvgPicture.asset(Assets.svgAddress,height: 32,width: 32,),
                        ),
                        title: SubTxtWidget('Wonderland House',color: "#120D26".toColor(),
                          fontSize: 16,fontWeight: FontWeight.w500,),
                        subtitle: SubTxtWidget('36 Guild Street Boston, MA ',fontSize: 12,fontWeight: FontWeight.w400,),
                      ),
                      ListTile(
                        contentPadding: EdgeInsets.zero,
                        leading: Container(
                          decoration: BoxDecoration(
                              color: "#5669FF".toColor().withOpacity(0.1),
                              borderRadius: BorderRadius.all(Radius.circular(10))
                          ),
                          child: Image.asset(Assets.dummyImg8,height: 46,width: 46,),
                        ),
                        title: SubTxtWidget('Popple Event Group',color: "#120D26".toColor(),
                          fontSize: 16,fontWeight: FontWeight.w500,),
                        subtitle: SubTxtWidget('Organizer',fontSize: 12,fontWeight: FontWeight.w400,),
                      ),
                      const SizedBox(height: 10,),
                      HeaderTxtWidget('About Event',fontSize: 18,fontWeight: FontWeight.w800),
                      const SizedBox(height: 10,),
                      SubTxtWidget('Come celebrate friends, fun, and getting off your phone at the Popple Launch Party (hosted with Wonderland Allston). Come see local stars Zaya Marz and Yael Hayem play! Read More...',fontSize: 16,),
                      const SizedBox(height: 100,),

                    ],
                  ),
                ),),),
              ]))
        ]));
  }
  void success(context){
    showDialog(context: context, builder: (context) {
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
                    HeaderTxtWidget('Yay! Group joined!',
                      color: color_615BC9,fontSize: 24,fontWeight: FontWeight.w800,
                      textAlign: TextAlign.center,),
                    const SizedBox(height: 10,),
                    ButtonPrimaryWidget('VIEW IN GROUPS',
                      trailing: SvgPicture.asset(Assets.svgSuffixNext),onTap: (){
                      Get.back();
                        Get.toNamed('2',id: 1);
                      },),
                    const SizedBox(height: 10,),
                  ],
                ),
              )
            ],
          ),
        ),
      );
    },);
  }
}

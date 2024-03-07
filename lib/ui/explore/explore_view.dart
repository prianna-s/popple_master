
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:popple/Constant/color_const.dart';
import 'package:popple/ext/hex_color.dart';
import 'package:popple/generated/assets.dart';
import 'package:popple/ui/explore/widgets/event_card_widget.dart';
import 'package:popple/ui/explore/widgets/event_list_widget.dart';
import 'package:popple/ui/explore/widgets/filter_widget.dart';
import 'package:popple/ui/explore/widgets/interest_chip_widget.dart';
import 'package:popple/ui/widgets/header_txt_widget.dart';
import 'package:popple/ui/widgets/loading_widget.dart';
import 'package:popple/ui/widgets/sub_txt_widget.dart';
import 'explore_controller.dart';
class ExplorePage extends StatefulWidget {
  const ExplorePage({super.key});

  @override
  State<ExplorePage> createState() => _pageState();
}
class _pageState extends State<ExplorePage> {
  final _con = Get.put(ExploreController());
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body:Column(
        children: [
          _header(context),
          Expanded(child: SingleChildScrollView(
            child: Obx(() => Column(
              children: [
                _featureEvents(),
                _upcomingEvents(),
              ],
            )),
          ))
        ],
      )
    );
  }

  Widget _header(context) {
    return SizedBox(
      height: 250,
      child: Stack(
        fit: StackFit.loose,
        children: [
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            bottom: 35,
            child: Container(
              decoration: BoxDecoration(
                  color: '#615BC9'.toColor(),
                  borderRadius: const BorderRadius.only(
                      bottomRight: Radius.circular(30),
                      bottomLeft: Radius.circular(30))),
            ),
          ),
          Positioned(
            top: 50,
            left: 0,
            right: 0,
            bottom: 0,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                  child: HeaderTxtWidget(
                    ' popple 🎸🤟🎉',
                    color: Colors.white,
                    fontWeight: FontWeight.w800,
                    fontSize: 34,
                    fontFamily: "Chillax",
                  ),
                ),
                _searchWidget(context),
                InterestChipWidget(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _featureEvents() {
    if(_con.eventResponse.value==null){
      return LoadingWidget();
    }
    if(_con.feturedEvent.isEmpty){
      return const SizedBox();
    }
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 20,),
        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 15,
          ),
          child: HeaderTxtWidget(
            'featured events',
            fontWeight: FontWeight.w500,
            fontSize: 18,
            fontFamily: "Chillax",
          ),
        ),
        Container(
          height: 270,
          margin: const EdgeInsets.only(top: 10),
          child: ListView.builder(
            itemBuilder: (context, index) {
              return EventCardWidget(_con.feturedEvent[index]);
            },
            itemCount: _con.feturedEvent.length,
            scrollDirection: Axis.horizontal,
            shrinkWrap: true,
          ),
        )
      ],
    );
  }
  Widget _featureGroup() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 15,
          ),
          child: HeaderTxtWidget(
            'featured groups',
            fontWeight: FontWeight.w500,
            fontSize: 18,
            fontFamily: "Chillax",
          ),
        ),
        Container(
          margin: const EdgeInsets.only(top: 10),
          child: ListView.builder(
            itemBuilder: (context, index) {
              return _groupTile();
            },
            itemCount: 2,
            shrinkWrap: true,
            primary: false,
            padding: EdgeInsets.zero,
          ),
        )
      ],
    );
  }
  Widget _suggestedgroups() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 20,),
        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 15,
          ),
          child: Row(
            children: [
              Expanded(child: HeaderTxtWidget(
                'suggested groups',
                fontWeight: FontWeight.w500,
                fontSize: 18,
                fontFamily: "Chillax",
              )),
              SubTxtWidget('happening tonight'),
              const Icon(Icons.arrow_right)
            ],
          ),
        ),
        Container(
          margin: const EdgeInsets.only(top: 10),
          child: ListView.builder(
            itemBuilder: (context, index) {
              return _groupTile();
            },
            itemCount: 2,
            shrinkWrap: true,
            primary: false,
            padding: EdgeInsets.zero,
          ),
        )
      ],
    );
  }

  Widget _upcomingEvents() {
    if(_con.eventResponse.value==null){
      return LoadingWidget();
    }
    if(_con.eventResponse.value!.result!.isEmpty){
      return SubTxtWidget(_con.eventResponse.value!.message!);
    }
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
          child: HeaderTxtWidget(
            'Upcoming events',
            fontWeight: FontWeight.w500,
            fontSize: 18,
            fontFamily: "Chillax",
          ),
        ),
        ListView.builder(
          itemBuilder: (context, index) {
            return EventListWidget(_con.eventResponse.value!.result![index]);
          },
          itemCount: _con.eventResponse.value!.result!.length,
          shrinkWrap: true,
          primary: false,
          padding: EdgeInsets.zero,
        )
      ],
    );
  }

  void showFilter(context) {
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(30.0)),
      ),
      backgroundColor: Colors.white,
      isScrollControlled: true,
      builder: (context) {
        return const FilterWidget();
      },
    );
  }
  Widget _groupTile(){
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10),
      child: Card(
        shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(20))),
        color: Colors.white,
        elevation: 0.5,
        child: InkWell(
          child: Padding(
            padding: const EdgeInsets.all(5),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Expanded(child: SubTxtWidget('Just the Girls',fontWeight: FontWeight.w500,fontSize: 16,),),
                    SvgPicture.asset(Assets.svgFlame,width: 15,height: 15,),
                    SubTxtWidget('HOT: 4 Mutuals',color: primaryColorCode,italic: true,fontWeight: FontWeight.w300,fontSize: 12,),
                  ],
                ),
                const SizedBox(height: 5,),
                Row(
                  children: [
                    SubTxtWidget('is going to',fontSize: 10,fontWeight: FontWeight.w500,italic: true,),
                    Container(
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.grey.shade300
                      ),
                      padding: const EdgeInsets.all(2),
                      margin: const EdgeInsets.symmetric(horizontal: 5),
                      child: Image.asset(Assets.imgFlam,width: 10,),
                    ),
                    SubTxtWidget('Popple Launch Party',fontSize: 10,fontWeight: FontWeight.w500,italic: true,),
                  ],

                ),
                const SizedBox(height: 5,),
                SubTxtWidget('A couple cool girls looking for new friends!!! Would love to get ready together  ',fontWeight: FontWeight.w500,fontSize: 16,),
                const SizedBox(height: 10,),
                Row(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                          borderRadius: const BorderRadius.all(Radius.circular(20)),
                          color: "#273E47".toColor()
                      ),
                      padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 5),
                      margin: const EdgeInsets.symmetric(horizontal: 3),
                      child: SubTxtWidget('Concerts',color: Colors.white,fontWeight: FontWeight.w500,fontSize: 12,),
                    ),
                    Container(
                      decoration: BoxDecoration(
                          borderRadius: const BorderRadius.all(Radius.circular(20)),
                          color: "#46CDFB".toColor()
                      ),
                      padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 5),
                      margin: const EdgeInsets.symmetric(horizontal: 3),
                      child: SubTxtWidget('Art',color: Colors.white,fontWeight: FontWeight.w500,fontSize: 12,),
                    ),
                    Container(
                      decoration: BoxDecoration(
                          borderRadius: const BorderRadius.all(Radius.circular(20)),
                          color: "#EF767A".toColor()
                      ),
                      padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 5),
                      margin: const EdgeInsets.symmetric(horizontal: 3),
                      child: SubTxtWidget('Fashion',color: Colors.white,fontWeight: FontWeight.w500,fontSize: 12,),
                    ),
                    Container(
                      decoration: BoxDecoration(
                          borderRadius: const BorderRadius.all(Radius.circular(20)),
                          color: "#EEB868".toColor()
                      ),
                      padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 5),
                      margin: const EdgeInsets.symmetric(horizontal: 3),
                      child: SubTxtWidget('Love Island',color: Colors.white,fontWeight: FontWeight.w500,fontSize: 12,),
                    ),
                  ],
                ),
                const SizedBox(height: 10,),
              ],
            ),
          ),
          onTap: (){
            Get.toNamed("/event_details");
          },
        ),
      ),
    );
  }
  Widget _searchWidget(context){
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: SearchBar(
          backgroundColor:
          MaterialStatePropertyAll("#615BC9".toColor()),
          elevation: const MaterialStatePropertyAll(0),
          hintText: "Search...",
          hintStyle: const MaterialStatePropertyAll(TextStyle(
              color: Colors.white,
              fontStyle: FontStyle.italic,
              fontSize: 20,
              fontWeight: FontWeight.w200)),
          leading: SvgPicture.asset(Assets.svgSearch),
          trailing: [
            Container(
              decoration: const BoxDecoration(
                  color: Colors.black26,
                  borderRadius:
                  BorderRadius.all(Radius.circular(20))),
              padding: const EdgeInsets.only(
                  left: 5, right: 10, top: 5, bottom: 5),
              child: InkWell(
                child: Row(
                  children: [
                    SvgPicture.asset(Assets.svgFilterCircle),
                    const SizedBox(
                      width: 5,
                    ),
                    SubTxtWidget(
                      "Filters",
                      color: Colors.white,
                      fontSize: 12,
                      fontWeight: FontWeight.w200,
                      italic: true,
                    )
                  ],
                ),
                onTap: () {
                  showFilter(context);
                },
              ),
            )
          ]),
    );
  }

}

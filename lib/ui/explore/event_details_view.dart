
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:popple/ext/hex_color.dart';
import 'package:popple/ui/my_event/my_event_controller.dart';
import 'package:popple/ui/widgets/sub_txt_widget.dart';
import '../../Constant/color_const.dart';
import '../../Utils/tools.dart';
import '../../generated/assets.dart';
import '../widgets/button_primary_widget.dart';
import '../widgets/header_txt_widget.dart';
import '../widgets/network_image_widget.dart';
class EventDetailsPage extends StatefulWidget {
  const EventDetailsPage({super.key});

  @override
  State<EventDetailsPage> createState() => _pageState();
}
class _pageState extends State<EventDetailsPage> {
  final _con = Get.put(MyEventController());
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _con.data.value=Get.arguments;
    _con.addMarker();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        persistentFooterButtons: [
           SizedBox(
            width: MediaQuery.of(context).size.width,
            child: Row(
              children: [
                Expanded(flex: 1,child: ButtonPrimaryWidget('JOIN\nGROUP',
                  fontSize: 16,
                  height: 70,
                  trailing: SvgPicture.asset(Assets.svgSuffixNext),onTap: (){
                    Get.toNamed('/groups');
                  },),),
                Expanded(flex: 1,child: ButtonPrimaryWidget('ADD\nGROUP',
                  fontSize: 16,
                  height: 70,
                  trailing: SvgPicture.asset(Assets.svgSuffixNext),onTap: (){
                    Get.toNamed('/create_event');

                  },),),
              ],
            ),
          ),
        ],
        body: CustomScrollView(slivers: [
          SliverAppBar(
            pinned: true,
            floating: false,
            snap: false,
            expandedHeight: 235,
            elevation: 1,
            leadingWidth: 50,
            title: HeaderTxtWidget('Event Details',color: Colors.white,fontSize: 24,),
            iconTheme: const IconThemeData(
              color: Colors.white
            ),
            actions: [
              Container(
                margin: const EdgeInsets.only(right: 20),
                decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    color: Colors.white70
                ),
                padding: const EdgeInsets.all(5),
                child:_con.data.value!.post_saved=="No"?SvgPicture.asset(Assets.svgSaved):const Icon(Icons.bookmark,color: primaryColorCode,),
              )
            ],
            flexibleSpace: FlexibleSpaceBar(
              collapseMode: CollapseMode.parallax,
              expandedTitleScale: 1,
              background: Container(
                alignment: AlignmentDirectional.center,
                decoration: BoxDecoration(
                  color: "#F6CCD7".toColor(),
                  borderRadius: const BorderRadius.only(bottomRight: Radius.circular(30),bottomLeft: Radius.circular(30))
                ),
                child:Obx(() => ClipRRect(
                  borderRadius: const BorderRadius.only(bottomRight: Radius.circular(30),bottomLeft: Radius.circular(30)),
                  child: NetworkImageWidget(url:_con.data.value==null?"":_con.data.value!.postImages!.isEmpty?"":_con.data.value!.postImages!.first.image.toString(),
                    fit: BoxFit.cover,height: 270,),
                )),
              ),
            ),
          ),
          Obx(() => _con.data.value==null?const CircularProgressIndicator():SliverList(
              delegate: SliverChildListDelegate.fixed([
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 20,),
                      HeaderTxtWidget('${_con.data.value!.title}',fontSize: 24,
                        fontWeight: FontWeight.w700,),
                      const SizedBox(height: 20,),
                      ListTile(
                        contentPadding: EdgeInsets.zero,
                        leading: Container(
                          decoration: BoxDecoration(
                              color: "#5669FF".toColor().withOpacity(0.1),
                              borderRadius: const BorderRadius.all(Radius.circular(10))
                          ),
                          padding: const EdgeInsets.all(8),
                          child: SvgPicture.asset(Assets.svgCalender,height: 32,width: 32,),
                        ),
                        title: SubTxtWidget(Tools.changeDateFormat('${_con.data.value!.date}', "dd-MMM-yyyy"),color: "#120D26".toColor(),
                          fontSize: 16,fontWeight: FontWeight.w500,),
                        subtitle: SubTxtWidget('Tuesday, 4:00PM - 9:00PM',fontSize: 12,fontWeight: FontWeight.w400,),
                      ),
                      ListTile(
                        contentPadding: EdgeInsets.zero,
                        leading: Container(
                          decoration: BoxDecoration(
                              color: "#5669FF".toColor().withOpacity(0.1),
                              borderRadius: const BorderRadius.all(Radius.circular(10))
                          ),
                          padding: const EdgeInsets.all(8),
                          child: SvgPicture.asset(Assets.svgAddress,height: 32,width: 32,),
                        ),
                        title: SubTxtWidget('Wonderland House',color: "#120D26".toColor(),
                          fontSize: 16,fontWeight: FontWeight.w500,),
                        subtitle: SubTxtWidget('${_con.data.value!.address}',fontSize: 12,fontWeight: FontWeight.w400,),
                      ),
                      const SizedBox(height: 10,),
                      Image.asset(Assets.dummyImg10,width: double.infinity,
                        fit: BoxFit.cover,),
                      const SizedBox(height: 10,),
                      HeaderTxtWidget('${_con.data.value!.description}',fontSize: 15,fontWeight: FontWeight.w800),
                      const SizedBox(height: 10,),
                      ListTile(
                        contentPadding: EdgeInsets.zero,
                        leading: Container(
                          decoration: BoxDecoration(
                              color: "#5669FF".toColor().withOpacity(0.1),
                              borderRadius: const BorderRadius.all(Radius.circular(10))
                          ),
                          child: Image.asset(Assets.dummyImg8,height: 46,width: 46,),
                        ),
                        title: SubTxtWidget('Popple Event Group',color: "#120D26".toColor(),
                          fontSize: 16,fontWeight: FontWeight.w500,),
                        subtitle: SubTxtWidget('Organizer',fontSize: 12,fontWeight: FontWeight.w400,),
                      ),
                      HeaderTxtWidget('About Event',fontSize: 18,fontWeight: FontWeight.w800),
                      const SizedBox(height: 10,),
                      SubTxtWidget('${_con.data.value!.description}',fontSize: 16,),
                      const SizedBox(height: 20,),
                      HeaderTxtWidget('Categories',fontSize: 18,fontWeight: FontWeight.w800),
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
                      const SizedBox(height: 20,),
                      HeaderTxtWidget('Location',fontSize: 18,fontWeight: FontWeight.w800),
                      const SizedBox(height: 10,),
                      Container(
                        height: 200,
                        margin: const EdgeInsets.symmetric(vertical: 20),
                        child: ClipRRect(
                          borderRadius: const BorderRadius.all(Radius.circular(10)),
                          child: GoogleMap(
                            mapType: MapType.normal,
                            initialCameraPosition: _con.kGooglePlex,
                            markers: Set<Marker>.of(_con.markers.value.values),
                            compassEnabled: false,
                            zoomControlsEnabled: false,
                            myLocationEnabled: false,
                            onMapCreated: (GoogleMapController controller) {
                              _con.map_controller.complete(controller);
                            },
                            /*gestureRecognizers: <Factory<OneSequenceGestureRecognizer>>{
                              Factory<PanGestureRecognizer>(() => PanGestureRecognizer()),
                              Factory<ScaleGestureRecognizer>(() => ScaleGestureRecognizer()),
                              Factory<TapGestureRecognizer>(() => TapGestureRecognizer()),
                              Factory<EagerGestureRecognizer>(() => EagerGestureRecognizer()),
                            },*/
                          ),
                        ),
                      ),
                      const SizedBox(height: 50,),
                    ],
                  ),
                )
              ])))
        ]));
  }

}

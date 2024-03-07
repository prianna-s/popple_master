import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:google_maps_places_autocomplete_widgets/widgets/address_autocomplete_textformfield.dart';
import 'package:popple/Constant/color_const.dart';
import 'package:popple/Utils/tools.dart';
import 'package:popple/ext/hex_color.dart';
import 'package:popple/ui/widgets/input_widget.dart';
import 'package:popple/ui/widgets/sub_txt_widget.dart';

import '../../generated/assets.dart';
import '../explore/widgets/interest_chip_widget.dart';
import '../widgets/app_bar_widget.dart';
import '../widgets/button_primary_widget.dart';
import '../widgets/header_txt_widget.dart';
import 'my_event_controller.dart';

class CreateEventPage extends StatelessWidget {
  CreateEventPage({Key? key}) : super(key: key);
  final _con = Get.put(MyEventController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBarWidget(
        title: HeaderTxtWidget("Create Event",fontSize: 34,color: Colors.white,),
        showBackButton: true,
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 10),
        child: SingleChildScrollView(
          child: Obx(() => Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              LinearProgressIndicator(
                backgroundColor: "#CCCDCF".toColor(),
                valueColor: const AlwaysStoppedAnimation<Color>(color_615BC9),
                value: !_con.showNext.value?0.3:0.8,
                minHeight: 6,
                borderRadius: const BorderRadius.all(Radius.circular(20)),
              ),
              SubTxtWidget(!_con.showNext.value?'30% completed':'80% completed',fontSize: 10,),
              const SizedBox(height: 20,),
              _con.showNext.value?_form2():_form1()
            ],
          )),
        ),
      ),
    );
  }
  Widget _form1(){
    return Form(
      key: _con.formKey,
        child: Column(
      children: [
       InputWidget(
         title: "Title",
         controller: _con.title_con,
         validator: ValidationType.TEXT,
         errorMsg: "Please enter title",
       ),
        InputWidget(
          title: "Description",
          controller: _con.description_con,
          validator: ValidationType.TEXT,
          errorMsg: "Please enter description",
        ),
        InputWidget(
          title: "Address",
          child: AddressAutocompleteTextFormField(
              mapsApiKey: 'AIzaSyAFB34eaTgqYZiFdgTw3NbhmdVclZHDwcM',
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderSide:
                  const BorderSide(width: 1, color:color_E4DFDF),
                  borderRadius: BorderRadius.circular(12.0), //<-- SEE HERE
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide:
                  const BorderSide(width: 1, color: color_E4DFDF),
                  borderRadius: BorderRadius.circular(12.0),
                ),
              ),
              validator: (p0) {
                if(p0!.isEmpty){
                  return "Please enter address";
                }
                return null;
              },
              onSuggestionClick: (place) {
                _con.address=place;
              },
              language: 'en-US'
          ),
        ),
        InputWidget(
          title: "Date",
          child: InkWell(
            child: Container(
              padding: const EdgeInsets.all(15),
              alignment: AlignmentDirectional.centerStart,
              decoration: BoxDecoration(
                  border: Border.all(color: color_E4DFDF,width: 1),
                  borderRadius: const BorderRadius.all(Radius.circular(10))
              ),
              child: SubTxtWidget(_con.date.value==null?"Select Date":Tools.changeDateFormat(_con.date.value.toString(), "dd-MM-yyyy")),
            ),
            onTap: (){
              showDatePicker(context: Get.context!, firstDate: DateTime.now(), lastDate: DateTime(2025)).then((value){
                _con.date.value=value;
              });
            },
          ),
        ),
        InputWidget(
          title: "Time",
          child: InkWell(
            child: Container(
              padding: const EdgeInsets.all(15),
              alignment: AlignmentDirectional.centerStart,
              decoration: BoxDecoration(
                  border: Border.all(color: color_E4DFDF,width: 1),
                  borderRadius: const BorderRadius.all(Radius.circular(10))
              ),
              child: SubTxtWidget(_con.time.value==null?"Select Time":"${_con.time.value!.hour}:${_con.time.value!.minute} ${_con.time.value!.period.name}"),
            ),
            onTap: (){
              showTimePicker(context: Get.context!, initialTime: const TimeOfDay(hour: 00, minute: 00)).then((value){
                _con.time.value=value;
              });
            },
          ),
        ),
        ButtonPrimaryWidget('Next',
          marginHorizontal: 30,
          marginVertical: 20,
          trailing: SvgPicture.asset(Assets.svgSuffixNext),
          onTap: (){
          if(_con.formKey.currentState!.validate()) {
            _con.showNext.value=true;
          }
          },),
      ],
    ));
  }
  Widget _form2(){
    return Column(
      children: [
        SubTxtWidget('Add Event Banner'),
        imageList(),
        const SizedBox(height: 20,),
        SubTxtWidget('Add a link (to your website, tickets, etc...)'),
        SubTxtWidget('To your website, tickets, etc. Skip if not needed',fontSize: 12,color: "#909090".toColor(),),
        InputWidget(
          color: "#F1F5F9".toColor(),
          fillColor: "#F1F5F9".toColor(),
          controller: _con.link_con,
        ),
        InterestChipWidget(onSelect: (val) {
          _con.selectedCategory=val;
        },),
        CheckboxListTile(value: _con.anonymousEvent.value, onChanged: (value) {
          _con.anonymousEvent.value=value!;
        },
          controlAffinity: ListTileControlAffinity.leading,
          contentPadding: EdgeInsets.zero,
          title: SubTxtWidget("Create anonymous event",fontSize: 16,fontWeight: FontWeight.w500,),
          subtitle: SubTxtWidget('You won’t be displayed as the event organizer',fontSize: 12,fontWeight: FontWeight.w500,
            color: "#909090".toColor(),),),
        ListTile(
          contentPadding: const EdgeInsets.symmetric(horizontal: 5),
          title: SubTxtWidget("Copy join link",fontSize: 16,fontWeight: FontWeight.w500,),
          subtitle: SubTxtWidget('popple.web.app/xyz',fontSize: 12,fontWeight: FontWeight.w500,
            color: "#909090".toColor(),
          ),
          leading: SvgPicture.asset(Assets.svgLink),
        ),
        ButtonPrimaryWidget('CREATE',
          marginHorizontal: 30,
          marginVertical: 20,
          trailing: SvgPicture.asset(Assets.svgSuffixNext),
          isLoading: _con.isLoading.value,
          onTap: (){
          _con.addEvent();
          },),
      ],
    );
  }
  Widget imageList(){
    if(_con.file.isEmpty){
      return InkWell(
        child: Container(
          margin: const EdgeInsets.symmetric(vertical: 10),
          padding: const EdgeInsets.all(30),
          decoration: BoxDecoration(
              borderRadius: const BorderRadius.all(Radius.circular(20)),
              border: Border.all(color: color_615BC9,width: 1)
          ),
          child:_con.file.isNotEmpty?const Center(
            child: Icon(Icons.add,color: color_615BC9,size: 35,),
          ):Wrap(
            children: _con.file.map((e) => Image.file(File(e!.path),height: 100,width: 100,)).toList(),
          ),
        ),
        onTap: (){
          _con.pickImage();
        },
      );
    }
    List<Widget>img=[];
    for(var v in _con.file){
      img.add(Container(
        margin: const EdgeInsets.symmetric(vertical: 5,horizontal: 4),
        padding: const EdgeInsets.all(3),
        decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(Radius.circular(10)),
            border: Border.all(color: color_615BC9,width: 1)
        ),
        child:Stack(
          children: [
            ClipRRect(
              borderRadius: const BorderRadius.all(Radius.circular(10)),
              child: Image.file(File(v!.path),height: 65,width: 65,),
            ),
            Positioned(
              top: 2,
                right: 5,
                child: InkWell(child:  Container(
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.black38
                  ),
                  child: const Icon(Icons.cancel_outlined,size: 15,color: Colors.white,),
                ),onTap: (){
                  _con.file.remove(v);
            },))
          ],
        ),
      ));
    }
    img.add(InkWell(
      child: Container(
        width: 72,height: 72,
        padding: const EdgeInsets.all(5),
        margin: const EdgeInsets.symmetric(vertical: 5,horizontal: 4),
        decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(Radius.circular(10)),
            border: Border.all(color: color_615BC9,width: 1)
        ),
        child:const Center(
          child: Icon(Icons.add,color: color_615BC9,size: 35,),
        ),
      ),
      onTap: (){
        _con.pickImage();
      },
    ));
    return Wrap(children: img,);
  }
}

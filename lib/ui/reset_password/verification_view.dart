import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:pinput/pinput.dart';
import 'package:popple/ui/widgets/sub_txt_widget.dart';

import '../../generated/assets.dart';
import '../../generated/l10n.dart';
import '../widgets/button_primary_widget.dart';
import '../widgets/header_txt_widget.dart';
import 'reset_password_controller.dart';

class VerificationPage extends StatelessWidget {
  VerificationPage({Key? key}) : super(key: key);
  final _con = Get.put(ResetPasswordController());
  var otpCon=TextEditingController();
  final focusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    const length = 5;
    const borderColor = Color.fromRGBO(114, 178, 238, 1);
    const errorColor = Color.fromRGBO(255, 234, 238, 1);
    const fillColor = Color.fromRGBO(222, 231, 240, .57);
    final defaultPinTheme = PinTheme(
      width: 56,
      height: 60,
      decoration: BoxDecoration(
        color: fillColor,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.transparent),
      ),
    );

    return Scaffold(
      key: _con.scaffoldKey,
      backgroundColor: Colors.white,
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        elevation: 0,
      ),
      body: AbsorbPointer(
        absorbing: _con.isLoading.value,
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.only(left: 10,bottom: 10),
                alignment: AlignmentDirectional.centerStart,
                child:  HeaderTxtWidget(S.of(context).verification,fontSize: 24,fontWeight: FontWeight.w800,),
              ),
              Container(
                padding: const EdgeInsets.only(left: 10,bottom: 10),
                alignment: AlignmentDirectional.centerStart,
                child:  SubTxtWidget(S.of(context).weveSendYou(_con.emailCon.value.text),fontSize: 15,fontWeight: FontWeight.w600,),
              ),
              SizedBox(
                height: 68,
                child: Pinput(
                  length: length,
                  controller: otpCon,
                  focusNode: focusNode,
                  defaultPinTheme: defaultPinTheme,
                  androidSmsAutofillMethod:  AndroidSmsAutofillMethod.smsUserConsentApi,
                  closeKeyboardWhenCompleted: true,
                  enableSuggestions: true,
                  keyboardType: TextInputType.number,
                  onCompleted: (pin) {
                    _con.VerifyOtp(pin);
                  },
                  focusedPinTheme: defaultPinTheme.copyWith(
                    height: 68,
                    width: 64,
                    decoration: defaultPinTheme.decoration!.copyWith(
                      border: Border.all(color: borderColor),
                    ),
                  ),
                  errorPinTheme: defaultPinTheme.copyWith(
                    decoration: BoxDecoration(
                      color: errorColor,
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20,),
              ButtonPrimaryWidget(S.of(context).continuess,
                trailing: SvgPicture.asset(Assets.svgSuffixNext),onTap: (){
                  _con.VerifyOtp(otpCon.value.text);
                },),
              const SizedBox(height: 20,),
            ],
          ),
        ),
      ),
    );
  }
}

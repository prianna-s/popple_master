import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:popple/ui/widgets/sub_txt_widget.dart';

import '../../generated/assets.dart';
import '../../generated/l10n.dart';
import '../widgets/button_primary_widget.dart';
import '../widgets/header_txt_widget.dart';
import '../widgets/input_widget.dart';
import 'reset_password_controller.dart';

class ResetPasswordPage extends StatelessWidget {
   ResetPasswordPage({Key? key}) : super(key: key);
  final _con = Get.put(ResetPasswordController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        elevation: 0,
      ),
      body: AbsorbPointer(
        absorbing: _con.isLoading.value,
        child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Form(
              key: _con.formKeyReset,
              child: Obx(
                    () => Column(
                  children: [
                    Container(
                      padding: const EdgeInsets.only(left: 10,bottom: 10),
                      alignment: AlignmentDirectional.centerStart,
                      child:  HeaderTxtWidget(S.of(context).resetPassword,fontSize: 24,fontWeight: FontWeight.w800,),
                    ),
                    Container(
                      padding: const EdgeInsets.only(left: 10,bottom: 10),
                      alignment: AlignmentDirectional.centerStart,
                      child:  SubTxtWidget(S.of(context).pleaseEnterYourEmailAddressToRequest,fontSize: 15,fontWeight: FontWeight.w600,),
                    ),
                    InputWidget(
                      controller: _con.emailCon,
                      hint: S.of(context).abcemailcom,
                      prefixIcon: Container(
                        padding: const EdgeInsets.all(10),
                        child: SvgPicture.asset(Assets.svgMail),
                      ),
                      errorMsg: S.of(context).pleaseEnterEmail,
                      validator: ValidationType.EMAIL,
                    ),
                    const SizedBox(height: 20,),
                    ButtonPrimaryWidget(S.of(context).send,
                      trailing: SvgPicture.asset(Assets.svgSuffixNext),onTap: (){
                        _con.ForgetPassowrd();
                      },isLoading: _con.isLoading.value,),
                    const SizedBox(height: 20,),
                  ],
                ),
              ),
            )
        ),
      ),
    );
  }
}

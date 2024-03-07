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

class UpdatePasswordPage extends StatelessWidget {
  UpdatePasswordPage({Key? key}) : super(key: key);
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
        child: Form(
          key: _con.formKeyUpdate,
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Obx(() => Column(
              children: [
                Container(
                  padding: const EdgeInsets.only(left: 10,bottom: 10),
                  alignment: AlignmentDirectional.centerStart,
                  child:  HeaderTxtWidget(S.of(context).enterYourNewPassword,fontSize: 24,fontWeight: FontWeight.w800,),
                ),
                InputWidget(
                  controller: _con.oldPasswordCon,
                  hint: S.of(context).yourPassword,
                  obscureText:_con.obscureText.value,
                  prefixIcon: Container(
                    padding: const EdgeInsets.all(10),
                    child: SvgPicture.asset(Assets.svgPassword),
                  ),
                  suffixIcon: IconButton(
                    icon: _con.obscureText.value?const Icon(Icons.visibility):const Icon(Icons.visibility_off),
                    onPressed: (){
                      _con.obscureText.value=!_con.obscureText.value;
                    },
                  ),
                  errorMsg: S.of(context).pleaseEnterYourOldPassword,
                  validator: ValidationType.TEXT,
                ),
                InputWidget(
                  controller: _con.newPasswordCon,
                  hint: S.of(context).newPassword,
                  obscureText:_con.obscureText.value,
                  prefixIcon: Container(
                    padding: const EdgeInsets.all(10),
                    child: SvgPicture.asset(Assets.svgPassword),
                  ),
                  suffixIcon: IconButton(
                    icon: _con.obscureText.value?const Icon(Icons.visibility):const Icon(Icons.visibility_off),
                    onPressed: (){
                      _con.obscureText.value=!_con.obscureText.value;
                    },
                  ),
                  errorMsg: S.of(context).pleaseEnterNewPassword,
                  validator: ValidationType.TEXT,
                ),
                InputWidget(
                  controller: _con.cnfPasswordCon,
                  hint: S.of(context).confirmPassword,
                  obscureText:_con.obscureTextCnf.value,
                  prefixIcon: Container(
                    padding: const EdgeInsets.all(10),
                    child: SvgPicture.asset(Assets.svgPassword),
                  ),
                  suffixIcon: IconButton(
                    icon: _con.obscureTextCnf.value?const Icon(Icons.visibility):const Icon(Icons.visibility_off),
                    onPressed: (){
                      _con.obscureTextCnf.value=!_con.obscureTextCnf.value;
                    },
                  ),
                  errorMsg:_con.cnfPasswordCon.text.isEmpty?S.of(context).pleaseEnterConfirmPassword:(_con.cnfPasswordCon.text!=_con.newPasswordCon.text)?S.of(context).passwordNotMatch:null,
                  validator: ValidationType.ShowError,
                  onChanged: (v){
                    _con.update();
                  },
                ),
                const SizedBox(height: 20,),
                ButtonPrimaryWidget(S.of(context).newPassword,
                  trailing: SvgPicture.asset(Assets.svgSuffixNext),onTap: (){
                    _con.UpdatePassowrd();
                  },isLoading: _con.isLoading.value,),
                const SizedBox(height: 20,),
              ],
            )),
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:popple/generated/assets.dart';
import 'package:popple/ui/widgets/button_primary_widget.dart';
import 'package:popple/ui/widgets/header_txt_widget.dart';
import 'package:popple/ui/widgets/sub_txt_widget.dart';

import '../../Constant/color_const.dart';
import '../../generated/l10n.dart';
import '../widgets/custom_switch.dart';
import '../widgets/input_widget.dart';
import 'login_controller.dart';
class LoginPage extends StatefulWidget {
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final LoginController _con = Get.put(LoginController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _con.scaffoldKey,
      backgroundColor: Colors.white,
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        elevation: 0,
      ),
      body: AbsorbPointer(
        absorbing: _con.isLoading.value,
        child: Column(
          children: [
            Expanded(child: SingleChildScrollView(
                controller: ScrollController()
                  ..addListener(() {
                    FocusScope.of(context).unfocus();
                  }),
                child: Form(
                  key: _con.formKey,
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Obx(
                          () => Column(
                        children: [
                          Image.asset(Assets.imgLogoWithIcon,height: 120,),
                          const SizedBox(height: 30,),
                          Container(
                            padding: EdgeInsets.only(left: 10,bottom: 10),
                            alignment: AlignmentDirectional.centerStart,
                            child:  HeaderTxtWidget('Sign in',fontSize: 24,fontWeight: FontWeight.w800,),
                          ),
                          InputWidget(
                            controller: _con.emailCon,
                            hint: S.of(context).abcemailcom,
                            validator: ValidationType.EMAIL,
                            prefixIcon: Container(
                              padding: EdgeInsets.all(10),
                              child: SvgPicture.asset(Assets.svgMail),
                            ),
                            errorMsg: S.of(context).pleaseEnterEmail,
                          ),
                          InputWidget(
                            controller: _con.passwordCon,
                            hint: S.of(context).yourPassword,
                            obscureText:_con.obscureText.value,
                            validator: ValidationType.TEXT,
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
                            errorMsg: S.of(context).pleaseEnterPassword,
                          ),
                          const SizedBox(height: 20,),
                          Padding(padding: const EdgeInsets.symmetric(horizontal: 10),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    CustomSwitch(onChanged: (value) {
                                      _con.isRememberMe.value=value;
                                    },value: _con.isRememberMe.value,),
                                    const SizedBox(width: 10,),
                                    SubTxtWidget(S.of(context).rememberMe,fontSize: 14,fontWeight: FontWeight.w600,)
                                  ],
                                ),
                                SubTxtWidget(S.of(context).forgotPassword,fontSize: 14,fontWeight: FontWeight.w600,),
                              ],
                            ),),
                          const SizedBox(height: 30,),
                          ButtonPrimaryWidget(S.of(context).signIn,
                            trailing: SvgPicture.asset(Assets.svgSuffixNext),onTap: (){
                              _con.SignIn();
                            },isLoading: _con.isLoading.value,),
                          const SizedBox(height: 20,),
                          SubTxtWidget('OR',fontSize: 16,),
                          const SizedBox(height: 20,),
                          ButtonPrimaryWidget('Login with Google',
                            color: Colors.white,
                            txtColor: textColor_12od26,
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            borderColor: Colors.white,
                            leading: Image.asset(Assets.imgGoogle,height: 30,),),
                          const SizedBox(
                            height: 20,
                          )
                        ],
                      ),
                    ),
                  ),
                )
            )),
            _signUp(),
          ],
        ),
      ),
    );
  }
  Widget _signUp(){
    return Container(
      padding: const EdgeInsets.all(30),
      alignment: AlignmentDirectional.center,
      child: Wrap(
        alignment: WrapAlignment.spaceBetween,
        children: [
          HeaderTxtWidget('Don’t have an account?  ',
            fontSize: 15,
            fontWeight: FontWeight.w700,),
          InkWell(
            child: HeaderTxtWidget('Sign up',
              fontSize: 15,
              fontWeight: FontWeight.w700,
              color: Colors.blue,),
            onTap: (){
              Get.toNamed('/signup');
            },
          )
        ],
      ),
    );
  }
}

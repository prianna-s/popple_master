import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../generated/assets.dart';
import '../../generated/l10n.dart';
import '../widgets/button_primary_widget.dart';
import '../widgets/header_txt_widget.dart';
import '../widgets/input_widget.dart';
import 'signup_controller.dart';


class SignupPage extends StatefulWidget {
  const SignupPage({super.key});

  @override
  State<SignupPage> createState() => _LoginPageState();
}
class _LoginPageState extends State<SignupPage> {
  final SignupController _con = Get.put(SignupController());

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
        absorbing: _con.isLoading.isTrue,
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
                          Container(
                            padding: const EdgeInsets.only(left: 10,bottom: 10),
                            alignment: AlignmentDirectional.centerStart,
                            child:  HeaderTxtWidget(S.of(context).signUp,fontSize: 24,fontWeight: FontWeight.w800,),
                          ),
                          InputWidget(
                            controller: _con.firstNameCon,
                            hint: S.of(context).fullName,
                            validator: ValidationType.TEXT,
                            prefixIcon: Container(
                              padding: const EdgeInsets.all(10),
                              child: SvgPicture.asset(Assets.svgProfile),
                            ),
                            errorMsg: S.of(context).pleaseEnterFullName,
                          ),
                          InputWidget(
                            controller: _con.emailCon,
                            hint: S.of(context).abcemailcom,
                            validator: ValidationType.EMAIL,
                            prefixIcon: Container(
                              padding: const EdgeInsets.all(10),
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
                          InputWidget(
                            controller: _con.cnfPassowrdCon,
                            hint: S.of(context).confirmPassword,
                            obscureText:_con.obscureTextCnf.value,
                            validator: ValidationType.ShowError,
                            prefixIcon: Container(
                              padding: const EdgeInsets.all(10),
                              child: SvgPicture.asset(Assets.svgPassword),
                            ),
                            onChanged: (v){
                              setState(() {
                              });
                            },
                            suffixIcon: IconButton(
                              icon: _con.obscureTextCnf.value?const Icon(Icons.visibility):const Icon(Icons.visibility_off),
                              onPressed: (){
                                _con.obscureTextCnf.value=!_con.obscureTextCnf.value;
                              },
                            ),
                            errorMsg:_con.cnfPassowrdCon.text.isEmpty?S.of(context).pleaseEnterConfirmPassword:(_con.cnfPassowrdCon.value.text!=_con.passwordCon.value.text)?S.of(context).passwordNotMatch:null,
                          ),
                          _privacyPolicy(),
                          const SizedBox(height: 20,),
                          ButtonPrimaryWidget(S.of(context).signUp,
                            trailing: SvgPicture.asset(Assets.svgSuffixNext),onTap: (){
                              _con.SignUp();
                            },isLoading: _con.isLoading.value,),
                          const SizedBox(height: 20,),
                        ],
                      ),
                    ),
                  ),
                )
            )),
            _signIn()
          ],
        ),
      ),
    );
  }
  Widget _privacyPolicy(){
    return Container(
      padding: const EdgeInsets.all(10),
      alignment: AlignmentDirectional.centerStart,
      child: Wrap(
        alignment: WrapAlignment.spaceBetween,
        children: [
          HeaderTxtWidget(S.of(context).byCreatingAnAccountYouAcknowledgeOur,
            fontSize: 13,
            fontWeight: FontWeight.w700,),
          HeaderTxtWidget(S.of(context).smallprivacyPolicy,
            fontSize: 13,
            fontWeight: FontWeight.w700,
            color: Colors.blue,),
        ],
      ),
    );
  }
  Widget _signIn(){
    return Container(
      padding: const EdgeInsets.all(30),
      alignment: AlignmentDirectional.center,
      child: Wrap(
        alignment: WrapAlignment.spaceBetween,
        children: [
          HeaderTxtWidget(S.of(context).alreadyHaveAnAccount,
            fontSize: 15,
            fontWeight: FontWeight.w700,),
          InkWell(
            child: HeaderTxtWidget(S.of(context).signIn,
              fontSize: 15,
              fontWeight: FontWeight.w700,
              color: Colors.blue,),
            onTap: (){
              Get.back();
            },
          )
        ],
      ),
    );
  }
}
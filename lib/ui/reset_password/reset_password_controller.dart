import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:popple/repos/setting_repo.dart';

import '../../SnckBar/animated_snack_bar.dart';
import '../../SnckBar/types.dart';
import '../../repos/auth_repo.dart';

class ResetPasswordController extends GetxController {
  GlobalKey<ScaffoldState> scaffoldKey =  GlobalKey<ScaffoldState>();
  GlobalKey<FormState> formKeyReset =  GlobalKey<FormState>();
  GlobalKey<FormState> formKeyUpdate =  GlobalKey<FormState>();
  RxBool obscureText=RxBool(true);
  RxBool obscureTextCnf=RxBool(true);
  var emailCon=TextEditingController();
  var oldPasswordCon=TextEditingController();
  var newPasswordCon=TextEditingController();
  var cnfPasswordCon=TextEditingController();
  RxBool isLoading=RxBool(false);
  String? OTP;
  @override
  void onReady() {
    // TODO: implement onReady
    super.onReady();
  }

  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
  }
  void ForgetPassowrd(){
    if(formKeyReset.currentState!.validate()){
      FocusScope.of(formKeyReset.currentContext!).unfocus();
      isLoading.value=true;
      Map<String,dynamic>map={};
      map['email']=emailCon.value.text;
      verifyEmail(map).then((value){
        isLoading.value=false;
        if(value.status=="1"){
          OTP=value.result!.code;
         Get.toNamed('/otp_verification');
        }else{
          AnimatedSnackBar.material(
              '${value.message}',
              type: AnimatedSnackBarType.error,
              mobileSnackBarPosition: MobileSnackBarPosition.bottom
          ).show(formKeyReset.currentContext!);
        }
      });
    }
  }
  void UpdatePassowrd(){
    if(formKeyUpdate.currentState!.validate()){
      if(cnfPasswordCon.text!=newPasswordCon.text){
        return;
      }
      FocusScope.of(formKeyUpdate.currentContext!).unfocus();
      isLoading.value=true;
      Map<String,dynamic>map={};
      map['old_password']=oldPasswordCon.value.text;
      map['password']=newPasswordCon.value.text;
      map['user_id']=auth.value.id;
      updatePassword(map).then((value){
        isLoading.value=false;
        if(value.status=="1"){
         AnimatedSnackBar.material(
              '${value.result}',
              type: AnimatedSnackBarType.success,
              mobileSnackBarPosition: MobileSnackBarPosition.bottom
          ).show(formKeyUpdate.currentContext!);
         Get.offAndToNamed('/login');
        }else{
          AnimatedSnackBar.material(
              '${value.message}',
              type: AnimatedSnackBarType.error,
              mobileSnackBarPosition: MobileSnackBarPosition.bottom
          ).show(formKeyUpdate.currentContext!);
        }
      });
    }
  }
  void VerifyOtp(otp){
      FocusScope.of(formKeyReset.currentContext!).unfocus();
      isLoading.value=true;
      if(OTP==otp){
        isLoading.value=false;
        Get.toNamed('/update_password');
      }else{
        isLoading.value=false;
        AnimatedSnackBar.material(
            'Verification code not valid',
            type: AnimatedSnackBarType.error,
            mobileSnackBarPosition: MobileSnackBarPosition.bottom
        ).show(formKeyReset.currentContext!);
      }
    }

}

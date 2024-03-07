import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../SnckBar/animated_snack_bar.dart';
import '../../SnckBar/types.dart';
import '../../repos/auth_repo.dart';
import '../../repos/session_repo.dart';

class LoginController extends GetxController {
  GlobalKey<ScaffoldState> scaffoldKey =  GlobalKey<ScaffoldState>();
  GlobalKey<FormState> formKey =  GlobalKey<FormState>();
  RxBool obscureText=RxBool(true);
  RxBool isLoading=RxBool(false);
  RxBool isRememberMe=RxBool(false);
  var emailCon=TextEditingController();
  var passwordCon=TextEditingController();
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
  void SignIn(){
    if(formKey.currentState!.validate()){
      FocusScope.of(scaffoldKey.currentContext!).unfocus();
      isLoading.value=true;
      Map<String,dynamic>map={};
      map['email']=emailCon.value.text;
      map['password']=passwordCon.value.text;
      map['register_id']="";
      map['ios_register_id']="";
      signin(map).then((value){
        isLoading.value=false;
        if(value.status=="1"){
          CreateSession(value.result!.toJson(), isRememberMe.value);
          AnimatedSnackBar.material(
              '${value.message}',
              type: AnimatedSnackBarType.success,
              mobileSnackBarPosition: MobileSnackBarPosition.bottom
          ).show(scaffoldKey.currentContext!);
          Get.offAndToNamed('/dashboard');
        }else{
          AnimatedSnackBar.material(
              '${value.message}',
              type: AnimatedSnackBarType.error,
              mobileSnackBarPosition: MobileSnackBarPosition.bottom
          ).show(scaffoldKey.currentContext!);
        }
      });
    }
  }
}

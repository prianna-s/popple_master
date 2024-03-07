import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:popple/repos/session_repo.dart';

import '../../SnckBar/animated_snack_bar.dart';
import '../../SnckBar/types.dart';
import '../../repos/auth_repo.dart';

class SignupController extends GetxController {
  GlobalKey<ScaffoldState> scaffoldKey =  GlobalKey<ScaffoldState>();
  GlobalKey<FormState> formKey =  GlobalKey<FormState>();
  RxBool obscureText=RxBool(true);
  RxBool obscureTextCnf=RxBool(true);
  RxBool isLoading=RxBool(false);
  var firstNameCon=TextEditingController();
  var cnfPassowrdCon=TextEditingController();
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
  void SignUp(){
    if(formKey.currentState!.validate()){
      if(cnfPassowrdCon.text!=passwordCon.text){
        return;
      }
      FocusScope.of(scaffoldKey.currentContext!).unfocus();
      isLoading.value=true;
      List<String> name =firstNameCon.value.text.split(" ");
      Map<String,dynamic>map={};
      map['first_name']=name[0];
      map['last_name']=name.length>1?name[1]:"";
      map['email']=emailCon.value.text;
      map['password']=passwordCon.value.text;
      map['mobile']="";
      map['mobile_code']="";
      map['register_id']="";
      map['ios_register_id']="";
      map['status']="Active";
      map['type']="User";
      signup(map).then((value){
        isLoading.value=false;
        if(value.status=="1"){
          CreateSession(value.result!.toJson(), true);
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

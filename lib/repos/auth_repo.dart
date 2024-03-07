
import 'package:popple/Constant/api_dio.dart';
import 'package:popple/Models/auth_response.dart';
import 'package:popple/Models/basic_response.dart';

import '../ui/reset_password/m/verify_email_response.dart';

Future<AuthResponse>signup(Map<String,dynamic>map) async {
  var resp= await httpClient().get("signup",queryParameters: map);
  return AuthResponse.fromJson(resp.data);
}
Future<AuthResponse>signin(Map<String,dynamic>map) async {
  var resp= await httpClient().get("login",queryParameters: map);
  return AuthResponse.fromJson(resp.data);
}
Future<BasicResponse>forgetPassword(Map<String,dynamic>map) async {
  var resp= await httpClient().get("forgot_password",queryParameters: map);
  return BasicResponse.fromJson(resp.data);
}
Future<VerifyEmailResponse>verifyEmail(Map<String,dynamic>map) async {
  var resp= await httpClient().get("verify_email",queryParameters: map);
  return VerifyEmailResponse.fromJson(resp.data);
}
Future<BasicResponse>updatePassword(Map<String,dynamic>map) async {
  var resp= await httpClient().get("change_password",queryParameters: map);
  return BasicResponse.fromJson(resp.data);
}
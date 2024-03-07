import 'package:popple/Models/user_details.dart';

class AuthResponse {
  AuthResponse({
      this.result, 
      this.message, 
      this.status,});

  AuthResponse.fromJson(dynamic json) {
    if(json['status']=="1") {
      result =
      json['result'] != null ? UserDetails.fromJson(json['result']) : null;
    }
    message = json['message'];
    status = json['status'];
  }
  UserDetails? result;
  String? message;
  String? status;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (result != null) {
      map['result'] = result?.toJson();
    }
    map['message'] = message;
    map['status'] = status;
    return map;
  }

}

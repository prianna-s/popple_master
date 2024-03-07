class VerifyEmailResponse {
  VerifyEmailResponse({
      this.result, 
      this.message, 
      this.status,});

  VerifyEmailResponse.fromJson(dynamic json) {
    result = json['result'] != null ? Result.fromJson(json['result']) : null;
    message = json['message'];
    status = json['status'];
  }
  Result? result;
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

class Result {
  Result({
      this.code,});

  Result.fromJson(dynamic json) {
    code = json['code'];
  }
  String? code;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['code'] = code;
    return map;
  }

}
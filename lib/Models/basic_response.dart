class BasicResponse {
  BasicResponse({
      this.result, 
      this.message, 
      this.status,});

  BasicResponse.fromJson(dynamic json) {
    result = json['result'].toString();
    message = json['message'];
    status = json['status'];
  }
  String? result;
  String? message;
  String? status;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['result'] = result;
    map['message'] = message;
    map['status'] = status;
    return map;
  }

}
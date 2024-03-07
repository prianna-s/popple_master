class InterestResponse {
  InterestResponse({
      this.result, 
      this.message, 
      this.status,});

  InterestResponse.fromJson(dynamic json) {
    if (json['result'] != null) {
      result = [];
      json['result'].forEach((v) {
        result?.add(Interest.fromJson(v));
      });
    }
    message = json['message'];
    status = json['status'];
  }
  List<Interest>? result;
  String? message;
  String? status;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (result != null) {
      map['result'] = result?.map((v) => v.toJson()).toList();
    }
    map['message'] = message;
    map['status'] = status;
    return map;
  }

}

class Interest {
  Interest({
      this.id, 
      this.name, 
      this.image, 
      this.colorCode, 
      this.dateTime,});

  Interest.fromJson(dynamic json) {
    id = json['id'];
    name = json['name'];
    image = json['image'];
    colorCode = json['color_code'];
    dateTime = json['date_time'];
    selected=false;
  }
  String? id;
  String? name;
  String? image;
  String? colorCode;
  String? dateTime;
  bool? selected;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['name'] = name;
    map['image'] = image;
    map['color_code'] = colorCode;
    map['date_time'] = dateTime;
    return map;
  }

}
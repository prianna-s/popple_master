import 'package:popple/Models/user_details.dart';

class EventResponse {
  EventResponse({
      this.result, 
      this.message, 
      this.status,});

  EventResponse.fromJson(dynamic json) {
    if (json['result'] != null) {
      result = [];
      json['result'].forEach((v) {
        result?.add(EventData.fromJson(v));
      });
    }
    message = json['message'];
    status = json['status'];
  }
  List<EventData>? result;
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
class Images {
  Images({
      this.id,
      this.post_id,
      this.date_time,
      this.image,
  });

  Images.fromJson(dynamic json) {
    id = json['id'];
    post_id = json['post_id'];
    date_time = json['date_time'];
    image = json['image'];
  }

  String? id;
  String? post_id;
  String? date_time;
  String? image;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['post_id'] = post_id;
    map['id'] = id;
    map['date_time'] = date_time;
    map['image'] = image;
    return map;
  }

}

class EventData {
  EventData({
      this.id, 
      this.userId, 
      this.catId, 
      this.catName, 
      this.title, 
      this.businessName, 
      this.websiteLink, 
      this.address, 
      this.lat, 
      this.lon, 
      this.userName, 
      this.userNumber, 
      this.description, 
      this.date, 
      this.time, 
      this.status, 
      this.type, 
      this.image, 
      this.video, 
      this.dateTime, 
      this.removeStatus, 
      this.postImages, 
      this.userDetails,});

  EventData.fromJson(dynamic json) {
    id = json['id'];
    userId = json['user_id'];
    catId = json['cat_id'];
    catName = json['cat_name'];
    title = json['title'];
    businessName = json['business_name'];
    websiteLink = json['website_link'];
    address = json['address'];
    lat = json['lat'];
    lon = json['lon'];
    userName = json['user_name'];
    userNumber = json['user_number'];
    description = json['description'];
    date = json['date'];
    time = json['time'];
    status = json['status'];
    type = json['type'];
    image = json['image'];
    video = json['video'];
    dateTime = json['date_time'];
    removeStatus = json['remove_status'];
    feature_event = json['feature_event'];
    distance = json['distance']??"";
    no_of_group = json['no_of_group']??"";
    post_saved = json['post_saved']??"No";
    if (json['post_images'] != null) {
      postImages = [];
      json['post_images'].forEach((v) {
        postImages?.add(Images.fromJson(v));
      });
    }
    userDetails = json['user_details'] != null ? UserDetails.fromJson(json['user_details']) : null;
  }
  String? id;
  String? post_saved;
  String? distance;
  String? no_of_group;
  String? userId;
  String? catId;
  String? catName;
  String? title;
  String? businessName;
  String? websiteLink;
  String? address;
  String? lat;
  String? lon;
  String? userName;
  String? userNumber;
  String? description;
  String? date;
  String? time;
  String? status;
  String? type;
  String? image;
  String? video;
  String? dateTime;
  String? removeStatus;
  String? feature_event;
  List<Images>? postImages;
  UserDetails? userDetails;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['post_saved'] = post_saved;
    map['user_id'] = userId;
    map['cat_id'] = catId;
    map['cat_name'] = catName;
    map['title'] = title;
    map['business_name'] = businessName;
    map['website_link'] = websiteLink;
    map['address'] = address;
    map['lat'] = lat;
    map['lon'] = lon;
    map['user_name'] = userName;
    map['user_number'] = userNumber;
    map['description'] = description;
    map['date'] = date;
    map['time'] = time;
    map['status'] = status;
    map['type'] = type;
    map['image'] = image;
    map['video'] = video;
    map['date_time'] = dateTime;
    map['remove_status'] = removeStatus;
    map['feature_event'] = feature_event;
    map['no_of_message'] = no_of_group;
    map['distance'] = distance;
    if (postImages != null) {
      map['post_images'] = postImages?.map((v) => v.toJson()).toList();
    }
    if (userDetails != null) {
      map['user_details'] = userDetails?.toJson();
    }
    return map;
  }

}

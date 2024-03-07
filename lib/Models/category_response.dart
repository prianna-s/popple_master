class CategoryResponse {
  CategoryResponse({
      this.result, 
      this.message, 
      this.status,});

  CategoryResponse.fromJson(dynamic json) {
    if (json['result'] != null) {
      result = [];
      json['result'].forEach((v) {
        result?.add(Category.fromJson(v));
      });
    }
    message = json['message'];
    status = json['status'];
  }
  List<Category>? result;
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

class Category {
  Category({
      this.id, 
      this.categoryName, 
      this.image, 
      this.status, 
      this.displayOrder, 
      this.removeStatus,});

  Category.fromJson(dynamic json) {
    id = json['id'];
    categoryName = json['category_name'];
    image = json['image'];
    status = json['status'];
    displayOrder = json['display_order'];
    removeStatus = json['remove_status'];
    selected=false;
  }
  String? id;
  String? categoryName;
  String? image;
  String? status;
  String? displayOrder;
  String? removeStatus;
  bool? selected;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['category_name'] = categoryName;
    map['image'] = image;
    map['status'] = status;
    map['display_order'] = displayOrder;
    map['remove_status'] = removeStatus;
    return map;
  }

}
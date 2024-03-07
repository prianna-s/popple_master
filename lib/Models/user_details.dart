
class UserDetails {
  UserDetails({
    this.id,
    this.customerId,
    this.cardId,
    this.ip,
    this.userId,
    this.userName,
    this.firstName,
    this.lastName,
    this.mobile,
    this.mobileCode,
    this.mobileCodeName,
    this.email,
    this.password,
    this.image,
    this.document,
    this.about,
    this.interest,
    this.type,
    this.employeeCode,
    this.subAddress,
    this.numberOfEmployee,
    this.workType,
    this.socialId,
    this.lat,
    this.lon,
    this.address,
    this.address1,
    this.city,
    this.postcode,
    this.registerId,
    this.iosRegisterId,
    this.deviceToken,
    this.status,
    this.dateTime,
    this.wallet,
    this.orderRejectCount,
    this.categoryId,
    this.categoryName,
    this.expDate,
    this.planId,
    this.profileExpDate,
    this.uniqueCodeImage,
    this.uniqueCode,
    this.paymentStatus,
    this.countryName,
    this.areaCode,
    this.notiCount,
    this.chatCount,});

  UserDetails.fromJson(dynamic json) {
    id = json['id'];
    customerId = json['customer_id'];
    cardId = json['card_id'];
    ip = json['ip'];
    userId = json['user_id'];
    userName = json['user_name'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    mobile = json['mobile'];
    mobileCode = json['mobile_code'];
    mobileCodeName = json['mobile_code_name'];
    email = json['email'];
    password = json['password'];
    image = json['image'];
    document = json['document'];
    about = json['about'];
    interest = json['interest'];
    type = json['type'];
    employeeCode = json['employee_code'];
    subAddress = json['sub_address'];
    numberOfEmployee = json['number_of_employee'];
    workType = json['work_type'];
    socialId = json['social_id'];
    lat = json['lat'];
    lon = json['lon'];
    address = json['address'];
    address1 = json['address1'];
    city = json['city'];
    postcode = json['postcode'];
    registerId = json['register_id'];
    iosRegisterId = json['ios_register_id'];
    deviceToken = json['device_token'];
    status = json['status'];
    dateTime = json['date_time'];
    wallet = json['wallet'];
    orderRejectCount = json['order_reject_count'];
    categoryId = json['category_id'];
    categoryName = json['category_name'];
    expDate = json['exp_date'];
    planId = json['plan_id'];
    profileExpDate = json['profile_exp_date'];
    uniqueCodeImage = json['unique_code_image'];
    uniqueCode = json['unique_code'];
    paymentStatus = json['payment_status'];
    countryName = json['country_name'];
    areaCode = json['area_code'];
    notiCount = json['noti_count'];
    chatCount = json['chat_count'];
  }
  String? id;
  String? customerId;
  String? cardId;
  String? ip;
  String? userId;
  String? userName;
  String? firstName;
  String? lastName;
  String? mobile;
  String? mobileCode;
  String? mobileCodeName;
  String? email;
  String? password;
  String? image;
  String? document;
  String? about;
  String? interest;
  String? type;
  String? employeeCode;
  String? subAddress;
  String? numberOfEmployee;
  String? workType;
  String? socialId;
  String? lat;
  String? lon;
  String? address;
  String? address1;
  String? city;
  String? postcode;
  String? registerId;
  String? iosRegisterId;
  dynamic deviceToken;
  String? status;
  String? dateTime;
  String? wallet;
  String? orderRejectCount;
  String? categoryId;
  String? categoryName;
  String? expDate;
  String? planId;
  String? profileExpDate;
  String? uniqueCodeImage;
  String? uniqueCode;
  String? paymentStatus;
  String? countryName;
  String? areaCode;
  String? notiCount;
  dynamic chatCount;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['customer_id'] = customerId;
    map['card_id'] = cardId;
    map['ip'] = ip;
    map['user_id'] = userId;
    map['user_name'] = userName;
    map['first_name'] = firstName;
    map['last_name'] = lastName;
    map['mobile'] = mobile;
    map['mobile_code'] = mobileCode;
    map['mobile_code_name'] = mobileCodeName;
    map['email'] = email;
    map['password'] = password;
    map['image'] = image;
    map['document'] = document;
    map['about'] = about;
    map['interest'] = interest;
    map['type'] = type;
    map['employee_code'] = employeeCode;
    map['sub_address'] = subAddress;
    map['number_of_employee'] = numberOfEmployee;
    map['work_type'] = workType;
    map['social_id'] = socialId;
    map['lat'] = lat;
    map['lon'] = lon;
    map['address'] = address;
    map['address1'] = address1;
    map['city'] = city;
    map['postcode'] = postcode;
    map['register_id'] = registerId;
    map['ios_register_id'] = iosRegisterId;
    map['device_token'] = deviceToken;
    map['status'] = status;
    map['date_time'] = dateTime;
    map['wallet'] = wallet;
    map['order_reject_count'] = orderRejectCount;
    map['category_id'] = categoryId;
    map['category_name'] = categoryName;
    map['exp_date'] = expDate;
    map['plan_id'] = planId;
    map['profile_exp_date'] = profileExpDate;
    map['unique_code_image'] = uniqueCodeImage;
    map['unique_code'] = uniqueCode;
    map['payment_status'] = paymentStatus;
    map['country_name'] = countryName;
    map['area_code'] = areaCode;
    map['noti_count'] = notiCount;
    map['chat_count'] = chatCount;
    return map;
  }

}
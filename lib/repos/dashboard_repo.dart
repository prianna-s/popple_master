import 'package:popple/Constant/api_dio.dart';
import 'package:popple/Models/interest_response.dart';

import '../Models/category_response.dart';

Future<InterestResponse>getInterestList() async {
  var resp= await httpClient().get("get_interest_list");
  return InterestResponse.fromJson(resp.data);
}
Future<CategoryResponse>getCategoryList() async {
  var resp= await httpClient().get("get_category_list");
  return CategoryResponse.fromJson(resp.data);
}

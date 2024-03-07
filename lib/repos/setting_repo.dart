import 'package:flutter/material.dart';

import '../Models/interest_response.dart';
import '../Models/user_details.dart';

ValueNotifier<UserDetails> auth = ValueNotifier(UserDetails());
ValueNotifier<List<Interest>> interestList = ValueNotifier([]);
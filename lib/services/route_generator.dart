import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:popple/ui/splash/splash_view.dart';
import 'package:popple/ui/widgets/header_txt_widget.dart';

import '../ui/dashboard/dashboard_view.dart';
import '../ui/explore/event_details_view.dart';
import '../ui/explore/explore_view.dart';
import '../ui/explore/group_view.dart';
import '../ui/login/login_view.dart';
import '../ui/my_event/create_event_view.dart';
import '../ui/my_event/my_event_details_view.dart';
import '../ui/my_event/my_event_view.dart';
import '../ui/my_group/chat_view.dart';
import '../ui/my_group/group_details_view.dart';
import '../ui/my_group/my_group_view.dart';
import '../ui/profile/edit_profile_view.dart';
import '../ui/profile/profile_view.dart';
import '../ui/reset_password/reset_password_view.dart';
import '../ui/reset_password/update_password_view.dart';
import '../ui/reset_password/verification_view.dart';
import '../ui/saved/saved_view.dart';
import '../ui/setting/setting_view.dart';
import '../ui/signup/signup_view.dart';

appRoutes() => [
      GetPage(
        name: '/splash',
        page: () => SplashPage(),
        transitionDuration: const Duration(milliseconds: 500),
      ),
      GetPage(
        name: '/login',
        page: () => LoginPage(),
        transitionDuration: const Duration(milliseconds: 500),
      ),
      GetPage(
        name: '/signup',
        page: () => SignupPage(),
        transitionDuration: const Duration(milliseconds: 500),
      ),
      GetPage(
        name: '/dashboard',
        page: () => DashboardPage(),
        transitionDuration: const Duration(milliseconds: 500),
      ),
      GetPage(
        name: '/my_event',
        page: () => MyEventPage(),
        transitionDuration: const Duration(milliseconds: 500),
      ),
      GetPage(
        name: '/reset_password',
        page: () => ResetPasswordPage(),
        transitionDuration: const Duration(milliseconds: 500),
      ),
      GetPage(
        name: '/otp_verification',
        page: () => VerificationPage(),
        transitionDuration: const Duration(milliseconds: 500),
      ),
      GetPage(
        name: '/update_password',
        page: () => UpdatePasswordPage(),
        transitionDuration: const Duration(milliseconds: 500),
      ),
      GetPage(
        name: '/chat',
        page: () => ChatPage(),
        transitionDuration: const Duration(milliseconds: 500),
      ),
      GetPage(
        name: '/group_details',
        page: () => GroupDetailsPage(),
        transitionDuration: const Duration(milliseconds: 500),
      ),
      GetPage(
        name: '/edit_profile',
        page: () => EditProfilePage(),
        transitionDuration: const Duration(milliseconds: 500),
      ),
      GetPage(
        name: '/my_event_details',
        page: () => MyEventDetailsPage(),
        transitionDuration: const Duration(milliseconds: 500),
      ),
      GetPage(
        name: '/event_details',
        page: () => EventDetailsPage(),
        transitionDuration: const Duration(milliseconds: 500),
      ),
      GetPage(
        name: '/create_event',
        page: () => CreateEventPage(),
        transitionDuration: const Duration(milliseconds: 500),
      ),
  GetPage(
        name: '/groups',
        page: () => GroupPage(),
        transitionDuration: const Duration(milliseconds: 500),
      ),GetPage(
        name: '/setting',
        page: () => SettingPage(),
        transitionDuration: const Duration(milliseconds: 500),
      ),
    ];

Route? onGenerateRoute(RouteSettings settings) {
  print("name ${settings.name}");
  if (settings.name == '0') {
    return GetPageRoute(
      settings: settings,
      page: () => ExplorePage(),
    );
  }
  if (settings.name == '1') {
    return GetPageRoute(
      settings: settings,
      page: () => SavedPage(),
    );
  }
  if (settings.name == '2') {
    return GetPageRoute(
      settings: settings,
      page: () => MyGroupPage(),
    );
  }
  if (settings.name == '3') {
    return GetPageRoute(
      settings: settings,
      page: () => ProfilePage(),
    );
  }

  return GetPageRoute(
    settings: settings,
    page: () => Container(
      alignment: AlignmentDirectional.center,
      child: HeaderTxtWidget("Page On Development"),
    ),
  );
}

class MyMiddelware extends GetMiddleware {
  @override
  GetPage? onPageCalled(GetPage? page) {
    print(page?.name);
    return super.onPageCalled(page);
  }
}

// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a en locale. All the
// messages from the main program should be duplicated here with the same
// function name.

// Ignore issues from commonly used lints in this file.
// ignore_for_file:unnecessary_brace_in_string_interps, unnecessary_new
// ignore_for_file:prefer_single_quotes,comment_references, directives_ordering
// ignore_for_file:annotate_overrides,prefer_generic_function_type_aliases
// ignore_for_file:unused_import, file_names, avoid_escaping_inner_quotes
// ignore_for_file:unnecessary_string_interpolations, unnecessary_string_escapes

import 'package:intl/intl.dart';
import 'package:intl/message_lookup_by_library.dart';

final messages = new MessageLookup();

typedef String MessageIfAbsent(String messageStr, List<dynamic> args);

class MessageLookup extends MessageLookupByLibrary {
  String get localeName => 'en';

  static String m0(count) => "${count} groups interested";

  static String m1(count) => "${count} groups";

  static String m2(distanse) => "${distanse} mi away";

  static String m3(email) => "We’ve send you the verification code on ${email}";

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
        "abcemailcom": MessageLookupByLibrary.simpleMessage("abc@email.com"),
        "alreadyHaveAnAccount":
            MessageLookupByLibrary.simpleMessage("Already have an account?"),
        "byCreatingAnAccountYouAcknowledgeOur":
            MessageLookupByLibrary.simpleMessage(
                "By creating an account, you acknowledge our"),
        "confirmPassword":
            MessageLookupByLibrary.simpleMessage("Confirm password"),
        "continuess": MessageLookupByLibrary.simpleMessage("CONTINUE"),
        "countGroupsInterested": m0,
        "enterYourNewPassword":
            MessageLookupByLibrary.simpleMessage("Enter your new password"),
        "filter": MessageLookupByLibrary.simpleMessage("Filter"),
        "forgotPassword":
            MessageLookupByLibrary.simpleMessage("Forgot Password?"),
        "fullName": MessageLookupByLibrary.simpleMessage("Full name"),
        "groups_with_count": m1,
        "info": MessageLookupByLibrary.simpleMessage("INFO"),
        "miAway": m2,
        "myEvents": MessageLookupByLibrary.simpleMessage("My Events"),
        "newPassword": MessageLookupByLibrary.simpleMessage("New password"),
        "passwordNotMatch":
            MessageLookupByLibrary.simpleMessage("Password not match"),
        "pleaseEnterConfirmPassword": MessageLookupByLibrary.simpleMessage(
            "Please enter confirm password"),
        "pleaseEnterEmail":
            MessageLookupByLibrary.simpleMessage("Please enter email"),
        "pleaseEnterFullName":
            MessageLookupByLibrary.simpleMessage("Please enter full name"),
        "pleaseEnterNewPassword":
            MessageLookupByLibrary.simpleMessage("Please enter new password"),
        "pleaseEnterPassword":
            MessageLookupByLibrary.simpleMessage("Please enter password"),
        "pleaseEnterYourEmailAddressToRequest":
            MessageLookupByLibrary.simpleMessage(
                "Please enter your email address to request a password reset"),
        "pleaseEnterYourOldPassword": MessageLookupByLibrary.simpleMessage(
            "Please enter your old password"),
        "rememberMe": MessageLookupByLibrary.simpleMessage("Remember Me"),
        "resetPassword": MessageLookupByLibrary.simpleMessage("Reset Password"),
        "send": MessageLookupByLibrary.simpleMessage("SEND"),
        "signIn": MessageLookupByLibrary.simpleMessage("Sign in"),
        "signUp": MessageLookupByLibrary.simpleMessage("Sign up"),
        "smallprivacyPolicy":
            MessageLookupByLibrary.simpleMessage("privacy policy"),
        "verification": MessageLookupByLibrary.simpleMessage("Verification"),
        "weveSendYou": m3,
        "yourPassword": MessageLookupByLibrary.simpleMessage("Your password")
      };
}

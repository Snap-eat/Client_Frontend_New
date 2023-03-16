// ignore_for_file: unused_import, avoid_print, prefer_typing_uninitialized_variables, empty_catches, prefer_const_constructors, prefer_interpolation_to_compose_strings, unused_local_variable, unnecessary_string_interpolations, file_names, camel_case_types
import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:snapeat1/component/images_constant.dart';
import 'package:snapeat1/component/text_constant_key.dart';
import 'package:snapeat1/services/auth_services/api_url_constant.dart';
import '../../component/navigation_routes.dart';
import '../../component/navigator_key.dart';
import '../../prefrences/get_data_from_shared_prefrences.dart';
import '../../prefrences/shared_prefrences.dart';
import '../../screens/bottom_navbar/bottom_navbar.dart';
import '../../screens/onboarding_screens/enter_email.dart';
import '../../screens/onboarding_screens/otp_verify.dart';
import '../../screens/onboarding_screens/terms_conditions_welcome.dart';
import '../../utils/colors.dart';
import '../../utils/custom_message_widgets.dart';

// All Onboarding Api here......
class onboarding_api extends ChangeNotifier {
  var new_user_id = '';
  // Registration Api..
  var invalidEntryMsg = '';
  bool isSentOTP = false;
  Future sendOTPApi(var mobileNumber) async {
    try {
      isSentOTP = true;
      var response = await http.post(Uri.parse(ApiClient.sendOTPUrl), body: {"mobileNo": mobileNumber, "lattitude": "", "longitude": ""});
      var data = json.decode(response.body.toString());

      if (response.statusCode == 200) {
        if (data['status']) {
          new_user_id = data['result']['_id'].toString();
          Preference.pref.setString(UserData.USER_ID, data['result']['_id'].toString());
          Preference.pref.setString(UserData.USER_MOBILE_NUMBER, data['result']['mobileNo'].toString());
          if (data['result']['otpAttempts'] != null) {
            if (data['result']['otpAttempts'] > 4) {
              otp_verify.errorMessage = RESEND_CODE_ERROR_MESSAGE + " " + data['result']['mobileNo'].toString() + ".";
            } else {
              otp_verify.errorMessage = "";
            }
          } else {
            otp_verify.errorMessage = "";
          }
          pushTo(otp_verify(number: data['result']['mobileNo'].toString()));
          invalidEntryMsg = "";
          isSentOTP = false;
          notifyListeners();
          return data;
        }
      } else if (response.statusCode == 208) {
        invalidEntryMsg = "";
        new_user_id = data['result']['_id'].toString();

        if (data['result']['otpAttempts'] != null) {
          if (data['result']['otpAttempts'] > 4) {
            otp_verify.errorMessage = RESEND_CODE_ERROR_MESSAGE + " " + data['result']['mobileNo'].toString() + ".";
          } else {
            otp_verify.errorMessage = "";
          }
        } else {
          otp_verify.errorMessage = "";
        }
        Preference.pref.setString(UserData.USER_ID, data['result']['_id'].toString());
        Preference.pref.setString(UserData.USER_MOBILE_NUMBER, data['result']['mobileNo'].toString());

        pushTo(otp_verify(number: data['result']['mobileNo'].toString()));
        isSentOTP = false;
        notifyListeners();
      } else {
        invalidEntryMsg = data['message'].toString();
        isSentOTP = false;
        notifyListeners();
      }
    } catch (e) {
      // invalidEntryMsg = e.toString();
      invalidEntryMsg = "Server error";
      isSentOTP = false;
      notifyListeners();
    }
    notifyListeners();
  }

// Registration OTP Verify Api..
  var otpverificationMsg = '';
  bool isRegistrationOTPverify = false;
  Future otpVerify(var otp) async {
    try {
      isRegistrationOTPverify = true;
      var response = await http.post(Uri.parse(ApiClient.otpVerifyUrl + new_user_id), body: {"mobileOtp": otp});
      var data = json.decode(response.body.toString());
      if (response.statusCode == 200) {
        otpverificationMsg = data['message'].toString();
        if (data['status']) {
          otpverificationMsg = '';
          Preference.pref.setString(UserData.USER_ID, new_user_id);
          Preference.pref.setString(UserData.TOKEN, data['token'].toString());
          if (data['result']['is_registered'] == false && data['result']['termsConditions'] == false) {
            pushTo(enter_email());
          } else if (data['result']['termsConditions'] == false && data['result']['is_registered'] == true) {
            pushTo(terms_conditions_welcome());
          } else if (data['result']['termsConditions'] == true && data['result']['is_registered'] == true) {
            pustAndRemoveUntil(bottom_navbar());
          }
          isRegistrationOTPverify = false;

          notifyListeners();
          return data;
        } else {
          otpverificationMsg = "The OTP passcode you entered is incorrect.";
        }
      } else {
        Preference.pref.setString(UserData.TOKEN, data['token'].toString());
        isRegistrationOTPverify = false;
        if (otp_verify.errorMessage.isNotEmpty) {
          otpverificationMsg = "The OTP passcode you entered is incorrect." + otp_verify.errorMessage.toString();
        } else {
          otpverificationMsg = "The OTP passcode you entered is incorrect.";
        }
        notifyListeners();
      }
    } catch (e) {
      isRegistrationOTPverify = false;
      notifyListeners();
    }

    notifyListeners();
  }

// Registration Api..
  var registrationMsg = '';
  bool isRegistrationdata = false;
  Future registrationApi(var email, var termsCondition) async {
    try {
      isRegistrationdata = true;
      var headers = {'Authorization': GetData.Token};
      var request = http.MultipartRequest('PATCH', Uri.parse(ApiClient.updateDataUrl + Preference.pref.getString(UserData.USER_ID)));
      request.fields.addAll({
        'dietaryAndOthers': '',
        'favIngredient': '',
        'dislikeIngredient': '',
        'imageName': '',
        'address': '',
        'flatAddress': '',
        'postCode': '',
        'contact': '',
        'instruction': '',
        'email': email.toString(),
        'userName': '',
        'password': '',
        // 'mobileNo': GetData.userMobileNumber.toString(),
        'termsConditions': termsCondition.toString()
      });

      request.headers.addAll(headers);

      http.StreamedResponse response = await request.send();

      var data = json.decode(await response.stream.bytesToString());

      if (response.statusCode == 200) {
        if (data['status']) {
          Preference.pref.setString(UserData.USER_EMAIL, data['result']['email']);
          Preference.pref.setBool(UserData.TERMS_CONDITIONS, data['result']['termsConditions']);
          if (data['result']['termsConditions'] == false && data['result']['is_registered'] == true) {
            pushTo(terms_conditions_welcome());
          } else if (data['result']['termsConditions'] == true && data['result']['is_registered'] == true) {
            pustAndRemoveUntil(bottom_navbar());
          }
          isRegistrationdata = false;
          notifyListeners();
          return data;
        } else {
          registrationMsg = data['message'].toString();
        }
      } else {
        isRegistrationdata = false;
        registrationMsg = data['message'].toString();
        notifyListeners();
      }
    } catch (e) {
      isRegistrationdata = false;
      registrationMsg = "server error";
    }
    notifyListeners();
  }

// resedOTp Api ...
  bool isresendotp = false;
  var resend_status_code;
  Future resendOTPApi(BuildContext context) async {
    try {
      isresendotp = true;
      var response = await http.post(Uri.parse(ApiClient.resendOTPurl + Preference.pref.getString(UserData.USER_ID)));
      var data = json.decode(response.body.toString());

      if (response.statusCode == 200) {
        resend_status_code = response.statusCode;
        if (data['status']) {
          otpverificationMsg = '';
          isresendotp = false;

          customSnackbar("New code sent");
          notifyListeners();
          return data;
        }
      } else if (response.statusCode == 401) {
        resend_status_code = response.statusCode;
        otpverificationMsg = data['message'].toString();
        isresendotp = false;
        notifyListeners();
        return data;
      } else {
        otpverificationMsg = data['message'].toString();
      }
    } catch (e) {
      otpverificationMsg = "server error";
      notifyListeners();
      isresendotp = false;
    }
    notifyListeners();
  }
}

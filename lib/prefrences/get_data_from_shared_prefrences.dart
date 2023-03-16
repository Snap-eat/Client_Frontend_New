// ignore_for_file: constant_identifier_names, non_constant_identifier_names, file_names
import 'package:snapeat1/prefrences/shared_prefrences.dart';

// All get data from SharedPrefrences...
class GetData {
  static var Token = Preference.pref.getString(UserData.TOKEN).toString();
  static var user_id = Preference.pref.getString(UserData.USER_ID).toString();
  static var user_email =
      Preference.pref.getString(UserData.USER_EMAIL).toString();
  static var userMobileNumber =
      Preference.pref.getString(UserData.USER_MOBILE_NUMBER).toString();
  static var isRegister =
      Preference.pref.getString(UserData.IS_REGISTER).toString();
  static var terms_condition =
      Preference.pref.getBool(UserData.TERMS_CONDITIONS);
  static var dial_code =
      Preference.pref.getString(UserData.DIAL_CODE.toString());
  static var country_code =
      Preference.pref.getString(UserData.COUNTRY_CODE.toString());
}

// ignore_for_file: file_names, prefer_interpolation_to_compose_strings

const baseurl = "http://54.160.185.169:8000/api/v1/";

class ApiClient {
  static const sendOTPUrl = baseurl + "register";
  static const otpVerifyUrl = baseurl + "verify/";
  static const updateDataUrl = baseurl + "profileupdate/";
  static const resendOTPurl = baseurl + "resendotp/";
}

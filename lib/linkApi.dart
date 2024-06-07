class AppLink {

  static const String server = "https://checkup.azad.digital/api";
  static const String test = "$server/test.php";



// ================================= Auth ========================== //

  static const String signUp = "$server/send-otp-for-registration";
  static const String logIn = "$server/login";
  static const String registeration_otp = "$server/register";
  static const String logout = "$server/logout";

  // Reset Password
  static const String send_otp_for_reset_password = "$server/send-otp-for-reset-password";
  static const String validate_otp = "$server/validate-otp";
  static const String reset_password = "$server/reset-password";

// ================================= Questions ========================== //

  static const String getQuestions = "$server/questions";
  static const String getUserInfo = "$server/user";
  static const String postAnswer = "$server/questions-submit";
  static const String postOCT = "$server/oct-submit";

}


/// class ini berisikan kumpulan url yang digunakan API
class ApiUrl {
  // static String proBaseUrl =
  //     'https://virtserver.swaggerhub.com/GERYSASTRAWAN123/DIGO/1.0.0/';
  static String proBaseUrl = 'http://goapi.kuroyamii.works/';
  // Auth area
  static String signUp = 'auth/signup';
  static String signIn = 'auth/signin';
  static String verificationCode = 'auth/otp/validate';
  static String resendPin = 'auth/otp/resend';
  static String forgotPassword = 'auth/forgot-password';
  static String newPassword = 'auth/new-password';

  // Account area
  static String accountProfile = 'users';
  static String changePassword = 'users/change-password';
  static String updateProfile = 'users';
}

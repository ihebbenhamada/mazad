class AppRoutes {
  AppRoutes._();

  /// INTRO
  static const String intro = '/intro';

  /// AUTHENTICATION
  static const String login = '/login';
  static const String signup = '/signup';
  static const String resetPasswordPhone = '/resetPasswordPhone';
  static const String resetPassword = '/resetPassword';
  static const String createPassword = '/createPassword';
  static const String phoneNumber = '/phoneNumber';
  static const String verificationCode = '/verificationCode';

  /// MAIN
  static const String main = '/main';
  static const String home = '/home';
  static const String delivery = '/delivery';
  static const String notification = '/notification';
  static const String profile = '/profile';
  static const String addService = '/addService';
  static const String findDeliveryAgentWaiting = '/findDeliveryAgentWaiting';
  static const String findDeliveryAgentDone = '/findDeliveryAgentDone';
  static const String accountInfo = '/accountInfo';
  static const String language = '/language';
  static const String contact = '/contact';
  static const String faq = '/faq';
  static const String privacyPolicy = '/privacyPolicy';
  static const String gallery = '/gallery';

  /// DRIVER
  static const String driverDelivery = '/driverDelivery';
  static const String driverDeliveryDetails = '/driverDeliveryDetails';
  static const String driverActivities = '/driverActivities';
  static const String driverEarnings = '/driverEarnings';
  static const String driverHistory = '/driverHistory';
  static const String driverOrderDetails = '/driverOrderDetails';
  static const String driverMapDelivery = '/driverMapDelivery';
}

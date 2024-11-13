// import 'package:valetparking_subowner/features/auth/presentation/screens/fill_your_profile_screen.dart';
import 'package:valetparking_subowner/features/auth/presentation/screens/login_screen.dart';
import 'package:valetparking_subowner/features/auth/presentation/screens/otp_in_create_and_login_screen.dart';
import 'package:valetparking_subowner/features/home/presentation/screens/all_drivers/all_drivers_screen.dart';
import 'package:valetparking_subowner/features/home/presentation/screens/all_drivers_attendace/all_drivers_attendance_screen.dart';
import 'package:valetparking_subowner/features/home/presentation/screens/all_drivers_attendace/attendance_in_end_screen.dart';
import 'package:valetparking_subowner/features/home/presentation/screens/all_drivers_attendace/attendance_in_start_screen.dart';
import 'package:valetparking_subowner/features/home/presentation/screens/all_orders/all_orders_screen.dart';
import 'package:valetparking_subowner/features/home/presentation/screens/all_orders/parking_tiket_screen.dart';
import 'package:valetparking_subowner/features/home/presentation/screens/all_orders/parking_timer_screen.dart';
import 'package:valetparking_subowner/features/home/presentation/screens/all_users/all_users_screen.dart';
// import 'package:valetparking_subowner/features/auth/presentation/screens/password_configuration/create_new_password_screen.dart';
// import 'package:valetparking_subowner/features/auth/presentation/screens/password_configuration/enter_email_screen.dart';
// import 'package:valetparking_subowner/features/auth/presentation/screens/password_configuration/forget_password_screen.dart';
// import 'package:valetparking_subowner/features/get_all_orders_by_specific_garage/presentation/screens/parking_timer_screen.dart';
// import 'package:valetparking_subowner/features/home/presentation/screens/add_new_user/add_new_user_screen.dart';
// import 'package:valetparking_subowner/features/home/presentation/screens/add_new_user/choice_date_and_time_screen.dart';
// import 'package:valetparking_subowner/features/home/presentation/screens/add_new_user/choice_passenger_screen.dart';
// import 'package:valetparking_subowner/features/home/presentation/screens/add_new_user/parking_tiket_screen.dart';
// import 'package:valetparking_subowner/features/home/presentation/screens/add_new_user/review_sammary_screen.dart';
// import 'package:valetparking_subowner/features/home/presentation/screens/scan/scan_screen.dart';
import 'package:valetparking_subowner/features/onboarding/screens/onboarding_screen.dart';
import 'package:valetparking_subowner/features/onboarding/screens/welcome_screen.dart';
// import 'package:valetparking_subowner/features/booking/presentation/screens/parking_timer_screen.dart';
// import 'package:valetparking_subowner/features/home/presentation/screens/choice_date_and_time_screen.dart';
// import 'package:valetparking_subowner/features/home/presentation/screens/choice_passenger_screen.dart';
// import 'package:valetparking_subowner/features/home/presentation/screens/parking_tiket_screen.dart';
// import 'package:valetparking_subowner/features/home/presentation/screens/place_details_screens.dart';
// import 'package:valetparking_subowner/features/home/presentation/screens/review_sammary_screen.dart';
// import 'package:valetparking_subowner/features/onboarding/screens/onboarding_screen.dart';
// import 'package:valetparking_subowner/features/onboarding/screens/welcome_screen.dart';
// import 'package:valetparking_subowner/features/profile/presentation/screens/change_password/change_password_screen.dart';
import 'package:valetparking_subowner/features/profile/presentation/screens/edit_profile/edit_profile_screen.dart';
import 'package:valetparking_subowner/features/profile/presentation/screens/privacy_policy/privacy_policy_screen.dart';
import 'package:valetparking_subowner/features/profile/presentation/screens/wallet/wallet_screen.dart';
import 'package:valetparking_subowner/features/splash/screens/splash_screen.dart';
import 'package:valetparking_subowner/navigation_menu.dart';
import 'package:valetparking_subowner/utils/constants/exports.dart';

class RouteGenerator {
  static Route<dynamic> getRoute(RouteSettings settings) {
    switch (settings.name) {
      case VRoutesName.splashRoute:
        return PageTransition(
          child: const SplashScreen(),
          type: PageTransitionType.rightToLeft,
          settings: settings,
          duration: const Duration(milliseconds: 500),
          reverseDuration: const Duration(milliseconds: 500),
        );
      case VRoutesName.welcomeRoute:
        return PageTransition(
          child: const WelcomeScreen(),
          type: PageTransitionType.rightToLeft,
          settings: settings,
          duration: const Duration(milliseconds: 500),
          reverseDuration: const Duration(milliseconds: 500),
        );
      case VRoutesName.onBoardingRoute:
        return PageTransition(
          child: const OnBoardingScreen(),
          type: PageTransitionType.rightToLeft,
          settings: settings,
          duration: const Duration(milliseconds: 500),
          reverseDuration: const Duration(milliseconds: 500),
        );
      // case VRoutesName.createAccountRoute:
      //   return PageTransition(
      //     child: const CreateAccountScreen(),
      //     type: PageTransitionType.rightToLeft,
      //     settings: settings,
      //     duration: const Duration(milliseconds: 500),
      //     reverseDuration: const Duration(milliseconds: 500),
      //   );
      // case VRoutesName.fillYourRoute:
      //   // String phoneNumber = settings.arguments as String;
      //
      //   return PageTransition(
      //     child: const FillYourProfileScreen(),
      //     // child: FillYourProfileScreen(phoneNumber: phoneNumber),
      //     type: PageTransitionType.rightToLeft,
      //     settings: settings,
      //     duration: const Duration(milliseconds: 500),
      //     reverseDuration: const Duration(milliseconds: 500),
      //   );
      case VRoutesName.loginAccountRoute:
        return PageTransition(
          child: const LoginScreen(),
          type: PageTransitionType.rightToLeft,
          settings: settings,
          duration: const Duration(milliseconds: 500),
          reverseDuration: const Duration(milliseconds: 500),
        );
      // case VRoutesName.forgetPasswordRoute:
      //   return PageTransition(
      //     child: const ForgetPasswordScreen(),
      //     type: PageTransitionType.rightToLeft,
      //     settings: settings,
      //     duration: const Duration(milliseconds: 500),
      //     reverseDuration: const Duration(milliseconds: 500),
      //   );
      // case VRoutesName.enterEmailRoute:
      //   return PageTransition(
      //     child: const EnterEmailScreen(),
      //     type: PageTransitionType.rightToLeft,
      //     settings: settings,
      //     duration: const Duration(milliseconds: 500),
      //     reverseDuration: const Duration(milliseconds: 500),
      //   );
      // case VRoutesName.enterNewPasswordRoute:
      //   return PageTransition(
      //     child: const CreateNewPasswordScreen(),
      //     type: PageTransitionType.rightToLeft,
      //     settings: settings,
      //     duration: const Duration(milliseconds: 500),
      //     reverseDuration: const Duration(milliseconds: 500),
      //   );
      case VRoutesName.otpRoute:
        // String emailAddress = settings.arguments as String;
      Map data = settings.arguments as Map;

        return PageTransition(
          child: OtpInCreateAndLoginScreen(data: data),
          type: PageTransitionType.rightToLeft,
          settings: settings,
          duration: const Duration(milliseconds: 500),
          reverseDuration: const Duration(milliseconds: 500),
        );
      case VRoutesName.navigationMenuRoute:
        int index = settings.arguments as int;

        return PageTransition(
          child: NavigationMenu(index: index),
          type: PageTransitionType.rightToLeft,
          settings: settings,
          duration: const Duration(milliseconds: 500),
          reverseDuration: const Duration(milliseconds: 500),
        );
      // case VRoutesName.placeDetailsRoute:
      //   return PageTransition(
      //     child: const PlaceDetailsScreens(),
      //     type: PageTransitionType.rightToLeft,
      //     settings: settings,
      //     duration: const Duration(milliseconds: 500),
      //     reverseDuration: const Duration(milliseconds: 500),
      //   );
      // case VRoutesName.choiceYourPassenger:
      //   Map map = settings.arguments as Map;
      //
      //   return PageTransition(
      //     child: ChoicePassengersScreen(map: map),
      //     type: PageTransitionType.rightToLeft,
      //     settings: settings,
      //     duration: const Duration(milliseconds: 500),
      //     reverseDuration: const Duration(milliseconds: 500),
      //   );
      // case VRoutesName.choiceDataAndTimeRoute:
      //   Map map = settings.arguments as Map;
      //
      //   return PageTransition(
      //     child: ChoiceDateAndTimeScreen(map: map),
      //     type: PageTransitionType.rightToLeft,
      //     settings: settings,
      //     duration: const Duration(milliseconds: 500),
      //     reverseDuration: const Duration(milliseconds: 500),
      //   );
      // case VRoutesName.reviewSummaryRoute:
      //   return PageTransition(
      //     child: const ReviewSummaryScreen(),
      //     type: PageTransitionType.rightToLeft,
      //     settings: settings,
      //     duration: const Duration(milliseconds: 500),
      //     reverseDuration: const Duration(milliseconds: 500),
      //   );
      case VRoutesName.parkingTicketRoute:
        final String orderId = settings.arguments as String;

        return PageTransition(
          child: ParkingTicketScreen(orderId: orderId),
          type: PageTransitionType.rightToLeft,
          settings: settings,
          duration: const Duration(milliseconds: 500),
          reverseDuration: const Duration(milliseconds: 500),
        );
      case VRoutesName.parkingTimerRoute:
        Map data = settings.arguments as Map;

        return PageTransition(
          child: ParkingTimerScreen(data: data),
          type: PageTransitionType.rightToLeft,
          settings: settings,
          duration: const Duration(milliseconds: 500),
          reverseDuration: const Duration(milliseconds: 500),
        );
      case VRoutesName.walletRoute:
        return PageTransition(
          child: const WalletScreen(),
          type: PageTransitionType.rightToLeft,
          settings: settings,
          duration: const Duration(milliseconds: 500),
          reverseDuration: const Duration(milliseconds: 500),
        );
      case VRoutesName.editProfileRoute:
        return PageTransition(
          child: const EditProfileScreen(),
          type: PageTransitionType.rightToLeft,
          settings: settings,
          duration: const Duration(milliseconds: 500),
          reverseDuration: const Duration(milliseconds: 500),
        );
      // case VRoutesName.changePasswordRoute:
      //   return PageTransition(
      //     child: const ChangePasswordScreen(),
      //     type: PageTransitionType.rightToLeft,
      //     settings: settings,
      //     duration: const Duration(milliseconds: 500),
      //     reverseDuration: const Duration(milliseconds: 500),
      //   );
      case VRoutesName.allOrdersRoute:
        return PageTransition(
          child: const AllOrdersScreen(),
          type: PageTransitionType.rightToLeft,
          settings: settings,
          duration: const Duration(milliseconds: 500),
          reverseDuration: const Duration(milliseconds: 500),
        );
      case VRoutesName.allUsersRoute:
        return PageTransition(
          child: const AllUsersScreen(),
          type: PageTransitionType.rightToLeft,
          settings: settings,
          duration: const Duration(milliseconds: 500),
          reverseDuration: const Duration(milliseconds: 500),
        );
      case VRoutesName.allDriversRoute:
        return PageTransition(
          child: const AllDriversScreen(),
          type: PageTransitionType.rightToLeft,
          settings: settings,
          duration: const Duration(milliseconds: 500),
          reverseDuration: const Duration(milliseconds: 500),
        );
      case VRoutesName.attendanceInStart:
        return PageTransition(
          child: const AttendanceInStartScreen(),
          type: PageTransitionType.rightToLeft,
          settings: settings,
          duration: const Duration(milliseconds: 500),
          reverseDuration: const Duration(milliseconds: 500),
        );
      case VRoutesName.attendanceInEnd:
        return PageTransition(
          child: const AttendanceInEndScreen(),
          type: PageTransitionType.rightToLeft,
          settings: settings,
          duration: const Duration(milliseconds: 500),
          reverseDuration: const Duration(milliseconds: 500),
        );
      case VRoutesName.allDriversAttendanceRoute:
        return PageTransition(
          child: const AllDriversAttendanceScreen(),
          type: PageTransitionType.rightToLeft,
          settings: settings,
          duration: const Duration(milliseconds: 500),
          reverseDuration: const Duration(milliseconds: 500),
        );
      // case VRoutesName.addNewUserRoute:
      //   return PageTransition(
      //     child: const AddNewUserScreen(),
      //     type: PageTransitionType.rightToLeft,
      //     settings: settings,
      //     duration: const Duration(milliseconds: 500),
      //     reverseDuration: const Duration(milliseconds: 500),
      //   );
      case VRoutesName.privacyPolicyRoute:
        return PageTransition(
          child: const PrivacyPolicyScreen(),
          type: PageTransitionType.rightToLeft,
          settings: settings,
          duration: const Duration(milliseconds: 500),
          reverseDuration: const Duration(milliseconds: 500),
        );
      default:
        return unDefinedRoute();
    }
  }

  /// Un Defined Route
  static Route<dynamic> unDefinedRoute() {
    return MaterialPageRoute(
      builder: (_) => Scaffold(
        appBar: AppBar(
          title: const Text(
            '',
          ),
        ),
        body: const Center(
          child: Text(
            '',
          ),
        ),
      ),
    );
  }
}
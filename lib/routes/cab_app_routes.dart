import 'package:cab_express/cab_splash_screen.dart';
import 'package:cab_express/controller/customer_dashboard_controller/binding.dart';
import 'package:cab_express/controller/login_controller/binding.dart';
import 'package:cab_express/controller/sign_up_controller/binding.dart';
import 'package:cab_express/ui/auth_screens/cab_login_screen.dart';
import 'package:cab_express/ui/auth_screens/cab_sign_up_screen.dart';
import 'package:cab_express/ui/customer_screens/home_screens/cab_customer_home_screen.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';

class CabAppRoutes {
  static const cabRoot = '/';
  static const cabLoginScreen = '/cab/login/screen';
  static const cabSignupScreen = '/cab/signup/screen';
  static const cabCustomerDashboardScreen = '/cab/customer/dashboard/screen';
  static const cabDriverDashboardScreen = '/cab/driver/dashboard/screen';

  static final routes = <GetPage>[
    GetPage(name: cabRoot, page: () => const CabSplashScreen()),

    GetPage(
      name: cabLoginScreen,
      page: () => const CabLoginScreen(),
      binding: const LoginControllerBinding(),
    ),
    GetPage(
      name: cabSignupScreen,
      page: () => const CabSignUpScreen(),
      binding: const SignupControllerBinding(),
    ),
    GetPage(
      name: cabCustomerDashboardScreen,
      page: () => const CabCustomerHomeScreen(),
      binding: const CustomerDashboardControllerBinding(),
    ),
    // GetPage(
    //   name: hrmsManageEmployeesScreen,
    //   page: () => const HRMSManageEmployeesScreen(),
    //   binding: const ManageEmployeesControllerBinding(),
    // ),
    // GetPage(
    //   name: hrmsCreateUpdateEmployeeScreen,
    //   page: () => const HRMSCreateUpdateEmployeeScreen(),
    //   binding: const CreateUpdateEmployeesControllerBinding(),
    // )
  ];
}

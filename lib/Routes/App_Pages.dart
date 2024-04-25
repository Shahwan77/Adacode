import 'package:adacode/Presentations/Profile/Binding/ProfileBinding.dart';
import 'package:adacode/Presentations/Profile/ProfilePage.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';
import '../Presentations/Employee/EmployeeLog_In/Bindings/LoginBindings.dart';
import '../Presentations/Employee/EmployeeLog_In/LoginPage.dart';
import '../Presentations/Employee/EmployeeNavBar/Binding/NavBarBinding.dart';
import '../Presentations/Employee/EmployeeNavBar/NavBarPage.dart';
import '../Presentations/Employee/EmployeeSign_up/Bindings/SignupBindings.dart';
import '../Presentations/Employee/EmployeeSign_up/SignPage.dart';
import '../Presentations/Employee/employeeChats/Bindings/ChatBinding.dart';
import '../Presentations/Employee/employeeChats/ChatPage.dart';
import '../Presentations/Employer/Chats/Bindings/ChatBinding.dart';
import '../Presentations/Employer/Chats/ChatPage.dart';
import '../Presentations/Employer/Log_In/Bindings/LoginBindings.dart';
import '../Presentations/Employer/Log_In/LoginPage.dart';
import '../Presentations/Employer/NavBar/Binding/NavBarBinding.dart';
import '../Presentations/Employer/NavBar/NavBarPage.dart';
import '../Presentations/Employer/Sign_up/Bindings/SignupBindings.dart';
import '../Presentations/Employer/Sign_up/SignPage.dart';
import '../Presentations/Welcome/Binding/WelcomeBinding.dart';
import '../Presentations/Welcome/WelcomePage.dart';
import 'App_Routes.dart';

class AppPages {
  static var Lists = [
    GetPage(
      name: AppRoutes.Welcome,
      page: () => WelcomePage(),
      binding: WelcomeBinding(),
    ),
    GetPage(
      name: AppRoutes.Sign_up,
      page: () => SignupPage(),
      binding: SignupBinding(),
    ),
    GetPage(
      name: AppRoutes.Log_in,
      page: () => LoginPage(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: AppRoutes.EmployeeSign_up,
      page: () => employeeSignupPage(),
      binding: employeeSignupBinding(),
    ),
    GetPage(
      name: AppRoutes.EmployeeLog_In,
      page: () => employeeLoginPage(),
      binding: employeeLoginBinding(),
    ),
    // GetPage(
    //   name: AppRoutes.NavBar,
    //   page: () => NavBarPage(),
    //   binding: NavBarBinding(),
    // ),
    GetPage(
      name: AppRoutes.EmployeeNavBar,
      page: () => employeeNavBarPage(),
      binding: employeeNavBarBinding(),
    ),
    GetPage(
      name: AppRoutes.Chats,
      page: () => ChatScreen(),
      binding: ChatBinding(),
    ),
    GetPage(
      name: AppRoutes.Chats,
      page: () => ChatScreen(),
      binding: ChatBinding(),
    ),
    GetPage(
      name: AppRoutes.EmployeeChats,
      page: () => employeeChatScreen(),
      binding: employeeChatBinding(),
    ),
    GetPage(
      name: AppRoutes.Profile,
      page: () => ProfilePage(),
      binding: ProfileBinding(),
    ),
  ];
}

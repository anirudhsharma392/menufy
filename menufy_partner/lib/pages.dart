import 'package:get/get.dart';
import 'package:menufy_partner/view/home/home_binding.dart';
import 'package:menufy_partner/view/home/home_page.dart';
import 'package:menufy_partner/view/registeration/sign_in/otp_page.dart';
import 'package:menufy_partner/view/registeration/sign_in/sign_in_binding.dart';
import 'package:menufy_partner/view/registeration/sign_in/sign_in_page.dart';
const initialRoute = HomePage.route;

final List<GetPage> appPages = [
  GetPage(
      name: SignInPage.route,
      page: () => const SignInPage(),
      binding: SignInBinding()),
  GetPage(
      name: OTPPage.route,
      page: () => const OTPPage(),
      binding: SignInBinding()),
  GetPage(
      name: HomePage.route,
      page: () => const HomePage(),
      binding: HomeBinding()),

];

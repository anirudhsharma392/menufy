import 'package:get/get.dart';
import 'package:menufy_partner/view/registeration/sign_in/sign_in_binding.dart';
import 'package:menufy_partner/view/registeration/sign_in/sign_in_page.dart';
const initialRoute = SignInPage.route;

final List<GetPage> appPages = [
  GetPage(
      name: SignInPage.route,
      page: () => const SignInPage(),
      binding: SignInBinding()),

];

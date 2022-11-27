import 'package:get/get.dart';
import 'package:menufy_partner/view/registeration/sign_in/sign_in_controller.dart';

class SignInBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SignInController>(() => SignInController());
  }
}

import 'package:get/get.dart';
import 'package:menu_maker/view/cart/cart_controller.dart';
import 'package:menu_maker/view/home/home_controller.dart';

class CartBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CartController>(() => CartController());
  }
}

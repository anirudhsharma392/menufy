import 'package:get/get.dart';
import 'package:menu_maker/view/cart/cart_binding.dart';
import 'package:menu_maker/view/cart/cart_page.dart';
import 'package:menu_maker/view/home/home_binding.dart';
import 'package:menu_maker/view/home/home_page.dart';

const initialRoute = HomePage.route;

final List<GetPage> appPages = [
  GetPage(
      name: HomePage.route,
      page: () => const HomePage(),
      binding: HomeBinding()),
  GetPage(
      name: CartPage.route,
      page: () => const CartPage(),
      binding: CartBinding())
];

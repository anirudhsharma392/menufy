import 'package:get/get.dart';
import 'package:menufy_partner/controller/base_controller.dart';

class HomeController extends BaseController {
  RxInt selectedTab = 0.obs;

  onTabChange(int tabIndex) {
    selectedTab.value = tabIndex;
  }
}

import 'package:get/get.dart';
import 'package:menu_maker/controller/central_state.dart';

Future<void> setupState() async {
  Get.lazyPut(() => CentralState(), fenix: true);
}

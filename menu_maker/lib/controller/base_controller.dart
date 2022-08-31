import 'package:get/get.dart';
import 'package:menu_maker/utils/enums.dart';

class BaseController extends GetxController {
  Rx<Status> status = Status.init.obs;

  void _updateStatus(Status newStatus) {
    if (newStatus != status.value) {
      status.value = newStatus;
    }
  }

  void startLoading() {
    _updateStatus(Status.loading);
  }

  void success() {
    _updateStatus(Status.success);
  }

  void error() {
    _updateStatus(Status.error);
  }
}

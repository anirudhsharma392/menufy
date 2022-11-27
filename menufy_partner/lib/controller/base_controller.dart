import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:menufy_partner/controller/user_repo.dart';
import 'package:menufy_partner/theme/theme.dart';
import 'package:menufy_partner/utils/enums.dart';

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

  errorHandler(callBack) async {
    try {
      await callBack();
    } on FirebaseAuthException catch (e) {
      showErrorMessage(e.message);
    } catch (e) {
      showErrorMessage(e.toString());
      debugPrint('Error occurred $callBack');
      debugPrint(e.toString());
    }
  }

  showErrorMessage(message) => showMessage(
      message: message,
      color: AppColors.error,
      icon: Icons.error_outline_rounded);

  showSuccessMessage(message) => showMessage(
      message: message,
      color: AppColors.success,
      icon: Icons.check_circle_rounded);

  showMessage(
      {required String message, required Color color, required IconData icon}) {
    Get.rawSnackbar(
      messageText: Text(
        message,
        style: AppStyle.body1
            .copyWith(color: Colors.white, fontWeight: FontWeight.w500),
      ),
      snackPosition: SnackPosition.TOP,
      margin: const EdgeInsets.all(AppStyle.margin),
      borderRadius: AppStyle.radius,
      icon: Icon(
        icon,
        color: Colors.white,
      ),
      backgroundColor: color.withOpacity(0.8),
      isDismissible: true,
    );
  }
}

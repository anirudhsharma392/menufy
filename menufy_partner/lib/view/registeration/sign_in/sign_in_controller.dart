import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:menufy_partner/controller/base_controller.dart';
import 'package:menufy_partner/controller/central_state.dart';
import 'package:menufy_partner/utils/auth.dart';
import 'package:menufy_partner/utils/exceptions.dart';
import 'package:menufy_partner/view/home/home_page.dart';
import 'package:menufy_partner/view/registeration/sign_in/otp_page.dart';

class SignInController extends BaseController {
  RxBool isNextButtonActive = false.obs;
  RxBool showResendButton = true.obs;
  late final FirebasePhoneAuth _phoneAuth;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    _phoneAuth = FirebasePhoneAuth(onErrorCallback: (FirebaseAuthException e) {
      showErrorMessage(e.message);
    }, onSuccessCallback: (UserCredential cred) {
      CentralState.firebaseUser.setUser(cred.user);
      Get.toNamed(HomePage.route);
    });
  }

  onPhoneChange(String val) {
    _phoneAuth.setPhone(val);
    isNextButtonActive.value = _validatePhoneNumber(val);
  }

  onSubmitPhoneNumber() async {
    await errorHandler(_phoneAuth.signInWithSMS);

    Get.toNamed(OTPPage.route);
  }

  bool _validatePhoneNumber(String val) {
    if (val.length <= 9) return false;
    return true;
  }

  onOTPSubmit(String otp) async {
    await errorHandler(() => _phoneAuth.submitOTP(otp));
  }

  onResendOTP() async {
    try {
      await _phoneAuth.resendSMS();
    } on FirebaseAuthException catch (e) {
      showErrorMessage(e.message);
    } catch (e) {
      showErrorMessage(e.toString());
      debugPrint('Error occurred in onResendOTP');
      debugPrint(e.toString());
    }
    showResendButton.value = false;
    showSuccessMessage("OTP has been sent again");
  }
}

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:get/get.dart';
import 'package:menufy_partner/theme/theme.dart';
import 'package:menufy_partner/utils/constants.dart';
import 'package:menufy_partner/view/registeration/sign_in/sign_in_controller.dart';
import 'package:menufy_partner/widgets/buttons.dart';
import 'package:menufy_partner/widgets/common.dart';

class OTPPage extends GetView<SignInController> {
  static const route = '/otp';
  const OTPPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: AppStyle.padding,
        child: Column(
          children: [
            Container(
              height: AppStyle.margin * 2,
              alignment: Alignment.centerLeft,
              child: const BackButtonWidget(),
            ),
            Container(
              alignment: Alignment.center,
              child: Text(
                Constants.appName,
                style: AppStyle.jumboText.copyWith(fontStyle: FontStyle.italic),
              ),
            ),
            const Space(
              factor: 3,
            ),
            Container(
              alignment: Alignment.centerLeft,
              child: const Text(
                'Enter OTP',
                style: AppStyle.headLine2,
              ),
            ),
            const Space(factor: 0.5),
            Container(
              alignment: Alignment.centerLeft,
              child: const Text(
                "A 6 digit code has been sent to your phone number",
                style: AppStyle.subtitle2,
              ),
            ),
            const Space(factor: 2),
            SizedBox(
              height: 50,
              child: OtpTextField(
                  fieldWidth: 40,
                  filled: true,
                  numberOfFields: 6,
                  borderRadius: AppStyle.borderRadius,
                  borderColor: AppColors.disabled,
                  focusedBorderColor: AppColors.black,
                  keyboardType: TextInputType.phone,
                  //set to true to show as box or false to show as dash
                  showFieldAsBox: true,
                  onSubmit: controller.onOTPSubmit // end onSubmit
                  ),
            ),
            Obx(() => (controller.showResendButton.value)
                ? Column(
                    children: [
                      const Space(factor: 3),
                      const Text("Didn't recieve any OTP ?",
                          style: AppStyle.subtitle2),
                      const SizedBox(
                        height: 4,
                      ),
                      InkWell(
                        onTap: controller.onResendOTP,
                        child: Text("Resend it",
                            style: AppStyle.subtitle1
                                .copyWith(color: AppColors.focus)),
                      ),
                    ],
                  )
                : Container())
          ],
        ),
      )),
    );
  }
}

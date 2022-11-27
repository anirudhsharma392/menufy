import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:menufy_partner/theme/theme.dart';
import 'package:menufy_partner/utils/constants.dart';
import 'package:menufy_partner/view/registeration/sign_in/sign_in_controller.dart';
import 'package:menufy_partner/widgets/buttons.dart';
import 'package:menufy_partner/widgets/common.dart';
import 'package:menufy_partner/widgets/text_field.dart';

class SignInPage extends GetView<SignInController> {
  static const route = '/sign_in';
  const SignInPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: AppStyle.padding,
        child: Column(
          children: [
            const Space(
              factor: 2,
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
                "To register, please verify your phone number",
                style: AppStyle.headLine2,
              ),
            ),
            const Space(factor: 0.5),
            Container(
              alignment: Alignment.centerLeft,
              child: const Text(
                "We will send you an OTP for verification",
                style: AppStyle.subtitle2,
              ),
            ),
            const Space(factor: 2),
            CustomTextField(
              icon: Icons.phone,
              prefix: const Text('+91- '),
              hintText: "(123) 456-789",
              labelText: "Mobile number",
              onChange: controller.onPhoneChange,
            ),
            const Space(factor: 3),
            Obx(() => CustomButton(
                  text: 'Send OTP',
                  onTap: controller.isNextButtonActive.value
                      ? controller.onSubmitPhoneNumber
                      : null,
                )),
            const Space(
              factor: 2,
            ),
          ],
        ),
      )),
    );
  }
}

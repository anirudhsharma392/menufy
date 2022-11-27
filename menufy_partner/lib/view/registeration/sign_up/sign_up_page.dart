import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:menufy_partner/theme/theme.dart';
import 'package:menufy_partner/widgets/buttons.dart';
import 'package:menufy_partner/widgets/common.dart';
import 'package:menufy_partner/widgets/text_field.dart';
import 'package:menufy_partner/utils/images.dart';

class SignUpPage extends StatelessWidget {
  static const route = '/sign_up';
  const SignUpPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Padding(
            padding: AppStyle.padding,
            child: Column(
              children: [
                Space(
                  factor: 2,
                ),
                Container(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Hello,",
                    style: GoogleFonts.notoSans(
                        fontSize: 32,
                        fontWeight: FontWeight.w600,
                        color: AppColors.black),
                  ),
                ),
                Container(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Sign in to your account",
                    style: GoogleFonts.notoSans(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        color: AppColors.black),
                  ),
                ),
                Space(factor: 2),
                CustomTextField(
                  icon: Icons.mail_outline_rounded,
                ),
                Space(),
                CustomTextField(
                  labelText: "Password",
                  icon: Icons.lock_outline_rounded,
                ),
                Space(factor: 3),
                //CustomButton(),
                Space(
                  factor: 2,
                ),
                GestureDetector(
                  onTap: () {},
                  child: RichText(
                    text: const TextSpan(
                      style: AppStyle.body1,
                      children: <TextSpan>[
                        TextSpan(
                          text: 'Don\'t have an account? ',
                        ),
                        TextSpan(
                            text: 'Sign up ',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 16)),
                      ],
                    ),
                  ),
                ),
                Space(factor: 3),
                DividerText(),
                Space(
                  factor: 3,
                ),
                GoogleButton(),
              ],
            ),
          )),
    );
  }
}

class GoogleButton extends StatelessWidget {
  const GoogleButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 55,
      decoration: BoxDecoration(
        borderRadius: AppStyle.borderRadius,
        border: Border.all(color: AppColors.blackLightest),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            AppImages.google,
            height: 24,
          ),
          const SizedBox(width: 16),
          Text("Login with google",
              style: AppStyle.body1.copyWith(fontSize: 16))
        ],
      ),
    );
  }
}

class DividerText extends StatelessWidget {
  const DividerText({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Flexible(
          child: Container(
            color: Theme.of(context).dividerColor,
            height: 1,
          ),
        ),
        const SizedBox(width: 16),
        Text(
          "Or",
          style: AppStyle.body1,
        ),
        const SizedBox(width: 16),
        Flexible(
          child: Container(
            color: Theme.of(context).dividerColor,
            height: 1,
          ),
        ),
      ],
    );
  }
}

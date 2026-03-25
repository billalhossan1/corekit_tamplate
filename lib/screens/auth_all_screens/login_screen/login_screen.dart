import 'package:core_kit/core_kit.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ride_sharing/gen/assets.gen.dart';
import 'package:ride_sharing/widgets/app_default_template.dart';
import 'package:ride_sharing/widgets/common_text_style.dart';

import '../../../constant/app_colors.dart';
import '../../../routes/app_routes.dart';
import '../../../utils/app_size.dart';
import '../../../widgets/app_textfiled_header.dart';
import '../../../widgets/auth_common_header.dart';
import 'controller/login_screen_controller.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    AppSize.size = MediaQuery.of(context).size;

    return GetBuilder<LoginScreenController>(
      init: LoginScreenController(),
      builder: (controller) {
        return AppDefaultTemplate(
          body: Form(
            key: controller.formKey,
            child: SafeArea(
              child: Column(
                crossAxisAlignment: .center,
                children: [
                  CommonImage(src: Assets.logo.appLogo, height: 96, width: 96),
                  20.height,
                  AuthCommonHeader(
                    title: 'Welcome back!',
                    subTitle: 'Login to manage your hub and services.',
                  ),
                  24.height,
                  Align(
                    alignment: .centerLeft,
                    child: AppTextFiledHeader(text: 'Email Address'),
                  ),
                  12.height,
                  CommonTextField(validationType: .validateEmail),

                  16.height,

                  Align(
                    alignment: .centerLeft,
                    child: AppTextFiledHeader(text: 'Password'),
                  ),
                  12.height,
                  CommonTextField(
                    validationType: .validatePassword,
                    textInputAction: .done,
                  ),
                  8.height,
                  Align(
                    alignment: .centerRight,
                    child: CommonText(
                      text: 'Forget Password?',
                      textColor: AppColors.instance.error,
                      fontSize: 16,
                      fontWeight: .w500,
                    ),
                  ),
                  48.height,
                  CommonButton(titleText: 'Login'),
                  Spacer(),
                  RichText(
                    text: TextSpan(
                      style: CommonTextStyle.commonTextStyle(),
                      text: "Don't have an account? ",
                      children: [
                        TextSpan(
                          text: 'Register Now',
                          style: CommonTextStyle.commonTextStyle(color: AppColors.instance.primary)
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

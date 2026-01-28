import 'package:core_kit/core_kit.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../constant/app_assert_image.dart';
import '../../../constant/app_colors.dart';
import '../../../routes/app_routes.dart';
import '../../../utils/app_size.dart';
import 'controller/login_screen_controller.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: LoginScreenController(),
      builder: (controller) {
        return Scaffold(
          body: SafeArea(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: AppSize.width(value: 20.0)),
              child: SizedBox(
                width: AppSize.size.width,
                child: Form(
                  key: controller.formKey,
                  child: SingleChildScrollView(
                    child: Column(
                      spacing: AppSize.height(value: 30),
                      children: [
                        10.height,
                        CommonImage(src: AppAssertImage.instance.logo, width: AppSize.size.width * 0.6),

                        Column(
                          children: [
                            CommonText(text: "Welcome!", fontSize: 40, fontWeight: FontWeight.w500),

                            CommonText(text: "Sign in to continue", fontSize: 25, fontWeight: FontWeight.w200),
                            20.height,
                          ],
                        ),

                        SizedBox(
                          height: AppSize.size.height * 0.3,
                          child: Column(
                            children: [
                              CommonTextField(
                                controller: controller.emailTextEditingController,
                                borderColor: AppColors.instance.boxBg,
                                labelText: "Email",
                                hintText: "Enter your email",
                                textInputAction: TextInputAction.next,
                                validationType: ValidationType.validateEmail,
                              ),
                              20.height,
                              CommonTextField(
                                controller: controller.passwordTextEditingController,
                                borderColor: AppColors.instance.boxBg,
                                labelText: "Password",
                                hintText: "Enter your password",
                                validationType: ValidationType.validatePassword,
                                textInputAction: TextInputAction.done,
                              ),
                              20.height,
                              Align(
                                alignment: Alignment.centerRight,
                                child: GestureDetector(
                                  onTap: () {
                                    Get.toNamed(AppRoutes.instance.forgotScreen);
                                  },
                                  child: CommonText(text: "Forgot Password?", textColor: AppColors.instance.primary500, fontWeight: FontWeight.bold, fontSize: 16),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Column(
                          children: [
                            CommonButton(
                              titleText: "Login",
                              onTap: () {
                                controller.checkValidation();
                              },
                            ),

                            20.height,
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                CommonText(text: "Don't have an account? ", textColor: AppColors.instance.dark200, fontSize: 16),
                                GestureDetector(
                                  onTap: () {
                                    Get.toNamed(AppRoutes.instance.signUpScreen);
                                  },
                                  child: CommonText(text: "Sign up", textColor: AppColors.instance.primary500, fontSize: 16, fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                          ],
                        ),
                        50.height,
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}

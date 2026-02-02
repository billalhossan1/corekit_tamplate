import 'package:core_kit/core_kit.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ride_sharing/gen/assets.gen.dart';

import '../../../constant/app_colors.dart';
import '../../../routes/app_routes.dart';
import '../../../utils/app_size.dart';
import 'controller/login_screen_controller.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    AppSize.size = MediaQuery.of(context).size;

    return GetBuilder<LoginScreenController>(
      init: LoginScreenController(),
      builder: (controller) {
        return Scaffold(
          resizeToAvoidBottomInset: true,
          body: Form(
            key: controller.formKey,
            child: Stack(
              children: [
                /// 🔹 BACKGROUND (Fixed)
                Column(
                  children: [
                    SizedBox(
                      height: AppSize.size.height * 0.5,
                      child: Container(
                        color: AppColors.instance.primary,
                      ),
                    ),
                    SizedBox(
                      height: AppSize.size.height * 0.5,
                      child: Container(
                        color: AppColors.instance.white,
                      ),
                    ),
                  ],
                ),

                /// 🔹 CONTENT (Scrollable & Above Background)
                Positioned.fill(
                  child: Center(
                    child: SingleChildScrollView(
                      keyboardDismissBehavior:
                      ScrollViewKeyboardDismissBehavior.onDrag,
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: AppSize.width(value: 20),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            
                            CommonImage(src: Assets.images.img.path, height: 40, width: 90,fill: BoxFit.contain,),
                          10.height,

                          Container(
                            decoration: BoxDecoration(
                              color: AppColors.instance.whiteLow,
                              borderRadius: BorderRadius.circular(10),
                              boxShadow: [
                                BoxShadow(
                                  color:
                                  AppColors.instance.dark200
                                      .withOpacity(0.2),
                                  blurRadius: 10,
                                  offset: const Offset(0, 5),
                                ),
                              ],
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                children: [
                                  /// 🔹 HEADER
                                  Column(
                                    children: [
                                      CommonText(

                                        text: "Sign in now",
                                        fontSize: 18,
                                        fontWeight: FontWeight.w500,
                                      ),
                                      8.height,
                                      CommonText(
                                        text: "Please sign in to continue our app",
                                        fontSize: 14,
                                        fontWeight: FontWeight.w200,
                                      ),
                                      const SizedBox(height: 30),
                                    ],
                                  ),
                                  10.height,
                                  /// 🔹 EMAIL
                                  CommonTextField(
                                    // controller: controller
                                    //     .emailTextEditingController,
                                    borderColor: AppColors.instance.boxBg,
                                    labelText: "Email",
                                    hintText: "Enter your email",
                                    textInputAction: TextInputAction.next,
                                    validationType:
                                    ValidationType.validateEmail,
                                  ),

                                  const SizedBox(height: 20),

                                  /// 🔹 PASSWORD
                                  CommonTextField(
                                    // controller: controller
                                    //     .passwordTextEditingController,
                                    borderColor: AppColors.instance.boxBg,
                                    labelText: "Password",
                                    hintText: "Enter your password",
                                    validationType:
                                    ValidationType.validatePassword,
                                    textInputAction: TextInputAction.done,
                                  ),

                                  const SizedBox(height: 15),

                                  /// 🔹 FORGOT PASSWORD
                                  Align(
                                    alignment: Alignment.centerRight,
                                    child: GestureDetector(
                                      onTap: () {
                                        Get.toNamed(
                                          AppRoutes.instance.forgotScreen,
                                        );
                                      },
                                      child: CommonText(
                                        text: "Forgot Password?",
                                        textColor: AppColors
                                            .instance.primary500,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16,
                                      ),
                                    ),
                                  ),

                                  const SizedBox(height: 30),

                                  /// 🔹 LOGIN BUTTON
                                  CommonButton(
                                    titleText: "Login",
                                    onTap: controller.checkValidation,
                                  ),

                                  const SizedBox(height: 20),

                                ],
                              ),
                            ),
                          ),
                            /// 🔹 SIGN UP
                            Row(
                              mainAxisAlignment:
                              MainAxisAlignment.center,
                              children: [
                                CommonText(
                                  text:
                                  "Don't have an account? ",
                                  textColor:
                                  AppColors.instance.dark200,
                                  fontSize: 16,
                                ),
                                GestureDetector(
                                  onTap: () {
                                    Get.toNamed(
                                      AppRoutes.instance.signUpScreen,
                                    );
                                  },
                                  child: CommonText(
                                    text: "Sign up",
                                    textColor: AppColors
                                        .instance.primary500,
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),

                            const SizedBox(height: 50),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

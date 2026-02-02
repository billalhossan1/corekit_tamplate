import 'dart:ui';

import 'package:core_kit/core_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../../constant/app_colors.dart';
import '../../gen/assets.gen.dart';
import '../../utils/app_size.dart';
import 'controller/on_boarding_screen_controller.dart';

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final curvePosition = screenHeight * 0.45; // This matches the curveHeightRatio in template

    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent, // keep transparent
        statusBarIconBrightness: Brightness.light, // Android (white icons)
        statusBarBrightness: Brightness.dark, // iOS (white icons)
      ),
    );
    return GetBuilder(
      init: OnBoardingScreenController(),
      builder: (controller) {
        return Scaffold(
          body: Stack(
            children: [
              // 🔥 Full-screen background image with smooth transition
              Positioned.fill(
                child: Obx(
                      () => AnimatedSwitcher(
                    duration: const Duration(milliseconds: 600),
                    switchInCurve: Curves.easeInOut,
                    switchOutCurve: Curves.easeInOut,

                    child: SizedBox(
                      key: ValueKey<int>(controller.selectedIndex.value),
                      width: double.infinity,
                      height: double.infinity,
                      child: CommonImage(
                        src: controller.onBoardingImageList[controller.selectedIndex.value],
                        fill: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
              ),



              // Title and Subtitle Glass Container
              Positioned(
                top: curvePosition - AppSize.height(value: 150),
                left: AppSize.width(value: 20),
                right: AppSize.width(value: 20),
                child: Obx(
                  () => Column(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(24),
                        child: BackdropFilter(
                          filter: ImageFilter.blur(sigmaX: 15, sigmaY: 15),
                          child: Container(
                            padding: EdgeInsets.symmetric(
                              horizontal: AppSize.width(value: 24),
                              vertical: AppSize.height(value: 24),
                            ),
                            decoration: BoxDecoration(
                              color: Colors.white.withOpacity(0.15),
                              borderRadius: BorderRadius.circular(24),
                              border: Border.all(
                                color: Colors.white.withOpacity(0.3),
                                width: 1.5,
                              ),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withOpacity(0.1),
                                  blurRadius: 20,
                                  spreadRadius: 5,
                                ),
                              ],
                            ),
                            child: AnimatedSwitcher(
                              duration: const Duration(milliseconds: 400),
                              switchInCurve: Curves.easeInOut,
                              switchOutCurve: Curves.easeInOut,
                              transitionBuilder: (Widget child, Animation<double> animation) {
                                return FadeTransition(
                                  opacity: animation,
                                  child: SlideTransition(
                                    position: Tween<Offset>(
                                      begin: const Offset(0.0, 0.1),
                                      end: Offset.zero,
                                    ).animate(animation),
                                    child: child,
                                  ),
                                );
                              },
                              child: Column(
                                key: ValueKey<int>(controller.selectedIndex.value),
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  CommonText(

                                    text: controller.onBoardingDataList[controller.selectedIndex.value].title,
                                    fontSize: 24,
                                    fontWeight: FontWeight.bold,
                                    textColor: Colors.white,
                                    textAlign: TextAlign.center,
                                  ),
                                  SizedBox(height: AppSize.height(value: 12)),
                                  CommonText(
                                    text: controller.onBoardingDataList[controller.selectedIndex.value].subTitle,
                                    fontSize: 14,
                                    isDescription: true,
                                    fontWeight: FontWeight.w400,
                                    textColor: Colors.white.withOpacity(0.9),
                                    textAlign: TextAlign.center,
                                    height: 1.5,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                      80.height,

                      CommonButton(
                        buttonWidth: double.infinity,
                        buttonColor: AppColors.instance.whiteButton,
                        borderColor: AppColors.instance.whiteButton,
                        onTap: controller.onTapNext,
                        titleText: 'Next',
                        titleColor: AppColors.instance.textGrey,
                      ),
                      12.height,

                      CommonButton(
                        buttonWidth: double.infinity,
                        buttonColor: AppColors.instance.transparent,
                        borderColor: AppColors.instance.whiteButton,
                        onTap: controller.onTapSkip,
                        titleText: 'Skip',
                        titleColor: AppColors.instance.white50,
                      ),
                      // Obx(
                      //       () => controller.selectedIndex.value == 0
                      //       ? Center(
                      //     child: CommonButton(
                      //       onTap: controller.onTapNext,
                      //       titleColor: AppColors.instance.primary,
                      //       titleText: 'Next',
                      //     ),
                      //   )
                      //       : Padding(
                      //     padding: EdgeInsets.symmetric(
                      //       horizontal: AppSize.width(value: 16),
                      //     ),
                      //     child: Row(
                      //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      //       children: [
                      //
                      //       ],
                      //     ),
                      //   ),
                      // ),
                    ],
                  ),
                ),
              ),

              // Positioned(
              //   top: curvePosition + AppSize.height(value: 70), // Positioned slightly above the curve start
              //   left: 0,
              //   right: 0,
              //   child: Obx(
              //         () => Container(
              //       height: AppSize.height(value: 20),
              //       alignment: Alignment.center,
              //       child: Row(
              //         mainAxisAlignment: MainAxisAlignment.center,
              //         mainAxisSize: MainAxisSize.min,
              //         children: List.generate(
              //           controller.onBoardingDataList.length,
              //               (index) => AnimatedContainer(
              //             duration: const Duration(milliseconds: 300),
              //             width: controller.selectedIndex.value == index
              //                 ? AppSize.width(value: 24)
              //                 : AppSize.width(value: 8),
              //             margin: EdgeInsets.symmetric(
              //               horizontal: AppSize.width(value: 4),
              //             ),
              //             height: AppSize.height(value: 8),
              //             decoration: BoxDecoration(
              //               color: Colors.white,
              //               borderRadius: BorderRadius.circular(
              //                 controller.selectedIndex.value == index ? 4 : 24,
              //               ),
              //             ),
              //           ),
              //         ),
              //       ),
              //     ),
              //   ),
              // ),

              // Buttons - positioned in the gradient area below the curve
              // Positioned(
              //   top: curvePosition + AppSize.height(value: 180), // Positioned slightly above the curve start
              //   left: 0,
              //   right: 0,
              //   child:
              // ),
            ],
          ),
        );
      }
    );
  }
}


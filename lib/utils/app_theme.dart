import 'package:flutter/material.dart';
import '../constant/app_colors.dart';

ThemeData appThemeData = ThemeData.light(useMaterial3: true).copyWith(
  scaffoldBackgroundColor: AppColors.instance.white50,
  dividerColor: AppColors.instance.transparent,
  appBarTheme: AppBarTheme(backgroundColor: AppColors.instance.white50),
  inputDecorationTheme: InputDecorationTheme(

    border: OutlineInputBorder(borderRadius: BorderRadius.circular(10), borderSide: BorderSide(color: AppColors.instance.border)),
    focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(10), borderSide: BorderSide(color: AppColors.instance.border)),
    enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(10), borderSide: BorderSide(color: AppColors.instance.border)),
    errorBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(10), borderSide: BorderSide(color: AppColors.instance.error)),
    focusedErrorBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(10), borderSide: BorderSide(color: AppColors.instance.error)),
  ),
  popupMenuTheme: PopupMenuThemeData(
    color: AppColors.instance.white50,
    iconColor: AppColors.instance.white50,
    shadowColor: AppColors.instance.white50,
    surfaceTintColor: AppColors.instance.white50,
    elevation: 0,
  ),
  buttonTheme: ButtonThemeData(hoverColor: AppColors.instance.transparent, highlightColor: AppColors.instance.transparent,minWidth: double.infinity),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ButtonStyle(
      overlayColor: MaterialStatePropertyAll(AppColors.instance.transparent),
      mouseCursor: MaterialStatePropertyAll(MouseCursor.defer),
      fixedSize: MaterialStatePropertyAll(
        const Size(double.infinity, 50), // full width, 50 height
      ),
      // OR minimumSize if you want it to grow with child
      // minimumSize: MaterialStatePropertyAll(Size(double.infinity, 50)),
    ),
  ),

  textButtonTheme: TextButtonThemeData(
    style: ButtonStyle(
      overlayColor: MaterialStatePropertyAll(AppColors.instance.transparent),
      mouseCursor: MaterialStatePropertyAll(MouseCursor.defer),
      fixedSize: MaterialStatePropertyAll(
        const Size(double.infinity, 45),
      ),
    ),
  ),

);

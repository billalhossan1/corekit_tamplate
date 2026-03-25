import 'package:core_kit/core_kit.dart';
import 'package:flutter/material.dart';

class AppTextFiledHeader extends StatelessWidget {
  final String text;
  const AppTextFiledHeader({
    super.key, required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return CommonText(text: text,fontWeight: .w500,fontSize: 16,);
  }
}
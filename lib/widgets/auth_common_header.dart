import 'package:core_kit/core_kit.dart';
import 'package:flutter/material.dart';

class AuthCommonHeader extends StatelessWidget {
  final String title;
  final String subTitle;
  const AuthCommonHeader({
    super.key,
    required this.title,
    required this.subTitle,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CommonText(text: title, fontSize: 28, fontWeight: .w500),
        2.height,
        CommonText(text: subTitle, fontSize: 16, fontWeight: .w400),
      ],
    );
  }
}

import 'package:flutter/material.dart';

import '../constant/app_colors.dart';

class AppDefaultTemplate extends StatelessWidget {
  final Widget body;
  final PreferredSizeWidget? appBar;
  final bool resizeToAvoidBottomInset;
  const AppDefaultTemplate({super.key, required this.body,  this.resizeToAvoidBottomInset = false,  this.appBar});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar,
      resizeToAvoidBottomInset: resizeToAvoidBottomInset,
      backgroundColor: AppColors.instance.screenBg,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: body,
      ),
    );
  }
}

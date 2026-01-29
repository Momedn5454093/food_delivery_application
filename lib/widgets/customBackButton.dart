import 'dart:io';

import 'package:flutter/material.dart';

import '../widgets/custom_secondary_button.dart';

class CustomBackButton extends StatelessWidget {
  final double height;
  final double width;
  final VoidCallback? onTap;

  const CustomBackButton({
    super.key,
    required this.height,
    required this.width,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return CustomSecondaryButton(
      height: height,
      width: width,
      onTap: onTap,
      iconData: Platform.isIOS ? Icons.arrow_back_ios : Icons.arrow_back,
    );
  }
}

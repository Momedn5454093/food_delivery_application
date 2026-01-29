import 'package:flutter/material.dart';

class CustomSecondaryButton extends StatelessWidget {
  final double height;
  final double width;
  final VoidCallback? onTap;
  final IconData iconData;
  const CustomSecondaryButton({
    super.key,
    required this.height,
    required this.width,
    this.onTap,
    required this.iconData,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey[100],
        borderRadius: BorderRadius.circular(8.0),
      ),

      height: height,
      width: width,
      child: InkWell(onTap: onTap, child: Icon(iconData)),
    );
    ;
  }
}

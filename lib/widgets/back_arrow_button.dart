import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BackArrowButton extends StatelessWidget {
  const BackArrowButton({super.key, this.onPressed, this.icon});

  final VoidCallback? onPressed;
  final Widget? icon;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        if (onPressed != null) {
          onPressed?.call();
        } else {
          Get.back();
        }
      },
      icon: icon ??
          const Icon(
            Icons.arrow_back_rounded,
            color: Colors.white,
          ),
    );
  }
}

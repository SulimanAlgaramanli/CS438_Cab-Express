import 'package:cab_express/global/cab_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    this.onPressed,
    this.style,
    this.child,
  });

  final void Function()? onPressed;

  // void Function()? onLongPress;
  // void Function(bool)? onHover;
  // void Function(bool)? onFocusChange;
  final ButtonStyle? style;

  // FocusNode? focusNode;
  // bool autofocus = false;
  // Clip clipBehavior = Clip.none;
  // MaterialStatesController? statesController;
  final Widget? child;

  ButtonStyle? _getButtonStyle(BuildContext context) {
    return ButtonStyle(
      overlayColor:
          MaterialStateProperty.resolveWith((states) => CabColors.primaryLight),
      padding: MaterialStateProperty.resolveWith(
          (states) => EdgeInsets.all(context.width / 28)),
      backgroundColor:
          MaterialStateProperty.resolveWith((states) => CabColors.primary),
    );
  }

  @override
  Widget build(BuildContext context) {
    final btn = _getButtonStyle(context);
    return ElevatedButton(
      onPressed: () {},
      style: style?.copyWith(
            padding: btn?.padding,
            backgroundColor: btn?.backgroundColor,
            overlayColor: btn?.overlayColor,
          ) ??
          btn,
      child: Text(
        'Save',
        style: context.textTheme.labelLarge?.copyWith(
          color: Colors.white,
        ),
      ),
    );
  }
}

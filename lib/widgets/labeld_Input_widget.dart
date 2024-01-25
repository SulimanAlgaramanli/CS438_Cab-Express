import 'package:cab_express/global/cab_colors.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class LabeledInput extends StatelessWidget {
  const LabeledInput({
    super.key,
    this.label,
    this.hintText,
    this.controller,
    this.validator,
    this.secureField = false,
    this.suffixIcon,
    this.readOnly = false,
    this.onTapped,
  });

  final String? label;
  final String? hintText;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final bool secureField;
  final Widget? suffixIcon;
  final bool readOnly;
  final void Function()? onTapped;

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.sizeOf(context).height;
    final width = MediaQuery.sizeOf(context).width;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (label != null)
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Gap(width / 64),
              Text(
                label ?? '',
                style: Theme.of(context).textTheme.labelLarge,
              ),
            ],
          ),
        TextFormField(
          obscureText: secureField,
          controller: controller,
          onTap: onTapped,
          readOnly: readOnly,
          decoration: InputDecoration(
            hintText: hintText,
            hintStyle: Theme.of(context)
                .textTheme
                .labelLarge
                ?.copyWith(color: Colors.grey),
            contentPadding: EdgeInsets.symmetric(
              horizontal: width / 36,
              vertical: height / 64,
            ),
            // border: const OutlineInputBorder(),
            suffixIcon: suffixIcon,
            filled: true,
            fillColor: CabColors.backgroundHome,
          ),
          validator: validator,
        ),
      ],
    );
  }
}

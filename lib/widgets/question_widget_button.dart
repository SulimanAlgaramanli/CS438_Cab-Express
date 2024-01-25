import 'package:flutter/material.dart';
import 'package:get/get.dart';

class QuestionButtonWidget extends StatelessWidget {
  const QuestionButtonWidget({
    super.key,
    this.onPressed,
    this.question,
    this.labelBtn,
  });

  final String? question;
  final String? labelBtn;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: context.width,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(question ?? ""),
          TextButton(
            onPressed: onPressed,
            child: Text(
              labelBtn ?? '',
              style: TextStyle(
                fontSize: Theme.of(context).textTheme.titleMedium?.fontSize,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

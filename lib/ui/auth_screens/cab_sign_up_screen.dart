import 'package:cab_express/global/cab_colors.dart';
import 'package:cab_express/services/firebase_auth_service/logic.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get_utils/get_utils.dart';

import 'auth_widgets/sign_up_form.dart';

class CabSignUpScreen extends StatefulWidget {
  const CabSignUpScreen({super.key});

  @override
  State<CabSignUpScreen> createState() => _CabSignUpScreenState();
}

class _CabSignUpScreenState extends State<CabSignUpScreen> {

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.sizeOf(context).height;
    return Scaffold(
      body: SizedBox(
        height: height,
        child: Stack(
          children: [
            Positioned.directional(
              textDirection: TextDirection.ltr,
              top: -(context.height / 8),
              start: -(context.height / 8),
              child: CircleAvatar(
                radius: context.width / 3,
                backgroundColor: CabColors.primary,
              ),
            ),
            Positioned.directional(
              textDirection: TextDirection.rtl,
              bottom: -(context.height / 10),
              start: -(context.height / 12),
              child: CircleAvatar(
                radius: context.width / 5,
                backgroundColor: CabColors.primary,
              ),
            ),
            SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.symmetric(
                  vertical: kToolbarHeight,
                  horizontal: context.width / 64,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Gap(height / 21),
                    CircleAvatar(
                      radius: context.width / 6.5,
                      child: Icon(
                        Icons.person_rounded,
                        size: context.width / 6.5,
                      ),
                    ),
                    Gap(height / 64),
                    Text(
                      'Signup',
                      style: Theme.of(context).textTheme.headlineLarge,
                    ),
                    Gap(height / 64),
                    const AuthSignupForm(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
  }
}

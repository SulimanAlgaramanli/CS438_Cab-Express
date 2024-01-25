import 'package:cab_express/global/cab_colors.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';

import 'auth_widgets/login_form.dart';

class CabLoginScreen extends StatefulWidget {
  const CabLoginScreen({super.key});

  @override
  State<CabLoginScreen> createState() => _CabLoginScreenState();
}

class _CabLoginScreenState extends State<CabLoginScreen> {

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.sizeOf(context).height;
    // final width = MediaQuery.sizeOf(context).width;
    return Scaffold(
      body: SizedBox(height: context.height,
        child: Stack(
          children: [
            Positioned.directional(
              textDirection: TextDirection.ltr,
              top: -(context.height / 10),
              start: -(context.height / 10),
              child: CircleAvatar(
                radius: context.width / 3,
                backgroundColor: CabColors.primary,
              ),
            ),
            Positioned.directional(
              textDirection: TextDirection.rtl,
              bottom: -(context.height / 10),
              start: -(context.height / 10),
              child: CircleAvatar(
                radius: context.width / 4,
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
                    Gap(context.width / 3),
                    CircleAvatar(
                      radius: height / 14,
                      child: Icon(
                        Icons.person,
                        size: height / 10,
                      ),
                    ),
                    Gap(height / 36),
                    Text(
                      'Welcome Back',
                      style: Theme.of(context)
                          .textTheme
                          .headlineLarge
                          ?.copyWith(fontWeight: FontWeight.bold),
                    ),
                    Gap(height / 36),
                    const AuthLoginForm(),
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

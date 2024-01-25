import 'package:cab_express/global/cab_colors.dart';
import 'package:cab_express/routes/cab_app_routes.dart';
import 'package:cab_express/widgets/labeld_Input_widget.dart';
import 'package:cab_express/widgets/question_widget_button.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';

class AuthSignupForm extends StatelessWidget {
  const AuthSignupForm({super.key});

  Widget hidePasswordIcon(bool secureText) {
    return secureText
        ? const Icon(Icons.visibility_off)
        : const Icon(Icons.visibility);
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.sizeOf(context).height;
    final width = MediaQuery.sizeOf(context).width;
    return Center(
      child: Form(
        // key: state.formKey,
        child: SizedBox(
          width: width / 1.1,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const LabeledInput(
                label: 'Email',
                hintText: 'Enter your username...',
                // controller: state.username,
                // validator: InputValidator.isUsername,
              ),
              Gap(height / 64),
              Row(children: [
                const Expanded(
                  child: LabeledInput(
                    label: 'Full Name',
                    hintText: 'Enter your full name...',
                  ),
                ),
                Gap(height / 64),
                const Expanded(
                  child: LabeledInput(
                    label: 'Last Name',
                    hintText: 'Enter your last name...',
                    // controller: state.lastName,
                  ),
                )
              ]),
              Gap(height / 64),
              const LabeledInput(
                label: 'Phone Number',
                hintText: 'Enter your phone number...',
                // controller: state.phoneNumber,
                // validator: InputValidator.isPhoneNumber,
              ),
              Gap(height / 64),
              LabeledInput(
                label: 'Password',
                hintText: 'Enter your password...',
                // controller: state.password,
                // validator: InputValidator.isValidPassword,
                suffixIcon: InkWell(
                    onTap: () {
                      // state.secureText1 = !state.secureText1;
                    },
                    child: hidePasswordIcon(false)),
                // secureField: state.secureText1,
              ),
              Gap(height / 64),
              LabeledInput(
                label: 'Confirm Password',
                hintText: 'Enter your password confirmation...',
                // controller: state.passwordConfirmation,
                validator: (value) {
                  // return InputValidator.isMatchPasswordConfirmation(
                  //   state.password.text,
                  //   value,
                  // );
                  return null;
                },
                suffixIcon: InkWell(
                  onTap: () {
                    // state.secureText2 = !state.secureText2;
                  },
                  child: hidePasswordIcon(false),
                ),
                // secureField: state.secureText2,
              ),
              Gap(height / 36),
              SizedBox(
                width: width,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: CabColors.primary,
                  ),
                  // onPressed: logic.onSignupPressed,
                  onPressed: () {
                    Get.offAllNamed(CabAppRoutes.cabDashboardScreen);
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(12),
                    child: Text(
                      'Signup',
                      style: Theme.of(context).textTheme.titleMedium?.copyWith(
                            color: Colors.white,
                          ),
                    ),
                  ),
                ),
              ),
              Gap(height / 64),
              const Visibility(
                // visible: logic.states.isLoading,
                visible: false,
                child: Center(
                  child: CircularProgressIndicator(),
                ),
              ),
              Gap(height / 64),
              QuestionButtonWidget(
                onPressed: () {
                  // logic.clearAuthStates();
                  Get.offAndToNamed(CabAppRoutes.cabLoginScreen);
                },
                question: 'You have an account?',
                labelBtn: 'Login',
              ),
            ],
          ),
        ),
      ),
    );
  }
}

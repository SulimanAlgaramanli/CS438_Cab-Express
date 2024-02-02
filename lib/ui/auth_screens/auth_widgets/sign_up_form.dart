import 'package:cab_express/controller/sign_up_controller/logic.dart';
import 'package:cab_express/global/cab_colors.dart';
import 'package:cab_express/routes/cab_app_routes.dart';
import 'package:cab_express/utils/input_validator.dart';
import 'package:cab_express/widgets/labeld_Input_widget.dart';
import 'package:cab_express/widgets/question_widget_button.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';

class AuthSignupForm extends StatefulWidget {
  const AuthSignupForm({super.key});

  @override
  State<AuthSignupForm> createState() => _AuthSignupFormState();
}

class _AuthSignupFormState extends State<AuthSignupForm> {
  final logic = SignupControllerLogic.instance;
  final state = SignupControllerLogic.instance.state;

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
        key: state.formKey,
        child: SizedBox(
          width: width / 1.1,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(children: [
                Expanded(
                  child: LabeledInput(
                    label: 'Full Name',
                    hintText: 'Enter your full name...',
                    controller: state.firstName,
                  ),
                ),
                Gap(height / 64),
                Expanded(
                  child: LabeledInput(
                    label: 'Last Name',
                    hintText: 'Enter your last name...',
                    controller: state.lastName,
                  ),
                )
              ]),
              Gap(height / 64),
              LabeledInput(
                label: 'Email',
                hintText: 'Enter your email...',
                controller: state.email,
                validator: InputValidator.isEmail,
              ),
              Gap(height / 64),
              LabeledInput(
                label: 'Phone Number',
                hintText: 'Enter your phone number...',
                controller: state.phoneNumber,
                validator: InputValidator.isPhoneNumber,
              ),
              Gap(height / 64),
              Obx(() => LabeledInput(
                    label: 'Password',
                    hintText: 'Enter your password...',
                    controller: state.password,
                    validator: InputValidator.isValidPassword,
                    suffixIcon: InkWell(
                        onTap: () {
                          state.secureText1 = !state.secureText1;
                        },
                        child: hidePasswordIcon(false)),
                    secureField: state.secureText1,
                  )),
              Gap(height / 64),
              Obx(() => LabeledInput(
                    label: 'Confirm Password',
                    hintText: 'Enter your password confirmation...',
                    controller: state.passwordConfirmation,
                    validator: (value) {
                      return InputValidator.isMatchPasswordConfirmation(
                        state.password.text,
                        value,
                      );
                      return null;
                    },
                    suffixIcon: InkWell(
                      onTap: () {
                        state.secureText2 = !state.secureText2;
                      },
                      child: hidePasswordIcon(false),
                    ),
                    secureField: state.secureText2,
                  )),
              Gap(height / 36),
              SizedBox(
                width: width,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: CabColors.primary,
                  ),
                  onPressed: logic.onSignupPressed,
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
              Obx(() => Visibility(
                    visible: logic.states.isLoading,
                    child: const Center(
                      child: CircularProgressIndicator(),
                    ),
                  )),
              Gap(height / 64),
              QuestionButtonWidget(
                onPressed: () {
                  logic.clearAuthStates();
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

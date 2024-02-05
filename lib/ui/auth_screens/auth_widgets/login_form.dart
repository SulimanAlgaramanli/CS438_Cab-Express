import 'package:cab_express/controller/login_controller/logic.dart';
import 'package:cab_express/global/cab_colors.dart';
import 'package:cab_express/routes/cab_app_routes.dart';
import 'package:cab_express/utils/input_validator.dart';
import 'package:cab_express/widgets/labeld_Input_widget.dart';
import 'package:cab_express/widgets/question_widget_button.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';

class AuthLoginForm extends StatefulWidget {
  const AuthLoginForm({super.key});

  @override
  State<AuthLoginForm> createState() => _AuthLoginFormState();
}

class _AuthLoginFormState extends State<AuthLoginForm> {
  final logic = LoginControllerLogic.instance;

  final state = LoginControllerLogic.instance.state;

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.sizeOf(context).height;
    final width = MediaQuery.sizeOf(context).width;
    Widget hidePasswordIcon(bool secureText) {
      return secureText
          ? const Icon(Icons.visibility_off)
          : const Icon(Icons.visibility);
    }

    return Center(
      child: Form(
        key: state.formKey,
        child: SizedBox(
          width: width / 1.1,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              LabeledInput(
                label: 'Email',
                hintText: 'Enter your email...',
                controller: state.email,
                validator: (value) => InputValidator.isEmail(value),
              ),
              Gap(height / 64),
              Obx(() => LabeledInput(
                    label: 'Password',
                    hintText: 'Enter your Password...',
                    controller: state.password,
                    validator: (value) =>
                        InputValidator.isRequired('Password', value),
                    suffixIcon: InkWell(
                      onTap: () {
                        state.secureText1 = !state.secureText1;
                      },
                      child: hidePasswordIcon(state.secureText1),
                    ),
                    secureField: state.secureText1,
                  )),
              Gap(height / 36),
              SizedBox(
                width: width,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: CabColors.primary,
                  ),
                  onPressed: () {
                    logic.onLoginPressed();
                    // Get.offAllNamed(CabAppRoutes.cabDashboardScreen);
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Text(
                      'Login',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize:
                            Theme.of(context).textTheme.titleMedium?.fontSize,
                      ),
                    ),
                  ),
                ),
              ),
              Gap(height / 64),
              const Visibility(
                visible: false,
                child: Center(
                  child: CircularProgressIndicator(),
                ),
              ),
              Gap(height / 64),
              QuestionButtonWidget(
                onPressed: () {
                  logic.clearAuthStates();
                  Get.offAndToNamed(CabAppRoutes.cabSignupScreen);
                },
                question: 'You do not have account?',
                labelBtn: 'Signup',
              ),
            ],
          ),
        ),
      ),
    );
  }
}

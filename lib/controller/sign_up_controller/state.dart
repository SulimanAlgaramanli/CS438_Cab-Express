import 'package:cab_express/data/models/core/user_auth.model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignupControllerState {
  final formKey = GlobalKey<FormState>();
  final firstName = TextEditingController();
  final lastName = TextEditingController();
  final phoneNumber = TextEditingController();
  final email = TextEditingController();
  final password = TextEditingController();
  final passwordConfirmation = TextEditingController();
  final _secureText1 = true.obs;

  bool get secureText1 => _secureText1.isTrue;

  set secureText1(bool value) => _secureText1.value = value;
  final _secureText2 = true.obs;

  bool get secureText2 => _secureText2.isTrue;

  set secureText2(bool value) => _secureText2.value = value;

  UserAuthModel  get authForm => UserAuthModel.signup(
        firstName: firstName.text.trim(),
        lastName: lastName.text.trim(),
        phoneNumber: phoneNumber.text.trim(),
        email: email.text.trim(),
        password: password.text.trim(),
      );

  dispose() {
    firstName.dispose();
    lastName.dispose();
    phoneNumber.dispose();
    email.dispose();
    password.dispose();
    passwordConfirmation.dispose();
  }
}

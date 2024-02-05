import 'package:cab_express/data/models/core/user_auth.model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginControllerState {
  final formKey = GlobalKey<FormState>();
  final email = TextEditingController();
  final password = TextEditingController();
  final _secureText1 = true.obs;

  bool get secureText1 => _secureText1.isTrue;

  set secureText1(bool value) => _secureText1.value = value;

  UserAuthModel  get authForm => UserAuthModel.login(
        email: email.text.trim(),
        password: password.text.trim(),
      );

  dispose() {
    email.dispose();
    password.dispose();
  }
}

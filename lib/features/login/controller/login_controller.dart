import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:scaffold_flutter/data/models/forms/credential_form.dart';
import 'package:scaffold_flutter/data/repository/login_repository_interface.dart';
import 'package:scaffold_flutter/features/users/view/users_view.dart';

class LoginController extends GetxController {
  LoginController(this._loginRepository);

  final ILoginRepository _loginRepository;

  final _email = "eve.holt@reqres.in".obs;
  final _password = "cityslicka".obs;

  final emailController = TextEditingController(text: 'eve.holt@reqres.in');
  final passwordController = TextEditingController(text: 'cityslicka');

  updateEmail(String value) {
    log(value);
    _email(value);
  }

  resetInputs() {
    emailController.text = 'eve.holt@reqres.in';
    passwordController.text = 'cityslicka';

    _password('cityslicka');
    _email('eve.holt@reqres.in');
  }

  updatePassword(String value) {
    log(value);
    _password(value);
  }

  login() async {
    final loginForm = CredentialForm.fromJson({
      'email': _email.value,
      'password': _password.value,
    });

    final response = await _loginRepository.login(loginForm);
    log(response.toString());
    Get.offNamed(UserView.route);
  }
}

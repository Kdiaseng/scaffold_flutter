import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:scaffold_flutter/data/models/forms/credential_form.dart';
import 'package:scaffold_flutter/data/models/response/exception_response.dart';
import 'package:scaffold_flutter/data/repository/login_repository_interface.dart';
import 'package:scaffold_flutter/features/login/view/components/bottom_sheet_error_component.dart';
import 'package:scaffold_flutter/features/users/view/users_view.dart';
import 'package:scaffold_flutter/utils/api_response.dart';

class LoginController extends GetxController {
  LoginController(this._loginRepository);

  final ILoginRepository _loginRepository;

  final _email = "eve.holt@reqres.in".obs;
  final _password = "cityslicka".obs;

  final emailController = TextEditingController(text: 'eve.holt@reqres.in');
  final passwordController = TextEditingController(text: 'cityslicka');

  final _apiResponseLogin = ApiResponse.start().obs;

  ApiResponse get apiResponseLogin => _apiResponseLogin.value;

  @override
  onInit() async {
    _apiResponseLogin.listen((response) {
      if (response is Error) {
        Get.bottomSheet(BottomSheetErrorComponent(message: response.message));
      }
    });
  }

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
    _apiResponseLogin(ApiResponse.loading());
    log('loading');
    final loginForm =
        CredentialForm(email: _email.value, password: _password.value);
    try {
      final response = await _loginRepository.login(loginForm);
      log(response.toString());
      Get.offNamed(UserView.route);
      _apiResponseLogin(ApiResponse.success(null));
      log('success');
    } on ExceptionResponse catch (e) {
      log('error');
      _apiResponseLogin(ApiResponse.error(e.statusCode, e.message));
    }
  }
}

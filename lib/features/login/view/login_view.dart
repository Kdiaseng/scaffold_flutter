import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:scaffold_flutter/features/login/controller/login_controller.dart';
import 'package:scaffold_flutter/utils/api_response.dart';

class LoginView extends StatelessWidget {
  const LoginView({Key? key}) : super(key: key);

  static const String route = "/";

  @override
  Widget build(BuildContext context) {
    final loginController = Get.find<LoginController>();

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Login'),
        actions: [
          IconButton(
            onPressed: loginController.resetInputs,
            icon: const Icon(Icons.restart_alt),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextFormField(
                controller: loginController.emailController,
                onChanged: loginController.updateEmail,
                keyboardType: TextInputType.emailAddress,
                decoration: const InputDecoration(
                    labelText: "E-mail", border: OutlineInputBorder()),
              ),
              const SizedBox(height: 32),
              TextFormField(
                controller: loginController.passwordController,
                onChanged: loginController.updatePassword,
                keyboardType: TextInputType.visiblePassword,
                obscureText: true,
                decoration: const InputDecoration(
                    labelText: "Senha", border: OutlineInputBorder()),
              ),
              const SizedBox(height: 32),
              SizedBox(
                height: 45,
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: loginController.login,
                  child: Obx(
                    () {
                      final response = loginController.apiResponseLogin;
                      if (response is Loading) {
                        return const CircularProgressIndicator(
                            color: Colors.white);
                      }
                      if (response is Error) {
                        return const Text("Login");
                      }
                      return const Text("Login");
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controllers/auth_controller.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final AuthController _authController = Get.find();

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Login"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                autovalidateMode: AutovalidateMode.onUserInteraction,
                controller: _authController.emailController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: "Email",
                ),
                validator: (value) => EmailValidator.validate(value ?? '')
                    ? null
                    : "Please enter a valid email",
              ),
              const SizedBox(height: 15),
              TextFormField(
                autovalidateMode: AutovalidateMode.onUserInteraction,
                controller: _authController.passwordController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: "Password",
                ),
                obscureText: true,
                validator: (value) => (value ?? '').length >= 6
                    ? null
                    : "Password must me 6 characters at least",
              ),
              const SizedBox(height: 15),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    _authController.signIn();
                  }
                },
                child: const Text("Login"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controllers/auth_controller.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final AuthController _authController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Sign Up"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextFormField(
              autovalidateMode: AutovalidateMode.onUserInteraction,
              controller: _authController.nameController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: "Name",
              ),
              validator: (value) =>
                  (value ?? '').length > 3 ? null : "Please enter a valid name",
            ),
            const SizedBox(height: 15),
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
              onPressed: () => _authController.signUp(),
              child: const Text("Sign Up"),
            ),
          ],
        ),
      ),
    );
  }
}

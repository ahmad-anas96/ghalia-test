// profile_page.dart

import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ghalia_test/controllers/auth_controller.dart';
import 'package:get/get.dart';

class MyProfileScreen extends StatefulWidget {
  const MyProfileScreen({super.key});

  @override
  State<MyProfileScreen> createState() => _MyProfileScreenState();
}

class _MyProfileScreenState extends State<MyProfileScreen> {
  final AuthController _authController = Get.find<AuthController>();
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  var isLoading = false;

  @override
  void initState() {
    super.initState();
    _loadUserData();
  }

  void _loadUserData() {
    nameController.text = _authController.user?.name ?? '';
    emailController.text = _authController.user?.email ?? '';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              TextFormField(
                controller: nameController,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: "Name",
                ),
                validator: (value) => (value ?? '').length > 3
                    ? null
                    : "Please enter a valid name",
              ),
              const SizedBox(height: 15),
              TextFormField(
                controller: emailController,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: "Email",
                ),
                validator: (value) => EmailValidator.validate(value ?? '')
                    ? null
                    : "Please enter a valid email",
              ),
              const SizedBox(height: 15),
              isLoading
                  ? const CircularProgressIndicator(color: Colors.blueGrey)
                  : ElevatedButton(
                      child: const Text("Update my profile"),
                      onPressed: () async {
                        setState(() => isLoading = true);
                        var b = await _authController.updateUserData(
                          nameController.text,
                          emailController.text,
                        );
                        setState(() => isLoading = true);

                        if (b) Get.back();
                      },
                    ),
            ],
          ),
        ),
      ),
    );
  }
}

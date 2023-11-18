import 'package:flutter/material.dart';
import 'package:flutter_ghalia_test/models/user_model.dart';
import 'package:flutter_ghalia_test/services/auth_service.dart';
import 'package:get/get.dart';

class AuthController extends GetxController {
  final AuthService _authService = AuthService();

  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final nameController = TextEditingController();

  UserModel? get user => _authService.user.value;

  void signUp() async {
    var isDone = await _authService.signUp(
      emailController.text.trim(),
      passwordController.text.trim(),
      nameController.text.trim(),
    );

    if (isDone) {
      await signIn();
      _clearInputFields();
    }
  }

  Future<void> signIn() async {
    var isDone = await _authService.signIn(
      emailController.text.trim(),
      passwordController.text.trim(),
    );
    if (isDone) {
      _clearInputFields();
      Get.offAllNamed('/home');
    }
  }

  Future<bool> updateUserData(String name, String email) async {
    return await _authService.updateUserData(name, email);
  }

  void signOut() async {
    await _authService.signOut();
    Get.offAllNamed('/welcome');
  }

  void _clearInputFields() {
    emailController.clear();
    passwordController.clear();
    nameController.clear();
  }
}

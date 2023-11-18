// splash_screen.dart

import 'package:flutter/material.dart';
import 'package:flutter_ghalia_test/controllers/auth_controller.dart';
import 'package:get/get.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final AuthController _authController = Get.find<AuthController>();

  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 3), () {
      if (_authController.user != null) {
        Get.offNamed('/home');
      } else {
        Get.offNamed('/welcome');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FlutterLogo(size: 100),
            SizedBox(height: 50),
            CircularProgressIndicator(
              color: Colors.blueGrey,
            ),
          ],
        ),
      ),
    );
  }
}

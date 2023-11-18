import 'package:flutter/material.dart';
import 'package:get/get.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Welcome"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const FlutterLogo(size: 100),
            const SizedBox(height: 50),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () => Get.toNamed('/login'),
                  child: const Text("Login"),
                ),
                const SizedBox(width: 10),
                ElevatedButton(
                  onPressed: () => Get.toNamed('/signup'),
                  child: const Text("Sign Up"),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

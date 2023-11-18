import 'package:flutter/material.dart';
import 'package:flutter_ghalia_test/views/my_profile_screen.dart';
import 'package:flutter_ghalia_test/views/mylink_view.dart';
import 'package:get/get.dart';
import '../../controllers/auth_controller.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final AuthController _authController = Get.find<AuthController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
        actions: [
          PopupMenuButton(
            itemBuilder: (context) => [
              PopupMenuItem(
                child: ListTile(
                  leading: const Icon(Icons.exit_to_app),
                  title: const Text('Sign Out'),
                  onTap: () {
                    _authController.signOut();
                    Navigator.pop(context);
                  },
                ),
              ),
            ],
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Welcome, ${_authController.user?.name ?? "User"}!',
              style: const TextStyle(fontSize: 20),
            ),
            const SizedBox(height: 20),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () => Get.to(() => const MyLinkPage()),
                  child: const Text('My Link'),
                ),
                const SizedBox(width: 10),
                ElevatedButton(
                  onPressed: () => Get.to(() => const MyProfileScreen()),
                  child: const Text('My Profile'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

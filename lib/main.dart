// ignore_for_file: avoid_print

import 'package:firebase_dynamic_links/firebase_dynamic_links.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_ghalia_test/controllers/auth_controller.dart';
import 'package:flutter_ghalia_test/firebase_options.dart';
import 'package:flutter_ghalia_test/services/auth_service.dart';
import 'package:flutter_ghalia_test/views/home_screen.dart';
import 'package:flutter_ghalia_test/views/link_preview_screen.dart';
import 'package:flutter_ghalia_test/views/login_screen.dart';
import 'package:flutter_ghalia_test/views/signup_screen.dart';
import 'package:flutter_ghalia_test/views/splash_screen.dart';
import 'package:flutter_ghalia_test/views/welcome_screen.dart';
import 'package:get/get.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  Get.put(AuthService());
  Get.put(AuthController());

  FirebaseDynamicLinks.instance.onLink.listen(
    (pendingDynamicLinkData) {
      final Uri deepLink = pendingDynamicLinkData.link;
      print(deepLink.queryParameters);
      Get.to(
        LinkPreviewScreen(
          name: deepLink.queryParameters["name"]!,
          email: deepLink.queryParameters["email"]!,
        ),
      );
    },
  );

  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter GetX Firebase Auth',
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 15),
            backgroundColor: Colors.blueGrey,
            textStyle: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
      initialRoute: '/splash',
      getPages: [
        GetPage(name: '/splash', page: () => const SplashScreen()),
        GetPage(name: '/welcome', page: () => const WelcomeScreen()),
        GetPage(name: '/home', page: () => const HomeScreen()),
        GetPage(name: '/login', page: () => const LoginScreen()),
        GetPage(name: '/signup', page: () => const SignUpScreen()),
      ],
    );
  }
}

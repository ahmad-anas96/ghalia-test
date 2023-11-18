import 'package:flutter/material.dart';
import 'package:flutter_ghalia_test/controllers/auth_controller.dart';
import 'package:flutter_ghalia_test/services/dynamic_link_service.dart';
import 'package:get/get.dart';
import 'package:share/share.dart';

class MyLinkPage extends StatefulWidget {
  const MyLinkPage({super.key});

  @override
  State<MyLinkPage> createState() => _MyLinkPageState();
}

class _MyLinkPageState extends State<MyLinkPage> {
  final AuthController _authController = Get.find<AuthController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Link'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'My Link',
                style: TextStyle(fontSize: 20),
              ),
              const SizedBox(height: 20),
              const Text(
                'Now You can share Your Link',
                style: TextStyle(fontSize: 18),
              ),
              const SizedBox(height: 20),
              Text(
                '${_authController.user?.name}',
                textAlign: TextAlign.center,
                style: const TextStyle(fontSize: 18),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () async {
                  var uri = await DynamicLinkService.instance
                      .createDynamicLink(_authController.user);
                  Share.share("This is the link $uri");
                },
                child: const Text('Share'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

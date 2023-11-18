import 'package:flutter/material.dart';

class LinkPreviewScreen extends StatelessWidget {
  final String name;
  final String email;

  const LinkPreviewScreen({super.key, required this.name, required this.email});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('New Link Page'),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 100),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Name",
                  style: TextStyle(fontSize: 18),
                ),
                Text(
                  "Email",
                  style: TextStyle(fontSize: 18),
                ),
              ],
            ),
            const SizedBox(width: 20),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  email,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

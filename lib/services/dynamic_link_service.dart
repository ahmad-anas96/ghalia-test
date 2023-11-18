// ignore_for_file: avoid_print

import 'package:firebase_dynamic_links/firebase_dynamic_links.dart';
import 'package:flutter_ghalia_test/models/user_model.dart';

class DynamicLinkService {
  static final DynamicLinkService _singleton = DynamicLinkService._internal();
  DynamicLinkService._internal();
  static DynamicLinkService get instance => _singleton;

  // Create new dynamic link
  Future<Uri> createDynamicLink(UserModel? user) async {
    final dynamicLinkParams = DynamicLinkParameters(
      link: Uri.parse(
          "https://flutterghaliatest.page.link/mylink?name=${user?.name}&email=${user?.email}"),
      uriPrefix: "https://flutterghaliatest.page.link",
      androidParameters: const AndroidParameters(
          packageName: "com.ahmadalsaleh.flutter_ghalia_test"),
      iosParameters:
          const IOSParameters(bundleId: "com.ahmadalsaleh.flutter_ghalia_test"),
    );
    final dynamicLink =
        await FirebaseDynamicLinks.instance.buildShortLink(dynamicLinkParams);
    return dynamicLink.shortUrl;
  }
}

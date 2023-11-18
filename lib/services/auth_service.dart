import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import '../models/user_model.dart';

class AuthService extends GetxService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  Rx<UserModel?> user = Rx<UserModel?>(null);

  AuthService() {
    _auth.authStateChanges().listen((User? firebaseUser) {
      if (firebaseUser != null) {
        user.value = UserModel(
          uid: firebaseUser.uid,
          name: firebaseUser.displayName ?? '',
          email: firebaseUser.email!,
        );
      } else {
        user.value = null;
      }
    });
  }

  Future<bool> signUp(String email, String password, String name) async {
    try {
      UserCredential result = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      await result.user!.updateDisplayName(name);

      UserModel userModel = UserModel(
        uid: result.user!.uid,
        name: name,
        email: result.user!.email!,
      );

      user.value = userModel;
      return true;
    } catch (error) {
      Get.snackbar("Error", error.toString());
      return false;
    }
  }

  Future<bool> signIn(String email, String password) async {
    try {
      UserCredential result = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      UserModel userModel = UserModel(
        uid: result.user!.uid,
        name: result.user!.displayName ?? "User",
        email: result.user!.email!,
      );

      user.value = userModel;
      Get.offNamed('/home');
      return true;
    } catch (error) {
      Get.snackbar("Error", error.toString());
      return false;
    }
  }

  Future<bool> updateUserData(String name, String email) async {
    try {
      User? currentUser = _auth.currentUser;

      await currentUser?.updateDisplayName(name);
      await currentUser?.updateEmail(email);

      user.value = UserModel(
        uid: currentUser?.uid ?? '',
        name: name,
        email: email,
      );

      user.refresh();
      return true;
    } catch (error) {
      Get.snackbar("Error", error.toString());
      return false;
    }
  }

  Future<void> signOut() async {
    await _auth.signOut();
    user.value = null;
  }
}

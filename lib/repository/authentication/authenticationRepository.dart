import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:shopper_admin/routes/AppRoutes.dart';
import 'package:shopper_admin/utils/exceptions/firebaseAuthException.dart';
import 'package:shopper_admin/utils/exceptions/firebaseException.dart';
import 'package:shopper_admin/utils/exceptions/formatException.dart';
import 'package:shopper_admin/utils/exceptions/plateformException.dart';

class AuthenticationRepository extends GetxController {
  static AuthenticationRepository get instance =>
      Get.find(); // firebase auth instance

  final _auth = FirebaseAuth.instance;

  User? get firebaseUser => _auth.currentUser;

  bool get isAuthenticated => _auth.currentUser != null;

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    // screenRedirect();
    _auth.setPersistence(Persistence.LOCAL);
  }

  void screenRedirect() {
    _auth.authStateChanges().listen((user) {
      if (user == null) {
        Get.offAllNamed(AppRoutes.login);
      } else {
        Get.offAllNamed(AppRoutes.home);
      }
    });
  }

  Future<UserCredential> signInWithEmailAndPassword(
    String email,
    String password,
  ) async {
    try {
      return await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
    } on FirebaseAuthException catch (e) {
      throw AppFirebaseAuthException(code: e.code).message;
    } on FirebaseException catch (e) {
      throw AppFirebaseException(code: e.code).message;
    } on FormatException catch (e) {
      throw const AppFormatException().message;
    } on PlatformException catch (e) {
      throw AppPlatformException(code: e.code).message;
    } catch (e) {
      throw 'Something went wrong. Please try again.';
    }
  }

  Future<UserCredential> signUpWithEmailAndPassword(
    String email,
    String password,
  ) async {
    try {
      return await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
    } on FirebaseAuthException catch (e) {
      throw AppFirebaseAuthException(code: e.code).message;
    } on FirebaseException catch (e) {
      throw AppFirebaseException(code: e.code).message;
    } on FormatException catch (e) {
      throw const AppFormatException().message;
    } on PlatformException catch (e) {
      throw AppPlatformException(code: e.code).message;
    } catch (e) {
      throw 'Something went wrong. Please try again.';
    }
  }
}

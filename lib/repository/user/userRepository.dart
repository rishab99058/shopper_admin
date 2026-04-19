import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:shopper_admin/model/authModel/userModel.dart';
import 'package:shopper_admin/utils/constants/keys.dart';
import 'package:shopper_admin/utils/exceptions/firebaseAuthException.dart';
import 'package:shopper_admin/utils/exceptions/firebaseException.dart';
import 'package:shopper_admin/utils/exceptions/formatException.dart';
import 'package:shopper_admin/utils/exceptions/plateformException.dart';

class UserRepository extends GetxController {
  static UserRepository get instance => Get.find();

  final _db = FirebaseFirestore.instance;

  Future<void> saveUserRecord(UserModel user) async {
    try {
      await _db
          .collection(AppKeys.userCollection)
          .doc(user.id)
          .set(user.toJson());
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

  Future<UserModel> getMyDetails() async {
    try {
      final id = FirebaseAuth.instance.currentUser!.uid;
      return getUserRecord(id);
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

  Future<UserModel> getUserRecord(String userId) async {
    try {
      final documentSnapshot = await _db
          .collection(AppKeys.userCollection)
          .doc(userId)
          .get();
      if (documentSnapshot.exists) {
        return UserModel.fromSnapshot(documentSnapshot);
      } else {
        throw 'User not found';
      }
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

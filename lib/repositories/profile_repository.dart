import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth_demo/constants/firebase_constants.dart';
import 'package:firebase_auth_demo/models/app_user.dart';
import 'package:firebase_auth_demo/repositories/handle_exceptions.dart';

class ProfileRepository {
  Future<AppUser> getProfile({required String uid}) async {
    try {
      final DocumentSnapshot appUserDoc = await usersCollection.doc(uid).get();

      if (appUserDoc.exists) {
        final appUser = AppUser.fromDoc(appUserDoc);
        return appUser;
      }

      throw 'User not found';
    } catch (error) {
      throw handleException(error);
    }
  }
}
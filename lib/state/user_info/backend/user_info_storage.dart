import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart' show immutable;
import 'package:instagram_clone/state/auth/constants/firebase_collections_name.dart';
import 'package:instagram_clone/state/constants/firebase_field_names.dart';
import 'package:instagram_clone/state/posts/typedef/user_id.dart';
import 'package:instagram_clone/state/user_info/models/user_info_payload.dart';

@immutable
class UserInfoStorage {
  const UserInfoStorage();
  Future<bool> saveUserInfo({
    required UserId userId,
    required String displayName,
    required String? email,
  }) async {
    try {
      //first check if user already present or not
      final userInfo = await FirebaseFirestore.instance
          .collection(
            FirebaseCollectionName.users,
          )
          .where(
            FirebaseFileName.userId,
            isEqualTo: userId,
          )
          .limit(1)
          .get();
      if (userInfo.docs.isNotEmpty) {
        // we already have the account
        await userInfo.docs.first.reference.update({
          FirebaseFileName.displayName: displayName,
          FirebaseFileName.email: email,
        });
        return true;
      }

      //dont have this account registered already
      final payLoad = UserInfoPayload(
        userId: userId,
        displayName: displayName,
        email: email,
      );

      await FirebaseFirestore.instance
          .collection(
            FirebaseCollectionName.users,
          )
          .add(
            payLoad,
          );
      return true;
    } catch (e) {
      return false;
    }
  }
}

import 'dart:developer';

import 'package:flutter_project/db/repositories/isar_repository.dart';
import 'package:isar/isar.dart';

import '../collections/user.dart';

class UserRepository extends IsarRepository {
// gets first session from isar db
// we assume that only 1 record is in the database
  Future<User?> getUser() async {
    try {
      final db = await isar;
      final users = await db.users.where().findAll();
      if (users.isEmpty) return null;
      return users.first;
    } catch (e) {
      log(e.toString());
      return null;
    }
  }

  // delete user session on logout
  Future<bool> deleteUser() async {
    try {
      final db = await isar;
      final deletedUsers = await db.users.where().deleteAll();
      return deletedUsers > 0;
    } catch (e) {
      log(e.toString());
      return false;
    }
  }

  // insert session when user has jwtToken retrieved
  Future<void> addUser(User user) async {
    try {
      final db = await isar;
      await db.writeTxn(() async {
        await db.users.put(user);
      });
    } catch (e) {
      log(e.toString());
      throw Exception(e);
    }
  }
}

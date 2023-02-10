import 'package:flutter_project/db/repositories/isar_repository.dart';
import 'package:isar/isar.dart';

import '../collections/user.dart';

class UserRepository extends IsarRepository {
// gets first session from isar db
// we assume that only 1 record is in the database
  Future<User?> getUser() async {
    final db = await isar;
    final sessions = await db.users.where().findAll();
    if (sessions.isEmpty) return null;
    return sessions.first;
  }

  // delete user session on logout
  Future<bool> deleteUser() async {
    final db = await isar;
    final deletedSessions = await db.users.where().deleteAll();
    return deletedSessions > 0;
  }

  // insert session when user has jwtToken retrieved
  Future<void> addUser(User session) async {
    final db = await isar;
    await db.writeTxn(() async {
      await db.users.put(session);
    });
  }
}

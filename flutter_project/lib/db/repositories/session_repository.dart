import 'package:flutter_project/db/repositories/isar_repository.dart';
import 'package:isar/isar.dart';

import '../collections/session.dart';

class SessionRepository extends IsarRepository {
// gets first session from isar db
// we assume that only 1 record is in the database
  Future<Session?> getUserSession() async {
    final db = await isar;
    final sessions = await db.sessions.where().findAll();
    if (sessions.isEmpty) return null;
    return sessions.first;
  }

  // delete user session on logout
  Future<bool> deleteUserSession() async {
    final db = await isar;
    final deletedSessions = await db.sessions.where().deleteAll();
    return deletedSessions > 0;
  }

  // insert session when user has jwtToken retrieved
  Future<void> insertSession(Session session) async {
    final db = await isar;
    await db.writeTxn(() async {
      await db.sessions.put(session);
    });
  }
}

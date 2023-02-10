import 'package:isar/isar.dart';

part 'session.g.dart';

@collection
class Session {
  Id id = Isar.autoIncrement;
  final String userId;
  String jwtToken;
  final DateTime createdDate;

  Session({
    required this.userId,
    required this.jwtToken,
    required this.createdDate,
  });
}

import 'package:isar/isar.dart';

part 'user.g.dart';

@collection
class User {
  Id id = Isar.autoIncrement;
  final String userId;
  final String firstName;
  final String lastName;
  String jwtToken;
  final DateTime createdDate;

  User({
    required this.userId,
    required this.firstName,
    required this.lastName,
    required this.jwtToken,
    required this.createdDate,
  });
}

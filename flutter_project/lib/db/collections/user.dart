import 'package:isar/isar.dart';
import '../../models/user.dart' as internal;

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

  // mapping from api model to db model to create and insert the user to the database
  factory User.fromInternal(internal.User user) {
    return User(
      userId: user.apiId!,
      firstName: user.firstName!,
      lastName: user.lastName!,
      jwtToken: user.jwtToken!,
      createdDate: DateTime.now(),
    );
  }
}

import 'package:flutter_project/models/user.dart' as internal;
import 'package:flutter_project/db/collections/user.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('User', () {
    group('mapping', () {
      test('fromInternal', () {
        final internalUser = internal.User(
          firstName: 'adam',
          lastName: 'malysz',
          apiId: 'apiId',
          jwtToken: 'test_token',
          password: 'password',
          userName: 'userName',
        );
        final dbUser = User.fromInternal(internalUser);

        expect(dbUser.firstName, internalUser.firstName);
        expect(dbUser.lastName, internalUser.lastName);
        expect(dbUser.jwtToken, internalUser.jwtToken);
        expect(dbUser.userId, internalUser.apiId);
        final now = DateTime.now();
        expect(dbUser.createdDate.year, now.year);
        expect(dbUser.createdDate.month, now.month);
        expect(dbUser.createdDate.day, now.day);
        expect(dbUser.createdDate.hour, now.hour);
        expect(dbUser.createdDate.minute, now.minute);
      });
    });
  });
}

import 'package:flutter_project/models/user.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_project/db/collections/user.dart' as db_user;

void main() {
  group('User', () {
    final testUser = User(
      firstName: 'Janne',
      lastName: 'Vaitanen',
      apiId: 'dadbasjdb',
      jwtToken: 'jdbadbasjdbaskjbdkasj',
      password: 'testpassword',
      userName: 'username_test',
    );
    group('mapping', () {
      test('toLoginJson', () {
        final json = testUser.toLoginJson();
        expect(json['firstName'], null);
        expect(json['lastName'], null);
        expect(json['id'], null);
        expect(json['token'], null);
        expect(json['username'], testUser.userName);
        expect(json['password'], testUser.password);
      });

      test('toAddJson', () {
        final json = testUser.toAddJson();
        expect(json['firstName'], testUser.firstName);
        expect(json['lastName'], testUser.lastName);
        expect(json['id'], null);
        expect(json['token'], null);
        expect(json['username'], null);
        expect(json['password'], null);
      });
      test('fromJson', () {
        final json = {
          'firstName': 'adam',
          'lastName': 'malysz',
          'token': 'testToken',
          'username': 'a_malysz',
          'password': 'password',
          'id': 'sdbnasjkldbasjkd',
        };
        final mappedUser = User.fromJson(json);
        expect(mappedUser.firstName, json['firstName']);
        expect(mappedUser.lastName, json['lastName']);
        expect(mappedUser.jwtToken, json['token']);
        expect(mappedUser.userName, json['username']);
        expect(mappedUser.apiId, json['id']);
        expect(mappedUser.password, null);
      });

      test('fromIsar', () {
        final isarUser = db_user.User(
          userId: 'asjdasj',
          firstName: 'adam',
          lastName: 'malysz',
          jwtToken: 'jsdbToken',
          createdDate: DateTime.now(),
        );
        final mappedUser = User.fromIsar(isarUser);
        expect(mappedUser.firstName, isarUser.firstName);
        expect(mappedUser.lastName, isarUser.lastName);
        expect(mappedUser.jwtToken, isarUser.jwtToken);
        expect(mappedUser.userName, null);
        expect(mappedUser.apiId, isarUser.userId);
        expect(mappedUser.password, null);
      });
    });
  });
}

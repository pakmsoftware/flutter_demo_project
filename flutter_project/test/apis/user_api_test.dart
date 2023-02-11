import 'dart:convert';

import 'package:flutter_project/apis/user_api.dart';
import 'package:flutter_project/models/user.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:http/http.dart' as http;

import 'user_api_test.mocks.dart';

@GenerateMocks([http.Client])
void main() {
  group('UserApi', () {
    group('addUser', () {
      test('addUser throws exception if not 200', () async {
        // setup mock
        final client = MockClient();
        // setup user
        final User user = _getUser();
        // setup api
        final api = UserApi(client);
        _mockErrorHttpResponse(client);
        // assert
        expect(api.addUser(user), throwsException);
      });

      test('addUser returns user if 200', () async {
        // setup mock
        final client = MockClient();
        // setup user
        final User user = _getUser();
        when(
          client.post(
            any,
            headers: anyNamed('headers'),
            body: anyNamed('body'),
          ),
        ).thenAnswer(
          (_) async => http.Response(
            '{"id": "${user.apiId}","firstName": "${user.firstName}","lastName": "${user.lastName}","age": 250}',
            200,
          ),
        );

        // setup api
        final api = UserApi(client);

        final addedUser = await api.addUser(user);
        // assert
        expect(addedUser.apiId, user.apiId);
        expect(addedUser.firstName, user.firstName);
        expect(addedUser.apiId, user.apiId);
        expect(addedUser.jwtToken, null);
        expect(addedUser.userName, null);
        expect(addedUser.password, null);
      });
    });

    group('loginUser', () {
      test('throws exception if response is not 200', () {
        // setup mock
        final client = MockClient();
        // setup user
        final User user = _getUser();
        // setup api
        final api = UserApi(client);
        _mockErrorHttpResponse(client);

        final response = api.loginUser(user);
        // assert
        expect(response, throwsException);
      });
      test('returns user if 200', () async {
        // setup mock
        final client = MockClient();
        // setup user
        final User user = _getUser();
        final mockResponseMap = {
          'id': 15,
          'username': user.userName,
          'firstName': user.firstName,
          'lastName': user.lastName,
          'token': 'new_token',
        };
        final mockResponse = jsonEncode(mockResponseMap);
        when(
          client.post(
            any,
            headers: anyNamed('headers'),
            body: anyNamed('body'),
          ),
        ).thenAnswer(
          (_) async => http.Response(
            mockResponse,
            200,
          ),
        );

        // setup api
        final api = UserApi(client);

        final addedUser = await api.loginUser(user);
        // assert
        expect(addedUser.apiId, mockResponseMap['id'].toString());
        expect(addedUser.firstName, mockResponseMap['firstName']);
        expect(addedUser.lastName, mockResponseMap['lastName']);
        expect(addedUser.jwtToken, mockResponseMap['token']);
        expect(addedUser.userName, mockResponseMap['username']);
        expect(addedUser.password, null);
      });
    });
  });
}

void _mockErrorHttpResponse(MockClient client) {
  when(
    client.post(
      any,
      headers: anyNamed('headers'),
      body: anyNamed('body'),
    ),
  ).thenAnswer(
    (_) async => http.Response('', 401),
  );
}

User _getUser() {
  return User(
    apiId: '15',
    firstName: 'Jack',
    lastName: 'Nicholson',
    userName: 'username',
    password: 'password',
    jwtToken: 'token',
  );
}

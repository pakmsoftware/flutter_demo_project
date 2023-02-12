import 'package:flutter_project/apis/user_api.dart';
import 'package:flutter_project/db/repositories/product_cache_repository.dart';
import 'package:flutter_project/db/repositories/product_repository.dart';
import 'package:flutter_project/db/repositories/user_repository.dart';
import 'package:flutter_project/services/auth_service.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:flutter_project/models/user.dart';
import 'package:flutter_project/db/collections/user.dart' as isar;

import 'auth_service_test.mocks.dart';

@GenerateMocks(
    [UserApi, UserRepository, ProductRepository, ProductCacheRepository])
void main() {
  group('AuthService', () {
    group('getInitialUser', () {
      test('returns null if user does not exist in db', () async {
        final userApiMock = MockUserApi();
        final userRepoMock = MockUserRepository();
        final productRepoMock = MockProductRepository();
        final productCacheMock = MockProductCacheRepository();
        when(userRepoMock.getUser()).thenAnswer((_) async => null);

        final authService = AuthService(
          userApiMock,
          userRepoMock,
          productRepoMock,
          productCacheMock,
        );

        final response = await authService.getInitialUser();
        expect(response, null);
      });
      test('returns user if user exists in db', () async {
        final userApiMock = MockUserApi();
        final userRepoMock = MockUserRepository();
        final productRepoMock = MockProductRepository();
        final productCacheMock = MockProductCacheRepository();
        final dbUser = isar.User(
          createdDate: DateTime.now(),
          firstName: 'firstName',
          jwtToken: 'token',
          userId: 'id',
          lastName: 'lastName',
        );
        when(userRepoMock.getUser()).thenAnswer(
          (_) async => dbUser,
        );

        final authService = AuthService(
          userApiMock,
          userRepoMock,
          productRepoMock,
          productCacheMock,
        );

        final response = await authService.getInitialUser();

        expect(response!.apiId, dbUser.userId);
        expect(response.firstName, dbUser.firstName);
        expect(response.lastName, dbUser.lastName);
        expect(response.jwtToken, dbUser.jwtToken);
        expect(response.userName, null);
        expect(response.password, null);
      });
    });
    group('login', () {
      test('throws exception if api throws exception', () {
        final userApiMock = MockUserApi();
        final userRepoMock = MockUserRepository();
        final productRepoMock = MockProductRepository();
        final productCacheMock = MockProductCacheRepository();
        when(userApiMock.loginUser(any)).thenThrow(Exception());

        final authService = AuthService(
          userApiMock,
          userRepoMock,
          productRepoMock,
          productCacheMock,
        );

        final response = authService.login('username', 'password');
        expect(response, throwsException);
      });
      test('throws exception if repo throws exception', () {
        final userApiMock = MockUserApi();
        final userRepoMock = MockUserRepository();
        final productRepoMock = MockProductRepository();
        final productCacheMock = MockProductCacheRepository();
        when(userRepoMock.addUser(any)).thenThrow(Exception());

        final authService = AuthService(
          userApiMock,
          userRepoMock,
          productRepoMock,
          productCacheMock,
        );

        final response = authService.login('username', 'password');
        expect(response, throwsException);
      });
      test('returns user with username, names and jwtToken', () async {
        // setup mock users
        const username = 'username1';
        const password = 'password1';

        final userApiResponse = User(
          firstName: 'first name',
          lastName: 'last name',
          userName: username,
          jwtToken: 'token',
          apiId: '12',
        );
        //setup mock
        final userApiMock = MockUserApi();
        final userRepoMock = MockUserRepository();
        final productRepoMock = MockProductRepository();
        final productCacheMock = MockProductCacheRepository();
        when(userApiMock.loginUser(any))
            .thenAnswer((_) async => userApiResponse);
        when(userRepoMock.addUser(any)).thenAnswer((_) async {});

        final authService = AuthService(
          userApiMock,
          userRepoMock,
          productRepoMock,
          productCacheMock,
        );

        final response = await authService.login(username, password);
        expect(response, userApiResponse);
      });
    });
    group('logout', () {
      test('throws exception if repository throws exception', () {
        //setup mock
        final userApiMock = MockUserApi();
        final userRepoMock = MockUserRepository();
        final productRepoMock = MockProductRepository();
        final productCacheMock = MockProductCacheRepository();

        // mock exception throwing
        when(userRepoMock.deleteUser()).thenThrow(Exception());

        final authService = AuthService(
          userApiMock,
          userRepoMock,
          productRepoMock,
          productCacheMock,
        );

        final response = authService.logout();
        expect(response, throwsException);
      });

      test('returns false if any repo call is not successfull', () async {
        //setup mock
        final userApiMock = MockUserApi();
        final userRepoMock = MockUserRepository();
        final productRepoMock = MockProductRepository();
        final productCacheMock = MockProductCacheRepository();

        // mock exception throwing
        when(userRepoMock.deleteUser()).thenAnswer((_) async => true);
        when(productRepoMock.deleteAllProducts()).thenAnswer((_) async => true);
        // one operation is not successfull
        when(productCacheMock.deleteAllProductCache())
            .thenAnswer((_) async => false);

        final authService = AuthService(
          userApiMock,
          userRepoMock,
          productRepoMock,
          productCacheMock,
        );

        final response = await authService.logout();
        expect(response, false);
      });

      test('returns true if all repo calls are successfull', () async {
        //setup mock
        final userApiMock = MockUserApi();
        final userRepoMock = MockUserRepository();
        final productRepoMock = MockProductRepository();
        final productCacheMock = MockProductCacheRepository();

        // mock exception throwing
        when(userRepoMock.deleteUser()).thenAnswer((_) async => true);
        when(productRepoMock.deleteAllProducts()).thenAnswer((_) async => true);
        // one operation is not successfull
        when(productCacheMock.deleteAllProductCache())
            .thenAnswer((_) async => true);

        final authService = AuthService(
          userApiMock,
          userRepoMock,
          productRepoMock,
          productCacheMock,
        );

        final response = await authService.logout();
        expect(response, true);
      });
    });
    group('register', () {
      test('throws exception if user api fails', () {
        //setup mock
        final userApiMock = MockUserApi();
        final userRepoMock = MockUserRepository();
        final productRepoMock = MockProductRepository();
        final productCacheMock = MockProductCacheRepository();

        // mock exception throwing
        when(userApiMock.addUser(any)).thenThrow(Exception());

        final authService = AuthService(
          userApiMock,
          userRepoMock,
          productRepoMock,
          productCacheMock,
        );

        final response = authService.register(
          username: 'username',
          password: 'password',
          firstName: 'firstName',
          lastName: 'lastName',
        );
        expect(response, throwsException);
      });
      test('returns user with username, names and jwtToken', () async {
        // setup mock users
        const username = 'username1';
        const password = 'password1';

        final userApiResponse = User(
          firstName: 'first name',
          lastName: 'last name',
          userName: username,
          jwtToken: 'token',
          apiId: '12',
        );
        //setup mock
        final userApiMock = MockUserApi();
        final userRepoMock = MockUserRepository();
        final productRepoMock = MockProductRepository();
        final productCacheMock = MockProductCacheRepository();
        when(userApiMock.addUser(any)).thenAnswer((_) async => userApiResponse);
        when(userApiMock.loginUser(any))
            .thenAnswer((_) async => userApiResponse);
        when(userRepoMock.addUser(any)).thenAnswer((_) async {});

        final authService = AuthService(
          userApiMock,
          userRepoMock,
          productRepoMock,
          productCacheMock,
        );

        final response = await authService.register(
          username: username,
          password: password,
          firstName: userApiResponse.firstName!,
          lastName: userApiResponse.lastName!,
        );
        expect(response, userApiResponse);
      });
    });
  });
}

import 'dart:developer';

import 'package:flutter_project/apis/user_api.dart';
import 'package:flutter_project/db/repositories/product_cache_repository.dart';
import 'package:flutter_project/db/repositories/product_repository.dart';
import 'package:flutter_project/db/repositories/user_repository.dart';
import 'package:flutter_project/models/user.dart';

import '../db/collections/user.dart' as isar;

class AuthService {
  final UserRepository _userRepository;
  final ProductRepository _productRepository;
  final ProductCacheRepository _productCacheRepository;
  final UserApi _userApi;

  AuthService(
    this._userApi,
    this._userRepository,
    this._productRepository,
    this._productCacheRepository,
  );

  Future<User> register({
    required String username,
    required String password,
    required String firstName,
    required String lastName,
  }) async {
    try {
      final userToRegister = User(
        userName: username,
        password: password,
        firstName: firstName,
        lastName: lastName,
      );

      await _userApi.addUser(userToRegister);
      return await login(userToRegister.userName!, userToRegister.password!);
    } catch (e) {
      log(e.toString());
      rethrow;
    }
  }

  Future<User> login(String userName, String password) async {
    try {
      final userToLogin = User(userName: userName, password: password);
      // login and get jwtToken from response
      final loggedUser = await _userApi.loginUser(userToLogin);

      // add loggedUser to isar with jwt token
      final dbUser = isar.User.fromInternal(loggedUser);
      await _userRepository.addUser(dbUser);
      return loggedUser;
    } catch (e) {
      log(e.toString());
      rethrow;
    }
  }

  Future<bool> logout() async {
    try {
      // delete all data during logout
      // delete user data
      final isUserDeleteTask = _userRepository.deleteUser();
      // delete all stored products
      final areProductsDeletedTask = _productRepository.deleteAllProducts();
      // delete product cache
      final isProductCacheDeleted =
          _productCacheRepository.deleteAllProductCache();
      final deleteTasksResult = await Future.wait(
          [isUserDeleteTask, areProductsDeletedTask, isProductCacheDeleted]);

      return !deleteTasksResult.any((e) => !e);
    } catch (e) {
      log(e.toString());
      rethrow;
    }
  }
}

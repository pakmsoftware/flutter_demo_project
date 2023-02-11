import 'dart:developer';

import 'package:flutter_project/apis/user_api.dart';
import 'package:flutter_project/db/repositories/user_repository.dart';
import 'package:flutter_project/models/user.dart';

import '../db/collections/user.dart' as isar;

class AuthService {
  final UserRepository _userRepository;
  final UserApi _userApi;

  AuthService(
    this._userApi,
    this._userRepository,
  );

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
      throw Exception(e);
    }
  }

  Future<bool> logout() async {
    try {
      // delete all data during logout
      // delete user data
      final isUserDeleted = await _userRepository.deleteUser();

      // delete cached data - products

      // return deleted tasks
      return isUserDeleted;
    } catch (e) {
      log(e.toString());
      throw Exception(e);
    }
  }
}

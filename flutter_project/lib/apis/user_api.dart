import 'dart:developer';

import 'package:flutter_project/apis/dummy_json_api.dart';
import 'package:flutter_project/models/user.dart';

class UserApi extends DummyJsonApi {
  @override
  String get collectionName => 'users';

  // add user - dummy json should return requested user to add
  // NOTE: dummyjson does not add user to its server but just return requested data
  Future<User> addUser(User userToAdd) async {
    try {
      final responseJson = await postAddObject(
        userToAdd.toAddJson(),
        '/$collectionName/add',
      );
      return User.fromJson(responseJson);
    } catch (e) {
      log(e.toString());
      throw Exception(e);
    }
  }

  // login user and get jwt token
  // NOTE: dummyjson does not add users to its servers so dummy user data needs
  // to be used to get real token
  // look at User.toLoginJson method for dummy data or check out
  // https://dummyjson.com/users to get working token
  Future<User> loginUser(User userToLogin) async {
    try {
      final responseJson = await postAddObject(
        userToLogin.toLoginJson(),
        '/auth/login',
      );
      return User.fromJson(responseJson);
    } catch (e) {
      log(e.toString());
      throw Exception(e);
    }
  }
}

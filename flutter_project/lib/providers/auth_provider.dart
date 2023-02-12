import 'package:flutter/foundation.dart';
import 'package:flutter_project/services/auth_service.dart';
import 'package:flutter_project/utils/error_helper.dart';

import '../models/user.dart';

class AuthProvider extends ChangeNotifier {
  final AuthService _authService;

  AuthProvider(this._authService);

  User? _user;
  User get user => _user!;
  bool get isLoggedIn => _user != null;
  String? get jwtToken => _user?.jwtToken;
  bool isSubmitting = false;
  String? _errorMessage;
  String? get errorMessage => _errorMessage;

  Future<User?> initializeOnStartup() async {
    final existingUser = await _authService.getInitialUser();
    _user = existingUser;
    return existingUser;
  }

  Future login(String userName, String password) async {
    isSubmitting = true;
    notifyListeners();
    try {
      final user = await _authService.login(userName, password);
      _user = user;
      _errorMessage = null;
    } catch (e) {
      _errorMessage = ErrorHelper.defaultErrorText;
    }

    isSubmitting = false;
    notifyListeners();
  }

  Future register({
    required String username,
    required String password,
    required String firstName,
    required String lastName,
  }) async {
    isSubmitting = true;
    notifyListeners();
    final user = await _authService.register(
      username: username,
      password: password,
      firstName: firstName,
      lastName: lastName,
    );
    _user = user;
    isSubmitting = false;
    notifyListeners();
  }

  Future<String?> logout() async {
    final isAllDataDeleted = await _authService.logout();
    if (!isAllDataDeleted) {
      return ErrorHelper.defaultErrorText;
    }

    // else dispose and notify listeners
    _user = null;
    notifyListeners();
    return null;
  }

  @override
  void dispose() {
    super.dispose();
    _user = null;
  }
}

class Validator {
  static const userNameEmpty = 'You must provide username';
  static const userNameSpecialSigns =
      'You must provide username without special signs (only letters and digits)';
  static const userNameTooLong =
      'You must provide username with not more than 20 characters';

  static const passwordEmpty = 'You must provide password';
  static const passwordWhiteSpace =
      'You must provide password without whitespaces';
  static const passwordSpecialSigns =
      'You must provide passoword with at least one special sign';
  static const passwordTooLong =
      'You must provide username with not more than 20 characters';

  static const nameEmpty = 'You must provide your name';
  static const nameSpecialSigns =
      'You must provide your name without special signs';
  static const nameTooLong =
      'You must provide your name with not more than 50 characters';

  static const confirmPasswordNotTheSame =
      'Confirmation passowrd must be the same as password';

  static String? validateUserName(String? username) {
    if (username == null || username.isEmpty) return userNameEmpty;
    if (username.length > 20) return userNameTooLong;
    if (!_containsOnlyAlphanumericChars(username)) return userNameSpecialSigns;

    return null;
  }

  static String? validatePassword(String? password) {
    if (password == null || password.isEmpty) return passwordEmpty;
    if (password.length > 50) return passwordTooLong;
    if (password.contains(' ')) return passwordWhiteSpace;
    //if (_containsOnlyAlphanumericChars(password)) return passwordSpecialSigns;

    return null;
  }

  static String? validateConfirmPassword(
    String? confirmPassword,
    String? password,
  ) {
    if (confirmPassword != password) return confirmPasswordNotTheSame;

    return null;
  }

  static String? validateName(String? name) {
    if (name == null || name.isEmpty) return nameEmpty;
    if (name.length > 50) return nameTooLong;
    if (!_containsOnlyAlphanumericChars(name)) return nameSpecialSigns;

    return null;
  }

  static bool _containsOnlyAlphanumericChars(String input) {
    final regEx = RegExp(r'^[a-zA-z0-9]+$');
    return regEx.hasMatch(input);
  }
}

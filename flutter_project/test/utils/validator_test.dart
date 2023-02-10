import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_project/utils/validator.dart';

void main() {
  group(
    'validator',
    () {
      group(
        'username',
        () {
          test(
            'empty should return error text',
            () => _testValidator(
              input: '',
              usedFunction: Validator.validateUserName,
              expectedValue: Validator.userNameEmpty,
            ),
          );
          test(
            'null should return error text',
            () => _testValidator(
              input: null,
              usedFunction: Validator.validateUserName,
              expectedValue: Validator.userNameEmpty,
            ),
          );
          test(
            'too long should return error text',
            () => _testValidator(
              input: List.generate(21, (index) => 'a').join(''),
              usedFunction: Validator.validateUserName,
              expectedValue: Validator.userNameTooLong,
            ),
          );
          test(
            'with whitespaces should return error text',
            () => _testValidator(
              input: 'pablo rouve',
              usedFunction: Validator.validateUserName,
              expectedValue: Validator.userNameSpecialSigns,
            ),
          );
          test(
            'with specialSigns should return error text',
            () => _testValidator(
              input: 'tom;_ns',
              usedFunction: Validator.validateUserName,
              expectedValue: Validator.userNameSpecialSigns,
            ),
          );
          test(
            'valid should return null',
            () => _testValidator(
              input: 'tomSuper881',
              usedFunction: Validator.validateUserName,
              expectedValue: null,
            ),
          );
        },
      );
      group(
        'password',
        () {
          test(
            'empty should return error text',
            () => _testValidator(
              input: '',
              usedFunction: Validator.validatePassword,
              expectedValue: Validator.passwordEmpty,
            ),
          );
          test(
            'null should return error text',
            () => _testValidator(
              input: null,
              usedFunction: Validator.validatePassword,
              expectedValue: Validator.passwordEmpty,
            ),
          );
          test(
            'without special signs should return error text',
            () => _testValidator(
              input: 'test123',
              usedFunction: Validator.validatePassword,
              expectedValue: Validator.passwordSpecialSigns,
            ),
          );
          test(
            'too long should return error text',
            () => _testValidator(
              input: List.generate(51, (index) => 'a').join('_'),
              usedFunction: Validator.validatePassword,
              expectedValue: Validator.passwordTooLong,
            ),
          );
          test(
            'with whitespace should return error text',
            () => _testValidator(
              input: 'test!23 45',
              usedFunction: Validator.validatePassword,
              expectedValue: Validator.passwordWhiteSpace,
            ),
          );
          test(
            'valid should return null',
            () => _testValidator(
              input: 'test!23',
              usedFunction: Validator.validatePassword,
              expectedValue: null,
            ),
          );
        },
      );
      group(
        'confirm passoword',
        () {
          test(
            'not the same as passowrd should return error text',
            () => _testConfirmPassword(
              password: 'aaa',
              confirmPassword: 'aab',
              expectedValue: Validator.confirmPasswordNotTheSame,
            ),
          );
          test(
            'the same as passowrd should return null',
            () => _testConfirmPassword(
              password: 'aaa',
              confirmPassword: 'aaa',
              expectedValue: null,
            ),
          );
        },
      );
      group(
        'name',
        () {
          test(
            'empty should return error text',
            () => _testValidator(
              input: '',
              usedFunction: Validator.validateName,
              expectedValue: Validator.nameEmpty,
            ),
          );
          test(
            'null should return error text',
            () => _testValidator(
              input: null,
              usedFunction: Validator.validateName,
              expectedValue: Validator.nameEmpty,
            ),
          );
          test(
            'with special signs should return error text',
            () => _testValidator(
              input: 'Joh!n',
              usedFunction: Validator.validateName,
              expectedValue: Validator.nameSpecialSigns,
            ),
          );
          test(
            'with whitespace should return error text',
            () => _testValidator(
              input: List.generate(51, (index) => 'a').join(),
              usedFunction: Validator.validateName,
              expectedValue: Validator.nameTooLong,
            ),
          );
          test(
            'valid should return null',
            () => _testValidator(
              input: 'McKenzie',
              usedFunction: Validator.validateName,
              expectedValue: null,
            ),
          );
        },
      );
    },
  );
}

void _testValidator({
  required String? input,
  required String? expectedValue,
  required String? Function(String?) usedFunction,
}) {
  final resultValue = usedFunction(input);
  expect(resultValue, expectedValue);
}

void _testConfirmPassword({
  required String password,
  required String confirmPassword,
  required String? expectedValue,
}) {
  final resultValue =
      Validator.validateConfirmPassword(confirmPassword, password);
  expect(resultValue, expectedValue);
}

import 'package:form_field_validator/form_field_validator.dart';

import '../shared/resources/app_strings.dart';

class FormValidator {
  static RequiredValidator requiredValidator =
      RequiredValidator(errorText: 'required');

  static MultiValidator emailValidator = MultiValidator([
    RequiredValidator(errorText: 'required'),
    EmailValidator(errorText: 'Enter a valid email address'),
  ]);

  static MultiValidator passwordValidator = MultiValidator([
    RequiredValidator(errorText: 'required'),
    MinLengthValidator(8, errorText: 'Password must be at least 8 characters'),
    PatternValidator(AppStrings.sPasswordRegEx,
        errorText:
            'Password must have at least one special character, uppercase and lowercase'),
  ]);

  MultiValidator confirmPasswordValidator = MultiValidator([
    RequiredValidator(errorText: 'required'),
  ]);

  static passwordMatchValidator(value, otherValue) {
    RequiredValidator(errorText: 'required');
    return MatchValidator(errorText: 'Password Mismatch')
        .validateMatch(value, otherValue);
  }
}

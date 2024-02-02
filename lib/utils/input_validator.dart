import 'package:get/get.dart';

abstract class InputValidator {
  static final RegExp passwordRegex = RegExp(
    r'^(?=.*[a-z])(?=.*[A-Z])(?=.*[!@#$%^&*(),.?":{}|<>])'
    r'(?=.*[0-9].*[0-9].*[0-9].*[0-9].*[0-9].*[0-9])[a-zA-Z0-9!@#$%^&*(),.?":{}|<>]{8,}$',
  );
  static final _phoneNumberRegex = RegExp(r'^(092|091|094|093)\d{7}$');

  static String? isRequired(String key, String? value) {
    if (value == null || value.isEmpty) {
      return '$key is required.';
    }
    return null;
  }

  static String? isUsername(String? value) {
    final empty = isRequired('Username', value);
    if (empty != null) {
      return empty;
    } else if (!(value![0].isAlphabetOnly == true)) {
      return 'Username should start with a letter.';
    }
    return null;
  }

  //
  // static String? isEmail(String? value) {
  //   final empty = isRequired('Email', value);
  //   if (empty != null) {
  //     return empty;
  //   } else if (!value!.trim().isEmail) {
  //     return 'Write valid email address.';
  //   }
  //   return null;
  // }

  static String? isPhoneNumber(String? value) {
    final empty = isRequired('Phone number', value);
    if (empty != null) {
      return empty;
    } else if (!_phoneNumberRegex.hasMatch(value!.trim())) {
      return 'Write valid phone number.';
    }
    return null;
  }

  static String? isEmail(String? value) {
    final empty = isRequired('Phone number', value);
    if (empty != null) {
      return empty;
    }
    return null;
  }

  static String? isValidPassword(String? value) {
    final password = value?.trim();
    final empty = isRequired('Password', password);
    if (empty != null) {
      return empty;
    }
    if (!passwordRegex.hasMatch(password!)) {
      if (password.length < 8) {
        return 'Password is too short it must be at least 8 characters.';
      } else if (!RegExp(r'[a-z]').hasMatch(password)) {
        return 'Password should contain at least one lowercase letter.';
      } else if (!RegExp(r'[A-Z]').hasMatch(password)) {
        return 'Password should contain at least one uppercase letter.';
        // } else if (!RegExp(r'[!@#$%^&*(),.?":{}|<>]').hasMatch(value)) {
        //   return 'Password should contain at least one symbol.';
      } else if (!RegExp(r'[0-9]').hasMatch(password)) {
        return 'Password should contain at least one digit number.';
      }
    }

    return null;
  }

  static String? isMatchPasswordConfirmation(String? v1, String? v2) {
    final empty = isRequired('Password Confirmation', v2);
    if (empty != null) {
      return empty;
    } else if (v1 != v2) {
      return 'Password Confirmation is not match password.';
    }
    return null;
  }
}

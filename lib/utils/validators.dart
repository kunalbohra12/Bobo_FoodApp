// validators.dart
class Validators {
  static final RegExp _emailRegex = RegExp(
    r"^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$",
  );

  static final RegExp _passwordRegex = RegExp(
    r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9]).{8,}$',
  );

  /// Returns null if valid, or error message string if invalid
  static String? validateEmail(String email) {
    if (email.trim().isEmpty) {
      return 'Email is required';
    } else if (!_emailRegex.hasMatch(email.trim())) {
      return 'Enter a valid email';
    }
    return null;
  }

  /// Returns null if valid, or error message string if invalid
  static String? validatePassword(String password) {
    if (password.isEmpty) {
      return 'Password is required';
    } else if (!_passwordRegex.hasMatch(password)) {
      return 'Password must be 8+ chars, include upper, lower & number';
    }
    return null;
  }

  /// Returns null if checked, or error message if not checked
  static String? validateCheckbox(bool isChecked) {
    if (!isChecked) {
      return 'You must accept the terms';
    }
    return null;
  }
}

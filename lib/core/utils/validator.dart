class AppValidators {
  AppValidators._();

  /// Name Validator
  static String? validateName(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Name is required';
    }

    if (value.trim().length < 3) {
      return 'Name must be at least 3 characters';
    }

    if (!RegExp(r"^[a-zA-Z\s]+$").hasMatch(value.trim())) {
      return 'Name can only contain letters';
    }

    return null;
  }

  /// Email Validator
  static String? validateEmail(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Email is required';
    }

    const emailPattern = r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$';

    if (!RegExp(emailPattern).hasMatch(value.trim())) {
      return 'Enter a valid email address';
    }

    return null;
  }

  /// Password Validator
  static String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Password is required';
    }

    if (value.length < 8) {
      return 'Password must be at least 8 characters';
    }

    if (!RegExp(r'[A-Z]').hasMatch(value)) {
      return 'Must contain at least one uppercase letter';
    }

    if (!RegExp(r'[a-z]').hasMatch(value)) {
      return 'Must contain at least one lowercase letter';
    }

    if (!RegExp(r'[0-9]').hasMatch(value)) {
      return 'Must contain at least one number';
    }

    if (!RegExp(r'[!@#$%^&*(),.?":{}|<>]').hasMatch(value)) {
      return 'Must contain at least one special character';
    }

    return null;
  }

  /// Confirm Password Validator
  static String? validateConfirmPassword(String? value, String password) {
    if (value == null || value.isEmpty) {
      return 'Please confirm your password';
    }

    if (value != password) {
      return 'Passwords do not match';
    }

    return null;
  }

  // Price
  static String? validatePrice(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Price is required';
    }

    final price = double.tryParse(value);

    if (price == null) {
      return 'Enter a valid price';
    }

    if (price <= 0) {
      return 'Price must be greater than 0';
    }

    return null;
  }

  // Text
  static String? validateText(
    String? value, {
    String fieldName = 'Field',
    int minLength = 3,
    int maxLength = 50,
  }) {
    if (value == null || value.trim().isEmpty) {
      return '$fieldName is required';
    }

    final text = value.trim();

    if (text.length < minLength) {
      return '$fieldName must be at least $minLength characters';
    }

    if (text.length > maxLength) {
      return '$fieldName must not exceed $maxLength characters';
    }

    final regex = RegExp(r"[a-zA-Z0-9\u0600-\u06FF\s.,!?:;()\-']");

    if (!regex.hasMatch(text)) {
      return '$fieldName contains invalid characters';
    }

    return null;
  }
}

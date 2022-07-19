class Validator {
  String? emailValidator(String value) {
    if (value.isEmpty) {
      return 'Enter Your Email';
    } else if (!value.contains('@')) {
      return 'Invalid email';
    }
    return null;
  }

  String? passwordValidator(String value) {
    if (value.isEmpty) {
      return 'Enter Your Password';
    } else if (value.length < 6 || value.length > 32) {
      return 'Password must be 6-32 characters';
    }
    return null;
  }
}

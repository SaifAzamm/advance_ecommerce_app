class Validators {
  
  // Username Validator
  static String? validateUsername(String? value) {
    if (value == null || value.isEmpty) {
      return "Username is required";
    } else if (value.length < 4) {
      return "Username must be at least 4 characters long";
    } else {
      return null;
    }
  }

  // Password Validator
  static String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return "Password is required";
    } else if (value.length < 4) {
      return "Password must be at least 8 characters long";
    } else {
      return null;
    }
  }
}

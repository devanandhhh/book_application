class ValidationService {
  // Validates that the name has at least 4 characters and contains only letters
  String? validateName(String name) {
    if (name.isEmpty) {
      return 'Name cannot be empty';
    } else if (name.length < 4) {
      return 'Name must be at least 4 characters long';
    } else if (!RegExp(r'^[a-zA-Z]+$').hasMatch(name)) {
      return 'Name can only contain letters';
    }
    return null; // null means the name is valid
  }

  // Validates that the password has at least 4 characters
  String? validatePassword(String password) {
    if (password.isEmpty) {
      return 'Password cannot be empty';
    } else if (password.length < 4) {
      return 'Password must be at least 4 characters long';
    }
    return null; // null means the password is valid
  }

  String? validateConfirmPassword(String password, String confirmPassword) {
    if (confirmPassword.isEmpty) {
      return 'Confirm password cannot be empty';
    } else if (password != confirmPassword) {
      return 'Passwords do not match';
    }
    return null;
  }
}

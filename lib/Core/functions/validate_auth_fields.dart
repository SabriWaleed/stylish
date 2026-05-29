String? validateEmailField(String? value) {
  if (value == null || value.isEmpty) {
    return "Please enter email";
  }
  if (!value.contains("@")) {
    return "Enter valid email";
  }
  return null;
}

String? validatePasswordField(String? value) {
  if (value == null || value.isEmpty) {
    return "Please enter password";
  }

  if (value.length < 6) {
    return "Password must be at least 6 characters";
  }

  return null;
}

String? validateNameField(String? value) {
  if (value == null || value.trim().isEmpty) {
    return 'Please enter name';
  }
  return null;
}

String? validateConfirmPasswordField(String? confirm, String? password) {
  final passwordError = validatePasswordField(confirm);
  if (passwordError != null) return passwordError;
  if (confirm != password) return 'Passwords do not match';
  return null;
}

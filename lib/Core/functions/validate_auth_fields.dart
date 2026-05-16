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

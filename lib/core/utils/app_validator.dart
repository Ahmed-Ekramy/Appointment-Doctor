class AppValidators {
static String? name(String? value) {
  if (value == null || value.isEmpty) {
    return "Name is required";
  }
  return null;
}

  static String? email(String? value) {
    if (value == null || value.isEmpty) {
      return "Email is required";
    }

    final emailRegex =
    RegExp(r"^[\w-.]+@([\w-]+\.)+[\w-]{2,4}$");

    if (!emailRegex.hasMatch(value)) {
      return "Invalid email";
    }

    return null;
  }

  static String? password(String? value) {
    if (value == null || value.isEmpty) {
      return "Password is required";
    }

    if (value.length < 8) {
      return "Password must be at least 8 characters";
    }
    return null;
  }
  static String? confirmPassword(String? value, String password) {
    if (value == null || value.isEmpty) {
      return "Confirm password is required";
    }
    if (value != password) {
      return "Passwords do not match";
    }
    return null;


  }
  static String? phone(String? value) {
    if (value == null || value.isEmpty) {
      return "Phone number is required";
    }

    final phoneRegex = RegExp(r"^\d{11}$");
    if (!phoneRegex.hasMatch(value)) {
      return "Invalid phone number";
    }

    return null;
  }
  static String? gender(String? value) {
    if (value == null || value.isEmpty) {
      return "Gender is required";
    }
    return null;
  }
}
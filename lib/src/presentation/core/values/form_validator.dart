extension ExtString on String {
  bool get isValidEmail {
    final emailRegExp = RegExp(r"^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
    return emailRegExp.hasMatch(this);
  }

  bool get isValidName {
    final nameRegExp =
        RegExp(r"^\s*([A-Za-z]{1,}([\.,] |[-']| ))+[A-Za-z]+\.?\s*$");
    return nameRegExp.hasMatch(this);
  }

  bool get isValidPassword {
    final passwordRegExp = RegExp(
        r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\><*~]).{8,}/pre>');
    return passwordRegExp.hasMatch(this);
  }

  bool get isValidPhone {
    final phoneRegExp = RegExp(r"^\+?0[0-9]{10}$");
    return phoneRegExp.hasMatch(this);
  }
}


/* class TextFieldValidation {
  static bool phoneValidate(String value) {
    final regExp = RegExp(r'^[6-9]\d{9}$');
    return regExp.hasMatch(value);
  }

  static String? mobileValidate(String value) {
    String patttern = r'(^(?:[+0]9)?[0-9]{10,12}$)';
    RegExp regExp = RegExp(patttern);
    if (value.isEmpty) {
      return 'Please enter phone number';
    } else if (!regExp.hasMatch(value)) {
      return 'Please enter valid phone number';
    }
    return null;
  }

  static String? nameValidate(String value) {
    if (value.isEmpty) {
      return 'Please enter name';
    } else {
      return null;
    }
  }

  static String? passwordValidate(String value) {
    if (value.isEmpty) {
      return "Please enter password";
    } else if (value.length < 8) {
      return "Must be at least 8 characters";
    } else {
      return null;
    }
  }

  static String? confirmPasswordValidate(String value, String password) {
    if (value.isEmpty) {
      return "Please enter password";
    } else if (value != password) {
      return "Both passwords must match";
    } else {
      return null;
    }
  }

  static bool? emptyValidate(String value) {
    if (value.isEmpty) {
      return false; //"Can't be empty";
    } else {
      return true;
    }
  }

  static bool defaultValidate(String value) {
    final regExp = RegExp(r'^[A-Za-z0-9](?!.*?\s$)[A-Za-z0-9\s]{0,9}$');
    return regExp.hasMatch(value);
  }

  static bool emailValidate(String value) {
    return RegExp(
      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$',
    ).hasMatch(value);
  }

  static bool vehRegNoValidate(String value) {
    final regExp = RegExp(
      r'(^[a-zA-Z]{2}[ -]?\d{1,2}[ -]?[a-zA-Z]{0,2}[- ]?[a-zA-Z]{0,2}\d{1,4}$)|(^[a-zA-Z]{3}[ -]?\d{1,4}$)|(^DL[ -]?\d{1,2}[ -]?[a-zA-Z]{1}[ -]?[a-zA-Z]{1,2}[ -]\d{1,4})',
    );
    return regExp.hasMatch(value);
  }

  static bool checkUrl(String value) {
    String urlPattern =
        "((http|https)://)(www.)?[a-zA-Z0-9@:%._\\+~#?&//=]{2,256}\\.[a-z]{2,6}\\b([-a-zA-Z0-9@:%._\\+~#?&//=]*)";
    RegExp regExp = RegExp(urlPattern);
    return regExp.hasMatch(value);
  }

  static bool kmdrivenValidate(String value) {
    final regExp = RegExp(r'^[1-9]\d*$');
    return regExp.hasMatch(value);
  }
}
 */
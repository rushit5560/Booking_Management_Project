import 'dart:developer';

class FieldValidator {
  //final signUpScreenController = Get.find<SignUpScreenController>();

  String? validateFullName(String value) {
    /*if (value.isEmpty) {
      return 'Field is required';
    }
    return null;*/
    if (value.isEmpty) {
      return 'Full name is required';
    }

    // else if (!value[0].contains(RegExp(r'^(?=.*?[A-Z])')) ||
    //     !value[0].contains(RegExp(r'^(?=.*?[a-z])'))) {
    //   return "First character should be alphabet";
    // }

    else {
      return null;
    }
  }

  String? validateAddress1(String value) {
    if (value.isEmpty) {
      return 'Address1 is required';
    }
    return null;
  }

  String? validateAddress2(String value) {
    if (value.isEmpty) {
      return 'Address2 is required';
    }
    return null;
  }

  String? validateStreet(String value) {
    if (value.isEmpty) {
      return 'Street is required';
    }
    return null;
  }

  String? validatePostCode(String value) {
    if (value.isEmpty) {
      return 'Post code is required';
    }
    return null;
  }

  String? validateSuburb(String value) {
    if (value.isEmpty) {
      return 'Sub urb is required';
    }
    return null;
  }

  String? validateBusinessId(String value) {
    if (value.isEmpty) {
      return 'Business id is required';
    }
    return null;
  }

  String? validateBusinessName(String value) {
    if (value.isEmpty) {
      return 'Business name is required';
    }
    return null;
  }

  String? validateFinancialInstituteName(String value) {
    if (value.isEmpty) {
      return 'Financial institute name is required';
    }
    return null;
  }

  String? validateAccountName(String value) {
    if (value.isEmpty) {
      return 'Account name is required';
    }
    return null;
  }

  String? validateAccountNumber(String value) {
    if (value.isEmpty) {
      return 'Account number is required';
    }
    return null;
  }

  String? validateIfscCode(String value) {
    if (value.isEmpty) {
      return 'IFSC/BSB code is required';
    }
    return null;
  }

  String? validateState(String value) {
    if (value.isEmpty) {
      return 'State is required';
    }
    return null;
  }

  String? validateCity(String value) {
    if (value.isEmpty) {
      return 'City is required';
    }
    return null;
  }

  String? validateFirstName(String value) {
    if (value.isEmpty) {
      return 'First name is required';
    }
    return null;
  }

  String? validateLastName(String value) {
    if (value.isEmpty) {
      return 'Last name is required';
    }
    return null;
  }

  String? validateGender(String value) {
    if (value.isEmpty) {
      return 'Gender is required';
    }
    return null;
  }

  String? validateUserName(String value) {
    // String pattern = r'^(?=.*?[A-Z])';
    // RegExp regExp = RegExp(pattern);
    //return
    if (value.isEmpty) {
      return 'Username is required';
    }
    // else {
    //   if (!regExp.hasMatch(value)) {
    //     return 'Atleast 1 uppercase letter is required';
    //   }
    // }
    return null;
  }

  String? validateServiceName(String value) {
    String pattern = r'^(?=.*?[A-Z])';
    RegExp regExp = RegExp(pattern);
    //return
    if (value.isEmpty) {
      return 'Service name is required';
    } else {
      if (!regExp.hasMatch(value[0])) {
        return 'AtLeast 1 uppercase letter is required';
      }
    }
    return null;
  }

  String? validateAdditionalSlotName(String value) {
    // String  pattern = r'^(?=.*?[A-Z])';
    // RegExp regExp =  RegExp(pattern);
    //return
    if (value.isEmpty) {
      return 'Additional slot is required';
    }
    /*else{
      if(!regExp.hasMatch(value)){
        return 'AtLeast 1 uppercase letter is required';
      }
    }*/
    return null;
  }

  String? validateCityName(String value) {
    if (value.isEmpty) {
      return 'City is required';
    }
    return null;
  }

  String? validateStateName(String value) {
    if (value.isEmpty) {
      return 'State is required';
    }
    return null;
  }

  // String? validateBusinessId(String value) {
  //   if (value.isEmpty) {
  //     return 'Business id is required';
  //   }
  //   return null;
  // }

  String? validateCountryName(String value) {
    if (value.isEmpty) {
      return 'Country is required';
    }
    return null;
  }

  String? validateName(String value) {
    if (value.isEmpty) {
      return 'Name is required';
    }
    return null;
  }

  String? validateNotes(String value) {
    if (value.isEmpty) {
      return 'Notes is required';
    }
    return null;
  }

  String? validateColor(String value) {
    if (value.isEmpty) {
      return 'Color is required';
    }
    return null;
  }

  String? validateDescription(String value) {
    if (value.isEmpty) {
      return 'Description is required';
    }
    return null;
  }

  String? validateShortDescription(String value) {
    if (value.isEmpty) {
      return 'Short description is required';
    }
    return null;
  }

  String? validateLongDescription(String value) {
    if (value.isEmpty) {
      return 'Long description is required';
    }
    return null;
  }

  String? validateCapacity(String value) {
    if (value.isEmpty) {
      return 'Capacity is required';
    }
    return null;
  }

  String? validatePrice(String value) {
    if (value.isEmpty) {
      return 'Price is required';
    } else if (value.contains("-")) {
      return 'Invalid price';
    }
    return null;
  }

  String? validateLocation(String value) {
    if (value.isEmpty) {
      return 'Location is required';
    }
    return null;
  }

  String? validateAge(String value) {
    if (value.isEmpty) {
      return 'Age is required';
    }
    return null;
  }

  String? validateEmail(String value) {
    if (value.isEmpty) {
      return "Email is required";
    } else if (!isNumeric(value) &&
        !RegExp(r"[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'*+/=?^_`{|}~-]+)*@(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?")
            .hasMatch(value)) {
      return "Invalid email";
    } else {
      return null;
    }
  }

  String? validatePassword(String value) {
    if (value.isEmpty) {
      return "Password is required";
    } else if (value.length < 8) {
      return "Password must be at least 8 characters";
    } else if (!value.contains(RegExp(r'[A-Z]'))) {
      return "Password must be at least one upper case letter";
    } else if (!value.contains(RegExp(r"[a-z]"))) {
      return "Password must be at least one lower case letter";
    } else if (!value.contains(RegExp(r"[0-9]"))) {
      return "Password must be at least one numerical letter";
    } else if (!value.contains(RegExp(r'[!@#$%^&*(),.?":{}|<>]'))) {
      return "Password must be at least one special character";
    } else {
      return null;
    }
  }

  String? validateBusinessName123(String value) {
    // String v1 = "${value[0]}";
    // log("v1 : $v1");

    if (value.isEmpty) {
      return 'Business name is required';
    } else if (!value[0].contains(RegExp(r'^(?=.*?[A-Z])'))) {
      return "First character should be alphabet";
    } else {
      return null;
    }
  }

  String? validateCurrentPassword(String value) {
    if (value.isEmpty) {
      return "Current password is required";
    } else if (value.length < 8) {
      return "Password must be at least 8 characters";
    } else if (!value.contains(RegExp(r'[A-Z]'))) {
      return "Password must be at least one upper case letter";
    } else if (!value.contains(RegExp(r"[a-z]"))) {
      return "Password must be at least one lower case letter";
    } else if (!value.contains(RegExp(r"[0-9]"))) {
      return "Password must be at least one numerical letter";
    } else if (!value.contains(RegExp(r'[!@#$%^&*(),.?":{}|<>]'))) {
      return "Password must be at least one special character";
    } else {
      return null;
    }
  }

  String? validateNewPassword(String value) {
    if (value.isEmpty) {
      return "New password is required";
    } else if (value.length < 8) {
      return "Password must be at least 8 characters";
    } else if (!value.contains(RegExp(r'[A-Z]'))) {
      return "Password must be at least one upper case letter";
    } else if (!value.contains(RegExp(r"[a-z]"))) {
      return "Password must be at least one lower case letter";
    } else if (!value.contains(RegExp(r"[0-9]"))) {
      return "Password must be at least one numerical letter";
    } else if (!value.contains(RegExp(r'[!@#$%^&*(),.?":{}|<>]'))) {
      return "Password must be at least one special character";
    } else {
      return null;
    }
  }

  String? validateConfirmPassword(String value, String value2) {
    if (value.isEmpty) {
      return "Confirm password is required";
    } else if (value != value2) {
      return "Password must be at least one special character";
    } else {
      return null;
    }
  }

  String? validateMobile(String value) {
// Indian Mobile number are of 10 digit only
    if (value.isEmpty) {
      return "Mobile number is required";
    } else if (value.contains("-")) {
      return 'Invalid mobile number';
    } else if (value.length < 10 || value.length > 12) {
      return 'Mobile number must be of 10 to 12 digit';
    } else {
      return null;
    }
  }

  bool isNumeric(String s) {
    if (s.isEmpty) {
      return false;
    }
    return double.tryParse(s) != null;
  }

  String? validateAddress(String value) {
    if (value.isEmpty) {
      return 'Address is required';
    }
    return null;
  }

  String? validateReview(String value) {
    if (value.isEmpty) {
      return 'Review is required';
    }
    return null;
  }

  String? validateResourceName(String value) {
    if (value.isEmpty) {
      return 'Resource name is required';
    }
    return null;
  }

  String? validateResourceDetail(String value) {
    if (value.isEmpty) {
      return 'Resource details is required';
    }
    return null;
  }
}

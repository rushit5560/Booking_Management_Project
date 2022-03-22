class FieldValidator {
  //final signUpScreenController = Get.find<SignUpScreenController>();

  String? validateFullName(String value) {
    if (value.isEmpty) {
      return 'Name is Required';
    }
    return null;
  }

  String? validateColor(String value) {
    if (value.isEmpty) {
      return 'Color is Required';
    }
    return null;
  }

  String? validateDescription(String value) {
    if (value.isEmpty) {
      return 'Description is Required';
    }
    return null;
  }

  String? validatePrice(String value) {
    if (value.isEmpty) {
      return 'Price is Required';
    }
    return null;
  }

  String? validateLocation(String value) {
    if (value.isEmpty) {
      return 'Location is Required';
    }
    return null;
  }


  String? validateAge(String value) {
    if (value.isEmpty) {
      return 'Age is Required';
    }
    return null;
  }

  String ? validateEmail(String value) {
    if (value.isEmpty) {
      return "Email is Required";
    } else if (!isNumeric(value) &&
        !RegExp(r"[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'*+/=?^_`{|}~-]+)*@(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?")
            .hasMatch(value)) {
      return "Invalid Email";
    } else {
      return null;
    }
  }

  String ? validatePassword(String value) {
    if (value.isEmpty) {
      return "password is Required";
    } else {
      return null;
    }
  }

 /* String ? validateConfimrPassword(String value) {
    if (value.isEmpty) {
      return "password is Required";
    } else if (value.length < 6) {
      return "Length should be 6 character";
    } else if (value != signUpScreenController.passwordTextFieldController.text){
      return "Password and Confirm password should be same";
    } else{
      return null;
    }
  }*/

  String ? validateMobile(String value) {
// Indian Mobile number are of 10 digit only
    if (value.isEmpty) {
      return "Mobile number is Required";
    }
    else if (value.length != 10){
      return 'Mobile Number must be of 10 digit';
    }
    else{
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
      return 'Address is Required';
    }
    return null;
  }
}

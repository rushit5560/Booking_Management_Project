import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../common_modules/field_decorations.dart';
import '../../../common_modules/field_validation.dart';
import '../../common_controller/forgot_password_screen_controller/forgot_password_screen_controller.dart';


class ForgotPasswordScreenEmailFieldModule extends StatelessWidget {
  ForgotPasswordScreenEmailFieldModule({Key? key}) : super(key: key);
  final screenController = Get.find<ForgotPasswordScreenController>();


  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: screenController.emailFieldController,
      keyboardType: TextInputType.emailAddress,
      validator: (value) => FieldValidator().validateEmail(value!),
      decoration: forgotPasswordFormFieldDecoration(hintText: 'Email', controller: screenController),
    );
  }
}

/*class SendCodeButtonModule extends StatelessWidget {
  SendCodeButtonModule({Key? key}) : super(key: key);
  final screenController = Get.find<ForgotPasswordScreenController>();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if(screenController.forgotPasswordFormKey.currentState!.validate()){
          screenController.forgotPasswordFunction(
            email: screenController.emailFieldController.text.trim()
          );
        }
      },
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                spreadRadius: 3,
                blurRadius: 5,
                color: Colors.grey.shade300,
                blurStyle: BlurStyle.outer,
              ),
            ]
        ),
        child: const Padding(
          padding: EdgeInsets.symmetric(horizontal: 15, vertical: 8),
          child: Text(
            'SEND CODE',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 15,
            ),
          ),
        ),
      ),
    );
  }
}*/

/*class CodeTextFieldModule extends StatelessWidget {
  CodeTextFieldModule({Key? key}) : super(key: key);

  final screenController = Get.find<ForgotPasswordScreenController>();

  static const int pinLength = 5;

  final bool _enable = true;
  final bool _cursorEnable = true;


  @override
  Widget build(BuildContext context) {
    return PinInputTextFormField(
      key: screenController.codeFormKey,
      pinLength: pinLength,
      decoration: screenController.pinDecoration!,
      controller: screenController.codeFieldController,
      textInputAction: TextInputAction.go,
      enabled: _enable,
      keyboardType: TextInputType.text,
      textCapitalization: TextCapitalization.characters,
      onSubmit: (pin) {
        if (screenController.codeFormKey.currentState!.validate()) {
          screenController.codeFormKey.currentState!.save();
        }
      },
      onChanged: (pin) {
        debugPrint('onChanged execute. pin:$pin');
      },
      onSaved: (pin) {
        debugPrint('onSaved pin:$pin');
      },
      validator: (pin) {
        if (pin!.isEmpty) {
         // setState(() {
            screenController.hasError.value = true;
          //});
          return 'Code cannot empty.';
        }
        if (pin.length < pinLength) {
          //setState(() {
          screenController.hasError.value = true;
          //});
          return 'Code is not completed.';
        }
        //setState(() {
        screenController.hasError.value = false;
       // });
        return null;
      },
      cursor: Cursor(
        width: 2,
        color: Colors.black,
        radius: const Radius.circular(1),
        enabled: _cursorEnable,
      ),
    );
  }
}*/

class ForgotPasswordScreenSubmitButtonModule extends StatelessWidget {
  ForgotPasswordScreenSubmitButtonModule({Key? key}) : super(key: key);
  final screenController = Get.find<ForgotPasswordScreenController>();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        if(screenController.forgotPasswordFormKey.currentState!.validate()){
          await screenController.forgotPasswordFunction(email: screenController.emailFieldController.text);
        }
      },
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                spreadRadius: 3,
                blurRadius: 5,
                color: Colors.grey.shade300,
                blurStyle: BlurStyle.outer,
              ),
            ]
        ),
        child: const Padding(
          padding: EdgeInsets.symmetric(horizontal: 15, vertical: 8),
          child: Text(
            'SUBMIT',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 15,
            ),
          ),
        ),
      ),
    );
  }
}

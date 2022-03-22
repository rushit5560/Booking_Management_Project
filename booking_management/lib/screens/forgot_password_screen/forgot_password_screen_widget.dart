import 'package:booking_management/common/field_decorations.dart';
import 'package:booking_management/common/field_validation.dart';
import 'package:booking_management/controllers/forgot_password_screen_controller/forgot_password_screen_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pin_input_text_field/pin_input_text_field.dart';

ForgotPasswordScreenController screenController = Get.find<ForgotPasswordScreenController>();

class EmailFieldModule extends StatelessWidget {
  const EmailFieldModule({Key? key}) : super(key: key);

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

class SendCodeButtonModule extends StatelessWidget {
  const SendCodeButtonModule({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if(screenController.forgotPasswordFormKey.currentState!.validate()){}
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
}

class CodeTextFieldModule extends StatelessWidget {
  //CodeTextFieldModule({Key? key}) : super(key: key);

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
}

class SubmitButtonModule extends StatelessWidget {
  const SubmitButtonModule({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if(screenController.codeFormKey.currentState!.validate()){}
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

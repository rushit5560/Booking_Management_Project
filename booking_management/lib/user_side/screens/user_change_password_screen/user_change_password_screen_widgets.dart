import 'package:booking_management/common_modules/field_decorations.dart';
import 'package:booking_management/common_modules/field_validation.dart';
import 'package:booking_management/user_side/controllers/user_change_password_screen_controller/user_change_password_screen_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';



class BackButtonModule extends StatelessWidget {
  const BackButtonModule({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Get.back();
      },
      child: Container(
        alignment: Alignment.topLeft,
        child: const Icon(Icons.arrow_back),
      ),
    );
  }
}

class UserNameModule extends StatelessWidget {
   UserNameModule({Key? key}) : super(key: key);
   UserChangePasswordScreenController screenController = Get.find<UserChangePasswordScreenController>();

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: screenController.userNameController,
      keyboardType: TextInputType.text,
      validator: (value) => FieldValidator().validateUserName(value!),
      decoration: changePasswordFormFieldDecoration(hintText: 'UserName', controller: screenController, context: context),
    );
  }
}

class CurrentPasswordTextFieldModule extends StatelessWidget {
  CurrentPasswordTextFieldModule({Key? key}) : super(key: key);
  UserChangePasswordScreenController screenController = Get.find<UserChangePasswordScreenController>();

  @override
  Widget build(BuildContext context) {
    return Obx(()=>
       TextFormField(
        controller: screenController.currentPasswordController,
        keyboardType: TextInputType.visiblePassword,
        obscureText: screenController.isPasswordVisible.value,
        validator: (value) => FieldValidator().validateCurrentPassword(value!),
        decoration: changePasswordFormFieldDecoration(hintText: 'Current Password', controller: screenController,index: 1, context: context,),
      ),
    );
  }
}

class NewPasswordTextFieldModule extends StatelessWidget {
  NewPasswordTextFieldModule({Key? key}) : super(key: key);
  UserChangePasswordScreenController screenController = Get.find<UserChangePasswordScreenController>();

  @override
  Widget build(BuildContext context) {
    return Obx(()=>
       TextFormField(
        controller: screenController.newPasswordController,
        keyboardType: TextInputType.visiblePassword,
        obscureText: screenController.isNewPasswordVisible.value,
        validator: (value) => FieldValidator().validateNewPassword(value!),
        decoration: changePasswordFormFieldDecoration(hintText: 'New Password', controller: screenController,index: 2, context: context),
      ),
    );
  }
}

class ConfirmPasswordTextFieldModule extends StatelessWidget {
  ConfirmPasswordTextFieldModule({Key? key}) : super(key: key);
  UserChangePasswordScreenController screenController = Get.find<UserChangePasswordScreenController>();

  @override
  Widget build(BuildContext context) {
    return Obx(()=>
        TextFormField(
        controller: screenController.confirmPasswordController,
        keyboardType: TextInputType.visiblePassword,
        obscureText: screenController.isConfirmPasswordVisible.value,
        validator: (value) => FieldValidator().validateConfirmPassword(value!, screenController.newPasswordController.text),
        decoration: changePasswordFormFieldDecoration(hintText: 'Confirm Password', controller: screenController, index:3, context: context),
      ),
    );
  }
}

class SaveButtonModule extends StatelessWidget {
  SaveButtonModule({Key? key}) : super(key: key);
  UserChangePasswordScreenController screenController = Get.find<UserChangePasswordScreenController>();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async{
        if(screenController.changePasswordFormKey.currentState!.validate()){
         await screenController.changePasswordFunction();
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
            'SAVE',
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


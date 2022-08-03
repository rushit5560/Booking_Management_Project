import 'package:booking_management/common_modules/extension_methods/extension_methods.dart';
import 'package:booking_management/common_modules/field_decorations.dart';
import 'package:booking_management/common_modules/field_validation.dart';
import 'package:booking_management/vendor_side/controllers/bank_info_screen_controller/bank_info_screen_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class FinancialInstituteNameFieldModule extends StatelessWidget {
  FinancialInstituteNameFieldModule({Key? key}) : super(key: key);
  final screenController = Get.find<BankInfoScreenController>();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Financial Institution Name",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
        ),
        TextFormField(
          controller: screenController.financialInstituteNameController,
          keyboardType: TextInputType.text,
          validator: (value) => FieldValidator().validateFinancialInstituteName(value!),
          decoration: bankInfoFieldDecoration(hintText: "Financial Institution Name"),
        ),
      ],
    ).commonAllSidePadding(10);
  }
}


class AccountNameFieldModule extends StatelessWidget {
  AccountNameFieldModule({Key? key}) : super(key: key);
  final screenController = Get.find<BankInfoScreenController>();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Account Name",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
        ),
        TextFormField(
          controller: screenController.accountNameController,
          keyboardType: TextInputType.text,
          validator: (value) => FieldValidator().validateAccountName(value!),
          decoration: bankInfoFieldDecoration(hintText: "Account Name"),
        ),
      ],
    ).commonAllSidePadding(10);
  }
}

class AccountNumberFieldModule extends StatelessWidget {
  AccountNumberFieldModule({Key? key}) : super(key: key);
  final screenController = Get.find<BankInfoScreenController>();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Account Number",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
        ),
        TextFormField(
          controller: screenController.accountNumberController,
          keyboardType: TextInputType.number,
          validator: (value) => FieldValidator().validateAccountNumber(value!),
          decoration: bankInfoFieldDecoration(hintText: "Account Number"),
        ),
      ],
    ).commonAllSidePadding(10);
  }
}

class IfscFieldModule extends StatelessWidget {
  IfscFieldModule({Key? key}) : super(key: key);
  final screenController = Get.find<BankInfoScreenController>();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "IFSC/BSB Code",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
        ),
        TextFormField(
          controller: screenController.ifscCodeController,
          keyboardType: TextInputType.text,
          validator: (value) => FieldValidator().validateIfscCode(value!),
          decoration: bankInfoFieldDecoration(hintText: "IFSC/BSB Code"),
        ),
      ],
    ).commonAllSidePadding(10);
  }
}

class SaveChangesButtonModule extends StatelessWidget {
  SaveChangesButtonModule({Key? key}) : super(key: key);
  final screenController = Get.find<BankInfoScreenController>();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        if(screenController.formKey.currentState!.validate()) {
          await screenController.saveBankInfoFunction();
        }
      },
      child: Container(
        decoration:
        BoxDecoration(borderRadius: BorderRadius.circular(10), boxShadow: [
          BoxShadow(
            spreadRadius: 3,
            blurRadius: 5,
            color: Colors.grey.shade300,
            blurStyle: BlurStyle.outer,
          ),
        ]),
        child: const Padding(
          padding: EdgeInsets.symmetric(horizontal: 22, vertical: 8),
          child: Text(
            'Save Changes',
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



import 'package:booking_management/common_modules/constants/app_colors.dart';
import 'package:booking_management/common_modules/container_decorations.dart';
import 'package:booking_management/common_modules/extension_methods/extension_methods.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../common_modules/field_decorations.dart';
import '../../../common_modules/field_validation.dart';
import '../../controllers/vendor_wallet_screen_controller/vendor_wallet_screen_controller.dart';

VendorWalletScreenController screenController = Get.find<VendorWalletScreenController>();

class AvailableBalTextModule extends StatelessWidget {
  const AvailableBalTextModule({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      'Available Balance',
      textAlign: TextAlign.start,
      style: TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 14,
      ),
    );
  }
}

class BalanceAmountModule extends StatelessWidget {
  const BalanceAmountModule({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Get.width,
      decoration: shadowDecoration(),
      child: const Padding(
        padding: EdgeInsets.symmetric(vertical: 20),
        child: Center(
          child: Text(
            '\$54212.00',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
          ),
        ),
      ),
    );
  }
}

class WalletSelectableTabModule extends StatelessWidget {
  const WalletSelectableTabModule({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _transactionsModule(),
        const SizedBox(width: 20),
        _sendRequest(),
      ],
    ).commonSymmetricPadding(vertical: 25);
  }

  Widget _transactionsModule() {
    return GestureDetector(
      onTap: () {
        screenController.isTransactionSelected.value = 0;
      },
      child: Obx(
        ()=> Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: screenController.isTransactionSelected.value == 0 ? AppColors.colorLightGrey1 : Colors.white,
            boxShadow: [
              BoxShadow(
                blurRadius: 5,
                color: AppColors.colorLightGrey,
                blurStyle: BlurStyle.outer,
              ),
            ],
          ),
          child: const Center(
            child: Text(
              'Transactions',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 12,
              ),
            ),
          ).commonSymmetricPadding(horizontal: 14, vertical: 12),
        ),
      ),
    );
  }

  Widget _sendRequest() {
    return GestureDetector(
      onTap: () {
        screenController.isTransactionSelected.value = 1;
      },
      child: Obx(
        ()=> Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: screenController.isTransactionSelected.value == 1 ? AppColors.colorLightGrey1 : Colors.white,
            boxShadow: [
              BoxShadow(
                blurRadius: 5,
                color: AppColors.colorLightGrey,
                blurStyle: BlurStyle.outer,

              ),
            ],
          ),
          child: const Center(
            child: Text(
              'Send Request',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 12,
              ),
            ),
          ).commonSymmetricPadding(horizontal: 14, vertical: 12),
        ),
      ),
    );
  }
}

class TransactionsListModule extends StatelessWidget {
  const TransactionsListModule({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 10,
      shrinkWrap: true,
      physics: const BouncingScrollPhysics(),
      itemBuilder: (context, i) {
        return Container(
          margin: EdgeInsets.only(bottom: 20, top: 5, left: 5, right: 5),
          decoration: shadowDecoration(),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text(
                      'Paid to Lorem Ipsum',
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                      ),
                    ),
                    SizedBox(height: 5),
                    Text(
                      '12 March 2022 at 12:00 PM',
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 5),
              const Text(
                '\$20.00',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 14,
                ),
              ),
            ],
          ).commonSymmetricPadding(vertical: 12, horizontal: 12),
        );
      },
    );
  }
}


class BankDetailsFormModule extends StatelessWidget {
  const BankDetailsFormModule({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Form(
        key: screenController.bankFormKey,
        child: Column(
          children: [
            _accountHolderNameModule(),
            const SizedBox(height: 5),
            _bankNameModule(),
            const SizedBox(height: 5),
            _branchCodeModule(),
            const SizedBox(height: 5),
            _accountNumberModule(),
            const SizedBox(height: 5),
            _amountModule(),
            const SizedBox(height: 35),
            _sendToBankButton(),
            const SizedBox(height: 25),
          ],
        ).commonAllSidePadding(15),
      ),
    );
  }

  Widget _accountHolderNameModule() {
    return TextFormField(
      controller: screenController.vAccountHolderNameFieldController,
      keyboardType: TextInputType.text,
      validator: (value) => FieldValidator().validateFullName(value!),
      decoration: vendorBankFormFieldDecoration(hintText: 'Account Holder Name', controller: screenController),
    );
  }

  Widget _bankNameModule() {
    return TextFormField(
      controller: screenController.vBankNameFieldController,
      keyboardType: TextInputType.text,
      validator: (value) => FieldValidator().validateFullName(value!),
      decoration: vendorBankFormFieldDecoration(hintText: 'Bank Name', controller: screenController),
    );
  }

  Widget _branchCodeModule() {
    return TextFormField(
      controller: screenController.vBranchCodeFieldController,
      keyboardType: TextInputType.text,
      validator: (value) => FieldValidator().validateFullName(value!),
      decoration: vendorBankFormFieldDecoration(hintText: 'Branch Code', controller: screenController),
    );
  }

  Widget _accountNumberModule() {
    return TextFormField(
      controller: screenController.vAccountNumberFieldController,
      keyboardType: TextInputType.number,
      validator: (value) => FieldValidator().validateFullName(value!),
      decoration: vendorBankFormFieldDecoration(hintText: 'Account Number', controller: screenController),
    );
  }

  Widget _amountModule() {
    return TextFormField(
      controller: screenController.vAmountFieldController,
      keyboardType: TextInputType.number,
      validator: (value) => FieldValidator().validateFullName(value!),
      decoration: vendorBankFormFieldDecoration(hintText: 'Amount', controller: screenController),
    );
  }

  Widget _sendToBankButton() {
    return GestureDetector(
      onTap: () {
        if(screenController.bankFormKey.currentState!.validate()){

        }
      },
      child: Container(
        decoration: shadowDecoration(),
        child: const Padding(
          padding: EdgeInsets.all(10),
          child: Text(
            'Send To Bank',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 12,
            ),
          ),
        ),
      ),
    );
  }

}


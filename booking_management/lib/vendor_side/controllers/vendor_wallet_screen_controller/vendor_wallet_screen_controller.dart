import 'package:flutter/material.dart';
import 'package:get/get.dart';

class VendorWalletScreenController extends GetxController {
  RxInt isTransactionSelected = 0.obs;

  GlobalKey<FormState> bankFormKey = GlobalKey<FormState>();
  TextEditingController vAccountHolderNameFieldController = TextEditingController();
  TextEditingController vBankNameFieldController = TextEditingController();
  TextEditingController vBranchCodeFieldController = TextEditingController();
  TextEditingController vAccountNumberFieldController = TextEditingController();
  TextEditingController vAmountFieldController = TextEditingController();
}
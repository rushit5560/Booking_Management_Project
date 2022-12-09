import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
// import 'package:qr_code_scanner/qr_code_scanner.dart';

class QrScanScreenController extends GetxController {
  RxBool isLoading = false.obs;

  // final GlobalKey qrKey = GlobalKey(debugLabel: 'QrScan');
  // Barcode? result;
  // QRViewController? controller;

  @override
  void onInit() {
    super.onInit();
  }

  // void onQRViewCreated(QRViewController controller) {
  //   controller = controller;
  //   controller.scannedDataStream.listen((scanData) {
  //     isLoading(true);

  //     result = scanData;

  //     isLoading(false);

  //     log("scanData is : $scanData");
  //     log("result is : ${result}");
  //   });
  // }

  // @override
  // void dispose() {
  //   // TODO: implement dispose
  //   controller?.dispose();
  //   super.dispose();
  // }
}

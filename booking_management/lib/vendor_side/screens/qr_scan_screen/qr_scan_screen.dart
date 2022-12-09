import 'dart:developer';
import 'dart:io';

import 'package:booking_management/common_modules/common_widgets.dart';
import 'package:booking_management/common_modules/constants/app_colors.dart';
import 'package:booking_management/vendor_side/screens/appointment_details_screen/appointment_details_screen.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:mobile_scanner/mobile_scanner.dart';

import '../../controllers/qr_scan_screen_controller/qr_scan_screen_controller.dart';
import '../scan_appointment_details_screen/scan_appointment_details_screen.dart';

class QrScanScreen extends StatefulWidget {
  QrScanScreen({Key? key}) : super(key: key);

  @override
  State<QrScanScreen> createState() => _QrScanScreenState();
}

class _QrScanScreenState extends State<QrScanScreen> {
  // final qrScanScreenController = Get.put(QrScanScreenController());

  bool isLoading = false;

  final size = Get.size;
  MobileScannerController cameraController = MobileScannerController();

  // final GlobalKey qrKey = GlobalKey(debugLabel: 'QrScan');
  // Barcode? result;
  // late QRViewController? controller;

  // // In order to get hot reload to work we need to pause the camera if the platform
  // // @override
  // // void reassemble() {
  // //   super.reassemble();
  // //   if (Platform.isAndroid) {
  // //     controller!.pauseCamera();
  // //   } else if (Platform.isIOS) {
  // //     controller!.resumeCamera();
  // //   }
  // // }

  // void onQRViewCreated(QRViewController controller) {
  //   controller = controller;
  //   controller.scannedDataStream.listen((scanData) {
  //     setState(() {
  //       isLoading = true;
  //     });

  //     result = scanData;

  //     setState(() {
  //       isLoading = false;
  //     });
  //     log("scanData is : $scanData");
  //   });
  //   log("result is : ${result!.code}");
  //   if (result!.code!.isNotEmpty) {
  //     if (result!.code!.contains("id=")) {
  //       Get.to(
  //         ScanAppointmentDetailsScreen(),
  //         arguments: [
  //           result!.code!,
  //         ],
  //       );
  //     } else {
  //       Fluttertoast.showToast(msg: "Your QR Code is invalid.");
  //     }
  //   }
  // }

  // @override
  // void dispose() {
  //   controller!.dispose();
  //   super.dispose();
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: MobileScanner(
          allowDuplicates: false,
          controller: cameraController,
          onDetect: (barcode, args) {
            if (barcode.rawValue == null) {
              log('Failed to scan Barcode');
            } else {
              final String bookingId = barcode.rawValue!;
              log('Barcode found! $bookingId');

              if (bookingId.isNotEmpty) {
                if (bookingId.contains("id=")) {
                  var idPassing = bookingId.split("=")[1];
                  Get.to(
                    () => ScanAppointmentDetailsScreen(),
                    arguments: idPassing,
                  );
                } else {
                  Fluttertoast.showToast(msg: "Your QR Code is invalid.");
                }
              }
            }
          },
        ),

        // QRView(
        //   key: qrKey,
        //   // cameraFacing: CameraFacing.back,
        //   // formatsAllowed: const [
        //   //   BarcodeFormat.qrcode,
        //   // ],
        //   // overlay: QrScannerOverlayShape(
        //   //   // cutOutWidth: size.width * 0.7,
        //   //   // cutOutHeight: size.width * 0.7,
        //   //   borderColor: AppColors.accentColor,
        //   //   borderLength: 40,
        //   //   borderRadius: 10,
        //   //   borderWidth: 10,
        //   // ),
        //   onQRViewCreated: onQRViewCreated,
        // ),

        //  isLoading
        //     ? const Center(child: CircularProgressIndicator())
        //     :

        //  Column(
        //     children: [
        //       // Expanded(
        //       //   flex: 5,
        //       //   child:
        //       QRView(
        //         key: qrScanScreenController.qrKey,
        //         cameraFacing: CameraFacing.back,
        //         formatsAllowed: [
        //           BarcodeFormat.qrcode,
        //         ],
        //         overlay: QrScannerOverlayShape(),
        //         onQRViewCreated: qrScanScreenController.onQRViewCreated,
        //       ),
        //       // ),
        //       // Expanded(
        //       //   flex: 1,
        //       //   child: Center(
        //       //     child: (qrScanScreenController.result != null)
        //       //         ? Text(
        //       //             'Barcode Type: ${describeEnum(qrScanScreenController.result!.format)}   Data: ${qrScanScreenController.result!.code}')
        //       //         : Text('Scan a code'),
        //       //   ),
        //       // ),
        //     ],
        //   ),
      ),
    );
  }
}

import 'package:booking_management/common_modules/constants/enums.dart';
import 'package:booking_management/common_modules/custom_appbar/custom_appbar.dart';
import 'package:booking_management/common_modules/extension_methods/extension_methods.dart';
import 'package:booking_management/vendor_side/screens/business_document_screen/business_document_screen_widgets.dart';
import 'package:flutter/material.dart';

class BusinessDocumentScreen extends StatelessWidget {
  const BusinessDocumentScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            const CommonAppBarModule(title: "Business Document", appBarOption: AppBarOption.singleBackButtonOption),

            Expanded(
              child: Column(
                children: [
                  Expanded(
                    child: BusinessDocumentList(),
                  )
                ],
              ).commonSymmetricPadding(horizontal: 15, vertical: 15),
            )
          ],
        ),
      ),
    );
  }
}

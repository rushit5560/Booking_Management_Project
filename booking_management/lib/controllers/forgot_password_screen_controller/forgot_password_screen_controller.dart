import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pin_input_text_field/pin_input_text_field.dart';

class ForgotPasswordScreenController extends GetxController {
  RxBool isLoading = false.obs;
  RxBool isSuccessStatus = false.obs;
  RxBool isPasswordVisible = true.obs;
  RxBool hasError = false.obs;

  GlobalKey<FormState> forgotPasswordFormKey = GlobalKey<FormState>();
  GlobalKey<FormState> codeFormKey = GlobalKey<FormState>();
  final TextEditingController emailFieldController = TextEditingController(text: "demo@gmail.com");
  final TextEditingController codeFieldController = TextEditingController();
  PinDecoration ? pinDecoration;
  PinEntryType pinEntryType = PinEntryType.underline;
  final ColorBuilder _solidColor =
  PinListenColorBuilder(Colors.grey, Colors.grey);
  final bool _solidEnable = false;
  bool obscureEnable = false;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    selectedMenu(PinEntryType.underline);
  }

  void selectedMenu(PinEntryType type) {
    pinEntryType = type;
    switch (type) {
      case PinEntryType.underline:
        //setState(() {
          pinDecoration = UnderlineDecoration(
            colorBuilder: PinListenColorBuilder(Colors.black, Colors.black),
            bgColorBuilder: _solidEnable ? _solidColor : null,
            obscureStyle: ObscureStyle(
              isTextObscure: obscureEnable,
              obscureText: '😂',
            ),
          );
       // });
        break;
      case PinEntryType.boxTight:
       // setState(() {
          pinDecoration = BoxTightDecoration(
            bgColorBuilder: _solidEnable ? _solidColor : null,
            obscureStyle: ObscureStyle(
              isTextObscure: obscureEnable,
              obscureText: '👿',
            ),
            //hintText: _kDefaultHint,
          );
       // });
        break;
      case PinEntryType.boxLoose:
        //setState(() {
          pinDecoration = BoxLooseDecoration(
            strokeColorBuilder:
            PinListenColorBuilder(Colors.cyan, Colors.green),
            bgColorBuilder: _solidEnable ? _solidColor : null,
            obscureStyle: ObscureStyle(
              isTextObscure: obscureEnable,
              obscureText: '☺️',
            ),
            //hintText: _kDefaultHint,
          );
        //});
        break;
      case PinEntryType.circle:
        //setState(() {
          pinDecoration = CirclePinDecoration(
            bgColorBuilder: _solidEnable ? _solidColor : null,
            strokeColorBuilder:
            PinListenColorBuilder(Colors.cyan, Colors.green),
            obscureStyle: ObscureStyle(
              isTextObscure: obscureEnable,
              obscureText: '🤪',
            ),
            //hintText: _kDefaultHint,
          );
        //});
        break;
      case PinEntryType.customized:
      // setState(() {
       //  pinDecoration = ExampleDecoration();
      // });
       break;
    }
  }
}
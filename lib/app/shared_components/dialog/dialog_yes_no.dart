import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animated_dialog/flutter_animated_dialog.dart';
import 'package:get/get.dart';

Future<void> dialogYesNo({
  required String title,
  required String message,
  dynamic Function()? btnYesPress,
  dynamic Function()? btnNoPress,
}) async {
  AwesomeDialog(
    width: 500,
    context: Get.context!,
    dialogType: DialogType.QUESTION,
    animType: AnimType.SCALE,
    headerAnimationLoop: true,
    dismissOnTouchOutside: false,
    title: title,
    desc: message,
    btnOkText: 'موافق',
    btnOkOnPress: btnYesPress,
    btnCancelText: 'إلغاء',
    btnCancelOnPress: () {
      if (btnNoPress != null) {
        btnNoPress();
      }
    },
  ).show();
}

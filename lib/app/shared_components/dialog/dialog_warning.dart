import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animated_dialog/flutter_animated_dialog.dart';
import 'package:get/get.dart';

Future<void> dialogWarning({
  required String title,
  required String message,
}) async {
  AwesomeDialog(
    context: Get.context!,
    width: 600,
    dialogType: DialogType.WARNING,
    animType: AnimType.SCALE,
    headerAnimationLoop: true,
    dismissOnTouchOutside: false,
    title: title,
    desc: message,
    btnOkText: 'موافق',
    btnOkOnPress: () {},
  ).show();
}

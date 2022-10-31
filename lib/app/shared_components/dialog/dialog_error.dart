import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animated_dialog/flutter_animated_dialog.dart';
import 'package:get/get.dart';

Future<void> dialogError({
  String? title,
  required String message,
  required dynamic Function()? btnOkOnPress,
}) async {
  AwesomeDialog(
    context: Get.context!,
    dialogType: DialogType.ERROR,
    animType: AnimType.SCALE,
    headerAnimationLoop: true,
    dismissOnTouchOutside: false,
    width: 500,
    title: title,
    desc: message,
    btnOkText: 'موافق',
    btnOkOnPress: btnOkOnPress,
    btnOkIcon: Icons.cancel,
    btnOkColor: Colors.red,
  ).show();
}

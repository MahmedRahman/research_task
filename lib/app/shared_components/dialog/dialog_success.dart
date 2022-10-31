import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animated_dialog/flutter_animated_dialog.dart';
import 'package:get/get.dart';


Future<void> dialogSuccess({
  required String title,
  required String message,
  dynamic Function()? btnOkOnPress,
}) async {
  AwesomeDialog(
    context: Get.context!,
    dialogType: DialogType.SUCCES,
    animType: AnimType.SCALE,
    headerAnimationLoop: true,
    dismissOnTouchOutside: false,
    title: title,
    desc: message,
    btnOkText: 'موافق',
    btnOkOnPress: btnOkOnPress,
    btnOkColor: Colors.green,
  ).show();
}
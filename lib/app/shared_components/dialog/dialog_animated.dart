import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animated_dialog/flutter_animated_dialog.dart';
import 'package:get/get.dart';

Future<void> dialogAnimated({
  required String message,
}) async {
  return showAnimatedDialog<void>(
    context: Get.context!,
    barrierDismissible: false,
    animationType: DialogTransitionType.scale,
    curve: Curves.fastOutSlowIn,
    duration: const Duration(seconds: 1),
    builder: (BuildContext context) {
      return ClassicGeneralDialogWidget(
        titleText: "warning",
        contentText: message,
        onPositiveClick: () {
          Navigator.of(context).pop();
        },
        onNegativeClick: () {
          Navigator.of(context).pop();
        },
        actions: <Widget>[
          TextButton(
            child: Container(
              padding: const EdgeInsets.all(10.0),
              decoration:
                  const BoxDecoration(color: Colors.white, borderRadius: BorderRadius.all(Radius.circular(25.0))),
              child: const Text(
                "okay",
                style: TextStyle(color: Colors.black),
              ),
            ),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      );
    },
  );
}

import 'package:flutter/material.dart';
import 'package:project/app/shared_components/bulid_button.dart';

Widget app_error(String? message, {void Function()? onPressed}) {
  return Scaffold(
    body: Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Center(
          child: Text(
            message.toString(),
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
          ),
        ),
        SizedBox(
          height: 10,
        ),
        if (onPressed != null)
          MyCustomButton(
            width: 300,
            onPressed: onPressed,
            text: 'أعادة المحاولة',
          )
      ],
    ),
  );
}

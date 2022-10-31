import 'package:flutter/material.dart';

Widget MyCustomButton({
  required void Function() onPressed,
  required String text,
  double? width,
  double? fontSize,
  Color? color,
  bool? borderedButton = true,
  double? height,
  double? padding,
}) {
  return Padding(
    padding: EdgeInsets.all(padding == null ? 0 : padding),
    child: ClipRRect(
      borderRadius: BorderRadius.circular((borderedButton ?? false) ? 0.0 : 0.0),
      child: Container(
        width: width ?? double.infinity,
        child: MaterialButton(
          height: 60,
          color: color ?? Colors.blue,
          onPressed: onPressed,
          child: Text(
            text,
            style: TextStyle(
              color: Colors.white,
              fontSize: fontSize ?? 16,
            ),
          ),
        ),
      ),
    ),
  );
}

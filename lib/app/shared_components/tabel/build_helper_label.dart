import 'package:flutter/material.dart';

Widget buildHelperLabel(
    {required String helperText,
    String? text,
    Widget? child,
    double width = 350,
    final EdgeInsetsGeometry? dividerPadding,
    double SizedBoxWidth = 25}) {
  if (text == 'null') text = '-';

  return Column(
    children: [
      Padding(
        padding: EdgeInsets.symmetric(vertical: 15),
        child: Row(
          children: [
            SizedBox(
              width: SizedBoxWidth,
            ),
            SizedBox(
              width: width,
              child: Text(
                helperText,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.grey,
                ),
              ),
            ),
            Flexible(
              flex: 3,
              child: child ?? (text == '' ? Text('-') : Text(text!)),
            ),
          ],
        ),
      ),
      Divider(
        height: 1,
        thickness: 1,
        color: Colors.grey,
        indent: 20,
        endIndent: 20,
        // padding: dividerPadding,
      ),
    ],
  );
}

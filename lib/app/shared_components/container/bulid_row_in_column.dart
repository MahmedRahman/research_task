import 'package:flutter/material.dart';

Widget MyCustomGroupRowInColumn({
  required Widget left,
  required Widget right,
  required BuildContext context,
}) {
  return Row(
    children: [
      Flexible(
        child: left,
      ),
      SizedBox(width: 10),
      Flexible(
        child: right,
      ),
    ],
  );
}

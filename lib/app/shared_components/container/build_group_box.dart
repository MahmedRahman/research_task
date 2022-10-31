import 'package:flutter/material.dart';

Widget MyCustomGroupBox({required List<Widget> children}) {
  return Padding(
    padding: const EdgeInsets.all(10),
    child: Column(
      children: children,
    ),
  );
}

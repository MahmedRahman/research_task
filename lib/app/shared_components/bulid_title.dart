import 'package:flutter/material.dart';
import 'package:get/get.dart';

Widget MyCustomTitle({
  required title,
  double? padding,
}) {
  return Container(
    decoration: BoxDecoration(
      color: Colors.grey.shade300,
      borderRadius: BorderRadius.all(
        Radius.circular(10),
      ),
    ),
    child: Padding(
      padding: EdgeInsets.all(padding == null ? 15 : padding),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title!,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
          ),
          IconButton(
            onPressed: () {
              Get.back();
            },
            icon: Icon(Icons.close),
          )
        ],
      ),
    ),
  );
}

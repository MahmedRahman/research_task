import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:project/app/extensions/date_extensions.dart';


Widget MyCustomFormFieldDatePicker({
  String? labelText,
  String? hintText,
  required void Function(int?)? onSaved,
  int? initialValue,
  TextInputType? keyboardType,
  double? fieldHeight = 40,
  TextEditingController? controller,
  String? Function(String?)? validator,
  List<TextInputFormatter>? inputFormatters,
  bool requiredFiled = false,
  void Function(String)? onFieldSubmitted,
  int? firstDate,
  int? lastDate,
}) {
  var date = initialValue.obs;

  if (date.value == '0') {
    date = DateTime.now().millisecondsSinceEpoch.obs;
  } else {
    controller = TextEditingController(text: date.value!.convertMilliSecondsToDateString());
  }

  return Obx(() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: 10,
        ),
        if (labelText != null)
          Row(
            children: [
              Text(
                labelText,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  height: 1,
                ),
              ),
              requiredFiled
                  ? Text(
                      '*',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.red,
                        height: 1,
                      ),
                    )
                  : SizedBox.shrink(),
            ],
          ),
        SizedBox(
          height: 10,
        ),
        InkWell(
          onTap: () {
            showDatePicker(
              context: Get.context!,
              initialDate: lastDate == null ? DateTime.now() : DateTime(lastDate),
              firstDate: firstDate == null ? DateTime(1900) : DateTime(firstDate),
              lastDate: lastDate == null ? DateTime(2050) : DateTime(lastDate),
            ).then(
              (value) {
                if (value != null) {
                  log(value.toString());
                  date.value = value.millisecondsSinceEpoch;
                  onSaved?.call(value.millisecondsSinceEpoch);
                  controller = TextEditingController(text: value.toString().substring(0, 10));
                }
              },
            );
          },
          child: Container(
            height: 60,
            child: TextFormField(
              enabled: false,
              keyboardType: keyboardType,

              //initialValue: date.value!.convertMilliSecondsToDateString(),
              inputFormatters: inputFormatters,
              decoration: InputDecoration(
                label: Text(hintText ?? ''),
                filled: true,
                hintText: DateTime.fromMillisecondsSinceEpoch(date.value!).toString().dateFromString(),
                errorStyle: TextStyle(color: Colors.red),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.blue),
                  borderRadius: BorderRadius.circular(8),
                ),
                border: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.blue),
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              controller: controller,
              validator: validator,
              onFieldSubmitted: onFieldSubmitted,
              // onSaved: onSaved,
            ),
          ),
        ),
      ],
    );
  });
}

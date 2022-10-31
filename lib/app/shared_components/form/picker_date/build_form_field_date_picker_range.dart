import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

Widget MyCustomFormFieldDatePickerRange({
  String? labelText,
  String? hintText,
  required void Function(DateTimeRange?)? onChanged,
  DateTimeRange? initialValue,
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

  if (date.value == null) {
    DateTime dateTimeNow = DateTime.now();
    date = DateTimeRange(start: dateTimeNow, end: dateTimeNow.add(Duration(days: 1))).obs;

    controller = TextEditingController(
        text: '${date.value!.start.toString().substring(0, 10)} - ${date.value!.end.toString().substring(0, 10)}');
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
          height: 8,
        ),
        InkWell(
          onTap: () {
            showDateRangePicker(
                context: Get.context!,
                firstDate: DateTime.now(),
                lastDate: DateTime(DateTime.now().year + 5),
                initialDateRange: date.value,
                builder: (context, child) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ConstrainedBox(
                        constraints: BoxConstraints(maxWidth: 400.0, maxHeight: 600),
                        child: child,
                      )
                    ],
                  );
                }).then((selectedDate) {
              if (selectedDate != null) {
                log(selectedDate.toString());
                date.value = selectedDate;
                onChanged?.call(selectedDate);
                controller = TextEditingController(
                    text:
                        '${selectedDate.start.toString().substring(0, 10)} - ${selectedDate.end.toString().substring(0, 10)}');
              }
            });
          },
          child: Container(
            height: 60,
            child: TextFormField(
              enabled: false,
              keyboardType: keyboardType,
              // initialValue: date.value,
              inputFormatters: inputFormatters,
              decoration: InputDecoration(
                label: Text(hintText ?? ''),
                filled: true,
                hintText: date.value.toString(),
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

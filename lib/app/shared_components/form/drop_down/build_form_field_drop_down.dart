import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

Widget MyCustomFormFieldDropdown({
  required List<Map<String, dynamic>>? items,
  String? labelText,
  String? hintText,
  double? maxHeight,
  double? fieldHeight = 40,
  double? fieldWidth,
  double? maxWidth,
  void Function(Map<String, dynamic>?)? onSaved,
  bool requiredFiled = false,
  bool enabled = true,
  Map<String, dynamic>? selectedItem,
}) {
  //selectedItem = null;

  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      SizedBox(
        height: 8,
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
      Container(
        // height: fieldHeight,
        width: fieldWidth,
        child: DropdownSearch<Map<String, dynamic>>(
          // popupProps: PopupProps.bottomSheet(),
          enabled: enabled,
          maxHeight: maxHeight,
          dialogMaxWidth: maxWidth,
          mode: Mode.MENU,
          showSelectedItems: false,
          validator: (value) {
            if (value == null) {
              if (requiredFiled == true) return 'Required field'.tr;
            }
            return null;
          },
          items: items,
          selectedItem: selectedItem,
          itemAsString: (Map<String, dynamic>? u) => u!['name'],
          dropdownSearchDecoration: InputDecoration(
            filled: true,
            hintText: hintText == null ? labelText : hintText,
            border: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.blue),
              borderRadius: BorderRadius.circular(8),
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.blue),
              borderRadius: BorderRadius.circular(8),
            ),
          ),
          onChanged: onSaved,
        ),
      ),
    ],
  );
}

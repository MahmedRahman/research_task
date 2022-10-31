import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';

Widget MyCustomFormFieldDropdownMulti({
  String? labelText,
  required String selectedLabel,
  String? hintText,
  double? maxHeight,
  double? fieldHeight = 40,
  double? fieldWidth,
  double? maxWidth,
  required List<Map<String, dynamic>> items,
  void Function(List<Map<String, dynamic>>)? onSaved,
  bool requiredFiled = false,
  List<Map<String, dynamic>>? selectedItem,
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
        height: 60,
        width: fieldWidth,
        child: DropdownSearch<Map<String, dynamic>>.multiSelection(
          maxHeight: maxHeight,
          dialogMaxWidth: maxWidth,
          mode: Mode.MENU,
          showSelectedItems: false,
          items: items,
          selectedItems: [],
          showFavoriteItems: false,
          dropdownBuilder: (context, selectedItems) {
            Widget item(String i) => SizedBox(
                  child: Text(i),
                );
            return Text(
              selectedItems.length == 0 ? 'hintText' : 'تم تحديد عدد ${selectedItems.length} ${selectedLabel}',
            );
          },
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

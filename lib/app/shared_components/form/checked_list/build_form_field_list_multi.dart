import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_multi_select_items/flutter_multi_select_items.dart';

Widget MyCustomFormFieldListMulti({
  required String labelText,
  required RxList<Map<String, dynamic>> items,
  required void Function(List<Map<String, dynamic>> items)? onChanged,
}) {
  // RxList<Map<String, dynamic>> newItems = RxList<Map<String, dynamic>>([]);
  // if (newItems.length == 0) {
  //   newItems.addAll(items);
  // }
  return Column(
    mainAxisAlignment: MainAxisAlignment.start,
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        labelText,
        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
      ),
      items.length == 0
          ? Text(
              'لا يوجد مميزات عامة',
              style: TextStyle(fontSize: 15),
            )
          : Obx(
              () {
                return Column(
                  children: List.generate(
                    items.length,
                    (index) {
                      return CheckboxListTile(
                        title: Text(items.elementAt(index)['text'].toString()),
                        value: items.elementAt(index)['value'],
                        onChanged: (newValue) {
                          items.elementAt(index)['value'] = newValue;

                          items.assignAll(items);
                          onChanged!(items);
                        },
                        controlAffinity: ListTileControlAffinity.leading, //  <-- leading Checkbox
                      );
                    },
                  ),
                );
              },
            ),
    ],
  );
}

Widget buildMultiSelectContainer({
  required String labelText,
  required List<Map<String, dynamic>> items,
  required void Function(List<dynamic>, dynamic) onChange,
}) {
  return items.length == 0
      ? Text(
          'لا يوجد مميزات عامة',
          style: TextStyle(fontSize: 15),
        )
      : MultiSelectContainer(
          items: List.generate(items.length, (index) {
            return MultiSelectCard(
              label: items.elementAt(index)['text'],
              value: items.elementAt(index)['text'],
            );
          }),
          onChange: onChange);
}

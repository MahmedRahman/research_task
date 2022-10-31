import 'package:flutter/material.dart';
import 'package:get/get.dart';

Widget dataTable({
  required List<DataColumn> columns,
  required List<DataRow> rows,
  double? rowHeight,
}) {
  return LayoutBuilder(builder: (_, __) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        // borderRadius: BorderRadius.circular(10),
      ),
      width: Get.width,
      child: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: DataTable(
          headingRowHeight: 45,
          dataRowHeight: rowHeight ?? 50,
          sortAscending: true,
          headingTextStyle: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w700,
            fontFamily: 'Cairo',
          ),
          columnSpacing: 0,
          dataTextStyle: TextStyle(
            color: Colors.black,
            fontSize: 14,
            fontWeight: FontWeight.w400,
            fontFamily: 'Cairo',
          ),
          headingRowColor: MaterialStateColor.resolveWith(
            (states) {
              return Colors.blue;
            },
          ),
          columns: columns,
          rows: rows,
        ),
      ),
    );
  });
}

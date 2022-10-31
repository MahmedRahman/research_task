import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project/app/extensions/date_extensions.dart';
import 'package:project/app/shared_components/build_helper_image.dart';

DataCell dataCellItem({required String data, void Function()? onTap}) {
  if (data == 'null') data = '-';
  if (data == '') data = '-';
  return DataCell(
    InkWell(
      onTap: onTap,
      child: Container(
        // width: 120,
        height: 40,
        child: Text(
          data,
        ),
      ),
    ),
  );
}

DataCell dataCellDateItem({required int data}) {
  Color color = Colors.white;
  Color colorText = Colors.black;
  DateTime dateToday = DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day);
  DateTime yesterday = DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day).add(Duration(days: -1));
  DateTime tomorrow = DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day).add(Duration(days: -1));

  if (data == dateToday.millisecondsSinceEpoch) {
    color = Colors.blue;
    colorText = Colors.white;
  } else if (data == yesterday.millisecondsSinceEpoch) {
    color = Colors.green;
    colorText = Colors.white;
  } else if (data == tomorrow.millisecondsSinceEpoch) {
    color = Colors.red;
    colorText = Colors.white;
  }

  return DataCell(
    Container(
      width: 120,
      height: 40,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Center(
        child: Text(
          data.convertMilliSecondsToDateString(),
          style: TextStyle(
            color: colorText,
          ),
        ),
      ),
    ),
  );
}

DataCell dataCellItemImage({required String data}) {
  if (data == 'null') data = '-';
  if (data == '') data = '-';

  if (data == '-') {
    return DataCell(
      SizedBox(
        width: 128,
        height: 128,
        child: SizedBox(),
      ),
    );
  }

  return DataCell(
    SizedBox(
      width: 128,
      height: 128,
      child: buildHelperImageBox(imageId: data),
    ),
  );
}

DataCell dataCellStausColorItem({required int data, void Function()? onTap}) {
  Color color = Colors.white;

  if (data == 0) {
    color = Colors.blue;
  } else if (data == 1) {
    color = Colors.orange;
  } else if (data == 2) {
    color = Colors.green;
  } else if (data == 3) {
    color = Colors.red;
  }

  return DataCell(
    InkWell(
      onTap: onTap,
      child: Container(
        width: 120,
        height: 40,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Center(
          child: Text(
            '',
            style: TextStyle(
              color: Colors.white,
            ),
          ),
        ),
      ),
    ),
  );
}

DataCell dataCellDayNumberItem({required int data}) {
  DateTime date = convertMilliSecondsToDate(data);

  final difference = getDaysNumber(date, DateTime.now());
  Color color = Colors.white;
  Color colorText = Colors.black;

  if (difference < 0) {
    color = Colors.red;
    colorText = Colors.white;
  } else if (difference == 0) {
    color = Colors.blue;
    colorText = Colors.white;
  } else if (difference > 0) {
    color = Colors.green;
    colorText = Colors.white;
  }

  return DataCell(
    Container(
      width: 120,
      height: 40,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: color,
      ),
      child: Center(
        child: Text(
          difference.toString(),
          style: TextStyle(
            color: colorText,
          ),
        ),
      ),
    ),
  );
}

int daysBetween(DateTime from, DateTime to) {
  from = DateTime(from.year, from.month, from.day);
  to = DateTime(to.year, to.month, to.day);
  return (to.difference(from).inHours / 24).round();
}

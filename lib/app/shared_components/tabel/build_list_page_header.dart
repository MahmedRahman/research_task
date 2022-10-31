import 'package:flutter/material.dart';

Container buildListPageHeader({
  required int listCount,
  num? listSum,
  required void Function()? onAddPressed,
  required void Function()? onRefreshPressed,
  void Function()? onPrintPressed,
  required String title,
}) {
  return Container(
    decoration: BoxDecoration(
      color: Colors.blue,
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(5),
        topRight: Radius.circular(5),
      ),
    ),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: Container(
            height: 70,
            decoration: BoxDecoration(
              color: Colors.blue,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(5),
                topRight: Radius.circular(5),
              ),
            ),
            child: ListTile(
              title: Text(
                title,
                style: TextStyle(
                  color: Colors.white,
                  height: 1.5,
                ),
              ),
              subtitle: Row(
                children: [
                  Text(
                    'أجمالى العدد ${listCount.toString()}',
                    style: TextStyle(
                      color: Colors.white,
                      height: 1.5,
                    ),
                  ),
                  SizedBox(width: 10),
                  (listSum == null)
                      ? SizedBox.shrink()
                      : Text(
                          'أجمالى السعر ${listSum.toString()}',
                          style: TextStyle(
                            color: Colors.white,
                            height: 1.5,
                          ),
                        ),
                ],
              ),
            ),
          ),
        ),
        IconButton(
          icon: Icon(
            Icons.add,
            color: Colors.white,
          ),
          onPressed: onAddPressed,
        ),
        IconButton(
          icon: Icon(
            Icons.refresh,
            color: Colors.white,
          ),
          onPressed: onRefreshPressed,
        ),
      ],
    ),
  );
}

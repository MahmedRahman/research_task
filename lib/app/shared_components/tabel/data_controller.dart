import 'package:flutter/material.dart';

DataCell dataController({
  void Function()? onRemovePressed,
  void Function()? onEditPressed,
  void Function()? onViewPressed,
  void Function()? onPrintPressed,
  void Function()? onQuickUpdatePressed,
}) {
  return DataCell(
    Row(
      children: [
        if (onViewPressed != null) IconButton(icon: Icon(Icons.remove_red_eye), onPressed: onViewPressed),
        if (onEditPressed != null) IconButton(icon: Icon(Icons.edit), onPressed: onEditPressed),
        if (onRemovePressed != null) IconButton(icon: Icon(Icons.delete), onPressed: onRemovePressed),
        if (onPrintPressed != null) IconButton(icon: Icon(Icons.print), onPressed: onPrintPressed),
        if (onQuickUpdatePressed != null) IconButton(icon: Icon(Icons.refresh), onPressed: onQuickUpdatePressed)
      ],
    ),
  );
}

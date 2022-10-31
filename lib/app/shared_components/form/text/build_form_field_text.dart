import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

Widget MyCustomFormFieldText({
  String? labelText,
  String? hintText,
  String? subText,
  TextInputType? keyboardType,
  String? Function(String?)? validator,
  void Function(String)? onFieldSubmitted,
  void Function(String?)? onSaved,
  ValueChanged<String>? onChanged,
  EdgeInsetsGeometry? padding,
  int inputMaxLetterNumber = 250,
  int inputMinLetterNumber = 0,
  bool requiredFiled = false,
  String? initialValue,
  Color? fillColor,
  TextEditingController? controller,
  GestureTapCallback? onTap,
  bool isEnabled = true,
  bool readOnly = false,
  Widget? suffixIcon,
}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      SizedBox(
        height: 8,
      ),
      if (labelText != null) ...{
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
        SizedBox(height: 10),
      },
      Container(
        child: TextFormField(
          textDirection: TextDirection.rtl,
          onTap: onTap,
          enabled: isEnabled,
          readOnly: readOnly,
          initialValue: initialValue,
          controller: controller,
          keyboardType: keyboardType,
          onChanged: onChanged,
          decoration: InputDecoration(
            fillColor: fillColor,
            hintText: hintText == null ? labelText : hintText,
            filled: true,
            suffixIcon: suffixIcon,
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.blue),
              borderRadius: BorderRadius.circular(8),
            ),
            border: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.blue),
              borderRadius: BorderRadius.circular(8),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.blue),
              borderRadius: BorderRadius.circular(8),
            ),
            errorBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.red),
              borderRadius: BorderRadius.circular(8),
            ),
          ),
          // controller: controller,
          validator: (value) {
            if (value!.isEmpty) {
              if (requiredFiled == true) return 'يجب اضافة قيمية';
            }

            return null;
          },
          onFieldSubmitted: onFieldSubmitted,
          onSaved: onSaved,
        ),
      ),
      // if (subText != null)
      //   Padding(
      //     padding: const EdgeInsets.only(top: 3),
      //     child: Text(
      //       subText,
      //       style: TextStyle(
      //         color: Colors.blue,
      //         fontSize: 12,
      //       ),
      //     ),
      //   )
    ],
  );
}

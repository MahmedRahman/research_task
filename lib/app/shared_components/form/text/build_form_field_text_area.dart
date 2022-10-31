import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

Widget MyCustomFormFieldTextArea({
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
  double? height = 40,
  int maxLines = 1,
  bool requiredFiled = false,
  String? initialValue,
  Color? fillColor,
  TextEditingController? controller,
  GestureTapCallback? onTap,
  bool isEnabled = true,
  bool readOnly = false,
  Widget? suffixIcon,
}) {
  List<TextInputFormatter>? inputFormatters = [];
  inputFormatters.add(LengthLimitingTextInputFormatter(inputMaxLetterNumber));

  if (initialValue == 'null') {
    initialValue = null;
  }

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
        // height: height, // TODO(abdullah) : remove height to fix field height on error
        child: TextFormField(
          onTap: onTap,
          enabled: isEnabled,
          readOnly: readOnly,
          controller: controller,
          minLines: 6, // any number you need (It works as the rows for the textarea)
          keyboardType: TextInputType.multiline,
          maxLines: null,

          inputFormatters: inputFormatters,
          initialValue: initialValue,
          onChanged: onChanged,
          decoration: InputDecoration(
            contentPadding: padding,
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
          //controller: controller,
          validator: (value) {},
          onFieldSubmitted: onFieldSubmitted,
          onSaved: onSaved,
        ),
      ),
      if (subText != null)
        Padding(
          padding: const EdgeInsets.only(top: 3),
          child: Text(
            subText,
            style: TextStyle(
              color: Colors.blue,
              fontSize: 12,
            ),
          ),
        )
    ],
  );
}

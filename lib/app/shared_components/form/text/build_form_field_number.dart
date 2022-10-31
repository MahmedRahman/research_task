import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

Widget MyCustomFormFieldNumber({
  String? labelText,
  String? hintText,
  String? subText,
  TextInputType? keyboardType,
  String? Function(String?)? validator,
  void Function(String)? onFieldSubmitted,
  void Function(int?)? onSaved,
  void Function(int?)? onChanged,
  EdgeInsetsGeometry? padding,
  int inputMaxLetterNumber = 250,
  int inputMinLetterNumber = 0,
  double? height = 40,
  int maxLines = 1,
  bool requiredFiled = false,
  num? initialValue,
  Color? fillColor,
  TextEditingController? controller,
  GestureTapCallback? onTap,
  bool isEnabled = true,
  bool readOnly = false,
  Widget? suffixIcon,
}) {
  List<TextInputFormatter>? inputFormatters = [];
  inputFormatters.add(LengthLimitingTextInputFormatter(inputMaxLetterNumber));

  inputFormatters.add(
    FilteringTextInputFormatter.allow(
      (RegExp(r'(^\d*\.?\d*)')),
    ),
  );

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
        child: TextFormField(
          onTap: onTap,
          enabled: isEnabled,
          readOnly: readOnly,
          controller: controller,
          keyboardType: keyboardType,
          inputFormatters: inputFormatters,
          initialValue: initialValue.toString(),
          maxLines: maxLines,
          onChanged: (value) {
            if (onChanged != null) onChanged(int.tryParse(value));
            //   if (value != "")
          },
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
          validator: (value) {
            if (value!.isEmpty) {
              if (requiredFiled == true) return 'Required field'.tr;
            }

            if (value.isNotEmpty) {
              if (inputMinLetterNumber != 0 && value.length < inputMinLetterNumber)
                return 'The field must be more than'.tr + inputMinLetterNumber.toString() + 'characters';

              if (keyboardType == TextInputType.emailAddress) {
                if (!RegExp(r'\S+@\S+\.\S+').hasMatch(value)) {
                  return "Please enter a valid email address".tr;
                }
              }

              if (keyboardType == TextInputType.phone) {}
              if (keyboardType == TextInputType.text) {}
            }

            return null;
          },
          onFieldSubmitted: onFieldSubmitted,
          onSaved: (value) {
            onSaved!(int.tryParse(value!));
          },
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

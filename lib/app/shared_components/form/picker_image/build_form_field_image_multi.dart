import 'dart:io';
import 'dart:typed_data';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

Widget MyCustomFormFieldImageMulti({
  required String labelText,
  required onChanged,
  required onDeletePressed,
}) {
  final ValueChanged<PlatformFile>? onChanged;
  final List<dynamic> imagesIds;
  final Function(String selectedId) onDeletePressed;
  RxList<File> listImage = RxList<File>([]);
  List<File> listFile = [];

  RxList<Uint8List> webListImage = RxList<Uint8List>([]);
  List<Uint8List> webListFile = [];
  return Obx(() {
    return Row(
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                labelText,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
              SizedBox(
                height: 8,
              ),
              Row(
                children: [
                  InkWell(
                    onTap: () async {
                      FilePickerResult? result = await FilePicker.platform.pickFiles(type: FileType.image);
                      if (result == null) {
                        return;
                      }

                      if (kIsWeb) {
                        Uint8List? file = result.files.single.bytes;
                        webListImage.add(file!);
                        webListFile.add(file);
                        //onChanged!(result.files.single);
                        return;
                      }

                      File file = File(result.files.single.path.toString());
                      listImage.add(file);
                      listFile.add(file);
                      // onChanged!(result.files.single);
                    },
                    child: Container(
                      width: 150,
                      height: 150,
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.grey[300],
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(
                            width: 1,
                          ),
                        ),
                        child: Center(
                          child: Icon(
                            Icons.add,
                            color: Colors.grey[800],
                          ),
                        ),
                      ),
                    ),
                  ),
                  if (!kIsWeb)
                    Row(
                      children: listImage.map((file) => imageContainer(file: file, isWeb: false)).toList(),
                    )
                  else
                    Row(
                      children: webListImage.map((file) => imageContainer(file: file, isWeb: true)).toList(),
                    )
                ],
              ),
            ],
          ),
        ),
        // ...imagesIds.map((e) => Padding(
        //       padding: const EdgeInsets.symmetric(horizontal: 5),
        //       child: SizedBox(width: 150, height: 150, child: ImageWidget(imageId: e)),
        //     ))
      ],
    );
  });
}

Widget ImageWidget({required String imageId}) {
  return Image.network('https://i.imgur.com/rNdMwuZ.jpg', fit: BoxFit.cover);
}

Widget imageContainer({required var file, required bool isWeb}) {
  return Stack(
    children: [
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          width: 150,
          height: 150,
          decoration: BoxDecoration(
            color: Colors.grey[300],
            borderRadius: BorderRadius.circular(10),
            border: Border.all(
              width: 1,
            ),
          ),
          child: isWeb
              ? Image.memory(
                  file,
                  fit: BoxFit.fill,
                )
              : Image.file(
                  file,
                  fit: BoxFit.fill,
                ),
        ),
      ),
      IconButton(
        onPressed: () {
          if (isWeb) {
            // webListImage.remove(file);
            return;
          }
          //  listImage.remove(file);
        },
        icon: Container(
          decoration: BoxDecoration(color: Colors.white),
          child: Icon(Icons.delete),
        ),
        color: Colors.red,
      ),
    ],
  );
}

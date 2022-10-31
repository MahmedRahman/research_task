import 'dart:io';
import 'dart:typed_data';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project/app/shared_components/form/picker_image/build_form_field_image_multi.dart';



Widget MyCustomFormFieldImage({
  required String labelText,
  String? initialValue,
  required ValueChanged<PlatformFile>? onChanged,
  GestureTapCallback? onDeletePressed,
}) {
  RxList<File> listImage = RxList<File>([]);
  RxList<Uint8List> webListImage = RxList<Uint8List>([]);
  if (initialValue == '') initialValue = null;
  return Obx(
    () {
      return Stack(
        children: [
          Column(
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
              InkWell(
                onTap: () async {
                  FilePickerResult? result = await FilePicker.platform.pickFiles(type: FileType.image);
                  if (result == null) {
                    return;
                  }

                  if (kIsWeb) {
                    Uint8List? file = result.files.single.bytes;
                    webListImage.assign(file!);
                    onChanged!(result.files.single);
                    return;
                  }

                  File file = File(result.files.single.path.toString());
                  listImage.assign(file);
                  onChanged!(result.files.single);
                },
                child: Column(
                  children: [
                    Container(
                      width: Get.width,
                      height: 350,
                      child: !kIsWeb
                          ? listImage.length != 0
                              ? Column(
                                  children: listImage.map((file) {
                                    return SizedBox(
                                      width: Get.width,
                                      height: 350,
                                      child: ImageContainer(
                                        Image.file(
                                          file,
                                          fit: BoxFit.contain,
                                        ),
                                      ),
                                    );
                                  }).toList(),
                                )
                              : emptyImage(
                                  initialValue != null ? ImageWidget(imageId: initialValue) : null,
                                )
                          : webListImage.length != 0
                              ? Column(
                                  children: webListImage.map((byte) {
                                    return SizedBox(
                                      width: Get.width,
                                      height: 350,
                                      child: ImageContainer(
                                        Image.memory(
                                          byte,
                                          fit: BoxFit.contain,
                                        ),
                                      ),
                                    );
                                  }).toList(),
                                )
                              : emptyImage(
                                  initialValue != null ? ImageWidget(imageId: initialValue) : null,
                                ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          // Stack(
          //   alignment: Alignment.topLeft,
          //   children: [
          //     SizedBox(width: 150, height: 150, child: SizedBox()),
          //     IconButton(
          //       icon: Icon(Icons.delete),
          //       onPressed: onDeletePressed,
          //     )
          //   ],
          // )
        ],
      );
    },
  );
}

Widget emptyImage(
  Widget? child,
) {
  return Container(
    decoration: BoxDecoration(
      color: Colors.grey[300],
      borderRadius: BorderRadius.circular(10),
      border: Border.all(
        width: 1,
      ),
    ),
    child: Center(
      child: child == null
          ? Icon(
              Icons.add,
              color: Colors.grey[800],
            )
          : child,
    ),
  );
}

Widget ImageContainer(
  Widget child,
) {
  return Container(
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(10),
    ),
    child: child,
  );
}

import 'dart:typed_data';

import 'package:dart_appwrite/dart_appwrite.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project/app/app_constants.dart';

Client client = Client().setEndpoint(endpoint).setProject(projectId).setKey(apiSecretKey);
Account? account = Account(client);
Storage? storage = Storage(client);

Widget buildHelperImage({
  required String helperText,
  required String imageId,
}) {
  return FutureBuilder(
    future: storage!.getFilePreview(
      bucketId: bucketId,
      fileId: imageId,
    ),
    builder: (context, AsyncSnapshot<Uint8List> snapshot) {
      if (imageId.isEmpty) return Image.network('https://i.imgur.com/rNdMwuZ.jpg', fit: BoxFit.cover);

      return snapshot.hasData && snapshot.data != null
          ? Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 15),
                  child: Row(
                    children: [
                      SizedBox(
                        width: 10,
                      ),
                      SizedBox(
                        child: Text(
                          helperText,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.grey,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Divider(
                  height: 1,
                  thickness: 1,
                  color: Colors.grey,
                  indent: 20,
                  endIndent: 20,
                  // padding: dividerPadding,
                ),
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: SizedBox(
                    width: Get.width,
                    height: 350,
                    child: Image.memory(snapshot.data!, fit: BoxFit.cover),
                  ),
                )
              ],
            )
          : CircularProgressIndicator();
    },
  );
}

Widget buildHelperImageBox({
  required String imageId,
}) {
  return FutureBuilder(
    future: storage!.getFilePreview(
      bucketId: bucketId,
      fileId: imageId,
    ),
    builder: (context, AsyncSnapshot<Uint8List> snapshot) {
      if (imageId.isEmpty) return Image.network('https://i.imgur.com/rNdMwuZ.jpg', fit: BoxFit.cover);

      return snapshot.hasData && snapshot.data != null
          ? Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: SizedBox(
                    width: 110,
                    height: 100,
                    child: Image.memory(snapshot.data!, fit: BoxFit.cover),
                  ),
                )
              ],
            )
          : SizedBox(
              width: 50,
              height: 50,
              child: CircularProgressIndicator(),
            );
    },
  );
}

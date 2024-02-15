import 'dart:io';

import 'package:appucv2/pages/asesorias.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import 'package:get/get.dart';

class UploadPhotos extends StatefulWidget {
  const UploadPhotos({super.key});

  @override
  _UploadPhotosState createState() => _UploadPhotosState();
}

class _UploadPhotosState extends State<UploadPhotos> {
  FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;
  FirebaseStorage _firebaseStorage = FirebaseStorage.instance;

  List<UploadTask> uploadedTasks = [];
  List<File> selectFiles = [];
  uploadFileToStorage(File file) {
    UploadTask task = _firebaseStorage
        .ref()
        .child("images/${DateTime.now().toString()}")
        .putFile(file);

    return task;
  }

  writeImageUrlToFireStore(imageUrl) {
    _firebaseFirestore.collection("images").add({"url": imageUrl}).whenComplete(
        () => print("$imageUrl is saved in Firestore"));
  }

  saveImageUrlToFirebase(UploadTask task) {
    task.snapshotEvents.listen((snapshot) {
      if (snapshot.state == TaskState.success) {
        snapshot.ref
            .getDownloadURL()
            .then((imageUrl) => writeImageUrlToFireStore(imageUrl));
      }
    });
  }

  Future selectFileToUpload() async {
    try {
      FilePickerResult? result = await FilePicker.platform
          .pickFiles(allowMultiple: true, type: FileType.image);

      if (result != null) {
        selectFiles.clear();

        result.files.forEach((selectFile) {
          File file = File(selectFile.path!);
          selectFiles.add(file);
        });

        selectFiles.forEach((file) {
          final UploadTask task = uploadFileToStorage(file);
          saveImageUrlToFirebase(task);

          setState(() {
            uploadedTasks.add(task);
          });
        });
      } else {
        print("El usuario ha cancelado la selección");
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Galería El Chilalo"),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => Asesorias()));
          },
          child: Icon(Icons.add),
        ),
        body: uploadedTasks.length == 0
            ? Center(
                child:
                    Text("Por favor, presione el botón para subir una imagen"))
            : ListView.separated(
                itemBuilder: (context, index) {
                  return StreamBuilder<TaskSnapshot>(
                    builder: (context, snapshot) {
                      if (snapshot.hasError) {
                        return Text("There is some error in uploading file");
                      } else if (snapshot.hasData) {
                        return ListTile(
                          title: Text(
                              "${snapshot.data!.bytesTransferred}/${snapshot.data!.totalBytes} ${snapshot.data!.state == TaskState.success ? "Completed" : snapshot.data!.state == TaskState.running ? "In Progress" : "Error"}"),
                        );
                      } else {
                        return Container();
                      }
                    },
                    stream: uploadedTasks[index].snapshotEvents,
                  );
                },
                separatorBuilder: (context, index) => Divider(),
                itemCount: uploadedTasks.length,
              ));
  }
}

// ignore_for_file: camel_case_types, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';

class permissionHome extends StatelessWidget {
  const permissionHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ElevatedButton(
              onPressed: () {
                permissionCamera();
              },
              child: Text('CAMERA PERMISSION')),
          ElevatedButton(
              onPressed: () {
                permissionGalery();
              },
              child: Text('GALERY PERMISSION')),
        ],
      ),
    ));
  }
}

permissionCamera() async {
  // var status = await Permission.camera.status;
  var status = await Permission.camera.request();
  if (status.isDenied) {
    //showToast
    print('Status Denied');
  } else if (status.isGranted) {
    print('Status Granted');
  }
}

permissionGalery() async {
  // android.permission.MANAGE_EXTERNAL_STORAGE
  var status = await Permission.storage.request();
  // var status = await Permission.manageExternalStorage.status;
  // print(status);
  if (status.isDenied) {
    //showToast
    print('Status Denied');
  } else if (status.isGranted) {
    print('Status Granted');
  }
}

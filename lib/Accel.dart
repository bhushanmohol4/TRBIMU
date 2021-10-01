// ignore_for_file: unused_local_variable

import 'dart:convert';
//import 'dart:html';
import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:csv/csv.dart';
import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import 'package:sensors_plus/sensors_plus.dart';
import 'package:trialaccel/Api.dart';
import 'package:trialaccel/widgets.dart';
import 'dart:async';
//import 'package:motion_sensors/motion_sensors.dart';

class AccelData extends StatefulWidget {
  @override
  _AccelDataState createState() => _AccelDataState();
}

class _AccelDataState extends State<AccelData> {
  @override
  List<List<double>> data = [[]];
  double Accelx = 0, Accely = 0, Accelz = 0;
  double Gyrox = 0, Gyroy = 0, Gyroz = 0;
  double Magx = 0, Magy = 0, Magz = 0;
  double Velx = 0, Vely = 0, Velz = 0;
  String url = '';
  String Data = '';
  void initState() {
    super.initState();
    accelerometerEvents.listen((AccelerometerEvent event) {
      setState(() {
        Accelx = event.x;
        Accely = event.y;
        Accelz = event.z;
      });
    });
    gyroscopeEvents.listen((GyroscopeEvent event) {
      setState(() {
        Gyrox = event.x;
        Gyroy = event.y;
        Gyroz = event.z;
      });
    });
    magnetometerEvents.listen((MagnetometerEvent event) {
      setState(() {
        Magx = event.x;
        Magy = event.y;
        Magz = event.z;
      });
    });
    ListToCsv();
  }

  ListToCsv() async {
    data = [
      [Accelx, Accely, Accelz]
    ];
    final String directory = (await getApplicationSupportDirectory()).path;
    final path = "$directory/csv-test.csv";
    final File file = File(path);
    String csvData = ListToCsvConverter().convert(data);
    await file.writeAsString(csvData);
  }

  Widget build(BuildContext context) {
    return Scaffold(
        appBar: appBarMain(context, 'IMU data'),
        body: Container(
            alignment: Alignment.center,
            child: Text(
              'ax:${Accelx.toStringAsFixed(2)}\t\tay:${Accely.toStringAsFixed(2)}\t\taz:${Accelz.toStringAsFixed(2)}\n\ngx:${Gyrox.toStringAsFixed(2)}\t\tgy:${Gyroy.toStringAsFixed(2)}\t\tgz:${Gyroz.toStringAsFixed(2)}\n\nmx:${Magx.toStringAsFixed(2)}\t\tmy:${Magy.toStringAsFixed(2)}\t\tmz:${Magz.toStringAsFixed(2)}\nData:${Data}',
              style: TextStyle(color: Colors.white, fontSize: 25),
              textAlign: TextAlign.center,
            )));
  }
}

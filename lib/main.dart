import 'package:flutter/material.dart';
import 'package:trialaccel/Accel.dart';

void main() {
  runApp(new MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Trial Acceleration',
        theme: ThemeData(scaffoldBackgroundColor: Color(0xff1F1F1F)),
        home: AccelData() //new MyHomePage(),
        );
  }
}

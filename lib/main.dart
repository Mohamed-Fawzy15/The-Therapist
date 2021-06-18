import 'package:flutter/material.dart';
import 'package:the_teraphist/Pages/Home.dart';
import 'package:the_teraphist/record/record.dart';
import 'Pages/LogIn.dart';
import 'Pages/Signup.dart';
import 'Pages/ContactUs.dart';
import 'Pages/Profile.dart';
import 'Pages/HomePage.dart';
import 'Pages/Upload.dart';
import 'Quiz/Quiz.dart';
import 'Pages/Recommend.dart';
import 'Pages/DoctorProfile.dart';
import 'Pages/Role.dart';
import 'record/record.dart';




void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(

        primarySwatch: Colors.blue,

        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: RecordScreen(),
    );
  }
}

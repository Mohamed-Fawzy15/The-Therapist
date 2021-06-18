import 'package:flutter/material.dart';
import 'SideDrawer.dart';

class Upload extends StatefulWidget {
  @override
  _UploadState createState() => _UploadState();
}

class _UploadState extends State<Upload> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      drawer: SideDrawer(),
      appBar: AppBar(
        title: Text(
          "History of Record",
          style: TextStyle(
              fontSize: 25,
              color: Colors.white,
              fontWeight: FontWeight.bold),
        ),
        backgroundColor: Color(0xff3d89bb),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Center(
            child: Image(image: AssetImage("images/upload.png"),),
          ),
          Center(
            child: Text(
              "Upload Record",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 40,
                color: Colors.black,
              ),
            ),
          ),

          Padding(
              padding: EdgeInsets.all(20),
          child: Center(
            child: Text(
              "Upload your record to analyze\n it and change your mood",
              style: TextStyle(
                  fontSize: 25,
                  color: Colors.black
              ),
            ),
          ),
          ),



        ],
      ),
    );
  }
}

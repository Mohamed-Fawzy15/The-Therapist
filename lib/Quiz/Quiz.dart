import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../Pages/SideDrawer.dart';
import 'QuizList.dart';
import 'dart:async';
import 'dart:io';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:path_provider/path_provider.dart';


QuizList ql = QuizList();

class Quiz extends StatefulWidget {

  final Function? save;

  const Quiz({Key? key, this.save}) : super(key: key);

  @override
  _QuizState createState() => _QuizState();
}

class _QuizState extends State<Quiz> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: SideDrawer(),
      appBar:  AppBar(
        title: Text(
          "Quiz",
          style: TextStyle(
              fontSize: 25,
              color: Colors.white,
              fontWeight: FontWeight.bold),
        ),
        backgroundColor: Color(0xff3d89bb),
      ),
      body: Column(
        children: [

          Padding(
            padding: EdgeInsets.all(20),
          child: Container(
            height: 251.78,
            width: 372,
            decoration: BoxDecoration(
              color: Color(0xE1E6EBff),
              // color: Colors.grey,
              borderRadius: BorderRadius.circular(15),
            ),
            child: Column(
              children: [

                Padding(padding: EdgeInsets.all(15),
                child: Align(
                  alignment: Alignment.topRight,
                  child:Container(
                    height: 50,
                    width: 50,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.white,
                    ),
                    child:Center(
                      child: Text(
                        ql.getQuestionNumber().toString()+ "/" + ql.getQuestionLength().toString(),
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 18
                        ),
                      ),
                    )
                  ),
                ),
                ),

                Padding(padding: EdgeInsets.all(15),
                  child: Center(
                    child: Text(
                      ql.getQuestionText(),
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Color(0xff3d89bb),
                        fontSize: 25,
                      ),
                    ),
                  ),
                ),


              ],

            ),
          ),
          ),





          Padding(
            padding: EdgeInsets.fromLTRB(50, 30, 50, 10),
            child: SizedBox(
              height: 50,
              width: 275,
              child: FlatButton(
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                color: Color(0xff3d89bb),
                onPressed: () {
                  setState(() {
                    ql.nextQuestion();
                  });
                },
                child: Text(
                  "Next",
                  style: TextStyle(
                    fontSize: 30,
                    color: Color(0xffffffff),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

}

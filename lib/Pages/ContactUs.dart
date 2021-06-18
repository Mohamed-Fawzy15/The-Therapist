import 'package:flutter/material.dart';
import 'SideDrawer.dart';


class ContactUs extends StatefulWidget {
  @override
  _ContactUsState createState() => _ContactUsState();
}

class _ContactUsState extends State<ContactUs> {

  final text = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: SideDrawer(),
      appBar: AppBar(
        title: Text(
                  "Contact Us",
                  style: TextStyle(
                      fontSize: 25,
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                ),
        backgroundColor: Color(0xff3d89bb),
      ),
      backgroundColor: Color(0xffffffff),
      body: ListView(
        children: <Widget>[
          Column(
            children: [

              Padding(
                  padding: EdgeInsets.fromLTRB(20, 20, 20, 15),
                child: Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    "Feel Free To Contact Us",
                    style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold
                    ),
                  ),
                ),
              ),

              Padding(
                padding: EdgeInsets.fromLTRB(20, 20, 20, 15),
                child: Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    "Email",
                    style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold
                    ),
                  ),
                ),
              ),

              Padding(
                padding: EdgeInsets.fromLTRB(20, 5, 20, 25),
                child: TextField(
                  controller: text,
                  decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderRadius:
                        BorderRadius.all(Radius.circular(10.0)),
                        borderSide: BorderSide(color: Colors.black),
                      ),
                      filled: true,
                      fillColor: Colors.white38),
                ),
              ),

              Padding(
                padding: EdgeInsets.fromLTRB(20, 25, 20, 15),
                child: Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    "Write To Us",
                    style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold
                    ),
                  ),
                ),
              ),



              Container(
                padding: EdgeInsets.fromLTRB(20, 5, 20, 30),
                // height: 5*24.0,
                child: TextField(
                  maxLines: 12,
                  controller: text,
                  decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderRadius:
                        BorderRadius.all(Radius.circular(10.0)),
                        borderSide: BorderSide(color: Colors.black),
                      ),
                      filled: true,
                      fillColor: Colors.white38),
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
                    onPressed: () {},
                    child: Text(
                      "Submit",
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
        ],
      ),
    );
  }
}


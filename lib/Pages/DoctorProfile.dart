import 'dart:convert';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:flutter/material.dart';
import 'package:the_teraphist/Pages/SideDrawer.dart';
import '../Models/User.dart';
import '../Models/UserHeaders.dart';
import 'package:http/http.dart' as http;

class DoctorProfile extends StatefulWidget {

  int id;
  UserHeaders userheaders;

  DoctorProfile({Key? key, required this.id, required this.userheaders}) : super(key: key);


  @override
  _DoctorProfileState createState() => _DoctorProfileState();
}

class _DoctorProfileState extends State<DoctorProfile> {

  bool _isVisiable = true;
  String aboutText = "Incomplete";
  String specialtyText = "Incomplete";


  final about = TextEditingController();
  final specialty = TextEditingController();

  Future<User>? user;

  @override
  void initState() {
    super.initState();
    user = fetchUser();
  }

  Widget header(text){
    return  Padding(
      padding: EdgeInsets.fromLTRB(20, 20, 20, 5),
      child: Align(
        alignment: Alignment.centerLeft,
        child: Text(
          text ,
          style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 30,
              color: Color(0xff3d89bb)
          ),
        ),
      ),
    );
  }

  Widget line(){
    return   Padding(
      padding:EdgeInsets.symmetric(horizontal:10.0),
      child:Container(
        height:1.5,
        width:360.0,
        color:Colors.black,),
    );
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: SideDrawer(),
      appBar: AppBar(
        backgroundColor: Color(0xff3d89bb),
      ),
      backgroundColor: Color(0xffffffff),
      body: ListView(
        children: [
          Column(
            children: <Widget>[

              Container(
                height: 210,
                color: Color(0xff3d89bb),
                child: Center(
                  // alignment: Alignment.center,
                  child: Icon(Icons.account_circle_rounded, size: 200, color: Colors.white,),
                ),
              ),


              header("Doctor Name"),

              Row(
                children: [

                  Padding(
                    padding: EdgeInsets.fromLTRB(20, 5, 20, 5),
                    child: Align(
                        alignment: Alignment.centerLeft,
                        child: FutureBuilder<User>(
                          future: user,
                          builder: (context, snapshot) {
                            if (snapshot.hasData) {
                              return Text(
                                snapshot.data!.first_name + " "+ snapshot.data!.last_name,
                                style: TextStyle(
                                    fontSize: 30,
                                    color: Colors.black
                                ),
                              );

                            } else if (snapshot.hasError) {
                              return Text("${snapshot.error}");
                            }

                            // By default, show a loading spinner.
                            return CircularProgressIndicator();
                          },
                        )

                    ),
                  ),

                  SizedBox(width: 10,),

                  IconButton(
                      padding: EdgeInsets.fromLTRB(20, 5, 20, 10),
                      icon: Icon(Icons.edit),
                      iconSize: 35,
                      color: Color(0xff3d89bb),
                      onPressed: (){
                        setState(() {
                          _isVisiable = false;
                        });
                      }
                  )
                ],
              ),

              line(),

              header("Email"),


                  Padding(
                    padding: EdgeInsets.fromLTRB(20, 5, 20, 15),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: FutureBuilder<User>(
                        future: user,
                        builder: (context, snapshot) {
                          if (snapshot.hasData) {
                            return Text(
                              snapshot.data!.email,
                              style: TextStyle(
                                  fontSize: 25,
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold
                              ),
                            );

                          } else if (snapshot.hasError) {
                            return Text("${snapshot.error}");
                          }

                          // By default, show a loading spinner.
                          return CircularProgressIndicator();
                        },
                      ),
                    ),
                  ),

             line(),

              header("Phone Number"),

             

              Row(
                children: [
                  Padding(
                    padding: EdgeInsets.fromLTRB(20, 5, 20, 15),
                    child: Align(
                        alignment: Alignment.centerLeft,
                        child: FutureBuilder<User>(
                          future: user,
                          builder: (context, snapshot) {
                            if (snapshot.hasData) {
                              return Text(
                                snapshot.data!.phone,
                                style: TextStyle(
                                    fontSize: 25,
                                    color: Colors.black
                                ),
                              );

                            } else if (snapshot.hasError) {
                              return Text("${snapshot.error}");
                            }

                            // By default, show a loading spinner.
                            return CircularProgressIndicator();
                          },
                        )
                    ),
                  ),

                ],
              ),

            line(),

             header("Gender"),


              Padding(
                padding: EdgeInsets.fromLTRB(20, 5, 20, 15),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: FutureBuilder<User>(
                    future: user,
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        return Text(
                          snapshot.data!.gender,
                          style: TextStyle(
                              fontSize: 25,
                              color: Colors.black
                          ),
                        );

                      } else if (snapshot.hasError) {
                        return Text("${snapshot.error}");
                      }

                      // By default, show a loading spinner.
                      return CircularProgressIndicator();
                    },
                  ),
                ),
              ),

             line(),

             header("Date of birth"),


              Padding(
                padding: EdgeInsets.fromLTRB(20, 5, 20, 15),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: FutureBuilder<User>(
                    future: user,
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        return Text(
                          snapshot.data!.birth_date,
                          style: TextStyle(
                              fontSize: 25,
                              color: Colors.black
                          ),
                        );

                      } else if (snapshot.hasError) {
                        return Text("${snapshot.error}");
                      }

                      // By default, show a loading spinner.
                      return CircularProgressIndicator();
                    },
                  ),
                ),
              ),

             line(),

              header("About"),

              Visibility(
                visible: _isVisiable,
                  child:  Padding(
                    padding: EdgeInsets.fromLTRB(20, 5, 20, 15),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        aboutText,
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 25,
                            color: Colors.black
                        ),
                      ),
                    ),
                  ),
              ),

              Visibility(
                visible: !_isVisiable,
                  child: Padding(
                    padding: EdgeInsets.fromLTRB(20, 5, 20, 10),
                    child: TextField(
                      controller: about,
                      decoration: InputDecoration(
                          hintText: "You can write about your self here",
                          // labelText: "Please enter your Email",
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(10.0)),
                            borderSide: BorderSide(color: Colors.black),
                          ),
                          filled: true,
                          fillColor: Colors.white38),
                    ),
                  ),
              ),

             line(),

              header("Specialty"),

              Visibility(
                visible: _isVisiable,
                child:  Padding(
                  padding: EdgeInsets.fromLTRB(20, 5, 20, 15),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      specialtyText,
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 25,
                          color: Colors.black
                      ),
                    ),
                  ),
                ),
              ),

              Visibility(
                visible: !_isVisiable,
                child: Padding(
                  padding: EdgeInsets.fromLTRB(20, 5, 20, 10),
                  child: TextField(
                    controller: specialty,
                    decoration: InputDecoration(
                        hintText: "Please Write your Specialty",
                        // labelText: "Please enter your Email",
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10.0)),
                          borderSide: BorderSide(color: Colors.black),
                        ),
                        filled: true,
                        fillColor: Colors.white38),
                  ),
                ),
              ),
              

              Visibility(
                visible: !_isVisiable,
                  child: Padding(
                    padding: EdgeInsets.fromLTRB(50, 30, 50, 10),
                    child: SizedBox(
                      height: 50,
                      width: 100,
                      child: FlatButton(
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                        color: Color(0xff3d89bb),
                        onPressed: () {
                          setState(() {
                            print(about.text);
                            aboutText = about.text;
                            specialtyText = specialty.text;
                            _isVisiable = true;
                          });
                        },
                        child: Text(
                          "Save",
                          style: TextStyle(
                            fontSize: 20,
                            color: Color(0xffffffff),
                          ),
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

  Future<User> fetchUser() async{
    final response = await http.get(
      Uri.https('the-therapist.herokuapp.com', '/api/v1/users/' + widget.id.toString()),
      headers: <String, String>{
        'access-token': widget.userheaders.access_token!,
        'client': widget.userheaders.client!,
        'uid': widget.userheaders.uid!,
      },
    );
    print("sssssssssss");
    _onBasicAlertPressed(context) {
      Alert(
        context: context,
        title: "Invalid Input",
        desc: jsonDecode(response.body)["errors"]["full_messages"].join(','),
      ).show();
    }

    if (response.statusCode == 200) {
      return User.fromJson(jsonDecode(response.body)["user"]);
    } else {
      _onBasicAlertPressed(context);
      throw Exception('Failed to load album');
    }
  }

}

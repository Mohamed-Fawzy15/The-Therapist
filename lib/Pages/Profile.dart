import 'dart:convert';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:flutter/material.dart';
import 'package:the_teraphist/Pages/SideDrawer.dart';
import '../Models/User.dart';
import '../Models/UserHeaders.dart';
import 'package:http/http.dart' as http;

class Profile extends StatefulWidget {

  int? id;
  UserHeaders? userheaders;

  Profile({Key? key,  this.id,  this.userheaders}) : super(key: key);


  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {

  Future<User>? user;

  @override
  void initState() {
    super.initState();
    user = fetchUser();
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



              Padding(
                  padding: EdgeInsets.fromLTRB(20, 20, 20, 5),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Name" ,
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 30,
                        color: Color(0xff3d89bb)
                    ),
                  ),
                ),
              ),

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

                  SizedBox(width: 100,),

                  IconButton(
                    padding: EdgeInsets.fromLTRB(20, 5, 20, 10),
                      icon: Icon(Icons.edit),
                      iconSize: 35,
                      color: Color(0xff3d89bb),
                      onPressed: (){
                      print(widget.id);
                      }
                  )
                ],
              ),

              Padding(
                padding:EdgeInsets.symmetric(horizontal:10.0),
                child:Container(
                  height:1.5,
                  width:360.0,
                  color:Colors.black,),
              ),



              Padding(
                padding: EdgeInsets.fromLTRB(20, 20, 20, 5),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Email",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 30,
                        color: Color(0xff3d89bb)
                    ),
                  ),
                ),
              ),

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

                  SizedBox(width: 10,),

                 // FlatButton(
                 //     onPressed: (){},
                 //    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                 //   color: Colors.red,
                 //     child: Text(
                 //       "Not Verified",
                 //       style: TextStyle(
                 //         fontSize: 20,
                 //         color: Colors.white
                 //       ),
                 //     ),
                 // ),
                ],
              ),

              Padding(
                padding:EdgeInsets.symmetric(horizontal:10.0),
                child:Container(
                  height:1.5,
                  width:360.0,
                  color:Colors.black,),
              ),


              Padding(
                padding: EdgeInsets.fromLTRB(20, 20, 20, 5),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Phone Number",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 30,
                        color: Color(0xff3d89bb)
                    ),
                  ),
                ),
              ),

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

                  SizedBox(width: 75,),

                  FlatButton(
                    onPressed: (){},
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                    color: Colors.green,
                    child: Text(
                      "Verified",
                      style: TextStyle(
                          fontSize: 20,
                          color: Colors.white
                      ),
                    ),
                  ),
                ],
              ),

              Padding(
                padding:EdgeInsets.symmetric(horizontal:10.0),
                child:Container(
                  height:1.5,
                  width:360.0,
                  color:Colors.black,),
              ),

              Padding(
                padding: EdgeInsets.fromLTRB(20, 20, 20, 5),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Gender",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 30,
                        color: Color(0xff3d89bb)
                    ),
                  ),
                ),
              ),


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

              Padding(
                padding:EdgeInsets.symmetric(horizontal:10.0),
                child:Container(
                  height:1.5,
                  width:360.0,
                  color:Colors.black,),
              ),

              Padding(
                padding: EdgeInsets.fromLTRB(20, 20, 20, 5),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Date Of Birth",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 30,
                        color: Color(0xff3d89bb)
                    ),
                  ),
                ),
              ),


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
        'access-token': widget.userheaders!.access_token!,
        'client': widget.userheaders!.client!,
        'uid': widget.userheaders!.uid!,
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

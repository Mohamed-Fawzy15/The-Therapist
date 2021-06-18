import 'dart:convert';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:the_teraphist/Models/UserHeaders.dart';
import 'package:the_teraphist/Pages/HomePage.dart';
import 'package:http/http.dart' as http;
import '../Models/User.dart';
import 'Role.dart';



class LogIn extends StatefulWidget {



  @override
  _LogInState createState() => _LogInState();
}

class _LogInState extends State<LogIn> {

  final password = TextEditingController();
  final email = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff3d89bb),
      ),
      backgroundColor: Color(0xffffffff),
      body: ListView(
        children: <Widget>[

            Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[

                    Container(
                      margin: EdgeInsets.zero,
                      padding: EdgeInsets.zero,
                        width: MediaQuery.of(context).size.width*0.1,
                        height: MediaQuery.of(context).size.height*0.35,
                        child: Image(
                          image: AssetImage("images/logo2.png"),
                          fit: BoxFit.fitHeight,
                        ),
                        // constraints: BoxConstraints.expand(),
                      ),


                Padding(
                  padding: EdgeInsets.fromLTRB(20, 20, 20, 10),
                  child: SizedBox(
                    width: 50,
                    height: 62,
                    child: FlatButton(
                        onPressed: () {},
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                      color: Colors.indigo,
                        child: Row(
                          children: <Widget>[
                            Container(
                              width: 72,
                              height: MediaQuery.of(context).size.height*0.05,
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: AssetImage("images/face.png")
                                )
                              ),
                            ),
                            Text(
                              "Log In with Facebook",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 25
                              ),
                            )
                          ],
                        ),
                    ),
                  ),
                ),

                Padding(
                  padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
                  child: SizedBox(
                    width: 50,
                    height: 62,
                    child: FlatButton(
                      onPressed: () {},
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                      color: Colors.red,
                      child: Row(
                        // mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Container(
                            width: 75,
                            height: MediaQuery.of(context).size.height*0.04,
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                    image: AssetImage("images/google.png")
                                )
                            ),
                          ),
                          Text(
                            "Log In with Google",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 25
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),


                Padding(
                  padding: EdgeInsets.all(20),
                  child: Row(
                    children: [
                      Padding(
                        padding:EdgeInsets.symmetric(horizontal:10.0),
                        child:Container(
                          height:1.5,
                          width:147.0,
                          color:Colors.black,),),
                      Text(
                          "OR",
                        style: TextStyle(
                          fontSize: 25,
                            fontWeight: FontWeight.bold
                        ),
                      ),
                      Padding(
                        padding:EdgeInsets.symmetric(horizontal:10.0),
                        child:Container(
                          height:1.5,
                          width:147.0,
                          color:Colors.black,),
                      ),
                    ],
                  ),
                ),


               Padding(
                   padding: EdgeInsets.fromLTRB(20, 5, 20, 10),
                 child: TextField(
                   controller: email,
                   decoration: InputDecoration(
                     prefixIcon: Icon(Icons.email),
                     hintText: "Please Enter Your Email",
                       // labelText: "Please enter your Email",
                       enabledBorder: OutlineInputBorder(
                         borderRadius: BorderRadius.all(Radius.circular(10.0)),
                         borderSide: BorderSide(color: Colors.black),
                       ),
                     filled: true,
                     fillColor: Colors.white38
                   ),
                 ),
               ),


                Padding(
                  padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
                  child: TextField(
                    controller: password,
                    // autofocus: false,
                    // obscureText: true,
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.lock),
                        hintText: "Please Enter Your Password",
                        // labelText: "Please enter your Email",
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10.0)),
                          borderSide: BorderSide(color: Colors.black),
                        ),
                        filled: true,
                        fillColor: Colors.white38
                    ),
                  ),
                ),


                Padding(
                  padding: EdgeInsets.fromLTRB(50, 30, 50, 10),
                  child: SizedBox(
                    height: 50,
                    width: 60,
                    child: FlatButton(
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                      color: Color(0xff3d89bb),
                      onPressed: () {
                        // Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage()));
                        setState(() {
                          logInUser(email.text, password.text);
                        });
                      },
                      child: Text(
                        "Log In",
                        style: TextStyle(
                          fontSize: 20,
                          color: Color(0xffffffff),
                        ),
                      ),
                    ),
                  ),
                ),


                Center(
                  child: FlatButton(
                    onPressed: (){},
                    child: Text(
                      "Forget Password?",
                      style: TextStyle(
                        fontSize: 20
                      ),
                    ),
                  ),
                )

              ],
            ),
        ],
      ),
    );
  }




  Future<User> logInUser(String email, String password)  async {
    print('askfdasfklasdf');
    final response = await http.post(
      Uri.https('the-therapist.herokuapp.com', '/api/v1/users/sign_in'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        // 'Content-Type': 'application/json; charset=UTF-8',
        // 'Content-Type': 'application/json; charset=UTF-8',
        // 'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, Map>{
        "user": {
          "email": email,
          "password": password,

        }
      }),
    );

    _onBasicAlertPressed(context) {
      Alert(
        context: context,
        title: "Invalid Input",
        desc: jsonDecode(response.body)["errors"]["full_messages"].join(','),
      ).show();
    }

    if (response.statusCode == 200) {
      final responseValue = User.fromJson(jsonDecode(response.body)["user"]);
      UserHeaders uh = new UserHeaders(
          access_token: response.headers["access-token"], client: response.headers["client"], uid: response.headers["uid"]
      );
      Navigator.push(context, MaterialPageRoute(builder: (context) => Role(id: responseValue.id!, userheaders: uh,)));
      print(" Stirng = " + responseValue.id.toString());
      print(uh.uid);
      return responseValue;
    } else {
      _onBasicAlertPressed(context);
      throw Exception('Failed to load album');
    }
  }

}

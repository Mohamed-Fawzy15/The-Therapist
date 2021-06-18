import 'package:flutter/material.dart';
import 'package:the_teraphist/Pages/Signup.dart';
import 'LogIn.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {


  void Navigate(pageName, context){
    Navigator.push(context, MaterialPageRoute(builder: (context) => pageName));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffffffff),
      body: Stack(
        children: <Widget>[
          Column(
            // mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Container(
                height: 82,
                width: 412,
                color: Color(0xff3d89bb),
              ),


              Container(
                width: double.infinity,
                height: MediaQuery.of(context).size.height*0.38,
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: Container(
                    width: 317,
                    height: 379,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage("images/logo.png")
                        )
                    ),
                  ),
                ),
              ),



               Container(
                 width: double.infinity,
                 height: MediaQuery.of(context).size.height*0.16,
                 child: Align(
                   alignment: Alignment.topCenter,
                   child: Text(
                       "Know your mode with \n  \t \t The therapist",
                       style: TextStyle(
                         color: Color(0xff3d89bb),
                         fontSize: 25,
                         fontWeight: FontWeight.w700,
                       ),
                     ),

                 ),
               ),


              Padding(
                  padding: EdgeInsets.all(20),
                  child: SizedBox(
                    height: 50,
                    width: 100,
                    child: FlatButton(
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                      color: Color(0xff3d89bb),
                      onPressed: () {
                        setState(() {
                          Navigate(LogIn(), context);
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



              Padding(
                  padding: EdgeInsets.all(20),
                  child: SizedBox(
                    height: 50,
                    width: 100,
                    child: FlatButton(
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                      color: Color(0xff3d89bb),
                      onPressed: () {
                        setState(() {
                          Navigate(SignUp(), context);
                        });
                      },
                      child: Text(
                        "Sign Up",
                        style: TextStyle(
                          fontSize: 20,
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

import 'package:flutter/material.dart';
import 'package:the_teraphist/Models/UserHeaders.dart';
import 'package:the_teraphist/Pages/DoctorProfile.dart';
import 'package:the_teraphist/Pages/HomePage.dart';
import 'SideDrawer.dart';
import 'Profile.dart';


class Role extends StatefulWidget {

  int id;
  UserHeaders userheaders;

  Role({Key? key, required this.id, required this.userheaders}) : super(key: key);

  @override
  _RoleState createState() => _RoleState();
}

class _RoleState extends State<Role> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffffffff),
      drawer: SideDrawer(),
      appBar: AppBar(
        title: Text(
          "Role",
          style: TextStyle(
              fontSize: 25,
              color: Colors.white,
              fontWeight: FontWeight.bold),
        ),
        backgroundColor: Color(0xff3d89bb),
      ),
      body: ListView(
        children: [

          Column(
            children: [
              Container(
                width: 250,
                height: 250,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  // shape: BoxShape.circle,
                ),
                child: Image(image: AssetImage("images/doctor.png"),),
              ),
              
              FlatButton(
                  onPressed: (){
                    setState(() {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage(id: widget.id, userheaders: widget.userheaders, role:"doctor")));
                    });
                  },
                  child: Text(
                    "Doctor",
                    style: TextStyle(
                      color: Colors.indigo,
                      fontWeight: FontWeight.bold,
                      fontSize: 50
                    ),
                  )
              ),
            ],
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

          Column(
            children: [
              Container(
                width: 250,
                height: 250,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  // shape: BoxShape.circle,
                ),
                child: Image(image: AssetImage("images/patient.png"),),
              ),

              FlatButton(
                  onPressed: (){
                    setState(() {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage(id: widget.id, userheaders: widget.userheaders, role:"patient")));
                    });
                  },
                  child: Text(
                    "Patient",
                    style: TextStyle(
                        color: Colors.indigo,
                        fontWeight: FontWeight.bold,
                        fontSize: 50
                    ),
                  )
              ),
            ],
          ),
        ],
      ),
    );
  }
}

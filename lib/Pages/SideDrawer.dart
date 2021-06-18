import 'package:flutter/material.dart';
import 'package:the_teraphist/Models/UserHeaders.dart';
import 'package:the_teraphist/Pages/ContactUs.dart';
import 'package:the_teraphist/Pages/LogIn.dart';
import 'HomePage.dart';
import 'package:the_teraphist/Pages/Profile.dart';
import 'DoctorProfile.dart';


class SideDrawer extends StatelessWidget {

  int? id;
  UserHeaders? userheaders;
  String? role;

  SideDrawer({Key? key, this.id,  this.userheaders,  this.role}) : super(key: key);


  void Navigate(pageName, context){
    Navigator.push(context, MaterialPageRoute(builder: (context) => pageName));
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          DrawerHeader(
              child: Row(
                children: [
                  Padding(padding: EdgeInsets.all(20),
                  child: CircleAvatar(
                    backgroundColor: Colors.grey.shade50,
                    radius: 40,
                    child: Text('image'),
                  ),
                  ),

                  
                  
                  FlatButton(
                      onPressed: (){
                        print(id);
                        if(role == "doctor"){
                          Navigate(DoctorProfile(id: id!, userheaders: userheaders!), context);
                        }else if(role == "patient"){
                          Navigate(Profile(id: id, userheaders: userheaders), context);
                        }
                      },
                      child: Text(
                        "UserName",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                        color: Colors.white,
                        fontSize: 20
                        ),
                        )
                  ),
                ],
              ),
            decoration: BoxDecoration(
              color: Color(0xff3d89bb),
            ),
          ),

          ListTile(
            leading: Icon(Icons.account_box_rounded),
            title: Text("Profile", style: TextStyle(color: Colors.black),),
            onTap: () => {
              if(role == "doctor"){
              Navigate(DoctorProfile(id: id!, userheaders: userheaders!), context)
              }else if(role == "patient"){
              Navigate(Profile(id: id, userheaders: userheaders), context)
              }
            },
          ),

          ListTile(
            leading: Icon(Icons.home),
            title: Text("Home", style: TextStyle(color: Colors.black),),
            onTap: () => {Navigate(HomePage(), context)},
          ),

          ListTile(
            leading: Icon(Icons.settings),
            title: Text("Setting", style: TextStyle(color: Colors.black),),
            onTap: () => {Navigator.of(context).pop()},
          ),

          ListTile(
            leading: Icon(Icons.perm_phone_msg),
            title: Text("Contact Us", style: TextStyle(color: Colors.black),),
            onTap: () => {Navigate(ContactUs(), context)},
          ),

          ListTile(
            leading: Icon(Icons.question_answer),
            title: Text("About Us", style: TextStyle(color: Colors.black)),
            onTap: () => {Navigator.of(context).pop()},
          ),

          ListTile(
            leading: Icon(Icons.keyboard_return),
            title: Text("Log Out", style: TextStyle(color: Colors.black),),
            onTap: () => {Navigate(LogIn(), context)},
          ),
        ],
      ),
    );
  }
}

import 'dart:convert';
import '../Models/User.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:enum_to_string/enum_to_string.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import '../Models/UserHeaders.dart';
import 'Role.dart';


// User user = new User(email: 'mohamed@example.com', password: "mahmoud@ALI98",
//     password_confirmation: "mahmoud@ALI98", first_name: "mohamed", last_name: "fawzy", phone: "+201286183364");

class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

enum genderValue { male, female }

enum roleValue { doctor, patient}

class _SignUpState extends State<SignUp> {
  User? user;

  roleValue _role = roleValue.patient;

  genderValue _gender = genderValue.male;

  final first_name = TextEditingController();
  final last_name = TextEditingController();
  final password = TextEditingController();
  final password_confirmation = TextEditingController();
  final phone = TextEditingController();
  final email = TextEditingController();



  bool firstValue = true;
  bool secondValue = false;
  bool thirdValue = false;

  DateTime selectedDate = DateTime.now();


  _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(1990),
      lastDate: DateTime(2030),
    );
    if (picked != null && picked != selectedDate)
      setState(() {
        selectedDate = picked;
      });
  }

  Widget textField(controller, hintText, icon) {
    return Padding(
      padding: EdgeInsets.fromLTRB(20, 5, 20, 10),
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
            prefixIcon: icon,
            hintText: hintText,
            // labelText: "Please enter your Email",
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(10.0)),
              borderSide: BorderSide(color: Colors.black),
            ),
            filled: true,
            fillColor: Colors.white38),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffffffff),
      body: ListView(
        children: <Widget>[

          Column(
            children: <Widget>[

              Container(
                height: 60,
                color: Color(0xff3d89bb),
                padding: EdgeInsets.zero,
                child: Row(
                  // mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    IconButton(
                      icon: Icon(Icons.arrow_back_sharp),
                      onPressed: () {},
                      color: Colors.white,
                    ),
                    SizedBox(
                      width: 120,
                    ),
                    Center(
                      child: Text(
                        "Sign Up",
                        style: TextStyle(
                            fontSize: 25,
                            color: Colors.white,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
              ),

              Column(
                children: <Widget>[

                  Container(
                    margin: EdgeInsets.zero,
                    padding: EdgeInsets.zero,
                    width: MediaQuery.of(context).size.width * 0.5,
                    height: MediaQuery.of(context).size.height * 0.35,
                    child: Image(
                      image: AssetImage("images/logo2.png"),
                      fit: BoxFit.fitHeight,
                    ),
                    // constraints: BoxConstraints.expand(),
                  ),

                  textField(first_name, "First Name",
                      Icon(Icons.account_box_rounded)),

                  textField(
                      last_name, "Last Name", Icon(Icons.account_box_rounded)),

                  textField(email, "Email", Icon(Icons.email)),

                  textField(password, "Password", Icon(Icons.lock)),

                  textField(password_confirmation, "Confirm Password",
                      Icon(Icons.lock)),

                  textField(phone, "Phone Number", Icon(Icons.phone)),

                  Padding(
                    padding: EdgeInsets.fromLTRB(20, 20, 20, 5),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Gender",
                        style: TextStyle(
                            color: Color(0xff3d89bb),
                            fontWeight: FontWeight.bold,
                            fontSize: 35),
                      ),
                    ),
                  ),

                  ListTile(
                    title: Text("Male"),
                    leading: Radio(
                      value: genderValue.male,
                      groupValue: _gender,
                      onChanged: (genderValue? value) {
                        setState(() {
                          _gender = value!;
                        });
                      },
                    ),
                  ),

                  ListTile(
                    title: Text("Female"),
                    leading: Radio(
                      value: genderValue.female,
                      groupValue: _gender,
                      onChanged: (genderValue? value) {
                        setState(() {
                          _gender = value!;
                        });
                      },
                    ),
                  ),


                  Padding(
                    padding: EdgeInsets.fromLTRB(20, 20, 20, 5),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Role",
                        style: TextStyle(
                            color: Color(0xff3d89bb),
                            fontWeight: FontWeight.bold,
                            fontSize: 35),
                      ),
                    ),
                  ),

                  ListTile(
                    title: Text("Doctor"),
                    leading: Radio(
                      value: roleValue.doctor,
                      groupValue: _role,
                      onChanged: (roleValue? value) {
                        setState(() {
                          _role = value!;
                        });
                      },
                    ),
                  ),

                  ListTile(
                    title: Text("Patient"),
                    leading: Radio(
                      value: roleValue.patient,
                      groupValue: _role,
                      onChanged: (roleValue? value) {
                        setState(() {
                          _role = value!;
                        });
                      },
                    ),
                  ),


                  Padding(
                    padding: EdgeInsets.fromLTRB(20, 20, 20, 10),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Date Of Birth",
                        style: TextStyle(
                            color: Color(0xff3d89bb),
                            fontWeight: FontWeight.bold,
                            fontSize: 35),
                      ),
                    ),
                  ),
                  Row(
                    children: [
                      Padding(
                        padding: EdgeInsets.fromLTRB(20, 10, 20, 20),
                        child: Text(
                          "${selectedDate.toLocal()}".split(' ')[0],
                          style: TextStyle(
                              fontSize: 25,
                              fontWeight: FontWeight.bold,
                              color: Colors.black),
                        ),
                      ),

                      SizedBox(
                        width: 30.0,
                      ),

                      RaisedButton(
                        onPressed: () => _selectDate(context),
                        child: Text(
                          "Choose Date",
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        color: Color(0xff3d89bb),
                      )
                    ],
                  ),


                  Padding(
                    padding: EdgeInsets.fromLTRB(5, 20, 5, 20),
                    child: Row(
                      children: [
                        Checkbox(
                            value: thirdValue,
                            onChanged: (bool?value) {
                              setState(() {
                                this.thirdValue = value!;
                              });
                            }),
                        Text(
                          "I would like to receive your newsletter \n and other promotional information",
                          style: TextStyle(fontSize: 20),
                        ),
                      ],
                    ),
                  ),


                  Padding(
                    padding: EdgeInsets.fromLTRB(50, 25, 50, 10),
                    child: SizedBox(
                      height: 50,
                      width: 275,
                      child: FlatButton(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15)),
                        color: Color(0xff3d89bb),
                        onPressed: () {
                          setState(() {
                            user = new User(
                                email: email.text,
                                password: password.text,
                                password_confirmation: password_confirmation.text,
                                first_name: first_name.text,
                                last_name: last_name.text,
                                phone: phone.text,
                                gender: EnumToString.convertToString(_gender),
                                role: EnumToString.convertToString(_role),
                                birth_date:"${selectedDate.toLocal()}".split(' ')[0],
                            );
                            createUser(user!);
                          });
                        },
                        child: Text(
                          "Sign Up",
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
        ],
      ),
    );
  }

  Future<User> createUser(User user)  async {
    print('askfdasfklasdf');
    final response = await http.post(
      Uri.https('the-therapist.herokuapp.com', '/api/v1/users/sign_up'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        // 'Content-Type': 'application/json; charset=UTF-8',
        // 'Content-Type': 'application/json; charset=UTF-8',
        // 'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, Map>{
        "user": {
          "email": user.email,
          "phone": user.phone,
          "password": user.password,
          "password_confirmation": user.password_confirmation,
          "first_name": user.first_name,
          "last_name": user.last_name,
          "gender" : user.gender,
          "role" : user.role,
          "birth_date" : user.birth_date,
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
      Navigator.push(context, MaterialPageRoute(builder: (context) => Role(id: responseValue.id!, userheaders: uh)));
      print(responseValue.email);
      print(uh.uid);
      return responseValue;
    } else {
      _onBasicAlertPressed(context);
      throw Exception('Failed to load album');
    }
  }
}

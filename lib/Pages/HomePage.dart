import 'package:flutter/material.dart';
import 'package:the_teraphist/Models/UserHeaders.dart';
import 'package:the_teraphist/Pages/SideDrawer.dart';
import 'package:the_teraphist/Pages/Upload.dart';
// import 'package:the_teraphist/record/Record.dart';
import '../Quiz/Quiz.dart';


class HomePage extends StatefulWidget {

  int? id;
  UserHeaders? userheaders;
  String? role;

  HomePage({Key? key, this.id,  this.userheaders,  this.role}) : super(key: key);


  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {



  void Navigate(pageName, context){
    Navigator.push(context, MaterialPageRoute(builder: (context) => pageName));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: SideDrawer(id: widget.id, userheaders: widget.userheaders, role: widget.role,),
      appBar: AppBar(
        title: Text(
          "Home",
          style: TextStyle(
              fontSize: 25,
              color: Colors.white,
              fontWeight: FontWeight.bold),
        ),
        backgroundColor: Color(0xff3d89bb),
      ),
      backgroundColor: Colors.white,
      body: ListView(
        children: [
          Column(
            children: [

              Row(
                children: [
                  Align(
                    alignment: Alignment.topLeft,
                    child: Image(
                      width: MediaQuery.of(context).size.width*0.2,
                      height: MediaQuery.of(context).size.height*0.1,
                      image: AssetImage("images/logo2.png"),
                    ),
                  ),

                  Column(
                    children: [
                      Align(
                        alignment: Alignment.topLeft,
                        child: Text(
                          "The Therapist",
                          style: TextStyle(
                              fontSize: 30,
                              color: Colors.black,
                              fontWeight: FontWeight.bold
                          ),
                        ),
                      ),

                      Align(
                        alignment: Alignment.topLeft,
                        child: Text(
                          "Get more analysis about your mood",
                          style: TextStyle(
                              fontSize: 15,
                              color: Color(0xff3d89bb),
                              fontWeight: FontWeight.bold
                          ),
                        ),
                      ),
                    ],
                  )

                ],
              ),

              Container(
                height: 270,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [

                    Padding(
                      padding: EdgeInsets.fromLTRB(20, 10, 2, 10),
                      child:  Container(
                        width: 176.92,
                        height: 250.87,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: Color(0xE1E6EBff),
                        ),
                        child: Column(
                          children: [
                            Image(
                              image: AssetImage("images/quiz.png"),
                              width: MediaQuery.of(context).size.width*0.5,
                              height: MediaQuery.of(context).size.height*0.16,
                            ),

                            Text(
                              "Analyze your emotions \nby taking a simple quiz",
                              style: TextStyle(
                                  fontSize: 16,
                                  color: Color(0xff3d89bb)
                              ),
                            ),

                            Padding(
                              padding: EdgeInsets.all(15),
                              child: FlatButton(
                                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                                color: Color(0xff3d89bb),
                                onPressed: () {
                                  Navigate(Quiz(), context);
                                },
                                child: Text(
                                  "Details",
                                  style: TextStyle(
                                    fontSize: 20,
                                    color: Color(0xffffffff),
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),


                    Padding(
                      padding: EdgeInsets.fromLTRB(20,10, 2, 10),
                      child:  Container(
                        width: 176.92,
                        height: 250.87,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: Color(0xE1E6EBff),
                        ),
                        child: Column(
                          children: [
                            Image(
                              image: AssetImage("images/record.png"),
                              width: MediaQuery.of(context).size.width*0.5,
                              height: MediaQuery.of(context).size.height*0.16,
                            ),

                            Text(
                              "Analyze your emotions \nby recording voice",
                              style: TextStyle(
                                  fontSize: 16,
                                  color: Color(0xff3d89bb)
                              ),
                            ),

                            Padding(
                              padding: EdgeInsets.all(15),
                              child: FlatButton(
                                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                                color: Color(0xff3d89bb),
                                onPressed: () {
                                  // Navigate(Record(), context);
                                },
                                child: Text(
                                  "Details",
                                  style: TextStyle(
                                    fontSize: 20,
                                    color: Color(0xffffffff),
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),

                    Padding(
                      padding: EdgeInsets.fromLTRB(20, 10, 2, 10),
                      child:  Container(
                        width: 176.92,
                        height: 250.87,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: Color(0xE1E6EBff),
                        ),
                        child: Column(
                          children: [
                            Image(
                              image: AssetImage("images/recommend.png"),
                              width: MediaQuery.of(context).size.width*0.5,
                              height: MediaQuery.of(context).size.height*0.16,
                            ),

                            Text(
                              "Analyze your emotions \nby recording voice",
                              style: TextStyle(
                                  fontSize: 16,
                                  color: Color(0xff3d89bb)
                              ),
                            ),

                            Padding(
                              padding: EdgeInsets.all(15),
                              child: FlatButton(
                                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                                color: Color(0xff3d89bb),
                                onPressed: () {},
                                child: Text(
                                  "Details",
                                  style: TextStyle(
                                    fontSize: 20,
                                    color: Color(0xffffffff),
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),


                    Padding(
                      padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
                      child:  Container(
                        width: 176.92,
                        height: 250.87,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: Color(0xE1E6EBff),
                        ),
                        child: Column(
                          children: [
                            Image(
                              image: AssetImage("images/uploadhome.png"),
                              width: MediaQuery.of(context).size.width*0.5,
                              height: MediaQuery.of(context).size.height*0.16,
                            ),

                            Text(
                              "Analyze your emotions \nby recording voice",
                              style: TextStyle(
                                  fontSize: 16,
                                  color: Color(0xff3d89bb)
                              ),
                            ),

                            Padding(
                              padding: EdgeInsets.all(15),
                              child: FlatButton(
                                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                                color: Color(0xff3d89bb),
                                onPressed: () {
                                  setState(() {
                                    Navigate(Upload(), context);
                                  });
                                },
                                child: Text(
                                  "Details",
                                  style: TextStyle(
                                    fontSize: 20,
                                    color: Color(0xffffffff),
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),

                  ],
                ),
              ),

              Row(
                children: [
                  Padding(
                    padding:EdgeInsets.fromLTRB(20, 10, 20, 10),
                  child: Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      "Recommended Articles",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 25,
                        fontWeight: FontWeight.bold
                      ),
                    ),
                  ),
                  ),

                  Align(
                    alignment: Alignment.topRight,
                    child: Text(
                      "Show More",
                      style: TextStyle(
                        fontSize: 17,
                        color: Color(0xff3d89bb)
                      ),
                    ),
                  ),
                ],
              ),

              Container(
                padding: EdgeInsets.fromLTRB(20, 10, 20, 20),
                // height: 289,
                width: 380,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: Color(0xE1E6EBff)
                ),
                child: Column(
                  children: [
                    Container(
                      height: 110,
                      width: double.infinity,
                      color: Color(0xff3d89bb),
                      child: Align(
                        alignment: Alignment.center,
                        child: Text(
                          "article image",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 30
                          ),
                        ),
                      ),
                    ),

                    Padding(
                      padding:EdgeInsets.fromLTRB(0, 10, 0, 5),
                      child: Align(
                        alignment: Alignment.topLeft,
                        child: Text(
                          "lorem ipsum",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 18,
                              fontWeight: FontWeight.bold
                          ),
                        ),
                      ),
                    ),

                    Text(
                      "Lorem ipsum dolor sit amet, consetetur sadipscing elitr,"
                          " sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat,"
                          " sed diam voluptua. At vero eos et accusam........"
                    ),

                    Align(
                      alignment: Alignment.bottomRight,
                      child: FlatButton(
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                        color: Color(0xff3d89bb),
                        onPressed: () {},
                        child: Text(
                          "Show more",
                          style: TextStyle(
                            fontSize: 20,
                            color: Color(0xffffffff),
                          ),
                        ),
                      ),
                    ),


                  ],
                ),
              ),


            ],
          ),
        ],
      ),
    );
  }
}

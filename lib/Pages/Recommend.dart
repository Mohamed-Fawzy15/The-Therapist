import 'package:flutter/material.dart';
import 'package:the_teraphist/Pages/Profile.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'SideDrawer.dart';

class Recommend extends StatefulWidget {
  @override
  _RecommendState createState() => _RecommendState();
}

class _RecommendState extends State<Recommend> {

  String image = "images/face.png";

  void Navigate(pageName, context){
    Navigator.push(context, MaterialPageRoute(builder: (context) => pageName));
  }

  Widget Articles(image, title, details){
    return Container(
      padding: EdgeInsets.fromLTRB(20, 10, 20, 20),
      // height: 289,
      width: 350,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: Color(0xE1E6EBff),
      ),
      child: Column(
        children: [
          Container(
            height: 110,
            width: double.infinity,
            color: Color(0xff3d89bb),
            child: Align(
              alignment: Alignment.center,
              child: Image(image: AssetImage(image),)
            ),
          ),

          Padding(
            padding:EdgeInsets.fromLTRB(0, 10, 0, 5),
            child: Align(
              alignment: Alignment.topLeft,
              child: Text(
                title,
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                    fontWeight: FontWeight.bold
                ),
              ),
            ),
          ),

          Text(
              details,
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
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: SideDrawer(),
      appBar: AppBar(
        title: Text(
          "Articles",
          style: TextStyle(
              fontSize: 25,
              color: Colors.white,
              fontWeight: FontWeight.bold),
        ),
        backgroundColor: Color(0xff3d89bb),
      ),
      body: ListView(
        children: [

          Articles(image, "title", "lorem ipsum. . . . .. . .  ."),

          SizedBox(height: 20,),

          Articles(image, "title", "lorem ipsum. . . . .. . .  ."),



          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: 81,
              color: Colors.white54,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Column(
                    children: [
                      IconButton(
                          icon: Icon(Icons.article),
                          iconSize: 40,
                          color: Color(0xff3d89bb),
                          onPressed: () {
                            setState(() {
                              Navigate(Profile(), context);
                            });}
                          ),
                      
                      Text(
                        "Articles",
                        style: TextStyle(
                            color:  Color(0xff3d89bb),
                            fontWeight: FontWeight.bold,
                            fontSize: 20
                        ),
                      )
                    ],
                  ),

                  Column(
                    children: [
                      IconButton(
                          icon: Icon(Icons.video_collection),
                          iconSize: 40,
                          color: Color(0xff3d89bb),
                          onPressed: () {
                            setState(() {
                              Navigate(Profile(), context);
                            });}
                      ),

                      Text(
                        "Videos",
                        style: TextStyle(
                            color:  Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 20
                        ),
                      ),

                    ],
                  )

                ],
              ),
            ),
          ),

        ],
      ),
    );
  }
}


import 'package:doctor/constants.dart';
import 'package:flutter/material.dart';
import 'package:doctor/screens/home.dart';
import 'package:url_launcher/url_launcher.dart';

class location extends StatefulWidget {
  static String id = 'loocation';
  @override
  _locationState createState() => _locationState();
}

class _locationState extends State<location> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor:kMainColor,
        title: Text(
          'موقعنا',
          style: TextStyle(
              color: Colors.white
          ),
        ),
        leading: GestureDetector(
          onTap: () {
            Navigator.popAndPushNamed(context, home.id);
          },
          child: Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
        ),
      ),
      body:Padding(
        padding: EdgeInsets.fromLTRB(15, 10, 15, 10),
        child: new Card(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20)
          ),
          elevation: 9,
          color: Colors.white,
          child: Container(
            height: MediaQuery.of(context).size.height * .3,
            width:  MediaQuery.of(context).size.width ,
            child: Padding(
              padding: const EdgeInsets.only(right: 20,left: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: <Widget>[
                  Text(
                    '  :  موقعنا',
                    style: TextStyle(color: Colors.black,fontSize: 20,fontWeight:FontWeight.bold),
                  ),
                  Text("شارع الستين جوار برج الملكه",style: TextStyle(color: Colors.black,fontSize:20)),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * .05,
                  ),
                  Text(
                    '    للأستفسار الرجاء الأتصال بالرقم',
                    style: TextStyle(color: Colors.black,fontSize: 20,fontWeight:FontWeight.bold),
                  ),
                  GestureDetector(
                    onTap:(){
                      launch(('tel://+249920818802'));
                    },
                      //
                    child: Text("+249920818802",
                        style: TextStyle(color: Colors.blue,fontSize:20)
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

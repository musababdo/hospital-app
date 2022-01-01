
import 'package:doctor/constants.dart';
import 'package:flutter/material.dart';
import 'package:doctor/screens/home.dart';
import 'package:doctor/sickness/page1.dart';
import 'package:doctor/sickness/page2.dart';
import 'package:doctor/sickness/page3.dart';
import 'package:doctor/sickness/page4.dart';
import 'package:doctor/sickness/page5.dart';

class sick extends StatefulWidget {
  static String id = 'sick';
  @override
  _sickState createState() => _sickState();
}

class _sickState extends State<sick> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor:kMainColor,
        title: Text(
          'أمراض الباطنيه',
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
      body: _myListView(context),
    );
  }
  Widget _myListView(BuildContext context) {
    return ListView(
      children: <Widget>[
        GestureDetector(
          onTap:(){
            Navigator.popAndPushNamed(context, page1.id);
          },
          child: Card(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20)
            ),
            elevation: 9,
            child: ListTile(
              title: Padding(
                padding: const EdgeInsets.all(30),
                child: Text('أعراض المراره',style: TextStyle(fontSize: 20),),
              ),
            ),
          ),
        ),
        GestureDetector(
          onTap:(){
            Navigator.popAndPushNamed(context, page2.id);
          },
          child: Card(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20)
            ),
            elevation: 9,
            child: ListTile(
              title: Padding(
                padding: const EdgeInsets.all(30),
                child: Text('أعراض جرثومه المعده',style: TextStyle(fontSize: 20)),
              ),
            ),
          ),
        ),
        GestureDetector(
          onTap:(){
            Navigator.popAndPushNamed(context, page3.id);
          },
          child: Card(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20)
            ),
            elevation: 9,
            child: ListTile(
              title: Padding(
                padding: const EdgeInsets.all(30),
                child: Text('علاج غازات البطن',style: TextStyle(fontSize: 20)),
              ),
            ),
          ),
        ),
        GestureDetector(
          onTap:(){
            Navigator.popAndPushNamed(context, page4.id);
          },
          child: Card(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20)
            ),
            elevation: 9,
            child: ListTile(
              title: Padding(
                padding: const EdgeInsets.all(30),
                child: Text('علاج جرثومه المعده',style: TextStyle(fontSize: 20)),
              ),
            ),
          ),
        ),
        GestureDetector(
          onTap:(){
            Navigator.popAndPushNamed(context, page5.id);
          },
          child: Card(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20)
            ),
            elevation: 9,
            child: ListTile(
              title: Padding(
                padding: const EdgeInsets.all(30),
                child: Text('أسباب وجع المعده',style: TextStyle(fontSize: 20)),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

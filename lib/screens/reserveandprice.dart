
import 'package:doctor/constants.dart';
import 'package:flutter/material.dart';
import 'package:doctor/screens/home.dart';

class reserve extends StatefulWidget {
  static String id = 'reserve';
  @override
  _reserveState createState() => _reserveState();
}

class _reserveState extends State<reserve> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor:kMainColor,
        title: Text(
          'الحجز و الأسعار',
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
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.fromLTRB(15, 10, 15, 0),
              child: new Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)
                ),
                elevation: 9,
                color: Colors.white,
                child: Container(
                  height: MediaQuery.of(context).size.height * .1,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: <Widget>[
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              'SDG 1000',
                              style: TextStyle(color: Colors.black,fontSize: 18),
                            ),
                            Text(
                              '  :  السعر',
                              style: TextStyle(color: Colors.black,fontSize: 20,fontWeight:FontWeight.bold),
                            ),
                          ],
                        ),
                        Text(
                          'موجات',
                          style: TextStyle(color: Colors.black,fontSize: 20,fontWeight:FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(15, 10, 15, 0),
              child: new Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)
                ),
                elevation: 9,
                color: Colors.white,
                child: Container(
                  height: MediaQuery.of(context).size.height * .1,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: <Widget>[
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              'SDG 2000',
                              style: TextStyle(color: Colors.black,fontSize: 18),
                            ),
                            Text(
                              '  :  السعر',
                              style: TextStyle(color: Colors.black,fontSize: 20,fontWeight:FontWeight.bold),
                            ),
                          ],
                        ),
                        Text(
                          'صور مقطعيه',
                          style: TextStyle(color: Colors.black,fontSize: 20,fontWeight:FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(15, 10, 15, 0),
              child: new Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)
                ),
                elevation: 9,
                color: Colors.white,
                child: Container(
                  height: MediaQuery.of(context).size.height * .1,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: <Widget>[
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              'SDG 500',
                              style: TextStyle(color: Colors.black,fontSize: 18),
                            ),
                            Text(
                              '  :  السعر',
                              style: TextStyle(color: Colors.black,fontSize: 20,fontWeight:FontWeight.bold),
                            ),
                          ],
                        ),
                        Text(
                          'cbc فحص',
                          style: TextStyle(color: Colors.black,fontSize: 20,fontWeight:FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(15, 10, 15, 0),
              child: new Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)
                ),
                elevation: 9,
                color: Colors.white,
                child: Container(
                  height: MediaQuery.of(context).size.height * .1,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: <Widget>[
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              'SDG 3000',
                              style: TextStyle(color: Colors.black,fontSize: 18),
                            ),
                            Text(
                              '  :  السعر',
                              style: TextStyle(color: Colors.black,fontSize: 20,fontWeight:FontWeight.bold),
                            ),
                          ],
                        ),
                        Text(
                          'وظائف الكلي',
                          style: TextStyle(color: Colors.black,fontSize: 20,fontWeight:FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(15, 10, 15, 0),
              child: new Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)
                ),
                elevation: 9,
                color: Colors.white,
                child: Container(
                  height: MediaQuery.of(context).size.height * .1,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: <Widget>[
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              'SDG 3000',
                              style: TextStyle(color: Colors.black,fontSize: 18),
                            ),
                            Text(
                              '  :  السعر',
                              style: TextStyle(color: Colors.black,fontSize: 20,fontWeight:FontWeight.bold),
                            ),
                          ],
                        ),
                        Text(
                          'وظائف الكبد',
                          style: TextStyle(color: Colors.black,fontSize: 20,fontWeight:FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(15, 10, 15, 0),
              child: new Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)
                ),
                elevation: 9,
                color: Colors.white,
                child: Container(
                  height: MediaQuery.of(context).size.height * .1,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: <Widget>[
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              'SDG 4000',
                              style: TextStyle(color: Colors.black,fontSize: 18),
                            ),
                            Text(
                              '  :  السعر',
                              style: TextStyle(color: Colors.black,fontSize: 20,fontWeight:FontWeight.bold),
                            ),
                          ],
                        ),
                        Text(
                          'الأشعه المقطعيه',
                          style: TextStyle(color: Colors.black,fontSize: 20,fontWeight:FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(15, 10, 15, 10),
              child: new Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)
                ),
                elevation: 9,
                color: Colors.white,
                child: Container(
                  height: MediaQuery.of(context).size.height * .1,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: <Widget>[
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              'SDG 1000',
                              style: TextStyle(color: Colors.black,fontSize: 18),
                            ),
                            Text(
                              '  :  السعر',
                              style: TextStyle(color: Colors.black,fontSize: 20,fontWeight:FontWeight.bold),
                            ),
                          ],
                        ),
                        Text(
                          'الدخول لكل الأطباء',
                          style: TextStyle(color: Colors.black,fontSize: 20,fontWeight:FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

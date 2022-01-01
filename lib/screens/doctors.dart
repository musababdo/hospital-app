
import 'dart:convert';
import 'package:doctor/constants.dart';
import 'package:doctor/screens/details.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:doctor/screens/home.dart';

class doctors extends StatefulWidget {
  static String id = 'doctors';
  @override
  _doctorsState createState() => _doctorsState();
}

class _doctorsState extends State<doctors> {

  Future getDoctors() async{
    var url = 'http://10.0.2.2/doctor/display_doctor.php';
    var response = await http.get(url);
    return json.decode(response.body);
  }

  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.of(context).size.height;
    final double appBarHeight = AppBar().preferredSize.height;
    final double statusBarHeight = MediaQuery.of(context).padding.top;
    return Scaffold(
      appBar: AppBar(
        backgroundColor:kMainColor,
        title: Text(
          'الأطباء',
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
      body:FutureBuilder(
        future: getDoctors(),
        builder: (context, snapshot) {
          if (snapshot.hasError) print(snapshot.error);
          try {
            if(snapshot.data.length > 0 ){
              return snapshot.hasData ?
              ListView.builder(
                  itemCount: snapshot.data.length,
                  itemBuilder: (context, index) {
                    List list = snapshot.data;
                    return Container(
                      height: screenHeight * .18,
                      child: GestureDetector(
                        onTap:(){
                          Navigator.push(context, MaterialPageRoute(builder: (context) => details(list: list,index: index,),),);
                        },
                        child: Card(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20)
                          ),
                          elevation: 8,
                          child:Row(
                              //mainAxisAlignment:MainAxisAlignment.start ,
                              children: <Widget>[
                                ClipRRect(
                                  borderRadius: new BorderRadius.only(
                                    topLeft: const Radius.circular(20),
                                    bottomLeft: const Radius.circular(20),
                                  ),
                                  child:Image.network(list[index]['image'],
                                    height: MediaQuery.of(context).size.height * 0.3,
                                    fit: BoxFit.contain,
                                  ),
                                ),
                                Padding(padding: const EdgeInsets.only(left:10)),
                                Padding(
                                  padding: const EdgeInsets.only(right: 8),
                                  child: Text(
                                    list[index]['name'],
                                    style: TextStyle(color: Colors.black),
                                  ),
                                ),
                              ],
                            ),
                        ),
                      ),
                    );
                  })
                  : new Center(
                child: new CircularProgressIndicator(),
              );
            }else{
              return Container(
                height: screenHeight -
                    (screenHeight * .08) -
                    appBarHeight -
                    statusBarHeight,
                child: Center(
                  child: Text('لايوجد',
                    style: TextStyle(
                        fontSize: 30
                    ),
                  ),
                ),
              );
            }
          }catch(e){
            return new Center(
              child: new CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}


import 'dart:async';
import 'dart:convert';

import 'package:doctor/constants.dart';
import 'package:doctor/widgets/FadeAnimation.dart';
import 'package:doctor/widgets/customTextView.dart';
import 'package:doctor/widgets/searchDialog.dart';
import 'package:flutter/material.dart';
import 'package:doctor/screens/home.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'package:fluttertoast/fluttertoast.dart';
import 'package:intl/intl.dart';

class date extends StatefulWidget {
  static String id = 'date';
  @override
  _dateState createState() => _dateState();
}

class _dateState extends State<date> {

  //String name, location,phone,symptoms,psymtoms,cure;
  TextEditingController bloodgroub=new TextEditingController();
  TextEditingController name=new TextEditingController();
  TextEditingController location=new TextEditingController();
  TextEditingController phone=new TextEditingController();
  TextEditingController symptoms=new TextEditingController();

  final GlobalKey<FormState> _globalKey = GlobalKey<FormState>();

  int _state=0;

  DateTime currentdate=new DateTime.now();
  String formatdate;

  Future dateNow() async{
    var url = "http://10.0.2.2/doctor/date.php";
    var response=await http.post(url, body: {
      "name"      : name.text,
      "location"  : location.text,
      "bloodgroup": bloodgroub.text,
      "phone"     :phone.text,
      "symptoms"  : symptoms.text,
      "mydate"    : formatdate,
    });
    json.decode(response.body);
  }

  @override
  Widget build(BuildContext context) {
    formatdate=new DateFormat('yyyy.MMMMM.dd hh:mm:ss aaa').format(currentdate);
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        backgroundColor:kMainColor,
        title: Text(
          'أحجز موعد',
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
      body: Form(
        key: _globalKey,
        child: ListView(
          children: <Widget>[
            SizedBox(
              height:20,
            ),
            Padding(
              padding: const EdgeInsets.only(right: 5,left: 5),
              child: Text(
                'التسجيل في خدمات مستشفتي عبر الانترنت من خلال ملء البيانات المطلوبه',
                style: TextStyle(
                    color: Colors.black,
                  fontSize: 18
                ),
              ),
            ),
            SizedBox(
              height:20,
            ),
            CustomTextField(
              controller: name,
              onClick: (value) {
                name.text=value;
              },
              hint: 'اسم المريض/المريضه',
            ),
            SizedBox(
              height: height * .02,
            ),
            CustomTextField(
                controller:location,
              onClick: (value) {
                location.text=value;
              },
              hint: 'عنوان السكن',
            ),
            SizedBox(
              height: height * .02,
            ),
            CustomTextField(
              myfun: (){
                locationDialog();
              },
              controller:bloodgroub,
              onClick: (value) {
                bloodgroub.text=value;
              },
              hint: 'فصيله الدم',
            ),
            SizedBox(
              height: height * .02,
            ),
            CustomTextField(
                controller:phone,
              onClick: (value) {
                phone.text=value;
              },
              hint: 'رقم الهاتف',
            ),
            SizedBox(
              height: height * .02,
            ),
            CustomTextField(
              controller:symptoms,
              onClick: (value) {
                symptoms.text=value;
              },
              hint: 'الاعراض',
            ),
            SizedBox(
              height: height * .05,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: Builder(
                builder: (context) => FlatButton(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20)),
                  onPressed: (){
                    if (_state == 0) {
                      animateButton();
                    }
                    if (_globalKey.currentState.validate()){
                      _globalKey.currentState.save();
                      try{
                        dateNow();
                        setState(() {
                          Fluttertoast.showToast(
                              msg: "تم الحجز",
                              toastLength: Toast.LENGTH_SHORT,
                              gravity: ToastGravity.CENTER,
                              timeInSecForIosWeb: 1,
                              backgroundColor: Colors.black,
                              textColor: Colors.white,
                              fontSize: 16.0
                          );
                          Navigator.popAndPushNamed(context, home.id);
                        });
                      }on PlatformException catch(e){

                      }
                    }else{
                      setState(() {
                        _state = 0;
                      });
                    }
                  },
                  color: kMainColor,
                  child: Padding(
                    padding: const EdgeInsets.all(15),
                    child: setUpButtonChild(),
                  ),
                ),
              ),
            ),
//            GestureDetector(
//              onTap:(){
//
//              },
//              child: FadeAnimation(2, Container(
//                height: 50,
//                decoration: BoxDecoration(
//                    borderRadius: BorderRadius.circular(10),
//                    gradient: LinearGradient(
//                        colors: [
//                          Color.fromRGBO(143, 148, 251, 1),
//                          Color.fromRGBO(143, 148, 251, .6),
//                        ]
//                    )
//                ),
//                child: Center(
//                  child: setUpButtonChild(),
//                ),
//              )),
//            ),
          ],
        ),
      ),
    );
  }
  locationDialog(){
    showDialog(context: context,
        builder: (BuildContext context){
          return AlertDialog(
            title: Text("اختر فصيله الدم"),
            content:MyDialog(mlocation: bloodgroub,),
          );
        }
    );
  }
  Widget setUpButtonChild() {
    if (_state == 0) {
      return new Text(
        'حجز',
        style: TextStyle(fontSize: 20,color: Colors.white, fontWeight: FontWeight.bold),
      );
    } else if (_state == 1) {
      return CircularProgressIndicator(
        valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
      );
    }
  }

  void animateButton() {
    setState(() {
      _state = 1;
    });

    Timer(Duration(milliseconds: 3300), () {
      setState(() {
        _state = 2;
      });
    });
  }
}

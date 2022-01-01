
import 'dart:async';
import 'dart:convert';

import 'package:doctor/constants.dart';
import 'package:doctor/widgets/customTextView.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'package:fluttertoast/fluttertoast.dart';
import 'package:doctor/screens/login.dart';

class register extends StatefulWidget {
  static String id = 'register';
  @override
  _registerState createState() => _registerState();
}

class _registerState extends State<register> {

  final GlobalKey<FormState> _globalKey = GlobalKey<FormState>();

  String _username, _password,_phone;

  int _state=0;

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;

    Future register() async {
      var url = "http://10.0.2.2/doctor/register.php";
      var response = await http.post(url, body: {
        "username": _username.trim(),
        "password": _password.trim(),
        "phone": _phone.trim(),
      });
      var data = json.decode(response.body);
      if (data == "Error") {
        Fluttertoast.showToast(
            msg: "الحساب موجود",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.CENTER,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.red,
            textColor: Colors.white,
            fontSize: 16.0
        );
      } else {
        Fluttertoast.showToast(
            msg: "تم الحفظ بنجاح",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.CENTER,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.red,
            textColor: Colors.white,
            fontSize: 16.0
        );
        setState(() {
          Navigator.popAndPushNamed(context, login.id);
        });
      }
      setState(() {
        _state = 0;
      });
      print(_username);
      print(_password);
      print(_phone);
    }

    return Scaffold(
      backgroundColor: kMainColor,
      appBar:AppBar(
        backgroundColor:Colors.transparent,
        elevation: 0,
        title: Text(
          'انشاء الحساب',
          style: TextStyle(
              color: Colors.white
          ),
        ),
        leading: GestureDetector(
          onTap: () {
            Navigator.popAndPushNamed(context, login.id);
          },
          child: Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
        ),
      ),
      body:Form(
        key: _globalKey,
        child: ListView(
          children: <Widget>[
            SizedBox(
              height: height * .2,
            ),
            CustomTextField(
              onClick: (value) {
                _username=value;
              },
              icon: Icons.perm_identity,
              hint: 'الاسم',
            ),
            SizedBox(
              height: height * .02,
            ),
            CustomTextField(
              onClick: (value) {
                _password = value;
              },
              hint: 'كلمه المرور',
              icon: Icons.lock,
            ),
            SizedBox(
              height: height * .02,
            ),
            CustomTextField(
              onClick: (value) {
                _phone=value;
              },
              icon: Icons.phone,
              hint: 'الهاتف',
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
                        register();
                      }on PlatformException catch(e){

                      }
                    }else{
                      setState(() {
                        _state = 0;
                      });
                    }
                  },
                  color: Colors.white,
                  child: Padding(
                    padding: const EdgeInsets.all(15),
                    child: setUpButtonChild(),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: height * .05,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                GestureDetector(
                  onTap: () {
                    Navigator.popAndPushNamed(context, login.id);
                  },
                  child: Text(
                    'تسجيل دخول   ',
                    style: TextStyle(fontSize: 16,color: Colors.black),
                  ),
                ),
                Text(
                  'لديك حساب ؟',
                  style: TextStyle(color: Colors.white, fontSize: 16),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
  Widget setUpButtonChild() {
    if (_state == 0) {
      return new Text("انشاء حساب", style: TextStyle(color: Colors.black,fontSize:20 , fontWeight: FontWeight.bold),);
    } else if (_state == 1) {
      return CircularProgressIndicator(
        valueColor: AlwaysStoppedAnimation<Color>(Colors.black),
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


import 'dart:convert';

import 'package:doctor/widgets/FadeAnimation.dart';
import 'package:doctor/constants.dart';
import 'package:doctor/screens/register.dart';
import 'package:flutter/material.dart';
import 'package:doctor/screens/home.dart';
import 'package:flutter/services.dart';
import 'package:doctor/screens/profile.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class DataInfo {
  //Constructor
  String id;
  String username;
  String password;
  String phone;

  DataInfo.fromJson(Map json) {
    this.id       = json['id'];
    this.username = json['username'];
    this.password = json['password'];
    this.phone    = json['phone'];
  }
}

class login extends StatefulWidget {
  static String id = 'LoginScreen';
  @override
  _loginState createState() => _loginState();
}

class _loginState extends State<login> {

  TextEditingController user = TextEditingController();
  TextEditingController pass = TextEditingController();

  final GlobalKey<FormState> _globalKey = GlobalKey<FormState>();
  int _state=0;
  bool keepMeLoggedIn = false;

  Future login() async {
    var url = "http://10.0.2.2/doctor/login.php";
    try {
      var response = await http.post(url, body: {
        "username": user.text.trim(),
        "password": pass.text.trim(),
      });
      var data = json.decode(response.body);
      String success = data['success'];
      if (success == "1") {
        setState(() {
          final items = (data['login'] as List).map((i) => new DataInfo.fromJson(i));
          for (final item in items) {
            savePref(item.username, item.password, item.phone, item.id);
          }
        });
        Navigator.popAndPushNamed(context, home.id);
      } else {
        Fluttertoast.showToast(
            msg: "هنالك خطاء ما",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.CENTER,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.red,
            textColor: Colors.white,
            fontSize: 16.0
        );
      }
    }catch(e){
      setState(() {
        _state = 0;
      });
      errorDialog();
    }
  }

  errorDialog(){
    showDialog(context: context,
        builder: (context){
          return AlertDialog(
            content: Text('اسم المستخدم او كلمه المرور خطاء'),
            actions: <Widget>[
              FlatButton(
                  onPressed: (){
                    Navigator.of(context).pop();
                  },
                  child: Text("حسنا")
              ),
            ],
          );
        }
    );
  }
  savePref(String name,String password,String phone,String id) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    setState(() {
      preferences.setString("name", name);
      preferences.setString("password", password);
      preferences.setString("phone", phone);
      preferences.setString("id", id);
      preferences.commit();
    });
  }

  bool _validate = false;
  bool _secureText = true;
  void showHide() {
    setState(() {
      _secureText = !_secureText;
    });
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Container(
            child: Column(
              children: <Widget>[
                Container(
                  height: 400,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage('assets/images/background.png'),
                          fit: BoxFit.fill
                      )
                  ),
                  child: Stack(
                    children: <Widget>[
                      Positioned(
                        left: 30,
                        width: 80,
                        height: 200,
                        child: FadeAnimation(1, Container(
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: AssetImage('assets/images/light-1.png')
                              )
                          ),
                        )),
                      ),
                      Positioned(
                        left: 140,
                        width: 80,
                        height: 150,
                        child: FadeAnimation(1.3, Container(
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: AssetImage('assets/images/light-2.png')
                              )
                          ),
                        )),
                      ),
                      Positioned(
                        right: 40,
                        top: 40,
                        width: 80,
                        height: 150,
                        child: FadeAnimation(1.5, Container(
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: AssetImage('assets/images/clock.png')
                              )
                          ),
                        )),
                      ),
                      Positioned(
                        child: FadeAnimation(1.6, Container(
                          margin: EdgeInsets.only(top: 50),
                          child: Center(
                            child: Text("تسجيل الدخول", style: TextStyle(color: Colors.white, fontSize: 40, fontWeight: FontWeight.bold),),
                          ),
                        )),
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(30.0),
                  child: Column(
                    children: <Widget>[
                      FadeAnimation(1.8,
                          Card(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20)
                            ),
                            elevation: 9,
                            child: Container(
                        padding: EdgeInsets.all(5),
                        decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10),
                              boxShadow: [
                                BoxShadow(
                                    color: Color.fromRGBO(143, 148, 251, .2),
                                    blurRadius: 20.0,
                                    offset: Offset(0, 10)
                                )
                              ]
                        ),
                        child: Column(
                            children: <Widget>[
                              Container(
                                padding: EdgeInsets.all(8.0),
                                decoration: BoxDecoration(
                                    border: Border(bottom: BorderSide(color: Colors.grey[100]))
                                ),
                                child: TextField(
                                  decoration: InputDecoration(
                                      border: InputBorder.none,
                                      hintText: "أسم المستخدم",
                                      prefixIcon: Icon(Icons.person),
                                      hintStyle: TextStyle(color: Colors.grey[400]),
                                    errorText: _validate ? 'الرجاء ادخال اسم المستخدم ' : null,
                                  ),
                                  controller: user,
                                ),
                              ),
                              Container(
                                padding: EdgeInsets.all(8.0),
                                child: TextField(
                                  obscureText: _secureText,
                                  decoration: InputDecoration(
                                      border: InputBorder.none,
                                      hintText: "كلمه المرور",
                                      hintStyle: TextStyle(color: Colors.grey[400]),
                                    errorText: _validate ? 'الرجاء ادخال كلمه المرور' : null,
                                    prefixIcon: Icon(Icons.lock),
                                    suffixIcon: IconButton(
                                      onPressed: showHide,
                                      icon: Icon(_secureText
                                          ? Icons.visibility_off
                                          : Icons.visibility),
                                    ),
                                  ),
                                  controller: pass,
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(left: 20),
                                child: Row(
                                  children: <Widget>[
                                    Theme(
                                      data: ThemeData(unselectedWidgetColor: Colors.black),
                                      child: Checkbox(
                                        checkColor: Colors.white,
                                        activeColor: Color.fromRGBO(143, 148, 251, 1),
                                        value: keepMeLoggedIn,
                                        onChanged: (value) {
                                          setState(() {
                                            keepMeLoggedIn = value;
                                          });
                                        },
                                      ),
                                    ),
                                    Text(
                                      'تذكرني ',
                                      style: TextStyle(color: Colors.black),
                                    )
                                  ],
                                ),
                              ),
                            ],
                        ),
                      ),
                          )),
                      SizedBox(height: 30,),
                      GestureDetector(
                        onTap:(){
                          //Navigator.popAndPushNamed(context, home.id);
                          if (_state == 0) {
                            animateButton();
                          }
                          if (keepMeLoggedIn == true) {
                            keepUserLoggedIn();
                          }
                          login();
                            setState(() {
                              _state = 0;
                            });
                        },
                        child: FadeAnimation(2,
                            Card(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20)
                              ),
                              elevation: 9,
                              child: Container(
                          height: 50,
                          decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                gradient: LinearGradient(
                                    colors: [
                                      Color.fromRGBO(143, 148, 251, 1),
                                      Color.fromRGBO(143, 148, 251, .6),
                                    ]
                                )
                          ),
                          child: Center(
                              child: setUpButtonChild(),
                          ),
                        ),
                            )),
                      ),
                      SizedBox(
                        height: height * .05,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          GestureDetector(
                            onTap: () {
                              Navigator.popAndPushNamed(context, register.id);
                            },
                            child: Text(
                              'انشاء حساب   ',
                              style: TextStyle(fontSize: 16,color: Color.fromRGBO(143, 148, 251, 1), fontWeight: FontWeight.bold),
                            ),
                          ),
                          Text(
                            'ليس لديك حساب ؟',
                            style: TextStyle(color: Colors.black, fontSize: 16),
                          ),
                        ],
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        )
    );
  }
  void keepUserLoggedIn() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.setBool(kKeepMeLoggedIn, keepMeLoggedIn);
  }
  Widget setUpButtonChild() {
    if (_state == 0) {
      return new Text("تسجيل دخول", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),);
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
  }
}

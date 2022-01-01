
import 'dart:convert';

import 'package:doctor/constants.dart';
import 'package:doctor/widgets/customTextView.dart';
import 'package:flutter/material.dart';
import 'package:doctor/screens/login.dart';
import 'package:doctor/screens/home.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:fluttertoast/fluttertoast.dart';

class profile extends StatefulWidget {
  static String id = 'profile';
  @override
  _profileState createState() => _profileState();
}

class _profileState extends State<profile> {

  int _statedit=0;
  int _statedelete=0;
  String id;

  final GlobalKey<FormState> _globalKey = GlobalKey<FormState>();
  TextEditingController _username=new TextEditingController();
  TextEditingController _password=new TextEditingController();
  TextEditingController _phone   =new TextEditingController();


  SharedPreferences preferences;

  Future getProfile() async{
    preferences = await SharedPreferences.getInstance();
    setState(() {
      _username.text=preferences.getString("name");
      _password.text=preferences.getString("password") ;
      _phone.text=preferences.getString("phone") ;
      id=preferences.getString("id");
    });
    print(id);
  }

  Future editProfile() async {
    preferences = await SharedPreferences.getInstance();
    setState(() {
      //print(preferences.getString("id"));
    });
    var url = "http://10.0.2.2/doctor/edit_profile.php";
    var response = await http.post(url, body: {
      "username": _username.text,
      "password": _password.text,
      "phone"   : _phone.text,
      "id"      : preferences.getString("id"),
    });
    var data = json.decode(response.body);
    String success = data['success'];
    if (success == "1") {
      Fluttertoast.showToast(
          msg: "تم تعديل الملف الشخصي",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0
      );
      setState(() {
        Navigator.popAndPushNamed(context, home.id);
      });
    } else {
      Fluttertoast.showToast(
          msg: "هنالك خطاء ما ",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0
      );
    }
  }

  Future deleteProfile() async{
    preferences = await SharedPreferences.getInstance();
    setState(() {
      //print(preferences.getString("id"));
    });
    var url = "http://10.0.2.2/doctor/delete_profile.php";
    http.post(url,body: {
      'id' : id,
    });
    setState(() {
      Fluttertoast.showToast(
          msg: "تم حذف الملف الشخصي",
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
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getProfile();
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
        backgroundColor: kMainColor,
        appBar:AppBar(
          backgroundColor:Colors.transparent,
          elevation: 0,
          title: Text(
            'الصفحه الشخصيه',
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
      body:Form(
        key: _globalKey,
        child: ListView(
          children: <Widget>[
            SizedBox(
              height: height * .1,
            ),
            CustomTextField(
              controller:_username,
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
              controller:_password,
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
              controller:_phone,
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
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                    color: Colors.white,
                    child: Padding(
                      padding: const EdgeInsets.all(15),
                      child: editPro(),
                    ),
                    onPressed: (){
                      if (_statedit == 0) {
                        animateButtonedit();
                      }
                      editProfile();
                    }
                ),
              ),
            ),
            SizedBox(
              height: height * .02,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: Builder(
                builder: (context) => FlatButton(
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                    color: Colors.white,
                    child: Padding(
                      padding: const EdgeInsets.all(15),
                      child: deletePro(),
                    ),
                    onPressed: (){
                      _showDialog();
                    }
                ),
              ),
            ),
          ],
        ),
      ) ,
    );
  }
  _showDialog(){
    showDialog(context: context,
        builder: (context){
          return AlertDialog(
            title:Text("هل تود حذف حسابك"),
            actions: <Widget>[
              FlatButton(
                  onPressed: (){
                    if (_statedelete == 0) {
                      animateButtondelite();
                    }
                    deleteProfile();
                    Navigator.of(context).pop();

                  },
                  child: Text("نعم")
              ),
              FlatButton(
                  onPressed: (){
                    Navigator.of(context).pop();
                  },
                  child: Text("لا")
              ),
            ],
          );
        }
    );
  }
  Widget editPro() {
    if (_statedit == 0) {
      return new Text(
        'تعديل الملف الشخصي',
        style: TextStyle(color: Colors.black,fontSize: 18),
      );
    } else if (_statedit == 1) {
      return CircularProgressIndicator(
        valueColor: AlwaysStoppedAnimation<Color>(Colors.black),
      );
    }
  }
  Widget deletePro() {
    if (_statedelete == 0) {
      return new Text(
        'حذف الملف الشخصي',
        style: TextStyle(color: Colors.black,fontSize: 18),
      );
    } else if (_statedelete == 1) {
      return CircularProgressIndicator(
        valueColor: AlwaysStoppedAnimation<Color>(Colors.black),
      );
    }
  }
  void animateButtonedit() {
    setState(() {
      _statedit = 1;
    });
  }
  void animateButtondelite() {
    setState(() {
      _statedelete = 1;
    });
  }
}

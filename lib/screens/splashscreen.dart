
import 'dart:async';
import 'package:doctor/screens/home.dart';
import 'package:flutter/material.dart';
import 'package:connectivity/connectivity.dart';

class SplashScreen extends StatefulWidget {
  static String id='splashscreen';
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _SplashScreenState();
  }
}

class _SplashScreenState extends State<SplashScreen> {

  var wifiBSSID;
  var wifiIP;
  var wifiName;
  bool iswificonnected = false;
  bool isInternetOn = true;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    startTimer();
    getConnect();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(143, 148, 251, 1),
      body:showText(),
    );
  }

  showText(){
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 50, 20, 20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Center(
            child: Container(
              height: MediaQuery.of(context).size.height * .4,
              child: Stack(
                alignment: Alignment.center,
                children: <Widget>[
                  Positioned(
                    bottom: 0,
                    child: Text(
                      'مستشفتي',
                      style: TextStyle(fontFamily: 'Pacifico', fontSize: 25,color: Colors.white),
                    ),
                  )
                ],
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              SizedBox(
                child:CircularProgressIndicator(),
                height: 20,
                width: 20,
              ),
              SizedBox(
                width: 5,
              ),
              Container(
                child: Text("...جاري الاتصال",style: TextStyle(color: Colors.white),),
              ),
            ],
          )
        ],
      ),
    );
  }

  void startTimer() {
    Timer(Duration(seconds: 5), () {
      //navigateUser();// It will redirect  after 3 seconds
      //Navigator.popAndPushNamed(context, home.id);
      Navigator.push(context, MaterialPageRoute(builder: (context)=>home(),),);
    });
  }

  _showDialog(){
    showDialog(context: context,
        builder: (context){
          return AlertDialog(
            title: Text("فشل الاتصال"),
            content: Text("تأكد من ان جهازك متصل بالانترنت"),
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

  void getConnect() async {
    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.none) {
      setState(() {
        _showDialog();
      });
    } else if (connectivityResult == ConnectivityResult.mobile) {
      //iswificonnected = false;
    } else if (connectivityResult == ConnectivityResult.wifi) {

      /*iswificonnected = true;
      setState(() async {
        wifiBSSID = await (Connectivity().getWifiBSSID());
        wifiIP = await (Connectivity().getWifiIP());
        wifiName = await (Connectivity().getWifiName());
      });*/
    }
  }
}